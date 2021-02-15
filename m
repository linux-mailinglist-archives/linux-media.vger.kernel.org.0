Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C47D931B4B5
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:37:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbhBOEgL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:36:11 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45928 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbhBOEgK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:36:10 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32B071AB8;
        Mon, 15 Feb 2021 05:28:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363323;
        bh=+E8cDKHY5O8tCaiVHrMjhQ7kB3d/2NVBCAhNsY6PrOg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bF2I2n/86kiY3DkCy/kxZitILNv3KbKOXw+PO7rky+SaCl+cEIphopw8QF4w1eBgq
         Tn77ncfppbljNgC1wQC3R32gdmeZcWEZnyniC7xirQwRY/3c3dH4WkEgOz/S0Cf20E
         G5whz+H3O7jDpztC1l3Yk3x66dk0jOt990Xhjz7o=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 42/77] media: imx: imx7-media-csi: Move CSI configuration before source start
Date:   Mon, 15 Feb 2021 06:27:06 +0200
Message-Id: <20210215042741.28850-43-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There's no reason to delay the CSI configuration and the DMA setup after
starting the source. Move it before, simplifying error handling at
stream start.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 27 ++++++++--------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 9cb04fa31b5a..f6a26dff8541 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -577,15 +577,23 @@ static int imx7_csi_init(struct imx7_csi *csi)
 	ret = clk_prepare_enable(csi->mclk);
 	if (ret < 0)
 		return ret;
+
 	imx7_csi_hw_reset(csi);
 	imx7_csi_init_interface(csi);
 	imx7_csi_dmareq_rff_enable(csi);
 
+	ret = imx7_csi_dma_setup(csi);
+	if (ret < 0)
+		return ret;
+
+	imx7_csi_configure(csi);
+
 	return 0;
 }
 
 static void imx7_csi_deinit(struct imx7_csi *csi)
 {
+	imx7_csi_dma_cleanup(csi);
 	imx7_csi_hw_reset(csi);
 	imx7_csi_init_interface(csi);
 	imx7_csi_dmareq_rff_disable(csi);
@@ -612,24 +620,14 @@ static void imx7_csi_disable(struct imx7_csi *csi)
 	imx7_csi_hw_disable(csi);
 }
 
-static int imx7_csi_streaming_start(struct imx7_csi *csi)
+static void imx7_csi_streaming_start(struct imx7_csi *csi)
 {
-	int ret;
-
-	ret = imx7_csi_dma_setup(csi);
-	if (ret < 0)
-		return ret;
-
-	imx7_csi_configure(csi);
 	imx7_csi_enable(csi);
-
-	return 0;
 }
 
 static int imx7_csi_streaming_stop(struct imx7_csi *csi)
 {
 	imx7_csi_dma_stop(csi);
-	imx7_csi_dma_cleanup(csi);
 
 	imx7_csi_disable(csi);
 
@@ -769,12 +767,7 @@ static int imx7_csi_s_stream(struct v4l2_subdev *sd, int enable)
 			goto out_unlock;
 		}
 
-		ret = imx7_csi_streaming_start(csi);
-		if (ret < 0) {
-			v4l2_subdev_call(csi->src_sd, video, s_stream, 0);
-			imx7_csi_deinit(csi);
-			goto out_unlock;
-		}
+		imx7_csi_streaming_start(csi);
 	} else {
 		imx7_csi_streaming_stop(csi);
 
-- 
Regards,

Laurent Pinchart

