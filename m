Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43EC49CE15
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 13:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730918AbfHZLYg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 07:24:36 -0400
Received: from gofer.mess.org ([88.97.38.141]:52189 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727487AbfHZLYg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 07:24:36 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 6ADB460A6E; Mon, 26 Aug 2019 12:24:34 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils 2/2] ir-ctl: send keys based on keymap
Date:   Mon, 26 Aug 2019 12:24:34 +0100
Message-Id: <20190826112434.12586-2-sean@mess.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190826112434.12586-1-sean@mess.org>
References: <20190826112434.12586-1-sean@mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ir-ctl can now send keys based on rc keymaps. The keymap file must be
specified and the keys to be sent:

ir-ctl -k /lib/udev/rc_keymaps/hauppauge.toml -K KEY_VOLUMEUP

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/common/keymap.c    |  471 ++++++++++
 utils/common/keymap.h    |   39 +
 utils/common/toml.c      | 1903 +++++++++++++++++++++++++++++++++++++
 utils/common/toml.h      |  110 +++
 utils/ir-ctl/Makefile.am |    2 +-
 utils/ir-ctl/ir-ctl.1.in |   26 +-
 utils/ir-ctl/ir-ctl.c    |  126 ++-
 utils/ir-ctl/keymap.c    |    1 +
 utils/ir-ctl/keymap.h    |    1 +
 utils/ir-ctl/toml.c      |    1 +
 utils/ir-ctl/toml.h      |    1 +
 utils/keytable/keymap.c  |  460 +--------
 utils/keytable/keymap.h  |   39 +-
 utils/keytable/toml.c    | 1904 +-------------------------------------
 utils/keytable/toml.h    |  111 +--
 15 files changed, 2679 insertions(+), 2516 deletions(-)
 create mode 100644 utils/common/keymap.c
 create mode 100644 utils/common/keymap.h
 create mode 100644 utils/common/toml.c
 create mode 100644 utils/common/toml.h
 create mode 120000 utils/ir-ctl/keymap.c
 create mode 120000 utils/ir-ctl/keymap.h
 create mode 120000 utils/ir-ctl/toml.c
 create mode 120000 utils/ir-ctl/toml.h
 mode change 100644 => 120000 utils/keytable/keymap.c
 mode change 100644 => 120000 utils/keytable/keymap.h
 mode change 100644 => 120000 utils/keytable/toml.c
 mode change 100644 => 120000 utils/keytable/toml.h

diff --git a/utils/common/keymap.c b/utils/common/keymap.c
new file mode 100644
index 00000000..4e53201b
--- /dev/null
+++ b/utils/common/keymap.c
@@ -0,0 +1,471 @@
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
+						if (!map->protocol) {
+							map->protocol = strdup(p);
+						} else {
+							struct keymap *k;
+
+							k = calloc(1, sizeof(*k));
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
+		se->keycode = strdup(keycode);
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
+
+int keymap_param(struct keymap *map, const char *name, int fallback)
+{
+	struct protocol_param *param;
+
+	for (param = map->param; param; param = param->next) {
+		if (!strcmp(param->name, name))
+			return param->value;
+	}
+
+	return fallback;
+}
diff --git a/utils/common/keymap.h b/utils/common/keymap.h
new file mode 100644
index 00000000..bb4edec2
--- /dev/null
+++ b/utils/common/keymap.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __KEYMAP_H
+#define __KEYMAP_H
+
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
+struct raw_entry {
+	struct raw_entry *next;
+	u_int32_t scancode;
+	u_int32_t raw_length;
+	char *keycode;
+	u_int32_t raw[1];
+};
+
+void free_keymap(struct keymap *map);
+error_t parse_keyfile(char *fname, struct keymap **keymap, bool verbose);
+int keymap_param(struct keymap *map, const char *name, int fallback);
+
+#endif
diff --git a/utils/common/toml.c b/utils/common/toml.c
new file mode 100644
index 00000000..e4b57190
--- /dev/null
+++ b/utils/common/toml.c
@@ -0,0 +1,1903 @@
+/*
+MIT License
+
+Copyright (c) 2017 CK Tan 
+https://github.com/cktan/tomlc99
+
+Permission is hereby granted, free of charge, to any person obtaining a copy
+of this software and associated documentation files (the "Software"), to deal
+in the Software without restriction, including without limitation the rights
+to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+copies of the Software, and to permit persons to whom the Software is
+furnished to do so, subject to the following conditions:
+
+The above copyright notice and this permission notice shall be included in all
+copies or substantial portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+SOFTWARE.
+*/
+#define _POSIX_C_SOURCE 200809L
+#include <stdio.h>
+#include <setjmp.h>
+#include <stdlib.h>
+#include <assert.h>
+#include <errno.h>
+#include <stdint.h>
+#include <ctype.h>
+#include <string.h>
+#include "toml.h"
+
+#ifdef _WIN32
+char* strndup(const char* s, size_t n)
+{
+    size_t len = strnlen(s, n);
+    char* p = malloc(len+1);
+    if (p) {
+	memcpy(p, s, len);
+	p[len] = 0;
+    }
+    return p;
+}
+#endif
+
+
+/**
+ * Convert a char in utf8 into UCS, and store it in *ret.
+ * Return #bytes consumed or -1 on failure.
+ */
+int toml_utf8_to_ucs(const char* orig, int len, int64_t* ret)
+{
+    const unsigned char* buf = (const unsigned char*) orig;
+    unsigned i = *buf++;
+    int64_t v;
+    
+    /* 0x00000000 - 0x0000007F:
+       0xxxxxxx
+    */
+    if (0 == (i >> 7)) {
+	if (len < 1) return -1;
+	v = i;
+	return *ret = v, 1;
+    }
+    /* 0x00000080 - 0x000007FF:
+       110xxxxx 10xxxxxx
+    */
+    if (0x6 == (i >> 5)) {
+	if (len < 2) return -1;
+	v = i & 0x1f;
+	i = *(++buf);
+	if (0x2 != (i >> 6)) return -1;
+	v = (v << 6) | (i & 0x3f);
+	return *ret = v, (const char*) buf - orig;
+    }
+
+    /* 0x00000800 - 0x0000FFFF:
+       1110xxxx 10xxxxxx 10xxxxxx
+    */
+    if (0xE == (i >> 4)) {
+	if (len < 3) return -1;
+	v = i & 0x0F;
+	for (int j = 0; j < 2; j++) {
+	    i = *(++buf);
+	    if (0x2 != (i >> 6)) return -1;
+	    v = (v << 6) | (i & 0x3f);
+	}
+	return *ret = v, (const char*) buf - orig;
+    }
+
+    /* 0x00010000 - 0x001FFFFF:
+       11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
+    */
+    if (0x1E == (i >> 3)) {
+	if (len < 4) return -1;
+	v = i & 0x07;
+	for (int j = 0; j < 3; j++) {
+	    i = *(++buf);
+	    if (0x2 != (i >> 6)) return -1;
+	    v = (v << 6) | (i & 0x3f);
+	}
+	return *ret = v, (const char*) buf - orig;
+    }
+    
+    /* 0x00200000 - 0x03FFFFFF:
+       111110xx 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx
+    */
+    if (0x3E == (i >> 2)) {
+	if (len < 5) return -1;
+	v = i & 0x03;
+	for (int j = 0; j < 4; j++) {
+	    i = *(++buf);
+	    if (0x2 != (i >> 6)) return -1;
+	    v = (v << 6) | (i & 0x3f);
+	}
+	return *ret = v, (const char*) buf - orig;
+    }
+
+    /* 0x04000000 - 0x7FFFFFFF:
+       1111110x 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx
+    */
+    if (0x7e == (i >> 1)) {
+	if (len < 6) return -1;
+	v = i & 0x01;
+	for (int j = 0; j < 5; j++) {
+	    i = *(++buf);
+	    if (0x2 != (i >> 6)) return -1;
+	    v = (v << 6) | (i & 0x3f);
+	}
+	return *ret = v, (const char*) buf - orig;
+    }
+    return -1;
+}
+
+
+/**
+ *  Convert a UCS char to utf8 code, and return it in buf.
+ *  Return #bytes used in buf to encode the char, or 
+ *  -1 on error.
+ */
+int toml_ucs_to_utf8(int64_t code, char buf[6])
+{
+    /* http://stackoverflow.com/questions/6240055/manually-converting-unicode-codepoints-into-utf-8-and-utf-16 */
+    /* The UCS code values 0xd800–0xdfff (UTF-16 surrogates) as well
+     * as 0xfffe and 0xffff (UCS noncharacters) should not appear in
+     * conforming UTF-8 streams.
+     */
+    if (0xd800 <= code && code <= 0xdfff) return -1;
+    if (0xfffe <= code && code <= 0xffff) return -1;
+
+    /* 0x00000000 - 0x0000007F:
+       0xxxxxxx
+    */
+    if (code < 0) return -1;
+    if (code <= 0x7F) {
+	buf[0] = (unsigned char) code;
+	return 1;
+    }
+
+    /* 0x00000080 - 0x000007FF:
+       110xxxxx 10xxxxxx
+    */
+    if (code <= 0x000007FF) {
+	buf[0] = 0xc0 | (code >> 6);
+	buf[1] = 0x80 | (code & 0x3f);
+	return 2;
+    }
+
+    /* 0x00000800 - 0x0000FFFF:
+       1110xxxx 10xxxxxx 10xxxxxx
+    */
+    if (code <= 0x0000FFFF) {
+	buf[0] = 0xe0 | (code >> 12);
+	buf[1] = 0x80 | ((code >> 6) & 0x3f);
+	buf[2] = 0x80 | (code & 0x3f);
+	return 3;
+    }
+
+    /* 0x00010000 - 0x001FFFFF:
+       11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
+    */
+    if (code <= 0x001FFFFF) {
+	buf[0] = 0xf0 | (code >> 18);
+	buf[1] = 0x80 | ((code >> 12) & 0x3f);
+	buf[2] = 0x80 | ((code >> 6) & 0x3f);
+	buf[3] = 0x80 | (code & 0x3f);
+	return 4;
+    }
+
+    /* 0x00200000 - 0x03FFFFFF:
+       111110xx 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx
+    */
+    if (code <= 0x03FFFFFF) {
+	buf[0] = 0xf8 | (code >> 24);
+	buf[1] = 0x80 | ((code >> 18) & 0x3f);
+	buf[2] = 0x80 | ((code >> 12) & 0x3f);
+	buf[3] = 0x80 | ((code >> 6) & 0x3f);
+	buf[4] = 0x80 | (code & 0x3f);
+	return 5;
+    }
+    
+    /* 0x04000000 - 0x7FFFFFFF:
+       1111110x 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx
+    */
+    if (code <= 0x7FFFFFFF) {
+	buf[0] = 0xfc | (code >> 30);
+	buf[1] = 0x80 | ((code >> 24) & 0x3f);
+	buf[2] = 0x80 | ((code >> 18) & 0x3f);
+	buf[3] = 0x80 | ((code >> 12) & 0x3f);
+	buf[4] = 0x80 | ((code >> 6) & 0x3f);
+	buf[5] = 0x80 | (code & 0x3f);
+	return 6;
+    }
+
+    return -1;
+}
+
+/*
+ *  TOML has 3 data structures: value, array, table. 
+ *  Each of them can have identification key.
+ */
+typedef struct toml_keyval_t toml_keyval_t;
+struct toml_keyval_t {
+    const char* key;		/* key to this value */
+    const char* val;		/* the raw value */
+};
+
+
+struct toml_array_t {
+    const char* key;		/* key to this array */
+    int kind; /* element kind: 'v'alue, 'a'rray, or 't'able */
+    int type; /* for value kind: 'i'nt, 'd'ouble, 'b'ool, 's'tring, 't'ime, 'D'ate, 'T'imestamp */
+    
+    int nelem;			/* number of elements */
+    union {
+	char** val;
+	toml_array_t** arr;
+	toml_table_t** tab;
+    } u;
+};
+    
+
+struct toml_table_t {
+    const char* key;		/* key to this table */
+    int implicit;		/* table was created implicitly */
+
+    /* key-values in the table */
+    int             nkval;
+    toml_keyval_t** kval;
+
+    /* arrays in the table */
+    int            narr;
+    toml_array_t** arr;
+
+    /* tables in the table */
+    int            ntab;
+    toml_table_t** tab;
+};
+
+
+static inline void xfree(const void* x) { if (x) free((void*)x); }
+
+
+enum tokentype_t {
+    INVALID,
+    DOT,
+    COMMA,
+    EQUAL,
+    LBRACE,
+    RBRACE,
+    NEWLINE,
+    LBRACKET,
+    RBRACKET,
+    STRING,
+};
+typedef enum tokentype_t tokentype_t;
+
+typedef struct token_t token_t;
+struct token_t {
+    tokentype_t tok;
+    int         lineno;
+    char*       ptr;
+    int         len;
+    int         eof;
+};
+
+
+typedef struct context_t context_t;
+struct context_t {
+    char* start;
+    char* stop;
+    char* errbuf;
+    int   errbufsz;
+    jmp_buf jmp;
+
+    token_t tok;
+    toml_table_t* root;
+    toml_table_t* curtab;
+
+    struct {
+	int     top;
+	char*   key[10];
+	token_t tok[10];
+    } tpath;
+
+};
+
+#define STRINGIFY(x) #x
+#define TOSTRING(x)  STRINGIFY(x)
+#define FLINE __FILE__ ":" TOSTRING(__LINE__)
+
+static tokentype_t next_token(context_t* ctx, int dotisspecial);
+
+/* error routines. All these functions longjmp to ctx->jmp */
+static int e_outofmemory(context_t* ctx, const char* fline)
+{
+    snprintf(ctx->errbuf, ctx->errbufsz, "ERROR: out of memory (%s)", fline);
+    longjmp(ctx->jmp, 1);
+    return -1;
+}
+
+
+static int e_internal_error(context_t* ctx, const char* fline)
+{
+    snprintf(ctx->errbuf, ctx->errbufsz, "internal error (%s)", fline);
+    longjmp(ctx->jmp, 1);
+    return -1;
+}
+
+static int e_syntax_error(context_t* ctx, int lineno, const char* msg)
+{
+    snprintf(ctx->errbuf, ctx->errbufsz, "line %d: %s", lineno, msg);
+    longjmp(ctx->jmp, 1);
+    return -1;
+}
+
+static int e_bad_key_error(context_t* ctx, int lineno)
+{
+    snprintf(ctx->errbuf, ctx->errbufsz, "line %d: bad key", lineno);
+    longjmp(ctx->jmp, 1);
+    return -1;
+}
+
+/*
+static int e_noimpl(context_t* ctx, const char* feature)
+{
+    snprintf(ctx->errbuf, ctx->errbufsz, "not implemented: %s", feature);
+    longjmp(ctx->jmp, 1);
+    return -1;
+}
+*/
+
+static int e_key_exists_error(context_t* ctx, token_t keytok)
+{
+    char buf[100];
+    int i;
+    for (i = 0; i < keytok.len && i < (int)sizeof(buf) - 1; i++) {
+	buf[i] = keytok.ptr[i];
+    }
+    buf[i] = 0;
+
+    snprintf(ctx->errbuf, ctx->errbufsz,
+	     "line %d: key %s exists", keytok.lineno, buf);
+    longjmp(ctx->jmp, 1);
+    return -1;
+}
+
+
+
+/* 
+ * Convert src to raw unescaped utf-8 string.
+ * Returns NULL if error with errmsg in errbuf.
+ */
+static char* normalize_string(const char* src, int srclen,
+			      int kill_line_ending_backslash,
+			      char* errbuf, int errbufsz)
+{
+    char* dst = 0;		/* will write to dst[] and return it */
+    int   max = 0;		/* max size of dst[] */
+    int   off = 0;		/* cur offset in dst[] */
+    const char* sp = src;
+    const char* sq = src + srclen;
+    int ch;
+
+    /* scan forward on src */
+    for (;;) {
+	if (off >=  max - 10) { /* have some slack for misc stuff */
+	    char* x = realloc(dst, max += 100);
+	    if (!x) {
+		xfree(dst);
+		snprintf(errbuf, errbufsz, "out of memory");
+		return 0;
+	    }
+	    dst = x;
+	}
+	
+	/* finished? */
+	if (sp >= sq) break; 
+	
+	ch = *sp++;
+	if (ch != '\\') {
+	    // a plain copy suffice
+	    dst[off++] = ch;
+	    continue;
+	}
+
+	/* ch was backslash. we expect the escape char. */
+	if (sp >= sq) {
+	    snprintf(errbuf, errbufsz, "last backslash is invalid");
+	    free(dst);
+	    return 0;
+	}
+
+	/* if we want to kill line-ending-backslash ... */
+	if (kill_line_ending_backslash) {
+	    /* if this is a newline immediately following the backslash ... */
+	    if (*sp == '\n' || (*sp == '\r' && sp[1] == '\n')) {
+		/* skip all the following whitespaces */
+		sp += strspn(sp, " \t\r\n");
+		continue;
+	    }
+	}
+
+	/* get the escaped char */
+	ch = *sp++;
+	switch (ch) {
+	case 'u': case 'U':
+	    {
+		int64_t ucs = 0;
+		int nhex = (ch == 'u' ? 4 : 8);
+		for (int i = 0; i < nhex; i++) {
+		    if (sp >= sq) {
+			snprintf(errbuf, errbufsz, "\\%c expects %d hex chars", ch, nhex);
+			free(dst);
+			return 0;
+		    }
+		    ch = *sp++;
+		    int v = ('0' <= ch && ch <= '9')
+			? ch - '0'
+			: (('A' <= ch && ch <= 'F') ? ch - 'A' + 10 : -1);
+		    if (-1 == v) {
+			snprintf(errbuf, errbufsz, "invalid hex chars for \\u or \\U");
+			free(dst);
+			return 0;
+		    }
+		    ucs = ucs * 16 + v;
+		}
+		int n = toml_ucs_to_utf8(ucs, &dst[off]);
+		if (-1 == n) {
+		    snprintf(errbuf, errbufsz, "illegal ucs code in \\u or \\U");
+		    free(dst);
+		    return 0;
+		}
+		off += n;
+	    }
+	    continue;
+
+	case 'b': ch = '\b'; break;
+	case 't': ch = '\t'; break;
+	case 'n': ch = '\n'; break;
+	case 'f': ch = '\f'; break;
+	case 'r': ch = '\r'; break;
+	case '"':  ch = '"'; break;
+	case '\\': ch = '\\'; break;
+	default: 
+	    snprintf(errbuf, errbufsz, "illegal escape char \\%c", ch);
+	    free(dst);
+	    return 0;
+	}
+
+	dst[off++] = ch;
+    }
+
+    // Cap with NUL and return it.
+    dst[off++] = 0; 
+    return dst;
+}
+
+
+/* Normalize a key. Convert all special chars to raw unescaped utf-8 chars. */
+static char* normalize_key(context_t* ctx, token_t strtok)
+{
+    const char* sp = strtok.ptr;
+    const char* sq = strtok.ptr + strtok.len;
+    int lineno = strtok.lineno;
+    char* ret;
+    int ch = *sp;
+    char ebuf[80];
+
+    /* handle quoted string */
+    if (ch == '\'' || ch == '\"') {
+	/* if ''' or """, take 3 chars off front and back. Else, take 1 char off. */
+	if (sp[1] == ch && sp[2] == ch) 
+	    sp += 3, sq -= 3;
+	else
+	    sp++, sq--;
+
+	if (ch == '\'') {
+	    /* for single quote, take it verbatim. */
+	    if (! (ret = strndup(sp, sq - sp))) {
+                e_outofmemory(ctx, FLINE);
+                return 0;       /* not reached */
+            }
+	} else {
+	    /* for double quote, we need to normalize */
+	    ret = normalize_string(sp, sq - sp, 0, ebuf, sizeof(ebuf));
+	    if (!ret) {
+		snprintf(ctx->errbuf, ctx->errbufsz, "line %d: %s", lineno, ebuf);
+		longjmp(ctx->jmp, 1);
+	    }
+	}
+
+	/* newlines are not allowed in keys */
+	if (strchr(ret, '\n')) {
+	    free(ret);
+	    e_bad_key_error(ctx, lineno);
+            return 0;           /* not reached */
+	}
+	return ret;
+    }
+	
+    /* for bare-key allow only this regex: [A-Za-z0-9_-]+ */
+    const char* xp;
+    for (xp = sp; xp != sq; xp++) {
+	int k = *xp;
+	if (isalnum(k)) continue;
+	if (k == '_' || k == '-') continue;
+	e_bad_key_error(ctx, lineno);
+        return 0;               /* not reached */
+    }
+
+    /* dup and return it */
+    if (! (ret = strndup(sp, sq - sp))) {
+        e_outofmemory(ctx, FLINE);
+        return 0;               /* not reached */
+    }
+    return ret;
+}
+
+
+/* 
+ * Look up key in tab. Return 0 if not found, or
+ * 'v'alue, 'a'rray or 't'able depending on the element.
+ */
+static int check_key(toml_table_t* tab, const char* key,
+		     toml_keyval_t** ret_val,
+		     toml_array_t** ret_arr,
+		     toml_table_t** ret_tab)
+{
+    int i;
+    void* dummy;
+
+    if (!ret_tab) ret_tab = (toml_table_t**) &dummy;
+    if (!ret_arr) ret_arr = (toml_array_t**) &dummy;
+    if (!ret_val) ret_val = (toml_keyval_t**) &dummy;
+
+    *ret_tab = 0; *ret_arr = 0; *ret_val = 0;
+    
+    for (i = 0; i < tab->nkval; i++) {
+	if (0 == strcmp(key, tab->kval[i]->key)) {
+	    *ret_val = tab->kval[i];
+	    return 'v';
+	}
+    }
+    for (i = 0; i < tab->narr; i++) {
+	if (0 == strcmp(key, tab->arr[i]->key)) {
+	    *ret_arr = tab->arr[i];
+	    return 'a';
+	}
+    }
+    for (i = 0; i < tab->ntab; i++) {
+	if (0 == strcmp(key, tab->tab[i]->key)) {
+	    *ret_tab = tab->tab[i];
+	    return 't';
+	}
+    }
+    return 0;
+}
+
+/* Create a keyval in the table. 
+ */
+static toml_keyval_t* create_keyval_in_table(context_t* ctx, toml_table_t* tab, token_t keytok)
+{
+    /* first, normalize the key to be used for lookup. 
+     * remember to free it if we error out. 
+     */
+    char* newkey = normalize_key(ctx, keytok);
+
+    /* if key exists: error out. */
+    toml_keyval_t* dest = 0;
+    if (check_key(tab, newkey, 0, 0, 0)) {
+	free(newkey);
+	e_key_exists_error(ctx, keytok);
+        return 0;               /* not reached */
+    }
+
+    /* make a new entry */
+    int n = tab->nkval;
+    toml_keyval_t** base;
+    if (0 == (base = (toml_keyval_t**) realloc(tab->kval, (n+1) * sizeof(*base)))) {
+	free(newkey);
+	e_outofmemory(ctx, FLINE);
+        return 0;               /* not reached */
+    }
+    tab->kval = base;
+    
+    if (0 == (base[n] = (toml_keyval_t*) calloc(1, sizeof(*base[n])))) {
+	free(newkey);
+	e_outofmemory(ctx, FLINE);
+        return 0;               /* not reached */
+    }
+    dest = tab->kval[tab->nkval++];
+
+    /* save the key in the new value struct */
+    dest->key = newkey;
+    return dest;
+}
+
+
+/* Create a table in the table.
+ */
+static toml_table_t* create_keytable_in_table(context_t* ctx, toml_table_t* tab, token_t keytok)
+{
+    /* first, normalize the key to be used for lookup. 
+     * remember to free it if we error out. 
+     */
+    char* newkey = normalize_key(ctx, keytok);
+
+    /* if key exists: error out */
+    toml_table_t* dest = 0;
+    if (check_key(tab, newkey, 0, 0, &dest)) {
+	free(newkey);		/* don't need this anymore */
+	
+	/* special case: if table exists, but was created implicitly ... */
+	if (dest && dest->implicit) {
+	    /* we make it explicit now, and simply return it. */
+	    dest->implicit = 0;
+	    return dest;
+	}
+	e_key_exists_error(ctx, keytok);
+        return 0;               /* not reached */
+    }
+
+    /* create a new table entry */
+    int n = tab->ntab;
+    toml_table_t** base;
+    if (0 == (base = (toml_table_t**) realloc(tab->tab, (n+1) * sizeof(*base)))) {
+	free(newkey);
+	e_outofmemory(ctx, FLINE);
+        return 0;               /* not reached */
+    }
+    tab->tab = base;
+	
+    if (0 == (base[n] = (toml_table_t*) calloc(1, sizeof(*base[n])))) {
+	free(newkey);
+	e_outofmemory(ctx, FLINE);
+        return 0;               /* not reached */
+    }
+    dest = tab->tab[tab->ntab++];
+    
+    /* save the key in the new table struct */
+    dest->key = newkey;
+    return dest;
+}
+
+
+/* Create an array in the table.
+ */
+static toml_array_t* create_keyarray_in_table(context_t* ctx,
+					      toml_table_t* tab,
+					      token_t keytok,
+					      int skip_if_exist)
+{
+    /* first, normalize the key to be used for lookup. 
+     * remember to free it if we error out. 
+     */
+    char* newkey = normalize_key(ctx, keytok);
+    
+    /* if key exists: error out */
+    toml_array_t* dest = 0;
+    if (check_key(tab, newkey, 0, &dest, 0)) {
+	free(newkey); 		/* don't need this anymore */
+
+	/* special case skip if exists? */
+	if (skip_if_exist) return dest;
+	
+	e_key_exists_error(ctx, keytok);
+        return 0;               /* not reached */
+    }
+
+    /* make a new array entry */
+    int n = tab->narr;
+    toml_array_t** base;
+    if (0 == (base = (toml_array_t**) realloc(tab->arr, (n+1) * sizeof(*base)))) {
+	free(newkey);
+	e_outofmemory(ctx, FLINE);
+        return 0;               /* not reached */
+    }
+    tab->arr = base;
+	
+    if (0 == (base[n] = (toml_array_t*) calloc(1, sizeof(*base[n])))) {
+	free(newkey);
+	e_outofmemory(ctx, FLINE);
+        return 0;               /* not reached */
+    }
+    dest = tab->arr[tab->narr++];
+
+    /* save the key in the new array struct */
+    dest->key = newkey;
+    return dest;
+}
+
+/* Create an array in an array 
+ */
+static toml_array_t* create_array_in_array(context_t* ctx,
+					   toml_array_t* parent)
+{
+    int n = parent->nelem;
+    toml_array_t** base;
+    if (0 == (base = (toml_array_t**) realloc(parent->u.arr, (n+1) * sizeof(*base)))) {
+	e_outofmemory(ctx, FLINE);
+        return 0;               /* not reached */
+    }
+    parent->u.arr = base;
+    
+    if (0 == (base[n] = (toml_array_t*) calloc(1, sizeof(*base[n])))) {
+	e_outofmemory(ctx, FLINE);
+        return 0;               /* not reached */
+    }
+
+    return parent->u.arr[parent->nelem++];
+}
+
+/* Create a table in an array 
+ */
+static toml_table_t* create_table_in_array(context_t* ctx,
+					   toml_array_t* parent)
+{
+    int n = parent->nelem;
+    toml_table_t** base;
+    if (0 == (base = (toml_table_t**) realloc(parent->u.tab, (n+1) * sizeof(*base)))) {
+	e_outofmemory(ctx, FLINE);
+        return 0;               /* not reached */
+    }
+    parent->u.tab = base;
+    
+    if (0 == (base[n] = (toml_table_t*) calloc(1, sizeof(*base[n])))) {
+	e_outofmemory(ctx, FLINE);
+        return 0;               /* not reached */
+    }
+
+    return parent->u.tab[parent->nelem++];
+}
+
+
+#define SKIP_NEWLINES(ctx)  while (ctx->tok.tok == NEWLINE) next_token(ctx, 0)
+#define EAT_TOKEN(ctx, typ) \
+    if ((ctx)->tok.tok != typ) e_internal_error(ctx, FLINE); else next_token(ctx, 0)
+
+
+static void parse_keyval(context_t* ctx, toml_table_t* tab);
+
+
+/* We are at '{ ... }'.
+ * Parse the table.
+ */
+static void parse_table(context_t* ctx, toml_table_t* tab)
+{
+    EAT_TOKEN(ctx, LBRACE);
+
+    for (;;) {
+	SKIP_NEWLINES(ctx);
+
+	/* until } */
+	if (ctx->tok.tok == RBRACE) break;
+
+	if (ctx->tok.tok != STRING) {
+            e_syntax_error(ctx, ctx->tok.lineno, "syntax error");
+            return;             /* not reached */
+	}
+        parse_keyval(ctx, tab);
+	SKIP_NEWLINES(ctx);
+
+	/* on comma, continue to scan for next keyval */
+	if (ctx->tok.tok == COMMA) {
+	    EAT_TOKEN(ctx, COMMA);
+	    continue;
+	}
+	break;
+    }
+
+    if (ctx->tok.tok != RBRACE) {
+	e_syntax_error(ctx, ctx->tok.lineno, "syntax error");
+        return;                 /* not reached */
+    }
+
+    EAT_TOKEN(ctx, RBRACE);
+}
+
+static int valtype(const char* val)
+{
+    toml_timestamp_t ts;
+    if (*val == '\'' || *val == '"') return 's';
+    if (0 == toml_rtob(val, 0)) return 'b';
+    if (0 == toml_rtoi(val, 0)) return 'i';
+    if (0 == toml_rtod(val, 0)) return 'd';
+    if (0 == toml_rtots(val, &ts)) {
+	if (ts.year && ts.hour) return 'T'; /* timestamp */
+	if (ts.year) return 'D'; /* date */
+	return 't'; /* time */
+    }
+    return 'u'; /* unknown */
+}
+
+
+/* We are at '[...]' */
+static void parse_array(context_t* ctx, toml_array_t* arr)
+{
+    EAT_TOKEN(ctx, LBRACKET);
+
+    for (;;) {
+	SKIP_NEWLINES(ctx);
+	
+	/* until ] */
+	if (ctx->tok.tok == RBRACKET) break;
+
+	switch (ctx->tok.tok) {
+	case STRING:
+	    {
+		char* val = ctx->tok.ptr;
+		int   vlen = ctx->tok.len;
+
+		/* set array kind if this will be the first entry */
+		if (arr->kind == 0) arr->kind = 'v';
+		/* check array kind */
+		if (arr->kind != 'v') {
+		    e_syntax_error(ctx, ctx->tok.lineno,
+                                   "a string array can only contain strings");
+                    return;     /* not reached */
+		}
+
+		/* make a new value in array */
+		char** tmp = (char**) realloc(arr->u.val, (arr->nelem+1) * sizeof(*tmp));
+		if (!tmp) {
+                    e_outofmemory(ctx, FLINE);
+                    return;     /* not reached */
+                }
+		arr->u.val = tmp;
+		if (! (val = strndup(val, vlen))) {
+                    e_outofmemory(ctx, FLINE);
+                    return;     /* not reached */
+                }
+		arr->u.val[arr->nelem++] = val;
+
+		/* set array type if this is the first entry, or check that the types matched. */
+		if (arr->nelem == 1) 
+		    arr->type = valtype(arr->u.val[0]);
+		else if (arr->type != valtype(val)) {
+		    e_syntax_error(ctx, ctx->tok.lineno, "array type mismatch");
+                    return;     /* not reached */
+                }
+
+		EAT_TOKEN(ctx, STRING);
+		break;
+	    }
+
+	case LBRACKET:
+	    { /* [ [array], [array] ... ] */
+		/* set the array kind if this will be the first entry */
+		if (arr->kind == 0) arr->kind = 'a';
+		/* check array kind */
+		if (arr->kind != 'a') {
+		    e_syntax_error(ctx, ctx->tok.lineno, "array type mismatch");
+                    return;     /* not reached */
+		}
+		parse_array(ctx, create_array_in_array(ctx, arr));
+		break;
+	    }
+
+	case LBRACE:
+	    { /* [ {table}, {table} ... ] */
+		/* set the array kind if this will be the first entry */
+		if (arr->kind == 0) arr->kind = 't';
+		/* check array kind */
+		if (arr->kind != 't') {
+		    e_syntax_error(ctx, ctx->tok.lineno, "array type mismatch");
+                    return;     /* not reached */
+		}
+		parse_table(ctx, create_table_in_array(ctx, arr));
+		break;
+	    }
+	    
+	default:
+	    e_syntax_error(ctx, ctx->tok.lineno, "syntax error");
+            return;             /* not reached */
+	}
+
+	SKIP_NEWLINES(ctx);
+
+	/* on comma, continue to scan for next element */
+	if (ctx->tok.tok == COMMA) {
+	    EAT_TOKEN(ctx, COMMA);
+	    continue;
+	}
+	break;
+    }
+
+    if (ctx->tok.tok != RBRACKET) {
+	e_syntax_error(ctx, ctx->tok.lineno, "syntax error");
+        return;                 /* not reached */
+    }
+
+    EAT_TOKEN(ctx, RBRACKET);
+}
+
+
+
+/* handle lines like these:
+    key = "value"
+    key = [ array ]
+    key = { table }
+*/
+static void parse_keyval(context_t* ctx, toml_table_t* tab)
+{
+    if (ctx->tok.tok != STRING) {
+	e_internal_error(ctx, FLINE);
+        return;                 /* not reached */
+    }
+
+    token_t key = ctx->tok;
+
+    EAT_TOKEN(ctx, STRING);
+    if (ctx->tok.tok != EQUAL) {
+	e_syntax_error(ctx, ctx->tok.lineno, "missing =");
+        return;                 /* not reached */
+    }
+
+    EAT_TOKEN(ctx, EQUAL);
+
+    switch (ctx->tok.tok) {
+    case STRING:
+	{ /* key = "value" */
+	    toml_keyval_t* keyval = create_keyval_in_table(ctx, tab, key);
+	    token_t val = ctx->tok;
+	    assert(keyval->val == 0);
+	    keyval->val = strndup(val.ptr, val.len);
+	    if (! keyval->val) {
+                e_outofmemory(ctx, FLINE);
+                return;         /* not reached */
+            }
+
+	    EAT_TOKEN(ctx, STRING);
+	    
+	    return;
+	}
+
+    case LBRACKET:
+	{ /* key = [ array ] */
+	    toml_array_t* arr = create_keyarray_in_table(ctx, tab, key, 0);
+	    parse_array(ctx, arr);
+	    return;
+	}
+
+    case LBRACE:
+	{ /* key = { table } */
+	    toml_table_t* nxttab = create_keytable_in_table(ctx, tab, key);
+	    parse_table(ctx, nxttab);
+	    return;
+	}
+
+    default:
+	e_syntax_error(ctx, ctx->tok.lineno, "syntax error");
+        return;                 /* not reached */
+    }
+}
+
+
+typedef struct tabpath_t tabpath_t;
+struct tabpath_t {
+    int     cnt;
+    token_t key[10];
+};
+
+/* at [x.y.z] or [[x.y.z]]
+ * Scan forward and fill tabpath until it enters ] or ]]
+ * There will be at least one entry on return.
+ */
+static void fill_tabpath(context_t* ctx)
+{
+    int lineno = ctx->tok.lineno;
+    int i;
+    
+    /* clear tpath */
+    for (i = 0; i < ctx->tpath.top; i++) {
+	char** p = &ctx->tpath.key[i];
+	xfree(*p);
+	*p = 0;
+    }
+    ctx->tpath.top = 0;
+    
+    for (;;) {
+	if (ctx->tpath.top >= 10) {
+	    e_syntax_error(ctx, lineno, "table path is too deep; max allowed is 10.");
+            return;             /* not reached */
+        }
+
+	if (ctx->tok.tok != STRING) {
+	    e_syntax_error(ctx, lineno, "invalid or missing key");
+            return;             /* not reached */
+        }
+
+	ctx->tpath.tok[ctx->tpath.top] = ctx->tok;
+	ctx->tpath.key[ctx->tpath.top] = normalize_key(ctx, ctx->tok);
+	ctx->tpath.top++;
+	
+	next_token(ctx, 1);
+
+	if (ctx->tok.tok == RBRACKET) break;
+
+	if (ctx->tok.tok != DOT) {
+	    e_syntax_error(ctx, lineno, "invalid key");
+            return;             /* not reached */
+        }
+
+	next_token(ctx, 1);
+    }
+
+    if (ctx->tpath.top <= 0) {
+	e_syntax_error(ctx, lineno, "empty table selector");
+        return;                 /* not reached */
+    }
+}
+
+
+/* Walk tabpath from the root, and create new tables on the way.
+ * Sets ctx->curtab to the final table.
+ */
+static void walk_tabpath(context_t* ctx)
+{
+    /* start from root */
+    toml_table_t* curtab = ctx->root;
+    
+    for (int i = 0; i < ctx->tpath.top; i++) {
+	const char* key = ctx->tpath.key[i];
+
+	toml_keyval_t* nextval = 0;
+	toml_array_t* nextarr = 0;
+	toml_table_t* nexttab = 0;
+	switch (check_key(curtab, key, &nextval, &nextarr, &nexttab)) {
+	case 't':
+	    /* found a table. nexttab is where we will go next. */
+	    break;
+
+	case 'a':
+	    /* found an array. nexttab is the last table in the array. */
+	    if (nextarr->kind != 't') {
+                e_internal_error(ctx, FLINE);
+                return;         /* not reached */
+            }
+	    if (nextarr->nelem == 0) {
+                e_internal_error(ctx, FLINE);
+                return;         /* not reached */
+            }
+	    nexttab = nextarr->u.tab[nextarr->nelem-1];
+	    break;
+
+	case 'v':
+	    e_key_exists_error(ctx, ctx->tpath.tok[i]);
+            return;             /* not reached */
+
+	default:
+	    { /* Not found. Let's create an implicit table. */
+		int n = curtab->ntab;
+		toml_table_t** base = (toml_table_t**) realloc(curtab->tab, (n+1) * sizeof(*base));
+		if (0 == base) {
+                    e_outofmemory(ctx, FLINE);
+                    return;     /* not reached */
+                }
+		curtab->tab = base;
+		
+		if (0 == (base[n] = (toml_table_t*) calloc(1, sizeof(*base[n])))) {
+		    e_outofmemory(ctx, FLINE);
+                    return;     /* not reached */
+                }
+		
+		if (0 == (base[n]->key = strdup(key))) {
+		    e_outofmemory(ctx, FLINE);
+                    return;     /* not reached */
+                }
+		
+		nexttab = curtab->tab[curtab->ntab++];
+		
+		/* tabs created by walk_tabpath are considered implicit */
+		nexttab->implicit = 1;
+	    }
+	    break;
+	}
+
+	/* switch to next tab */
+	curtab = nexttab;
+    }
+
+    /* save it */
+    ctx->curtab = curtab;
+}
+
+    
+/* handle lines like [x.y.z] or [[x.y.z]] */
+static void parse_select(context_t* ctx)
+{
+    int count_lbracket = 0;
+    if (ctx->tok.tok != LBRACKET) {
+        e_internal_error(ctx, FLINE);
+        return;                 /* not reached */
+    }
+    count_lbracket++;
+    next_token(ctx, 1 /* DOT IS SPECIAL */);
+    if (ctx->tok.tok == LBRACKET) {
+	count_lbracket++;
+	next_token(ctx, 1 /* DOT IS SPECIAL */);
+    }
+
+    fill_tabpath(ctx);
+
+    /* For [x.y.z] or [[x.y.z]], remove z from tpath. 
+     */
+    token_t z = ctx->tpath.tok[ctx->tpath.top-1];
+    free(ctx->tpath.key[ctx->tpath.top-1]);
+    ctx->tpath.top--;
+    
+    walk_tabpath(ctx);
+
+    if (count_lbracket == 1) {
+	/* [x.y.z] -> create z = {} in x.y */
+	ctx->curtab = create_keytable_in_table(ctx, ctx->curtab, z);
+    } else {
+	/* [[x.y.z]] -> create z = [] in x.y */
+	toml_array_t* arr = create_keyarray_in_table(ctx, ctx->curtab, z,
+						     1 /*skip_if_exist*/);
+        if (!arr) {
+            e_syntax_error(ctx, z.lineno, "key exists");
+            return;
+        }
+	if (arr->kind == 0) arr->kind = 't';
+	if (arr->kind != 't') {
+            e_syntax_error(ctx, z.lineno, "array mismatch");
+            return;             /* not reached */
+        }
+
+	/* add to z[] */
+	toml_table_t* dest;
+	{
+	    int n = arr->nelem;
+	    toml_table_t** base = realloc(arr->u.tab, (n+1) * sizeof(*base));
+	    if (0 == base) {
+                e_outofmemory(ctx, FLINE);
+                return;         /* not reached */
+            }
+	    arr->u.tab = base;
+	    
+	    if (0 == (base[n] = calloc(1, sizeof(*base[n])))) {
+		e_outofmemory(ctx, FLINE);
+                return;         /* not reached */
+            }
+	    
+            if (0 == (base[n]->key = strdup("__anon__"))) {
+		e_outofmemory(ctx, FLINE);
+                return;         /* not reached */
+            }
+	    
+	    dest = arr->u.tab[arr->nelem++];
+	}
+
+	ctx->curtab = dest;
+    }
+
+    if (ctx->tok.tok != RBRACKET) {
+        e_syntax_error(ctx, ctx->tok.lineno, "expects ]");
+        return;                 /* not reached */
+    }
+    EAT_TOKEN(ctx, RBRACKET);
+
+    if (count_lbracket == 2) {
+	if (ctx->tok.tok != RBRACKET) {
+            e_syntax_error(ctx, ctx->tok.lineno, "expects ]]");
+            return;             /* not reached */
+        }
+	EAT_TOKEN(ctx, RBRACKET);
+    }
+    if (ctx->tok.tok != NEWLINE) {
+        e_syntax_error(ctx, ctx->tok.lineno, "extra chars after ] or ]]");
+        return;                 /* not reached */
+    }
+}
+
+
+
+
+toml_table_t* toml_parse(char* conf,
+			 char* errbuf,
+			 int errbufsz)
+{
+    context_t ctx;
+
+    // clear errbuf 
+    if (errbufsz <= 0) errbufsz = 0;
+    if (errbufsz > 0)  errbuf[0] = 0;
+
+    // init context 
+    memset(&ctx, 0, sizeof(ctx));
+    ctx.start = conf;
+    ctx.stop = ctx.start + strlen(conf);
+    ctx.errbuf = errbuf;
+    ctx.errbufsz = errbufsz;
+
+    // start with an artificial newline of length 0
+    ctx.tok.tok = NEWLINE; 
+    ctx.tok.lineno = 1;
+    ctx.tok.ptr = conf;
+    ctx.tok.len = 0;
+
+    // make a root table
+    if (0 == (ctx.root = calloc(1, sizeof(*ctx.root)))) {
+        /* do not call outofmemory() here... setjmp not done yet */
+        snprintf(ctx.errbuf, ctx.errbufsz, "ERROR: out of memory (%s)", FLINE);
+        return 0;
+    }
+
+    // set root as default table
+    ctx.curtab = ctx.root;
+
+    if (0 != setjmp(ctx.jmp)) {
+	// Got here from a long_jmp. Something bad has happened.
+	// Free resources and return error.
+	for (int i = 0; i < ctx.tpath.top; i++) xfree(ctx.tpath.key[i]);
+	toml_free(ctx.root);
+	return 0;
+    }
+
+    /* Scan forward until EOF */
+    for (token_t tok = ctx.tok; ! tok.eof ; tok = ctx.tok) {
+	switch (tok.tok) {
+	    
+	case NEWLINE:
+	    next_token(&ctx, 1);
+	    break;
+	    
+	case STRING:
+	    parse_keyval(&ctx, ctx.curtab);
+	    if (ctx.tok.tok != NEWLINE) {
+                e_syntax_error(&ctx, ctx.tok.lineno, "extra chars after value");
+                return 0;         /* not reached */
+            }
+
+	    EAT_TOKEN(&ctx, NEWLINE);
+	    break;
+	    
+	case LBRACKET:  /* [ x.y.z ] or [[ x.y.z ]] */
+	    parse_select(&ctx);
+	    break;
+	    
+	default:
+	    snprintf(ctx.errbuf, ctx.errbufsz, "line %d: syntax error", tok.lineno);
+	    longjmp(ctx.jmp, 1);
+	}
+    }
+
+    /* success */
+    for (int i = 0; i < ctx.tpath.top; i++) xfree(ctx.tpath.key[i]);
+    return ctx.root;
+}
+
+
+toml_table_t* toml_parse_file(FILE* fp,
+			      char* errbuf,
+			      int errbufsz)
+{
+    int bufsz = 0;
+    char* buf = 0;
+    int off = 0;
+
+    /* prime the buf[] */
+    bufsz = 1000;
+    if (! (buf = malloc(bufsz + 1))) {
+        snprintf(errbuf, errbufsz, "out of memory");
+        return 0;
+    }
+
+    /* read from fp into buf */
+    while (! feof(fp)) {
+	bufsz += 1000;
+	
+	/* Allocate 1 extra byte because we will tag on a NUL */
+	char* x = realloc(buf, bufsz + 1);
+	if (!x) {
+	    snprintf(errbuf, errbufsz, "out of memory");
+	    xfree(buf);
+	    return 0;
+	}
+	buf = x;
+
+	errno = 0;
+	int n = fread(buf + off, 1, bufsz - off, fp);
+	if (ferror(fp)) {
+	    snprintf(errbuf, errbufsz, "%s",
+		     errno ? strerror(errno) : "Error reading file");
+	    free(buf);
+	    return 0;
+	}
+	off += n;
+    }
+
+    /* tag on a NUL to cap the string */
+    buf[off] = 0; /* we accounted for this byte in the realloc() above. */
+
+    /* parse it, cleanup and finish */
+    toml_table_t* ret = toml_parse(buf, errbuf, errbufsz);
+    free(buf);
+    return ret;
+}
+
+
+static void xfree_kval(toml_keyval_t* p)
+{
+    if (!p) return;
+    xfree(p->key);
+    xfree(p->val);
+    xfree(p);
+}
+
+static void xfree_tab(toml_table_t* p);
+
+static void xfree_arr(toml_array_t* p)
+{
+    if (!p) return;
+
+    xfree(p->key);
+    switch (p->kind) {
+    case 'v':
+	for (int i = 0; i < p->nelem; i++) xfree(p->u.val[i]);
+	xfree(p->u.val);
+	break;
+
+    case 'a':
+	for (int i = 0; i < p->nelem; i++) xfree_arr(p->u.arr[i]);
+	xfree(p->u.arr);
+	break;
+
+    case 't':
+	for (int i = 0; i < p->nelem; i++) xfree_tab(p->u.tab[i]);
+	xfree(p->u.tab);
+	break;
+    }
+
+    xfree(p);
+}
+
+
+static void xfree_tab(toml_table_t* p)
+{
+    int i;
+    
+    if (!p) return;
+    
+    xfree(p->key);
+    
+    for (i = 0; i < p->nkval; i++) xfree_kval(p->kval[i]);
+    xfree(p->kval);
+
+    for (i = 0; i < p->narr; i++) xfree_arr(p->arr[i]);
+    xfree(p->arr);
+
+    for (i = 0; i < p->ntab; i++) xfree_tab(p->tab[i]);
+    xfree(p->tab);
+
+    xfree(p);
+}
+
+
+void toml_free(toml_table_t* tab)
+{
+    xfree_tab(tab);
+}
+
+
+static tokentype_t ret_token(context_t* ctx, tokentype_t tok, int lineno, char* ptr, int len)
+{
+    token_t t;
+    t.tok = tok;
+    t.lineno = lineno;
+    t.ptr = ptr;
+    t.len = len;
+    t.eof = 0;
+    ctx->tok = t;
+    return tok;
+}
+
+static tokentype_t ret_eof(context_t* ctx, int lineno)
+{
+    ret_token(ctx, NEWLINE, lineno, ctx->stop, 0);
+    ctx->tok.eof = 1;
+    return ctx->tok.tok;
+}
+    
+
+static tokentype_t scan_string(context_t* ctx, char* p, int lineno, int dotisspecial)
+{
+    char* orig = p;
+    if (0 == strncmp(p, "'''", 3)) {
+	p = strstr(p + 3, "'''");
+	if (0 == p) {
+	    e_syntax_error(ctx, lineno, "unterminated triple-s-quote");
+            return 0;           /* not reached */
+        }
+
+	return ret_token(ctx, STRING, lineno, orig, p + 3 - orig);
+    }
+
+    if (0 == strncmp(p, "\"\"\"", 3)) {
+	int hexreq = 0;		/* #hex required */
+	int escape = 0;
+	int qcnt = 0;		/* count quote */
+	for (p += 3; *p && qcnt < 3; p++) {
+	    if (escape) {
+		escape = 0;
+		if (strchr("btnfr\"\\", *p)) continue;
+		if (*p == 'u') { hexreq = 4; continue; }
+		if (*p == 'U') { hexreq = 8; continue; }
+		if (*p == '\n') continue; /* allow for line ending backslash */
+		e_syntax_error(ctx, lineno, "bad escape char");
+                return 0;       /* not reached */
+	    }
+	    if (hexreq) {
+		hexreq--;
+		if (strchr("0123456789ABCDEF", *p)) continue;
+		e_syntax_error(ctx, lineno, "expect hex char");
+                return 0;       /* not reached */
+	    }
+	    if (*p == '\\') { escape = 1; continue; }
+	    qcnt = (*p == '"') ? qcnt + 1 : 0; 
+	}
+	if (qcnt != 3) {
+	    e_syntax_error(ctx, lineno, "unterminated triple-quote");
+            return 0;           /* not reached */
+        }
+
+	return ret_token(ctx, STRING, lineno, orig, p - orig);
+    }
+
+    if ('\'' == *p) {
+	for (p++; *p && *p != '\n' && *p != '\''; p++);
+	if (*p != '\'') {
+	    e_syntax_error(ctx, lineno, "unterminated s-quote");
+            return 0;           /* not reached */
+        }
+
+	return ret_token(ctx, STRING, lineno, orig, p + 1 - orig);
+    }
+
+    if ('\"' == *p) {
+	int hexreq = 0;		/* #hex required */
+	int escape = 0;
+	for (p++; *p; p++) {
+	    if (escape) {
+		escape = 0;
+		if (strchr("btnfr\"\\", *p)) continue;
+		if (*p == 'u') { hexreq = 4; continue; }
+		if (*p == 'U') { hexreq = 8; continue; }
+		e_syntax_error(ctx, lineno, "bad escape char");
+                return 0;       /* not reached */
+	    }
+	    if (hexreq) {
+		hexreq--;
+		if (strchr("0123456789ABCDEF", *p)) continue;
+		e_syntax_error(ctx, lineno, "expect hex char");
+                return 0;       /* not reached */
+	    }
+	    if (*p == '\\') { escape = 1; continue; }
+	    if (*p == '\n') break;
+	    if (*p == '"') break;
+	}
+	if (*p != '"') {
+	    e_syntax_error(ctx, lineno, "unterminated quote");
+            return 0;           /* not reached */
+        }
+
+	return ret_token(ctx, STRING, lineno, orig, p + 1 - orig);
+    }
+
+    for ( ; *p && *p != '\n'; p++) {
+	int ch = *p;
+	if (ch == '.' && dotisspecial) break;
+	if ('A' <= ch && ch <= 'Z') continue;
+	if ('a' <= ch && ch <= 'z') continue;
+	if ('0' <= ch && ch <= '9') continue;
+	if (strchr("+-_.:", ch)) continue;
+	break;
+    }
+
+    return ret_token(ctx, STRING, lineno, orig, p - orig);
+}
+
+
+static tokentype_t next_token(context_t* ctx, int dotisspecial)
+{
+    int   lineno = ctx->tok.lineno;
+    char* p = ctx->tok.ptr;
+    int i;
+
+    /* eat this tok */
+    for (i = 0; i < ctx->tok.len; i++) {
+	if (*p++ == '\n')
+	    lineno++;
+    }
+
+    /* make next tok */
+    while (p < ctx->stop) {
+	/* skip comment. stop just before the \n. */
+	if (*p == '#') {
+	    for (p++; p < ctx->stop && *p != '\n'; p++);
+	    continue;
+	}
+
+	if (dotisspecial && *p == '.')
+	    return ret_token(ctx, DOT, lineno, p, 1);
+	
+	switch (*p) {
+	case ',': return ret_token(ctx, COMMA, lineno, p, 1);
+	case '=': return ret_token(ctx, EQUAL, lineno, p, 1);
+	case '{': return ret_token(ctx, LBRACE, lineno, p, 1);
+	case '}': return ret_token(ctx, RBRACE, lineno, p, 1);
+	case '[': return ret_token(ctx, LBRACKET, lineno, p, 1);
+	case ']': return ret_token(ctx, RBRACKET, lineno, p, 1);
+	case '\n': return ret_token(ctx, NEWLINE, lineno, p, 1);
+	case '\r': case ' ': case '\t':
+	    /* ignore white spaces */
+	    p++;
+	    continue;
+	}
+
+	return scan_string(ctx, p, lineno, dotisspecial);
+    }
+
+    return ret_eof(ctx, lineno);
+}
+
+
+const char* toml_key_in(toml_table_t* tab, int keyidx)
+{
+    if (keyidx < tab->nkval) return tab->kval[keyidx]->key;
+    
+    keyidx -= tab->nkval;
+    if (keyidx < tab->narr)  return tab->arr[keyidx]->key;
+    
+    keyidx -= tab->narr;
+    if (keyidx < tab->ntab)  return tab->tab[keyidx]->key;
+
+    return 0;
+}
+
+
+const char* toml_raw_in(toml_table_t* tab, const char* key)
+{
+    int i;
+    for (i = 0; i < tab->nkval; i++) {
+	if (0 == strcmp(key, tab->kval[i]->key))
+	    return tab->kval[i]->val;
+    }
+    return 0;
+}
+
+toml_array_t* toml_array_in(toml_table_t* tab, const char* key)
+{
+    int i;
+    for (i = 0; i < tab->narr; i++) {
+	if (0 == strcmp(key, tab->arr[i]->key))
+	    return tab->arr[i];
+    }
+    return 0;
+}
+
+
+toml_table_t* toml_table_in(toml_table_t* tab, const char* key)
+{
+    int i;
+    for (i = 0; i < tab->ntab; i++) {
+	if (0 == strcmp(key, tab->tab[i]->key))
+	    return tab->tab[i];
+    }
+    return 0;
+}
+
+const char* toml_raw_at(toml_array_t* arr, int idx)
+{
+    if (arr->kind != 'v')
+	return 0;
+    if (! (0 <= idx && idx < arr->nelem))
+	return 0;
+    return arr->u.val[idx];
+}
+
+char toml_array_kind(toml_array_t* arr)
+{
+    return arr->kind;
+}
+
+
+
+toml_array_t* toml_array_at(toml_array_t* arr, int idx)
+{
+    if (arr->kind != 'a')
+	return 0;
+    if (! (0 <= idx && idx < arr->nelem))
+	return 0;
+    return arr->u.arr[idx];
+}
+
+toml_table_t* toml_table_at(toml_array_t* arr, int idx)
+{
+    if (arr->kind != 't')
+	return 0;
+    if (! (0 <= idx && idx < arr->nelem))
+	return 0;
+    return arr->u.tab[idx];
+}
+
+
+int toml_rtots(const char* src_, toml_timestamp_t* ret)
+{
+    if (! src_) return -1;
+    
+    const char* p = src_;
+    const char* q = src_ + strlen(src_);
+    int64_t val;
+    int i;
+    
+    memset(ret, 0, sizeof(*ret));
+
+    /* parse date */
+    val = 0;
+    if (q - p > 4 && p[4] == '-') {
+	for (i = 0; i < 10; i++, p++) {
+	    int xx = *p;
+	    if (xx == '-') {
+		if (i == 4 || i == 7) continue; else return -1;
+	    }
+	    if (! ('0' <= xx && xx <= '9')) return -1;
+	    val = val * 10 + (xx - '0');
+	}
+	ret->day   = &ret->__buffer.day;
+	ret->month = &ret->__buffer.month;
+	ret->year  = &ret->__buffer.year;
+	
+	*ret->day   = val % 100; val /= 100;
+	*ret->month = val % 100; val /= 100;
+	*ret->year  = val;
+	
+	if (*p) {
+	    if (*p != 'T') return -1;
+	    p++;
+	}
+    }
+    if (q == p) return 0;
+
+    /* parse time */
+    val = 0;
+    if (q - p < 8) return -1;
+    for (i = 0; i < 8; i++, p++) {
+	int xx = *p;
+	if (xx == ':') {
+	    if (i == 2 || i == 5) continue; else return -1;
+	}
+	if (! ('0' <= xx && xx <= '9')) return -1;
+	val = val * 10 + (xx - '0');
+    }
+    ret->second = &ret->__buffer.second;
+    ret->minute = &ret->__buffer.minute;
+    ret->hour   = &ret->__buffer.hour;
+    
+    *ret->second = val % 100; val /= 100;
+    *ret->minute = val % 100; val /= 100;
+    *ret->hour   = val;
+    
+    /* skip fractional second */
+    if (*p == '.') for (p++; '0' <= *p && *p <= '9'; p++);
+    if (q == p) return 0;
+    
+    /* parse and copy Z */
+    ret->z = ret->__buffer.z;
+    char* z = ret->z;
+    if (*p == 'Z') {
+	*z++ = *p++;
+	*z = 0;
+	return (p == q) ? 0 : -1;
+    }
+    if (*p == '+' || *p == '-') {
+	*z++ = *p++;
+	
+	if (! (isdigit(p[0]) && isdigit(p[1]))) return -1;
+	*z++ = *p++;
+	*z++ = *p++;
+	
+	if (*p == ':') {
+	    *z++ = *p++;
+	    
+	    if (! (isdigit(p[0]) && isdigit(p[1]))) return -1;
+	    *z++ = *p++;
+	    *z++ = *p++;
+	}
+	
+	*z = 0;
+    }
+    return (p == q) ? 0 : -1;
+}
+
+
+/* Raw to boolean */
+int toml_rtob(const char* src, int* ret_)
+{
+    if (!src) return -1;
+    int dummy;
+    int* ret = ret_ ? ret_ : &dummy;
+    
+    if (0 == strcmp(src, "true")) {
+	*ret = 1;
+	return 0;
+    }
+    if (0 == strcmp(src, "false")) {
+	*ret = 0;
+	return 0;
+    }
+    return -1;
+}
+
+
+/* Raw to integer */
+int toml_rtoi(const char* src, int64_t* ret_)
+{
+    if (!src) return -1;
+    
+    char buf[100];
+    char* p = buf;
+    char* q = p + sizeof(buf);
+    const char* s = src;
+    int64_t dummy;
+    int64_t* ret = ret_ ? ret_ : &dummy;
+    
+    if (*s == '+')
+	*p++ = *s++;
+    else if (*s == '-')
+	*p++ = *s++;
+
+    /* if 0 ... */
+    if ('0' == s[0]) {
+	/* ensure no other digits after it */
+	if (s[1]) return -1;
+	return *ret = 0, 0;
+    }
+
+    /* just strip underscores and pass to strtoll */
+    while (*s && p < q) {
+	int ch = *s++;
+	if (ch == '_') ; else *p++ = ch;
+    }
+    if (*s || p == q) return -1;
+    
+    /* cap with NUL */
+    *p = 0;
+
+    /* Run strtoll on buf to get the integer */
+    char* endp;
+    errno = 0;
+    *ret = strtoll(buf, &endp, 0);
+    return (errno || *endp) ? -1 : 0;
+}
+
+
+int toml_rtod(const char* src, double* ret_)
+{
+    if (!src) return -1;
+    
+    char buf[100];
+    char* p = buf;
+    char* q = p + sizeof(buf);
+    const char* s = src;
+    double dummy;
+    double* ret = ret_ ? ret_ : &dummy;
+
+    /* check for special cases */
+    if (s[0] == '+' || s[0] == '-') *p++ = *s++;
+    if (s[0] == '.') return -1;	/* no leading zero */
+    if (s[0] == '0') {
+	/* zero must be followed by . or NUL */
+	if (s[1] && s[1] != '.') return -1;
+    }
+
+    /* just strip underscores and pass to strtod */
+    while (*s && p < q) {
+	int ch = *s++;
+	if (ch == '_') ; else *p++ = ch;
+    }
+    if (*s || p == q) return -1;
+
+    if (p != buf && p[-1] == '.') 
+	return -1; /* no trailing zero */
+
+    /* cap with NUL */
+    *p = 0;
+
+    /* Run strtod on buf to get the value */
+    char* endp;
+    errno = 0;
+    *ret = strtod(buf, &endp);
+    return (errno || *endp) ? -1 : 0;
+}
+
+
+static char* kill_line_ending_backslash(char* str)
+{
+    if (!str) return 0;
+    
+    /* first round: find (backslash, \n) */
+    char* p = str;
+    while (0 != (p = strstr(p, "\\\n"))) {
+	char* q = (p + 1);
+	q += strspn(q, " \t\r\n");
+	memmove(p, q, strlen(q) + 1);
+    }
+    /* second round: find (backslash, \r, \n) */
+    p = str;
+    while (0 != (p = strstr(p, "\\\r\n"))) {
+	char* q = (p + 1);
+	q += strspn(q, " \t\r\n");
+	memmove(p, q, strlen(q) + 1);
+    }
+
+    return str;
+}
+
+
+int toml_rtos(const char* src, char** ret)
+{
+    if (!src) return -1;
+    if (*src != '\'' && *src != '"') return -1;
+
+    *ret = 0;
+    int srclen = strlen(src);
+    if (*src == '\'') {
+	if (0 == strncmp(src, "'''", 3)) {
+	    const char* sp = src + 3;
+	    const char* sq = src + srclen - 3;
+	    /* last 3 chars in src must be ''' */
+	    if (! (sp <= sq && 0 == strcmp(sq, "'''")))
+		return -1;
+	    
+	    /* skip first new line right after ''' */
+	    if (*sp == '\n')
+		sp++;
+	    else if (sp[0] == '\r' && sp[1] == '\n')
+		sp += 2;
+
+	    *ret = kill_line_ending_backslash(strndup(sp, sq - sp));
+	} else {
+	    const char* sp = src + 1;
+	    const char* sq = src + srclen - 1;
+	    /* last char in src must be ' */
+	    if (! (sp <= sq && *sq == '\''))
+		return -1;
+	    /* copy from sp to p */
+	    *ret = strndup(sp, sq - sp);
+	}
+	return *ret ? 0 : -1;
+    }
+
+    const char* sp;
+    const char* sq;
+    if (0 == strncmp(src, "\"\"\"", 3)) {
+	sp = src + 3;
+	sq = src + srclen - 3;
+	if (! (sp <= sq && 0 == strcmp(sq, "\"\"\"")))
+	    return -1;
+	
+	/* skip first new line right after """ */
+	if (*sp == '\n')
+	    sp++;
+	else if (sp[0] == '\r' && sp[1] == '\n')
+	    sp += 2;
+    } else {
+	sp = src + 1;
+	sq = src + srclen - 1;
+	if (! (sp <= sq && *sq == '"'))
+	    return -1;
+    }
+
+    char dummy_errbuf[1];
+    *ret = normalize_string(sp, sq - sp,
+			    1, // flag kill_line_ending_backslash 
+			    dummy_errbuf, sizeof(dummy_errbuf));
+    return *ret ? 0 : -1;
+}
diff --git a/utils/common/toml.h b/utils/common/toml.h
new file mode 100644
index 00000000..54c1c825
--- /dev/null
+++ b/utils/common/toml.h
@@ -0,0 +1,110 @@
+/*
+MIT License
+
+Copyright (c) 2017 CK Tan
+https://github.com/cktan/tomlc99
+
+Permission is hereby granted, free of charge, to any person obtaining a copy
+of this software and associated documentation files (the "Software"), to deal
+in the Software without restriction, including without limitation the rights
+to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+copies of the Software, and to permit persons to whom the Software is
+furnished to do so, subject to the following conditions:
+
+The above copyright notice and this permission notice shall be included in all
+copies or substantial portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+SOFTWARE.
+*/
+#ifndef TOML_H
+#define TOML_H
+
+#ifdef __cplusplus
+#define TOML_EXTERN extern "C"
+#else
+#define TOML_EXTERN extern
+#endif
+
+typedef struct toml_table_t toml_table_t;
+typedef struct toml_array_t toml_array_t;
+
+/* Parse a file. Return a table on success, or 0 otherwise. 
+ * Caller must toml_free(the-return-value) after use.
+ */
+TOML_EXTERN toml_table_t* toml_parse_file(FILE* fp, 
+					  char* errbuf,
+					  int errbufsz);
+
+/* Parse a string containing the full config. 
+ * Return a table on success, or 0 otherwise.
+ * Caller must toml_free(the-return-value) after use.
+ */
+TOML_EXTERN toml_table_t* toml_parse(char* conf, /* NUL terminated, please. */
+				     char* errbuf,
+				     int errbufsz);
+
+/* Free the table returned by toml_parse() or toml_parse_file(). */
+TOML_EXTERN void toml_free(toml_table_t* tab);
+
+/* Retrieve the key in table at keyidx. Return 0 if out of range. */
+TOML_EXTERN const char* toml_key_in(toml_table_t* tab, int keyidx);
+
+/* Lookup table by key. Return the element or 0 if not found. */
+TOML_EXTERN const char* toml_raw_in(toml_table_t* tab, const char* key);
+TOML_EXTERN toml_array_t* toml_array_in(toml_table_t* tab, const char* key);
+TOML_EXTERN toml_table_t* toml_table_in(toml_table_t* tab, const char* key);
+
+/* Return the array kind: 't'able, 'a'rray, 'v'alue */
+TOML_EXTERN char toml_array_kind(toml_array_t* arr);
+
+/* Deref array by index. Return the element at idx or 0 if out of range. */
+TOML_EXTERN const char* toml_raw_at(toml_array_t* arr, int idx);
+TOML_EXTERN toml_array_t* toml_array_at(toml_array_t* arr, int idx);
+TOML_EXTERN toml_table_t* toml_table_at(toml_array_t* arr, int idx);
+
+
+/* Raw to String. Caller must call free(ret) after use. 
+ * Return 0 on success, -1 otherwise.
+ */
+TOML_EXTERN int toml_rtos(const char* s, char** ret);
+
+/* Raw to Boolean. Return 0 on success, -1 otherwise. */
+TOML_EXTERN int toml_rtob(const char* s, int* ret);
+
+/* Raw to Integer. Return 0 on success, -1 otherwise. */
+TOML_EXTERN int toml_rtoi(const char* s, int64_t* ret);
+
+/* Raw to Double. Return 0 on success, -1 otherwise. */
+TOML_EXTERN int toml_rtod(const char* s, double* ret);
+
+/* Timestamp types. The year, month, day, hour, minute, second, z 
+ * fields may be NULL if they are not relevant. e.g. In a DATE
+ * type, the hour, minute, second and z fields will be NULLs.
+ */
+typedef struct toml_timestamp_t toml_timestamp_t;
+struct toml_timestamp_t {
+    struct { /* internal. do not use. */
+	int year, month, day;
+	int hour, minute, second;
+	char z[10];
+    } __buffer;
+    int *year, *month, *day;
+    int *hour, *minute, *second;
+    char* z;
+};
+
+/* Raw to Timestamp. Return 0 on success, -1 otherwise. */
+TOML_EXTERN int toml_rtots(const char* s, toml_timestamp_t* ret);
+
+/* misc */
+TOML_EXTERN int toml_utf8_to_ucs(const char* orig, int len, int64_t* ret);
+TOML_EXTERN int toml_ucs_to_utf8(int64_t code, char buf[6]);
+
+
+#endif /* TOML_H */
diff --git a/utils/ir-ctl/Makefile.am b/utils/ir-ctl/Makefile.am
index 6ff20812..df53a965 100644
--- a/utils/ir-ctl/Makefile.am
+++ b/utils/ir-ctl/Makefile.am
@@ -1,6 +1,6 @@
 bin_PROGRAMS = ir-ctl
 man_MANS = ir-ctl.1
 
-ir_ctl_SOURCES = ir-ctl.c ir-encode.c ir-encode.h
+ir_ctl_SOURCES = ir-ctl.c ir-encode.c ir-encode.h toml.c toml.h keymap.c keymap.h
 ir_ctl_LDADD = @LIBINTL@
 ir_ctl_LDFLAGS = $(ARGP_LIBS)
diff --git a/utils/ir-ctl/ir-ctl.1.in b/utils/ir-ctl/ir-ctl.1.in
index c69ce8b1..7564066a 100644
--- a/utils/ir-ctl/ir-ctl.1.in
+++ b/utils/ir-ctl/ir-ctl.1.in
@@ -15,10 +15,16 @@ ir\-ctl \- a swiss\-knife tool to handle raw IR and to set lirc options
 [\fIOPTION\fR]... \fI\-\-scancode\fR [\fIprotocol and scancode to send\fR]
 .br
 .B ir\-ctl
+[\fIOPTION\fR]... \fI\-\-keycode\fR [\fIkeycode to send\fR]
+.br
+.B ir\-ctl
 [\fIOPTION\fR]... \fI\-\-receive\fR [\fIsave to file\fR]
 .SH DESCRIPTION
 ir\-ctl is a tool that allows one to list the features of a lirc device,
-set its options, receive raw IR, send raw IR or send complete IR scancodes.
+set its options, receive raw IR, and send IR.
+.PP
+IR can be sent as the keycode of a keymap, or using a scancode, or using
+raw IR.
 .PP
 Note: You need to have read or write permissions on the /dev/lirc device
 for options to work.
@@ -45,6 +51,16 @@ protocols listed below, followed by a colon and the scancode number. If this
 option is specified multiple times, send all scancodes in\-order with a 125ms
 gap between them. The gap length can be modified with \fB\-\-gap\fR.
 .TP
+\fB-K\fR, \fB\-\-keycode\fR=\fIKEYCODE\fR
+Send the \fBKEYCODE\fR from the keymap which must be specified with
+\fB--keymap\fR. If this option is specified multiple times, send all keycodes
+in\-order with a 125ms gap between them. The gap length can be modified
+with \fB\-\-gap\fR.
+.TP
+\fB-k\fR, \fB\-\-keymap\fR=\fIKEYMAP\fR
+The rc keymap in toml format. The format is described in the rc_keymap(5)
+man page.
+.TP
 \fB\-1\fR, \fB\-\-oneshot\fR
 When receiving, stop receiving after the first message, i.e. after a space or
 timeout of more than 19ms is received.
@@ -224,7 +240,11 @@ To send the pulse and space file \fBplay\fR on emitter 3:
 .PP
 To send the rc-5 hauppauge '1' scancode:
 .br
-	\fBir\-ctl \-S rc5:0x1e01
+	\fBir\-ctl \-S rc5:0x1e01\fR
+.PP
+To send the rc-5 hauppauage '1' key from the hauppauge keymap:
+.br
+	\fBir\-ctl -k hauppauge.toml -K KEY_NUMERIC_0\fR
 .SH BUGS
 Report bugs to \fBLinux Media Mailing List <linux-media@vger.kernel.org>\fR
 .SH COPYRIGHT
@@ -237,3 +257,5 @@ There is NO WARRANTY, to the extent permitted by law.
 .SH SEE ALSO
 To display decoded IR, or set IR decoding options, see
 ir\-keytable(1).
+
+The keymap format is described in rc_keymap(5).
diff --git a/utils/ir-ctl/ir-ctl.c b/utils/ir-ctl/ir-ctl.c
index 82ac0dee..837dffef 100644
--- a/utils/ir-ctl/ir-ctl.c
+++ b/utils/ir-ctl/ir-ctl.c
@@ -30,6 +30,7 @@
 #include <linux/lirc.h>
 
 #include "ir-encode.h"
+#include "keymap.h"
 
 #ifdef ENABLE_NLS
 # define _(string) gettext(string)
@@ -67,6 +68,7 @@ struct file {
 	struct file *next;
 	const char *fname;
 	bool is_scancode;
+	bool is_keycode;
 	union {
 		struct {
 			unsigned carrier;
@@ -77,6 +79,7 @@ struct file {
 			unsigned scancode;
 			unsigned protocol;
 		};
+		char	keycode[1];
 	};
 };
 
@@ -85,6 +88,7 @@ struct arguments {
 	bool features;
 	bool receive;
 	bool verbose;
+	struct keymap *keymap;
 	struct file *send;
 	bool oneshot;
 	char *savetofile;
@@ -104,7 +108,8 @@ static const struct argp_option options[] = {
 	{ "features",	'f',	0,		0,	N_("list lirc device features") },
 	{ "receive",	'r',	N_("FILE"),	OPTION_ARG_OPTIONAL,	N_("receive IR to stdout or file") },
 	{ "send",	's',	N_("FILE"),	0,	N_("send IR pulse and space file") },
-	{ "scancode", 'S',	N_("SCANCODE"),	0,	N_("send IR scancode in protocol specified") },
+	{ "scancode",	'S',	N_("SCANCODE"),	0,	N_("send IR scancode in protocol specified") },
+	{ "keycode",	'K',	N_("KEYCODE"),	0,	N_("send IR keycode from keymap") },
 	{ "verbose",	'v',	0,		0,	N_("verbose output") },
 		{ .doc = N_("Receiving options:") },
 	{ "one-shot",	'1',	0,		0,	N_("end receiving after first message") },
@@ -115,6 +120,7 @@ static const struct argp_option options[] = {
 	{ "no-measure-carrier", 'M', 0,		0,	N_("disable reporting carrier frequency") },
 	{ "timeout",	't',	N_("TIMEOUT"),	0,	N_("set receiving timeout") },
 		{ .doc = N_("Sending options:") },
+	{ "keymap",	'k',	N_("KEYMAP"),	0,	N_("use keymap to send key from") },
 	{ "carrier",	'c',	N_("CARRIER"),	0,	N_("set send carrier") },
 	{ "duty-cycle",	'D',	N_("DUTY"),	0,	N_("set duty cycle") },
 	{ "emitters",	'e',	N_("EMITTERS"),	0,	N_("set send emitters") },
@@ -127,6 +133,7 @@ static const char args_doc[] = N_(
 	"--receive [save to file]\n"
 	"--send [file to send]\n"
 	"--scancode [scancode to send]\n"
+	"--keycode [keycode to send]\n"
 	"[to set lirc option]");
 
 static const char doc[] = N_(
@@ -141,7 +148,9 @@ static const char doc[] = N_(
 	"  GAP      - gap between pulse and files or scancodes in microseconds\n"
 	"  RANGE    - set range of accepted carrier frequencies, e.g. 20000-40000\n"
 	"  TIMEOUT  - set length of space before receiving stops in microseconds\n"
-	"  SCANCODE - protocol:scancode, e.g. nec:0xa814\n\n"
+	"  KEYCODE  - key code in keymap\n"
+	"  SCANCODE - protocol:scancode, e.g. nec:0xa814\n"
+	"  KEYMAP   - a rc keymap file from which to send keys\n\n"
 	"Note that most lirc setting have global state, i.e. the device will remain\n"
 	"in this state until set otherwise.");
 
@@ -214,6 +223,7 @@ static struct file *read_file(struct arguments *args, const char *fname)
 		return NULL;
 	}
 	f->is_scancode = false;
+	f->is_keycode = false;
 	f->carrier = 0;
 	f->fname = fname;
 
@@ -386,6 +396,7 @@ static struct file *read_scancode(const char *name)
 	}
 
 	f->is_scancode = true;
+	f->is_keycode = false;
 	f->scancode = scancode;
 	f->protocol = proto;
 
@@ -395,6 +406,7 @@ static struct file *read_scancode(const char *name)
 static error_t parse_opt(int k, char *arg, struct argp_state *state)
 {
 	struct arguments *arguments = state->input;
+	struct keymap *map;
 	struct file *s;
 
 	switch (k) {
@@ -524,6 +536,38 @@ static error_t parse_opt(int k, char *arg, struct argp_state *state)
 		}
 		break;
 
+	case 'K':
+		if (arguments->receive || arguments->features)
+			argp_error(state, _("key send can not be combined with receive or features option"));
+		s = malloc(sizeof(*s) + strlen(arg));
+		if (s == NULL)
+			exit(EX_DATAERR);
+
+		s->next = NULL;
+		strcpy(s->keycode, arg);
+		s->is_scancode = false;
+		s->is_keycode = true;
+		if (arguments->send == NULL)
+			arguments->send = s;
+		else {
+			struct file *p = arguments->send;
+			while (p->next) p = p->next;
+			p->next = s;
+		}
+		break;
+
+	case 'k':
+		if (parse_keyfile(arg, &map, arguments->verbose))
+			exit(EX_DATAERR);
+		if (arguments->keymap == NULL)
+			arguments->keymap = map;
+		else {
+			struct keymap *p = arguments->keymap;
+			while (p->next) p = p->next;
+			p->next = map;
+		}
+		break;
+
 	case ARGP_KEY_END:
 		if (!arguments->work_to_do)
 			argp_usage(state);
@@ -533,12 +577,68 @@ static error_t parse_opt(int k, char *arg, struct argp_state *state)
 		return ARGP_ERR_UNKNOWN;
 	}
 
-	if (k != '1' && k != 'd' && k != 'v')
+	if (k != '1' && k != 'd' && k != 'v' && k != 'k')
 		arguments->work_to_do = true;
 
 	return 0;
 }
 
+// FIXME: keymaps can have multiple definitions of the same keycode
+static struct file* convert_keycode(struct keymap *map, const char *keycode)
+{
+	struct file *s;
+
+	while (map) {
+		struct raw_entry *re = map->raw;
+		struct scancode_entry *se = map->scancode;
+
+		while (re) {
+			if (!strcmp(re->keycode, keycode)) {
+				s = malloc(sizeof(*s) + re->raw_length * sizeof(int));
+				s->len = re->raw_length;
+				memcpy(s->buf, re->raw, s->len * sizeof(int));
+				s->is_scancode = false;
+				s->is_keycode = false;
+				s->carrier = keymap_param(map, "carrier", 0);
+				s->next = NULL;
+
+				return s;
+			}
+
+			re = re->next;
+		}
+
+		while (se) {
+			if (!strcmp(se->keycode, keycode)) {
+				enum rc_proto proto;
+				const char *proto_str;
+
+				proto_str = map->variant ?: map->protocol;
+
+				if (!protocol_match(proto_str, &proto)) {
+					fprintf(stderr, _("error: protocol '%s' not suppoted\n"), proto_str);
+					return NULL;
+				}
+
+				s = malloc(sizeof(*s));
+				s->protocol = proto;
+				s->scancode = se->scancode;
+				s->is_scancode = true;
+				s->is_keycode = false;
+				s->next = NULL;
+
+				return s;
+			}
+
+			se = se->next;
+		}
+
+		map = map->next;
+	}
+
+	return NULL;
+}
+
 static const struct argp argp = {
 	.options = options,
 	.parser = parse_opt,
@@ -768,7 +868,27 @@ static int lirc_send(struct arguments *args, int fd, unsigned features, struct f
 		return EX_UNAVAILABLE;
 	}
 
+	if (f->is_keycode) {
+		struct keymap *map = args->keymap;
+		const char *keycode = f->keycode;
+
+		if (!map) {
+			fprintf(stderr, _("error: no keymap specified\n"));
+			return EX_DATAERR;
+		}
+
+		f = convert_keycode(map, keycode);
+		if (!f) {
+			fprintf(stderr, _("error: keycode `%s' not found in keymap\n"), keycode);
+			return EX_DATAERR;
+		}
+	}
+
 	if (f->is_scancode) {
+		if (args->verbose)
+			printf("Sending to kernel encoder protocol:%s scancode:0x%x\n",
+			       protocol_name(f->protocol), f->scancode);
+
 		mode = LIRC_MODE_SCANCODE;
 		rc = ioctl(fd, LIRC_SET_SEND_MODE, &mode);
 		if (rc == 0) {
diff --git a/utils/ir-ctl/keymap.c b/utils/ir-ctl/keymap.c
new file mode 120000
index 00000000..973bd380
--- /dev/null
+++ b/utils/ir-ctl/keymap.c
@@ -0,0 +1 @@
+../common/keymap.c
\ No newline at end of file
diff --git a/utils/ir-ctl/keymap.h b/utils/ir-ctl/keymap.h
new file mode 120000
index 00000000..65787575
--- /dev/null
+++ b/utils/ir-ctl/keymap.h
@@ -0,0 +1 @@
+../common/keymap.h
\ No newline at end of file
diff --git a/utils/ir-ctl/toml.c b/utils/ir-ctl/toml.c
new file mode 120000
index 00000000..94ca0ef6
--- /dev/null
+++ b/utils/ir-ctl/toml.c
@@ -0,0 +1 @@
+../common/toml.c
\ No newline at end of file
diff --git a/utils/ir-ctl/toml.h b/utils/ir-ctl/toml.h
new file mode 120000
index 00000000..d1170723
--- /dev/null
+++ b/utils/ir-ctl/toml.h
@@ -0,0 +1 @@
+../common/toml.h
\ No newline at end of file
diff --git a/utils/keytable/keymap.c b/utils/keytable/keymap.c
deleted file mode 100644
index bb193131..00000000
--- a/utils/keytable/keymap.c
+++ /dev/null
@@ -1,459 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-// Read a toml keymap or plain text keymap (ir-keytable 1.14 or earlier
-// format).
-
-#include <stdio.h>
-#include <stdlib.h>
-#include <errno.h>
-#include <string.h>
-#include <limits.h>
-#include <stdbool.h>
-
-#include "keymap.h"
-#include "toml.h"
-
-#ifdef ENABLE_NLS
-# define _(string) gettext(string)
-# include "gettext.h"
-# include <locale.h>
-# include <langinfo.h>
-# include <iconv.h>
-#else
-# define _(string) string
-#endif
-
-void free_keymap(struct keymap *map)
-{
-	struct scancode_entry *se;
-	struct raw_entry *re;
-	struct protocol_param *param;
-	struct keymap *next;
-
-	while (map) {
-		re = map->raw;
-
-		while (re) {
-			struct raw_entry *next = re->next;
-			free(re->keycode);
-			free(re);
-			re = next;
-		}
-
-
-		se = map->scancode;
-
-		while (se) {
-			struct scancode_entry *next = se->next;
-			free(se->keycode);
-			free(se);
-			se = next;
-		}
-
-		param = map->param;
-
-		while (param) {
-			struct protocol_param *next = param->next;
-			free(param->name);
-			free(param);
-			param = next;
-		}
-
-		next = map->next;
-
-		free(map->name);
-		free(map->protocol);
-		free(map->variant);
-		free(map);
-
-		map = next;
-	}
-}
-
-static error_t parse_plain_keyfile(char *fname, struct keymap **keymap, bool verbose)
-{
-	FILE *fin;
-	int line = 0;
-	char *scancode, *keycode, s[2048];
-	struct scancode_entry *se;
-	struct keymap *map;
-
-	map = calloc(1, sizeof(*map));
-	if (!map) {
-		perror("parse_keyfile");
-		return ENOMEM;
-	}
-
-	if (verbose)
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
-					map->name = strdup(p);
-				} else if (!strcmp(p, "type")) {
-					p = strtok(NULL, " ,\n");
-					if (!p)
-						goto err_einval;
-
-					while (p) {
-						if (map->protocol) {
-							map->protocol = strdup(p);
-						} else {
-							struct keymap *k;
-
-							k = calloc(1, sizeof(k));
-							k->protocol = strdup(p);
-							k->next = map->next;
-							map->next = k;
-						}
-
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
-		se = calloc(1, sizeof(*se));
-		if (!se) {
-			free_keymap(map);
-			perror("parse_keyfile");
-			fclose(fin);
-			return ENOMEM;
-		}
-
-		se->scancode = strtoul(scancode, NULL, 0);
-		se->keycode  = keycode;
-		se->next = map->scancode;
-		map->scancode = se;
-	}
-	fclose(fin);
-
-	*keymap = map;
-
-	return 0;
-
-err_einval:
-	free_keymap(map);
-	fprintf(stderr, _("Invalid parameter on line %d of %s\n"),
-		line, fname);
-	return EINVAL;
-}
-
-static error_t parse_toml_raw_part(const char *fname, struct toml_array_t *raw, struct keymap *map)
-{
-	struct toml_table_t *t;
-	struct toml_array_t *rawarray;
-	struct raw_entry *re;
-	const char *rkeycode;
-	int ind = 0, length;
-	char *keycode;
-
-	while ((t = toml_table_at(raw, ind++)) != NULL) {
-		rkeycode = toml_raw_in(t, "keycode");
-		if (!rkeycode) {
-			fprintf(stderr, _("%s: invalid keycode for raw entry %d\n"),
-				fname, ind);
-			return EINVAL;
-		}
-
-		if (toml_rtos(rkeycode, &keycode)) {
-			fprintf(stderr, _("%s: bad value `%s' for keycode\n"),
-				fname, rkeycode);
-			return EINVAL;
-		}
-
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
-
-		re = calloc(1, sizeof(*re) + sizeof(re->raw[0]) * length);
-		if (!re) {
-			fprintf(stderr, _("Failed to allocate memory"));
-			return EINVAL;
-		}
-
-		for (int i=0; i<length; i++) {
-			const char *s = toml_raw_at(rawarray, i);
-			int64_t v;
-
-			if (toml_rtoi(s, &v) || v == 0) {
-				fprintf(stderr, _("%s: incorrect raw value `%s'"),
-					fname, s);
-				return EINVAL;
-			}
-
-			if (v <= 0 || v > USHRT_MAX) {
-				fprintf(stderr, _("%s: raw value %ld out of range"),
-					fname, v);
-				return EINVAL;
-			}
-
-			re->raw[i] = v;
-		}
-
-		re->raw_length = length;
-		re->keycode = keycode;
-		re->next = map->raw;
-		map->raw = re;
-	}
-
-	return 0;
-}
-
-
-static error_t parse_toml_protocol(const char *fname, struct toml_table_t *proot, struct keymap **keymap, bool verbose)
-{
-	struct toml_table_t *scancodes;
-	struct toml_array_t *rawarray;
-	const char *raw, *key;
-	bool have_raw_protocol = false;
-	struct keymap *map;
-	char *p;
-	int i = 0;
-
-	map = calloc(1, sizeof(*map));
-	if (!map) {
-		perror("parse_toml_protocol");
-		return ENOMEM;
-	}
-	*keymap = map;
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
-	map->protocol = strdup(p);
-	if (!strcmp(p, "raw"))
-		have_raw_protocol = true;
-
-	raw = toml_raw_in(proot, "variant");
-	if (raw) {
-		if (toml_rtos(raw, &p)) {
-			fprintf(stderr, _("%s: bad value `%s' for variant\n"), fname, raw);
-			return EINVAL;
-		}
-
-		map->variant = strdup(p);
-	}
-
-	raw = toml_raw_in(proot, "name");
-	if (raw) {
-		if (toml_rtos(raw, &p)) {
-			fprintf(stderr, _("%s: bad value `%s' for name\n"), fname, raw);
-			return EINVAL;
-		}
-
-		map->name = strdup(p);
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
-		error_t err = parse_toml_raw_part(fname, rawarray, map);
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
-		if (verbose)
-			fprintf(stderr, _("%s: no [protocols.scancodes] section\n"), fname);
-		return 0;
-	}
-
-	for (i = 0; (key = toml_key_in(proot, i)) != NULL; i++) {
-		long int value;
-
-		raw = toml_raw_in(proot, key);
-		if (!toml_rtoi(raw, &value)) {
-			struct protocol_param *param;
-
-			param = malloc(sizeof(*param));
-			param->name = strdup(key);
-			param->value = value;
-			param->next = map->param;
-			map->param = param;
-			if (verbose)
-				fprintf(stderr, _("%s: protocol parameter %s=%ld\n"), fname, param->name, param->value);
-		}
-	}
-
-	for (;;) {
-		struct scancode_entry *se;
-		const char *scancode;
-		char *keycode;
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
-		se = calloc(1, sizeof(*se));
-		if (!se) {
-			perror("parse_keyfile");
-			return ENOMEM;
-		}
-
-		se->scancode = strtoul(scancode, NULL, 0);
-		se->keycode = keycode;
-		se->next = map->scancode;
-		map->scancode = se;
-	}
-
-	return 0;
-}
-
-static error_t parse_toml_keyfile(char *fname, struct keymap **keymap, bool verbose)
-{
-	struct toml_table_t *root, *proot;
-	struct toml_array_t *arr;
-	int ret, i = 0;
-	char buf[200];
-	FILE *fin;
-
-	if (verbose)
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
-	struct keymap *map = NULL;
-
-	for (;;) {
-		struct keymap *cur_map;
-
-		proot = toml_table_at(arr, i);
-		if (!proot)
-			break;
-
-		ret = parse_toml_protocol(fname, proot, &cur_map, verbose);
-		if (ret)
-			goto out;
-
-		if (!map) {
-			map = cur_map;
-		} else {
-			cur_map->next = map->next;
-			map->next = cur_map;
-		}
-		i++;
-	}
-
-	if (i == 0) {
-		fprintf(stderr, _("%s: no protocols found\n"), fname);
-		goto out;
-	}
-
-	toml_free(root);
-	*keymap = map;
-	return 0;
-out:
-	toml_free(root);
-	return EINVAL;
-}
-
-error_t parse_keyfile(char *fname, struct keymap **keymap, bool verbose)
-{
-	size_t len = strlen(fname);
-
-	if (len >= 5 && strcasecmp(fname + len - 5, ".toml") == 0)
-		return parse_toml_keyfile(fname, keymap, verbose);
-	else
-		return parse_plain_keyfile(fname, keymap, verbose);
-}
diff --git a/utils/keytable/keymap.c b/utils/keytable/keymap.c
new file mode 120000
index 00000000..973bd380
--- /dev/null
+++ b/utils/keytable/keymap.c
@@ -0,0 +1 @@
+../common/keymap.c
\ No newline at end of file
diff --git a/utils/keytable/keymap.h b/utils/keytable/keymap.h
deleted file mode 100644
index df0ba814..00000000
--- a/utils/keytable/keymap.h
+++ /dev/null
@@ -1,38 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __KEYMAP_H
-#define __KEYMAP_H
-
-struct keymap {
-	struct keymap *next;
-	char *name;
-	char *protocol;
-	char *variant;
-	struct protocol_param *param;
-	struct scancode_entry *scancode;
-	struct raw_entry *raw;
-};
-
-struct protocol_param {
-	struct protocol_param *next;
-	char *name;
-	long int value;
-};
-
-struct scancode_entry {
-	struct scancode_entry *next;
-	u_int32_t scancode;
-	char *keycode;
-};
-
-struct raw_entry {
-	struct raw_entry *next;
-	u_int32_t scancode;
-	u_int32_t raw_length;
-	char *keycode;
-	u_int32_t raw[1];
-};
-
-void free_keymap(struct keymap *map);
-error_t parse_keyfile(char *fname, struct keymap **keymap, bool verbose);
-
-#endif
diff --git a/utils/keytable/keymap.h b/utils/keytable/keymap.h
new file mode 120000
index 00000000..65787575
--- /dev/null
+++ b/utils/keytable/keymap.h
@@ -0,0 +1 @@
+../common/keymap.h
\ No newline at end of file
diff --git a/utils/keytable/toml.c b/utils/keytable/toml.c
deleted file mode 100644
index e4b57190..00000000
--- a/utils/keytable/toml.c
+++ /dev/null
@@ -1,1903 +0,0 @@
-/*
-MIT License
-
-Copyright (c) 2017 CK Tan 
-https://github.com/cktan/tomlc99
-
-Permission is hereby granted, free of charge, to any person obtaining a copy
-of this software and associated documentation files (the "Software"), to deal
-in the Software without restriction, including without limitation the rights
-to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-copies of the Software, and to permit persons to whom the Software is
-furnished to do so, subject to the following conditions:
-
-The above copyright notice and this permission notice shall be included in all
-copies or substantial portions of the Software.
-
-THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-SOFTWARE.
-*/
-#define _POSIX_C_SOURCE 200809L
-#include <stdio.h>
-#include <setjmp.h>
-#include <stdlib.h>
-#include <assert.h>
-#include <errno.h>
-#include <stdint.h>
-#include <ctype.h>
-#include <string.h>
-#include "toml.h"
-
-#ifdef _WIN32
-char* strndup(const char* s, size_t n)
-{
-    size_t len = strnlen(s, n);
-    char* p = malloc(len+1);
-    if (p) {
-	memcpy(p, s, len);
-	p[len] = 0;
-    }
-    return p;
-}
-#endif
-
-
-/**
- * Convert a char in utf8 into UCS, and store it in *ret.
- * Return #bytes consumed or -1 on failure.
- */
-int toml_utf8_to_ucs(const char* orig, int len, int64_t* ret)
-{
-    const unsigned char* buf = (const unsigned char*) orig;
-    unsigned i = *buf++;
-    int64_t v;
-    
-    /* 0x00000000 - 0x0000007F:
-       0xxxxxxx
-    */
-    if (0 == (i >> 7)) {
-	if (len < 1) return -1;
-	v = i;
-	return *ret = v, 1;
-    }
-    /* 0x00000080 - 0x000007FF:
-       110xxxxx 10xxxxxx
-    */
-    if (0x6 == (i >> 5)) {
-	if (len < 2) return -1;
-	v = i & 0x1f;
-	i = *(++buf);
-	if (0x2 != (i >> 6)) return -1;
-	v = (v << 6) | (i & 0x3f);
-	return *ret = v, (const char*) buf - orig;
-    }
-
-    /* 0x00000800 - 0x0000FFFF:
-       1110xxxx 10xxxxxx 10xxxxxx
-    */
-    if (0xE == (i >> 4)) {
-	if (len < 3) return -1;
-	v = i & 0x0F;
-	for (int j = 0; j < 2; j++) {
-	    i = *(++buf);
-	    if (0x2 != (i >> 6)) return -1;
-	    v = (v << 6) | (i & 0x3f);
-	}
-	return *ret = v, (const char*) buf - orig;
-    }
-
-    /* 0x00010000 - 0x001FFFFF:
-       11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
-    */
-    if (0x1E == (i >> 3)) {
-	if (len < 4) return -1;
-	v = i & 0x07;
-	for (int j = 0; j < 3; j++) {
-	    i = *(++buf);
-	    if (0x2 != (i >> 6)) return -1;
-	    v = (v << 6) | (i & 0x3f);
-	}
-	return *ret = v, (const char*) buf - orig;
-    }
-    
-    /* 0x00200000 - 0x03FFFFFF:
-       111110xx 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx
-    */
-    if (0x3E == (i >> 2)) {
-	if (len < 5) return -1;
-	v = i & 0x03;
-	for (int j = 0; j < 4; j++) {
-	    i = *(++buf);
-	    if (0x2 != (i >> 6)) return -1;
-	    v = (v << 6) | (i & 0x3f);
-	}
-	return *ret = v, (const char*) buf - orig;
-    }
-
-    /* 0x04000000 - 0x7FFFFFFF:
-       1111110x 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx
-    */
-    if (0x7e == (i >> 1)) {
-	if (len < 6) return -1;
-	v = i & 0x01;
-	for (int j = 0; j < 5; j++) {
-	    i = *(++buf);
-	    if (0x2 != (i >> 6)) return -1;
-	    v = (v << 6) | (i & 0x3f);
-	}
-	return *ret = v, (const char*) buf - orig;
-    }
-    return -1;
-}
-
-
-/**
- *  Convert a UCS char to utf8 code, and return it in buf.
- *  Return #bytes used in buf to encode the char, or 
- *  -1 on error.
- */
-int toml_ucs_to_utf8(int64_t code, char buf[6])
-{
-    /* http://stackoverflow.com/questions/6240055/manually-converting-unicode-codepoints-into-utf-8-and-utf-16 */
-    /* The UCS code values 0xd800–0xdfff (UTF-16 surrogates) as well
-     * as 0xfffe and 0xffff (UCS noncharacters) should not appear in
-     * conforming UTF-8 streams.
-     */
-    if (0xd800 <= code && code <= 0xdfff) return -1;
-    if (0xfffe <= code && code <= 0xffff) return -1;
-
-    /* 0x00000000 - 0x0000007F:
-       0xxxxxxx
-    */
-    if (code < 0) return -1;
-    if (code <= 0x7F) {
-	buf[0] = (unsigned char) code;
-	return 1;
-    }
-
-    /* 0x00000080 - 0x000007FF:
-       110xxxxx 10xxxxxx
-    */
-    if (code <= 0x000007FF) {
-	buf[0] = 0xc0 | (code >> 6);
-	buf[1] = 0x80 | (code & 0x3f);
-	return 2;
-    }
-
-    /* 0x00000800 - 0x0000FFFF:
-       1110xxxx 10xxxxxx 10xxxxxx
-    */
-    if (code <= 0x0000FFFF) {
-	buf[0] = 0xe0 | (code >> 12);
-	buf[1] = 0x80 | ((code >> 6) & 0x3f);
-	buf[2] = 0x80 | (code & 0x3f);
-	return 3;
-    }
-
-    /* 0x00010000 - 0x001FFFFF:
-       11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
-    */
-    if (code <= 0x001FFFFF) {
-	buf[0] = 0xf0 | (code >> 18);
-	buf[1] = 0x80 | ((code >> 12) & 0x3f);
-	buf[2] = 0x80 | ((code >> 6) & 0x3f);
-	buf[3] = 0x80 | (code & 0x3f);
-	return 4;
-    }
-
-    /* 0x00200000 - 0x03FFFFFF:
-       111110xx 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx
-    */
-    if (code <= 0x03FFFFFF) {
-	buf[0] = 0xf8 | (code >> 24);
-	buf[1] = 0x80 | ((code >> 18) & 0x3f);
-	buf[2] = 0x80 | ((code >> 12) & 0x3f);
-	buf[3] = 0x80 | ((code >> 6) & 0x3f);
-	buf[4] = 0x80 | (code & 0x3f);
-	return 5;
-    }
-    
-    /* 0x04000000 - 0x7FFFFFFF:
-       1111110x 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx
-    */
-    if (code <= 0x7FFFFFFF) {
-	buf[0] = 0xfc | (code >> 30);
-	buf[1] = 0x80 | ((code >> 24) & 0x3f);
-	buf[2] = 0x80 | ((code >> 18) & 0x3f);
-	buf[3] = 0x80 | ((code >> 12) & 0x3f);
-	buf[4] = 0x80 | ((code >> 6) & 0x3f);
-	buf[5] = 0x80 | (code & 0x3f);
-	return 6;
-    }
-
-    return -1;
-}
-
-/*
- *  TOML has 3 data structures: value, array, table. 
- *  Each of them can have identification key.
- */
-typedef struct toml_keyval_t toml_keyval_t;
-struct toml_keyval_t {
-    const char* key;		/* key to this value */
-    const char* val;		/* the raw value */
-};
-
-
-struct toml_array_t {
-    const char* key;		/* key to this array */
-    int kind; /* element kind: 'v'alue, 'a'rray, or 't'able */
-    int type; /* for value kind: 'i'nt, 'd'ouble, 'b'ool, 's'tring, 't'ime, 'D'ate, 'T'imestamp */
-    
-    int nelem;			/* number of elements */
-    union {
-	char** val;
-	toml_array_t** arr;
-	toml_table_t** tab;
-    } u;
-};
-    
-
-struct toml_table_t {
-    const char* key;		/* key to this table */
-    int implicit;		/* table was created implicitly */
-
-    /* key-values in the table */
-    int             nkval;
-    toml_keyval_t** kval;
-
-    /* arrays in the table */
-    int            narr;
-    toml_array_t** arr;
-
-    /* tables in the table */
-    int            ntab;
-    toml_table_t** tab;
-};
-
-
-static inline void xfree(const void* x) { if (x) free((void*)x); }
-
-
-enum tokentype_t {
-    INVALID,
-    DOT,
-    COMMA,
-    EQUAL,
-    LBRACE,
-    RBRACE,
-    NEWLINE,
-    LBRACKET,
-    RBRACKET,
-    STRING,
-};
-typedef enum tokentype_t tokentype_t;
-
-typedef struct token_t token_t;
-struct token_t {
-    tokentype_t tok;
-    int         lineno;
-    char*       ptr;
-    int         len;
-    int         eof;
-};
-
-
-typedef struct context_t context_t;
-struct context_t {
-    char* start;
-    char* stop;
-    char* errbuf;
-    int   errbufsz;
-    jmp_buf jmp;
-
-    token_t tok;
-    toml_table_t* root;
-    toml_table_t* curtab;
-
-    struct {
-	int     top;
-	char*   key[10];
-	token_t tok[10];
-    } tpath;
-
-};
-
-#define STRINGIFY(x) #x
-#define TOSTRING(x)  STRINGIFY(x)
-#define FLINE __FILE__ ":" TOSTRING(__LINE__)
-
-static tokentype_t next_token(context_t* ctx, int dotisspecial);
-
-/* error routines. All these functions longjmp to ctx->jmp */
-static int e_outofmemory(context_t* ctx, const char* fline)
-{
-    snprintf(ctx->errbuf, ctx->errbufsz, "ERROR: out of memory (%s)", fline);
-    longjmp(ctx->jmp, 1);
-    return -1;
-}
-
-
-static int e_internal_error(context_t* ctx, const char* fline)
-{
-    snprintf(ctx->errbuf, ctx->errbufsz, "internal error (%s)", fline);
-    longjmp(ctx->jmp, 1);
-    return -1;
-}
-
-static int e_syntax_error(context_t* ctx, int lineno, const char* msg)
-{
-    snprintf(ctx->errbuf, ctx->errbufsz, "line %d: %s", lineno, msg);
-    longjmp(ctx->jmp, 1);
-    return -1;
-}
-
-static int e_bad_key_error(context_t* ctx, int lineno)
-{
-    snprintf(ctx->errbuf, ctx->errbufsz, "line %d: bad key", lineno);
-    longjmp(ctx->jmp, 1);
-    return -1;
-}
-
-/*
-static int e_noimpl(context_t* ctx, const char* feature)
-{
-    snprintf(ctx->errbuf, ctx->errbufsz, "not implemented: %s", feature);
-    longjmp(ctx->jmp, 1);
-    return -1;
-}
-*/
-
-static int e_key_exists_error(context_t* ctx, token_t keytok)
-{
-    char buf[100];
-    int i;
-    for (i = 0; i < keytok.len && i < (int)sizeof(buf) - 1; i++) {
-	buf[i] = keytok.ptr[i];
-    }
-    buf[i] = 0;
-
-    snprintf(ctx->errbuf, ctx->errbufsz,
-	     "line %d: key %s exists", keytok.lineno, buf);
-    longjmp(ctx->jmp, 1);
-    return -1;
-}
-
-
-
-/* 
- * Convert src to raw unescaped utf-8 string.
- * Returns NULL if error with errmsg in errbuf.
- */
-static char* normalize_string(const char* src, int srclen,
-			      int kill_line_ending_backslash,
-			      char* errbuf, int errbufsz)
-{
-    char* dst = 0;		/* will write to dst[] and return it */
-    int   max = 0;		/* max size of dst[] */
-    int   off = 0;		/* cur offset in dst[] */
-    const char* sp = src;
-    const char* sq = src + srclen;
-    int ch;
-
-    /* scan forward on src */
-    for (;;) {
-	if (off >=  max - 10) { /* have some slack for misc stuff */
-	    char* x = realloc(dst, max += 100);
-	    if (!x) {
-		xfree(dst);
-		snprintf(errbuf, errbufsz, "out of memory");
-		return 0;
-	    }
-	    dst = x;
-	}
-	
-	/* finished? */
-	if (sp >= sq) break; 
-	
-	ch = *sp++;
-	if (ch != '\\') {
-	    // a plain copy suffice
-	    dst[off++] = ch;
-	    continue;
-	}
-
-	/* ch was backslash. we expect the escape char. */
-	if (sp >= sq) {
-	    snprintf(errbuf, errbufsz, "last backslash is invalid");
-	    free(dst);
-	    return 0;
-	}
-
-	/* if we want to kill line-ending-backslash ... */
-	if (kill_line_ending_backslash) {
-	    /* if this is a newline immediately following the backslash ... */
-	    if (*sp == '\n' || (*sp == '\r' && sp[1] == '\n')) {
-		/* skip all the following whitespaces */
-		sp += strspn(sp, " \t\r\n");
-		continue;
-	    }
-	}
-
-	/* get the escaped char */
-	ch = *sp++;
-	switch (ch) {
-	case 'u': case 'U':
-	    {
-		int64_t ucs = 0;
-		int nhex = (ch == 'u' ? 4 : 8);
-		for (int i = 0; i < nhex; i++) {
-		    if (sp >= sq) {
-			snprintf(errbuf, errbufsz, "\\%c expects %d hex chars", ch, nhex);
-			free(dst);
-			return 0;
-		    }
-		    ch = *sp++;
-		    int v = ('0' <= ch && ch <= '9')
-			? ch - '0'
-			: (('A' <= ch && ch <= 'F') ? ch - 'A' + 10 : -1);
-		    if (-1 == v) {
-			snprintf(errbuf, errbufsz, "invalid hex chars for \\u or \\U");
-			free(dst);
-			return 0;
-		    }
-		    ucs = ucs * 16 + v;
-		}
-		int n = toml_ucs_to_utf8(ucs, &dst[off]);
-		if (-1 == n) {
-		    snprintf(errbuf, errbufsz, "illegal ucs code in \\u or \\U");
-		    free(dst);
-		    return 0;
-		}
-		off += n;
-	    }
-	    continue;
-
-	case 'b': ch = '\b'; break;
-	case 't': ch = '\t'; break;
-	case 'n': ch = '\n'; break;
-	case 'f': ch = '\f'; break;
-	case 'r': ch = '\r'; break;
-	case '"':  ch = '"'; break;
-	case '\\': ch = '\\'; break;
-	default: 
-	    snprintf(errbuf, errbufsz, "illegal escape char \\%c", ch);
-	    free(dst);
-	    return 0;
-	}
-
-	dst[off++] = ch;
-    }
-
-    // Cap with NUL and return it.
-    dst[off++] = 0; 
-    return dst;
-}
-
-
-/* Normalize a key. Convert all special chars to raw unescaped utf-8 chars. */
-static char* normalize_key(context_t* ctx, token_t strtok)
-{
-    const char* sp = strtok.ptr;
-    const char* sq = strtok.ptr + strtok.len;
-    int lineno = strtok.lineno;
-    char* ret;
-    int ch = *sp;
-    char ebuf[80];
-
-    /* handle quoted string */
-    if (ch == '\'' || ch == '\"') {
-	/* if ''' or """, take 3 chars off front and back. Else, take 1 char off. */
-	if (sp[1] == ch && sp[2] == ch) 
-	    sp += 3, sq -= 3;
-	else
-	    sp++, sq--;
-
-	if (ch == '\'') {
-	    /* for single quote, take it verbatim. */
-	    if (! (ret = strndup(sp, sq - sp))) {
-                e_outofmemory(ctx, FLINE);
-                return 0;       /* not reached */
-            }
-	} else {
-	    /* for double quote, we need to normalize */
-	    ret = normalize_string(sp, sq - sp, 0, ebuf, sizeof(ebuf));
-	    if (!ret) {
-		snprintf(ctx->errbuf, ctx->errbufsz, "line %d: %s", lineno, ebuf);
-		longjmp(ctx->jmp, 1);
-	    }
-	}
-
-	/* newlines are not allowed in keys */
-	if (strchr(ret, '\n')) {
-	    free(ret);
-	    e_bad_key_error(ctx, lineno);
-            return 0;           /* not reached */
-	}
-	return ret;
-    }
-	
-    /* for bare-key allow only this regex: [A-Za-z0-9_-]+ */
-    const char* xp;
-    for (xp = sp; xp != sq; xp++) {
-	int k = *xp;
-	if (isalnum(k)) continue;
-	if (k == '_' || k == '-') continue;
-	e_bad_key_error(ctx, lineno);
-        return 0;               /* not reached */
-    }
-
-    /* dup and return it */
-    if (! (ret = strndup(sp, sq - sp))) {
-        e_outofmemory(ctx, FLINE);
-        return 0;               /* not reached */
-    }
-    return ret;
-}
-
-
-/* 
- * Look up key in tab. Return 0 if not found, or
- * 'v'alue, 'a'rray or 't'able depending on the element.
- */
-static int check_key(toml_table_t* tab, const char* key,
-		     toml_keyval_t** ret_val,
-		     toml_array_t** ret_arr,
-		     toml_table_t** ret_tab)
-{
-    int i;
-    void* dummy;
-
-    if (!ret_tab) ret_tab = (toml_table_t**) &dummy;
-    if (!ret_arr) ret_arr = (toml_array_t**) &dummy;
-    if (!ret_val) ret_val = (toml_keyval_t**) &dummy;
-
-    *ret_tab = 0; *ret_arr = 0; *ret_val = 0;
-    
-    for (i = 0; i < tab->nkval; i++) {
-	if (0 == strcmp(key, tab->kval[i]->key)) {
-	    *ret_val = tab->kval[i];
-	    return 'v';
-	}
-    }
-    for (i = 0; i < tab->narr; i++) {
-	if (0 == strcmp(key, tab->arr[i]->key)) {
-	    *ret_arr = tab->arr[i];
-	    return 'a';
-	}
-    }
-    for (i = 0; i < tab->ntab; i++) {
-	if (0 == strcmp(key, tab->tab[i]->key)) {
-	    *ret_tab = tab->tab[i];
-	    return 't';
-	}
-    }
-    return 0;
-}
-
-/* Create a keyval in the table. 
- */
-static toml_keyval_t* create_keyval_in_table(context_t* ctx, toml_table_t* tab, token_t keytok)
-{
-    /* first, normalize the key to be used for lookup. 
-     * remember to free it if we error out. 
-     */
-    char* newkey = normalize_key(ctx, keytok);
-
-    /* if key exists: error out. */
-    toml_keyval_t* dest = 0;
-    if (check_key(tab, newkey, 0, 0, 0)) {
-	free(newkey);
-	e_key_exists_error(ctx, keytok);
-        return 0;               /* not reached */
-    }
-
-    /* make a new entry */
-    int n = tab->nkval;
-    toml_keyval_t** base;
-    if (0 == (base = (toml_keyval_t**) realloc(tab->kval, (n+1) * sizeof(*base)))) {
-	free(newkey);
-	e_outofmemory(ctx, FLINE);
-        return 0;               /* not reached */
-    }
-    tab->kval = base;
-    
-    if (0 == (base[n] = (toml_keyval_t*) calloc(1, sizeof(*base[n])))) {
-	free(newkey);
-	e_outofmemory(ctx, FLINE);
-        return 0;               /* not reached */
-    }
-    dest = tab->kval[tab->nkval++];
-
-    /* save the key in the new value struct */
-    dest->key = newkey;
-    return dest;
-}
-
-
-/* Create a table in the table.
- */
-static toml_table_t* create_keytable_in_table(context_t* ctx, toml_table_t* tab, token_t keytok)
-{
-    /* first, normalize the key to be used for lookup. 
-     * remember to free it if we error out. 
-     */
-    char* newkey = normalize_key(ctx, keytok);
-
-    /* if key exists: error out */
-    toml_table_t* dest = 0;
-    if (check_key(tab, newkey, 0, 0, &dest)) {
-	free(newkey);		/* don't need this anymore */
-	
-	/* special case: if table exists, but was created implicitly ... */
-	if (dest && dest->implicit) {
-	    /* we make it explicit now, and simply return it. */
-	    dest->implicit = 0;
-	    return dest;
-	}
-	e_key_exists_error(ctx, keytok);
-        return 0;               /* not reached */
-    }
-
-    /* create a new table entry */
-    int n = tab->ntab;
-    toml_table_t** base;
-    if (0 == (base = (toml_table_t**) realloc(tab->tab, (n+1) * sizeof(*base)))) {
-	free(newkey);
-	e_outofmemory(ctx, FLINE);
-        return 0;               /* not reached */
-    }
-    tab->tab = base;
-	
-    if (0 == (base[n] = (toml_table_t*) calloc(1, sizeof(*base[n])))) {
-	free(newkey);
-	e_outofmemory(ctx, FLINE);
-        return 0;               /* not reached */
-    }
-    dest = tab->tab[tab->ntab++];
-    
-    /* save the key in the new table struct */
-    dest->key = newkey;
-    return dest;
-}
-
-
-/* Create an array in the table.
- */
-static toml_array_t* create_keyarray_in_table(context_t* ctx,
-					      toml_table_t* tab,
-					      token_t keytok,
-					      int skip_if_exist)
-{
-    /* first, normalize the key to be used for lookup. 
-     * remember to free it if we error out. 
-     */
-    char* newkey = normalize_key(ctx, keytok);
-    
-    /* if key exists: error out */
-    toml_array_t* dest = 0;
-    if (check_key(tab, newkey, 0, &dest, 0)) {
-	free(newkey); 		/* don't need this anymore */
-
-	/* special case skip if exists? */
-	if (skip_if_exist) return dest;
-	
-	e_key_exists_error(ctx, keytok);
-        return 0;               /* not reached */
-    }
-
-    /* make a new array entry */
-    int n = tab->narr;
-    toml_array_t** base;
-    if (0 == (base = (toml_array_t**) realloc(tab->arr, (n+1) * sizeof(*base)))) {
-	free(newkey);
-	e_outofmemory(ctx, FLINE);
-        return 0;               /* not reached */
-    }
-    tab->arr = base;
-	
-    if (0 == (base[n] = (toml_array_t*) calloc(1, sizeof(*base[n])))) {
-	free(newkey);
-	e_outofmemory(ctx, FLINE);
-        return 0;               /* not reached */
-    }
-    dest = tab->arr[tab->narr++];
-
-    /* save the key in the new array struct */
-    dest->key = newkey;
-    return dest;
-}
-
-/* Create an array in an array 
- */
-static toml_array_t* create_array_in_array(context_t* ctx,
-					   toml_array_t* parent)
-{
-    int n = parent->nelem;
-    toml_array_t** base;
-    if (0 == (base = (toml_array_t**) realloc(parent->u.arr, (n+1) * sizeof(*base)))) {
-	e_outofmemory(ctx, FLINE);
-        return 0;               /* not reached */
-    }
-    parent->u.arr = base;
-    
-    if (0 == (base[n] = (toml_array_t*) calloc(1, sizeof(*base[n])))) {
-	e_outofmemory(ctx, FLINE);
-        return 0;               /* not reached */
-    }
-
-    return parent->u.arr[parent->nelem++];
-}
-
-/* Create a table in an array 
- */
-static toml_table_t* create_table_in_array(context_t* ctx,
-					   toml_array_t* parent)
-{
-    int n = parent->nelem;
-    toml_table_t** base;
-    if (0 == (base = (toml_table_t**) realloc(parent->u.tab, (n+1) * sizeof(*base)))) {
-	e_outofmemory(ctx, FLINE);
-        return 0;               /* not reached */
-    }
-    parent->u.tab = base;
-    
-    if (0 == (base[n] = (toml_table_t*) calloc(1, sizeof(*base[n])))) {
-	e_outofmemory(ctx, FLINE);
-        return 0;               /* not reached */
-    }
-
-    return parent->u.tab[parent->nelem++];
-}
-
-
-#define SKIP_NEWLINES(ctx)  while (ctx->tok.tok == NEWLINE) next_token(ctx, 0)
-#define EAT_TOKEN(ctx, typ) \
-    if ((ctx)->tok.tok != typ) e_internal_error(ctx, FLINE); else next_token(ctx, 0)
-
-
-static void parse_keyval(context_t* ctx, toml_table_t* tab);
-
-
-/* We are at '{ ... }'.
- * Parse the table.
- */
-static void parse_table(context_t* ctx, toml_table_t* tab)
-{
-    EAT_TOKEN(ctx, LBRACE);
-
-    for (;;) {
-	SKIP_NEWLINES(ctx);
-
-	/* until } */
-	if (ctx->tok.tok == RBRACE) break;
-
-	if (ctx->tok.tok != STRING) {
-            e_syntax_error(ctx, ctx->tok.lineno, "syntax error");
-            return;             /* not reached */
-	}
-        parse_keyval(ctx, tab);
-	SKIP_NEWLINES(ctx);
-
-	/* on comma, continue to scan for next keyval */
-	if (ctx->tok.tok == COMMA) {
-	    EAT_TOKEN(ctx, COMMA);
-	    continue;
-	}
-	break;
-    }
-
-    if (ctx->tok.tok != RBRACE) {
-	e_syntax_error(ctx, ctx->tok.lineno, "syntax error");
-        return;                 /* not reached */
-    }
-
-    EAT_TOKEN(ctx, RBRACE);
-}
-
-static int valtype(const char* val)
-{
-    toml_timestamp_t ts;
-    if (*val == '\'' || *val == '"') return 's';
-    if (0 == toml_rtob(val, 0)) return 'b';
-    if (0 == toml_rtoi(val, 0)) return 'i';
-    if (0 == toml_rtod(val, 0)) return 'd';
-    if (0 == toml_rtots(val, &ts)) {
-	if (ts.year && ts.hour) return 'T'; /* timestamp */
-	if (ts.year) return 'D'; /* date */
-	return 't'; /* time */
-    }
-    return 'u'; /* unknown */
-}
-
-
-/* We are at '[...]' */
-static void parse_array(context_t* ctx, toml_array_t* arr)
-{
-    EAT_TOKEN(ctx, LBRACKET);
-
-    for (;;) {
-	SKIP_NEWLINES(ctx);
-	
-	/* until ] */
-	if (ctx->tok.tok == RBRACKET) break;
-
-	switch (ctx->tok.tok) {
-	case STRING:
-	    {
-		char* val = ctx->tok.ptr;
-		int   vlen = ctx->tok.len;
-
-		/* set array kind if this will be the first entry */
-		if (arr->kind == 0) arr->kind = 'v';
-		/* check array kind */
-		if (arr->kind != 'v') {
-		    e_syntax_error(ctx, ctx->tok.lineno,
-                                   "a string array can only contain strings");
-                    return;     /* not reached */
-		}
-
-		/* make a new value in array */
-		char** tmp = (char**) realloc(arr->u.val, (arr->nelem+1) * sizeof(*tmp));
-		if (!tmp) {
-                    e_outofmemory(ctx, FLINE);
-                    return;     /* not reached */
-                }
-		arr->u.val = tmp;
-		if (! (val = strndup(val, vlen))) {
-                    e_outofmemory(ctx, FLINE);
-                    return;     /* not reached */
-                }
-		arr->u.val[arr->nelem++] = val;
-
-		/* set array type if this is the first entry, or check that the types matched. */
-		if (arr->nelem == 1) 
-		    arr->type = valtype(arr->u.val[0]);
-		else if (arr->type != valtype(val)) {
-		    e_syntax_error(ctx, ctx->tok.lineno, "array type mismatch");
-                    return;     /* not reached */
-                }
-
-		EAT_TOKEN(ctx, STRING);
-		break;
-	    }
-
-	case LBRACKET:
-	    { /* [ [array], [array] ... ] */
-		/* set the array kind if this will be the first entry */
-		if (arr->kind == 0) arr->kind = 'a';
-		/* check array kind */
-		if (arr->kind != 'a') {
-		    e_syntax_error(ctx, ctx->tok.lineno, "array type mismatch");
-                    return;     /* not reached */
-		}
-		parse_array(ctx, create_array_in_array(ctx, arr));
-		break;
-	    }
-
-	case LBRACE:
-	    { /* [ {table}, {table} ... ] */
-		/* set the array kind if this will be the first entry */
-		if (arr->kind == 0) arr->kind = 't';
-		/* check array kind */
-		if (arr->kind != 't') {
-		    e_syntax_error(ctx, ctx->tok.lineno, "array type mismatch");
-                    return;     /* not reached */
-		}
-		parse_table(ctx, create_table_in_array(ctx, arr));
-		break;
-	    }
-	    
-	default:
-	    e_syntax_error(ctx, ctx->tok.lineno, "syntax error");
-            return;             /* not reached */
-	}
-
-	SKIP_NEWLINES(ctx);
-
-	/* on comma, continue to scan for next element */
-	if (ctx->tok.tok == COMMA) {
-	    EAT_TOKEN(ctx, COMMA);
-	    continue;
-	}
-	break;
-    }
-
-    if (ctx->tok.tok != RBRACKET) {
-	e_syntax_error(ctx, ctx->tok.lineno, "syntax error");
-        return;                 /* not reached */
-    }
-
-    EAT_TOKEN(ctx, RBRACKET);
-}
-
-
-
-/* handle lines like these:
-    key = "value"
-    key = [ array ]
-    key = { table }
-*/
-static void parse_keyval(context_t* ctx, toml_table_t* tab)
-{
-    if (ctx->tok.tok != STRING) {
-	e_internal_error(ctx, FLINE);
-        return;                 /* not reached */
-    }
-
-    token_t key = ctx->tok;
-
-    EAT_TOKEN(ctx, STRING);
-    if (ctx->tok.tok != EQUAL) {
-	e_syntax_error(ctx, ctx->tok.lineno, "missing =");
-        return;                 /* not reached */
-    }
-
-    EAT_TOKEN(ctx, EQUAL);
-
-    switch (ctx->tok.tok) {
-    case STRING:
-	{ /* key = "value" */
-	    toml_keyval_t* keyval = create_keyval_in_table(ctx, tab, key);
-	    token_t val = ctx->tok;
-	    assert(keyval->val == 0);
-	    keyval->val = strndup(val.ptr, val.len);
-	    if (! keyval->val) {
-                e_outofmemory(ctx, FLINE);
-                return;         /* not reached */
-            }
-
-	    EAT_TOKEN(ctx, STRING);
-	    
-	    return;
-	}
-
-    case LBRACKET:
-	{ /* key = [ array ] */
-	    toml_array_t* arr = create_keyarray_in_table(ctx, tab, key, 0);
-	    parse_array(ctx, arr);
-	    return;
-	}
-
-    case LBRACE:
-	{ /* key = { table } */
-	    toml_table_t* nxttab = create_keytable_in_table(ctx, tab, key);
-	    parse_table(ctx, nxttab);
-	    return;
-	}
-
-    default:
-	e_syntax_error(ctx, ctx->tok.lineno, "syntax error");
-        return;                 /* not reached */
-    }
-}
-
-
-typedef struct tabpath_t tabpath_t;
-struct tabpath_t {
-    int     cnt;
-    token_t key[10];
-};
-
-/* at [x.y.z] or [[x.y.z]]
- * Scan forward and fill tabpath until it enters ] or ]]
- * There will be at least one entry on return.
- */
-static void fill_tabpath(context_t* ctx)
-{
-    int lineno = ctx->tok.lineno;
-    int i;
-    
-    /* clear tpath */
-    for (i = 0; i < ctx->tpath.top; i++) {
-	char** p = &ctx->tpath.key[i];
-	xfree(*p);
-	*p = 0;
-    }
-    ctx->tpath.top = 0;
-    
-    for (;;) {
-	if (ctx->tpath.top >= 10) {
-	    e_syntax_error(ctx, lineno, "table path is too deep; max allowed is 10.");
-            return;             /* not reached */
-        }
-
-	if (ctx->tok.tok != STRING) {
-	    e_syntax_error(ctx, lineno, "invalid or missing key");
-            return;             /* not reached */
-        }
-
-	ctx->tpath.tok[ctx->tpath.top] = ctx->tok;
-	ctx->tpath.key[ctx->tpath.top] = normalize_key(ctx, ctx->tok);
-	ctx->tpath.top++;
-	
-	next_token(ctx, 1);
-
-	if (ctx->tok.tok == RBRACKET) break;
-
-	if (ctx->tok.tok != DOT) {
-	    e_syntax_error(ctx, lineno, "invalid key");
-            return;             /* not reached */
-        }
-
-	next_token(ctx, 1);
-    }
-
-    if (ctx->tpath.top <= 0) {
-	e_syntax_error(ctx, lineno, "empty table selector");
-        return;                 /* not reached */
-    }
-}
-
-
-/* Walk tabpath from the root, and create new tables on the way.
- * Sets ctx->curtab to the final table.
- */
-static void walk_tabpath(context_t* ctx)
-{
-    /* start from root */
-    toml_table_t* curtab = ctx->root;
-    
-    for (int i = 0; i < ctx->tpath.top; i++) {
-	const char* key = ctx->tpath.key[i];
-
-	toml_keyval_t* nextval = 0;
-	toml_array_t* nextarr = 0;
-	toml_table_t* nexttab = 0;
-	switch (check_key(curtab, key, &nextval, &nextarr, &nexttab)) {
-	case 't':
-	    /* found a table. nexttab is where we will go next. */
-	    break;
-
-	case 'a':
-	    /* found an array. nexttab is the last table in the array. */
-	    if (nextarr->kind != 't') {
-                e_internal_error(ctx, FLINE);
-                return;         /* not reached */
-            }
-	    if (nextarr->nelem == 0) {
-                e_internal_error(ctx, FLINE);
-                return;         /* not reached */
-            }
-	    nexttab = nextarr->u.tab[nextarr->nelem-1];
-	    break;
-
-	case 'v':
-	    e_key_exists_error(ctx, ctx->tpath.tok[i]);
-            return;             /* not reached */
-
-	default:
-	    { /* Not found. Let's create an implicit table. */
-		int n = curtab->ntab;
-		toml_table_t** base = (toml_table_t**) realloc(curtab->tab, (n+1) * sizeof(*base));
-		if (0 == base) {
-                    e_outofmemory(ctx, FLINE);
-                    return;     /* not reached */
-                }
-		curtab->tab = base;
-		
-		if (0 == (base[n] = (toml_table_t*) calloc(1, sizeof(*base[n])))) {
-		    e_outofmemory(ctx, FLINE);
-                    return;     /* not reached */
-                }
-		
-		if (0 == (base[n]->key = strdup(key))) {
-		    e_outofmemory(ctx, FLINE);
-                    return;     /* not reached */
-                }
-		
-		nexttab = curtab->tab[curtab->ntab++];
-		
-		/* tabs created by walk_tabpath are considered implicit */
-		nexttab->implicit = 1;
-	    }
-	    break;
-	}
-
-	/* switch to next tab */
-	curtab = nexttab;
-    }
-
-    /* save it */
-    ctx->curtab = curtab;
-}
-
-    
-/* handle lines like [x.y.z] or [[x.y.z]] */
-static void parse_select(context_t* ctx)
-{
-    int count_lbracket = 0;
-    if (ctx->tok.tok != LBRACKET) {
-        e_internal_error(ctx, FLINE);
-        return;                 /* not reached */
-    }
-    count_lbracket++;
-    next_token(ctx, 1 /* DOT IS SPECIAL */);
-    if (ctx->tok.tok == LBRACKET) {
-	count_lbracket++;
-	next_token(ctx, 1 /* DOT IS SPECIAL */);
-    }
-
-    fill_tabpath(ctx);
-
-    /* For [x.y.z] or [[x.y.z]], remove z from tpath. 
-     */
-    token_t z = ctx->tpath.tok[ctx->tpath.top-1];
-    free(ctx->tpath.key[ctx->tpath.top-1]);
-    ctx->tpath.top--;
-    
-    walk_tabpath(ctx);
-
-    if (count_lbracket == 1) {
-	/* [x.y.z] -> create z = {} in x.y */
-	ctx->curtab = create_keytable_in_table(ctx, ctx->curtab, z);
-    } else {
-	/* [[x.y.z]] -> create z = [] in x.y */
-	toml_array_t* arr = create_keyarray_in_table(ctx, ctx->curtab, z,
-						     1 /*skip_if_exist*/);
-        if (!arr) {
-            e_syntax_error(ctx, z.lineno, "key exists");
-            return;
-        }
-	if (arr->kind == 0) arr->kind = 't';
-	if (arr->kind != 't') {
-            e_syntax_error(ctx, z.lineno, "array mismatch");
-            return;             /* not reached */
-        }
-
-	/* add to z[] */
-	toml_table_t* dest;
-	{
-	    int n = arr->nelem;
-	    toml_table_t** base = realloc(arr->u.tab, (n+1) * sizeof(*base));
-	    if (0 == base) {
-                e_outofmemory(ctx, FLINE);
-                return;         /* not reached */
-            }
-	    arr->u.tab = base;
-	    
-	    if (0 == (base[n] = calloc(1, sizeof(*base[n])))) {
-		e_outofmemory(ctx, FLINE);
-                return;         /* not reached */
-            }
-	    
-            if (0 == (base[n]->key = strdup("__anon__"))) {
-		e_outofmemory(ctx, FLINE);
-                return;         /* not reached */
-            }
-	    
-	    dest = arr->u.tab[arr->nelem++];
-	}
-
-	ctx->curtab = dest;
-    }
-
-    if (ctx->tok.tok != RBRACKET) {
-        e_syntax_error(ctx, ctx->tok.lineno, "expects ]");
-        return;                 /* not reached */
-    }
-    EAT_TOKEN(ctx, RBRACKET);
-
-    if (count_lbracket == 2) {
-	if (ctx->tok.tok != RBRACKET) {
-            e_syntax_error(ctx, ctx->tok.lineno, "expects ]]");
-            return;             /* not reached */
-        }
-	EAT_TOKEN(ctx, RBRACKET);
-    }
-    if (ctx->tok.tok != NEWLINE) {
-        e_syntax_error(ctx, ctx->tok.lineno, "extra chars after ] or ]]");
-        return;                 /* not reached */
-    }
-}
-
-
-
-
-toml_table_t* toml_parse(char* conf,
-			 char* errbuf,
-			 int errbufsz)
-{
-    context_t ctx;
-
-    // clear errbuf 
-    if (errbufsz <= 0) errbufsz = 0;
-    if (errbufsz > 0)  errbuf[0] = 0;
-
-    // init context 
-    memset(&ctx, 0, sizeof(ctx));
-    ctx.start = conf;
-    ctx.stop = ctx.start + strlen(conf);
-    ctx.errbuf = errbuf;
-    ctx.errbufsz = errbufsz;
-
-    // start with an artificial newline of length 0
-    ctx.tok.tok = NEWLINE; 
-    ctx.tok.lineno = 1;
-    ctx.tok.ptr = conf;
-    ctx.tok.len = 0;
-
-    // make a root table
-    if (0 == (ctx.root = calloc(1, sizeof(*ctx.root)))) {
-        /* do not call outofmemory() here... setjmp not done yet */
-        snprintf(ctx.errbuf, ctx.errbufsz, "ERROR: out of memory (%s)", FLINE);
-        return 0;
-    }
-
-    // set root as default table
-    ctx.curtab = ctx.root;
-
-    if (0 != setjmp(ctx.jmp)) {
-	// Got here from a long_jmp. Something bad has happened.
-	// Free resources and return error.
-	for (int i = 0; i < ctx.tpath.top; i++) xfree(ctx.tpath.key[i]);
-	toml_free(ctx.root);
-	return 0;
-    }
-
-    /* Scan forward until EOF */
-    for (token_t tok = ctx.tok; ! tok.eof ; tok = ctx.tok) {
-	switch (tok.tok) {
-	    
-	case NEWLINE:
-	    next_token(&ctx, 1);
-	    break;
-	    
-	case STRING:
-	    parse_keyval(&ctx, ctx.curtab);
-	    if (ctx.tok.tok != NEWLINE) {
-                e_syntax_error(&ctx, ctx.tok.lineno, "extra chars after value");
-                return 0;         /* not reached */
-            }
-
-	    EAT_TOKEN(&ctx, NEWLINE);
-	    break;
-	    
-	case LBRACKET:  /* [ x.y.z ] or [[ x.y.z ]] */
-	    parse_select(&ctx);
-	    break;
-	    
-	default:
-	    snprintf(ctx.errbuf, ctx.errbufsz, "line %d: syntax error", tok.lineno);
-	    longjmp(ctx.jmp, 1);
-	}
-    }
-
-    /* success */
-    for (int i = 0; i < ctx.tpath.top; i++) xfree(ctx.tpath.key[i]);
-    return ctx.root;
-}
-
-
-toml_table_t* toml_parse_file(FILE* fp,
-			      char* errbuf,
-			      int errbufsz)
-{
-    int bufsz = 0;
-    char* buf = 0;
-    int off = 0;
-
-    /* prime the buf[] */
-    bufsz = 1000;
-    if (! (buf = malloc(bufsz + 1))) {
-        snprintf(errbuf, errbufsz, "out of memory");
-        return 0;
-    }
-
-    /* read from fp into buf */
-    while (! feof(fp)) {
-	bufsz += 1000;
-	
-	/* Allocate 1 extra byte because we will tag on a NUL */
-	char* x = realloc(buf, bufsz + 1);
-	if (!x) {
-	    snprintf(errbuf, errbufsz, "out of memory");
-	    xfree(buf);
-	    return 0;
-	}
-	buf = x;
-
-	errno = 0;
-	int n = fread(buf + off, 1, bufsz - off, fp);
-	if (ferror(fp)) {
-	    snprintf(errbuf, errbufsz, "%s",
-		     errno ? strerror(errno) : "Error reading file");
-	    free(buf);
-	    return 0;
-	}
-	off += n;
-    }
-
-    /* tag on a NUL to cap the string */
-    buf[off] = 0; /* we accounted for this byte in the realloc() above. */
-
-    /* parse it, cleanup and finish */
-    toml_table_t* ret = toml_parse(buf, errbuf, errbufsz);
-    free(buf);
-    return ret;
-}
-
-
-static void xfree_kval(toml_keyval_t* p)
-{
-    if (!p) return;
-    xfree(p->key);
-    xfree(p->val);
-    xfree(p);
-}
-
-static void xfree_tab(toml_table_t* p);
-
-static void xfree_arr(toml_array_t* p)
-{
-    if (!p) return;
-
-    xfree(p->key);
-    switch (p->kind) {
-    case 'v':
-	for (int i = 0; i < p->nelem; i++) xfree(p->u.val[i]);
-	xfree(p->u.val);
-	break;
-
-    case 'a':
-	for (int i = 0; i < p->nelem; i++) xfree_arr(p->u.arr[i]);
-	xfree(p->u.arr);
-	break;
-
-    case 't':
-	for (int i = 0; i < p->nelem; i++) xfree_tab(p->u.tab[i]);
-	xfree(p->u.tab);
-	break;
-    }
-
-    xfree(p);
-}
-
-
-static void xfree_tab(toml_table_t* p)
-{
-    int i;
-    
-    if (!p) return;
-    
-    xfree(p->key);
-    
-    for (i = 0; i < p->nkval; i++) xfree_kval(p->kval[i]);
-    xfree(p->kval);
-
-    for (i = 0; i < p->narr; i++) xfree_arr(p->arr[i]);
-    xfree(p->arr);
-
-    for (i = 0; i < p->ntab; i++) xfree_tab(p->tab[i]);
-    xfree(p->tab);
-
-    xfree(p);
-}
-
-
-void toml_free(toml_table_t* tab)
-{
-    xfree_tab(tab);
-}
-
-
-static tokentype_t ret_token(context_t* ctx, tokentype_t tok, int lineno, char* ptr, int len)
-{
-    token_t t;
-    t.tok = tok;
-    t.lineno = lineno;
-    t.ptr = ptr;
-    t.len = len;
-    t.eof = 0;
-    ctx->tok = t;
-    return tok;
-}
-
-static tokentype_t ret_eof(context_t* ctx, int lineno)
-{
-    ret_token(ctx, NEWLINE, lineno, ctx->stop, 0);
-    ctx->tok.eof = 1;
-    return ctx->tok.tok;
-}
-    
-
-static tokentype_t scan_string(context_t* ctx, char* p, int lineno, int dotisspecial)
-{
-    char* orig = p;
-    if (0 == strncmp(p, "'''", 3)) {
-	p = strstr(p + 3, "'''");
-	if (0 == p) {
-	    e_syntax_error(ctx, lineno, "unterminated triple-s-quote");
-            return 0;           /* not reached */
-        }
-
-	return ret_token(ctx, STRING, lineno, orig, p + 3 - orig);
-    }
-
-    if (0 == strncmp(p, "\"\"\"", 3)) {
-	int hexreq = 0;		/* #hex required */
-	int escape = 0;
-	int qcnt = 0;		/* count quote */
-	for (p += 3; *p && qcnt < 3; p++) {
-	    if (escape) {
-		escape = 0;
-		if (strchr("btnfr\"\\", *p)) continue;
-		if (*p == 'u') { hexreq = 4; continue; }
-		if (*p == 'U') { hexreq = 8; continue; }
-		if (*p == '\n') continue; /* allow for line ending backslash */
-		e_syntax_error(ctx, lineno, "bad escape char");
-                return 0;       /* not reached */
-	    }
-	    if (hexreq) {
-		hexreq--;
-		if (strchr("0123456789ABCDEF", *p)) continue;
-		e_syntax_error(ctx, lineno, "expect hex char");
-                return 0;       /* not reached */
-	    }
-	    if (*p == '\\') { escape = 1; continue; }
-	    qcnt = (*p == '"') ? qcnt + 1 : 0; 
-	}
-	if (qcnt != 3) {
-	    e_syntax_error(ctx, lineno, "unterminated triple-quote");
-            return 0;           /* not reached */
-        }
-
-	return ret_token(ctx, STRING, lineno, orig, p - orig);
-    }
-
-    if ('\'' == *p) {
-	for (p++; *p && *p != '\n' && *p != '\''; p++);
-	if (*p != '\'') {
-	    e_syntax_error(ctx, lineno, "unterminated s-quote");
-            return 0;           /* not reached */
-        }
-
-	return ret_token(ctx, STRING, lineno, orig, p + 1 - orig);
-    }
-
-    if ('\"' == *p) {
-	int hexreq = 0;		/* #hex required */
-	int escape = 0;
-	for (p++; *p; p++) {
-	    if (escape) {
-		escape = 0;
-		if (strchr("btnfr\"\\", *p)) continue;
-		if (*p == 'u') { hexreq = 4; continue; }
-		if (*p == 'U') { hexreq = 8; continue; }
-		e_syntax_error(ctx, lineno, "bad escape char");
-                return 0;       /* not reached */
-	    }
-	    if (hexreq) {
-		hexreq--;
-		if (strchr("0123456789ABCDEF", *p)) continue;
-		e_syntax_error(ctx, lineno, "expect hex char");
-                return 0;       /* not reached */
-	    }
-	    if (*p == '\\') { escape = 1; continue; }
-	    if (*p == '\n') break;
-	    if (*p == '"') break;
-	}
-	if (*p != '"') {
-	    e_syntax_error(ctx, lineno, "unterminated quote");
-            return 0;           /* not reached */
-        }
-
-	return ret_token(ctx, STRING, lineno, orig, p + 1 - orig);
-    }
-
-    for ( ; *p && *p != '\n'; p++) {
-	int ch = *p;
-	if (ch == '.' && dotisspecial) break;
-	if ('A' <= ch && ch <= 'Z') continue;
-	if ('a' <= ch && ch <= 'z') continue;
-	if ('0' <= ch && ch <= '9') continue;
-	if (strchr("+-_.:", ch)) continue;
-	break;
-    }
-
-    return ret_token(ctx, STRING, lineno, orig, p - orig);
-}
-
-
-static tokentype_t next_token(context_t* ctx, int dotisspecial)
-{
-    int   lineno = ctx->tok.lineno;
-    char* p = ctx->tok.ptr;
-    int i;
-
-    /* eat this tok */
-    for (i = 0; i < ctx->tok.len; i++) {
-	if (*p++ == '\n')
-	    lineno++;
-    }
-
-    /* make next tok */
-    while (p < ctx->stop) {
-	/* skip comment. stop just before the \n. */
-	if (*p == '#') {
-	    for (p++; p < ctx->stop && *p != '\n'; p++);
-	    continue;
-	}
-
-	if (dotisspecial && *p == '.')
-	    return ret_token(ctx, DOT, lineno, p, 1);
-	
-	switch (*p) {
-	case ',': return ret_token(ctx, COMMA, lineno, p, 1);
-	case '=': return ret_token(ctx, EQUAL, lineno, p, 1);
-	case '{': return ret_token(ctx, LBRACE, lineno, p, 1);
-	case '}': return ret_token(ctx, RBRACE, lineno, p, 1);
-	case '[': return ret_token(ctx, LBRACKET, lineno, p, 1);
-	case ']': return ret_token(ctx, RBRACKET, lineno, p, 1);
-	case '\n': return ret_token(ctx, NEWLINE, lineno, p, 1);
-	case '\r': case ' ': case '\t':
-	    /* ignore white spaces */
-	    p++;
-	    continue;
-	}
-
-	return scan_string(ctx, p, lineno, dotisspecial);
-    }
-
-    return ret_eof(ctx, lineno);
-}
-
-
-const char* toml_key_in(toml_table_t* tab, int keyidx)
-{
-    if (keyidx < tab->nkval) return tab->kval[keyidx]->key;
-    
-    keyidx -= tab->nkval;
-    if (keyidx < tab->narr)  return tab->arr[keyidx]->key;
-    
-    keyidx -= tab->narr;
-    if (keyidx < tab->ntab)  return tab->tab[keyidx]->key;
-
-    return 0;
-}
-
-
-const char* toml_raw_in(toml_table_t* tab, const char* key)
-{
-    int i;
-    for (i = 0; i < tab->nkval; i++) {
-	if (0 == strcmp(key, tab->kval[i]->key))
-	    return tab->kval[i]->val;
-    }
-    return 0;
-}
-
-toml_array_t* toml_array_in(toml_table_t* tab, const char* key)
-{
-    int i;
-    for (i = 0; i < tab->narr; i++) {
-	if (0 == strcmp(key, tab->arr[i]->key))
-	    return tab->arr[i];
-    }
-    return 0;
-}
-
-
-toml_table_t* toml_table_in(toml_table_t* tab, const char* key)
-{
-    int i;
-    for (i = 0; i < tab->ntab; i++) {
-	if (0 == strcmp(key, tab->tab[i]->key))
-	    return tab->tab[i];
-    }
-    return 0;
-}
-
-const char* toml_raw_at(toml_array_t* arr, int idx)
-{
-    if (arr->kind != 'v')
-	return 0;
-    if (! (0 <= idx && idx < arr->nelem))
-	return 0;
-    return arr->u.val[idx];
-}
-
-char toml_array_kind(toml_array_t* arr)
-{
-    return arr->kind;
-}
-
-
-
-toml_array_t* toml_array_at(toml_array_t* arr, int idx)
-{
-    if (arr->kind != 'a')
-	return 0;
-    if (! (0 <= idx && idx < arr->nelem))
-	return 0;
-    return arr->u.arr[idx];
-}
-
-toml_table_t* toml_table_at(toml_array_t* arr, int idx)
-{
-    if (arr->kind != 't')
-	return 0;
-    if (! (0 <= idx && idx < arr->nelem))
-	return 0;
-    return arr->u.tab[idx];
-}
-
-
-int toml_rtots(const char* src_, toml_timestamp_t* ret)
-{
-    if (! src_) return -1;
-    
-    const char* p = src_;
-    const char* q = src_ + strlen(src_);
-    int64_t val;
-    int i;
-    
-    memset(ret, 0, sizeof(*ret));
-
-    /* parse date */
-    val = 0;
-    if (q - p > 4 && p[4] == '-') {
-	for (i = 0; i < 10; i++, p++) {
-	    int xx = *p;
-	    if (xx == '-') {
-		if (i == 4 || i == 7) continue; else return -1;
-	    }
-	    if (! ('0' <= xx && xx <= '9')) return -1;
-	    val = val * 10 + (xx - '0');
-	}
-	ret->day   = &ret->__buffer.day;
-	ret->month = &ret->__buffer.month;
-	ret->year  = &ret->__buffer.year;
-	
-	*ret->day   = val % 100; val /= 100;
-	*ret->month = val % 100; val /= 100;
-	*ret->year  = val;
-	
-	if (*p) {
-	    if (*p != 'T') return -1;
-	    p++;
-	}
-    }
-    if (q == p) return 0;
-
-    /* parse time */
-    val = 0;
-    if (q - p < 8) return -1;
-    for (i = 0; i < 8; i++, p++) {
-	int xx = *p;
-	if (xx == ':') {
-	    if (i == 2 || i == 5) continue; else return -1;
-	}
-	if (! ('0' <= xx && xx <= '9')) return -1;
-	val = val * 10 + (xx - '0');
-    }
-    ret->second = &ret->__buffer.second;
-    ret->minute = &ret->__buffer.minute;
-    ret->hour   = &ret->__buffer.hour;
-    
-    *ret->second = val % 100; val /= 100;
-    *ret->minute = val % 100; val /= 100;
-    *ret->hour   = val;
-    
-    /* skip fractional second */
-    if (*p == '.') for (p++; '0' <= *p && *p <= '9'; p++);
-    if (q == p) return 0;
-    
-    /* parse and copy Z */
-    ret->z = ret->__buffer.z;
-    char* z = ret->z;
-    if (*p == 'Z') {
-	*z++ = *p++;
-	*z = 0;
-	return (p == q) ? 0 : -1;
-    }
-    if (*p == '+' || *p == '-') {
-	*z++ = *p++;
-	
-	if (! (isdigit(p[0]) && isdigit(p[1]))) return -1;
-	*z++ = *p++;
-	*z++ = *p++;
-	
-	if (*p == ':') {
-	    *z++ = *p++;
-	    
-	    if (! (isdigit(p[0]) && isdigit(p[1]))) return -1;
-	    *z++ = *p++;
-	    *z++ = *p++;
-	}
-	
-	*z = 0;
-    }
-    return (p == q) ? 0 : -1;
-}
-
-
-/* Raw to boolean */
-int toml_rtob(const char* src, int* ret_)
-{
-    if (!src) return -1;
-    int dummy;
-    int* ret = ret_ ? ret_ : &dummy;
-    
-    if (0 == strcmp(src, "true")) {
-	*ret = 1;
-	return 0;
-    }
-    if (0 == strcmp(src, "false")) {
-	*ret = 0;
-	return 0;
-    }
-    return -1;
-}
-
-
-/* Raw to integer */
-int toml_rtoi(const char* src, int64_t* ret_)
-{
-    if (!src) return -1;
-    
-    char buf[100];
-    char* p = buf;
-    char* q = p + sizeof(buf);
-    const char* s = src;
-    int64_t dummy;
-    int64_t* ret = ret_ ? ret_ : &dummy;
-    
-    if (*s == '+')
-	*p++ = *s++;
-    else if (*s == '-')
-	*p++ = *s++;
-
-    /* if 0 ... */
-    if ('0' == s[0]) {
-	/* ensure no other digits after it */
-	if (s[1]) return -1;
-	return *ret = 0, 0;
-    }
-
-    /* just strip underscores and pass to strtoll */
-    while (*s && p < q) {
-	int ch = *s++;
-	if (ch == '_') ; else *p++ = ch;
-    }
-    if (*s || p == q) return -1;
-    
-    /* cap with NUL */
-    *p = 0;
-
-    /* Run strtoll on buf to get the integer */
-    char* endp;
-    errno = 0;
-    *ret = strtoll(buf, &endp, 0);
-    return (errno || *endp) ? -1 : 0;
-}
-
-
-int toml_rtod(const char* src, double* ret_)
-{
-    if (!src) return -1;
-    
-    char buf[100];
-    char* p = buf;
-    char* q = p + sizeof(buf);
-    const char* s = src;
-    double dummy;
-    double* ret = ret_ ? ret_ : &dummy;
-
-    /* check for special cases */
-    if (s[0] == '+' || s[0] == '-') *p++ = *s++;
-    if (s[0] == '.') return -1;	/* no leading zero */
-    if (s[0] == '0') {
-	/* zero must be followed by . or NUL */
-	if (s[1] && s[1] != '.') return -1;
-    }
-
-    /* just strip underscores and pass to strtod */
-    while (*s && p < q) {
-	int ch = *s++;
-	if (ch == '_') ; else *p++ = ch;
-    }
-    if (*s || p == q) return -1;
-
-    if (p != buf && p[-1] == '.') 
-	return -1; /* no trailing zero */
-
-    /* cap with NUL */
-    *p = 0;
-
-    /* Run strtod on buf to get the value */
-    char* endp;
-    errno = 0;
-    *ret = strtod(buf, &endp);
-    return (errno || *endp) ? -1 : 0;
-}
-
-
-static char* kill_line_ending_backslash(char* str)
-{
-    if (!str) return 0;
-    
-    /* first round: find (backslash, \n) */
-    char* p = str;
-    while (0 != (p = strstr(p, "\\\n"))) {
-	char* q = (p + 1);
-	q += strspn(q, " \t\r\n");
-	memmove(p, q, strlen(q) + 1);
-    }
-    /* second round: find (backslash, \r, \n) */
-    p = str;
-    while (0 != (p = strstr(p, "\\\r\n"))) {
-	char* q = (p + 1);
-	q += strspn(q, " \t\r\n");
-	memmove(p, q, strlen(q) + 1);
-    }
-
-    return str;
-}
-
-
-int toml_rtos(const char* src, char** ret)
-{
-    if (!src) return -1;
-    if (*src != '\'' && *src != '"') return -1;
-
-    *ret = 0;
-    int srclen = strlen(src);
-    if (*src == '\'') {
-	if (0 == strncmp(src, "'''", 3)) {
-	    const char* sp = src + 3;
-	    const char* sq = src + srclen - 3;
-	    /* last 3 chars in src must be ''' */
-	    if (! (sp <= sq && 0 == strcmp(sq, "'''")))
-		return -1;
-	    
-	    /* skip first new line right after ''' */
-	    if (*sp == '\n')
-		sp++;
-	    else if (sp[0] == '\r' && sp[1] == '\n')
-		sp += 2;
-
-	    *ret = kill_line_ending_backslash(strndup(sp, sq - sp));
-	} else {
-	    const char* sp = src + 1;
-	    const char* sq = src + srclen - 1;
-	    /* last char in src must be ' */
-	    if (! (sp <= sq && *sq == '\''))
-		return -1;
-	    /* copy from sp to p */
-	    *ret = strndup(sp, sq - sp);
-	}
-	return *ret ? 0 : -1;
-    }
-
-    const char* sp;
-    const char* sq;
-    if (0 == strncmp(src, "\"\"\"", 3)) {
-	sp = src + 3;
-	sq = src + srclen - 3;
-	if (! (sp <= sq && 0 == strcmp(sq, "\"\"\"")))
-	    return -1;
-	
-	/* skip first new line right after """ */
-	if (*sp == '\n')
-	    sp++;
-	else if (sp[0] == '\r' && sp[1] == '\n')
-	    sp += 2;
-    } else {
-	sp = src + 1;
-	sq = src + srclen - 1;
-	if (! (sp <= sq && *sq == '"'))
-	    return -1;
-    }
-
-    char dummy_errbuf[1];
-    *ret = normalize_string(sp, sq - sp,
-			    1, // flag kill_line_ending_backslash 
-			    dummy_errbuf, sizeof(dummy_errbuf));
-    return *ret ? 0 : -1;
-}
diff --git a/utils/keytable/toml.c b/utils/keytable/toml.c
new file mode 120000
index 00000000..94ca0ef6
--- /dev/null
+++ b/utils/keytable/toml.c
@@ -0,0 +1 @@
+../common/toml.c
\ No newline at end of file
diff --git a/utils/keytable/toml.h b/utils/keytable/toml.h
deleted file mode 100644
index 54c1c825..00000000
--- a/utils/keytable/toml.h
+++ /dev/null
@@ -1,110 +0,0 @@
-/*
-MIT License
-
-Copyright (c) 2017 CK Tan
-https://github.com/cktan/tomlc99
-
-Permission is hereby granted, free of charge, to any person obtaining a copy
-of this software and associated documentation files (the "Software"), to deal
-in the Software without restriction, including without limitation the rights
-to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-copies of the Software, and to permit persons to whom the Software is
-furnished to do so, subject to the following conditions:
-
-The above copyright notice and this permission notice shall be included in all
-copies or substantial portions of the Software.
-
-THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-SOFTWARE.
-*/
-#ifndef TOML_H
-#define TOML_H
-
-#ifdef __cplusplus
-#define TOML_EXTERN extern "C"
-#else
-#define TOML_EXTERN extern
-#endif
-
-typedef struct toml_table_t toml_table_t;
-typedef struct toml_array_t toml_array_t;
-
-/* Parse a file. Return a table on success, or 0 otherwise. 
- * Caller must toml_free(the-return-value) after use.
- */
-TOML_EXTERN toml_table_t* toml_parse_file(FILE* fp, 
-					  char* errbuf,
-					  int errbufsz);
-
-/* Parse a string containing the full config. 
- * Return a table on success, or 0 otherwise.
- * Caller must toml_free(the-return-value) after use.
- */
-TOML_EXTERN toml_table_t* toml_parse(char* conf, /* NUL terminated, please. */
-				     char* errbuf,
-				     int errbufsz);
-
-/* Free the table returned by toml_parse() or toml_parse_file(). */
-TOML_EXTERN void toml_free(toml_table_t* tab);
-
-/* Retrieve the key in table at keyidx. Return 0 if out of range. */
-TOML_EXTERN const char* toml_key_in(toml_table_t* tab, int keyidx);
-
-/* Lookup table by key. Return the element or 0 if not found. */
-TOML_EXTERN const char* toml_raw_in(toml_table_t* tab, const char* key);
-TOML_EXTERN toml_array_t* toml_array_in(toml_table_t* tab, const char* key);
-TOML_EXTERN toml_table_t* toml_table_in(toml_table_t* tab, const char* key);
-
-/* Return the array kind: 't'able, 'a'rray, 'v'alue */
-TOML_EXTERN char toml_array_kind(toml_array_t* arr);
-
-/* Deref array by index. Return the element at idx or 0 if out of range. */
-TOML_EXTERN const char* toml_raw_at(toml_array_t* arr, int idx);
-TOML_EXTERN toml_array_t* toml_array_at(toml_array_t* arr, int idx);
-TOML_EXTERN toml_table_t* toml_table_at(toml_array_t* arr, int idx);
-
-
-/* Raw to String. Caller must call free(ret) after use. 
- * Return 0 on success, -1 otherwise.
- */
-TOML_EXTERN int toml_rtos(const char* s, char** ret);
-
-/* Raw to Boolean. Return 0 on success, -1 otherwise. */
-TOML_EXTERN int toml_rtob(const char* s, int* ret);
-
-/* Raw to Integer. Return 0 on success, -1 otherwise. */
-TOML_EXTERN int toml_rtoi(const char* s, int64_t* ret);
-
-/* Raw to Double. Return 0 on success, -1 otherwise. */
-TOML_EXTERN int toml_rtod(const char* s, double* ret);
-
-/* Timestamp types. The year, month, day, hour, minute, second, z 
- * fields may be NULL if they are not relevant. e.g. In a DATE
- * type, the hour, minute, second and z fields will be NULLs.
- */
-typedef struct toml_timestamp_t toml_timestamp_t;
-struct toml_timestamp_t {
-    struct { /* internal. do not use. */
-	int year, month, day;
-	int hour, minute, second;
-	char z[10];
-    } __buffer;
-    int *year, *month, *day;
-    int *hour, *minute, *second;
-    char* z;
-};
-
-/* Raw to Timestamp. Return 0 on success, -1 otherwise. */
-TOML_EXTERN int toml_rtots(const char* s, toml_timestamp_t* ret);
-
-/* misc */
-TOML_EXTERN int toml_utf8_to_ucs(const char* orig, int len, int64_t* ret);
-TOML_EXTERN int toml_ucs_to_utf8(int64_t code, char buf[6]);
-
-
-#endif /* TOML_H */
diff --git a/utils/keytable/toml.h b/utils/keytable/toml.h
new file mode 120000
index 00000000..d1170723
--- /dev/null
+++ b/utils/keytable/toml.h
@@ -0,0 +1 @@
+../common/toml.h
\ No newline at end of file
-- 
2.21.0

