# ABOUT REPO

This is a hash table implementation in C with functions to _insert/update, search, create, get size,_ and _delete_ the hash table. It only operates on string keys and string values ONLY. It handles collisions using _open addressing with double hashing_ which is the most used technique for most production-level hash tables. The hash table is implemented using a _dynamic array_ so it can grow and shrink as needed based on the current load factor. Inspired by @jamesroutley's [implementation](https://github.com/jamesroutley/algorithms-and-data-structures/tree/master/hash-table). _I made drastic changes in some algorithms and fixed all memory bugs_.

No memory leaks or `OOB` writes are possible in this program ( _at least to the limit of my knowledge_ ), you can verify that with:

```sh
cd src && gcc -ggdb3 -fsanitize=address -o hash_table hash_table.c main.c prime.c xmalloc.c -lm
```

In short, this C program can be considered _memory-safe_.

## Requirements

- `gcc`
- Compatible with any operating system that supports `gcc`

## Hash Table C API

These are the functions provided by the hashmap as of now( all located in `src/hash_table.h` ):

```c
// custom types
typedef struct
{
    const char* key;
    const char* value;
} ht_item; // hash table entry -- represents a key-value pair
typedef struct
{
    size_t size;
    size_t base_size;
    size_t count;
    ht_item** items;
} ht_hash_table; // hash table structure -- represents the hash table

// function prototypes
ht_hash_table* ht_new(); // 'creates' new hash table
void ht_del_hash_table(ht_hash_table* t); // 'deletes' an existing hash table
void ht_insert(ht_hash_table* table, const char* k, const char* v); // 'inserts' a new key-value pair
void ht_delete(ht_hash_table* table, const char* k); // 'deletes' a key-value pair from the hash table
const char* ht_search(ht_hash_table* table, const char* k); // 'searches' for a key in the hash table
size_t ht_size(ht_hash_table* table); // get number of elements in hash table
```

## Usage

- Run the following command to compile the program:

```bash
./compile.sh
```

- Run the following command to execute the program:

```bash
./hash_table
```

This will run the driver program in `src/main.c` which demonstrates the usage of the hash table functions but it won't output anything to the console. You can modify the `main.c` file to test the hash table functions as you like. No output will indicate that the program ran successfully otherwise it will throw an error and exit.

## TODO

- Add support for multiple data types

## NOTE

This hashmap can be used in production-level code. It can be used as a good base to make another custom hash table.

For any issues or PRs you can always let me know.
