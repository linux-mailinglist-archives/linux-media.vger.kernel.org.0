Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A99C62EAEB5
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:36:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728321AbhAEPgW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:36:22 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38168 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728273AbhAEPgW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:36:22 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2B4261B1F;
        Tue,  5 Jan 2021 16:30:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860603;
        bh=ST/aRP5kYy5U59Jk32sb1+UtIDwCaQoIhHVntrvfDas=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Mhfzq2tVTPIlr2i7RHwzDC+mrab8j3UcaO0DG8ATI4RLEtsGB1Gq/5NyPUf9dwyOt
         zs5Ie1Zzu3wLNGM0Rs+/q+JZFiqp2pTUb2jJLFwG6/IBe3OEzp9VYmAvQiw0QJcYdj
         u+005papoVbFYfmZXu6Ol+zVRwtFIbpbepqoxqw8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 42/75] media: imx: imx7-media-csi: Merge streaming_start() with csi_enable()
Date:   Tue,  5 Jan 2021 17:28:19 +0200
Message-Id: <20210105152852.5733-43-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
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
---
 drivers/staging/media/imx/imx7-media-csi.c | 28 +++++++---------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 7ff100e895df..8680f5d9ff71 100644
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

