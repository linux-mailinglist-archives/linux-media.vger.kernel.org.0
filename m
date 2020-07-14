Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ADC621E7BE
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 07:59:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726630AbgGNF7t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 01:59:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726624AbgGNF7t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 01:59:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32E11C061755
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2020 22:59:49 -0700 (PDT)
Received: from pyrite.rasen.tech (unknown [IPv6:2400:4051:61:600:2c71:1b79:d06d:5032])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED222564;
        Tue, 14 Jul 2020 07:59:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594706387;
        bh=VDyPv0rI43O2UPAM58wXMz3fERL1nW/ES3b7rZ8qS0w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Sqvqypdj+S3MG2syB/zB4t9FY7RKX+5px6CKwhkNcJiKLMYjnlWpObS153hbLNKHF
         FhnH3M4D2YD/scvphWCcr2VUnVhICedrB5roIsQUMnRxafeqrnksWkhyrln8UJrlKe
         qtAsVlFeOnWviS5gGLHYfwCDzGoHOpTNpQ1woaO4=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH v4 5/7] cec-ctl: Add version command
Date:   Tue, 14 Jul 2020 14:59:13 +0900
Message-Id: <20200714055915.640438-5-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714055915.640438-1-paul.elder@ideasonboard.com>
References: <20200714055915.640438-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a --version option to cec-ctl to retrieve the version of cec-ctl.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>

---
Changes in v4:
- add git commit count to version

Changes in v3:
- embed PACKAGE_VERSION instead of string concatenation
---
 utils/cec-ctl/Makefile.am |  2 +-
 utils/cec-ctl/cec-ctl.cpp | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/utils/cec-ctl/Makefile.am b/utils/cec-ctl/Makefile.am
index 24341ed7..278fcc47 100644
--- a/utils/cec-ctl/Makefile.am
+++ b/utils/cec-ctl/Makefile.am
@@ -2,7 +2,7 @@ bin_PROGRAMS = cec-ctl
 man_MANS = cec-ctl.1
 
 cec_ctl_SOURCES = cec-ctl.cpp cec-pin.cpp cec-ctl.h
-cec_ctl_CPPFLAGS = -I$(top_srcdir)/utils/libcecutil
+cec_ctl_CPPFLAGS = -I$(top_srcdir)/utils/libcecutil $(GIT_COMMIT_CNT)
 cec_ctl_LDADD = -lrt ../libcecutil/libcecutil.la
 
 EXTRA_DIST = cec-ctl.1
diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index 455cdaeb..47867f87 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -133,6 +133,7 @@ enum Option {
 	OptVendorCommandWithID,
 	OptVendorRemoteButtonDown,
 	OptCustomCommand,
+	OptVersion,
 };
 
 struct node {
@@ -218,6 +219,8 @@ static struct option long_options[] = {
 	{ "unregistered", no_argument, 0, OptUnregistered },
 	{ "help-all", no_argument, 0, OptHelpAll },
 
+	{ "version", no_argument, 0, OptVersion },
+
 	CEC_PARSE_LONG_OPTS
 
 	{ "vendor-remote-button-down", required_argument, 0, OptVendorRemoteButtonDown }, \
@@ -231,6 +234,13 @@ static struct option long_options[] = {
 	{ 0, 0, 0, 0 }
 };
 
+static void print_version()
+{
+#define STR(x) #x
+#define STRING(x) STR(x)
+	printf("cec-ctl %s%s\n", PACKAGE_VERSION, STRING(GIT_COMMIT_CNT));
+}
+
 static void usage()
 {
 	printf("Usage:\n"
@@ -262,6 +272,7 @@ static void usage()
 	       "  --help-all               Show all help messages\n"
 	       "  -T, --trace              Trace all called ioctls\n"
 	       "  -v, --verbose            Turn on verbose reporting\n"
+	       "  --version                Show version information\n"
 	       "  -w, --wall-clock         Show timestamps as wall-clock time (implies -v)\n"
 	       "  -W, --wait-for-msgs      Wait for messages and events for up to --monitor-time secs.\n"
 	       "  --cec-version-1.4        Use CEC Version 1.4 instead of 2.0\n"
@@ -2296,6 +2307,10 @@ int main(int argc, char **argv)
 			break;
 		}
 
+		case OptVersion:
+			print_version();
+			std::exit(EXIT_SUCCESS);
+
 		default:
 			if (ch >= OptHelpAll) {
 				cec_parse_usage_options(options);
-- 
2.27.0

