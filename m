Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFFA621B980
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 17:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728067AbgGJP3b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 11:29:31 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50770 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726832AbgGJP3b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 11:29:31 -0400
Received: from pyrite.rasen.tech (unknown [IPv6:2400:4051:61:600:2c71:1b79:d06d:5032])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E36AA2C0;
        Fri, 10 Jul 2020 17:29:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594394969;
        bh=8YpS6M62rzCTKd8bpWa38Z1F4L8DhLSDvcPeqDKa5Ho=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HlESv3tmhLTnj/nRcCnf+VFIJPnabnpVmtYko2yd5kcTGAqNjCam8CRDwGbRa/MnD
         l7ulfjIs4zWUUlsGlda1exluxu6p7hUcnV4watqxaSeoeiovgcZ9aLpjdNQIszbyT7
         QgyaBnphsnrZKoW6YFG3uksa9eOqG/3XaHWZ85RQ=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH v2 5/6] cec-follower: Add version command
Date:   Sat, 11 Jul 2020 00:28:57 +0900
Message-Id: <20200710152858.486326-5-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200710152858.486326-1-paul.elder@ideasonboard.com>
References: <20200710152858.486326-1-paul.elder@ideasonboard.com>
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
 utils/cec-follower/cec-follower.cpp | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index 9cead57a..34663f5b 100644
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
+	printf("cec-follower " PACKAGE_VERSION "\n");
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

