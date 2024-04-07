#include "relation.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "parser.tab.h"

enum attribute_modifier {
  empty_modifier,
  primary_key_modifier,
  foreign_key_modifier,
};

/* ???: typedef char attribute_id[5]; */

struct shallow_attribute {
  char *name;
  unsigned id;
  enum attribute_modifier modifier;
};

struct table {
  char *name;
  char *address;
  unsigned record_count;
  unsigned attribute_count;
  struct shallow_attribute *attributes;
};

struct unnamed_attribute {
  unsigned id;
  struct attribute_type type;
};

struct table_node {
    struct table data;
    struct table_node *next;
};

struct table_type {
    unsigned name;
    unsigned size;
    unsigned attribute_count;
    struct unnamed_attribute *attributes;
    unsigned table_count;
    struct table_node *tables;
};

struct table_type_list {
  struct table_type head;
  struct table_type_list *tail;
};

struct table_type_list *table_type_list = NULL;

void printTableTypeNode(struct table_type_list *list){
    printf("========Table Type========:\n");
    //printf("Name: %u\n", list->head.name);
    //printf("Size: %u\n", list->head.size);
    printf("Attribute Count: %u\n", list->head.attribute_count);

    // Print attributes
    printf("Attributes:\n");
    for (unsigned i = 0; i < list->head.attribute_count; ++i) {
        printf("Attribute %u:\n", i + 1);
        printf("  ID: %u\n", list->head.attributes[i].id);
        printf("  Type: %u\n", list->head.attributes[i].type.meta_type);
        printf("  Size: %u\n", list->head.attributes[i].type.size);
    }

    printf("Table Count: %u\n", list->head.table_count);

    // Print tables
    printf("    Tables:\n");
    struct table_node *current_table = list->head.tables;
    while (current_table != NULL) {
        printf("    Table:\n");
        printf("      Name: %s\n", current_table->data.name);
        printf("      Address: %s\n", current_table->data.address);
        printf("      Record Count: %u\n", current_table->data.record_count);
        printf("      Attribute Count: %u\n", current_table->data.attribute_count);

        printf("      Table Attributes:\n");
        for (unsigned i = 0; i < current_table->data.attribute_count; ++i) {
            printf("        Attribute %u:\n", i + 1);
            printf("          ID: %u\n", current_table->data.attributes[i].id);
            printf("          Name: %s\n", current_table->data.attributes[i].name);
        }

        current_table = current_table->next;
    } 
    printf("\n");
}

void printTableTypeList(struct table_type_list *list) {
    while (list != NULL) {
        printTableTypeNode(list);
        list = list->tail;
    }
    printf("\n");
    printf("\n");
}

void addTableToType(struct table_type *type, struct table *newTable) { //SAVE_R
    struct table_node *newNode = malloc(sizeof(struct table_node));
    if (newNode == NULL) {
        fprintf(stderr, "Failed to allocate memory for new table node\n");
        exit(EXIT_FAILURE);
    }

    newNode->data = *newTable;
    newNode->next = NULL;

    if (type->tables == NULL) {
        type->tables = newNode;
    } else {
        struct table_node *current = type->tables;
        while (current->next != NULL) {
            current = current->next;
        }
        current->next = newNode;
    }

    type->table_count++;
}

void deleteTableFromType(struct table_type_list *list_element_to_delete){ //DELETE_R
    struct table_type_list *previous_list = table_type_list;
    struct table_type_list *current_list = table_type_list;
    while (current_list != list_element_to_delete){
        // printf("In cycle");
        previous_list = current_list;
        current_list = current_list->tail;
    }   
    if (previous_list == current_list){
        // printf("previous == current");
        table_type_list = current_list->tail;
    }
    else{
        // printf("previous != current");
        previous_list->tail = current_list->tail;
    }

    current_list->tail = NULL;
}
   
int main(void) {
    struct relation_list *relation_list;

    if (yyparse(&relation_list)) {
        return EXIT_FAILURE;
    }


    for (struct relation_list *relation_iterator = relation_list;
         relation_iterator; relation_iterator = relation_iterator->tail) {
        struct relation *relation = &relation_iterator->head;
        struct table_type_list *current_list = table_type_list;
        struct table_type *existing_type = NULL;

        //attribute_count
        unsigned attribute_count = 0;
        for (struct attribute_list *attribute_iterator = relation->attribute_list;
             attribute_iterator;
             attribute_iterator = attribute_iterator->tail) {
            ++attribute_count;
        }

        // Check if a similar table_type already exists
        while (current_list != NULL) {
            struct table_type *current_type = &current_list->head;
            if (current_type->attribute_count == attribute_count) {
                int attributes_match = 1;
                struct attribute_list *attribute_iterator = relation->attribute_list;
                for (unsigned i = 0; i < attribute_count; ++i) {
                    // Debug prints
                    //printf("Attribute Meta-Type: %u, Size: %u\n", current_type->attributes[i].type.meta_type, current_type->attributes[i].type.size);
                    //printf("Relation Attribute Meta-Type: %u, Size: %u\n", attribute_iterator->head.type.meta_type, attribute_iterator->head.type.size);
                    if (current_type->attributes[i].type.meta_type != attribute_iterator->head.type.meta_type ||
                        ((current_type->attributes[i].type.size != attribute_iterator->head.type.size) && current_type->attributes[i].type.meta_type != 0)) {
                        //printf("Attributes dont match\n");
                        attributes_match = 0;
                        break;
                    }
                    attribute_iterator = attribute_iterator->tail;
                }
                if (attributes_match) {
                    existing_type = current_type;
                    break;
                }
            }
            current_list = current_list->tail;
        }
        // Create a new table_type if not found
        if (existing_type == NULL) {
            struct table_type_list *new_table_type_list =
                calloc(1, sizeof(struct table_type_list));
            struct table_type *table_type = &new_table_type_list->head;

            table_type->table_count = 0;
            table_type->tables = NULL;
            table_type->attribute_count = attribute_count; 
            table_type->attributes =
                calloc(attribute_count, sizeof(struct unnamed_attribute));

            unsigned i = 0;

            for (struct attribute_list *attribute_iterator = relation->attribute_list;
                 attribute_iterator;
                 attribute_iterator = attribute_iterator->tail, ++i) {
                table_type->attributes[i].id = i;
                table_type->attributes[i].type = attribute_iterator->head.type;

                // Calculate size based on attribute type
                switch (attribute_iterator->head.type.meta_type) {
                    case meta_integer:
                        table_type->attributes[i].type.size = sizeof(int);
                        break;
                    case meta_float:
                        table_type->attributes[i].type.size = sizeof(float);
                        break;
                    case meta_double:
                        table_type->attributes[i].type.size = sizeof(double);
                        break;
                    case meta_char:
                        table_type->attributes[i].type.size = sizeof(char) * attribute_iterator->head.type.size;
                        break;
                    default:
                        fprintf(stderr, "Unknown attribute type\n");
                        exit(EXIT_FAILURE);
                }
            }

            // Create a new table
            struct table new_table;
            new_table.name = strdup(relation->name);
            new_table.address = strdup(relation->name);
            new_table.record_count = 0; 
            new_table.attribute_count = attribute_count;
            new_table.attributes =
                calloc(attribute_count, sizeof(struct shallow_attribute));

            i = 0;

            for (struct attribute_list *attribute_iterator = relation->attribute_list;
                 attribute_iterator;
                 attribute_iterator = attribute_iterator->tail, ++i) {
                new_table.attributes[i].id = i;
                new_table.attributes[i].name = strdup(attribute_iterator->head.name);
            }

            addTableToType(table_type, &new_table);

            new_table_type_list->tail = table_type_list;
            table_type_list = new_table_type_list;
        } else {
            // Add the new table to the existing table_type
            struct table new_table;
            new_table.name = strdup(relation->name);
            new_table.address = strdup(relation->name);
            new_table.record_count = 0; 
            new_table.attribute_count = attribute_count;
            new_table.attributes =
                calloc(attribute_count, sizeof(struct shallow_attribute));

            unsigned i = 0;
            struct attribute_list *attribute_iterator = relation->attribute_list;
            for (; i < attribute_count; ++i) {
                new_table.attributes[i].id = i;
                new_table.attributes[i].name = strdup(attribute_iterator->head.name);
                attribute_iterator = attribute_iterator->tail;
            }

            addTableToType(existing_type, &new_table);
        }

        

    }
    printf("\033[0;31m");
    printf("Original list:\n");
    printf("\033[0m"); 
    printTableTypeList(table_type_list);

    unsigned delete_index = 4;//Select an element with index
    struct table_type_list *current_list = table_type_list;
    for (unsigned i; i < delete_index-1; i++){
        if (current_list->tail == NULL) break;
        current_list = current_list->tail;
    }   
    printf("\033[0;31m");
    printf("Element to delete:\n");
    printf("\033[0m"); 
    printTableTypeNode(current_list);

    deleteTableFromType(current_list);

    printf("\033[0;31m");
    printf("Result list:\n");
    printf("\033[0m"); 
    printTableTypeList(table_type_list);


    return 0;
}

void yyerror(struct relation_list **relation_list, const char *message) {
  fprintf(stderr, "%s\n", message);
}