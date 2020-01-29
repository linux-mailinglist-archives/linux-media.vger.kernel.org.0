Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2254114C9F6
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2020 12:54:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbgA2LyW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jan 2020 06:54:22 -0500
Received: from gofer.mess.org ([88.97.38.141]:35395 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726140AbgA2LyV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jan 2020 06:54:21 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 34F5CC643D; Wed, 29 Jan 2020 11:54:19 +0000 (GMT)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH v4l-utils 1/4] keytable: support 64 bit scancodes
Date:   Wed, 29 Jan 2020 11:54:15 +0000
Message-Id: <20200129115419.8456-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/common/keymap.c     |  4 +-
 utils/common/keymap.h     |  4 +-
 utils/keytable/keytable.c | 80 +++++++++++++++++++++++++++------------
 3 files changed, 59 insertions(+), 29 deletions(-)

diff --git a/utils/common/keymap.c b/utils/common/keymap.c
index d06deb59..15c31c76 100644
--- a/utils/common/keymap.c
+++ b/utils/common/keymap.c
@@ -162,7 +162,7 @@ static error_t parse_plain_keymap(char *fname, struct keymap **keymap, bool verb
 			return ENOMEM;
 		}
 
-		se->scancode = strtoul(scancode, NULL, 0);
+		se->scancode = strtoull(scancode, NULL, 0);
 		se->keycode = strdup(keycode);
 		se->next = map->scancode;
 		map->scancode = se;
@@ -442,7 +442,7 @@ static error_t parse_toml_protocol(const char *fname, struct toml_table_t *proot
 			return ENOMEM;
 		}
 
-		se->scancode = strtoul(scancode, NULL, 0);
+		se->scancode = strtoull(scancode, NULL, 0);
 		se->keycode = keycode;
 		*next = se;
 		next = &se->next;
diff --git a/utils/common/keymap.h b/utils/common/keymap.h
index f2b29632..99833827 100644
--- a/utils/common/keymap.h
+++ b/utils/common/keymap.h
@@ -20,13 +20,13 @@ struct protocol_param {
 
 struct scancode_entry {
 	struct scancode_entry *next;
-	u_int32_t scancode;
+	u_int64_t scancode;
 	char *keycode;
 };
 
 struct raw_entry {
 	struct raw_entry *next;
-	u_int32_t scancode;
+	u_int64_t scancode;
 	u_int32_t raw_length;
 	char *keycode;
 	u_int32_t raw[1];
diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
index e2a1bfe1..cc1b5217 100644
--- a/utils/keytable/keytable.c
+++ b/utils/keytable/keytable.c
@@ -76,7 +76,8 @@ struct input_keymap_entry_v2 {
 #endif
 
 struct keytable_entry {
-	u_int32_t scancode;
+	// 64 bit int which can printed with %llx
+	unsigned long long scancode;
 	u_int32_t keycode;
 	struct keytable_entry *next;
 };
@@ -400,7 +401,7 @@ static int add_keymap(struct keymap *map, const char *fname)
 			if (value == -1) {
 				value = strtol(se->keycode, &p, 0);
 				if (errno || *p) {
-					fprintf(stderr, _("%s: keycode `%s' not recognised, no mapping for scancode %d\n"), fname, se->keycode, se->scancode);
+					fprintf(stderr, _("%s: keycode `%s' not recognised, no mapping for scancode %llx\n"), fname, se->keycode, (unsigned long long)se->scancode);
 					continue;
 				}
 			}
@@ -589,7 +590,7 @@ static error_t parse_opt(int k, char *arg, struct argp_state *state)
 				return ENOMEM;
 			}
 
-			ke->scancode = strtoul(p, NULL, 0);
+			ke->scancode = strtoull(p, NULL, 0);
 			if (errno) {
 				free(ke);
 				argp_error(state, _("Invalid scancode: %s"), p);
@@ -616,7 +617,7 @@ static error_t parse_opt(int k, char *arg, struct argp_state *state)
 			ke->keycode = key;
 
 			if (debug)
-				fprintf(stderr, _("scancode 0x%04x=%u\n"),
+				fprintf(stderr, _("scancode 0x%04llx=%u\n"),
 					ke->scancode, ke->keycode);
 
 			ke->next = keytable;
@@ -722,21 +723,21 @@ static struct argp argp = {
 	.doc = doc,
 };
 
-static void prtcode(int *codes)
+static void prtcode(unsigned long long scancode, int keycode)
 {
 	struct parse_event *p;
 
 	for (p = key_events; p->name != NULL; p++) {
-		if (p->value == (unsigned)codes[1]) {
-			printf(_("scancode 0x%04x = %s (0x%02x)\n"), codes[0], p->name, codes[1]);
+		if (p->value == keycode) {
+			printf(_("scancode 0x%04llx = %s (0x%02x)\n"), scancode, p->name, keycode);
 			return;
 		}
 	}
 
-	if (isprint (codes[1]))
-		printf(_("scancode 0x%04x = '%c' (0x%02x)\n"), codes[0], codes[1], codes[1]);
+	if (isprint (keycode))
+		printf(_("scancode 0x%04llx = '%c' (0x%02x)\n"), scancode, keycode, keycode);
 	else
-		printf(_("scancode 0x%04x = 0x%02x\n"), codes[0], codes[1]);
+		printf(_("scancode 0x%04llx = 0x%02x\n"), scancode, keycode);
 }
 
 static void free_names(struct sysfs_names *names)
@@ -1399,17 +1400,34 @@ static int add_keys(int fd)
 	for (ke = keytable; ke; ke = ke->next) {
 		write_cnt++;
 		if (debug)
-			fprintf(stderr, "\t%04x=%04x\n",
+			fprintf(stderr, "\t%04llx=%04x\n",
 				ke->scancode, ke->keycode);
 
 		codes[0] = ke->scancode;
 		codes[1] = ke->keycode;
 
-		if (ioctl(fd, EVIOCSKEYCODE, codes)) {
-			fprintf(stderr,
-				_("Setting scancode 0x%04x with 0x%04x via "),
-				ke->scancode, ke->keycode);
-			perror("EVIOCSKEYCODE");
+		if (codes[0] != ke->scancode) {
+			// 64 bit scancode
+			struct input_keymap_entry_v2 entry = {
+				.keycode = ke->keycode,
+				.len = sizeof(ke->scancode)
+			};
+
+			memcpy(entry.scancode, &ke->scancode, sizeof(ke->scancode));
+
+			if (ioctl(fd, EVIOCSKEYCODE_V2, &entry)) {
+				fprintf(stderr,
+					_("Setting scancode 0x%04llx with 0x%04x via "),
+					ke->scancode, ke->keycode);
+				perror("EVIOCSKEYCODE");
+			}
+		} else {
+			if (ioctl(fd, EVIOCSKEYCODE, codes)) {
+				fprintf(stderr,
+					_("Setting scancode 0x%04llx with 0x%04x via "),
+					ke->scancode, ke->keycode);
+				perror("EVIOCSKEYCODE");
+			}
 		}
 	}
 
@@ -1596,7 +1614,7 @@ static void display_table_v1(struct rc_device *rc_dev, int fd)
 			if (ioctl(fd, EVIOCGKEYCODE, codes) == -1)
 				perror("EVIOCGKEYCODE");
 			else if (codes[1] != KEY_RESERVED)
-				prtcode(codes);
+				prtcode(codes[0], codes[1]);
 		}
 	}
 	display_proto(rc_dev);
@@ -1604,25 +1622,37 @@ static void display_table_v1(struct rc_device *rc_dev, int fd)
 
 static void display_table_v2(struct rc_device *rc_dev, int fd)
 {
+	struct input_keymap_entry_v2 entry = {};
+	unsigned long long scancode;
 	int i;
-	struct input_keymap_entry_v2 entry;
-	int codes[2];
 
-	memset(&entry, '\0', sizeof(entry));
 	i = 0;
 	do {
 		entry.flags = KEYMAP_BY_INDEX;
 		entry.index = i;
-		entry.len = sizeof(u_int32_t);
+		entry.len = sizeof(scancode);
 
 		if (ioctl(fd, EVIOCGKEYCODE_V2, &entry) == -1)
 			break;
 
-		/* FIXME: Extend it to support scancodes > 32 bits */
-		memcpy(&codes[0], entry.scancode, sizeof(codes[0]));
-		codes[1] = entry.keycode;
+		if (entry.len == sizeof(u_int32_t)) {
+			u_int32_t temp;
+
+			memcpy(&temp, entry.scancode, sizeof(temp));
+
+			scancode = temp;
+		} else if (entry.len == sizeof(u_int64_t)) {
+			u_int64_t temp;
+
+			memcpy(&temp, entry.scancode, sizeof(temp));
+
+			scancode = temp;
+		} else {
+			printf("error: unknown scancode length %d\n", entry.len);
+			continue;
+		}
 
-		prtcode(codes);
+		prtcode(scancode, entry.keycode);
 		i++;
 	} while (1);
 	display_proto(rc_dev);
-- 
2.24.1

