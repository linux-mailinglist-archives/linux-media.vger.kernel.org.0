Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23C9E21B623
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 15:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgGJNS1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 09:18:27 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49654 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726774AbgGJNS1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 09:18:27 -0400
Received: from pyrite.rasen.tech (unknown [IPv6:2400:4051:61:600:2c71:1b79:d06d:5032])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98E422C0;
        Fri, 10 Jul 2020 15:18:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594387105;
        bh=+KyvSVBa7+z478OUpLaw+u5yAAnb2o19VHjDBJdnG+0=;
        h=From:To:Cc:Subject:Date:From;
        b=W1dHCIAB9dneC8jHv9dlrfuV8vgDFUWTuQXuNPAxQ2uanrE3OMaUtEbklDUGeVq21
         Y6T7ImHz43h+nyWgx4q+puf+JDCdFLTTEq6Iet/2+MrEkw6aUOz6mRlt+IUD1h6joN
         J4/DhLVQsarnMUZnrkJrRhu4MXDpsaZIgfGpmAxs=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH 1/2] v4l2-compliance: Add version command
Date:   Fri, 10 Jul 2020 22:18:12 +0900
Message-Id: <20200710131813.452513-1-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a --version option to v4l2-compliance to retrieve the version of
v4l2-compliance.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 utils/v4l2-compliance/v4l2-compliance.cpp | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 4b45f110..72b9768f 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -79,6 +79,7 @@ enum Option {
 	OptMediaBusInfo = 'z',
 	OptStreamFrom = 128,
 	OptStreamFromHdr,
+	OptVersion,
 	OptLast = 256
 };
 
@@ -153,9 +154,15 @@ static struct option long_options[] = {
 	{"stream-all-formats", optional_argument, 0, OptStreamAllFormats},
 	{"stream-all-io", no_argument, 0, OptStreamAllIO},
 	{"stream-all-color", required_argument, 0, OptStreamAllColorTest},
+	{"version", no_argument, 0, OptVersion},
 	{0, 0, 0, 0}
 };
 
+static void version()
+{
+	printf("v4l2-compliance " PACKAGE_VERSION "\n");
+}
+
 static void usage()
 {
 	printf("Usage:\n");
@@ -244,6 +251,7 @@ static void usage()
 	printf("  -P, --no-progress  Turn off progress messages.\n");
 	printf("  -T, --trace        Trace all called ioctls.\n");
 	printf("  -v, --verbose      Turn on verbose reporting.\n");
+	printf("  --version          Show version information.\n");
 #ifndef NO_LIBV4L2
 	printf("  -w, --wrapper      Use the libv4l2 wrapper library.\n");
 #endif
@@ -1664,6 +1672,9 @@ int main(int argc, char **argv)
 		case OptNoProgress:
 			no_progress = true;
 			break;
+		case OptVersion:
+			version();
+			std::exit(EXIT_SUCCESS);
 		case ':':
 			fprintf(stderr, "Option `%s' requires a value\n",
 				argv[optind]);
-- 
2.27.0

