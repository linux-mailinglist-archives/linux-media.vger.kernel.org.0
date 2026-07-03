Return-Path: <linux-media+bounces-66445-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nnk9OceHR2qzaAAAu9opvQ
	(envelope-from <linux-media+bounces-66445-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 11:58:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 530C5700E15
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 11:58:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=R6kc2Q1k;
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66445-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66445-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B57463049E2C
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 09:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9833B7757;
	Fri,  3 Jul 2026 09:55:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704913B42F8;
	Fri,  3 Jul 2026 09:54:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072498; cv=none; b=qZTRB2ZmPfIEN35SVZTBK/wVTM7RRQkUYJaCYOREcODwa6jU7L8cD7FS+MyR52zziHs75Og+KIr79LfErTNv7udk2AN+/X7LiDhXfXuUVNXpNqQdgg2g4eB78YUl88ddGgMVVFBXYwtfM+tPVSOXprkXkwteAlNZG1NemFz0vYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072498; c=relaxed/simple;
	bh=/Nna2ZT49Vy7uiPFvyk/O6ZF/6gszn9ZTd2TD+VMCvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DQxtFeSNE9m6S9ngPN1Xg3AhXTWYfJAaRbhxIbpftSRJzp/CRJ+pY5ZzA472qS6Qy8RcHkZIlHEYplnPmCOB1jFQpxYEhxof/P9uxCdDISNu+qnULzDBkUtJhoNV1U64q72qI9e+tGhC7tdey7Wp0BL+MvuSw7N3ilb+pMTAuOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=R6kc2Q1k; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:8a87:d565:effa:ccf8:a720])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7CCB1212;
	Fri,  3 Jul 2026 11:53:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783072438;
	bh=/Nna2ZT49Vy7uiPFvyk/O6ZF/6gszn9ZTd2TD+VMCvw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=R6kc2Q1kX1JIENbFVZCDOVQ3LiONAlDciMNp1+wwoI6wcS/tqmH+ytIBoHo3mXmwx
	 jNhWrXvF1LicxBloka+rUHtVo80YRTKYnT0PTSLUhgjDzdRrdpE9H8Y3vSj8RgU/+d
	 UUG9rff1pbVxIz9PZenfml8RsO8sGL4lioifkz60=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 03 Jul 2026 15:24:07 +0530
Subject: [PATCH RFC 02/10] media: i2c: imx678: Add internal image pad and
 streams
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-imx678-meta-v1-2-7c4924a0df05@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7519;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=/Nna2ZT49Vy7uiPFvyk/O6ZF/6gszn9ZTd2TD+VMCvw=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqR4bLLh9aO5e29yBi9pboRBVHBKHG7/XpQ1Kv7
 5szXjrZonmJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCakeGywAKCRBD3pH5JJpx
 RfNlD/oDIvv/BXnvgVzhW0m16pmvkhp9ZqvK9THrEy45gbQwYosh2h67ccmFBq9lvlSfV/8nzxC
 Fku0e/fEOqZzFIQ2RA9VLxfUYCYdngispY1TbrJQxn7gnwLX0l52RrSHb0/wHRN0fDa/VfU2Zs2
 sGuFsHDTtU97eagInXsSdM9J4EJJqQrzu80ZW+c/AdNJDUMx5SVCaIhZhkCFe1ffv1EQn6tMJ7H
 stqSRqaZRC8Lg9bpaqjCoMltyJHIAV8g2MgaaqXrw2awe32A+dUmPf3+PX99Ohc/IvHTOQd/s+m
 UItnZFZBLezk8rfNEVHFkolzSl1uuOLFKqmCxnC0UN6i0RjVe6Q9z9SwVSM7Dxf/A4SKJdjvIKt
 huRjecmawp7wTdZo3tvy96N4tNxQa5cZsBgYMxoPmgfXQYHsCB8c1GPNLmk4jvBO53mig5JoR9x
 JXOfaDRpKlFbIh2FwLj4jN/iLovLzDdoDfj4QAT14XtLOwah3m66lMgyNjClYg304Sfy40W7p2n
 F0EnQPsNo2wVlZnAKJE7tzO0V7IFh4/sUrf57oFfl0eZpmbMLHseZZ2ukZwKxWe6KIj6KQ6rB4R
 cFZ5VRIIehhsFtzSStj27n34FdtvAXu6wpzUX3g8AAcTHcdAGtp56O9d6b5E/cE+ikUraLVb4Rm
 6BLhYsaSNIZ90kg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66445-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:Lachlan.Michael@sony.com,m:Ryuichi.Tadano@sony.com,m:Kengo.Hayasaka@sony.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jai.luthra@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 530C5700E15

Model the sensor's pixel array using an internal image pad when the new
common raw sensor model is used by a client.

Connect it to the source pad through an immutable route, as this can
never be modified.

Also set the analogue crop rectangle on the internal pad, while allowing
legacy users access to it through G_SELECTION on the source pad.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx678.c | 130 +++++++++++++++++++++++++++++++++++++--------
 1 file changed, 107 insertions(+), 23 deletions(-)

diff --git a/drivers/media/i2c/imx678.c b/drivers/media/i2c/imx678.c
index e8bf01bad7f2..fb260ce6f5d9 100644
--- a/drivers/media/i2c/imx678.c
+++ b/drivers/media/i2c/imx678.c
@@ -145,8 +145,16 @@
 #define IMX678_CROP_HST_ALIGN		4
 #define IMX678_CROP_VST_ALIGN		4
 
-/* Subdev pads */
-#define IMX678_SOURCE_PAD		0
+/* Source and internal sink pads */
+enum imx678_pad_ids {
+	IMX678_SOURCE_PAD = 0,
+	IMX678_IMAGE_PAD,
+	IMX678_NUM_PADS,
+};
+
+enum imx678_stream_ids {
+	IMX678_STREAM_IMAGE,
+};
 
 /* IMX678 native and active pixel array size. */
 static const struct v4l2_rect imx678_native_area = {
@@ -676,7 +684,7 @@ static const char * const imx678_supply_name[] = {
 
 struct imx678 {
 	struct v4l2_subdev sd;
-	struct media_pad pad;
+	struct media_pad pads[IMX678_NUM_PADS];
 	struct regmap *cci;
 
 	const struct imx678_model_info *info;
@@ -735,7 +743,8 @@ static int imx678_set_ctrl(struct v4l2_ctrl *ctrl)
 	int ret = 0;
 
 	state = v4l2_subdev_get_locked_active_state(&imx678->sd);
-	format = v4l2_subdev_state_get_format(state, IMX678_SOURCE_PAD);
+	format = v4l2_subdev_state_get_format(state, IMX678_SOURCE_PAD,
+					      IMX678_STREAM_IMAGE);
 
 	if (ctrl->id == V4L2_CID_VBLANK) {
 		u32 current_exposure = imx678->exposure->cur.val;
@@ -829,7 +838,6 @@ static int imx678_enum_frame_size(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct imx678 *imx678 = to_imx678(sd);
-	const struct v4l2_rect *crop;
 
 	if (fse->index)
 		return -EINVAL;
@@ -837,12 +845,20 @@ static int imx678_enum_frame_size(struct v4l2_subdev *sd,
 	if (!imx678_mbus_code_supported(imx678, fse->code))
 		return -EINVAL;
 
-	crop = v4l2_subdev_state_get_crop(sd_state, fse->pad);
-
-	fse->min_width = crop->width;
-	fse->max_width = fse->min_width;
-	fse->min_height = crop->height;
-	fse->max_height = fse->min_height;
+	if (fse->pad == IMX678_IMAGE_PAD) {
+		fse->min_width = imx678_native_area.width;
+		fse->max_width = fse->min_width;
+		fse->min_height = imx678_native_area.height;
+		fse->max_height = fse->min_height;
+	} else {
+		const struct v4l2_rect *analogue_crop =
+			v4l2_subdev_state_get_crop(sd_state, IMX678_IMAGE_PAD,
+						   IMX678_STREAM_IMAGE);
+		fse->min_width = analogue_crop->width;
+		fse->max_width = fse->min_width;
+		fse->min_height = analogue_crop->height;
+		fse->max_height = fse->min_height;
+	}
 
 	return 0;
 }
@@ -852,9 +868,43 @@ static int imx678_get_selection(struct v4l2_subdev *sd,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
+	if (sel->stream != IMX678_STREAM_IMAGE)
+		return -EINVAL;
+
+	/* Crop is on the source pad for legacy clients */
+	if (!(ci &&
+	      ci->client_caps & V4L2_SUBDEV_CLIENT_CAP_COMMON_RAW_SENSOR)) {
+		if (sel->pad != IMX678_SOURCE_PAD)
+			return -EINVAL;
+
+		switch (sel->target) {
+		case V4L2_SEL_TGT_CROP:
+			sel->r = *v4l2_subdev_state_get_crop(sd_state,
+							     IMX678_IMAGE_PAD,
+							     sel->stream);
+			return 0;
+
+		case V4L2_SEL_TGT_NATIVE_SIZE:
+			sel->r = imx678_native_area;
+			return 0;
+
+		case V4L2_SEL_TGT_CROP_DEFAULT:
+		case V4L2_SEL_TGT_CROP_BOUNDS:
+			sel->r = imx678_active_area;
+			return 0;
+		}
+
+		return -EINVAL;
+	}
+
+	/* Analog crop on internal pad with the common raw sensor model */
+	if (sel->pad != IMX678_IMAGE_PAD)
+		return -EINVAL;
+
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
-		sel->r = *v4l2_subdev_state_get_crop(sd_state, sel->pad);
+		sel->r = *v4l2_subdev_state_get_crop(sd_state, sel->pad,
+						     sel->stream);
 		return 0;
 
 	case V4L2_SEL_TGT_NATIVE_SIZE:
@@ -874,22 +924,51 @@ static int imx678_init_state(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *state)
 {
 	struct imx678 *imx678 = to_imx678(sd);
-	struct v4l2_mbus_framefmt *format;
-	struct v4l2_rect *crop;
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = IMX678_IMAGE_PAD,
+			.sink_stream = 0,
+			.source_pad = IMX678_SOURCE_PAD,
+			.source_stream = IMX678_STREAM_IMAGE,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
+				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE |
+				 V4L2_SUBDEV_ROUTE_FL_STATIC,
+		},
+	};
+	struct v4l2_subdev_krouting routing = {
+		.len_routes = ARRAY_SIZE(routes),
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+	struct v4l2_mbus_framefmt *format, *source_format;
+	struct v4l2_rect *analogue_crop;
+	int ret;
 
-	crop = v4l2_subdev_state_get_crop(state, IMX678_SOURCE_PAD);
-	*crop = imx678_active_area;
+	ret = v4l2_subdev_set_routing(sd, state, &routing);
+	if (ret)
+		return ret;
 
-	format = v4l2_subdev_state_get_format(state, IMX678_SOURCE_PAD);
+	analogue_crop = v4l2_subdev_state_get_crop(state, IMX678_IMAGE_PAD,
+						   IMX678_STREAM_IMAGE);
+	*analogue_crop = imx678_active_area;
+
+	format = v4l2_subdev_state_get_format(state, IMX678_IMAGE_PAD,
+					      IMX678_STREAM_IMAGE);
 	format->code = imx678_default_mbus_code(imx678);
-	format->width = imx678_active_area.width;
-	format->height = imx678_active_area.height;
+	format->width = imx678_native_area.width;
+	format->height = imx678_native_area.height;
 	format->field = V4L2_FIELD_NONE;
 	format->colorspace = V4L2_COLORSPACE_RAW;
 	format->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
 	format->quantization = V4L2_QUANTIZATION_FULL_RANGE;
 	format->xfer_func = V4L2_XFER_FUNC_NONE;
 
+	source_format = v4l2_subdev_state_get_format(state, IMX678_SOURCE_PAD,
+						     IMX678_STREAM_IMAGE);
+	*source_format = *format;
+	source_format->width = analogue_crop->width;
+	source_format->height = analogue_crop->height;
+
 	return 0;
 }
 
@@ -944,7 +1023,8 @@ static int imx678_enable_streams(struct v4l2_subdev *sd,
 	if (ret < 0)
 		return ret;
 
-	crop = v4l2_subdev_state_get_crop(state, pad);
+	crop = v4l2_subdev_state_get_crop(state, IMX678_IMAGE_PAD,
+					  IMX678_STREAM_IMAGE);
 	ret = imx678_program_window(imx678, crop);
 	if (ret) {
 		dev_err(&client->dev, "%s failed to set mode\n", __func__);
@@ -1350,12 +1430,16 @@ static int imx678_probe(struct i2c_client *client)
 		goto error_pm_runtime;
 
 	imx678->sd.internal_ops = &imx678_internal_ops;
-	imx678->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	imx678->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+			    V4L2_SUBDEV_FL_STREAMS;
 	imx678->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
-	imx678->pad.flags = MEDIA_PAD_FL_SOURCE;
+	imx678->pads[IMX678_IMAGE_PAD].flags = MEDIA_PAD_FL_SINK |
+					       MEDIA_PAD_FL_INTERNAL;
+	imx678->pads[IMX678_SOURCE_PAD].flags = MEDIA_PAD_FL_SOURCE;
 
-	ret = media_entity_pads_init(&imx678->sd.entity, 1, &imx678->pad);
+	ret = media_entity_pads_init(&imx678->sd.entity,
+				     ARRAY_SIZE(imx678->pads), imx678->pads);
 	if (ret) {
 		dev_err_probe(dev, ret, "failed to init entity pads\n");
 		goto error_handler_free;

-- 
2.54.0


