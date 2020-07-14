Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AED2D21E7C0
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 07:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbgGNF7z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 01:59:55 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60728 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726660AbgGNF7z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 01:59:55 -0400
Received: from pyrite.rasen.tech (unknown [IPv6:2400:4051:61:600:2c71:1b79:d06d:5032])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4868B564;
        Tue, 14 Jul 2020 07:59:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594706393;
        bh=leaVOcVC0KbhrxAshuXz6qhHxu+s6tSVrZ9onCPA+CU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=M7DtmvbGnBhPE+NZX2kZcjJ3zKZeKtARUFFqEmxsrtYqPhbU59e+h7KvoawT12x/P
         aoJkzb8rv7BJ4NouDy2Re1R8wmiE8Q9lYmftA2xFkkZ6JdHfIIuv4jXhTrIInwi8rh
         /SoDuFdWMPDEwc/UfkhnAIEYHvxcIwlWgOADmgfs=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH v4 7/7] media-ctl: Add version command
Date:   Tue, 14 Jul 2020 14:59:15 +0900
Message-Id: <20200714055915.640438-7-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714055915.640438-1-paul.elder@ideasonboard.com>
References: <20200714055915.640438-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a --version option to media-ctl to retrieve the version of
media-ctl.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>

---
Changes in v4:
- add git commit count to version

Changes in v3:
- embed PACKAGE_VERSION instead of string concatenation
---
 utils/media-ctl/Makefile.am |  1 +
 utils/media-ctl/options.c   | 14 ++++++++++++++
 utils/media-ctl/options.h   |  2 ++
 3 files changed, 17 insertions(+)

diff --git a/utils/media-ctl/Makefile.am b/utils/media-ctl/Makefile.am
index ee7dcc96..860e6f5a 100644
--- a/utils/media-ctl/Makefile.am
+++ b/utils/media-ctl/Makefile.am
@@ -27,3 +27,4 @@ noinst_HEADERS = mediactl.h v4l2subdev.h
 bin_PROGRAMS = media-ctl
 media_ctl_SOURCES = media-ctl.c options.c options.h tools.h
 media_ctl_LDADD = libmediactl.la libv4l2subdev.la
+media_ctl_CFLAGS = $(GIT_COMMIT_CNT)
diff --git a/utils/media-ctl/options.c b/utils/media-ctl/options.c
index fb923775..55376323 100644
--- a/utils/media-ctl/options.c
+++ b/utils/media-ctl/options.c
@@ -42,6 +42,13 @@ struct media_options media_opts = {
 	.devname = MEDIA_DEVNAME_DEFAULT,
 };
 
+static void print_version()
+{
+#define STR(x) #x
+#define STRING(x) STR(x)
+	printf("media-ctl %s%s\n", PACKAGE_VERSION, STRING(GIT_COMMIT_CNT));
+}
+
 static void usage(const char *argv0)
 {
 	unsigned int i;
@@ -66,6 +73,7 @@ static void usage(const char *argv0)
 	printf("    --print-dot		Print the device topology as a dot graph\n");
 	printf("-r, --reset		Reset all links to inactive\n");
 	printf("-v, --verbose		Be verbose\n");
+	printf("    --version		Show version information\n");
 	printf("\n");
 	printf("Links and formats are defined as\n");
 	printf("\tlinks           = link { ',' link } ;\n");
@@ -127,6 +135,7 @@ static void usage(const char *argv0)
 #define OPT_SET_DV			258
 #define OPT_LIST_KNOWN_MBUS_FMTS	259
 #define OPT_GET_DV			260
+#define OPT_VERSION			261
 
 static struct option opts[] = {
 	{"device", 1, 0, 'd'},
@@ -145,6 +154,7 @@ static struct option opts[] = {
 	{"print-topology", 0, 0, 'p'},
 	{"reset", 0, 0, 'r'},
 	{"verbose", 0, 0, 'v'},
+	{"version", 0, 0, OPT_VERSION},
 	{ },
 };
 
@@ -287,6 +297,10 @@ int parse_cmdline(int argc, char **argv)
 			list_known_mbus_formats();
 			exit(0);
 
+		case OPT_VERSION:
+			print_version();
+			exit(0);
+
 		default:
 			printf("Invalid option -%c\n", opt);
 			printf("Run %s -h for help.\n", argv[0]);
diff --git a/utils/media-ctl/options.h b/utils/media-ctl/options.h
index 7e0556fc..b1751f56 100644
--- a/utils/media-ctl/options.h
+++ b/utils/media-ctl/options.h
@@ -22,6 +22,8 @@
 #ifndef __OPTIONS_H
 #define __OPTIONS_H
 
+#include <config.h>
+
 struct media_options
 {
 	const char *devname;
-- 
2.27.0

