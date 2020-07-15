Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD4B2209F4
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 12:26:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729154AbgGOK04 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 06:26:56 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53418 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728132AbgGOK04 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 06:26:56 -0400
Received: from pyrite.rasen.tech (unknown [IPv6:2400:4051:61:600:2c71:1b79:d06d:5032])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8584D595;
        Wed, 15 Jul 2020 12:26:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594808814;
        bh=qtNY5VitZDMUUhrhbQmXzCTqX4RQXjpfC6pVBlwAu6Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XqV+Y9fFpidU1N/cjKIvQ7WXS7mP3fLKgskFDGQt46Fv9v9GqQJ7VDnGO2hq8rVmj
         BTDHFv4WWlwAYpKs/oTJXF4HhZbFJ+ZMPtTesKzEjDThW7ofQJPeyB+pTb0NQlFZ1h
         p4/qP9owaOAnOMYRtZI528pQp7ojdwcaW4kXfjzM=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH v5 2/5] v4l2-ctl: Add version command
Date:   Wed, 15 Jul 2020 19:26:37 +0900
Message-Id: <20200715102640.17554-2-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200715102640.17554-1-paul.elder@ideasonboard.com>
References: <20200715102640.17554-1-paul.elder@ideasonboard.com>
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
Changes in v5:
- update manpage

Changes in v4:
- add git commit count to version

Changes in v3:
- embed PACKAGE_VERSION instead of string concatenation
---
 utils/v4l2-ctl/Makefile.am         |  2 +-
 utils/v4l2-ctl/v4l2-ctl-common.cpp |  1 +
 utils/v4l2-ctl/v4l2-ctl.1.in       |  3 +++
 utils/v4l2-ctl/v4l2-ctl.cpp        | 11 +++++++++++
 utils/v4l2-ctl/v4l2-ctl.h          |  1 +
 5 files changed, 17 insertions(+), 1 deletion(-)

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
 
diff --git a/utils/v4l2-ctl/v4l2-ctl.1.in b/utils/v4l2-ctl/v4l2-ctl.1.in
index e9fff788..b8cbe6d2 100644
--- a/utils/v4l2-ctl/v4l2-ctl.1.in
+++ b/utils/v4l2-ctl/v4l2-ctl.1.in
@@ -21,6 +21,9 @@ with the bus info string as specified by the \fB-z\fR option.
 \fB\-v\fR, \fB\-\-verbose\fR
 Turn on verbose reporting.
 .TP
+\fB\-\-version\fR
+Show version information.
+.TP
 \fB\-w\fR, \fB\-\-wrapper\fR
 Use the libv4l2 wrapper library for all V4L2 device accesses. By default v4l2-ctl will
 directly access the V4L2 device, but with this option all access will go via this
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

