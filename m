Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB5F21E7BC
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 07:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbgGNF7o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 01:59:44 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60712 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgGNF7o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 01:59:44 -0400
Received: from pyrite.rasen.tech (unknown [IPv6:2400:4051:61:600:2c71:1b79:d06d:5032])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9DCB2A4F;
        Tue, 14 Jul 2020 07:59:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594706382;
        bh=2kfshqtIjbsJ4rDoA+mfI3AsdJvjTGc1ptuh239GqQc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MoDgTEZXz/11Hbp+yOAd9aZq06Zr3bTFn2f4Ux87Bik3UH9qjXklDJESEmRmNoamQ
         6DGdWQ8KgzrSkKPMv9sjeXAXWmK/CxWsEDz3/u50WZxmsTWbXheuiAtaEgDyubMlY7
         zi95FC1NC4BziqTXWPMdY8IkInoBapxqbmcybbaU=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH v4 3/7] v4l2-ctl: Add version command
Date:   Tue, 14 Jul 2020 14:59:11 +0900
Message-Id: <20200714055915.640438-3-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714055915.640438-1-paul.elder@ideasonboard.com>
References: <20200714055915.640438-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a --version option to v4l2-ctl to retrieve the version of v4l2-ctl.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

---
Changes in v4:
- add git commit count to version

Changes in v3:
- embed PACKAGE_VERSION instead of string concatenation
---
 utils/v4l2-ctl/Makefile.am         |  2 +-
 utils/v4l2-ctl/v4l2-ctl-common.cpp |  1 +
 utils/v4l2-ctl/v4l2-ctl.cpp        | 11 +++++++++++
 utils/v4l2-ctl/v4l2-ctl.h          |  1 +
 4 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/utils/v4l2-ctl/Makefile.am b/utils/v4l2-ctl/Makefile.am
index 3ba3c96b..04d30894 100644
--- a/utils/v4l2-ctl/Makefile.am
+++ b/utils/v4l2-ctl/Makefile.am
@@ -14,7 +14,7 @@ v4l2_ctl_SOURCES = v4l2-ctl.cpp v4l2-ctl.h v4l2-ctl-common.cpp v4l2-ctl-tuner.cp
 	v4l2-ctl-streaming.cpp v4l2-ctl-sdr.cpp v4l2-ctl-edid.cpp v4l2-ctl-modes.cpp \
 	v4l2-ctl-subdev.cpp v4l2-tpg-colors.c v4l2-tpg-core.c v4l-stream.c v4l2-ctl-meta.cpp \
 	media-info.cpp v4l2-info.cpp codec-fwht.c codec-v4l2-fwht.c
-v4l2_ctl_CPPFLAGS = -I$(top_srcdir)/utils/common
+v4l2_ctl_CPPFLAGS = -I$(top_srcdir)/utils/common $(GIT_COMMIT_CNT)
 
 media-bus-format-names.h: $(top_srcdir)/include/linux/media-bus-format.h
 	sed -e '/#define MEDIA_BUS_FMT/ ! d; s/.*FMT_//; /FIXED/ d; s/\t.*//; s/.*/{ \"&\", MEDIA_BUS_FMT_& },/;' \
diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index 47f5da1a..9b785cbf 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -121,6 +121,7 @@ void common_usage()
 	       "  --silent           only set the result code, do not print any messages\n"
 	       "  --sleep <secs>     sleep <secs>, call QUERYCAP and close the file handle\n"
 	       "  --verbose          turn on verbose ioctl status reporting\n"
+	       "  --version          show version information\n"
 	       );
 }
 
diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index 4972591e..321d2d1c 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -284,6 +284,7 @@ static struct option long_options[] = {
 	{"stream-out-user", optional_argument, 0, OptStreamOutUser},
 	{"stream-out-dmabuf", no_argument, 0, OptStreamOutDmaBuf},
 	{"list-patterns", no_argument, 0, OptListPatterns},
+	{"version", no_argument, 0, OptVersion},
 	{0, 0, 0, 0}
 };
 
@@ -306,6 +307,13 @@ static void usage_all()
        edid_usage();
 }
 
+static void print_version()
+{
+#define STR(x) #x
+#define STRING(x) STR(x)
+	printf("v4l2-ctl %s%s\n", PACKAGE_VERSION, STRING(GIT_COMMIT_CNT));
+}
+
 int test_ioctl(int fd, unsigned long cmd, void *arg)
 {
 	return options[OptUseWrapper] ? v4l2_ioctl(fd, cmd, arg) : ioctl(fd, cmd, arg);
@@ -1245,6 +1253,9 @@ int main(int argc, char **argv)
 		case OptSleep:
 			secs = strtoul(optarg, 0L, 0);
 			break;
+		case OptVersion:
+			print_version();
+			return 0;
 		case ':':
 			fprintf(stderr, "Option '%s' requires a value\n",
 					argv[optind]);
diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
index 28e50471..27a3ca35 100644
--- a/utils/v4l2-ctl/v4l2-ctl.h
+++ b/utils/v4l2-ctl/v4l2-ctl.h
@@ -263,6 +263,7 @@ enum Option {
 	OptHelpStreaming,
 	OptHelpEdid,
 	OptHelpAll,
+	OptVersion,
 	OptLast = 512
 };
 
-- 
2.27.0

