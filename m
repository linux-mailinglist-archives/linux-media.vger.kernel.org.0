Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5B0C1226B
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2019 21:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbfEBTNW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 May 2019 15:13:22 -0400
Received: from mga06.intel.com ([134.134.136.31]:21537 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725962AbfEBTNW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 May 2019 15:13:22 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 May 2019 12:13:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,422,1549958400"; 
   d="scan'208";a="154234021"
Received: from maru.jf.intel.com ([10.54.51.75])
  by FMSMGA003.fm.intel.com with ESMTP; 02 May 2019 12:13:21 -0700
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH 2/7] media: aspeed: refine clock control logic
Date:   Thu,  2 May 2019 12:13:12 -0700
Message-Id: <20190502191317.29698-3-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190502191317.29698-1-jae.hyun.yoo@linux.intel.com>
References: <20190502191317.29698-1-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently, this driver calls clk_prepare and clk_unprepare from
interrupt context too but these should be called from sleepable
context only. To fix this issue, this commit splits out
clk_enable/disable and clk_prepare/unprepare, and it places
clk_prepare/unprepare calls into the module probe/remove function.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Reviewed-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/media/platform/aspeed-video.c | 38 ++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 2dac6d20b180..8f4cac41da14 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -491,8 +491,8 @@ static void aspeed_video_off(struct aspeed_video *video)
 	aspeed_video_write(video, VE_INTERRUPT_CTRL, 0);
 
 	/* Turn off the relevant clocks */
-	clk_disable_unprepare(video->vclk);
-	clk_disable_unprepare(video->eclk);
+	clk_disable(video->vclk);
+	clk_disable(video->eclk);
 
 	clear_bit(VIDEO_CLOCKS_ON, &video->flags);
 }
@@ -503,8 +503,8 @@ static void aspeed_video_on(struct aspeed_video *video)
 		return;
 
 	/* Turn on the relevant clocks */
-	clk_prepare_enable(video->eclk);
-	clk_prepare_enable(video->vclk);
+	clk_enable(video->eclk);
+	clk_enable(video->vclk);
 
 	set_bit(VIDEO_CLOCKS_ON, &video->flags);
 }
@@ -1628,12 +1628,21 @@ static int aspeed_video_init(struct aspeed_video *video)
 		return PTR_ERR(video->eclk);
 	}
 
+	rc = clk_prepare(video->eclk);
+	if (rc)
+		return rc;
+
 	video->vclk = devm_clk_get(dev, "vclk");
 	if (IS_ERR(video->vclk)) {
 		dev_err(dev, "Unable to get VCLK\n");
-		return PTR_ERR(video->vclk);
+		rc = PTR_ERR(video->vclk);
+		goto err_unprepare_eclk;
 	}
 
+	rc = clk_prepare(video->vclk);
+	if (rc)
+		goto err_unprepare_eclk;
+
 	rc = of_reserved_mem_device_init(dev);
 	if (rc) {
 		dev_err(dev, "Unable to reserve memory\n");
@@ -1643,20 +1652,26 @@ static int aspeed_video_init(struct aspeed_video *video)
 	rc = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (rc) {
 		dev_err(dev, "Failed to set DMA mask\n");
-		of_reserved_mem_device_release(dev);
-		return rc;
+		goto err_release_reserved_mem;
 	}
 
 	if (!aspeed_video_alloc_buf(video, &video->jpeg,
 				    VE_JPEG_HEADER_SIZE)) {
 		dev_err(dev, "Failed to allocate DMA for JPEG header\n");
-		of_reserved_mem_device_release(dev);
-		return rc;
+		goto err_release_reserved_mem;
 	}
 
 	aspeed_video_init_jpeg_table(video->jpeg.virt, video->yuv420);
 
 	return 0;
+
+err_release_reserved_mem:
+	of_reserved_mem_device_release(dev);
+	clk_unprepare(video->vclk);
+err_unprepare_eclk:
+	clk_unprepare(video->eclk);
+
+	return rc;
 }
 
 static int aspeed_video_probe(struct platform_device *pdev)
@@ -1700,6 +1715,11 @@ static int aspeed_video_remove(struct platform_device *pdev)
 	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev);
 	struct aspeed_video *video = to_aspeed_video(v4l2_dev);
 
+	aspeed_video_off(video);
+
+	clk_unprepare(video->vclk);
+	clk_unprepare(video->eclk);
+
 	video_unregister_device(&video->vdev);
 
 	vb2_queue_release(&video->queue);
-- 
2.21.0

