Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 450B721B97F
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 17:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728065AbgGJP33 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 11:29:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726832AbgGJP32 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 11:29:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87EF4C08C5CE
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2020 08:29:28 -0700 (PDT)
Received: from pyrite.rasen.tech (unknown [IPv6:2400:4051:61:600:2c71:1b79:d06d:5032])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 73FC69B1;
        Fri, 10 Jul 2020 17:29:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594394967;
        bh=Whk1suoOgmf2WQVJN9qBm6EqkiQe7VJyA3plS0Ws1Is=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MY3pl8uZ9TbOHK6baKIxFIGfvveWA4PqHjW99ZeGi08q1rhFAhHkN7/QxtZRw76Yr
         IVubEYNCCCmbZjmgvz2TE1H6pS2vjBEN7ogmjB0owG60SCLZussgQ4kNh5WYT6/URW
         OBjbTRiCNFebNl8pFV7yQvmFn6iGm4Xor8suj3FA=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH v2 4/6] cec-ctl: Add version command
Date:   Sat, 11 Jul 2020 00:28:56 +0900
Message-Id: <20200710152858.486326-4-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200710152858.486326-1-paul.elder@ideasonboard.com>
References: <20200710152858.486326-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a --version option to cec-ctl to retrieve the version of cec-ctl.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 utils/cec-ctl/cec-ctl.cpp | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index 455cdaeb..d4a4f036 100644
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
+	printf("cec-ctl " PACKAGE_VERSION "\n");
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

