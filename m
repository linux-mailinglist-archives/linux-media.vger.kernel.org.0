Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3F7421C25E
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2020 07:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727899AbgGKFYf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Jul 2020 01:24:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726786AbgGKFYe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Jul 2020 01:24:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7997CC08C5DD
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2020 22:24:34 -0700 (PDT)
Received: from pyrite.rasen.tech (unknown [IPv6:2400:4051:61:600:2c71:1b79:d06d:5032])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F73A98D;
        Sat, 11 Jul 2020 07:24:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594445073;
        bh=e+VgNFc3j3J9a50psQCBgx3t8tXcmQ2WTllQCCzuN4c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WL52tLDPjTABp+wMEa/a6pV4gmOKY6zBkU4GrnemCWacZbnNN7aqqeQMSBTD0wsbZ
         RQNLFapvaLBvHc3KRTVb1/x0DpPEWS3LJnRi8v4/Lw/U7DlluLeLNOkeEOAEwVQZYf
         OXmRUcBw6TTDeHUhvI0PyRlY1J5kklKCRiII7LjA=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH v3 4/6] cec-ctl: Add version command
Date:   Sat, 11 Jul 2020 14:24:12 +0900
Message-Id: <20200711052414.492535-4-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200711052414.492535-1-paul.elder@ideasonboard.com>
References: <20200711052414.492535-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a --version option to cec-ctl to retrieve the version of cec-ctl.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>

---
Changes in v3:
- embed PACKAGE_VERSION instead of string concatenation
---
 utils/cec-ctl/cec-ctl.cpp | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index 455cdaeb..d0ea56ba 100644
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
@@ -231,6 +234,11 @@ static struct option long_options[] = {
 	{ 0, 0, 0, 0 }
 };
 
+static void version()
+{
+	printf("cec-ctl %s\n", PACKAGE_VERSION);
+}
+
 static void usage()
 {
 	printf("Usage:\n"
@@ -262,6 +270,7 @@ static void usage()
 	       "  --help-all               Show all help messages\n"
 	       "  -T, --trace              Trace all called ioctls\n"
 	       "  -v, --verbose            Turn on verbose reporting\n"
+	       "  --version                Show version information\n"
 	       "  -w, --wall-clock         Show timestamps as wall-clock time (implies -v)\n"
 	       "  -W, --wait-for-msgs      Wait for messages and events for up to --monitor-time secs.\n"
 	       "  --cec-version-1.4        Use CEC Version 1.4 instead of 2.0\n"
@@ -2296,6 +2305,10 @@ int main(int argc, char **argv)
 			break;
 		}
 
+		case OptVersion:
+			version();
+			std::exit(EXIT_SUCCESS);
+
 		default:
 			if (ch >= OptHelpAll) {
 				cec_parse_usage_options(options);
-- 
2.27.0

