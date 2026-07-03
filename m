Return-Path: <linux-media+bounces-66448-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6rgUISqIR2rtaAAAu9opvQ
	(envelope-from <linux-media+bounces-66448-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 12:00:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EFA700E52
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 12:00:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=LPYGfiol;
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66448-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66448-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 115B530889AA
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 09:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39183B776A;
	Fri,  3 Jul 2026 09:55:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601A03B4E9B;
	Fri,  3 Jul 2026 09:55:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072516; cv=none; b=ntFbAoxSt9G3ZejnKQABuVDDIkj6oawjEYdDp+dDzWzvmcd4dA3No00gTbKFoWreQzoRkmjN19pnxAAOly1F70CrOmYraYLBBAFls2JJ3owVg71DvBGe8GSW5q8n3JzL1I/94QUw5xH9fpcJmdyV4gzR2WcC+I2lNTJ2aPyhLpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072516; c=relaxed/simple;
	bh=ceB0hO8cqledLf4vwimVsWKX+Ka6C6KS3LhhVg6rmUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hm88rLZkcrSu2cvzrISbh9UfwpR8qVjr43WiGrXhyjGlxPy/hb5+KqDj8XYhVrSrdU9oeJliFnLsySv8QzvY6V6BJ6XGYXSGNkCYghYGnJ5fqsQcGUcRQKnZYLBRfwzwt8FNSMg+NB/fl8HiidQm1A8N6FFGmwXi463jx9LQD/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LPYGfiol; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:8a87:d565:effa:ccf8:a720])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9882212;
	Fri,  3 Jul 2026 11:54:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783072454;
	bh=ceB0hO8cqledLf4vwimVsWKX+Ka6C6KS3LhhVg6rmUc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LPYGfiol55TMO0WfESmHRVz/BNjKzhSkRgFsoiEr8nYAPix+OcpHNQMgIF/T06dEI
	 1KNX9avjm7aKTv1BlwWHIu+12xUwGBv71ysEeeeT7qwEpa+v1v/gwmru8RQz7iIvCG
	 cPVPMLE3qficYMJSl0PyV+rB63kBvEU70MX5QrJw=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 03 Jul 2026 15:24:10 +0530
Subject: [PATCH RFC 05/10] media: i2c: imx678: Use generic raw formats and
 common raw sensor model
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-imx678-meta-v1-5-7c4924a0df05@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7333;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=ceB0hO8cqledLf4vwimVsWKX+Ka6C6KS3LhhVg6rmUc=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqR4bO+LEkMlkkYmdYkhYXgLCr1KURucDFmZD6/
 2x40h5maweJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCakeGzgAKCRBD3pH5JJpx
 RbS5D/wKwCVjq7fGlY1Po5tsj0tqNxVTvz5Mu9mKy8YaCkO7RvFQJ2Pu8rlo0PL37AZP/IFvzVv
 R4OYxqmYaFykegK7wnL4MaqylVV5CnrVxizi8JPJG3yevDIl6slwSIUJWfSmYLpZAI4i8L2yDWa
 aXLETa4mxw444tjcfnsmI+v5w3e87QyEqGDF+Iywd0mDvA4EmE5gZY07bbCrMMKY8498xeq5bhU
 d3nWcJw+/c1lT6gY/HAKtWn+w75+X4c6oPOFRfLZa7FZaEi7cc7cRaMqazukEqvQtIcNOTRhhkc
 xRYBtN45yJdc8ngqzNHeS7QLP+WujcILPXPMi9YVTLyyXg5UrXBJHDQyKkUapv5CyD2+Uby602r
 GQs7lQuzNtVOZrwOAbOZs+fVH5iMb4j3QwUFDQ5fohm/1uCzfG+jfUQRjspFLRtbOCrXCFtCIEu
 33cQ43xckHna31rUdlyH1Kom88sOjMwg9Ok75vjCQ3lgXfA9PkbE1icV1y0x9sPlrnHn4kG0u4W
 MRaw7y9Z8pEAKOJ53g2+P18i4LPjbFOlV/uuCfBA7hyR+xWj2avGV6MrwSr6enUYZ+IN++Zbcmc
 X2U3xAa2HLZRSe08xflRxkfMx+0XcS3tN/LIhjv0VS5JJD01BXG7uOoriDHE8wtDpZuuicbXEYu
 lpYVVzGRy/OcNag==
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
	TAGGED_FROM(0.00)[bounces-66448-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:from_mime,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E0EFA700E52

Add support for CFA pattern agnostic raw formats, including controls to
convey the CFA pattern and the configuration model (common raw sensor).

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx678.c | 101 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 93 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx678.c b/drivers/media/i2c/imx678.c
index 51c5487fa1af..bbe6fff052b7 100644
--- a/drivers/media/i2c/imx678.c
+++ b/drivers/media/i2c/imx678.c
@@ -179,6 +179,7 @@ enum imx678_type {
 
 struct imx678_model_info {
 	enum imx678_type type;
+	unsigned int pattern;
 	const u32 *codes;
 	unsigned int num_codes;
 };
@@ -657,6 +658,10 @@ static const struct cci_reg_sequence common_regs[] = {
 	{ IMX678_REG_XXS_DRV, 0x00 },
 };
 
+static const u32 codes_generic[] = {
+	MEDIA_BUS_FMT_RAW_12,
+};
+
 static const u32 codes_bayer[] = {
 	MEDIA_BUS_FMT_SRGGB12_1X12,
 };
@@ -667,12 +672,14 @@ static const u32 codes_monochrome[] = {
 
 static const struct imx678_model_info imx678_aaqr_info = {
 	.type = IMX678_COLOR,
+	.pattern = V4L2_CFA_PATTERN_RGGB,
 	.codes = codes_bayer,
 	.num_codes = ARRAY_SIZE(codes_bayer),
 };
 
 static const struct imx678_model_info imx678_aamr_info = {
 	.type = IMX678_MONOCHROME,
+	.pattern = V4L2_CFA_PATTERN_MONO,
 	.codes = codes_monochrome,
 	.num_codes = ARRAY_SIZE(codes_monochrome),
 };
@@ -719,13 +726,25 @@ static inline struct imx678 *to_imx678(struct v4l2_subdev *_sd)
 	return container_of_const(_sd, struct imx678, sd);
 }
 
-static u32 imx678_default_mbus_code(struct imx678 *imx678)
+static u32 imx678_default_mbus_code(struct imx678 *imx678, unsigned int pad)
 {
+	if (pad == IMX678_IMAGE_PAD)
+		return codes_generic[0];
+
 	return imx678->info->codes[0];
 }
 
-static bool imx678_mbus_code_supported(struct imx678 *imx678, u32 code)
+static bool imx678_mbus_code_supported(struct imx678 *imx678, unsigned int pad,
+				       u32 code)
 {
+	for (unsigned int i = 0; i < ARRAY_SIZE(codes_generic); i++) {
+		if (codes_generic[i] == code)
+			return true;
+	}
+
+	if (pad == IMX678_IMAGE_PAD)
+		return false;
+
 	for (unsigned int i = 0; i < imx678->info->num_codes; i++) {
 		if (imx678->info->codes[i] == code)
 			return true;
@@ -734,6 +753,15 @@ static bool imx678_mbus_code_supported(struct imx678 *imx678, u32 code)
 	return false;
 }
 
+static u32 imx678_get_format_code(struct imx678 *imx678, unsigned int pad,
+				  u32 code)
+{
+	if (imx678_mbus_code_supported(imx678, pad, code))
+		return code;
+
+	return imx678_default_mbus_code(imx678, pad);
+}
+
 static int imx678_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct imx678 *imx678 = container_of_const(ctrl->handler, struct
@@ -850,10 +878,28 @@ static int imx678_enum_mbus_code(struct v4l2_subdev *sd,
 {
 	struct imx678 *imx678 = to_imx678(sd);
 
-	if (code->index >= imx678->info->num_codes)
+	switch (code->pad) {
+	case IMX678_IMAGE_PAD:
+		if (code->index >= ARRAY_SIZE(codes_generic))
+			return -EINVAL;
+
+		code->code = codes_generic[code->index];
+		break;
+	case IMX678_SOURCE_PAD:
+		unsigned int num_bayer = imx678->info->num_codes;
+
+		if (code->index >= num_bayer + ARRAY_SIZE(codes_generic))
+			return -EINVAL;
+
+		if (code->index < num_bayer)
+			code->code = imx678->info->codes[code->index];
+		else
+			code->code = codes_generic[code->index - num_bayer];
+		break;
+	default:
 		return -EINVAL;
+	}
 
-	code->code = imx678->info->codes[code->index];
 	return 0;
 }
 
@@ -866,7 +912,7 @@ static int imx678_enum_frame_size(struct v4l2_subdev *sd,
 	if (fse->index)
 		return -EINVAL;
 
-	if (!imx678_mbus_code_supported(imx678, fse->code))
+	if (!imx678_mbus_code_supported(imx678, fse->pad, fse->code))
 		return -EINVAL;
 
 	if (fse->pad == IMX678_IMAGE_PAD) {
@@ -887,6 +933,28 @@ static int imx678_enum_frame_size(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int imx678_set_pad_format(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_format *fmt)
+{
+	struct imx678 *imx678 = to_imx678(sd);
+	struct v4l2_mbus_framefmt *format;
+
+	if (fmt->pad != IMX678_SOURCE_PAD && fmt->stream != IMX678_STREAM_IMAGE)
+		return v4l2_subdev_get_fmt(sd, sd_state, fmt);
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+	    v4l2_subdev_is_streaming(sd))
+		return -EBUSY;
+
+	format = v4l2_subdev_state_get_format(sd_state, fmt->pad, fmt->stream);
+	format->code = fmt->format.code =
+		imx678_get_format_code(imx678, fmt->pad, fmt->format.code);
+
+	return 0;
+}
+
 static int imx678_get_selection(struct v4l2_subdev *sd,
 				const struct v4l2_subdev_client_info *ci,
 				struct v4l2_subdev_state *sd_state,
@@ -978,7 +1046,7 @@ static int imx678_init_state(struct v4l2_subdev *sd,
 
 	format = v4l2_subdev_state_get_format(state, IMX678_IMAGE_PAD,
 					      IMX678_STREAM_IMAGE);
-	format->code = imx678_default_mbus_code(imx678);
+	format->code = imx678_default_mbus_code(imx678, IMX678_IMAGE_PAD);
 	format->width = imx678_native_area.width;
 	format->height = imx678_native_area.height;
 	format->field = V4L2_FIELD_NONE;
@@ -990,6 +1058,8 @@ static int imx678_init_state(struct v4l2_subdev *sd,
 	source_format = v4l2_subdev_state_get_format(state, IMX678_SOURCE_PAD,
 						     IMX678_STREAM_IMAGE);
 	*source_format = *format;
+	source_format->code = imx678_default_mbus_code(imx678,
+						       IMX678_SOURCE_PAD);
 	source_format->width = analogue_crop->width;
 	source_format->height = analogue_crop->height;
 
@@ -1234,7 +1304,7 @@ static const struct v4l2_subdev_video_ops imx678_video_ops = {
 static const struct v4l2_subdev_pad_ops imx678_pad_ops = {
 	.enum_mbus_code = imx678_enum_mbus_code,
 	.get_fmt = v4l2_subdev_get_fmt,
-	.set_fmt = v4l2_subdev_get_fmt_ci,
+	.set_fmt = imx678_set_pad_format,
 	.get_selection = imx678_get_selection,
 	.enum_frame_size = imx678_enum_frame_size,
 	.get_frame_desc = imx678_get_frame_desc,
@@ -1258,7 +1328,7 @@ static int imx678_init_controls(struct imx678 *imx678)
 	const u32 lane_scale = imx678->lane_mode == IMX678_LANEMODE_2L ? 2 : 1;
 	struct i2c_client *client = v4l2_get_subdevdata(&imx678->sd);
 	struct v4l2_fwnode_device_properties props;
-	struct v4l2_ctrl *link_freq;
+	struct v4l2_ctrl *link_freq, *cfa_pattern;
 	s32 hblank, max_hblank, vblank, max_vblank;
 	u32 hmax;
 	int ret;
@@ -1326,6 +1396,21 @@ static int imx678_init_controls(struct imx678 *imx678)
 				     ARRAY_SIZE(imx678_tpg_menu) - 1, 0, 0,
 				     imx678_tpg_menu);
 
+	v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_CONFIG_MODEL, 0,
+			  V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR, 0,
+			  V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR);
+
+	cfa_pattern = v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_CFA_PATTERN,
+					imx678->info->pattern,
+					imx678->info->pattern, 1,
+					imx678->info->pattern);
+
+	if (cfa_pattern)
+		cfa_pattern->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_CFA_PATTERN_FLIP, 0,
+			  V4L2_CFA_PATTERN_FLIP_BOTH, 0, 0);
+
 	v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx678_ctrl_ops, &props);
 
 	if (ctrl_hdlr->error) {

-- 
2.54.0


