Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4350E21B981
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 17:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728089AbgGJP3d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 11:29:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726832AbgGJP3d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 11:29:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 742F6C08C5CE
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2020 08:29:33 -0700 (PDT)
Received: from pyrite.rasen.tech (unknown [IPv6:2400:4051:61:600:2c71:1b79:d06d:5032])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F2629B1;
        Fri, 10 Jul 2020 17:29:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594394972;
        bh=2c5DqY/D9UWKF7DFmRgu0m5XhHNAY/LzzjurIsk78sI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=me7A1naIRGpG2d7sDyniQW8+Y4KIpZsurjEhjivpMU25mPetgmNIpadGDM+GAZUvc
         cBh8WEmd7Imz/e0SjqCXK7DJhv40Mcl+vOI/4wSYygr4QwdX0QnkTAAL8c+ZrDsuCF
         TkyQu3YQXu2M5zCXriIU9gYIXIAnvbA4XPOd5+To=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH v2 6/6] media-ctl: Add version command
Date:   Sat, 11 Jul 2020 00:28:58 +0900
Message-Id: <20200710152858.486326-6-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200710152858.486326-1-paul.elder@ideasonboard.com>
References: <20200710152858.486326-1-paul.elder@ideasonboard.com>
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
 utils/media-ctl/options.c | 12 ++++++++++++
 utils/media-ctl/options.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/utils/media-ctl/options.c b/utils/media-ctl/options.c
index fb923775..3346ecb1 100644
--- a/utils/media-ctl/options.c
+++ b/utils/media-ctl/options.c
@@ -42,6 +42,11 @@ struct media_options media_opts = {
 	.devname = MEDIA_DEVNAME_DEFAULT,
 };
 
+static void version()
+{
+	printf("media-ctl " PACKAGE_VERSION "\n");
+}
+
 static void usage(const char *argv0)
 {
 	unsigned int i;
@@ -66,6 +71,7 @@ static void usage(const char *argv0)
 	printf("    --print-dot		Print the device topology as a dot graph\n");
 	printf("-r, --reset		Reset all links to inactive\n");
 	printf("-v, --verbose		Be verbose\n");
+	printf("    --version		Show version information\n");
 	printf("\n");
 	printf("Links and formats are defined as\n");
 	printf("\tlinks           = link { ',' link } ;\n");
@@ -127,6 +133,7 @@ static void usage(const char *argv0)
 #define OPT_SET_DV			258
 #define OPT_LIST_KNOWN_MBUS_FMTS	259
 #define OPT_GET_DV			260
+#define OPT_VERSION			261
 
 static struct option opts[] = {
 	{"device", 1, 0, 'd'},
@@ -145,6 +152,7 @@ static struct option opts[] = {
 	{"print-topology", 0, 0, 'p'},
 	{"reset", 0, 0, 'r'},
 	{"verbose", 0, 0, 'v'},
+	{"version", 0, 0, OPT_VERSION},
 	{ },
 };
 
@@ -287,6 +295,10 @@ int parse_cmdline(int argc, char **argv)
 			list_known_mbus_formats();
 			exit(0);
 
+		case OPT_VERSION:
+			version();
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

