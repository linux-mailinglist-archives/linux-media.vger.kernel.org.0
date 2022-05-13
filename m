Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E38B052639D
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 16:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350764AbiEMOQj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 10:16:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346193AbiEMOQO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 10:16:14 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FE12118006
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 07:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652451370; x=1683987370;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tTeUZP9kOQuNzZgt+uy7MojjF9QMxM2i9tYrHJc4fgc=;
  b=G2+hgTVZO5kSmXd2wxS9+oCnE92jdN2thoMhTSADQgwD8MsPWFBqLE5U
   gMi192etE6Y1nP0meamlMcRKh7+iUnBmH1kEluXb9wW08Bbip6fDjfeKT
   NTsRWvWWJ6p60N08KGodzdpwJs7RoDreBNvRBNvUZzJJjLnsyKwWVptN2
   Negj8HzMjWZPjGQtxKG3LWC2T7CZTjhgRXiAktjEcVZuqBN/Avw43Je4x
   G+nKg9qAsqnW9XkR08ryUTUnK0HzLiCBf2C4poev18oUYa2cYuSOoM7j9
   1jE9/rBWptopmtn5KW2Un/SxspNmyn6mdnez1KUwFN9uaH2wAp/gAppDR
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="252360907"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="252360907"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:16:08 -0700
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="554232214"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:16:04 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 56F7321AB6;
        Fri, 13 May 2022 17:15:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1npW58-0001gl-JH; Fri, 13 May 2022 17:15:50 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
        mirela.rabulea@nxp.com, xavier.roumegue@oss.nxp.com,
        tomi.valkeinen@ideasonboard.com, hugues.fruchet@st.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com, aford173@gmail.com,
        festevam@gmail.com, Eugen.Hristev@microchip.com,
        jbrunet@baylibre.com, paul.elder@ideasonboard.com,
        eddy.khan@vergesense.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v7 20/28] media: ov5640: Implement init_cfg
Date:   Fri, 13 May 2022 17:15:40 +0300
Message-Id: <20220513141548.6344-21-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220513141548.6344-1-sakari.ailus@linux.intel.com>
References: <20220513141548.6344-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jacopo Mondi <jacopo@jmondi.org>

Implement the init_cfg pad operation to initialize the subdev state
format to the default one.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Acked-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
Tested-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov5640.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index e565f3534c33d..1981436f40177 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -411,6 +411,18 @@ static u32 ov5640_code_to_bpp(u32 code)
  * over i2c.
  */
 /* YUV422 UYVY VGA@30fps */
+
+static const struct v4l2_mbus_framefmt ov5640_default_fmt = {
+	.code = MEDIA_BUS_FMT_UYVY8_2X8,
+	.width = 640,
+	.height = 480,
+	.colorspace = V4L2_COLORSPACE_SRGB,
+	.ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(V4L2_COLORSPACE_SRGB),
+	.quantization = V4L2_QUANTIZATION_FULL_RANGE,
+	.xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(V4L2_COLORSPACE_SRGB),
+	.field = V4L2_FIELD_NONE,
+};
+
 static const struct reg_value ov5640_init_setting[] = {
 	{0x3103, 0x11, 0, 0}, {0x3008, 0x82, 0, 5}, {0x3008, 0x42, 0, 0},
 	{0x3103, 0x03, 0, 0}, {0x3630, 0x36, 0, 0},
@@ -3548,6 +3560,17 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
+static int ov5640_init_cfg(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *state)
+{
+	struct v4l2_mbus_framefmt *fmt =
+				v4l2_subdev_get_try_format(sd, state, 0);
+
+	*fmt = ov5640_default_fmt;
+
+	return 0;
+}
+
 static const struct v4l2_subdev_core_ops ov5640_core_ops = {
 	.s_power = ov5640_s_power,
 	.log_status = v4l2_ctrl_subdev_log_status,
@@ -3562,6 +3585,7 @@ static const struct v4l2_subdev_video_ops ov5640_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops ov5640_pad_ops = {
+	.init_cfg = ov5640_init_cfg,
 	.enum_mbus_code = ov5640_enum_mbus_code,
 	.get_fmt = ov5640_get_fmt,
 	.set_fmt = ov5640_set_fmt,
@@ -3620,7 +3644,6 @@ static int ov5640_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct fwnode_handle *endpoint;
 	struct ov5640_dev *sensor;
-	struct v4l2_mbus_framefmt *fmt;
 	u32 rotation;
 	int ret;
 
@@ -3634,15 +3657,7 @@ static int ov5640_probe(struct i2c_client *client)
 	 * default init sequence initialize sensor to
 	 * YUV422 UYVY VGA@30fps
 	 */
-	fmt = &sensor->fmt;
-	fmt->code = MEDIA_BUS_FMT_UYVY8_2X8;
-	fmt->colorspace = V4L2_COLORSPACE_SRGB;
-	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
-	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
-	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
-	fmt->width = 640;
-	fmt->height = 480;
-	fmt->field = V4L2_FIELD_NONE;
+	sensor->fmt = ov5640_default_fmt;
 	sensor->frame_interval.numerator = 1;
 	sensor->frame_interval.denominator = ov5640_framerates[OV5640_30_FPS];
 	sensor->current_fr = OV5640_30_FPS;
-- 
2.30.2

