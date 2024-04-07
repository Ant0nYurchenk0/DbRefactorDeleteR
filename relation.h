enum attribute_meta_type {
  meta_integer,
  meta_float,
  meta_double,
  meta_char,
};

struct attribute_type {
  enum attribute_meta_type meta_type;
  unsigned size;
};

struct attribute {
  char *name;
  struct attribute_type type;
};

struct attribute_list {
  struct attribute head;
  struct attribute_list *tail;
};

struct relation {
  char *name;
  struct attribute_list *attribute_list;
};

struct relation_list {
  struct relation head;
  struct relation_list *tail;
};
