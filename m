Return-Path: <linux-media+bounces-17632-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F3796C94C
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 23:11:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E363C28B7FC
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 21:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 978CC1917E0;
	Wed,  4 Sep 2024 21:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQ94xGpr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303BE18D626;
	Wed,  4 Sep 2024 21:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725484081; cv=none; b=iB2Z7CZUnYWTDm+zf/YBi/rgf9EfWDCzbU/xb1rjCSCDlgsikkCA0sYIVjZKDpMlG/5ZrXo5xB96HFllzfKjjR/zgiwBLazqUU85ev0gPUfA8Af17F7lDENJDL45K/1ueGhGz5cFFhw8Gck6YeuqwLa6TlFjtC5VL1UKQI+ccgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725484081; c=relaxed/simple;
	bh=I1oNs25s/CngsnNqJwET5V0cEjBj+iPLAzdWDG9ZV40=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KHec8vjxu/KdOaSi7e2CqgN7B936zyXncEydi/J6OajMEzD8p8xlmeku+aO2kRzghMSgH+AGTaKHJK7LRetJwCuwdgwqW29LDkiS2f2cv9FZD+Y8JGbgQnPLkQosDBQ67WDIoEFEFUyWkt4JzrNaVx+ND6hAv99b5vBDOanfgA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQ94xGpr; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-374b25263a3so6930f8f.0;
        Wed, 04 Sep 2024 14:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725484077; x=1726088877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J426v0t4e1crMfA9lHahgdUfXyTzbtJSjN0almmRPYQ=;
        b=jQ94xGprnb/4py5/WOqGSlV8MQkF0y9s0n5HtrpdGZk73TqR3O1VqzXPPoOUVR1xQB
         gq2O6iKVd8AL5yRa5sCcoAHhNL+xZyHF+stR3IRoy903aO9zQC+IkJnXd0rhpfAUf2v4
         oty2e8y0jCQQx9SIH2PeFL5GFMEn3QEbYmeclJ7EbyCo6E+P+ZJhmxez4OAw3z/FeKih
         cZ7pkbQom4I5asGwfhe3ILvbKX4rwW+/loITgkG4EwhpbZm8i5liXt7PvEs46+rNuHsO
         ab+hxIqnpFVY1Qvt6k71suirBckRVjcKwtYj5a1GA1t3x10T6qXQlseub8pNHzIy+RDH
         dlsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725484077; x=1726088877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J426v0t4e1crMfA9lHahgdUfXyTzbtJSjN0almmRPYQ=;
        b=SVPqu2KzmAjVBPxzt5Y4jHpLBw6BHdd4omc0pd93zoPEVV6D9LeP84iJ14SdLu0+3X
         pgo95ZgsZmI3H8dZpis3wtnMF88uudZG6lpU7pGDA/pR92bMxX0mAMdXuPyfDC6sTIIy
         cHNRaKdbK0HkKn65li8EWXJ6kQt/UbLlqTGYR0iWgCBJ6Hafrp3d68eCcSwiAxSqaoNX
         NT1fb/QTGRYModhBneaspodPMKCf0JzJJzXYNw74fpWmQMbv9IH4ajTvrwH4fxff8csb
         ZcZYekxElufZUG0zU7XXTbLDrRRgxHEu/pd8+n4zp2pEwkHJCDQM1mqXdGMSKRrXkvFm
         wTbA==
X-Forwarded-Encrypted: i=1; AJvYcCWypNMsgHxBZqD6Imi6hfhm1XMrXHBMxOsljpe4L104RxVfcsU2n2DADH2MhLXN9Y08/jzdSDL9Wjkc1AtOra6Kir4=@vger.kernel.org, AJvYcCXDIYZ4bLGPuFXTtbxsWu/vubn0R6e3a2d+Vx+PjdbJwbwFPz70oVTAmrNHT5JXBnRVD6fQX2A4AV8n1Y8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3tCIMPCuwsVhQvdD78cW8b0qmusuLzLoi7BUbB9/djFsjCLZp
	YsLFKde515OqYajNiPq00tK97QJwxOoYDrIoc6aoBsIdq3/Tvw1T
X-Google-Smtp-Source: AGHT+IE1GiKVJANdTHXMQYX5WVnza6IY/8YZs4CwJfcbTEBsVHiBMrT8Bto4Xkk/dF2CvYe3e2Pzog==
X-Received: by 2002:a05:6000:137a:b0:374:c1f5:affe with SMTP id ffacd0b85a97d-374c1f5b5ebmr9419683f8f.40.1725484077459;
        Wed, 04 Sep 2024 14:07:57 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:c57c:1e61:792:2ab1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42c7a41bdc8sm158821485e9.3.2024.09.04.14.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 14:07:56 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 12/12] media: i2c: ov5645: Add virtual channel support
Date: Wed,  4 Sep 2024 22:07:19 +0100
Message-Id: <20240904210719.52466-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904210719.52466-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240904210719.52466-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add routes to configure the virtual channels.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/i2c/ov5645.c | 153 ++++++++++++++++++++++++++++---------
 1 file changed, 116 insertions(+), 37 deletions(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 45762783a19f..cf4a6d8e83e0 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -54,6 +54,7 @@
 #define OV5645_TIMING_TC_REG21		0x3821
 #define		OV5645_SENSOR_MIRROR		BIT(1)
 #define OV5645_MIPI_CTRL00		0x4800
+#define OV5645_REG_DEBUG_MODE		0x4814
 #define OV5645_PRE_ISP_TEST_SETTING_1	0x503d
 #define		OV5645_TEST_PATTERN_MASK	0x3
 #define		OV5645_SET_TEST_PATTERN(x)	((x) & OV5645_TEST_PATTERN_MASK)
@@ -65,6 +66,8 @@
 #define OV5645_NATIVE_WIDTH	2592
 #define OV5645_NATIVE_HEIGHT	1944
 
+#define OV5645_ROUTES_MAX	4
+
 /* regulator supplies */
 static const char * const ov5645_supply_name[] = {
 	"vdddo", /* Digital I/O (1.8V) supply */
@@ -833,25 +836,36 @@ static const struct v4l2_ctrl_ops ov5645_ctrl_ops = {
 static int ov5645_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 				 struct v4l2_mbus_frame_desc *fd)
 {
-	const struct v4l2_mbus_framefmt *fmt;
 	struct v4l2_subdev_state *state;
+	struct v4l2_subdev_route *route;
+	unsigned int num_routes = 0;
 
 	if (pad != OV5645_PAD_SOURCE)
 		return -EINVAL;
 
 	state = v4l2_subdev_lock_and_get_active_state(sd);
-	fmt = v4l2_subdev_state_get_format(state, OV5645_PAD_SOURCE, 0);
-	v4l2_subdev_unlock_state(state);
 
-	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
-	fd->num_entries = 1;
+	for_each_active_route(&state->routing, route) {
+		struct v4l2_mbus_frame_desc_entry *entry;
+		const struct v4l2_mbus_framefmt *fmt;
+
+		fmt = v4l2_subdev_state_get_format(state, route->source_pad,
+						   route->source_stream);
+
+		entry = &fd->entry[num_routes];
+		entry->stream = num_routes;
+		entry->pixelcode = fmt->code;
 
-	memset(fd->entry, 0, sizeof(fd->entry));
+		entry->bus.csi2.vc = route->source_stream;
+		entry->bus.csi2.dt = MIPI_CSI2_DT_YUV422_8B;
 
-	fd->entry[0].pixelcode = fmt->code;
-	fd->entry[0].stream = 0;
-	fd->entry[0].bus.csi2.vc = 0;
-	fd->entry[0].bus.csi2.dt = MIPI_CSI2_DT_YUV422_8B;
+		num_routes++;
+	}
+
+	fd->num_entries = num_routes;
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+
+	v4l2_subdev_unlock_state(state);
 
 	return 0;
 }
@@ -923,13 +937,13 @@ static int ov5645_set_format(struct v4l2_subdev *sd,
 	format->format.quantization = V4L2_QUANTIZATION_DEFAULT;
 	format->format.xfer_func = V4L2_XFER_FUNC_DEFAULT;
 
-	__format = v4l2_subdev_state_get_format(sd_state, OV5645_PAD_IMAGE);
+	__format = v4l2_subdev_state_get_format(sd_state, OV5645_PAD_IMAGE, 0);
 	*__format = format->format;
 	__format->code = OV5645_NATIVE_FORMAT;
 	__format->width = OV5645_NATIVE_WIDTH;
 	__format->height = OV5645_NATIVE_HEIGHT;
 
-	__crop = v4l2_subdev_state_get_crop(sd_state, OV5645_PAD_IMAGE);
+	__crop = v4l2_subdev_state_get_crop(sd_state, OV5645_PAD_IMAGE, 0);
 	__crop->width = format->format.width;
 	__crop->height = format->format.height;
 
@@ -937,19 +951,19 @@ static int ov5645_set_format(struct v4l2_subdev *sd,
 	 * The compose rectangle models binning, its size is the sensor output
 	 * size.
 	 */
-	compose = v4l2_subdev_state_get_compose(sd_state, OV5645_PAD_IMAGE);
+	compose = v4l2_subdev_state_get_compose(sd_state, OV5645_PAD_IMAGE, 0);
 	compose->left = 0;
 	compose->top = 0;
 	compose->width = format->format.width;
 	compose->height = format->format.height;
 
-	__crop = v4l2_subdev_state_get_crop(sd_state, OV5645_PAD_SOURCE);
+	__crop = v4l2_subdev_state_get_crop(sd_state, OV5645_PAD_SOURCE, format->stream);
 	__crop->left = 0;
 	__crop->top = 0;
 	__crop->width = format->format.width;
 	__crop->height = format->format.height;
 
-	__format = v4l2_subdev_state_get_format(sd_state, OV5645_PAD_SOURCE);
+	__format = v4l2_subdev_state_get_format(sd_state, OV5645_PAD_SOURCE, format->stream);
 	*__format = format->format;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
@@ -970,43 +984,80 @@ static int ov5645_set_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int ov5645_init_state(struct v4l2_subdev *subdev,
-			     struct v4l2_subdev_state *sd_state)
+static int ov5645_apply_routing(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_krouting *routing)
 {
-	struct v4l2_subdev_route routes[1] = {
-		{
-			.sink_pad = OV5645_PAD_IMAGE,
-			.sink_stream = 0,
-			.source_pad = OV5645_PAD_SOURCE,
-			.source_stream = 0,
-			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
-				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
-		},
-	};
-	struct v4l2_subdev_krouting routing = {
-		.len_routes = ARRAY_SIZE(routes),
-		.num_routes = ARRAY_SIZE(routes),
-		.routes = routes,
-	};
 	struct v4l2_subdev_format fmt = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 		.pad = OV5645_PAD_SOURCE,
-		.stream = 0,
 		.format = {
 			.code = OV5645_NATIVE_FORMAT,
 			.width = ov5645_mode_info_data[1].width,
 			.height = ov5645_mode_info_data[1].height,
 		},
 	};
+	struct v4l2_subdev_route *route;
 	int ret;
 
-	ret = v4l2_subdev_set_routing(subdev, sd_state, &routing);
+	if (routing->num_routes > 1)
+		routing->num_routes = 1;
+
+	route = &routing->routes[0];
+
+	if (route->sink_stream > 0 || route->source_stream > 3)
+		return -EINVAL;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
 	if (ret)
 		return ret;
 
-	ov5645_set_format(subdev, sd_state, &fmt);
+	ret = v4l2_subdev_set_routing(sd, state, routing);
+	if (ret)
+		return ret;
 
-	return 0;
+	fmt.stream = route->source_stream;
+	return ov5645_set_format(sd, state, &fmt);
+}
+
+static int ov5645_init_state(struct v4l2_subdev *subdev,
+			     struct v4l2_subdev_state *sd_state)
+{
+	struct v4l2_subdev_route routes[OV5645_ROUTES_MAX] = {
+		{
+			.sink_pad = OV5645_PAD_IMAGE,
+			.sink_stream = 0,
+			.source_pad = OV5645_PAD_SOURCE,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+		{
+			.sink_pad = OV5645_PAD_IMAGE,
+			.sink_stream = 0,
+			.source_pad = OV5645_PAD_SOURCE,
+			.source_stream = 1,
+		},
+		{
+			.sink_pad = OV5645_PAD_IMAGE,
+			.sink_stream = 0,
+			.source_pad = OV5645_PAD_SOURCE,
+			.source_stream = 2,
+		},
+		{
+			.sink_pad = OV5645_PAD_IMAGE,
+			.sink_stream = 0,
+			.source_pad = OV5645_PAD_SOURCE,
+			.source_stream = 3,
+		},
+	};
+	struct v4l2_subdev_krouting routing = {
+		.len_routes = ARRAY_SIZE(routes),
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+
+	return ov5645_apply_routing(subdev, sd_state, &routing);
 }
 
 static int ov5645_get_selection(struct v4l2_subdev *sd,
@@ -1016,14 +1067,29 @@ static int ov5645_get_selection(struct v4l2_subdev *sd,
 	if (sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
 
-	sel->r = *v4l2_subdev_state_get_crop(sd_state, sel->pad);
+	sel->r = *v4l2_subdev_state_get_crop(sd_state, sel->pad, sel->stream);
 	return 0;
 }
 
+static int ov5645_set_virtual_channel(struct ov5645 *ov5645, u8 channel)
+{
+	int ret;
+	u8 val;
+
+	ret = ov5645_read_reg(ov5645, OV5645_REG_DEBUG_MODE, &val);
+	if (ret)
+		return ret;
+	val &= ~(3 << 6);
+	val |= (channel << 6);
+
+	return ov5645_write_reg(ov5645, OV5645_REG_DEBUG_MODE, val);
+}
+
 static int ov5645_enable_streams(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *state, u32 pad,
 				 u64 streams_mask)
 {
+	struct v4l2_subdev_route *route = &state->routing.routes[0];
 	struct ov5645 *ov5645 = to_ov5645(sd);
 	int ret;
 
@@ -1031,6 +1097,10 @@ static int ov5645_enable_streams(struct v4l2_subdev *sd,
 	if (ret < 0)
 		return ret;
 
+	ret = ov5645_set_virtual_channel(ov5645, route->source_stream);
+	if (ret)
+		goto err_rpm_put;
+
 	ret = ov5645_set_register_array(ov5645,
 					ov5645->current_mode->data,
 					ov5645->current_mode->data_size);
@@ -1083,6 +1153,14 @@ static int ov5645_disable_streams(struct v4l2_subdev *sd,
 	return ret;
 }
 
+static int ov5645_set_routing(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state,
+			      enum v4l2_subdev_format_whence which,
+			      struct v4l2_subdev_krouting *routing)
+{
+	return ov5645_apply_routing(sd, state, routing);
+}
+
 static const struct v4l2_subdev_video_ops ov5645_video_ops = {
 	.s_stream = v4l2_subdev_s_stream_helper,
 };
@@ -1096,6 +1174,7 @@ static const struct v4l2_subdev_pad_ops ov5645_subdev_pad_ops = {
 	.get_selection = ov5645_get_selection,
 	.enable_streams = ov5645_enable_streams,
 	.disable_streams = ov5645_disable_streams,
+	.set_routing = ov5645_set_routing,
 };
 
 static const struct v4l2_subdev_core_ops ov5645_core_ops = {
-- 
2.34.1


