Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9017A69814D
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 17:50:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbjBOQul (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 11:50:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbjBOQui (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 11:50:38 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC1F03B667
        for <linux-media@vger.kernel.org>; Wed, 15 Feb 2023 08:50:31 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F96546D;
        Wed, 15 Feb 2023 17:50:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676479827;
        bh=lZg01Qh3W+mbyvXdJNpwH0VPwwLitrWVNa6nLATFNxs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=e8+CBxpAXUMbLForY2AjiKbOKiuXOHmL0/ejXg3HS6vNEd0/9mjKJWrSTXgN7t2e0
         lYCDsxvT3X/oRORJoM2oYUacQZft/b2mdL9otW72ACJMt5CSB2e19MPweeGEiYoIEz
         ezihTP8dEJt40CmQMPSxxnwEz4RPMU+zodimdVbM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Prabhakar Lad <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Michael Krufky <mkrufky@linuxtv.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        kernel@pengutronix.de, linux-imx@nxp.com
Subject: [PATCH 3/3] media: USe designated initializers for all subdev pad ops
Date:   Wed, 15 Feb 2023 18:50:21 +0200
Message-Id: <20230215165021.6628-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215165021.6628-1-laurent.pinchart@ideasonboard.com>
References: <20230215165021.6628-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Structures passed to subdev pad operations are all zero-initialized when
declaring variables. In most cases, this is done with designated
initializers to initialize some of the fields to specific values, but in
a minority of cases the structures are zero-initialized by assigning
them to '{ 0 }' or '{ }'.

Improve coding style consistency by using designated initializers where
possible, always initializing the 'which' field.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/pci/cobalt/cobalt-v4l2.c                  | 5 +++--
 drivers/media/platform/microchip/microchip-isc-base.c   | 5 +++--
 drivers/media/platform/renesas/vsp1/vsp1_drm.c          | 5 +++--
 drivers/staging/media/deprecated/atmel/atmel-isc-base.c | 5 +++--
 4 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/media/pci/cobalt/cobalt-v4l2.c b/drivers/media/pci/cobalt/cobalt-v4l2.c
index 284c0909a282..4bfbcca14f60 100644
--- a/drivers/media/pci/cobalt/cobalt-v4l2.c
+++ b/drivers/media/pci/cobalt/cobalt-v4l2.c
@@ -910,7 +910,9 @@ static int cobalt_s_fmt_vid_out(struct file *file, void *priv_fh,
 {
 	struct cobalt_stream *s = video_drvdata(file);
 	struct v4l2_pix_format *pix = &f->fmt.pix;
-	struct v4l2_subdev_format sd_fmt = { 0 };
+	struct v4l2_subdev_format sd_fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
 	u32 code;
 
 	if (cobalt_try_fmt_vid_out(file, priv_fh, f))
@@ -941,7 +943,6 @@ static int cobalt_s_fmt_vid_out(struct file *file, void *priv_fh,
 	s->xfer_func = pix->xfer_func;
 	s->ycbcr_enc = pix->ycbcr_enc;
 	s->quantization = pix->quantization;
-	sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	v4l2_fill_mbus_format(&sd_fmt.format, pix, code);
 	v4l2_subdev_call(s->sd, pad, set_fmt, NULL, &sd_fmt);
 	return 0;
diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index 71758ee8474b..4e657fad33d0 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -858,8 +858,10 @@ static int isc_try_configure_pipeline(struct isc_device *isc)
 static void isc_try_fse(struct isc_device *isc,
 			struct v4l2_subdev_state *sd_state)
 {
+	struct v4l2_subdev_frame_size_enum fse = {
+		.which = V4L2_SUBDEV_FORMAT_TRY,
+	};
 	int ret;
-	struct v4l2_subdev_frame_size_enum fse = {};
 
 	/*
 	 * If we do not know yet which format the subdev is using, we cannot
@@ -869,7 +871,6 @@ static void isc_try_fse(struct isc_device *isc,
 		return;
 
 	fse.code = isc->try_config.sd_format->mbus_code;
-	fse.which = V4L2_SUBDEV_FORMAT_TRY;
 
 	ret = v4l2_subdev_call(isc->current_subdev->sd, pad, enum_frame_size,
 			       sd_state, &fse);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
index 7fe375b6322c..24979d604baa 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
@@ -481,10 +481,11 @@ static int vsp1_du_pipeline_setup_output(struct vsp1_device *vsp1,
 					 struct vsp1_pipeline *pipe)
 {
 	struct vsp1_drm_pipeline *drm_pipe = to_vsp1_drm_pipeline(pipe);
-	struct v4l2_subdev_format format = { 0, };
+	struct v4l2_subdev_format format = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
 	int ret;
 
-	format.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	format.pad = RWPF_PAD_SINK;
 	format.format.width = drm_pipe->width;
 	format.format.height = drm_pipe->height;
diff --git a/drivers/staging/media/deprecated/atmel/atmel-isc-base.c b/drivers/staging/media/deprecated/atmel/atmel-isc-base.c
index 0d48ae1bd71a..61c5afa58142 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-isc-base.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-isc-base.c
@@ -824,8 +824,10 @@ static int isc_try_configure_pipeline(struct isc_device *isc)
 static void isc_try_fse(struct isc_device *isc,
 			struct v4l2_subdev_state *sd_state)
 {
+	struct v4l2_subdev_frame_size_enum fse = {
+		.which = V4L2_SUBDEV_FORMAT_TRY,
+	};
 	int ret;
-	struct v4l2_subdev_frame_size_enum fse = {};
 
 	/*
 	 * If we do not know yet which format the subdev is using, we cannot
@@ -835,7 +837,6 @@ static void isc_try_fse(struct isc_device *isc,
 		return;
 
 	fse.code = isc->try_config.sd_format->mbus_code;
-	fse.which = V4L2_SUBDEV_FORMAT_TRY;
 
 	ret = v4l2_subdev_call(isc->current_subdev->sd, pad, enum_frame_size,
 			       sd_state, &fse);
-- 
Regards,

Laurent Pinchart

