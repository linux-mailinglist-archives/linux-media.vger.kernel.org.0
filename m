Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67A5E38842C
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 02:58:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbhESBAB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 21:00:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbhESBAB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 21:00:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6F90C06175F
        for <linux-media@vger.kernel.org>; Tue, 18 May 2021 17:58:42 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5171145E;
        Wed, 19 May 2021 02:58:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621385920;
        bh=aXZu6ini9tyX0i9HZps2Rkab/b7j68aVQcSIO8NT4X4=;
        h=From:To:Cc:Subject:Date:From;
        b=HY5g74K3wLlo0GaY8Q5QPowKs8dobhf3eLBbGkLaMZi672Rk22FHvyPHcSHCmUjDX
         W3S33pJmnkmzLkmOeXqfLEyKv+Rz5hK1Vl1a+UtEFvgpNLrqkrG/Ew9nZxgJjqVLDT
         pyrC143x4I/pcdPa/kKWmptSC9dQv5r5xpKr2A0E=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Marek Vasut <marek.vasut@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH] media: imx: imx7-media-csi: Fix buffer return upon stream start failure
Date:   Wed, 19 May 2021 03:58:34 +0300
Message-Id: <20210519005834.8690-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the stream fails to start, the first two buffers in the queue have
been moved to the active_vb2_buf array and are returned to vb2 by
imx7_csi_dma_unsetup_vb2_buf(). The function is called with the buffer
state set to VB2_BUF_STATE_ERROR unconditionally, which is correct when
stopping the stream, but not when the start operation fails. In that
case, the state should be set to VB2_BUF_STATE_QUEUED. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index f644a640a831..da768ea21d03 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -361,6 +361,7 @@ static void imx7_csi_dma_unsetup_vb2_buf(struct imx7_csi *csi,
 
 			vb->timestamp = ktime_get_ns();
 			vb2_buffer_done(vb, return_status);
+			csi->active_vb2_buf[i] = NULL;
 		}
 	}
 }
@@ -386,9 +387,10 @@ static int imx7_csi_dma_setup(struct imx7_csi *csi)
 	return 0;
 }
 
-static void imx7_csi_dma_cleanup(struct imx7_csi *csi)
+static void imx7_csi_dma_cleanup(struct imx7_csi *csi,
+				 enum vb2_buffer_state return_status)
 {
-	imx7_csi_dma_unsetup_vb2_buf(csi, VB2_BUF_STATE_ERROR);
+	imx7_csi_dma_unsetup_vb2_buf(csi, return_status);
 	imx_media_free_dma_buf(csi->dev, &csi->underrun_buf);
 }
 
@@ -526,9 +528,10 @@ static int imx7_csi_init(struct imx7_csi *csi)
 	return 0;
 }
 
-static void imx7_csi_deinit(struct imx7_csi *csi)
+static void imx7_csi_deinit(struct imx7_csi *csi,
+			    enum vb2_buffer_state return_status)
 {
-	imx7_csi_dma_cleanup(csi);
+	imx7_csi_dma_cleanup(csi, return_status);
 	imx7_csi_init_default(csi);
 	imx7_csi_dmareq_rff_disable(csi);
 	clk_disable_unprepare(csi->mclk);
@@ -691,7 +694,7 @@ static int imx7_csi_s_stream(struct v4l2_subdev *sd, int enable)
 
 		ret = v4l2_subdev_call(csi->src_sd, video, s_stream, 1);
 		if (ret < 0) {
-			imx7_csi_deinit(csi);
+			imx7_csi_deinit(csi, VB2_BUF_STATE_QUEUED);
 			goto out_unlock;
 		}
 
@@ -701,7 +704,7 @@ static int imx7_csi_s_stream(struct v4l2_subdev *sd, int enable)
 
 		v4l2_subdev_call(csi->src_sd, video, s_stream, 0);
 
-		imx7_csi_deinit(csi);
+		imx7_csi_deinit(csi, VB2_BUF_STATE_ERROR);
 	}
 
 	csi->is_streaming = !!enable;
-- 
Regards,

Laurent Pinchart

