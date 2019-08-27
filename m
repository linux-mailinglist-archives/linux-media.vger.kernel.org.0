Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 018A49E873
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 14:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbfH0Mzh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 08:55:37 -0400
Received: from gofer.mess.org ([88.97.38.141]:43417 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729072AbfH0Mzg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 08:55:36 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 7978160608; Tue, 27 Aug 2019 13:55:35 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils 1/2] rc_keymap: change raw format to much more common raw string
Date:   Tue, 27 Aug 2019 13:55:34 +0100
Message-Id: <20190827125535.2858-1-sean@mess.org>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Many programs and documentation lists raw IR a list of ints:

	+8800 –4400 +550 –1650 +550 –1650 +550 –1650 +550 –550 +550

The + and - are optional and are there for readability.

I think this is much nicer format that 1) toml arrays and 2) lirc
pulse space format. In fact, I think "ir-ctl -r" should output this
format too, and support it for sending.

As a first start, let's update the toml rc keymap format; the existing
toml raw array has not been in a release.

Signed-off-by: Sean Young <sean@mess.org>
---
 contrib/lircd2toml.py         |  16 ++---
 utils/common/keymap.c         | 126 ++++++++++++++++++++++------------
 utils/keytable/rc_keymap.5.in |   9 +--
 3 files changed, 96 insertions(+), 55 deletions(-)

diff --git a/contrib/lircd2toml.py b/contrib/lircd2toml.py
index 05729239..cfa648ed 100755
--- a/contrib/lircd2toml.py
+++ b/contrib/lircd2toml.py
@@ -604,16 +604,16 @@ def writeTOMLFile(fh, remote):
     elif 'raw' in remote:
         for raw in remote['raw']:
             print('[[protocols.raw]]', file=fh)
-            print('keycode = {}\nraw = ['.format(escapeString(raw['keycode'])), file=fh, end='')
-            first = True
-            for v in raw['raw']:
-                if first:
-                    print(' {}'.format(v), file=fh, end='')
+            print('keycode = {}\nraw = \''.format(escapeString(raw['keycode'])), file=fh, end='')
+            for i, v in enumerate(raw['raw']):
+                if i == 0:
+                    print('+{}'.format(v), file=fh, end='')
+                elif i % 2 == 1:
+                    print(' -{}'.format(v), file=fh, end='')
                 else:
-                    print(', {}'.format(v), file=fh, end='')
-                first = False
+                    print(' +{}'.format(v), file=fh, end='')
 
-            print(' ]', file=fh)
+            print('\'', file=fh)
 
     return True
 
diff --git a/utils/common/keymap.c b/utils/common/keymap.c
index 9c49b442..9ca599a0 100644
--- a/utils/common/keymap.c
+++ b/utils/common/keymap.c
@@ -177,73 +177,113 @@ err_einval:
 	return EINVAL;
 }
 
+static error_t parse_rawir_string(const char *fname, char *str, struct raw_entry **entry)
+{
+	struct raw_entry *re;
+	const char *p;
+	char *copy;
+	int i, size = 0;
+
+	// First do one scan so that we know the length
+	copy = strdup(str);
+	p = strtok(copy, "\n\t\v ,");
+	while (p) {
+		size++;
+		p = strtok(NULL, "\n\t\v ,");
+	}
+
+	re = calloc(1, sizeof(*re) + sizeof(re->raw[0]) * size);
+	if (!re) {
+		fprintf(stderr, _("Failed to allocate memory"));
+		free(copy);
+		return EINVAL;
+	}
+
+	// Second scan to extract values and validate
+	strcpy(copy, str);
+	p = strtok(copy, "\n\t\v ,");
+	i = 0;
+	while (p) {
+		long int value;
+		char *q;
+
+		value = strtoll(p, &q, 10);
+		if (*q || value == 0 || errno) {
+			fprintf(stderr, _("%s: incorrect raw value `%s'"),
+				fname, p);
+			free(copy);
+			return EINVAL;
+		}
+
+		if (value < 0) {
+			if (i % 2)
+				value = -value;
+			else {
+				fprintf(stderr, _("%s: negative raw value `%ld` at position %d only allowed for gaps/spaces"),
+					fname, value, i);
+				free(copy);
+				return EINVAL;
+			}
+		}
+
+		if (value <= 0 || value > USHRT_MAX) {
+			fprintf(stderr, _("%s: raw value %ld out of range"),
+				fname, value);
+			free(copy);
+			return EINVAL;
+		}
+
+		re->raw[i++] = value;
+
+		p = strtok(NULL, "\n\t\v ,");
+	}
+
+	free(copy);
+	re->raw_length = size;
+
+	*entry = re;
+
+	return 0;
+}
+
 static error_t parse_toml_raw_part(const char *fname, struct toml_array_t *raw, struct keymap *map, bool verbose)
 {
+	char *keycode, *raw_str;
 	struct toml_table_t *t;
-	struct toml_array_t *rawarray;
 	struct raw_entry *re;
-	const char *rkeycode;
-	int ind = 0, length;
-	char *keycode;
+	const char *traw;
+	int ind = 0;
 
 	while ((t = toml_table_at(raw, ind++)) != NULL) {
-		rkeycode = toml_raw_in(t, "keycode");
-		if (!rkeycode) {
+		traw = toml_raw_in(t, "keycode");
+		if (!traw) {
 			fprintf(stderr, _("%s: invalid keycode for raw entry %d\n"),
 				fname, ind);
 			return EINVAL;
 		}
 
-		if (toml_rtos(rkeycode, &keycode)) {
+		if (toml_rtos(traw, &keycode)) {
 			fprintf(stderr, _("%s: bad value `%s' for keycode\n"),
-				fname, rkeycode);
+				fname, traw);
 			return EINVAL;
 		}
 
-		rawarray = toml_array_in(t, "raw");
-		if (!rawarray) {
-			fprintf(stderr, _("%s: missing raw array for entry %d\n"),
+		traw = toml_raw_in(t, "raw");
+		if (!traw) {
+			fprintf(stderr, _("%s: missing raw value for entry %d\n"),
 				fname, ind);
 			return EINVAL;
 		}
 
-		// determine length of array
-		length = 0;
-		while (toml_raw_at(rawarray, length) != NULL)
-			length++;
-
-		if (!(length % 2)) {
-			fprintf(stderr, _("%s: raw array must have odd length rather than %d\n"),
-				fname, length);
+		if (toml_rtos(traw, &raw_str)) {
+			fprintf(stderr, _("%s: bad value `%s' for keycode\n"),
+				fname, traw);
 			return EINVAL;
 		}
 
-		re = calloc(1, sizeof(*re) + sizeof(re->raw[0]) * length);
-		if (!re) {
-			fprintf(stderr, _("Failed to allocate memory"));
+		if (parse_rawir_string(fname, raw_str, &re))
 			return EINVAL;
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
 
-		re->raw_length = length;
 		re->keycode = strdup(keycode);
 		re->next = map->raw;
 		map->raw = re;
diff --git a/utils/keytable/rc_keymap.5.in b/utils/keytable/rc_keymap.5.in
index 00599755..12f05a1d 100644
--- a/utils/keytable/rc_keymap.5.in
+++ b/utils/keytable/rc_keymap.5.in
@@ -67,10 +67,11 @@ to raw mapping. For each entry, there is a \fBkeycode\fR field and \fBraw\fR
 field. The \fBkeycode\fR is a linux input event, as explained the scancodes
 section.
 .PP
-The \fBraw\fR field is an array of integers. These are the pulse and space
-values of the IR message. The first is a pulse value in microseconds, and
-the second a space, third pulse, etc. There should be an odd number of fields
-so that the last entry is a pulse.
+The \fBraw\fR field is an string, which lists pulse and space values,
+separated by whitespace.  The first is a pulse value in microseconds, and
+the second a space, third pulse, etc. The space values can be preceded by
+a - sign and the pulse value can be preceded by a +sign.
+There should be an odd number of fields so that the last entry is a pulse.
 .SS Remaining fields (BPF parameters)
 If the protocol is a BPF based decoder, it may have any number of numeric
 parameters. These parameters are used to support protocols with non-standard
-- 
2.21.0

