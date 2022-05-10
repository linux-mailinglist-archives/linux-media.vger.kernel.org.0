Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 494BE5214B3
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241380AbiEJMDW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241345AbiEJMDU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:03:20 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB2045131E
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 04:59:23 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 168671224;
        Tue, 10 May 2022 13:59:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183957;
        bh=zvOjg0QeN6mSFOMqPebQPsFhlL+PiY+QVPoTBCUk1fI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UZpwdNyZ/D2GKnblimwNxTxfm9T+LpHMl3slgc+qEtEzYNwtra1psKAX/dYrfFr5+
         dtVRak5ZrZPtWDfhlsd3kOXmWAoBMkRWVnUlJreC9vT3YhLr+9uIO3A+U9kGpTBzNw
         padJ+UQJqJIhy6pMF1Q55U3eM/CM9OV6voHCwNF0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        kernel@pengutronix.de
Subject: [PATCH 09/50] staging: media: imx: imx7-media-csi: Move format init to probe time
Date:   Tue, 10 May 2022 14:58:18 +0300
Message-Id: <20220510115859.19777-10-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
References: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There's no need to wait until the subdev is registered to initialize the
active pad formats. Do so at probe time.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 55 ++++++++++------------
 1 file changed, 24 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index cd063c4f3f40..d85b5ab204df 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -763,26 +763,6 @@ static int imx7_csi_s_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
-static int imx7_csi_init_cfg(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_state *sd_state)
-{
-	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
-	struct v4l2_mbus_framefmt *mf;
-	int ret;
-	int i;
-
-	for (i = 0; i < IMX7_CSI_PADS_NUM; i++) {
-		mf = v4l2_subdev_get_try_format(sd, sd_state, i);
-
-		ret = imx_media_init_mbus_fmt(mf, 800, 600, 0, V4L2_FIELD_NONE,
-					      &csi->cc[i]);
-		if (ret < 0)
-			return ret;
-	}
-
-	return 0;
-}
-
 static struct v4l2_mbus_framefmt *
 imx7_csi_get_format(struct imx7_csi *csi,
 		    struct v4l2_subdev_state *sd_state,
@@ -795,6 +775,28 @@ imx7_csi_get_format(struct imx7_csi *csi,
 	return &csi->format_mbus[pad];
 }
 
+static int imx7_csi_init_cfg(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *sd_state)
+{
+	const enum v4l2_subdev_format_whence which =
+		sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
+	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
+	int ret;
+	int i;
+
+	for (i = 0; i < IMX7_CSI_PADS_NUM; i++) {
+		struct v4l2_mbus_framefmt *mf =
+			imx7_csi_get_format(csi, sd_state, i, which);
+
+		ret = imx_media_init_mbus_fmt(mf, 800, 600, 0, V4L2_FIELD_NONE,
+					      &csi->cc[i]);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int imx7_csi_enum_mbus_code(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_mbus_code_enum *code)
@@ -1046,16 +1048,6 @@ static int imx7_csi_registered(struct v4l2_subdev *sd)
 {
 	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
 	int ret;
-	int i;
-
-	for (i = 0; i < IMX7_CSI_PADS_NUM; i++) {
-		/* set a default mbus format  */
-		ret = imx_media_init_mbus_fmt(&csi->format_mbus[i],
-					      800, 600, 0, V4L2_FIELD_NONE,
-					      &csi->cc[i]);
-		if (ret < 0)
-			return ret;
-	}
 
 	csi->vdev = imx_media_capture_device_init(csi->sd.dev, &csi->sd,
 						  IMX7_CSI_PAD_SRC, false);
@@ -1291,7 +1283,8 @@ static int imx7_csi_probe(struct platform_device *pdev)
 	if (ret)
 		goto destroy_mutex;
 
-	ret = v4l2_device_register_subdev(&csi->imxmd->v4l2_dev, &csi->sd);
+	/* Set the default mbus formats. */
+	ret = imx7_csi_init_cfg(&csi->sd, NULL);
 	if (ret)
 		goto media_cleanup;
 
-- 
Regards,

Laurent Pinchart

