Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A21408599A
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2019 07:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730886AbfHHFEs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Aug 2019 01:04:48 -0400
Received: from gofer.mess.org ([88.97.38.141]:33269 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725933AbfHHFEs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Aug 2019 01:04:48 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 5B5886075C; Thu,  8 Aug 2019 06:04:47 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils] keytable: add support for keymap with raw literal strings
Date:   Thu,  8 Aug 2019 06:04:47 +0100
Message-Id: <20190808050447.18643-1-sean@mess.org>
X-Mailer: git-send-email 2.11.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds support for converting lircd raw_codes remote definitions. This
means that the vast majority of lircd files can be converted.

This feature requires loops in BPF programs so this is only supported
in kernel 5.3 onwards.

Signed-off-by: Sean Young <sean@mess.org>
---
 contrib/lircd2toml.py                    |  52 ++++++---
 utils/keytable/bpf_load.c                |  84 ++++++++++++++-
 utils/keytable/bpf_load.h                |   9 +-
 utils/keytable/bpf_protocols/Makefile.am |   2 +-
 utils/keytable/bpf_protocols/bitmap.h    |  36 +++++++
 utils/keytable/bpf_protocols/raw.c       | 131 +++++++++++++++++++++++
 utils/keytable/keytable.c                | 127 +++++++++++++++++++++-
 utils/keytable/rc_keymap.5.in            |  15 ++-
 8 files changed, 435 insertions(+), 21 deletions(-)
 create mode 100644 utils/keytable/bpf_protocols/bitmap.h
 create mode 100644 utils/keytable/bpf_protocols/raw.c

diff --git a/contrib/lircd2toml.py b/contrib/lircd2toml.py
index 9b93f198..2aebfb0b 100755
--- a/contrib/lircd2toml.py
+++ b/contrib/lircd2toml.py
@@ -146,14 +146,14 @@ class LircdParser:
             a = line.split()
             if a[0] == 'name':
                 if len(codes) > 0:
-                    raw_codes.append({ 'name': name, 'codes': codes })
+                    raw_codes.append({ 'keycode': name, 'raw': codes })
                 name = line.split(maxsplit=2)[1]
                 if not name.startswith('KEY_'):
                     name = 'KEY_' + name.upper()
                 codes = []
             elif a[0] == 'end':
                 if len(codes) > 0:
-                    raw_codes.append({ 'name': name, 'codes': codes })
+                    raw_codes.append({ 'keycode': name, 'raw': codes })
                 return raw_codes
             else:
                 for v in a:
@@ -224,6 +224,8 @@ class Converter:
             return self.convert_rcmm()
         elif 'space_enc' in flags:
             return self.convert_space_enc()
+        elif 'raw_codes' in flags:
+            return self.convert_raw_codes()
         else:
             self.error('Cannot convert remote with flags: {}'.format('|'.join(flags)))
 
@@ -567,6 +569,16 @@ class Converter:
 
         return res
 
+    def convert_raw_codes(self):
+        res  = {
+            'protocol': 'raw',
+            'params': {},
+            'raw': self.remote['raw_codes'],
+            'name': self.remote['name']
+        }
+
+        return res
+
 def escapeString(s):
     return "'" + s.encode('unicode_escape').decode('utf-8') + "'"
 
@@ -576,16 +588,32 @@ def writeTOMLFile(fh, remote):
     print('protocol = {}'.format(escapeString(remote['protocol'])), file=fh)
     for p in remote['params']:
         print('{} = {}'.format(p, remote['params'][p]), file=fh)
-    print('[protocols.scancodes]', file=fh)
-    # find the largest scancode
-    length=1
-    for c in remote['map']:
-        length=max(length, c.bit_length())
-
-    # width seems to include '0x', hence the + 2
-    width = math.ceil(length/4) + 2
-    for c in remote['map']:
-        print('{:#0{width}x} = {}'.format(c, escapeString(remote['map'][c]), width=width), file=fh)
+
+    if 'map' in remote:
+        print('[protocols.scancodes]', file=fh)
+        # find the largest scancode
+        length=1
+        for c in remote['map']:
+            length=max(length, c.bit_length())
+
+        # width seems to include '0x', hence the + 2
+        width = math.ceil(length/4) + 2
+        for c in remote['map']:
+            print('{:#0{width}x} = {}'.format(c, escapeString(remote['map'][c]), width=width), file=fh)
+
+    elif 'raw' in remote:
+        for raw in remote['raw']:
+            print('[[protocols.raw]]', file=fh)
+            print('keycode = {}\nraw = ['.format(escapeString(raw['keycode'])), file=fh, end='')
+            first = True
+            for v in raw['raw']:
+                if first:
+                    print(' {}'.format(v), file=fh, end='')
+                else:
+                    print(', {}'.format(v), file=fh, end='')
+                first = False
+
+            print(' ]', file=fh)
 
     return True
 
diff --git a/utils/keytable/bpf_load.c b/utils/keytable/bpf_load.c
index 1078c9bb..51b3acf3 100644
--- a/utils/keytable/bpf_load.c
+++ b/utils/keytable/bpf_load.c
@@ -27,6 +27,13 @@
 # define _(string) string
 #endif
 
+struct raw_pattern {
+	unsigned int scancode;
+	unsigned short raw[1];
+};
+
+int max_length;
+int trail_space;
 
 char bpf_log_buf[BPF_LOG_BUF_SIZE];
 extern int debug;
@@ -68,7 +75,7 @@ static int load_and_attach(int lirc_fd, struct bpf_file *bpf_file, const char *n
 	return 0;
 }
 
-static int load_maps(struct bpf_file *bpf_file)
+static int load_maps(struct bpf_file *bpf_file, struct raw_entry *raw)
 {
 	struct bpf_map_data *maps = bpf_file->map_data;
 	int i, numa_node;
@@ -89,6 +96,64 @@ static int load_maps(struct bpf_file *bpf_file)
 							maps[i].def.max_entries,
 							maps[i].def.map_flags,
 							numa_node);
+		} else if (!strcmp(maps[i].name, "raw_map")) {
+			int no_patterns;
+			int value_size, fd, key, n;
+			struct raw_entry *e = raw;
+			struct raw_pattern *p;
+
+			no_patterns = 0;
+
+			while (e) {
+				if (e->raw_length > max_length)
+					max_length = e->raw_length;
+				no_patterns++;
+				e = e->next;
+			}
+
+			value_size = sizeof(struct raw_pattern) +
+				max_length * sizeof(short);
+
+			fd = bpf_create_map_node(maps[i].def.type,
+						 maps[i].name,
+						 maps[i].def.key_size,
+						 value_size,
+						 no_patterns,
+						 maps[i].def.map_flags,
+						 numa_node);
+
+			if (fd < 0) {
+				printf(_("failed to create a map: %d %s\n"),
+				       errno, strerror(errno));
+				return 1;
+			}
+
+			p = malloc(value_size);
+			key = 0;
+			e = raw;
+
+			while (e) {
+				memset(p, 0, value_size);
+				p->scancode = e->scancode;
+				for (n = 0; n < e->raw_length; n++) {
+					p->raw[n] = e->raw[n];
+					if (n % 2 && e->raw[n] > trail_space)
+						trail_space = e->raw[n];
+				}
+
+				if (bpf_map_update_elem(fd, &key, p, BPF_ANY)) {
+					printf(_("failed to update raw map: %d %s\n"),
+					       errno, strerror(errno));
+					return 1;
+				}
+
+				key++;
+				e = e->next;
+			}
+
+			trail_space += 1000;
+
+			bpf_file->map_fd[i] = fd;
 		} else {
 			bpf_file->map_fd[i] = bpf_create_map_node(
 							maps[i].def.type,
@@ -99,6 +164,7 @@ static int load_maps(struct bpf_file *bpf_file)
 							maps[i].def.map_flags,
 							numa_node);
 		}
+
 		if (bpf_file->map_fd[i] < 0) {
 			printf(_("failed to create a map: %d %s\n"),
 			       errno, strerror(errno));
@@ -202,7 +268,13 @@ static int parse_relo_and_apply(struct bpf_file *bpf_file, GElf_Shdr *shdr,
 
 				value = val64;
 			} else if (sym.st_shndx == bpf_file->dataidx) {
-				value = *(int*)((unsigned char*)bpf_file->data->d_buf + sym.st_value);
+				// Value
+				if (!strcmp(sym_name, "max_length") && max_length)
+					value = max_length;
+				else if (!strcmp(sym_name, "trail_space") && trail_space)
+					value = trail_space;
+				else
+					value = *(int*)((unsigned char*)bpf_file->data->d_buf + sym.st_value);
 			}
 
 			if (debug)
@@ -339,7 +411,8 @@ static int load_elf_maps_section(struct bpf_file *bpf_file)
 	return nr_maps;
 }
 
-int load_bpf_file(const char *path, int lirc_fd, struct toml_table_t *toml)
+int load_bpf_file(const char *path, int lirc_fd, struct toml_table_t *toml,
+	          struct raw_entry *raw)
 {
 	struct bpf_file bpf_file = { .toml = toml };
 	int fd, i, ret;
@@ -406,6 +479,9 @@ int load_bpf_file(const char *path, int lirc_fd, struct toml_table_t *toml)
 		goto done;
 	}
 
+	max_length = 0;
+	trail_space = 0;
+
 	if (data_map) {
 		bpf_file.nr_maps = load_elf_maps_section(&bpf_file);
 		if (bpf_file.nr_maps < 0) {
@@ -413,7 +489,7 @@ int load_bpf_file(const char *path, int lirc_fd, struct toml_table_t *toml)
 			       nr_maps, strerror(-nr_maps));
 			goto done;
 		}
-		if (load_maps(&bpf_file))
+		if (load_maps(&bpf_file, raw))
 			goto done;
 
 		bpf_file.processed_sec[bpf_file.maps_shidx] = true;
diff --git a/utils/keytable/bpf_load.h b/utils/keytable/bpf_load.h
index 2775607f..471600bb 100644
--- a/utils/keytable/bpf_load.h
+++ b/utils/keytable/bpf_load.h
@@ -24,6 +24,13 @@ struct bpf_map_data {
 	struct bpf_load_map_def def;
 };
 
+struct raw_entry {
+	struct raw_entry *next;
+	u_int32_t scancode;
+	u_int32_t raw_length;
+	u_int32_t raw[1];
+};
+
 /* parses elf file compiled by llvm .c->.o
  * . parses 'maps' section and creates maps via BPF syscall
  * . parses 'license' section and passes it to syscall
@@ -36,7 +43,7 @@ struct bpf_map_data {
  *
  * returns zero on success
  */
-int load_bpf_file(const char *path, int lirc_fd, struct toml_table_t *toml);
+int load_bpf_file(const char *path, int lirc_fd, struct toml_table_t *toml, struct raw_entry *raw);
 
 int bpf_param(const char *name, int *val);
 
diff --git a/utils/keytable/bpf_protocols/Makefile.am b/utils/keytable/bpf_protocols/Makefile.am
index bca3bdec..d9facbc9 100644
--- a/utils/keytable/bpf_protocols/Makefile.am
+++ b/utils/keytable/bpf_protocols/Makefile.am
@@ -10,7 +10,7 @@ CLANG_SYS_INCLUDES := $(shell $(CLANG) -v -E - </dev/null 2>&1 \
 %.o: %.c bpf_helpers.h
 	$(CLANG) $(CLANG_SYS_INCLUDES) -D__linux__ -I$(top_srcdir)/include -target bpf -O2 -c $<
 
-PROTOCOLS = grundig.o pulse_distance.o pulse_length.o rc_mm.o manchester.o xbox-dvd.o imon_rsc.o
+PROTOCOLS = grundig.o pulse_distance.o pulse_length.o rc_mm.o manchester.o xbox-dvd.o imon_rsc.o raw.o
 
 all: $(PROTOCOLS)
 
diff --git a/utils/keytable/bpf_protocols/bitmap.h b/utils/keytable/bpf_protocols/bitmap.h
new file mode 100644
index 00000000..e3d731ad
--- /dev/null
+++ b/utils/keytable/bpf_protocols/bitmap.h
@@ -0,0 +1,36 @@
+
+#ifndef __BITMAP_H__
+#define __BITMAP_H__
+
+#include "string.h"
+
+#define BITS_PER_LONG 64
+#define BITS_TO_LONG(n) \
+	(((n) + BITS_PER_LONG - 1) / BITS_PER_LONG)
+
+
+#define DECLARE_BITMAP(name, bits) \
+	unsigned long name[BITS_TO_LONG(bits)]
+
+static void inline bitmap_zero(unsigned long *bitmap, int bits)
+{
+	for (int i = 0; i < BITS_TO_LONG(bits); i++)
+		bitmap[i] = 0;
+}
+
+static void inline bitmap_fill(unsigned long *bitmap, int bits)
+{
+	for (int i = 0; i < BITS_TO_LONG(bits); i++)
+		bitmap[i] = ~0;
+}
+
+#define bitmap_set(b, n) \
+	b[n / BITS_PER_LONG] |= 1 << (n % BITS_PER_LONG)
+
+#define bitmap_clear(b, n) \
+	b[n / BITS_PER_LONG] &= ~(1 << (n % BITS_PER_LONG))
+
+#define bitmap_test(b, n) \
+	(b[n / BITS_PER_LONG] & (1 << (n % BITS_PER_LONG))) != 0
+
+#endif
diff --git a/utils/keytable/bpf_protocols/raw.c b/utils/keytable/bpf_protocols/raw.c
new file mode 100644
index 00000000..93979b2a
--- /dev/null
+++ b/utils/keytable/bpf_protocols/raw.c
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright (C) 2018 Sean Young <sean@mess.org>
+//
+// This decoder matches pre-defined pulse-space sequences. It does so by iterating through the list
+// There are many optimisation possible, if performance is an issue.
+//
+// First of all iterating through the list of patterns is one-by-one, even
+// though after the first few pulse space sequences, most patterns will be
+// will not be match at this point.
+//
+// Secondly this can be transformed into a much more efficient state machine,
+// where we pre-compile the patterns much like a regex.
+
+#include <linux/lirc.h>
+#include <linux/bpf.h>
+
+#include "bpf_helpers.h"
+#include "bitmap.h"
+
+#define MAX_PATTERNS 1024
+
+struct decoder_state {
+	int pos;
+	DECLARE_BITMAP(nomatch, MAX_PATTERNS);
+};
+
+struct bpf_map_def SEC("maps") decoder_state_map = {
+	.type = BPF_MAP_TYPE_ARRAY,
+	.key_size = sizeof(unsigned int),
+	.value_size = sizeof(struct decoder_state),
+	.max_entries = 1,
+};
+
+struct raw_pattern {
+	unsigned int scancode;
+	unsigned short raw[1];
+};
+
+// ir-keytable will load the raw patterns here
+struct bpf_map_def SEC("maps") raw_map = {
+	.type = BPF_MAP_TYPE_ARRAY,
+	.key_size = sizeof(unsigned int),
+	.value_size = sizeof(struct raw_pattern), // this is not used
+	.max_entries = MAX_PATTERNS,
+};
+
+
+// These values can be overridden in the rc_keymap toml
+//
+// We abuse elf relocations. We cast the address of these variables to
+// an int, so that the compiler emits a mov immediate for the address
+// but uses it as an int. The bpf loader replaces the relocation with the
+// actual value (either overridden or taken from the data segment).
+int margin = 200;
+int trail_space = 4000;
+int rc_protocol = 68;
+int max_length = 15;
+
+#define BPF_PARAM(x) (int)(&(x))
+
+static inline int eq_margin(unsigned d1, unsigned d2)
+{
+	return ((d1 > (d2 - BPF_PARAM(margin))) && (d1 < (d2 + BPF_PARAM(margin))));
+}
+
+SEC("raw")
+int bpf_decoder(unsigned int *sample)
+{
+	unsigned int key = 0;
+	struct decoder_state *s = bpf_map_lookup_elem(&decoder_state_map, &key);
+	struct raw_pattern *p;
+	unsigned int i;
+
+	if (!s)
+		return 0;
+
+	switch (*sample & LIRC_MODE2_MASK) {
+	case LIRC_MODE2_SPACE:
+	case LIRC_MODE2_PULSE:
+	case LIRC_MODE2_TIMEOUT:
+		break;
+	default:
+		// not a timing events
+		return 0;
+	}
+
+	int duration = LIRC_VALUE(*sample);
+	int pulse = LIRC_IS_PULSE(*sample);
+	int pos = s->pos;
+	if (pos < 0 || pos > BPF_PARAM(max_length))
+		return 0;
+
+	if (!pulse && duration >= BPF_PARAM(trail_space)) {
+		for (i = 0; i < MAX_PATTERNS; i++) {
+			key = i;
+			p = bpf_map_lookup_elem(&raw_map, &key);
+			if (!p)
+				break;
+
+			if (bitmap_test(s->nomatch, i))
+				continue;
+
+			if (p->raw[pos] == 0)
+				bpf_rc_keydown(sample, BPF_PARAM(rc_protocol), p->scancode, 0);
+		}
+
+		bitmap_fill(s->nomatch, MAX_PATTERNS);
+		s->pos = 0;
+	} else {
+		for (i = 0; i < MAX_PATTERNS; i++) {
+			key = i;
+			p = bpf_map_lookup_elem(&raw_map, &key);
+			if (!p)
+				break;
+
+			if (bitmap_test(s->nomatch, i))
+				continue;
+
+			if (p->raw[pos] == 0 ||
+				!eq_margin(duration,  p->raw[pos]))
+				bitmap_set(s->nomatch, i);
+		}
+
+		s->pos++;
+	}
+
+	return 0;
+}
+
+char _license[] SEC("license") = "GPL";
diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
index 573989eb..08ab493a 100644
--- a/utils/keytable/keytable.c
+++ b/utils/keytable/keytable.c
@@ -80,7 +80,13 @@ struct keytable_entry {
 	struct keytable_entry *next;
 };
 
+// Whenever for each key which has a raw entry rather than a scancode,
+// we need to assign a globally unique scancode for dealing with reading
+// more than keymap with raw entries.
+static int raw_scancode = 0;
+
 struct keytable_entry *keytable = NULL;
+struct raw_entry *rawtable = NULL;
 
 struct uevents {
 	char		*key;
@@ -486,11 +492,108 @@ err_einval:
 	return EINVAL;
 }
 
+static error_t parse_toml_raw_part(const char *fname, struct toml_array_t *raw)
+{
+	struct toml_table_t *t;
+	struct toml_array_t *rawarray;
+	struct raw_entry *re;
+	struct keytable_entry *ke;
+	const char *rkeycode;
+	char *keycode, *p;
+	int ind = 0, length;
+	int value;
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
+		value = parse_code(keycode);
+		if (debug)
+			fprintf(stderr, _("\tvalue=%d\n"), value);
+
+		if (value == -1) {
+			value = strtol(keycode, &p, 0);
+			if (errno || *p) {
+				fprintf(stderr, _("%s: Keycode `%s' not recognised\n"),
+					fname, keycode);
+				continue;
+			}
+		}
+		free(keycode);
+
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
+			re->raw[i] = v;
+		}
+
+		re->raw_length = length;
+
+		ke = calloc(1, sizeof(*ke));
+		if (!re) {
+			fprintf(stderr, _("Failed to allocate memory"));
+			return EINVAL;
+		}
+
+		ke->scancode = raw_scancode;
+		ke->keycode = value;
+		ke->next = keytable;
+		keytable = ke;
+
+		re->scancode = raw_scancode;
+		re->next = rawtable;
+		rawtable = re;
+
+		raw_scancode++;
+	}
+
+	return 0;
+}
+
+
 static error_t parse_toml_protocol(const char *fname, struct toml_table_t *proot)
 {
 	struct toml_table_t *scancodes;
+	struct toml_array_t *rawarray;
 	enum sysfs_protocols protocol;
 	const char *raw;
+	bool have_raw_protocol = false;
 	char *p;
 	int i = 0;
 
@@ -510,6 +613,9 @@ static error_t parse_toml_protocol(const char *fname, struct toml_table_t *proot
 		struct bpf_protocol *b;
 
 		b = malloc(sizeof(*b));
+		if (!strcmp(p, "raw"))
+			have_raw_protocol = true;
+
 		b->name = p;
 		b->toml = proot;
 		add_bpf_protocol(b);
@@ -519,6 +625,25 @@ static error_t parse_toml_protocol(const char *fname, struct toml_table_t *proot
 		free(p);
 	}
 
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
+		error_t err = parse_toml_raw_part(fname, rawarray);
+		if (err != 0)
+			return err;
+
+	} else if (have_raw_protocol) {
+		fprintf(stderr, _("Keymap with raw protocol must have raw entries"));
+		return EINVAL;
+	}
+
 	scancodes = toml_table_in(proot, "scancodes");
 	if (!scancodes) {
 		if (debug)
@@ -1907,7 +2032,7 @@ static void attach_bpf(const char *lirc_name, const char *bpf_prog, struct toml_
 		return;
 	}
 
-	load_bpf_file(bpf_prog, fd, toml);
+	load_bpf_file(bpf_prog, fd, toml, rawtable);
 	close(fd);
 }
 
diff --git a/utils/keytable/rc_keymap.5.in b/utils/keytable/rc_keymap.5.in
index c9e672d7..f2897631 100644
--- a/utils/keytable/rc_keymap.5.in
+++ b/utils/keytable/rc_keymap.5.in
@@ -21,7 +21,7 @@ name than the file name, e.g. the model number.
 The \fBprotocol\fR field specifies the protocol. This can either be one of the
 linux kernel decoders, in which case it is \fBnec\fR, \fBrc\-5\fR, \fBrc\-6\fR,
 \fBjvc\fR, \fBsony\fR, \fBsanyo\fR, \fBrc\-5\-sz\fR, \fBsharp\fR,
-\fBmce\-kbd\fR, \fBxmp\fR, \fBimon\fR, \fBrc\-mm\fR, \fBother\fR or
+\fBmce\-kbd\fR, \fBxmp\fR, \fBimon\fR, \fBrc\-mm\fR, \fBraw\fR, \fBother\fR or
 \fBunknown\fR. If it does not match any of these entries, then it is assumed
 to be a BPF based decoder. The \fBunknown\fR and \fBother\fR are protocols
 decoded by specific RC devices where the protocol is either unknown or
@@ -52,7 +52,8 @@ Protocol \fBrc\-mm\fR has variants \fBrc-mm-12\fR, \fBrc-mm-24\fR, and
 \fBrc-mm-32\fR.
 .SS Scancodes field
 The \fBscancodes\fR table list the scancodes and the mapping to linux input
-key events. Multiple scancodes can map to the same key event.
+key events. Multiple scancodes can map to the same key event. This field
+is not present for \fBraw\fR protocols.
 .PP
 If the scancode start with 0x, it is interpreted as a hexadecimal number. If
 it starts with a 0, it is interpreted as an octal number.
@@ -60,6 +61,16 @@ it starts with a 0, it is interpreted as an octal number.
 The key events are listed in the \fBinput-event-codes.h\fR header file.
 Examples are \fBKEY_ENTER\fR, \fBKEY_ESC\fR or \fBBTN_LEFT\fR for the left
 mouse button.
+.SS Raw field
+If the protocol is \fBraw\fR, the \fBraw\fR field is an array of keycode
+to raw mapping. For each entry, there is a \fBkeycode\fR field and \fBraw\fR
+field. The \fBkeycode\fR is a linux input event, as explained the scancodes
+section.
+.PP
+The \fBraw\fR field is an array of integers. These are the pulse and space
+values of the IR message. The first is a pulse value in microseconds, and
+the second a space, third pulse, etc. There should be an odd number of fields
+so that the last entry is a pulse.
 .SS Remaining fields (BPF parameters)
 If the protocol is a BPF based decoder, it may have any number of numeric
 parameters. These parameters are used to support protocols with non-standard
-- 
2.21.0

