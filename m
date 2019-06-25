Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9649055274
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 16:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730607AbfFYOsy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 10:48:54 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:48357 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730505AbfFYOsx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 10:48:53 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 9C6F31BF21C
        for <linux-media@vger.kernel.org>; Tue, 25 Jun 2019 14:48:50 +0000 (UTC)
Message-ID: <dc1d65ef9019bb582133fd6f10bb3cc226c38c49.camel@hadess.net>
Subject: [PATCH] keytable: Add keymap test
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-media@vger.kernel.org
Date:   Tue, 25 Jun 2019 16:48:49 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This new test will try to parse all the ".toml" files in the directory
path passed to it, error'ing out on the first parsing problem.

Run as "make check" in the keytable directory.
---

At least 4 keymaps look broken in the current git:
it913x_v2.toml
pinnacle310e.toml
hisi_poplar.toml
imon_mce.toml

Let me know if you want patches to remove the duplicate entries from
those.

 utils/keytable/Makefile.am    |  6 ++++
 utils/keytable/test_keymaps.c | 68 +++++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 utils/keytable/test_keymaps.c

diff --git a/utils/keytable/Makefile.am b/utils/keytable/Makefile.am
index 148b9446..086d53c2 100644
--- a/utils/keytable/Makefile.am
+++ b/utils/keytable/Makefile.am
@@ -1,9 +1,12 @@
 bin_PROGRAMS = ir-keytable
+noinst_PROGRAMS = test-keymaps
 man_MANS = ir-keytable.1 rc_keymap.5
 sysconf_DATA = rc_maps.cfg
 keytablesystem_DATA = $(srcdir)/rc_keymaps/*
 udevrules_DATA = 70-infrared.rules
 
+test_keymaps_SOURCES = toml.c toml.h test_keymaps.c
+
 ir_keytable_SOURCES = keytable.c parse.h ir-encode.c ir-encode.h
toml.c toml.h
 
 if WITH_BPF
@@ -21,6 +24,9 @@ endif
 EXTRA_DIST = 70-infrared.rules rc_keymaps rc_keymaps_userspace
gen_keytables.pl ir-keytable.1 rc_maps.cfg rc_keymap.5
 
 # custom target
+check: test-keymaps
+	$(builddir)/test-keymaps $(srcdir)/rc_keymaps/
+
 install-data-local:
 	$(install_sh) -d "$(DESTDIR)$(keytableuserdir)"
 
diff --git a/utils/keytable/test_keymaps.c
b/utils/keytable/test_keymaps.c
new file mode 100644
index 00000000..23084331
--- /dev/null
+++ b/utils/keytable/test_keymaps.c
@@ -0,0 +1,68 @@
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
+	if (strncmp(str + strlen(str) - strlen(suffix), suffix,
strlen(suffix)) == 0)
+		return 1;
+	return 0;
+}
+
+int main (int argc, char **argv)
+{
+	DIR *dir;
+	struct dirent *entry;
+
+	if (argc != 2) {
+		fprintf(stderr, "Usage: %s KEYMAPS-DIRECTORY\n",
argv[0]);
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
+		memset(path, 0, sizeof(path));
+		strcpy(path, argv[1]);
+		strcpy(path + strlen(argv[1]), "/");
+		strcpy(path + strlen(argv[1]) + 1, entry->d_name);
+		strcpy(path + strlen(argv[1]) + 1 + strlen(entry-
>d_name), "\0");
+
+		fin = fopen(path, "r");
+		if (!fin) {
+			fprintf(stderr, "Could not open file %s: %s",
path, strerror(errno));
+			return 1;
+		}
+
+		root = toml_parse_file(fin, buf, sizeof(buf));
+		fclose(fin);
+		if (!root) {
+			fprintf(stderr, "Failed to parse %s: %s\n",
path, buf);
+			return 1;
+		}
+		toml_free(root);
+	}
+
+	return 0;
+}

