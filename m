Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 902FC5F914
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2019 15:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727160AbfGDNY6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jul 2019 09:24:58 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:46055 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726994AbfGDNY5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jul 2019 09:24:57 -0400
X-Originating-IP: 83.155.44.161
Received: from classic.redhat.com (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id BD566C000C
        for <linux-media@vger.kernel.org>; Thu,  4 Jul 2019 13:24:55 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-media@vger.kernel.org
Subject: [PATCH v3] keytable: Add keymap test
Date:   Thu,  4 Jul 2019 15:24:54 +0200
Message-Id: <20190704132454.10566-1-hadess@hadess.net>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This new test will try to parse all the ".toml" files in the directory
path passed to it, error'ing out on the first parsing problem.

Run as "make check" in the keytable directory.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 utils/keytable/Makefile.am     |  6 +++
 utils/keytable/check_keymaps.c | 67 ++++++++++++++++++++++++++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 utils/keytable/check_keymaps.c

diff --git a/utils/keytable/Makefile.am b/utils/keytable/Makefile.am
index 148b9446..eb296475 100644
--- a/utils/keytable/Makefile.am
+++ b/utils/keytable/Makefile.am
@@ -1,9 +1,12 @@
 bin_PROGRAMS = ir-keytable
+noinst_PROGRAMS = check-keymaps
 man_MANS = ir-keytable.1 rc_keymap.5
 sysconf_DATA = rc_maps.cfg
 keytablesystem_DATA = $(srcdir)/rc_keymaps/*
 udevrules_DATA = 70-infrared.rules
 
+check_keymaps_SOURCES = toml.c toml.h check_keymaps.c
+
 ir_keytable_SOURCES = keytable.c parse.h ir-encode.c ir-encode.h toml.c toml.h
 
 if WITH_BPF
@@ -21,6 +24,9 @@ endif
 EXTRA_DIST = 70-infrared.rules rc_keymaps rc_keymaps_userspace gen_keytables.pl ir-keytable.1 rc_maps.cfg rc_keymap.5
 
 # custom target
+check: check-keymaps
+	$(builddir)/check-keymaps $(srcdir)/rc_keymaps/
+
 install-data-local:
 	$(install_sh) -d "$(DESTDIR)$(keytableuserdir)"
 
diff --git a/utils/keytable/check_keymaps.c b/utils/keytable/check_keymaps.c
new file mode 100644
index 00000000..eb8e3e8f
--- /dev/null
+++ b/utils/keytable/check_keymaps.c
@@ -0,0 +1,67 @@
+#include <string.h>
+#include <errno.h>
+#include <stdio.h>
+#include <sys/types.h>
+#include <dirent.h>
+
+#include "toml.h"
+
+static int
+has_suffix(const char *str, const char *suffix)
+{
+	if (strlen(str) < strlen(suffix))
+		return 0;
+	if (strncmp(str + strlen(str) - strlen(suffix), suffix, strlen(suffix)) == 0)
+		return 1;
+	return 0;
+}
+
+int main (int argc, char **argv)
+{
+	DIR *dir;
+	struct dirent *entry;
+	int ret = 0;
+
+	if (argc != 2) {
+		fprintf(stderr, "Usage: %s KEYMAPS-DIRECTORY\n", argv[0]);
+		return 1;
+	}
+
+	dir = opendir(argv[1]);
+	if (!dir) {
+		perror("Could not open directory");
+		return 1;
+	}
+
+	while ((entry = readdir(dir)) != NULL) {
+		struct toml_table_t *root;
+		FILE *fin;
+		char buf[200];
+		char path[2048];
+
+		if (!has_suffix(entry->d_name, ".toml")) {
+			/* Skipping file */
+			continue;
+		}
+
+		snprintf(path, sizeof(path), "%s/%s", argv[1], entry->d_name);
+		path[sizeof(path) - 1] = '\0';
+
+		fin = fopen(path, "r");
+		if (!fin) {
+			fprintf(stderr, "Could not open file %s: %s", path, strerror(errno));
+			ret = 1;
+			continue;
+		}
+
+		root = toml_parse_file(fin, buf, sizeof(buf));
+		fclose(fin);
+		if (!root) {
+			fprintf(stderr, "Failed to parse %s: %s\n", path, buf);
+			ret = 1;
+		}
+		toml_free(root);
+	}
+
+	return ret;
+}
-- 
2.21.0

