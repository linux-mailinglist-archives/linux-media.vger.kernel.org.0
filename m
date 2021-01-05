Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4503B2EAE9C
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:36:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728197AbhAEPfB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:35:01 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38064 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727514AbhAEPe4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:34:56 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67B911878;
        Tue,  5 Jan 2021 16:29:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860596;
        bh=VPPGRmcoHXolXt+v7I43YyrL0OKFyiraFxgQbtRl1bE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qVvjrqS9v3+q2drmSel2A+u7Nz3Ck0YsQxY68pNZU8m80NMY52v3uByazbL34dQLr
         wDJl3k6UmUVpZDg1PSUgckoZCks+Jzuhvim46DzoYmCimdnMBnqbcOAqqZMZjPrMdN
         L2C/bD78Dwc2INaM46VUjGtiFaxvSR7vihTDcwfM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 33/75] media: imx: imx7-media-csi: Move (de)init from link setup to .s_stream()
Date:   Tue,  5 Jan 2021 17:28:10 +0200
Message-Id: <20210105152852.5733-34-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There's no need to initialize the CSI every time a link is enabled (and
de-initialize it when a link is disabled). Move initialization to
.s_stream() instead.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 30 ++++++++--------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 69ff491671a3..60202f56343e 100644
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
 
@@ -857,19 +840,28 @@ static int imx7_csi_s_stream(struct v4l2_subdev *sd, int enable)
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

