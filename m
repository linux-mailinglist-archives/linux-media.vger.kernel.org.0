Return-Path: <linux-media+bounces-66450-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /DKACiqKR2pYagAAu9opvQ
	(envelope-from <linux-media+bounces-66450-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 12:08:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 734FD700FF6
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 12:08:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=hhm4R0Wm;
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66450-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66450-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12B7A30FC27C
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 09:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88E0F3BD653;
	Fri,  3 Jul 2026 09:55:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A338B357CF3;
	Fri,  3 Jul 2026 09:55:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072530; cv=none; b=pimgBoKZXW+lto71Ph6ISloZ8Rd+v8jn6CesCYqlZpAtjs5K0Z03NIGqFcL+PVgpMGMEksObEr4A+Hs1P0GKJ9slwmVkfEU6GEYKOcad/Ys6H2xYEivgREh/jQfp3cYzw05Sfgg9TniRhsAfvqHslVh0GXsRz90+E5oMbsXpLKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072530; c=relaxed/simple;
	bh=tyfMKfHEB9x/awq7IoT+AWTgwg/IlKDjWVK+ctqdrf4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IIFk+bbZjLVuXRytbdoFFTUqxI/iXQ99Kx0Sy6p/LInTc0e4DhRSOy3ujzZJ2XjvhboxVmAkkr6M3fszIO5zRs2z0FjN9N8y6Y3KqCNxD7HtpIIXt86QZ6VdrM8MkKvd3cT+YQldYOPH6jRuLEzH4/Ba7p2og3dfwr4c7Pc5l2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hhm4R0Wm; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:8a87:d565:effa:ccf8:a720])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E9451121;
	Fri,  3 Jul 2026 11:54:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783072465;
	bh=tyfMKfHEB9x/awq7IoT+AWTgwg/IlKDjWVK+ctqdrf4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hhm4R0WmIJfpnqh/mVlYh9ccFlFYpGO1UAQoSoXiUzDQgcQqbpZxvwCx5HqRhydrv
	 Nt32ysEQH8PEa4PCe4zn0zXzcS9deugQ2hTzWlJNzvHUcMhhnvD9DjLKMYI0nk4vDH
	 CBNC+yIjhF4e1oRbkPq0qwqXKjTFtbu8RzZnmd7k=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 03 Jul 2026 15:24:12 +0530
Subject: [PATCH RFC 07/10] media: i2c: imx678: Add embedded data support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-imx678-meta-v1-7-7c4924a0df05@ideasonboard.com>
References: <20260703-imx678-meta-v1-0-7c4924a0df05@ideasonboard.com>
In-Reply-To: <20260703-imx678-meta-v1-0-7c4924a0df05@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Lachlan Michael <Lachlan.Michael@sony.com>, 
 Ryuichi Tadano <Ryuichi.Tadano@sony.com>, 
 Kengo Hayasaka <Kengo.Hayasaka@sony.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10658;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=tyfMKfHEB9x/awq7IoT+AWTgwg/IlKDjWVK+ctqdrf4=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqR4bQ47/o9B/cZ+wvdD2iyxqYpaT1QP7hoOAHs
 DXMmPn2tNmJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCakeG0AAKCRBD3pH5JJpx
 RTM0D/4w2PVma2VoFsy2QWfeduEcoOuqiwbAovF9KX7kW5qrDO6pk0U7jjMoHK0/lu+HnLnS79A
 nprshCthuQkO0fyXU3D46qGREBdaLMyDhH9v6vgWBZ7NmSAdNRmjUhZKTpRspkoVZMn3Tgy14d+
 rwpX05DIrL75vPkIjPKS6eOJGPKkTFvvmDdTlvrcoeLl5YlQFdeoXGOI2TzKaGHlBqpVKgdGX5p
 T36KWIlJ9JxA67urgaUYxcZo2R6MFYtCCr3M8HCMovJuHH56qBCFvLwIcqetJi9vY8h1Yx9GkeM
 ciIy5MrfXA2TBYKA8sUFeYfs65UjhFWEc1WFUa4QYZiUxi0kdiXxnwDCmYVcQFnRHKCZH5PPo6r
 DOjs2o5pRT9T9F+/phxd9uCVmpCT3X+Sn0Bu7ClDco7Ve0Rq2VxcqpIkUTIjzhaws/wG8bG39hv
 RPpVAz4QYNFx6hG/61FnjhCZTL710uAsEf4ussUwtWpAVFzIvATNT7u9L615f38j4nbKNSfUKL9
 W8s9DxjQc+XXK3ouZEwomABNvIESvWoPVWussPnUxxZBcfHIuOw23SPs8IaAQXOuBhEALXZwESH
 5jcIiwi4+897sI2UM/rBPxSb6geVj+JaoQPVBdTS3p03klbII2dcGamyg7rCe4vFuxdS8UFQ9ye
 isvdvNjsC1+hw2w==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66450-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:Lachlan.Michael@sony.com,m:Ryuichi.Tadano@sony.com,m:Kengo.Hayasaka@sony.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jai.luthra@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,ideasonboard.com:from_mime,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 734FD700FF6

IMX678 generates embedded data line unconditionally. Report it as an
additional stream, with a new internal embedded data pad.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx678.c | 152 +++++++++++++++++++++++++++++++++++----------
 1 file changed, 119 insertions(+), 33 deletions(-)

diff --git a/drivers/media/i2c/imx678.c b/drivers/media/i2c/imx678.c
index bbe6fff052b7..d72d1c80c68d 100644
--- a/drivers/media/i2c/imx678.c
+++ b/drivers/media/i2c/imx678.c
@@ -150,11 +150,13 @@
 enum imx678_pad_ids {
 	IMX678_SOURCE_PAD = 0,
 	IMX678_IMAGE_PAD,
+	IMX678_METADATA_PAD,
 	IMX678_NUM_PADS,
 };
 
 enum imx678_stream_ids {
 	IMX678_STREAM_IMAGE,
+	IMX678_STREAM_METADATA,
 };
 
 /* IMX678 native and active pixel array size. */
@@ -658,16 +660,18 @@ static const struct cci_reg_sequence common_regs[] = {
 	{ IMX678_REG_XXS_DRV, 0x00 },
 };
 
-static const u32 codes_generic[] = {
-	MEDIA_BUS_FMT_RAW_12,
+static const u32 codes_meta[] = {
+	MEDIA_BUS_FMT_META_12,
 };
 
 static const u32 codes_bayer[] = {
 	MEDIA_BUS_FMT_SRGGB12_1X12,
+	MEDIA_BUS_FMT_RAW_12,
 };
 
 static const u32 codes_monochrome[] = {
 	MEDIA_BUS_FMT_Y12_1X12,
+	MEDIA_BUS_FMT_RAW_12,
 };
 
 static const struct imx678_model_info imx678_aaqr_info = {
@@ -726,24 +730,41 @@ static inline struct imx678 *to_imx678(struct v4l2_subdev *_sd)
 	return container_of_const(_sd, struct imx678, sd);
 }
 
-static u32 imx678_default_mbus_code(struct imx678 *imx678, unsigned int pad)
+static u32 imx678_default_mbus_code(struct imx678 *imx678, unsigned int pad,
+				    unsigned int stream)
 {
-	if (pad == IMX678_IMAGE_PAD)
-		return codes_generic[0];
+	switch (pad) {
+	case IMX678_IMAGE_PAD:
+		return MEDIA_BUS_FMT_RAW_12;
 
-	return imx678->info->codes[0];
+	case IMX678_METADATA_PAD:
+		return MEDIA_BUS_FMT_META_8;
+
+	case IMX678_SOURCE_PAD:
+	default:
+		if (stream == IMX678_STREAM_METADATA)
+			return codes_meta[0];
+		else
+			return imx678->info->codes[0];
+	}
 }
 
 static bool imx678_mbus_code_supported(struct imx678 *imx678, unsigned int pad,
-				       u32 code)
+				       unsigned int stream, u32 code)
 {
-	for (unsigned int i = 0; i < ARRAY_SIZE(codes_generic); i++) {
-		if (codes_generic[i] == code)
-			return true;
-	}
-
 	if (pad == IMX678_IMAGE_PAD)
-		return false;
+		return (code == MEDIA_BUS_FMT_RAW_12);
+
+	if (pad == IMX678_METADATA_PAD)
+		return (code == MEDIA_BUS_FMT_META_8);
+
+	/* Source pad */
+	if (stream == IMX678_STREAM_METADATA) {
+		for (unsigned int i = 0; i < ARRAY_SIZE(codes_meta); i++) {
+			if (codes_meta[i] == code)
+				return true;
+		}
+	}
 
 	for (unsigned int i = 0; i < imx678->info->num_codes; i++) {
 		if (imx678->info->codes[i] == code)
@@ -754,12 +775,12 @@ static bool imx678_mbus_code_supported(struct imx678 *imx678, unsigned int pad,
 }
 
 static u32 imx678_get_format_code(struct imx678 *imx678, unsigned int pad,
-				  u32 code)
+				  unsigned int stream, u32 code)
 {
-	if (imx678_mbus_code_supported(imx678, pad, code))
+	if (imx678_mbus_code_supported(imx678, pad, stream, code))
 		return code;
 
-	return imx678_default_mbus_code(imx678, pad);
+	return imx678_default_mbus_code(imx678, pad, stream);
 }
 
 static int imx678_set_ctrl(struct v4l2_ctrl *ctrl)
@@ -859,14 +880,23 @@ static int imx678_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 		return -EINVAL;
 
 	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
-	fd->num_entries = 1;
+	fd->num_entries = 2;
 	fd->entry[0].stream = IMX678_STREAM_IMAGE;
 	fd->entry[0].bus.csi2.vc = 0;
 	fd->entry[0].bus.csi2.dt = MIPI_CSI2_DT_RAW12;
 
+	fd->entry[1].stream = IMX678_STREAM_METADATA;
+	fd->entry[1].bus.csi2.vc = 0;
+	fd->entry[1].bus.csi2.dt = MIPI_CSI2_DT_EMBEDDED_8B;
+
 	state = v4l2_subdev_lock_and_get_active_state(sd);
+
 	fmt = v4l2_subdev_state_get_format(state, pad, IMX678_STREAM_IMAGE);
 	fd->entry[0].pixelcode = fmt->code;
+
+	fmt = v4l2_subdev_state_get_format(state, pad, IMX678_STREAM_METADATA);
+	fd->entry[1].pixelcode = fmt->code;
+
 	v4l2_subdev_unlock_state(state);
 
 	return 0;
@@ -880,21 +910,28 @@ static int imx678_enum_mbus_code(struct v4l2_subdev *sd,
 
 	switch (code->pad) {
 	case IMX678_IMAGE_PAD:
-		if (code->index >= ARRAY_SIZE(codes_generic))
+	case IMX678_METADATA_PAD:
+		if (code->index > 0)
 			return -EINVAL;
 
-		code->code = codes_generic[code->index];
+		code->code = imx678_default_mbus_code(imx678, code->pad,
+						      code->stream);
 		break;
 	case IMX678_SOURCE_PAD:
-		unsigned int num_bayer = imx678->info->num_codes;
+		switch (code->stream) {
+		case IMX678_STREAM_IMAGE:
+			if (code->index >= imx678->info->num_codes)
+				return -EINVAL;
 
-		if (code->index >= num_bayer + ARRAY_SIZE(codes_generic))
-			return -EINVAL;
-
-		if (code->index < num_bayer)
 			code->code = imx678->info->codes[code->index];
-		else
-			code->code = codes_generic[code->index - num_bayer];
+			break;
+		case IMX678_STREAM_METADATA:
+			if (code->index >= ARRAY_SIZE(codes_meta))
+				return -EINVAL;
+
+			code->code = codes_meta[code->index];
+			break;
+		}
 		break;
 	default:
 		return -EINVAL;
@@ -908,11 +945,15 @@ static int imx678_enum_frame_size(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct imx678 *imx678 = to_imx678(sd);
+	const struct v4l2_rect *analogue_crop =
+			v4l2_subdev_state_get_crop(sd_state, IMX678_IMAGE_PAD,
+						   IMX678_STREAM_IMAGE);
 
 	if (fse->index)
 		return -EINVAL;
 
-	if (!imx678_mbus_code_supported(imx678, fse->pad, fse->code))
+	if (!imx678_mbus_code_supported(imx678, fse->pad, fse->stream,
+					fse->code))
 		return -EINVAL;
 
 	if (fse->pad == IMX678_IMAGE_PAD) {
@@ -920,10 +961,14 @@ static int imx678_enum_frame_size(struct v4l2_subdev *sd,
 		fse->max_width = fse->min_width;
 		fse->min_height = imx678_native_area.height;
 		fse->max_height = fse->min_height;
+	} else if (fse->pad == IMX678_METADATA_PAD ||
+		   (fse->pad == IMX678_SOURCE_PAD &&
+		    fse->stream == IMX678_STREAM_METADATA)) {
+		fse->min_width = analogue_crop->width;
+		fse->max_width = fse->min_width;
+		fse->min_height = 1;
+		fse->max_height = fse->min_height;
 	} else {
-		const struct v4l2_rect *analogue_crop =
-			v4l2_subdev_state_get_crop(sd_state, IMX678_IMAGE_PAD,
-						   IMX678_STREAM_IMAGE);
 		fse->min_width = analogue_crop->width;
 		fse->max_width = fse->min_width;
 		fse->min_height = analogue_crop->height;
@@ -950,7 +995,8 @@ static int imx678_set_pad_format(struct v4l2_subdev *sd,
 
 	format = v4l2_subdev_state_get_format(sd_state, fmt->pad, fmt->stream);
 	format->code = fmt->format.code =
-		imx678_get_format_code(imx678, fmt->pad, fmt->format.code);
+		imx678_get_format_code(imx678, fmt->pad, fmt->stream,
+				       fmt->format.code);
 
 	return 0;
 }
@@ -1026,6 +1072,15 @@ static int imx678_init_state(struct v4l2_subdev *sd,
 				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE |
 				 V4L2_SUBDEV_ROUTE_FL_STATIC,
 		},
+		{
+			.sink_pad = IMX678_METADATA_PAD,
+			.sink_stream = 0,
+			.source_pad = IMX678_SOURCE_PAD,
+			.source_stream = IMX678_STREAM_METADATA,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
+				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE |
+				 V4L2_SUBDEV_ROUTE_FL_STATIC,
+		},
 	};
 	struct v4l2_subdev_krouting routing = {
 		.len_routes = ARRAY_SIZE(routes),
@@ -1034,6 +1089,8 @@ static int imx678_init_state(struct v4l2_subdev *sd,
 	};
 	struct v4l2_mbus_framefmt *format, *source_format;
 	struct v4l2_rect *analogue_crop;
+	struct v4l2_mbus_framefmt *meta_format, *meta_source_format;
+
 	int ret;
 
 	ret = v4l2_subdev_set_routing(sd, state, &routing);
@@ -1046,7 +1103,8 @@ static int imx678_init_state(struct v4l2_subdev *sd,
 
 	format = v4l2_subdev_state_get_format(state, IMX678_IMAGE_PAD,
 					      IMX678_STREAM_IMAGE);
-	format->code = imx678_default_mbus_code(imx678, IMX678_IMAGE_PAD);
+	format->code = imx678_default_mbus_code(imx678, IMX678_IMAGE_PAD,
+						IMX678_STREAM_IMAGE);
 	format->width = imx678_native_area.width;
 	format->height = imx678_native_area.height;
 	format->field = V4L2_FIELD_NONE;
@@ -1059,10 +1117,26 @@ static int imx678_init_state(struct v4l2_subdev *sd,
 						     IMX678_STREAM_IMAGE);
 	*source_format = *format;
 	source_format->code = imx678_default_mbus_code(imx678,
-						       IMX678_SOURCE_PAD);
+						       IMX678_SOURCE_PAD,
+						       IMX678_STREAM_IMAGE);
 	source_format->width = analogue_crop->width;
 	source_format->height = analogue_crop->height;
 
+	meta_format = v4l2_subdev_state_get_format(state, IMX678_METADATA_PAD);
+	meta_format->code = imx678_default_mbus_code(imx678,
+						     IMX678_METADATA_PAD, 0);
+	meta_format->width = source_format->width;
+	meta_format->height = 1;
+	meta_format->field = V4L2_FIELD_NONE;
+
+	meta_source_format =
+		v4l2_subdev_state_get_format(state, IMX678_SOURCE_PAD,
+					     IMX678_STREAM_METADATA);
+	*meta_source_format = *meta_format;
+	meta_source_format->code =
+		imx678_default_mbus_code(imx678, IMX678_SOURCE_PAD,
+					 IMX678_STREAM_METADATA);
+
 	return 0;
 }
 
@@ -1113,6 +1187,9 @@ static int imx678_enable_streams(struct v4l2_subdev *sd,
 	const struct v4l2_rect *crop;
 	int ret;
 
+	if (!(mask & 1ULL))
+		return 0;
+
 	ret = pm_runtime_resume_and_get(&client->dev);
 	if (ret < 0)
 		return ret;
@@ -1160,6 +1237,9 @@ static int imx678_disable_streams(struct v4l2_subdev *sd,
 	struct imx678 *imx678 = to_imx678(sd);
 	int ret = 0;
 
+	if (!(mask & 1ULL))
+		return 0;
+
 	/* Master mode disable */
 	cci_write(imx678->cci, IMX678_REG_XMSTA, 0x01, &ret);
 	/* Standby */
@@ -1411,6 +1491,10 @@ static int imx678_init_controls(struct imx678 *imx678)
 	v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_CFA_PATTERN_FLIP, 0,
 			  V4L2_CFA_PATTERN_FLIP_BOTH, 0, 0);
 
+	v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_METADATA_LAYOUT,
+			  0, V4L2_METADATA_LAYOUT_IMX678,
+			  1, V4L2_METADATA_LAYOUT_IMX678);
+
 	v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx678_ctrl_ops, &props);
 
 	if (ctrl_hdlr->error) {
@@ -1546,6 +1630,8 @@ static int imx678_probe(struct i2c_client *client)
 
 	imx678->pads[IMX678_IMAGE_PAD].flags = MEDIA_PAD_FL_SINK |
 					       MEDIA_PAD_FL_INTERNAL;
+	imx678->pads[IMX678_METADATA_PAD].flags = MEDIA_PAD_FL_SINK |
+					       MEDIA_PAD_FL_INTERNAL;
 	imx678->pads[IMX678_SOURCE_PAD].flags = MEDIA_PAD_FL_SOURCE;
 
 	ret = media_entity_pads_init(&imx678->sd.entity,

-- 
2.54.0


