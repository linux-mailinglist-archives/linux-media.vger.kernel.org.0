Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F51C21C25F
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2020 07:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727939AbgGKFYh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Jul 2020 01:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726786AbgGKFYh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Jul 2020 01:24:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 071AFC08C5DD
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2020 22:24:37 -0700 (PDT)
Received: from pyrite.rasen.tech (unknown [IPv6:2400:4051:61:600:2c71:1b79:d06d:5032])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E81D372C;
        Sat, 11 Jul 2020 07:24:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594445075;
        bh=RqL9nI6Na6108Vzbfv03n1BDZKu9y1UAubPBe8HazVw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FilZvqRChvSAHdTLSkP9WGk7LaT+mNSfLIDf3xleozb/G8riaCeF6tOFS+7lN8wu/
         HWLyIrI9RLoMb+6CysFHRarf2ilBCuMWNQc7p0bw1LbPyYtu1OOMSmMAJmxfpAiY11
         uCXFAhy0n41KJ9b7N3/xYJsrcxLKwlJlXPzbXyKE=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH v3 5/6] cec-follower: Add version command
Date:   Sat, 11 Jul 2020 14:24:13 +0900
Message-Id: <20200711052414.492535-5-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200711052414.492535-1-paul.elder@ideasonboard.com>
References: <20200711052414.492535-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a --version option to cec-follower to retrieve the version of
cec-follower.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>

---
Changes in v3:
- embed PACKAGE_VERSION instead of string concatenation
---
 utils/cec-follower/cec-follower.cpp | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index 9cead57a..a09e1550 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -46,6 +46,7 @@ enum Option {
 	OptShowState = 's',
 	OptWallClock = 'w',
 	OptServiceByDigID = 128,
+	OptVersion,
 	OptLast = 256
 };
 
@@ -70,10 +71,16 @@ static struct option long_options[] = {
 	{ "wall-clock", no_argument, 0, OptWallClock },
 	{ "service-by-dig-id", no_argument, 0, OptServiceByDigID },
 	{ "ignore", required_argument, 0, OptIgnore },
+	{ "version", no_argument, 0, OptVersion },
 
 	{ 0, 0, 0, 0 }
 };
 
+static void version()
+{
+	printf("cec-follower %s\n", PACKAGE_VERSION);
+}
+
 static void usage()
 {
 	printf("Usage:\n"
@@ -93,6 +100,7 @@ static void usage()
 	       "                      Ignore messages from logical address <la> and opcode\n"
 	       "                      <opcode>. 'all' can be used for <la> or <opcode> to match\n"
 	       "                      all logical addresses or opcodes.\n"
+	       "  --version           Show version information\n"
 	       );
 }
 
@@ -427,6 +435,9 @@ int main(int argc, char **argv)
 			show_msgs = true;
 			show_state = true;
 			break;
+		case OptVersion:
+			version();
+			std::exit(EXIT_SUCCESS);
 		case ':':
 			fprintf(stderr, "Option '%s' requires a value\n",
 				argv[optind]);
-- 
2.27.0

