Return-Path: <linux-media+bounces-1612-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6FC8038CC
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 16:29:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92ECC2811BF
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 15:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04EC02C84E;
	Mon,  4 Dec 2023 15:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="A5YCkmKW";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="aqmWXD+5"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F268A5
	for <linux-media@vger.kernel.org>; Mon,  4 Dec 2023 07:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1701703724; bh=CERYJNnDvi36EkZkzBXw3WcTASikuCbMApDjBT6G7RQ=;
	h=From:To:Cc:Subject:Date:From;
	b=A5YCkmKWHqEKcLuvosVXNBLH0Rk1wCBP7qbX5GdkCPp9hc2pFAu2xay1VnjKnR4kt
	 1+fTLAUJjXWfUDwJizoi6KZ2uo8Jyht1BXNJv2enSJeY0HFOpkxou5Ko0ZPWV8HoBR
	 Xmm2ckrQsOVhIpbZD+V06sgFMSCBlVNsGOrBaWKg3hCr7h+2EN6Hc+H4y211dJ5pdo
	 UEMOGE/QvmLciND9nqa4FF7y/r9g9/wqW2PN5UUwdH/R6pEGFr9jZ6t+iAb6Ac4FKT
	 hQXsDY47WCHJbUSxLnF6hFMLnmApxOJKa4Q9XgiFKB4iCGADwTwkv9BxaIA86bRZmp
	 WrSLgmXMA+CZA==
Received: by gofer.mess.org (Postfix, from userid 501)
	id 7BDA7100103; Mon,  4 Dec 2023 15:28:44 +0000 (GMT)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1701703721; bh=CERYJNnDvi36EkZkzBXw3WcTASikuCbMApDjBT6G7RQ=;
	h=From:To:Cc:Subject:Date:From;
	b=aqmWXD+5FBoC+0Yd1pe3+4OzVzPuoAj/znvlLIg17yZAzL+lRkVhKFaOc+oz/w60V
	 njZ8zAHwi2JNUt9BPdSjn3s1Pj0jPrSaO8yc6oZL4jrjbCSPVP4cP9nvrL1jArxnva
	 CdvMmff0cJ+Gtz61+GwvU2i+RdY+oNfuvhExf8VhvKVGYgYh+YWhowTdSK3IRf+P3Q
	 YROoQkJrjTV90uLSerJTnZ4Z/zVVfW4vvDHZAYbQoHmXL3YwHyCCId/7hZpp4ezwXf
	 UckrLgbJw4b1odh4Evc4DmOMbngWLTiQf06TZn52yDGANtTDDEJHFCFi9wBryUkyA6
	 g9O05r7bAUHtg==
Received: from localhost.localdomain (unknown [IPv6:2a02:8011:d000:212:ca7f:54ff:fe51:14d6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gofer.mess.org (Postfix) with ESMTPSA id A91AB10005E;
	Mon,  4 Dec 2023 15:28:41 +0000 (GMT)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Cc: Gregor Jasny <gjasny@googlemail.com>,
	Joe Kesselman <keshlam@alum.mit.edu>,
	Sean Young <sean@mess.org>
Subject: [PATCH v4l-utils] keytable: remove line length limits
Date: Mon,  4 Dec 2023 15:26:55 +0000
Message-ID: <20231204152655.109938-1-sean@mess.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use getline() rather than fgets().

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/common/keymap.c     | 16 ++++++-----
 utils/keytable/keytable.c | 60 ++++++++++++++++++++++++++++-----------
 2 files changed, 52 insertions(+), 24 deletions(-)

diff --git a/utils/common/keymap.c b/utils/common/keymap.c
index 47d36152..00082439 100644
--- a/utils/common/keymap.c
+++ b/utils/common/keymap.c
@@ -74,8 +74,9 @@ void free_keymap(struct keymap *map)
 static error_t parse_plain_keymap(char *fname, struct keymap **keymap, bool verbose)
 {
 	FILE *fin;
-	int line = 0;
-	char *scancode, *keycode, s[2048];
+	int line_no = 0;
+	char *scancode, *keycode, *line;
+	size_t line_size;
 	struct scancode_entry *se;
 	struct keymap *map;
 
@@ -94,13 +95,13 @@ static error_t parse_plain_keymap(char *fname, struct keymap **keymap, bool verb
 		return EINVAL;
 	}
 
-	while (fgets(s, sizeof(s), fin)) {
-		char *p = s;
+	while (getline(&line, &line_size, fin)) {
+		char *p = line;
 
-		line++;
+		line_no++;
 		while (*p == ' ' || *p == '\t')
 			p++;
-		if (line==1 && p[0] == '#') {
+		if (line_no==1 && p[0] == '#') {
 			p++;
 			p = strtok(p, "\n\t =:");
 			do {
@@ -168,6 +169,7 @@ static error_t parse_plain_keymap(char *fname, struct keymap **keymap, bool verb
 		map->scancode = se;
 	}
 	fclose(fin);
+	free(line);
 
 	if (!map->protocol) {
 		fprintf(stderr, _("Missing protocol in %s\n"), fname);
@@ -181,7 +183,7 @@ static error_t parse_plain_keymap(char *fname, struct keymap **keymap, bool verb
 err_einval:
 	free_keymap(map);
 	fprintf(stderr, _("Invalid parameter on line %d of %s\n"),
-		line, fname);
+		line_no, fname);
 	return EINVAL;
 }
 
diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
index 62f4531e..2929db40 100644
--- a/utils/keytable/keytable.c
+++ b/utils/keytable/keytable.c
@@ -459,9 +459,9 @@ static int add_keymap(struct keymap *map, const char *fname)
 static error_t parse_cfgfile(char *fname)
 {
 	FILE *fin;
-	int line = 0;
-	char s[2048];
-	char *driver, *table, *filename;
+	int line_no = 0;
+	char *driver, *table, *filename, *line = NULL;
+	size_t line_size;
 	struct cfgfile *nextcfg = &cfg;
 
 	if (debug)
@@ -473,10 +473,10 @@ static error_t parse_cfgfile(char *fname)
 		return errno;
 	}
 
-	while (fgets(s, sizeof(s), fin)) {
-		char *p = s;
+	while (getline(&line, &line_size, fin)) {
+		char *p = line;
 
-		line++;
+		line_no++;
 		while (*p == ' ' || *p == '\t')
 			p++;
 
@@ -511,17 +511,22 @@ static error_t parse_cfgfile(char *fname)
 		nextcfg->next = calloc(1, sizeof(*nextcfg));
 		if (!nextcfg->next) {
 			perror("parse_cfgfile");
+			fclose(fin);
+			free(line);
 			return ENOMEM;
 		}
 		nextcfg = nextcfg->next;
 	}
 	fclose(fin);
+	free(line);
 
 	return 0;
 
 err_einval:
+	free(line);
+	fclose(fin);
 	fprintf(stderr, _("Invalid parameter on line %d of %s\n"),
-		line, fname);
+		line_no, fname);
 	return EINVAL;
 
 }
@@ -825,7 +830,8 @@ static struct uevents *read_sysfs_uevents(char *dname)
 {
 	FILE		*fp;
 	struct uevents	*next, *uevent;
-	char		*event = "uevent", *file, s[4096];
+	char		*event = "uevent", *file, *line = NULL;
+	size_t		line_size;
 
 	next = uevent = calloc(1, sizeof(*uevent));
 
@@ -843,13 +849,15 @@ static struct uevents *read_sysfs_uevents(char *dname)
 		free(file);
 		return NULL;
 	}
-	while (fgets(s, sizeof(s), fp)) {
-		char *p = strtok(s, "=");
+	while (getline(&line, &line_size, fp)) {
+		char *p = strtok(line, "=");
 		if (!p)
 			continue;
 		next->key = malloc(strlen(p) + 1);
 		if (!next->key) {
 			perror("next->key");
+			fclose(fp);
+			free(line);
 			free(file);
 			free_uevent(uevent);
 			return NULL;
@@ -860,6 +868,7 @@ static struct uevents *read_sysfs_uevents(char *dname)
 		if (!p) {
 			fprintf(stderr, _("Error on uevent information\n"));
 			fclose(fp);
+			free(line);
 			free(file);
 			free_uevent(uevent);
 			return NULL;
@@ -867,6 +876,8 @@ static struct uevents *read_sysfs_uevents(char *dname)
 		next->value = malloc(strlen(p) + 1);
 		if (!next->value) {
 			perror("next->value");
+			fclose(fp);
+			free(line);
 			free(file);
 			free_uevent(uevent);
 			return NULL;
@@ -879,13 +890,16 @@ static struct uevents *read_sysfs_uevents(char *dname)
 		next->next = calloc(1, sizeof(*next));
 		if (!next->next) {
 			perror("next->next");
+			fclose(fp);
 			free(file);
+			free(line);
 			free_uevent(uevent);
 			return NULL;
 		}
 		next = next->next;
 	}
 	fclose(fp);
+	free(line);
 	free(file);
 
 	return uevent;
@@ -979,7 +993,8 @@ static enum sysfs_protocols load_bpf_for_unsupported(enum sysfs_protocols protoc
 static enum sysfs_protocols v1_get_hw_protocols(char *name)
 {
 	FILE *fp;
-	char *p, buf[4096];
+	char *p, *buf = NULL;
+	size_t buf_size;
 	enum sysfs_protocols protocols = 0;
 
 	fp = fopen(name, "r");
@@ -988,8 +1003,9 @@ static enum sysfs_protocols v1_get_hw_protocols(char *name)
 		return 0;
 	}
 
-	if (!fgets(buf, sizeof(buf), fp)) {
+	if (!getline(&buf, &buf_size, fp)) {
 		perror(name);
+		free(buf);
 		fclose(fp);
 		return 0;
 	}
@@ -1007,6 +1023,7 @@ static enum sysfs_protocols v1_get_hw_protocols(char *name)
 		protocols |= protocol;
 	}
 
+	free(buf);
 	fclose(fp);
 
 	return protocols;
@@ -1038,7 +1055,8 @@ static int v1_set_hw_protocols(struct rc_device *rc_dev)
 static int v1_get_sw_enabled_protocol(char *dirname)
 {
 	FILE *fp;
-	char *p, buf[4096], name[512];
+	char *p, *buf = NULL, name[512];
+	size_t buf_size;
 	int rc;
 
 	strcpy(name, dirname);
@@ -1050,14 +1068,16 @@ static int v1_get_sw_enabled_protocol(char *dirname)
 		return 0;
 	}
 
-	if (!fgets(buf, sizeof(buf), fp)) {
+	if (!getline(&buf, &buf_size, fp)) {
 		perror(name);
+		free(buf);
 		fclose(fp);
 		return 0;
 	}
 
 	if (fclose(fp)) {
 		perror(name);
+		free(buf);
 		return errno;
 	}
 
@@ -1073,9 +1093,12 @@ static int v1_get_sw_enabled_protocol(char *dirname)
 		fprintf(stderr, _("protocol %s is %s\n"),
 			name, rc? _("enabled") : _("disabled"));
 
-	if (atoi(p) == 1)
+	if (atoi(p) == 1) {
+		free(buf);
 		return 1;
+	}
 
+	free(buf);
 	return 0;
 }
 
@@ -1111,7 +1134,8 @@ static int v1_set_sw_enabled_protocol(struct rc_device *rc_dev,
 static enum sysfs_protocols v2_get_protocols(struct rc_device *rc_dev, char *name)
 {
 	FILE *fp;
-	char *p, buf[4096];
+	char *p, *buf = NULL;
+	size_t buf_size;
 	int enabled;
 
 	fp = fopen(name, "r");
@@ -1120,7 +1144,8 @@ static enum sysfs_protocols v2_get_protocols(struct rc_device *rc_dev, char *nam
 		return 0;
 	}
 
-	if (!fgets(buf, sizeof(buf), fp)) {
+	if (!getline(&buf, &buf_size, fp)) {
+		free(buf);
 		perror(name);
 		fclose(fp);
 		return 0;
@@ -1151,6 +1176,7 @@ static enum sysfs_protocols v2_get_protocols(struct rc_device *rc_dev, char *nam
 	}
 
 	fclose(fp);
+	free(buf);
 
 	return 0;
 }
-- 
2.43.0


