Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECA621B3400
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 02:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726389AbgDVAhp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 20:37:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbgDVAho (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 20:37:44 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 938D5C0610D5
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2020 17:37:44 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id p8so216456pgi.5
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2020 17:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=aEM5+kfsmk4vdTVE3Cb72MGS4DrfvD/7ptZGfPBt9b8=;
        b=rgzyFpWU0SGdhhmLLNFQp4+kUHR6vy14vrtLiJjl6OUS56pO7E6FNysHVp7MD1T0e5
         iIsIJ6gEFDFrt5bpLU5G9v4Z1Id3CjEmUfrMK9njeGbtERzrVM6ph109ZgfsAVniy8Nf
         m00bL4jezGF7FDJyeQLAJrISTV1xSSrarKR9drtHfog3GIfqEp50gJaIujD2d94NeFdr
         DgA920TxvfE/t7+fD75Q32iIMMyQB0hLpTdDJRRi+rEBNd3IJ3IbjzeM8AR7qzhtfFBH
         RAJeksTRu9sXkHbPJPVjz3FnCj61KtZZsMP5mejayI7aucbrTyDoH+tf8qpg3R6Q7mZ1
         r0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aEM5+kfsmk4vdTVE3Cb72MGS4DrfvD/7ptZGfPBt9b8=;
        b=KDjmLQ6q8ezcn78SdwHzh+NccdauZL0JRopyooC904pJ8TB4emdRxxRmb2zArNnMcU
         j/8XtGcjlxsDSxgUyFrOQ7Sf37DVmTbwkZ9nUBtYkwThxFp0q2L11fcmyHKSd72sUva3
         nMZedN8lvz3w/rZbaE1u8HHEfOhSZVcOdxcZHw1SGbqYPs7ql1N/Ryk0yo+ENJ5PQ+r6
         w1/jniHMovSAUCkY9gTXOCWyDOso7T4Qc2Isr0BSgMrbBn90few/4u4OXi4ZAzQ2gkX1
         yJB4Pn7nmFwvbb0s91kfq37lbw+cXQ3gAOHeyjiNBOU/tVdd4zjL7UI2UI55zoOTnZvh
         2mCg==
X-Gm-Message-State: AGi0PubEzgg2JkIw2OGhbRLIMn18wfkPNa8wDt9Ir34sTQhAE0PvUomB
        mx4NsIomyIq8ao+m3mk4f8zioXmH
X-Google-Smtp-Source: APiQypKrJkgl/1PXq0ZELJIbjorXz7sXND/EV3Ccg0lhhZwHFXxDU/+BozVGsd8QRJDWZ7/BJ/ULIQ==
X-Received: by 2002:aa7:8429:: with SMTP id q9mr23944509pfn.205.1587515863774;
        Tue, 21 Apr 2020 17:37:43 -0700 (PDT)
Received: from localhost.localdomain (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id y16sm1359676pfp.45.2020.04.21.17.37.42
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 17:37:43 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 06/12] utils: add noreturn attribute and remove dead code
Date:   Tue, 21 Apr 2020 17:37:29 -0700
Message-Id: <20200422003735.3891-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200422003735.3891-1-rosenp@gmail.com>
References: <20200422003735.3891-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with -Wmissing-noreturn and -Wunreachable-code-return

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/v4l2-compliance/v4l2-compliance.cpp | 9 ++-------
 utils/v4l2-dbg/v4l2-dbg.cpp               | 7 +------
 2 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index b3a18492..fbf34914 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -155,6 +155,7 @@ static struct option long_options[] = {
 	{0, 0, 0, 0}
 };
 
+__attribute__((noreturn))
 static void usage()
 {
 	printf("Usage:\n");
@@ -482,6 +483,7 @@ static void restoreState()
 	node->reopen();
 }
 
+__attribute__((noreturn))
 static void signal_handler_interrupt(int signum)
 {
 	restoreState();
@@ -1544,7 +1546,6 @@ int main(int argc, char **argv)
 		switch (ch) {
 		case OptHelp:
 			usage();
-			return 0;
 		case OptSetDevice:
 			device = make_devname(optarg, "video", media_bus_info);
 			break;
@@ -1619,7 +1620,6 @@ int main(int argc, char **argv)
 						color_component = 2;
 					else {
 						usage();
-						exit(1);
 					}
 					break;
 				case 1:
@@ -1634,7 +1634,6 @@ int main(int argc, char **argv)
 					break;
 				default:
 					usage();
-					exit(1);
 				}
 			}
 			break;
@@ -1647,7 +1646,6 @@ int main(int argc, char **argv)
 				show_colors = isatty(STDOUT_FILENO);
 			else {
 				usage();
-				exit(1);
 			}
 			break;
 		case OptNoWarnings:
@@ -1669,13 +1667,11 @@ int main(int argc, char **argv)
 			fprintf(stderr, "Option `%s' requires a value\n",
 				argv[optind]);
 			usage();
-			return 1;
 		case '?':
 			if (argv[optind])
 				fprintf(stderr, "Unknown argument `%s'\n",
 					argv[optind]);
 			usage();
-			return 1;
 		}
 	}
 	if (optind < argc) {
@@ -1684,7 +1680,6 @@ int main(int argc, char **argv)
 			fprintf(stderr, "%s ", argv[optind++]);
 		fprintf(stderr, "\n");
 		usage();
-		return 1;
 	}
 	bool direct = !options[OptUseWrapper];
 	int fd;
diff --git a/utils/v4l2-dbg/v4l2-dbg.cpp b/utils/v4l2-dbg/v4l2-dbg.cpp
index cd387d1d..7b986a50 100644
--- a/utils/v4l2-dbg/v4l2-dbg.cpp
+++ b/utils/v4l2-dbg/v4l2-dbg.cpp
@@ -162,6 +162,7 @@ static struct option long_options[] = {
 	{0, 0, 0, 0}
 };
 
+__attribute__((noreturn))
 static void usage()
 {
 	printf("Usage: v4l2-dbg [options] [values]\n"
@@ -387,13 +388,11 @@ static int parse_subopt(char **subs, const char * const *subopts, char **value)
 	if (opt == -1) {
 		fprintf(stderr, "Invalid suboptions specified\n");
 		usage();
-		exit(1);
 	}
 	if (*value == NULL) {
 		fprintf(stderr, "No value given to suboption <%s>\n",
 				subopts[opt]);
 		usage();
-		exit(1);
 	}
 	return opt;
 }
@@ -429,7 +428,6 @@ int main(int argc, char **argv)
 
 	if (argc == 1) {
 		usage();
-		return 0;
 	}
 	for (i = 0; long_options[i].name; i++) {
 		if (!isalpha(long_options[i].val))
@@ -467,7 +465,6 @@ int main(int argc, char **argv)
 		switch (ch) {
 		case OptHelp:
 			usage();
-			return 0;
 
 		case OptSetDevice:
 			device = optarg;
@@ -538,13 +535,11 @@ int main(int argc, char **argv)
 			fprintf(stderr, "Option `%s' requires a value\n",
 				argv[optind]);
 			usage();
-			return 1;
 
 		case '?':
 			fprintf(stderr, "Unknown argument `%s'\n",
 				argv[optind]);
 			usage();
-			return 1;
 		}
 	}
 
-- 
2.25.2

