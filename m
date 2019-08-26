Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D7F99CE14
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 13:24:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730856AbfHZLYg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 07:24:36 -0400
Received: from gofer.mess.org ([88.97.38.141]:58761 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727253AbfHZLYf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 07:24:35 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 3A2A1604FD; Mon, 26 Aug 2019 12:24:34 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils 1/2] keytable: move keymap parsing into its own file
Date:   Mon, 26 Aug 2019 12:24:33 +0100
Message-Id: <20190826112434.12586-1-sean@mess.org>
X-Mailer: git-send-email 2.11.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We would like to reuse keymap parsing for transmitting IR based on keymap
in ir-ctl.

This also reduces the size of our huge keytable.c, and keeps knowledge
toml localised to the keymap parser.

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/keytable/Makefile.am    |   2 +-
 utils/keytable/bpf_load.c     |  21 +-
 utils/keytable/bpf_load.h     |   4 +-
 utils/keytable/keymap.c       | 459 ++++++++++++++++++++++++++++
 utils/keytable/keymap.h       |  26 ++
 utils/keytable/keytable.c     | 541 +++++++---------------------------
 utils/keytable/rc_keymap.5.in |   4 +-
 7 files changed, 607 insertions(+), 450 deletions(-)
 create mode 100644 utils/keytable/keymap.c

diff --git a/utils/keytable/Makefile.am b/utils/keytable/Makefile.am
index 18e6574e..58c94a47 100644
--- a/utils/keytable/Makefile.am
+++ b/utils/keytable/Makefile.am
@@ -4,7 +4,7 @@ sysconf_DATA = rc_maps.cfg
 keytablesystem_DATA = $(srcdir)/rc_keymaps/*
 udevrules_DATA = 70-infrared.rules
 
-ir_keytable_SOURCES = keytable.c parse.h ir-encode.c ir-encode.h toml.c toml.h keymap.h
+ir_keytable_SOURCES = keytable.c parse.h ir-encode.c ir-encode.h toml.c toml.h keymap.c keymap.h
 
 if WITH_BPF
 ir_keytable_SOURCES += bpf.c bpf_load.c bpf.h bpf_load.h
diff --git a/utils/keytable/bpf_load.c b/utils/keytable/bpf_load.c
index b6032ed1..e301aa97 100644
--- a/utils/keytable/bpf_load.c
+++ b/utils/keytable/bpf_load.c
@@ -13,7 +13,6 @@
 #include <stdlib.h>
 #include <linux/bpf.h>
 #include <assert.h>
-#include "toml.h"
 #include "keymap.h"
 #include "bpf.h"
 #include "bpf_load.h"
@@ -55,7 +54,7 @@ struct bpf_file {
 	Elf_Data *data;
 	int strtabidx;
 	Elf_Data *symbols;
-	struct toml_table_t *toml;
+	struct protocol_param *param;
 };
 
 static int load_and_attach(int lirc_fd, struct bpf_file *bpf_file, const char *name, struct bpf_insn *prog, int size)
@@ -271,23 +270,11 @@ static int parse_relo_and_apply(struct bpf_file *bpf_file, GElf_Shdr *shdr,
 			const char *raw = NULL;
 			int value = 0;
 
-			if (!bpf_param(sym_name, &value)) {
-				// done
-			} else if (bpf_file->toml &&
-				   (raw = toml_raw_in(bpf_file->toml, sym_name)) != NULL) {
-				int64_t val64;
-
-				if (toml_rtoi(raw, &val64)) {
-					printf(_("variable %s not a integer: %s\n"), sym_name, raw);
-					return 1;
-				}
-
+			if (!bpf_param(bpf_file->param, sym_name, &value)) {
 				if (value < INT_MIN && value > UINT_MAX) {
 					printf(_("variable %s out of range: %s\n"), sym_name, raw);
 					return 1;
 				}
-
-				value = val64;
 			} else if (sym.st_shndx == bpf_file->dataidx) {
 				// Value is not overridden on command line
 				// or toml file. For the raw decoder, the
@@ -436,10 +423,10 @@ static int load_elf_maps_section(struct bpf_file *bpf_file)
 	return nr_maps;
 }
 
-int load_bpf_file(const char *path, int lirc_fd, struct toml_table_t *toml,
+int load_bpf_file(const char *path, int lirc_fd, struct protocol_param *param,
 	          struct raw_entry *raw)
 {
-	struct bpf_file bpf_file = { .toml = toml };
+	struct bpf_file bpf_file = { .param = param };
 	int fd, i, ret;
 	Elf *elf;
 	GElf_Ehdr ehdr;
diff --git a/utils/keytable/bpf_load.h b/utils/keytable/bpf_load.h
index 4ec0a934..47b57b25 100644
--- a/utils/keytable/bpf_load.h
+++ b/utils/keytable/bpf_load.h
@@ -36,8 +36,8 @@ struct bpf_map_data {
  *
  * returns zero on success
  */
-int load_bpf_file(const char *path, int lirc_fd, struct toml_table_t *toml, struct raw_entry *raw);
+int load_bpf_file(const char *path, int lirc_fd, struct protocol_param *param, struct raw_entry *raw);
 
-int bpf_param(const char *name, int *val);
+int bpf_param(struct protocol_param *param, const char *name, int *val);
 
 #endif
diff --git a/utils/keytable/keymap.c b/utils/keytable/keymap.c
new file mode 100644
index 00000000..bb193131
--- /dev/null
+++ b/utils/keytable/keymap.c
@@ -0,0 +1,459 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+// Read a toml keymap or plain text keymap (ir-keytable 1.14 or earlier
+// format).
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <errno.h>
+#include <string.h>
+#include <limits.h>
+#include <stdbool.h>
+
+#include "keymap.h"
+#include "toml.h"
+
+#ifdef ENABLE_NLS
+# define _(string) gettext(string)
+# include "gettext.h"
+# include <locale.h>
+# include <langinfo.h>
+# include <iconv.h>
+#else
+# define _(string) string
+#endif
+
+void free_keymap(struct keymap *map)
+{
+	struct scancode_entry *se;
+	struct raw_entry *re;
+	struct protocol_param *param;
+	struct keymap *next;
+
+	while (map) {
+		re = map->raw;
+
+		while (re) {
+			struct raw_entry *next = re->next;
+			free(re->keycode);
+			free(re);
+			re = next;
+		}
+
+
+		se = map->scancode;
+
+		while (se) {
+			struct scancode_entry *next = se->next;
+			free(se->keycode);
+			free(se);
+			se = next;
+		}
+
+		param = map->param;
+
+		while (param) {
+			struct protocol_param *next = param->next;
+			free(param->name);
+			free(param);
+			param = next;
+		}
+
+		next = map->next;
+
+		free(map->name);
+		free(map->protocol);
+		free(map->variant);
+		free(map);
+
+		map = next;
+	}
+}
+
+static error_t parse_plain_keyfile(char *fname, struct keymap **keymap, bool verbose)
+{
+	FILE *fin;
+	int line = 0;
+	char *scancode, *keycode, s[2048];
+	struct scancode_entry *se;
+	struct keymap *map;
+
+	map = calloc(1, sizeof(*map));
+	if (!map) {
+		perror("parse_keyfile");
+		return ENOMEM;
+	}
+
+	if (verbose)
+		fprintf(stderr, _("Parsing %s keycode file as plain text\n"), fname);
+
+	fin = fopen(fname, "r");
+	if (!fin) {
+		return errno;
+	}
+
+	while (fgets(s, sizeof(s), fin)) {
+		char *p = s;
+
+		line++;
+		while (*p == ' ' || *p == '\t')
+			p++;
+		if (line==1 && p[0] == '#') {
+			p++;
+			p = strtok(p, "\n\t =:");
+			do {
+				if (!p)
+					goto err_einval;
+				if (!strcmp(p, "table")) {
+					p = strtok(NULL,"\n, ");
+					if (!p)
+						goto err_einval;
+					map->name = strdup(p);
+				} else if (!strcmp(p, "type")) {
+					p = strtok(NULL, " ,\n");
+					if (!p)
+						goto err_einval;
+
+					while (p) {
+						if (map->protocol) {
+							map->protocol = strdup(p);
+						} else {
+							struct keymap *k;
+
+							k = calloc(1, sizeof(k));
+							k->protocol = strdup(p);
+							k->next = map->next;
+							map->next = k;
+						}
+
+						p = strtok(NULL, " ,\n");
+					}
+				} else {
+					goto err_einval;
+				}
+				p = strtok(NULL, "\n\t =:");
+			} while (p);
+			continue;
+		}
+
+		if (*p == '\n' || *p == '#')
+			continue;
+
+		scancode = strtok(p, "\n\t =:");
+		if (!scancode)
+			goto err_einval;
+		if (!strcasecmp(scancode, "scancode")) {
+			scancode = strtok(NULL, "\n\t =:");
+			if (!scancode)
+				goto err_einval;
+		}
+
+		keycode = strtok(NULL, "\n\t =:(");
+		if (!keycode)
+			goto err_einval;
+
+		se = calloc(1, sizeof(*se));
+		if (!se) {
+			free_keymap(map);
+			perror("parse_keyfile");
+			fclose(fin);
+			return ENOMEM;
+		}
+
+		se->scancode = strtoul(scancode, NULL, 0);
+		se->keycode  = keycode;
+		se->next = map->scancode;
+		map->scancode = se;
+	}
+	fclose(fin);
+
+	*keymap = map;
+
+	return 0;
+
+err_einval:
+	free_keymap(map);
+	fprintf(stderr, _("Invalid parameter on line %d of %s\n"),
+		line, fname);
+	return EINVAL;
+}
+
+static error_t parse_toml_raw_part(const char *fname, struct toml_array_t *raw, struct keymap *map)
+{
+	struct toml_table_t *t;
+	struct toml_array_t *rawarray;
+	struct raw_entry *re;
+	const char *rkeycode;
+	int ind = 0, length;
+	char *keycode;
+
+	while ((t = toml_table_at(raw, ind++)) != NULL) {
+		rkeycode = toml_raw_in(t, "keycode");
+		if (!rkeycode) {
+			fprintf(stderr, _("%s: invalid keycode for raw entry %d\n"),
+				fname, ind);
+			return EINVAL;
+		}
+
+		if (toml_rtos(rkeycode, &keycode)) {
+			fprintf(stderr, _("%s: bad value `%s' for keycode\n"),
+				fname, rkeycode);
+			return EINVAL;
+		}
+
+		rawarray = toml_array_in(t, "raw");
+		if (!rawarray) {
+			fprintf(stderr, _("%s: missing raw array for entry %d\n"),
+				fname, ind);
+			return EINVAL;
+		}
+
+		// determine length of array
+		length = 0;
+		while (toml_raw_at(rawarray, length) != NULL)
+			length++;
+
+		if (!(length % 2)) {
+			fprintf(stderr, _("%s: raw array must have odd length rather than %d\n"),
+				fname, length);
+			return EINVAL;
+		}
+
+		re = calloc(1, sizeof(*re) + sizeof(re->raw[0]) * length);
+		if (!re) {
+			fprintf(stderr, _("Failed to allocate memory"));
+			return EINVAL;
+		}
+
+		for (int i=0; i<length; i++) {
+			const char *s = toml_raw_at(rawarray, i);
+			int64_t v;
+
+			if (toml_rtoi(s, &v) || v == 0) {
+				fprintf(stderr, _("%s: incorrect raw value `%s'"),
+					fname, s);
+				return EINVAL;
+			}
+
+			if (v <= 0 || v > USHRT_MAX) {
+				fprintf(stderr, _("%s: raw value %ld out of range"),
+					fname, v);
+				return EINVAL;
+			}
+
+			re->raw[i] = v;
+		}
+
+		re->raw_length = length;
+		re->keycode = keycode;
+		re->next = map->raw;
+		map->raw = re;
+	}
+
+	return 0;
+}
+
+
+static error_t parse_toml_protocol(const char *fname, struct toml_table_t *proot, struct keymap **keymap, bool verbose)
+{
+	struct toml_table_t *scancodes;
+	struct toml_array_t *rawarray;
+	const char *raw, *key;
+	bool have_raw_protocol = false;
+	struct keymap *map;
+	char *p;
+	int i = 0;
+
+	map = calloc(1, sizeof(*map));
+	if (!map) {
+		perror("parse_toml_protocol");
+		return ENOMEM;
+	}
+	*keymap = map;
+
+	raw = toml_raw_in(proot, "protocol");
+	if (!raw) {
+		fprintf(stderr, _("%s: protocol missing\n"), fname);
+		return EINVAL;
+	}
+
+	if (toml_rtos(raw, &p)) {
+		fprintf(stderr, _("%s: bad value `%s' for protocol\n"), fname, raw);
+		return EINVAL;
+	}
+
+	map->protocol = strdup(p);
+	if (!strcmp(p, "raw"))
+		have_raw_protocol = true;
+
+	raw = toml_raw_in(proot, "variant");
+	if (raw) {
+		if (toml_rtos(raw, &p)) {
+			fprintf(stderr, _("%s: bad value `%s' for variant\n"), fname, raw);
+			return EINVAL;
+		}
+
+		map->variant = strdup(p);
+	}
+
+	raw = toml_raw_in(proot, "name");
+	if (raw) {
+		if (toml_rtos(raw, &p)) {
+			fprintf(stderr, _("%s: bad value `%s' for name\n"), fname, raw);
+			return EINVAL;
+		}
+
+		map->name = strdup(p);
+	}
+
+	rawarray = toml_array_in(proot, "raw");
+	if (rawarray) {
+		if (toml_raw_in(proot, "scancodes")) {
+			fprintf(stderr, _("Cannot have both [raw] and [scancode] sections"));
+			return EINVAL;
+		}
+		if (!have_raw_protocol) {
+			fprintf(stderr, _("Keymap with raw entries must have raw protocol"));
+			return EINVAL;
+		}
+		error_t err = parse_toml_raw_part(fname, rawarray, map);
+		if (err != 0)
+			return err;
+
+	} else if (have_raw_protocol) {
+		fprintf(stderr, _("Keymap with raw protocol must have raw entries"));
+		return EINVAL;
+	}
+
+	scancodes = toml_table_in(proot, "scancodes");
+	if (!scancodes) {
+		if (verbose)
+			fprintf(stderr, _("%s: no [protocols.scancodes] section\n"), fname);
+		return 0;
+	}
+
+	for (i = 0; (key = toml_key_in(proot, i)) != NULL; i++) {
+		long int value;
+
+		raw = toml_raw_in(proot, key);
+		if (!toml_rtoi(raw, &value)) {
+			struct protocol_param *param;
+
+			param = malloc(sizeof(*param));
+			param->name = strdup(key);
+			param->value = value;
+			param->next = map->param;
+			map->param = param;
+			if (verbose)
+				fprintf(stderr, _("%s: protocol parameter %s=%ld\n"), fname, param->name, param->value);
+		}
+	}
+
+	for (;;) {
+		struct scancode_entry *se;
+		const char *scancode;
+		char *keycode;
+
+		scancode = toml_key_in(scancodes, i++);
+		if (!scancode)
+			break;
+
+		raw = toml_raw_in(scancodes, scancode);
+		if (!raw) {
+			fprintf(stderr, _("%s: invalid value `%s'\n"), fname, scancode);
+			return EINVAL;
+		}
+
+		if (toml_rtos(raw, &keycode)) {
+			fprintf(stderr, _("%s: bad value `%s' for keycode\n"),
+				fname, keycode);
+			return EINVAL;
+		}
+
+		se = calloc(1, sizeof(*se));
+		if (!se) {
+			perror("parse_keyfile");
+			return ENOMEM;
+		}
+
+		se->scancode = strtoul(scancode, NULL, 0);
+		se->keycode = keycode;
+		se->next = map->scancode;
+		map->scancode = se;
+	}
+
+	return 0;
+}
+
+static error_t parse_toml_keyfile(char *fname, struct keymap **keymap, bool verbose)
+{
+	struct toml_table_t *root, *proot;
+	struct toml_array_t *arr;
+	int ret, i = 0;
+	char buf[200];
+	FILE *fin;
+
+	if (verbose)
+		fprintf(stderr, _("Parsing %s keycode file as toml\n"), fname);
+
+	fin = fopen(fname, "r");
+	if (!fin)
+		return errno;
+
+	root = toml_parse_file(fin, buf, sizeof(buf));
+	fclose(fin);
+	if (!root) {
+		fprintf(stderr, _("%s: failed to parse toml: %s\n"), fname, buf);
+		return EINVAL;
+	}
+
+	arr = toml_array_in(root, "protocols");
+	if (!arr) {
+		fprintf(stderr, _("%s: missing [protocols] section\n"), fname);
+		return EINVAL;
+	}
+
+	struct keymap *map = NULL;
+
+	for (;;) {
+		struct keymap *cur_map;
+
+		proot = toml_table_at(arr, i);
+		if (!proot)
+			break;
+
+		ret = parse_toml_protocol(fname, proot, &cur_map, verbose);
+		if (ret)
+			goto out;
+
+		if (!map) {
+			map = cur_map;
+		} else {
+			cur_map->next = map->next;
+			map->next = cur_map;
+		}
+		i++;
+	}
+
+	if (i == 0) {
+		fprintf(stderr, _("%s: no protocols found\n"), fname);
+		goto out;
+	}
+
+	toml_free(root);
+	*keymap = map;
+	return 0;
+out:
+	toml_free(root);
+	return EINVAL;
+}
+
+error_t parse_keyfile(char *fname, struct keymap **keymap, bool verbose)
+{
+	size_t len = strlen(fname);
+
+	if (len >= 5 && strcasecmp(fname + len - 5, ".toml") == 0)
+		return parse_toml_keyfile(fname, keymap, verbose);
+	else
+		return parse_plain_keyfile(fname, keymap, verbose);
+}
diff --git a/utils/keytable/keymap.h b/utils/keytable/keymap.h
index 645a9bd0..df0ba814 100644
--- a/utils/keytable/keymap.h
+++ b/utils/keytable/keymap.h
@@ -2,11 +2,37 @@
 #ifndef __KEYMAP_H
 #define __KEYMAP_H
 
+struct keymap {
+	struct keymap *next;
+	char *name;
+	char *protocol;
+	char *variant;
+	struct protocol_param *param;
+	struct scancode_entry *scancode;
+	struct raw_entry *raw;
+};
+
+struct protocol_param {
+	struct protocol_param *next;
+	char *name;
+	long int value;
+};
+
+struct scancode_entry {
+	struct scancode_entry *next;
+	u_int32_t scancode;
+	char *keycode;
+};
+
 struct raw_entry {
 	struct raw_entry *next;
 	u_int32_t scancode;
 	u_int32_t raw_length;
+	char *keycode;
 	u_int32_t raw[1];
 };
 
+void free_keymap(struct keymap *map);
+error_t parse_keyfile(char *fname, struct keymap **keymap, bool verbose);
+
 #endif
diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
index 3c4031b0..c3c29fe1 100644
--- a/utils/keytable/keytable.c
+++ b/utils/keytable/keytable.c
@@ -33,7 +33,6 @@
 
 #include "ir-encode.h"
 #include "parse.h"
-#include "toml.h"
 #include "keymap.h"
 
 #ifdef HAVE_BPF
@@ -291,18 +290,12 @@ static enum sysfs_protocols ch_proto = 0;
 
 struct bpf_protocol {
 	struct bpf_protocol *next;
-	struct toml_table_t *toml;
+	struct protocol_param *param;
 	char *name;
 };
 
-struct bpf_parameter {
-	struct bpf_parameter *next;
-	int value;
-	char name[0];
-};
-
 static struct bpf_protocol *bpf_protocol;
-static struct bpf_parameter *bpf_parameter;
+static struct protocol_param *bpf_parameter;
 
 struct cfgfile cfg = {
 	NULL, NULL, NULL, NULL
@@ -331,33 +324,21 @@ struct rc_device {
 	enum sysfs_protocols supported, current; /* Current and supported IR protocols */
 };
 
-static bool compare_parameters(struct toml_table_t *a, struct toml_table_t *b)
+static bool compare_parameters(struct protocol_param *a, struct protocol_param *b)
 {
-	int i = 0;
-	int64_t avalue, bvalue;
-	const char *name, *raw;
-
-	if (a == NULL || b == NULL) {
-		return true;
-	}
-
-	while ((name = toml_key_in(a, i++)) != NULL) {
-		raw = toml_raw_in(a, name);
-		if (!raw)
-			continue;
+	struct protocol_param *b2;
 
-		if (toml_rtoi(raw, &avalue))
-			continue;
-
-		raw = toml_raw_in(b, name);
-		if (!raw)
-			return false;
-
-		if (toml_rtoi(raw, &bvalue))
-			return false;
+	for (; a; a = a->next) {
+		for (b2 = b; b2; b2 = b2->next) {
+			if (!strcmp(a->name, b2->name) &&
+			    a->value == b2->value) {
+				break;
+			}
+		}
 
-		if (avalue != bvalue)
+		if (!b2) {
 			return false;
+		}
 	}
 
 	return true;
@@ -376,8 +357,8 @@ static void add_bpf_protocol(struct bpf_protocol *new)
 		if (strcmp(a->name, new->name))
 			continue;
 
-		if (compare_parameters(a->toml, new->toml) &&
-		    compare_parameters(new->toml, a->toml))
+		if (compare_parameters(a->param, new->param) &&
+		    compare_parameters(new->param, a->param))
 			return;
 	}
 
@@ -385,401 +366,83 @@ static void add_bpf_protocol(struct bpf_protocol *new)
 	bpf_protocol = new;
 }
 
-static error_t parse_plain_keyfile(char *fname, char **table)
+static int add_keymap(struct keymap *map, const char *fname)
 {
-	FILE *fin;
-	int value, line = 0;
-	char *scancode, *keycode, s[2048];
-	struct keytable_entry *ke;
-
-	*table = NULL;
-
-	if (debug)
-		fprintf(stderr, _("Parsing %s keycode file as plain text\n"), fname);
-
-	fin = fopen(fname, "r");
-	if (!fin) {
-		return errno;
-	}
-
-	while (fgets(s, sizeof(s), fin)) {
-		char *p = s;
-
-		line++;
-		while (*p == ' ' || *p == '\t')
-			p++;
-		if (line==1 && p[0] == '#') {
-			p++;
-			p = strtok(p, "\n\t =:");
-			do {
-				if (!p)
-					goto err_einval;
-				if (!strcmp(p, "table")) {
-					p = strtok(NULL,"\n, ");
-					if (!p)
-						goto err_einval;
-					*table = malloc(strlen(p) + 1);
-					strcpy(*table, p);
-				} else if (!strcmp(p, "type")) {
-					p = strtok(NULL, " ,\n");
-					if (!p)
-						goto err_einval;
-
-					while (p) {
-						enum sysfs_protocols protocol;
-
-						protocol = parse_sysfs_protocol(p, false);
-						if (protocol == SYSFS_INVALID) {
-							fprintf(stderr, _("%s: protocol %s invalid\n"), fname, p);
-							goto err_einval;
-						}
-						ch_proto |= protocol;
-						p = strtok(NULL, " ,\n");
-					}
-				} else {
-					goto err_einval;
-				}
-				p = strtok(NULL, "\n\t =:");
-			} while (p);
-			continue;
-		}
-
-		if (*p == '\n' || *p == '#')
-			continue;
-
-		scancode = strtok(p, "\n\t =:");
-		if (!scancode)
-			goto err_einval;
-		if (!strcasecmp(scancode, "scancode")) {
-			scancode = strtok(NULL, "\n\t =:");
-			if (!scancode)
-				goto err_einval;
-		}
-
-		keycode = strtok(NULL, "\n\t =:(");
-		if (!keycode)
-			goto err_einval;
-
-		if (debug)
-			fprintf(stderr, _("parsing %s=%s:"), scancode, keycode);
-		value = parse_code(keycode);
-		if (debug)
-			fprintf(stderr, _("\tvalue=%d\n"), value);
-
-		if (value == -1) {
-			value = strtol(keycode, NULL, 0);
-			if (errno)
-				perror(_("value"));
-		}
-
-		ke = calloc(1, sizeof(*ke));
-		if (!ke) {
-			perror("parse_keyfile");
-			return ENOMEM;
+	for (; map; map = map->next) {
+		enum sysfs_protocols protocol;
+		struct keytable_entry *ke;
+		struct scancode_entry *se;
+		struct raw_entry *re;
+
+		protocol = parse_sysfs_protocol(map->protocol, false);
+		if (protocol == SYSFS_INVALID) {
+			struct bpf_protocol *b;
+
+			b = malloc(sizeof(*b));
+			b->name = strdup(map->protocol);
+			b->param = map->param;
+			/* steal param */
+			map->param = NULL;
+			add_bpf_protocol(b);
+		} else {
+			ch_proto |= protocol;
 		}
 
-		ke->scancode	= strtoul(scancode, NULL, 0);
-		ke->keycode	= value;
-		ke->next	= keytable;
-		keytable	= ke;
-	}
-	fclose(fin);
-
-	return 0;
-
-err_einval:
-	fprintf(stderr, _("Invalid parameter on line %d of %s\n"),
-		line, fname);
-	return EINVAL;
-}
-
-static error_t parse_toml_raw_part(const char *fname, struct toml_array_t *raw)
-{
-	struct toml_table_t *t;
-	struct toml_array_t *rawarray;
-	struct raw_entry *re;
-	struct keytable_entry *ke;
-	const char *rkeycode;
-	char *keycode, *p;
-	int ind = 0, length;
-	int value;
-
-	while ((t = toml_table_at(raw, ind++)) != NULL) {
-		rkeycode = toml_raw_in(t, "keycode");
-		if (!rkeycode) {
-			fprintf(stderr, _("%s: invalid keycode for raw entry %d\n"),
-				fname, ind);
-			return EINVAL;
-		}
+		for (se = map->scancode; se; se = se->next) {
+			int value;
+			char *p;
 
-		if (toml_rtos(rkeycode, &keycode)) {
-			fprintf(stderr, _("%s: bad value `%s' for keycode\n"),
-				fname, rkeycode);
-			return EINVAL;
-		}
+			value = parse_code(se->keycode);
+			if (debug)
+				fprintf(stderr, _("\tvalue=%d\n"), value);
 
-		value = parse_code(keycode);
-		if (debug)
-			fprintf(stderr, _("\tvalue=%d\n"), value);
-
-		if (value == -1) {
-			value = strtol(keycode, &p, 0);
-			if (errno || *p) {
-				free(keycode);
-				fprintf(stderr, _("%s: Keycode `%s' not recognised\n"),
-					fname, keycode);
-				continue;
+			if (value == -1) {
+				value = strtol(se->keycode, &p, 0);
+				if (errno || *p)
+					fprintf(stderr, _("%s: keycode `%s' not recognised, no mapping for scancode %d\n"), fname, se->keycode, se->scancode);
 			}
-		}
-		free(keycode);
 
-		rawarray = toml_array_in(t, "raw");
-		if (!rawarray) {
-			fprintf(stderr, _("%s: missing raw array for entry %d\n"),
-				fname, ind);
-			return EINVAL;
-		}
-
-		// determine length of array
-		length = 0;
-		while (toml_raw_at(rawarray, length) != NULL)
-			length++;
-
-		if (!(length % 2)) {
-			fprintf(stderr, _("%s: raw array must have odd length rather than %d\n"),
-				fname, length);
-			return EINVAL;
-		}
+			ke = malloc(sizeof(*ke));
+			ke->scancode = se->scancode;
+			ke->keycode = value;
+			ke->next = keytable;
 
-		re = calloc(1, sizeof(*re) + sizeof(re->raw[0]) * length);
-		if (!re) {
-			fprintf(stderr, _("Failed to allocate memory"));
-			return EINVAL;
+			keytable = ke;
 		}
 
-		for (int i=0; i<length; i++) {
-			const char *s = toml_raw_at(rawarray, i);
-			int64_t v;
+		for (re = map->raw; re; re = re->next) {
+			int value;
+			char *p;
 
-			if (toml_rtoi(s, &v) || v == 0) {
-				fprintf(stderr, _("%s: incorrect raw value `%s'"),
-					fname, s);
-				return EINVAL;
-			}
+			value = parse_code(re->keycode);
+			if (debug)
+				fprintf(stderr, _("\tvalue=%d\n"), value);
 
-			if (v <= 0 || v > USHRT_MAX) {
-				fprintf(stderr, _("%s: raw value %d out of range"),
-					fname, value);
-				return EINVAL;
+			if (value == -1) {
+				value = strtol(re->keycode, &p, 0);
+				if (errno || *p)
+					fprintf(stderr, _("%s: keycode `%s' not recognised, no mapping:\n"), fname, re->keycode);
 			}
 
-			re->raw[i] = v;
-		}
-
-		re->raw_length = length;
-
-		ke = calloc(1, sizeof(*ke));
-		if (!re) {
-			fprintf(stderr, _("Failed to allocate memory"));
-			return EINVAL;
-		}
-
-		ke->scancode = raw_scancode;
-		ke->keycode = value;
-		ke->next = keytable;
-		keytable = ke;
-
-		re->scancode = raw_scancode;
-		re->next = rawtable;
-		rawtable = re;
-
-		raw_scancode++;
-	}
-
-	return 0;
-}
-
-
-static error_t parse_toml_protocol(const char *fname, struct toml_table_t *proot)
-{
-	struct toml_table_t *scancodes;
-	struct toml_array_t *rawarray;
-	enum sysfs_protocols protocol;
-	const char *raw;
-	bool have_raw_protocol = false;
-	char *p;
-	int i = 0;
-
-	raw = toml_raw_in(proot, "protocol");
-	if (!raw) {
-		fprintf(stderr, _("%s: protocol missing\n"), fname);
-		return EINVAL;
-	}
-
-	if (toml_rtos(raw, &p)) {
-		fprintf(stderr, _("%s: bad value `%s' for protocol\n"), fname, raw);
-		return EINVAL;
-	}
-
-	protocol = parse_sysfs_protocol(p, false);
-	if (protocol == SYSFS_INVALID) {
-		struct bpf_protocol *b;
-
-		b = malloc(sizeof(*b));
-		if (!strcmp(p, "raw"))
-			have_raw_protocol = true;
-
-		b->name = p;
-		b->toml = proot;
-		add_bpf_protocol(b);
-	}
-	else {
-		ch_proto |= protocol;
-		free(p);
-	}
-
-	rawarray = toml_array_in(proot, "raw");
-	if (rawarray) {
-		if (toml_raw_in(proot, "scancodes")) {
-			fprintf(stderr, _("Cannot have both [raw] and [scancode] sections"));
-			return EINVAL;
-		}
-		if (!have_raw_protocol) {
-			fprintf(stderr, _("Keymap with raw entries must have raw protocol"));
-			return EINVAL;
-		}
-		error_t err = parse_toml_raw_part(fname, rawarray);
-		if (err != 0)
-			return err;
-
-	} else if (have_raw_protocol) {
-		fprintf(stderr, _("Keymap with raw protocol must have raw entries"));
-		return EINVAL;
-	}
-
-	scancodes = toml_table_in(proot, "scancodes");
-	if (!scancodes) {
-		if (debug)
-			fprintf(stderr, _("%s: no [protocols.scancodes] section\n"), fname);
-		return 0;
-	}
-
-	for (;;) {
-		struct keytable_entry *ke;
-		const char *scancode;
-		char *keycode;
-		int value;
-
-		scancode = toml_key_in(scancodes, i++);
-		if (!scancode)
-			break;
-
-		raw = toml_raw_in(scancodes, scancode);
-		if (!raw) {
-			fprintf(stderr, _("%s: invalid value `%s'\n"), fname, scancode);
-			return EINVAL;
-		}
-
-		if (toml_rtos(raw, &keycode)) {
-			fprintf(stderr, _("%s: bad value `%s' for keycode\n"),
-				fname, keycode);
-			return EINVAL;
-		}
-
-		if (debug)
-			fprintf(stderr, _("parsing %s=%s:"), scancode, keycode);
-
-		value = parse_code(keycode);
-		if (debug)
-			fprintf(stderr, _("\tvalue=%d\n"), value);
+			ke = malloc(sizeof(*ke));
+			ke->scancode = raw_scancode;
+			ke->keycode = value;
+			ke->next = keytable;
 
-		if (value == -1) {
-			value = strtol(keycode, &p, 0);
-			if (errno || *p)
-				fprintf(stderr, _("%s: keycode `%s' not recognised, no mapping for scancode %s\n"), fname, keycode, scancode);
-		}
-		free(keycode);
+			keytable = ke;
 
-		ke = calloc(1, sizeof(*ke));
-		if (!ke) {
-			perror("parse_keyfile");
-			return ENOMEM;
+			re->scancode = raw_scancode++;
+			re->next = rawtable;
+			rawtable = re;
 		}
 
-		ke->scancode	= strtoul(scancode, NULL, 0);
-		ke->keycode	= value;
-		ke->next	= keytable;
-		keytable	= ke;
+		/* Steal the raw entries */
+		map->raw = NULL;
 	}
 
 	return 0;
 }
 
-static error_t parse_toml_keyfile(char *fname, char **table)
-{
-	struct toml_table_t *root, *proot;
-	struct toml_array_t *arr;
-	int ret, i = 0;
-	char buf[200];
-	FILE *fin;
-
-	*table = NULL;
-
-	if (debug)
-		fprintf(stderr, _("Parsing %s keycode file as toml\n"), fname);
-
-	fin = fopen(fname, "r");
-	if (!fin)
-		return errno;
-
-	root = toml_parse_file(fin, buf, sizeof(buf));
-	fclose(fin);
-	if (!root) {
-		fprintf(stderr, _("%s: failed to parse toml: %s\n"), fname, buf);
-		return EINVAL;
-	}
-
-	arr = toml_array_in(root, "protocols");
-	if (!arr) {
-		fprintf(stderr, _("%s: missing [protocols] section\n"), fname);
-		return EINVAL;
-	}
-
-	for (;;) {
-		proot = toml_table_at(arr, i);
-		if (!proot)
-			break;
-
-		ret = parse_toml_protocol(fname, proot);
-		if (ret)
-			goto out;
-
-		i++;
-	}
-
-	if (i == 0) {
-		fprintf(stderr, _("%s: no protocols found\n"), fname);
-		goto out;
-	}
-
-	// Don't free toml, this is used during bpf loading
-	//toml_free(root);
-	return 0;
-out:
-	toml_free(root);
-	return EINVAL;
-}
-
-static error_t parse_keyfile(char *fname, char **table)
-{
-	size_t len = strlen(fname);
-
-	if (len >= 5 && strcasecmp(fname + len - 5, ".toml") == 0)
-		return parse_toml_keyfile(fname, table);
-	else
-		return parse_plain_keyfile(fname, table);
-}
-
 static error_t parse_cfgfile(char *fname)
 {
 	FILE *fin;
@@ -883,13 +546,18 @@ static error_t parse_opt(int k, char *arg, struct argp_state *state)
 		readtable++;
 		break;
 	case 'w': {
-		char *name = NULL;
+		struct keymap *map = NULL;
 
-		rc = parse_keyfile(arg, &name);
-		if (rc)
+		rc = parse_keyfile(arg, &map, debug);
+		if (rc) {
 			argp_error(state, _("Failed to read table file %s"), arg);
-		if (name)
-			fprintf(stderr, _("Read %s table\n"), name);
+			break;
+		}
+		if (map->name)
+			fprintf(stderr, _("Read %s table\n"), map->name);
+
+		add_keymap(map, arg);
+		free_keymap(map);
 		break;
 	}
 	case 'a': {
@@ -960,7 +628,7 @@ static error_t parse_opt(int k, char *arg, struct argp_state *state)
 
 				b = malloc(sizeof(*b));
 				b->name = strdup(p);
-				b->toml = NULL;
+				b->param = NULL;
 				b->next = bpf_protocol;
 				bpf_protocol = b;
 			}
@@ -972,20 +640,20 @@ static error_t parse_opt(int k, char *arg, struct argp_state *state)
 	case 'e':
 		p = strtok(arg, ":=");
 		do {
-			struct bpf_parameter *param;
+			struct protocol_param *param;
 
 			if (!p) {
 				argp_error(state, _("Missing parameter name: %s"), arg);
 				break;
 			}
 
-			param = calloc(1, sizeof(*param) + strlen(p) + 1);
+			param = malloc(sizeof(*param));
 			if (!p) {
 				perror(_("No memory!\n"));
 				return ENOMEM;
 			}
 
-			strcpy(param->name, p);
+			param->name = strdup(p);
 
 			p = strtok(NULL, ",;");
 			if (!p) {
@@ -1002,7 +670,7 @@ static error_t parse_opt(int k, char *arg, struct argp_state *state)
 			}
 
 			if (debug)
-				fprintf(stderr, _("parameter %s=%d\n"),
+				fprintf(stderr, _("parameter %s=%ld\n"),
 					param->name, param->value);
 
 			param->next = bpf_parameter;
@@ -1013,11 +681,13 @@ static error_t parse_opt(int k, char *arg, struct argp_state *state)
 		break;
 	case 1:
 		test_keymap++;
-		char *name = NULL;
+		struct keymap *map ;
 
-		rc = parse_keyfile(arg, &name);
+		rc = parse_keyfile(arg, &map, debug);
 		if (rc)
 			argp_error(state, _("Failed to read table file %s"), arg);
+		add_keymap(map, arg);
+		free_keymap(map);
 		break;
 	case '?':
 		argp_state_help(state, state->out_stream,
@@ -1275,7 +945,7 @@ static enum sysfs_protocols load_bpf_for_unsupported(enum sysfs_protocols protoc
 
 		b = malloc(sizeof(*b));
 		b->name = strdup(pme->name);
-		b->toml = NULL;
+		b->param = NULL;
 		add_bpf_protocol(b);
 
 		protocols &= ~pme->sysfs_protocol;
@@ -2022,7 +1692,7 @@ static void device_info(int fd, char *prepend)
 
 #ifdef HAVE_BPF
 #define MAX_PROGS 64
-static void attach_bpf(const char *lirc_name, const char *bpf_prog, struct toml_table_t *toml)
+static void attach_bpf(const char *lirc_name, const char *bpf_prog, struct protocol_param *param)
 {
 	unsigned int features;
 	int fd;
@@ -2045,7 +1715,7 @@ static void attach_bpf(const char *lirc_name, const char *bpf_prog, struct toml_
 		return;
 	}
 
-	load_bpf_file(bpf_prog, fd, toml, rawtable);
+	load_bpf_file(bpf_prog, fd, param, rawtable);
 	close(fd);
 }
 
@@ -2238,9 +1908,9 @@ static char *find_bpf_file(const char *name)
 	return fname;
 }
 
-int bpf_param(const char *name, int *val)
+int bpf_param(struct protocol_param *protocol_param, const char *name, int *val)
 {
-	struct bpf_parameter *param = bpf_parameter;
+	struct protocol_param *param = bpf_parameter;
 
 	while (param) {
 		if (strcmp(name, param->name) == 0) {
@@ -2250,6 +1920,14 @@ int bpf_param(const char *name, int *val)
 		param = param->next;
 	}
 
+	while (protocol_param) {
+		if (strcmp(name, protocol_param->name) == 0) {
+			*val = protocol_param->value;
+			return 0;
+		}
+		protocol_param = protocol_param->next;
+	}
+
 	return -ENOENT;
 }
 
@@ -2302,7 +1980,7 @@ int main(int argc, char *argv[])
 
 	if (cfg.next) {
 		struct cfgfile *cur;
-		char *fname, *name;
+		char *fname;
 		int rc;
 		int matches = 0;
 
@@ -2318,29 +1996,36 @@ int main(int argc, char *argv[])
 					cur->fname);
 
 			if (cur->fname[0] == '/' || ((cur->fname[0] == '.') && strchr(cur->fname, '/'))) {
+				struct keymap *map;
 				fname = cur->fname;
-				rc = parse_keyfile(fname, &name);
+				rc = parse_keyfile(fname, &map, debug);
 				if (rc < 0) {
 					fprintf(stderr, _("Can't load %s table\n"), fname);
 					return -1;
 				}
+				add_keymap(map, fname);
+				free_keymap(map);
 			} else {
+				struct keymap *map;
 				fname = malloc(strlen(cur->fname) + strlen(IR_KEYTABLE_USER_DIR) + 2);
 				strcpy(fname, IR_KEYTABLE_USER_DIR);
 				strcat(fname, "/");
 				strcat(fname, cur->fname);
-				rc = parse_keyfile(fname, &name);
+				rc = parse_keyfile(fname, &map, debug);
 				if (rc != 0) {
 					fname = malloc(strlen(cur->fname) + strlen(IR_KEYTABLE_SYSTEM_DIR) + 2);
 					strcpy(fname, IR_KEYTABLE_SYSTEM_DIR);
 					strcat(fname, "/");
 					strcat(fname, cur->fname);
-					rc = parse_keyfile(fname, &name);
+					rc = parse_keyfile(fname, &map, debug);
 				}
 				if (rc != 0) {
 					fprintf(stderr, _("Can't load %s table from %s or %s\n"), cur->fname, IR_KEYTABLE_USER_DIR, IR_KEYTABLE_SYSTEM_DIR);
 					return -1;
 				}
+
+				add_keymap(map, fname);
+				free_keymap(map);
 			}
 			if (!keytable) {
 				fprintf(stderr, _("Empty table %s\n"), fname);
@@ -2414,7 +2099,7 @@ int main(int argc, char *argv[])
 			char *fname = find_bpf_file(b->name);
 
 			if (fname) {
-				attach_bpf(rc_dev.lirc_name, fname, b->toml);
+				attach_bpf(rc_dev.lirc_name, fname, b->param);
 				fprintf(stderr, _("Loaded BPF protocol %s\n"), b->name);
 				free(fname);
 			}
diff --git a/utils/keytable/rc_keymap.5.in b/utils/keytable/rc_keymap.5.in
index d5de657a..00599755 100644
--- a/utils/keytable/rc_keymap.5.in
+++ b/utils/keytable/rc_keymap.5.in
@@ -4,7 +4,7 @@ rc_keymap \- toml file describing remote control keymap
 .SH DESCRIPTION
 An rc_keymap describes a remote control. It list the protocols used, and the
 mapping from decoded IR to linux input events. This file is used by
-ir\-keytable(1).
+ir\-keytable(1) for IR decoding, and by ir-ctl(1) for sending IR.
 .PP
 The file format is toml. Since a remote control can use multiple protocols,
 the top level is an array of protocols. The vast majority of remotes only use
@@ -308,7 +308,7 @@ License GPLv2: GNU GPL version 2 <http://gnu.org/licenses/gpl.html>.
 This is free software: you are free to change and redistribute it.
 There is NO WARRANTY, to the extent permitted by law.
 .SH SEE ALSO
-ir\-keytable(1).
+ir\-keytable(1) and ir\-ctl(1)
 .PP
 https://lwn.net/Articles/759188/
 .PP
-- 
2.21.0

