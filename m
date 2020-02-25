Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1000116EF78
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2020 20:56:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730864AbgBYT43 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Feb 2020 14:56:29 -0500
Received: from mga05.intel.com ([192.55.52.43]:49029 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728051AbgBYT43 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Feb 2020 14:56:29 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Feb 2020 11:56:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,485,1574150400"; 
   d="scan'208";a="230230964"
Received: from maru.jf.intel.com ([10.54.51.77])
  by fmsmga007.fm.intel.com with ESMTP; 25 Feb 2020 11:56:27 -0800
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH -next] media: aspeed: add AST2600 support
Date:   Tue, 25 Feb 2020 11:58:53 -0800
Message-Id: <20200225195853.17480-1-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Video engine in AST2600 has the exactly same register set with
AST2500 except VR084 register which provides more precise JPEG
size read back. This commit adds support for the difference and
adds 'aspeed,ast2600-video-engine' compatible OF string.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 drivers/media/platform/aspeed-video.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 47444a336ebb..7d98db1d9b52 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 // Copyright 2020 IBM Corp.
-// Copyright (c) 2019 Intel Corporation
+// Copyright (c) 2019-2020 Intel Corporation
 
 #include <linux/atomic.h>
 #include <linux/bitfield.h>
@@ -132,7 +132,8 @@
 #define  VE_COMP_CTRL_HQ_DCT_CHR	GENMASK(26, 22)
 #define  VE_COMP_CTRL_HQ_DCT_LUM	GENMASK(31, 27)
 
-#define VE_OFFSET_COMP_STREAM		0x078
+#define AST2400_VE_COMP_SIZE_READ_BACK	0x078
+#define AST2600_VE_COMP_SIZE_READ_BACK	0x084
 
 #define VE_SRC_LR_EDGE_DET		0x090
 #define  VE_SRC_LR_EDGE_DET_LEFT	GENMASK(11, 0)
@@ -252,12 +253,17 @@ struct aspeed_video_config {
 
 static const struct aspeed_video_config ast2400_config = {
 	.jpeg_mode = AST2400_VE_SEQ_CTRL_JPEG_MODE,
-	.comp_size_read = VE_OFFSET_COMP_STREAM,
+	.comp_size_read = AST2400_VE_COMP_SIZE_READ_BACK,
 };
 
 static const struct aspeed_video_config ast2500_config = {
 	.jpeg_mode = AST2500_VE_SEQ_CTRL_JPEG_MODE,
-	.comp_size_read = VE_OFFSET_COMP_STREAM,
+	.comp_size_read = AST2400_VE_COMP_SIZE_READ_BACK,
+};
+
+static const struct aspeed_video_config ast2600_config = {
+	.jpeg_mode = AST2500_VE_SEQ_CTRL_JPEG_MODE,
+	.comp_size_read = AST2600_VE_COMP_SIZE_READ_BACK,
 };
 
 static const u32 aspeed_video_jpeg_header[ASPEED_VIDEO_JPEG_HEADER_SIZE] = {
@@ -1673,6 +1679,7 @@ static int aspeed_video_init(struct aspeed_video *video)
 static const struct of_device_id aspeed_video_of_match[] = {
 	{ .compatible = "aspeed,ast2400-video-engine", .data = &ast2400_config },
 	{ .compatible = "aspeed,ast2500-video-engine", .data = &ast2500_config },
+	{ .compatible = "aspeed,ast2600-video-engine", .data = &ast2600_config },
 	{}
 };
 MODULE_DEVICE_TABLE(of, aspeed_video_of_match);
-- 
2.17.1

