Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D92C3131D10
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 02:14:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727397AbgAGBOX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 20:14:23 -0500
Received: from mga12.intel.com ([192.55.52.136]:60822 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727250AbgAGBOX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Jan 2020 20:14:23 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Jan 2020 17:14:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,404,1571727600"; 
   d="scan'208";a="216992332"
Received: from maru.jf.intel.com ([10.54.51.77])
  by fmsmga007.fm.intel.com with ESMTP; 06 Jan 2020 17:14:22 -0800
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH 3/3] media: aspeed: add AST2600 support
Date:   Mon,  6 Jan 2020 17:15:03 -0800
Message-Id: <20200107011503.17435-4-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200107011503.17435-1-jae.hyun.yoo@linux.intel.com>
References: <20200107011503.17435-1-jae.hyun.yoo@linux.intel.com>
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
index d8593cb2ae84..0dbe72672338 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -72,10 +72,10 @@
 #define  VE_SEQ_CTRL_CAP_BUSY		BIT(16)
 #define  VE_SEQ_CTRL_COMP_BUSY		BIT(18)
 
-#ifdef CONFIG_MACH_ASPEED_G5
-#define  VE_SEQ_CTRL_JPEG_MODE		BIT(13)	/* AST2500 */
-#else
+#ifdef CONFIG_MACH_ASPEED_G4
 #define  VE_SEQ_CTRL_JPEG_MODE		BIT(8)	/* AST2400 */
+#else
+#define  VE_SEQ_CTRL_JPEG_MODE		BIT(13)	/* AST2500/2600 */
 #endif /* CONFIG_MACH_ASPEED_G5 */
 
 #define VE_CTRL				0x008
@@ -135,6 +135,12 @@
 
 #define VE_OFFSET_COMP_STREAM		0x078
 
+#ifdef CONFIG_MACH_ASPEED_G6
+#define VE_JPEG_COMP_SIZE_READ_BACK	0x084	/* AST2600 */
+#else
+#define VE_JPEG_COMP_SIZE_READ_BACK	VE_OFFSET_COMP_STREAM
+#endif
+
 #define VE_SRC_LR_EDGE_DET		0x090
 #define  VE_SRC_LR_EDGE_DET_LEFT	GENMASK(11, 0)
 #define  VE_SRC_LR_EDGE_DET_NO_V	BIT(12)
@@ -572,7 +578,7 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 	if (sts & VE_INTERRUPT_COMP_COMPLETE) {
 		struct aspeed_video_buffer *buf;
 		u32 frame_size = aspeed_video_read(video,
-						   VE_OFFSET_COMP_STREAM);
+						   VE_JPEG_COMP_SIZE_READ_BACK);
 
 		spin_lock(&video->lock);
 		clear_bit(VIDEO_FRAME_INPRG, &video->flags);
@@ -1719,6 +1725,7 @@ static int aspeed_video_remove(struct platform_device *pdev)
 static const struct of_device_id aspeed_video_of_match[] = {
 	{ .compatible = "aspeed,ast2400-video-engine" },
 	{ .compatible = "aspeed,ast2500-video-engine" },
+	{ .compatible = "aspeed,ast2600-video-engine" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, aspeed_video_of_match);
-- 
2.17.1

