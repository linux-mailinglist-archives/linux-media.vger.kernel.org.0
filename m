Return-Path: <linux-media+bounces-2093-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD4A80CA67
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 14:00:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FF7E1F213CF
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 13:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944E03D3AD;
	Mon, 11 Dec 2023 13:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CWPrdnvc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EF11FF;
	Mon, 11 Dec 2023 05:00:22 -0800 (PST)
Received: from umang.jain (unknown [103.251.226.68])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C35841515;
	Mon, 11 Dec 2023 13:59:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702299577;
	bh=v4zXIcoXuUwhPMrAke1jILyP8oPZPN1RS9zYrSyz7ak=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CWPrdnvcj1ATNUi9LlVubPvyrBxQ8bFZ6UwWDhK7CA814WS+OQr4Il860MjthLyWG
	 XrspKJBRN3g9vhELPgtdhLth6LU+/t0hbxPKekj3g0OTJWM1RiIz26L4Bf5Uzox/CT
	 jbq53RkQxVZj6zt7S7z0FDFTdsF1nsa6ZQtkZt44=
From: Umang Jain <umang.jain@ideasonboard.com>
To: devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: "Paul J . Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 5/7] media: i2c: imx335: Implement get selection API
Date: Mon, 11 Dec 2023 18:29:47 +0530
Message-ID: <20231211125950.108092-6-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211125950.108092-1-umang.jain@ideasonboard.com>
References: <20231211125950.108092-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Support reporting of the Sensor Native and Active pixel array areas
through the Selection API.

The implementation reports a single target crop only for the mode that
is presently exposed by the driver.

Reviewed-by: Umang Jain <umang.jain@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/imx335.c | 45 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index b25216b3350e..a924b7222ca3 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -55,6 +55,14 @@
 #define IMX335_REG_MIN		0x00
 #define IMX335_REG_MAX		0xfffff
 
+/* IMX335 native and active pixel array size. */
+#define IMX335_NATIVE_WIDTH		2616U
+#define IMX335_NATIVE_HEIGHT		1964U
+#define IMX335_PIXEL_ARRAY_LEFT		12U
+#define IMX335_PIXEL_ARRAY_TOP		12U
+#define IMX335_PIXEL_ARRAY_WIDTH	2592U
+#define IMX335_PIXEL_ARRAY_HEIGHT	1944U
+
 /**
  * struct imx335_reg - imx335 sensor register
  * @address: Register address
@@ -645,6 +653,41 @@ static int imx335_init_pad_cfg(struct v4l2_subdev *sd,
 	return imx335_set_pad_format(sd, sd_state, &fmt);
 }
 
+/**
+ * imx335_get_selection() - Selection API
+ * @sd: pointer to imx335 V4L2 sub-device structure
+ * @sd_state: V4L2 sub-device configuration
+ * @sel: V4L2 selection info
+ *
+ * Return: 0 if successful, error code otherwise.
+ */
+static int imx335_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = IMX335_NATIVE_WIDTH;
+		sel->r.height = IMX335_NATIVE_HEIGHT;
+
+		return 0;
+
+	case V4L2_SEL_TGT_CROP:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.top = IMX335_PIXEL_ARRAY_TOP;
+		sel->r.left = IMX335_PIXEL_ARRAY_LEFT;
+		sel->r.width = IMX335_PIXEL_ARRAY_WIDTH;
+		sel->r.height = IMX335_PIXEL_ARRAY_HEIGHT;
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
 /**
  * imx335_start_streaming() - Start sensor stream
  * @imx335: pointer to imx335 device
@@ -862,6 +905,8 @@ static const struct v4l2_subdev_pad_ops imx335_pad_ops = {
 	.init_cfg = imx335_init_pad_cfg,
 	.enum_mbus_code = imx335_enum_mbus_code,
 	.enum_frame_size = imx335_enum_frame_size,
+	.get_selection = imx335_get_selection,
+	.set_selection = imx335_get_selection,
 	.get_fmt = imx335_get_pad_format,
 	.set_fmt = imx335_set_pad_format,
 };
-- 
2.41.0


