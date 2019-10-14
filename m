Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 789C7D60DE
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 13:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731738AbfJNLC5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 07:02:57 -0400
Received: from gofer.mess.org ([88.97.38.141]:52337 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731503AbfJNLC5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 07:02:57 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 31E73C6371; Mon, 14 Oct 2019 12:02:56 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils] keytable: do not warn if keymap not found in IR_KEYTABLE_USER_DIR
Date:   Mon, 14 Oct 2019 12:02:56 +0100
Message-Id: <20191014110256.17500-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following error is logged even though imon_rsc.toml is found at
/lib/udev/rc_keymaps/imon_rsc.toml:

$ ir-keytable -a /etc/rc_maps.cfg
/etc/rc_keymaps/imon_rsc.toml: error: cannot open: No such file or directory

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/keytable/keytable.c | 78 ++++++++++++++++++++++-----------------
 1 file changed, 45 insertions(+), 33 deletions(-)

diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
index 6cb0217a..ab026448 100644
--- a/utils/keytable/keytable.c
+++ b/utils/keytable/keytable.c
@@ -1954,6 +1954,35 @@ int bpf_param(struct protocol_param *protocol_param, const char *name, int *val)
 	return -ENOENT;
 }
 
+char* keymap_to_path(const char *fname)
+{
+	struct stat st;
+	size_t size;
+	char *p;
+
+	if (fname[0] == '/' || ((fname[0] == '.') && strchr(fname, '/')))
+		return strdup(fname);
+
+	size = strlen(fname) + strlen(IR_KEYTABLE_USER_DIR) + 2;
+	p = malloc(size);
+	snprintf(p, size, IR_KEYTABLE_USER_DIR "/%s", fname);
+
+	if (!stat(p, &st))
+		return p;
+
+	free(p);
+	size = strlen(fname) + strlen(IR_KEYTABLE_SYSTEM_DIR) + 2;
+	p = malloc(size);
+	snprintf(p, size, IR_KEYTABLE_SYSTEM_DIR "/%s", fname);
+
+	if (!stat(p, &st))
+		return p;
+
+	fprintf(stderr, _("error: Unable to find keymap %s in %s or %s\n"), fname, IR_KEYTABLE_USER_DIR, IR_KEYTABLE_SYSTEM_DIR);
+
+	return NULL;
+}
+
 int main(int argc, char *argv[])
 {
 	int dev_from_class = 0, write_cnt;
@@ -2003,6 +2032,7 @@ int main(int argc, char *argv[])
 
 	if (cfg.next) {
 		struct cfgfile *cur;
+		struct keymap *map;
 		char *fname;
 		int rc;
 		int matches = 0;
@@ -2014,53 +2044,35 @@ int main(int argc, char *argv[])
 				continue;
 
 			if (debug)
-				fprintf(stderr, _("Table for %s, %s is on %s file.\n"),
+				fprintf(stderr, _("Keymap for %s, %s is on %s file.\n"),
 					rc_dev.drv_name, rc_dev.keytable_name,
 					cur->fname);
 
-			if (cur->fname[0] == '/' || ((cur->fname[0] == '.') && strchr(cur->fname, '/'))) {
-				struct keymap *map;
-				fname = cur->fname;
-				rc = parse_keymap(fname, &map, debug);
-				if (rc < 0) {
-					fprintf(stderr, _("Can't load %s table\n"), fname);
-					return -1;
-				}
-				add_keymap(map, fname);
-				free_keymap(map);
-			} else {
-				struct keymap *map;
-				fname = malloc(strlen(cur->fname) + strlen(IR_KEYTABLE_USER_DIR) + 2);
-				strcpy(fname, IR_KEYTABLE_USER_DIR);
-				strcat(fname, "/");
-				strcat(fname, cur->fname);
-				rc = parse_keymap(fname, &map, debug);
-				if (rc != 0) {
-					fname = malloc(strlen(cur->fname) + strlen(IR_KEYTABLE_SYSTEM_DIR) + 2);
-					strcpy(fname, IR_KEYTABLE_SYSTEM_DIR);
-					strcat(fname, "/");
-					strcat(fname, cur->fname);
-					rc = parse_keymap(fname, &map, debug);
-				}
-				if (rc != 0) {
-					fprintf(stderr, _("Can't load %s table from %s or %s\n"), cur->fname, IR_KEYTABLE_USER_DIR, IR_KEYTABLE_SYSTEM_DIR);
-					return -1;
-				}
+			fname = keymap_to_path(cur->fname);
+			if (!fname)
+				return -1;
 
-				add_keymap(map, fname);
-				free_keymap(map);
+			rc = parse_keymap(fname, &map, debug);
+			if (rc < 0) {
+				fprintf(stderr, _("Can't load %s keymap\n"), fname);
+				free(fname);
+				return -1;
 			}
+			add_keymap(map, fname);
+			free_keymap(map);
 			if (!keytable) {
-				fprintf(stderr, _("Empty table %s\n"), fname);
+				fprintf(stderr, _("Empty keymap %s\n"), fname);
+				free(fname);
 				return -1;
 			}
+			free(fname);
 			clear = 1;
 			matches++;
 		}
 
 		if (!matches) {
 			if (debug)
-				fprintf(stderr, _("Table for %s, %s not found. Keep as-is\n"),
+				fprintf(stderr, _("Keymap for %s, %s not found. Keep as-is\n"),
 				       rc_dev.drv_name, rc_dev.keytable_name);
 			return 0;
 		}
-- 
2.21.0

