Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61BEE31B4AA
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:35:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbhBOEfB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:35:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229977AbhBOEe7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:34:59 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A87C3C061574
        for <linux-media@vger.kernel.org>; Sun, 14 Feb 2021 20:34:19 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 72486196A;
        Mon, 15 Feb 2021 05:28:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363314;
        bh=Z0ay0L+tbPq6mcnIXoEF16B1fYh+ozMj+/Cg+0lpgmA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VLUbS10OBegGTFdafWw42POBuaA5sfpCbWw2CL9+4VQ02oLgTx1sWxh1kjj9ORl7l
         d6hhF/rA5Fia+MOo1EFfQpC7JSFO28RGzT3cemNJb9XYors5yUzH5p/r4Hcj8wlNHr
         3NGoL9LprYXh/674EY4TFm6r30JjMyoTYgk5v7WY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 32/77] media: imx: imx7-media-csi: Move (de)init from link setup to .s_stream()
Date:   Mon, 15 Feb 2021 06:26:56 +0200
Message-Id: <20210215042741.28850-33-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There's no need to initialize the CSI every time a link is enabled (and
de-initialize it when a link is disabled). Move initialization to
.s_stream() instead.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 30 ++++++++--------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index c64c5196939b..bc3324a30824 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -184,7 +184,6 @@ struct imx7_csi {
 	u32 frame_sequence;
 
 	bool last_eof;
-	bool is_init;
 	bool is_streaming;
 	bool is_csi2;
 
@@ -402,9 +401,6 @@ static int imx7_csi_init(struct imx7_csi *csi)
 {
 	int ret;
 
-	if (csi->is_init)
-		return 0;
-
 	ret = clk_prepare_enable(csi->mclk);
 	if (ret < 0)
 		return ret;
@@ -412,22 +408,15 @@ static int imx7_csi_init(struct imx7_csi *csi)
 	imx7_csi_init_interface(csi);
 	imx7_csi_dmareq_rff_enable(csi);
 
-	csi->is_init = true;
-
 	return 0;
 }
 
 static void imx7_csi_deinit(struct imx7_csi *csi)
 {
-	if (!csi->is_init)
-		return;
-
 	imx7_csi_hw_reset(csi);
 	imx7_csi_init_interface(csi);
 	imx7_csi_dmareq_rff_disable(csi);
 	clk_disable_unprepare(csi->mclk);
-
-	csi->is_init = false;
 }
 
 static int imx7_csi_link_setup(struct media_entity *entity,
@@ -462,7 +451,7 @@ static int imx7_csi_link_setup(struct media_entity *entity,
 			csi->src_sd = NULL;
 		}
 
-		goto init;
+		goto unlock;
 	}
 
 	/* source pad */
@@ -476,12 +465,6 @@ static int imx7_csi_link_setup(struct media_entity *entity,
 		csi->sink = NULL;
 	}
 
-init:
-	if (csi->sink || csi->src_sd)
-		ret = imx7_csi_init(csi);
-	else
-		imx7_csi_deinit(csi);
-
 unlock:
 	mutex_unlock(&csi->lock);
 
@@ -868,19 +851,28 @@ static int imx7_csi_s_stream(struct v4l2_subdev *sd, int enable)
 		goto out_unlock;
 
 	if (enable) {
+		ret = imx7_csi_init(csi);
+		if (ret < 0)
+			goto out_unlock;
+
 		ret = v4l2_subdev_call(csi->src_sd, video, s_stream, 1);
-		if (ret < 0)
+		if (ret < 0) {
+			imx7_csi_deinit(csi);
 			goto out_unlock;
+		}
 
 		ret = imx7_csi_streaming_start(csi);
 		if (ret < 0) {
 			v4l2_subdev_call(csi->src_sd, video, s_stream, 0);
+			imx7_csi_deinit(csi);
 			goto out_unlock;
 		}
 	} else {
 		imx7_csi_streaming_stop(csi);
 
 		v4l2_subdev_call(csi->src_sd, video, s_stream, 0);
+
+		imx7_csi_deinit(csi);
 	}
 
 	csi->is_streaming = !!enable;
-- 
Regards,

Laurent Pinchart

