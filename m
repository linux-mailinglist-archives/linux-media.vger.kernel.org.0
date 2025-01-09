Return-Path: <linux-media+bounces-24496-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEEFA0729B
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 11:16:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F25F71889F39
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 10:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA3C215F64;
	Thu,  9 Jan 2025 10:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WlGQ14gg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FC2215F71;
	Thu,  9 Jan 2025 10:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736417783; cv=none; b=P42f/e5SQZLDjvpd9pDlWXrgtCSi2afjEhmdmDEIuh4gdXEApmN08gEpbCRSzOntoLnoBY9L5xvf6sewZv1vC0WVyfpVE5HApjJ6yya28oAZ27hb6FB05BIisMwNKbOxlpYt2YdZt24JRut28E6dQ0CNuCWAlnEJC/dZuyV+hEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736417783; c=relaxed/simple;
	bh=b7icjnS/OXH/kTW9LIb89AVtbQwDk4A2eNvOvEHP6Vo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FE7s3195SKM8vRx7f8r97JCZjyf2FwofrOKGWJx/89Tw80gcFN2HLHHYLXHbvTrUKUirGz7MTk41TCqMk/2XkEpZqvrQv8lZ7SIzNZGBEkAglzpthlNlw2l/+j2gLxE2Np7lodHqv2Vl2KplWvGRhr8NlMeB9sGBCr9F2EEgrcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WlGQ14gg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D44FFD01;
	Thu,  9 Jan 2025 11:15:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736417723;
	bh=b7icjnS/OXH/kTW9LIb89AVtbQwDk4A2eNvOvEHP6Vo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WlGQ14gg0jPrO8Ws/PLIFqYehhOmySwiJXIGqyfqgc9unCt17cIJ3PSFWjySCJv96
	 hm0VGl/XtBVST3pxfHoU9ZUI3C0ONpzqyuwbPylwI97EBD0o5WLsbmid0Lxc2lBfR0
	 QPDRsmIA3T1u6alzy2omHfS5e4fhaWU4mMywU+Ks=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 09 Jan 2025 12:15:43 +0200
Subject: [PATCH RFC 2/2] media: i2c: ds90ub953: Add TPG support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-ub953-tpg-v1-2-d7392375c243@ideasonboard.com>
References: <20250109-ub953-tpg-v1-0-d7392375c243@ideasonboard.com>
In-Reply-To: <20250109-ub953-tpg-v1-0-d7392375c243@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=21212;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=b7icjnS/OXH/kTW9LIb89AVtbQwDk4A2eNvOvEHP6Vo=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnf6Hupk4DrLhZ1sbEUkInEd9BFRribjKaNNNFh
 kzquBJ45ziJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ3+h7gAKCRD6PaqMvJYe
 9dh8D/440yG35tImoY5lGJHTYnGqdR9JvOX49OCSNOtK2Y1Ie0FecnKcFKf+sRsmKGVbc39cebi
 2uYSBaLVSxZc95rcotW1to6tirlvBmj37VvXVJy+D2Uu5U+riexOhnhhZD8wsoAxEte4rQvTGsX
 Y6XOwcd9dXiktT9CI134lxsqHN9dQGr1HNavp5GywasVAxqU0rUv3m32WtClLa58ZRCYumzFWdy
 xzqrPPBbYHZGak3ThprsSIj0QJjnqVA6neIu8Kp7ZEhOSVttl0KYe841NU6pipo2vtRn4HDXRMv
 TQ42UghwxT1FENrUiJEhza3WFRFOFlkz+gMXqcgAFeks4AYYCWvA/zgoaFtG2TerTKF6BjUgPDV
 gY+ucPemrt28x1WAFPUYtL6DMgTAAPRIkHW2s9u9qPw7rnLe07FHExM//+7sSkZHqBlbQmBuMCT
 bnJe5ZSHsYAO1SfVH6umlzUeO0VvsMdszWJM42SzXaH3v+hqvIr3BxY4XdRnZGOke0NfLZ0ckcx
 17VQXIW/u6Q7eg1WJmfwDgoQBxlKeWWuNMmyuJ6Nw+dGECriat2iDwjobqreirCcWpQkBedkzTV
 a3HHRLePqQo2r3hS381yCEeHY5j+HPf0+xbAg5FTiPM6JHee/JHik8HcpiJeul/qqWX4MKpBq9l
 4PSrmS4ZUC8jl6w==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add TPG support using an internal pad.

The TPG can be enabled, when streaming is off, by setting a routing
containing a single stream from the internal TPG pad to the source pad.

The frame size, format (only RGB888 for now) and frame interval can be
configured for the stream in the internal pad. The TPG pattern can be
changed via v4l2 control even when the streaming is enabled.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub953.c | 498 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 449 insertions(+), 49 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 028892cfa361..adaa8bd92920 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -21,8 +21,10 @@
 #include <linux/property.h>
 #include <linux/rational.h>
 #include <linux/regmap.h>
+#include <linux/units.h>
 
 #include <media/i2c/ds90ub9xx.h>
+#include <media/mipi-csi2.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-mediabus.h>
@@ -30,6 +32,8 @@
 
 #define UB953_PAD_SINK			0
 #define UB953_PAD_SOURCE		1
+#define UB953_PAD_TPG			2
+#define UB953_NUM_PADS			3
 
 #define UB953_NUM_GPIOS			4
 
@@ -102,7 +106,12 @@
 
 #define UB953_IND_PGEN_CTL			0x01
 #define UB953_IND_PGEN_CTL_PGEN_ENABLE		BIT(0)
+
 #define UB953_IND_PGEN_CFG			0x02
+#define UB953_IND_PGEN_CFG_FIXED_COLOR_MODE	BIT(7)
+#define UB953_IND_PGEN_CFG_NUM_CBARS_MASK	GENMASK(5, 4)
+#define UB953_IND_PGEN_CFG_BLOCK_SIZE_MASK	GENMASK(3, 0)
+
 #define UB953_IND_PGEN_CSI_DI			0x03
 #define UB953_IND_PGEN_LINE_SIZE1		0x04
 #define UB953_IND_PGEN_LINE_SIZE0		0x05
@@ -130,6 +139,12 @@ enum ub953_mode {
 	UB953_MODE_DVP,
 };
 
+enum ub953_tpg_pattern {
+	UB953_TPG_RED,
+	UB953_TPG_GREEN,
+	UB953_TPG_BLUE,
+};
+
 struct ub953_hw_data {
 	const char *model;
 	bool is_ub971;
@@ -155,7 +170,7 @@ struct ub953_data {
 	struct gpio_chip	gpio_chip;
 
 	struct v4l2_subdev	sd;
-	struct media_pad	pads[2];
+	struct media_pad	pads[UB953_NUM_PADS];
 
 	struct v4l2_async_notifier	notifier;
 
@@ -174,8 +189,38 @@ struct ub953_data {
 	enum ub953_mode		mode;
 
 	const struct ds90ub9xx_platform_data	*plat_data;
+
+	struct v4l2_ctrl_handler	hdl;
+	struct v4l2_ctrl	*tpg_ctrl;
+};
+
+struct ub953_format_info {
+	u32 code;
+	u8 dt;
+	u8 bitspp;
+	u8 block_size;
 };
 
+static const struct ub953_format_info ub953_tpg_formats[] = {
+	/* Only RGB888 supported for now */
+	{
+		.code = MEDIA_BUS_FMT_RGB888_1X24,
+		.dt = MIPI_CSI2_DT_RGB888,
+		.bitspp = 24,
+		.block_size = 3,
+	},
+};
+
+static const struct ub953_format_info *ub953_find_format(u32 code)
+{
+	for (unsigned int i = 0; i < ARRAY_SIZE(ub953_tpg_formats); i++) {
+		if (ub953_tpg_formats[i].code == code)
+			return &ub953_tpg_formats[i];
+	}
+
+	return NULL;
+}
+
 static inline struct ub953_data *sd_to_ub953(struct v4l2_subdev *sd)
 {
 	return container_of(sd, struct ub953_data, sd);
@@ -311,6 +356,38 @@ static int ub953_write_ind(struct ub953_data *priv, u8 block, u8 reg, u8 val)
 	return ret;
 }
 
+static int ub953_write_ind16(struct ub953_data *priv, u8 block, u8 reg, u16 val)
+{
+	int ret;
+
+	mutex_lock(&priv->reg_lock);
+
+	ret = ub953_select_ind_reg_block(priv, block);
+	if (ret)
+		goto out;
+
+	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg);
+	if (ret)
+		goto out;
+
+	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_DATA, val >> 8);
+	if (ret)
+		goto out;
+
+	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg + 1);
+	if (ret)
+		goto out;
+
+	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_DATA, val & 0xff);
+	if (ret)
+		goto out;
+
+out:
+	mutex_unlock(&priv->reg_lock);
+
+	return ret;
+}
+
 /*
  * GPIO chip
  */
@@ -440,67 +517,151 @@ static void ub953_gpiochip_remove(struct ub953_data *priv)
  * V4L2
  */
 
-static int _ub953_set_routing(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_state *state,
-			      struct v4l2_subdev_krouting *routing)
+static bool ub953_is_tpg_selected(struct v4l2_subdev_state *state)
+{
+	return state->routing.num_routes == 1 &&
+	       state->routing.routes[0].sink_pad == UB953_PAD_TPG;
+}
+
+static int ub953_set_routing_tpg(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 const struct v4l2_subdev_krouting *routing)
 {
 	static const struct v4l2_mbus_framefmt format = {
 		.width = 640,
 		.height = 480,
-		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.code = MEDIA_BUS_FMT_RGB888_1X24,
 		.field = V4L2_FIELD_NONE,
 		.colorspace = V4L2_COLORSPACE_SRGB,
-		.ycbcr_enc = V4L2_YCBCR_ENC_601,
-		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+		.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT,
+		.quantization = V4L2_QUANTIZATION_FULL_RANGE,
 		.xfer_func = V4L2_XFER_FUNC_SRGB,
 	};
+
+	const struct v4l2_subdev_route *route;
+	struct v4l2_fract *ival;
 	int ret;
 
-	/*
-	 * Note: we can only support up to V4L2_FRAME_DESC_ENTRY_MAX, until
-	 * frame desc is made dynamically allocated.
-	 */
+	/* Only a single stream allowed for TPG */
+	if (routing->num_routes != 1)
+		return -EINVAL;
 
-	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
+	route = &routing->routes[0];
+
+	/* The route must be active */
+	if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
 		return -EINVAL;
 
-	ret = v4l2_subdev_routing_validate(sd, routing,
-					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
-	if (ret)
-		return ret;
+	/* Stream ID must be 0 */
+	if (route->sink_stream != 0)
+		return -EINVAL;
 
 	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
 	if (ret)
 		return ret;
 
+	ival = v4l2_subdev_state_get_interval(state, UB953_PAD_TPG, 0);
+	if (!ival)
+		return -EINVAL;
+
+	ival->numerator = 1;
+	ival->denominator = 30;
+
 	return 0;
 }
 
+static int ub953_set_routing_normal(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state,
+				    const struct v4l2_subdev_krouting *routing)
+{
+	static const struct v4l2_mbus_framefmt format = {
+		.width = 640,
+		.height = 480,
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.field = V4L2_FIELD_NONE,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.ycbcr_enc = V4L2_YCBCR_ENC_601,
+		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+		.xfer_func = V4L2_XFER_FUNC_SRGB,
+	};
+
+	return v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
+}
+
 static int ub953_set_routing(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *state,
 			     enum v4l2_subdev_format_whence which,
 			     struct v4l2_subdev_krouting *routing)
 {
 	struct ub953_data *priv = sd_to_ub953(sd);
+	int ret;
 
 	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && priv->enabled_source_streams)
 		return -EBUSY;
 
-	return _ub953_set_routing(sd, state, routing);
+	/*
+	 * Note: we can only support up to V4L2_FRAME_DESC_ENTRY_MAX, until
+	 * frame desc is made dynamically allocated.
+	 */
+
+	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
+		return -EINVAL;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
+					   V4L2_SUBDEV_ROUTING_NO_STREAM_MIX);
+	if (ret)
+		return ret;
+
+	if (routing->num_routes > 0 &&
+	    routing->routes[0].sink_pad == UB953_PAD_TPG)
+		return ub953_set_routing_tpg(sd, state, routing);
+	else
+		return ub953_set_routing_normal(sd, state, routing);
 }
 
-static int ub953_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
-				struct v4l2_mbus_frame_desc *fd)
+static int ub953_get_frame_desc_tpg(struct v4l2_subdev *sd, unsigned int pad,
+				    struct v4l2_mbus_frame_desc *fd,
+				    struct v4l2_subdev_state *state)
+{
+	const struct ub953_format_info *fmt_info;
+	struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_subdev_route *route;
+
+	fmt = v4l2_subdev_state_get_format(state, UB953_PAD_TPG, 0);
+	if (!fmt)
+		return -EINVAL;
+
+	fmt_info = ub953_find_format(fmt->code);
+	if (!fmt_info)
+		return -EINVAL;
+
+	/* There is exactly one route for TPG */
+	route = &state->routing.routes[0];
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	fd->entry[fd->num_entries].stream = route->source_stream;
+	fd->entry[fd->num_entries].flags = V4L2_MBUS_FRAME_DESC_FL_LEN_MAX;
+	fd->entry[fd->num_entries].length =
+		fmt->width * fmt->height * fmt_info->bitspp / 8;
+	fd->entry[fd->num_entries].pixelcode = fmt->code;
+	fd->entry[fd->num_entries].bus.csi2.vc = 0;
+	fd->entry[fd->num_entries].bus.csi2.dt = fmt_info->dt;
+
+	fd->num_entries++;
+
+	return 0;
+}
+
+static int ub953_get_frame_desc_normal(struct v4l2_subdev *sd, unsigned int pad,
+				       struct v4l2_mbus_frame_desc *fd,
+				       struct v4l2_subdev_state *state)
 {
 	struct ub953_data *priv = sd_to_ub953(sd);
 	struct v4l2_mbus_frame_desc source_fd;
 	struct v4l2_subdev_route *route;
-	struct v4l2_subdev_state *state;
 	int ret;
 
-	if (pad != UB953_PAD_SOURCE)
-		return -EINVAL;
-
 	ret = v4l2_subdev_call(priv->source_sd, pad, get_frame_desc,
 			       priv->source_sd_pad, &source_fd);
 	if (ret)
@@ -508,8 +669,6 @@ static int ub953_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 
 	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
 
-	state = v4l2_subdev_lock_and_get_active_state(sd);
-
 	for_each_active_route(&state->routing, route) {
 		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
 		unsigned int i;
@@ -527,8 +686,7 @@ static int ub953_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 		if (!source_entry) {
 			dev_err(&priv->client->dev,
 				"Failed to find stream from source frame desc\n");
-			ret = -EPIPE;
-			goto out_unlock;
+			return -EPIPE;
 		}
 
 		fd->entry[fd->num_entries].stream = route->source_stream;
@@ -543,7 +701,27 @@ static int ub953_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 		fd->num_entries++;
 	}
 
-out_unlock:
+	return 0;
+}
+
+static int ub953_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				struct v4l2_mbus_frame_desc *fd)
+{
+	struct v4l2_subdev_state *state;
+	int ret;
+
+	if (pad != UB953_PAD_SOURCE)
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	if (!state)
+		return -EINVAL;
+
+	if (ub953_is_tpg_selected(state))
+		ret = ub953_get_frame_desc_tpg(sd, pad, fd, state);
+	else
+		ret = ub953_get_frame_desc_normal(sd, pad, fd, state);
+
 	v4l2_subdev_unlock_state(state);
 
 	return ret;
@@ -564,6 +742,11 @@ static int ub953_set_fmt(struct v4l2_subdev *sd,
 	if (format->pad == UB953_PAD_SOURCE)
 		return v4l2_subdev_get_fmt(sd, state, format);
 
+	if (ub953_is_tpg_selected(state)) {
+		if (!ub953_find_format(format->format.code))
+			format->format.code = ub953_tpg_formats[0].code;
+	}
+
 	/* Set sink format */
 	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
 	if (!fmt)
@@ -582,6 +765,42 @@ static int ub953_set_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int ub953_get_frame_interval(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state,
+				    struct v4l2_subdev_frame_interval *fi)
+{
+	struct v4l2_fract *ival;
+
+	if (fi->pad != UB953_PAD_TPG)
+		return -ENOTTY;
+
+	ival = v4l2_subdev_state_get_interval(state, fi->pad, fi->stream);
+	if (!ival)
+		return -EINVAL;
+
+	fi->interval = *ival;
+
+	return 0;
+}
+
+static int ub953_set_frame_interval(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state,
+				    struct v4l2_subdev_frame_interval *fi)
+{
+	struct v4l2_fract *ival;
+
+	if (fi->pad != UB953_PAD_TPG)
+		return -ENOTTY;
+
+	ival = v4l2_subdev_state_get_interval(state, fi->pad, fi->stream);
+	if (!ival)
+		return -EINVAL;
+
+	*ival = fi->interval;
+
+	return 0;
+}
+
 static int ub953_init_state(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_state *state)
 {
@@ -595,12 +814,12 @@ static int ub953_init_state(struct v4l2_subdev *sd,
 		},
 	};
 
-	struct v4l2_subdev_krouting routing = {
+	const struct v4l2_subdev_krouting routing = {
 		.num_routes = ARRAY_SIZE(routes),
 		.routes = routes,
 	};
 
-	return _ub953_set_routing(sd, state, &routing);
+	return ub953_set_routing_normal(sd, state, &routing);
 }
 
 static int ub953_log_status(struct v4l2_subdev *sd)
@@ -675,6 +894,120 @@ static int ub953_log_status(struct v4l2_subdev *sd)
 	return 0;
 }
 
+static int ub953_enable_tpg(struct ub953_data *priv,
+			    enum ub953_tpg_pattern pattern)
+{
+	const struct ub953_format_info *fmt_info;
+	struct device *dev = &priv->client->dev;
+	struct v4l2_subdev *sd = &priv->sd;
+	struct v4l2_subdev_state *state;
+	struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_fract *ival;
+	const u8 num_cbars = 8;
+	const u8 vc = 0; /* Always VC 0 for now */
+	const u8 vbp = 33;
+	const u8 vfp = 10;
+	const u16 tot_blanking = vbp + vfp + 2;
+	u16 line_size; /* in bytes */
+	u16 bar_size; /* in bytes */
+	u16 act_lpf; /* active lines/frame */
+	u16 tot_lpf; /* tot lines/frame */
+	u64 line_pd; /* Line period in 10-ns units */
+
+	state = v4l2_subdev_get_locked_active_state(sd);
+
+	fmt = v4l2_subdev_state_get_format(state, UB953_PAD_TPG, 0);
+	if (!fmt)
+		return -EINVAL;
+
+	ival = v4l2_subdev_state_get_interval(state, UB953_PAD_TPG, 0);
+	if (!ival)
+		return -EINVAL;
+
+	fmt_info = ub953_find_format(fmt->code);
+	if (!fmt_info) {
+		dev_err(dev, "unsupported TPG format %#x\n", fmt->code);
+		return -EINVAL;
+	}
+
+	line_size = fmt->width * fmt_info->bitspp / 8;
+	bar_size = rounddown(line_size / num_cbars, fmt_info->block_size);
+	act_lpf = fmt->height;
+	tot_lpf = act_lpf + tot_blanking;
+	line_pd = div_u64((u64)NANO / 10 * ival->numerator,
+			  ival->denominator * tot_lpf);
+
+	if (line_pd > 0xffff) {
+		dev_err(dev, "Line period over the limit: %llu\n", line_pd);
+		return -EINVAL;
+	}
+
+	if (fmt->width * fmt_info->bitspp % 8 != 0) {
+		dev_err(dev, "Invalid TPG width\n");
+		return -EINVAL;
+	}
+
+	if (line_size % fmt_info->block_size != 0) {
+		dev_err(dev, "Invalid TPG line size\n");
+		return -EINVAL;
+	}
+
+	ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN, UB953_IND_PGEN_CSI_DI,
+			(vc << 6) | (fmt_info->dt << 0));
+	ub953_write_ind16(priv, UB953_IND_TARGET_PAT_GEN,
+			  UB953_IND_PGEN_LINE_SIZE1, line_size);
+	ub953_write_ind16(priv, UB953_IND_TARGET_PAT_GEN,
+			  UB953_IND_PGEN_BAR_SIZE1, bar_size);
+	ub953_write_ind16(priv, UB953_IND_TARGET_PAT_GEN,
+			  UB953_IND_PGEN_ACT_LPF1, act_lpf);
+	ub953_write_ind16(priv, UB953_IND_TARGET_PAT_GEN,
+			  UB953_IND_PGEN_TOT_LPF1, tot_lpf);
+	ub953_write_ind16(priv, UB953_IND_TARGET_PAT_GEN,
+			  UB953_IND_PGEN_LINE_PD1, line_pd);
+	ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN, UB953_IND_PGEN_VBP,
+			vbp);
+	ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN, UB953_IND_PGEN_VFP,
+			vfp);
+
+	for (unsigned int i = 0; i < 3; ++i)
+		ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN,
+				UB953_IND_PGEN_COLOR(i), 0x0);
+
+	ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN, UB953_IND_PGEN_CFG,
+			UB953_IND_PGEN_CFG_FIXED_COLOR_MODE |
+			FIELD_PREP(UB953_IND_PGEN_CFG_NUM_CBARS_MASK, 0) |
+			FIELD_PREP(UB953_IND_PGEN_CFG_BLOCK_SIZE_MASK,
+				   fmt_info->block_size));
+
+	switch (pattern) {
+	case UB953_TPG_RED:
+		ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN,
+				UB953_IND_PGEN_COLOR(2), 0xff);
+		break;
+	case UB953_TPG_GREEN:
+		ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN,
+				UB953_IND_PGEN_COLOR(1), 0xff);
+		break;
+	case UB953_TPG_BLUE:
+		ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN,
+				UB953_IND_PGEN_COLOR(0), 0xff);
+		break;
+	default:
+		break;
+	}
+
+	ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN, UB953_IND_PGEN_CTL,
+			UB953_IND_PGEN_CTL_PGEN_ENABLE);
+
+	return 0;
+}
+
+static void ub953_disable_tpg(struct ub953_data *priv)
+{
+	ub953_write_ind(priv, UB953_IND_TARGET_PAT_GEN, UB953_IND_PGEN_CTL,
+			0x0);
+}
+
 static int ub953_enable_streams(struct v4l2_subdev *sd,
 				struct v4l2_subdev_state *state, u32 pad,
 				u64 streams_mask)
@@ -683,14 +1016,24 @@ static int ub953_enable_streams(struct v4l2_subdev *sd,
 	u64 sink_streams;
 	int ret;
 
-	sink_streams = v4l2_subdev_state_xlate_streams(state, UB953_PAD_SOURCE,
-						       UB953_PAD_SINK,
-						       &streams_mask);
+	if (ub953_is_tpg_selected(state)) {
+		ret = ub953_enable_tpg(priv, priv->tpg_ctrl->val);
+		if (ret)
+			return ret;
 
-	ret = v4l2_subdev_enable_streams(priv->source_sd, priv->source_sd_pad,
-					 sink_streams);
-	if (ret)
-		return ret;
+		sink_streams = BIT_ULL(0);
+	} else {
+		sink_streams = v4l2_subdev_state_xlate_streams(state,
+							       UB953_PAD_SOURCE,
+							       UB953_PAD_SINK,
+							       &streams_mask);
+
+		ret = v4l2_subdev_enable_streams(priv->source_sd,
+						 priv->source_sd_pad,
+						 sink_streams);
+		if (ret)
+			return ret;
+	}
 
 	priv->enabled_source_streams |= streams_mask;
 
@@ -705,14 +1048,22 @@ static int ub953_disable_streams(struct v4l2_subdev *sd,
 	u64 sink_streams;
 	int ret;
 
-	sink_streams = v4l2_subdev_state_xlate_streams(state, UB953_PAD_SOURCE,
-						       UB953_PAD_SINK,
-						       &streams_mask);
+	if (ub953_is_tpg_selected(state)) {
+		ub953_disable_tpg(priv);
 
-	ret = v4l2_subdev_disable_streams(priv->source_sd, priv->source_sd_pad,
-					  sink_streams);
-	if (ret)
-		return ret;
+		sink_streams = BIT_ULL(0);
+	} else {
+		sink_streams = v4l2_subdev_state_xlate_streams(state,
+							       UB953_PAD_SOURCE,
+							       UB953_PAD_SINK,
+							       &streams_mask);
+
+		ret = v4l2_subdev_disable_streams(priv->source_sd,
+						  priv->source_sd_pad,
+						  sink_streams);
+		if (ret)
+			return ret;
+	}
 
 	priv->enabled_source_streams &= ~streams_mask;
 
@@ -726,6 +1077,8 @@ static const struct v4l2_subdev_pad_ops ub953_pad_ops = {
 	.get_frame_desc = ub953_get_frame_desc,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = ub953_set_fmt,
+	.get_frame_interval = ub953_get_frame_interval,
+	.set_frame_interval = ub953_set_frame_interval,
 };
 
 static const struct v4l2_subdev_core_ops ub953_subdev_core_ops = {
@@ -1261,6 +1614,29 @@ static int ub953_hw_init(struct ub953_data *priv)
 	return 0;
 }
 
+static const char * const ub953_test_pattern_menu[] = {
+	[UB953_TPG_RED] = "Red",
+	[UB953_TPG_GREEN] = "Green",
+	[UB953_TPG_BLUE] = "Blue",
+};
+
+static int ub953_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct ub953_data *priv = container_of(ctrl->handler,
+					struct ub953_data, hdl);
+
+	switch (ctrl->id) {
+	case V4L2_CID_TEST_PATTERN:
+		return ub953_enable_tpg(priv, ctrl->val);
+	}
+
+	return -EINVAL;
+}
+
+static const struct v4l2_ctrl_ops ub953_ctrl_ops = {
+	.s_ctrl = ub953_s_ctrl,
+};
+
 static int ub953_subdev_init(struct ub953_data *priv)
 {
 	struct device *dev = &priv->client->dev;
@@ -1269,17 +1645,38 @@ static int ub953_subdev_init(struct ub953_data *priv)
 	v4l2_i2c_subdev_init(&priv->sd, priv->client, &ub953_subdev_ops);
 	priv->sd.internal_ops = &ub953_internal_ops;
 
+	v4l2_ctrl_handler_init(&priv->hdl, 1);
+	v4l2_ctrl_new_std_menu_items(&priv->hdl, &ub953_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(ub953_test_pattern_menu) - 1,
+				     0, 0, ub953_test_pattern_menu);
+
+	if (priv->hdl.error) {
+		ret = priv->hdl.error;
+		dev_err_probe(dev, ret, "Failed to init controls\n");
+		goto err_ctrl_handler_free;
+	}
+
+	priv->sd.ctrl_handler = &priv->hdl;
+	priv->tpg_ctrl = v4l2_ctrl_find(&priv->hdl, V4L2_CID_TEST_PATTERN);
+
 	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
 			  V4L2_SUBDEV_FL_STREAMS;
 	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
 	priv->sd.entity.ops = &ub953_entity_ops;
 
-	priv->pads[0].flags = MEDIA_PAD_FL_SINK;
-	priv->pads[1].flags = MEDIA_PAD_FL_SOURCE;
+	priv->pads[UB953_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+	priv->pads[UB953_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+	priv->pads[UB953_PAD_TPG].flags = MEDIA_PAD_FL_INTERNAL |
+					  MEDIA_PAD_FL_SINK;
 
-	ret = media_entity_pads_init(&priv->sd.entity, 2, priv->pads);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to init pads\n");
+	ret = media_entity_pads_init(&priv->sd.entity, UB953_NUM_PADS, priv->pads);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to init pads\n");
+		goto err_ctrl_handler_free;
+	}
+
+	priv->sd.state_lock = priv->sd.ctrl_handler->lock;
 
 	ret = v4l2_subdev_init_finalize(&priv->sd);
 	if (ret)
@@ -1306,12 +1703,15 @@ static int ub953_subdev_init(struct ub953_data *priv)
 	v4l2_subdev_cleanup(&priv->sd);
 err_entity_cleanup:
 	media_entity_cleanup(&priv->sd.entity);
+err_ctrl_handler_free:
+	v4l2_ctrl_handler_free(&priv->hdl);
 
 	return ret;
 }
 
 static void ub953_subdev_uninit(struct ub953_data *priv)
 {
+	v4l2_ctrl_handler_free(&priv->hdl);
 	v4l2_async_unregister_subdev(&priv->sd);
 	ub953_v4l2_notifier_unregister(priv);
 	v4l2_subdev_cleanup(&priv->sd);

-- 
2.43.0


