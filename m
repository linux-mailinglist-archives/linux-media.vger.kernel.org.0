Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41D0531B4B6
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:37:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbhBOEgM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:36:12 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45902 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229979AbhBOEgK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:36:10 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E3061ABB;
        Mon, 15 Feb 2021 05:28:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363324;
        bh=OgNM4mZV9tR3GaivlSZDCUL8ZcZLdALS6kfaY0x+kkE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PJKOfs67JuEs4hZQTmoPFz47RNninnPPf2Sw6PJONvW2+b+irWYO9MzFeNy6YH99v
         amYpIyYde19zTvuCWs4fi8NM13porNF5o3Ea0J9wU3yShDAN3wdTRO0wls2HnQwdOf
         JDJlarCoGW4SoSRlzlDGVD2vaSxfrgp/40OFif7U=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 43/77] media: imx: imx7-media-csi: Merge streaming_start() with csi_enable()
Date:   Mon, 15 Feb 2021 06:27:07 +0200
Message-Id: <20210215042741.28850-44-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The imx7_csi_streaming_start() function just wraps imx7_csi_enable().
Call the latter directly.

Similarly, merge imx7_csi_streaming_stop() and imx7_csi_disable() as
they're both called from a single location only.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 28 +++++++---------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index f6a26dff8541..53bab0a0a878 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -610,28 +610,16 @@ static void imx7_csi_enable(struct imx7_csi *csi)
 }
 
 static void imx7_csi_disable(struct imx7_csi *csi)
-{
-	imx7_csi_dmareq_rff_disable(csi);
-
-	imx7_csi_hw_disable_irq(csi);
-
-	imx7_csi_buf_stride_set(csi, 0);
-
-	imx7_csi_hw_disable(csi);
-}
-
-static void imx7_csi_streaming_start(struct imx7_csi *csi)
-{
-	imx7_csi_enable(csi);
-}
-
-static int imx7_csi_streaming_stop(struct imx7_csi *csi)
 {
 	imx7_csi_dma_stop(csi);
 
-	imx7_csi_disable(csi);
+	imx7_csi_dmareq_rff_disable(csi);
 
-	return 0;
+	imx7_csi_hw_disable_irq(csi);
+
+	imx7_csi_buf_stride_set(csi, 0);
+
+	imx7_csi_hw_disable(csi);
 }
 
 /* -----------------------------------------------------------------------------
@@ -767,9 +755,9 @@ static int imx7_csi_s_stream(struct v4l2_subdev *sd, int enable)
 			goto out_unlock;
 		}
 
-		imx7_csi_streaming_start(csi);
+		imx7_csi_enable(csi);
 	} else {
-		imx7_csi_streaming_stop(csi);
+		imx7_csi_disable(csi);
 
 		v4l2_subdev_call(csi->src_sd, video, s_stream, 0);
 
-- 
Regards,

Laurent Pinchart

