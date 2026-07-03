Return-Path: <linux-media+bounces-66453-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5eC9BraIR2ouaQAAu9opvQ
	(envelope-from <linux-media+bounces-66453-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 12:02:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6CF700ECB
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 12:02:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=coxgw+lY;
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66453-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66453-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E4C5630BC004
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 09:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87B143C10BD;
	Fri,  3 Jul 2026 09:56:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C6C3B83F9;
	Fri,  3 Jul 2026 09:55:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072551; cv=none; b=PJeylMiXXn7dF3eUvha/Tw8Nj3HVd4wRTmvo+oS1Uhwydt3paepD4GCB7YxRecgvzpxiBtjhdquUSuet3AtPGQ4vY0p1LsCSccG8mh2NKsu7RME1odpzJ+PdnGEuEK0FOfSksLmhAwU1oBKpOJ1PP7bzbyfi7lQIgPrVOoaoV2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072551; c=relaxed/simple;
	bh=YdIYNTHPEsBi949sBW508KuABfGhRGva084wJzGm8Cw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HnB1Zsi5mDfF1qQv1IclUZZicaNEcT9y8wfFUFtg4WC2A3kxRUB3YqoU6ziOeDruOjt0XWmFP7IoLI1VhhNZI9bdKvYZd7+MKxxU5+IHCPPu70jKM6YNCGd1YOcXY49E97tku3RRvluuC+yUWg1R3xMFDyHnl7+B2fE7YmgHUmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=coxgw+lY; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:8a87:d565:effa:ccf8:a720])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 48549212;
	Fri,  3 Jul 2026 11:54:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783072475;
	bh=YdIYNTHPEsBi949sBW508KuABfGhRGva084wJzGm8Cw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=coxgw+lYC/WghBKIO8e9C9znp0pDuR2CUBMltMgMD7vPauxwCYzNI4aC7Z7SbOYph
	 6Fyj6YFx6KImV67sY7CAKLJCOlpspR8yvse0F5r0d/iIQQ2zVwIMniHPa+sg7QyAFk
	 yrvAbsCNanP7qy33w8gYvyjnwXoFf0be6+PSdOYY=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 03 Jul 2026 15:24:14 +0530
Subject: [PATCH RFC 09/10] media: i2c: imx678: Add 2x2 binning support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-imx678-meta-v1-9-7c4924a0df05@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=16076;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=YdIYNTHPEsBi949sBW508KuABfGhRGva084wJzGm8Cw=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqR4bSAMyoItXJyeo5z8BZyKTNaN4i6AhAoJ4Ez
 yWCbR2O4nmJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCakeG0gAKCRBD3pH5JJpx
 RatUD/9VXXXV9KSh6iyVpwuo+wMDFLA2SDN/xCf6KbAOhAtyuChHS8/nLFJPRe4E0NuwJ8rh1+O
 ol3K+avkO9RTkXl/AxeUZ+IWv+c1a2ri7nchF5eUWgSwoNXHtS+7kPTx1RHolerhIF/APe0KNpB
 H9RE82bJfqwxl+AH4M5VxA3brWidxYwAQ2R5KQSuvJh6LK25Yawg5VduiWrrQdYFlVkKf6ymcuY
 OtRWVK3dDKve5xJE8l5rWVc80LlHXTfd+jRHVD4u+00M2Z+GWNe42YgawVjvkwVpnv84eWVwALM
 SezFC973W9B0Ymx7fgfPkdsqD8gkkz7GSxt03boH60+c4EQsvKpxPaLC0bpVJp0kfeLGgcdvYhH
 W+X0jaFT3GIxEcw76lZLC0XuYlauGJWEF5EHu79nkPcB3SxwnmC3Kd6nrQr6hx+hDR7txqWlvOk
 RtBG1w+YzztbWdwt1QjQqBVfcTbM6RR3n+BlxF026VVyxoWi7jTiwTquZY5D5msiqw88m8r3pW8
 mQCyiTk0vligpvecRs14lnNi/5SMl+7YLe1dhmWyr5bHedF9eZ3yo1mwhZNjDkOvNTN9cWzTs+C
 mRUTFfeEnMEofex5OG6Jh74v317qxIMtdjzkqb5Q0leiBmXkgYLi0BpWtzL9XZ2NSv8nFM7yrDV
 XnaMrel4AaLHumg==
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
	TAGGED_FROM(0.00)[bounces-66453-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,ideasonboard.com:from_mime,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8A6CF700ECB

Add support for user-configurable 2x2 binning on the source pad using
the new BINNING_FACTORS control introduced in the common raw sensor
model.

This also updates the compose rectangle on the internal image pad (as
read-only).

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx678.c | 236 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 188 insertions(+), 48 deletions(-)

diff --git a/drivers/media/i2c/imx678.c b/drivers/media/i2c/imx678.c
index c4eda15fbd08..3961d728a65f 100644
--- a/drivers/media/i2c/imx678.c
+++ b/drivers/media/i2c/imx678.c
@@ -105,9 +105,13 @@
 /* Common configuration registers */
 #define IMX678_REG_WDMODE               CCI_REG8(0x301a)
 #define IMX678_REG_ADDMODE              CCI_REG8(0x301b)
+#define IMX678_ADDMODE_FULL		0x0
+#define IMX678_ADDMODE_2X2		0x1
 #define IMX678_REG_THIN_V_EN            CCI_REG8(0x301c)
 #define IMX678_REG_VCMODE               CCI_REG8(0x301e)
 #define IMX678_REG_ADBIT                CCI_REG8(0x3022)
+#define IMX678_AD_10B			0x0
+#define IMX678_AD_12B			0x1
 #define IMX678_REG_MDBIT                CCI_REG8(0x3023)
 #define IMX678_REG_GAIN_PGC_FIDMD       CCI_REG8(0x3400)
 
@@ -284,6 +288,16 @@ static const int imx678_tpg_val[] = {
 	IMX678_TPG_V_COLOR_BARS,
 };
 
+enum imx678_binning_factor_indices {
+	IMX678_BINNING_11,
+	IMX678_BINNING_22,
+};
+
+static const s64 imx678_binning_factors[] = {
+	[IMX678_BINNING_11] = V4L2_BINNING_FACTORS_MAKE(1, 1, 1, 1),
+	[IMX678_BINNING_22] = V4L2_BINNING_FACTORS_MAKE(2, 1, 2, 1),
+};
+
 /* Common configuration */
 static const struct cci_reg_sequence common_regs[] = {
 	{ IMX678_REG_THIN_V_EN, 0x00 },
@@ -660,6 +674,11 @@ static const struct cci_reg_sequence common_regs[] = {
 	{ IMX678_REG_XXS_DRV, 0x00 },
 };
 
+static const u32 codes_internal[] = {
+	MEDIA_BUS_FMT_RAW_12,
+	MEDIA_BUS_FMT_RAW_10,
+};
+
 static const u32 codes_meta[] = {
 	MEDIA_BUS_FMT_META_12,
 };
@@ -720,6 +739,7 @@ struct imx678 {
 	struct v4l2_ctrl *exposure;
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *binning;
 
 	/* Track VMAX for exposure updates */
 	u32 vmax;
@@ -752,12 +772,16 @@ static u32 imx678_default_mbus_code(struct imx678 *imx678, unsigned int pad,
 static bool imx678_mbus_code_supported(struct imx678 *imx678, unsigned int pad,
 				       unsigned int stream, u32 code)
 {
-	if (pad == IMX678_IMAGE_PAD)
-		return (code == MEDIA_BUS_FMT_RAW_12);
-
 	if (pad == IMX678_METADATA_PAD)
 		return (code == MEDIA_BUS_FMT_META_8);
 
+	if (pad == IMX678_IMAGE_PAD) {
+		for (unsigned int i = 0; i < ARRAY_SIZE(codes_internal); i++) {
+			if (codes_internal[i] == code)
+				return true;
+		}
+	}
+
 	/* Source pad */
 	if (stream == IMX678_STREAM_METADATA) {
 		for (unsigned int i = 0; i < ARRAY_SIZE(codes_meta); i++) {
@@ -784,23 +808,27 @@ static u32 imx678_get_format_code(struct imx678 *imx678, unsigned int pad,
 }
 
 static int imx678_set_framing_limits(struct imx678 *imx678,
-				     const struct v4l2_mbus_framefmt *format)
+				     const struct v4l2_mbus_framefmt *format,
+				     u8 ad_bpp)
 {
 	const u32 hmax_4lane = min_hmax_4lane[__ffs(imx678->link_freq_bitmap)];
 	const u32 lane_scale = imx678->lane_mode == IMX678_LANEMODE_2L ? 2 : 1;
-	s32 hblank, max_hblank, vblank;
-	u32 hmax;
+	s32 min_hblank, default_hblank, max_hblank, vblank;
+	u32 hmax, min_hmax;
 	int ret;
 
 	imx678->vmax = IMX678_VMAX_DEFAULT;
 	hmax = hmax_4lane * lane_scale;
 
-	hblank = hmax * IMX678_PIX_PER_CLK - format->width;
+	/* HMAX can go lower when using 10bit AD */
+	min_hmax = (hmax * ad_bpp) / 12;
+	min_hblank = min_hmax * IMX678_PIX_PER_CLK - format->width;
+	default_hblank = hmax * IMX678_PIX_PER_CLK - format->width;
 	max_hblank = IMX678_HMAX_MAX * IMX678_PIX_PER_CLK - format->width;
 
-	ret = __v4l2_ctrl_modify_range(imx678->hblank, hblank, max_hblank,
-				       IMX678_PIX_PER_CLK, hblank);
-	ret |= __v4l2_ctrl_s_ctrl(imx678->hblank, hblank);
+	ret = __v4l2_ctrl_modify_range(imx678->hblank, min_hblank, max_hblank,
+				       IMX678_PIX_PER_CLK, default_hblank);
+	ret |= __v4l2_ctrl_s_ctrl(imx678->hblank, default_hblank);
 
 	vblank = imx678->vmax - format->height;
 	ret |= __v4l2_ctrl_modify_range(imx678->vblank, vblank,
@@ -816,6 +844,58 @@ static int imx678_set_framing_limits(struct imx678 *imx678,
 	return ret;
 }
 
+static int imx678_set_binning(struct imx678 *imx678,
+			      struct v4l2_subdev_state *state)
+{
+	struct v4l2_rect *crop =
+		v4l2_subdev_state_get_crop(state, IMX678_IMAGE_PAD,
+					   IMX678_STREAM_IMAGE);
+	struct v4l2_rect *compose =
+		v4l2_subdev_state_get_compose(state, IMX678_IMAGE_PAD,
+					      IMX678_STREAM_IMAGE);
+	struct v4l2_mbus_framefmt *image_format =
+		v4l2_subdev_state_get_format(state, IMX678_IMAGE_PAD);
+	struct v4l2_mbus_framefmt *source_format =
+		v4l2_subdev_state_get_format(state, IMX678_SOURCE_PAD,
+					     IMX678_STREAM_IMAGE);
+	struct v4l2_mbus_framefmt *meta_format =
+		v4l2_subdev_state_get_format(state, IMX678_METADATA_PAD);
+	struct v4l2_mbus_framefmt *meta_source_format =
+		v4l2_subdev_state_get_format(state, IMX678_SOURCE_PAD,
+					     IMX678_STREAM_METADATA);
+	const s64 binning = imx678_binning_factors[imx678->binning->val];
+	const u32 bin_h = V4L2_BINNING_FACTORS_HNUM(binning);
+	const u32 bin_v = V4L2_BINNING_FACTORS_VNUM(binning);
+	u8 ad_bpp;
+
+	/*
+	 * The compose rectangle represents the output size after binning and
+	 * the source pad format is sized to match it.
+	 */
+	compose->width = crop->width / bin_h;
+	compose->height = crop->height / bin_v;
+
+	source_format->width = compose->width;
+	source_format->height = compose->height;
+
+	meta_format->width = source_format->width;
+	meta_source_format->width = source_format->width;
+
+	switch (imx678->binning->val) {
+	case IMX678_BINNING_11:
+		image_format->code = MEDIA_BUS_FMT_RAW_12;
+		ad_bpp = 12;
+		break;
+	case IMX678_BINNING_22:
+		/* 10bit AD used when binning */
+		image_format->code = MEDIA_BUS_FMT_RAW_10;
+		ad_bpp = 10;
+		break;
+	}
+
+	return imx678_set_framing_limits(imx678, source_format, ad_bpp);
+}
+
 static int imx678_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct imx678 *imx678 = container_of_const(ctrl->handler, struct
@@ -829,7 +909,8 @@ static int imx678_set_ctrl(struct v4l2_ctrl *ctrl)
 	format = v4l2_subdev_state_get_format(state, IMX678_SOURCE_PAD,
 					      IMX678_STREAM_IMAGE);
 
-	if (ctrl->id == V4L2_CID_VBLANK) {
+	switch (ctrl->id) {
+	case V4L2_CID_VBLANK: {
 		u32 current_exposure = imx678->exposure->cur.val;
 
 		imx678->vmax = format->height + ctrl->val;
@@ -843,6 +924,15 @@ static int imx678_set_ctrl(struct v4l2_ctrl *ctrl)
 					       1, current_exposure);
 		if (ret)
 			return ret;
+		break;
+	}
+	case V4L2_CID_BINNING_FACTORS:
+		if (ctrl->val != ctrl->cur.val) {
+			ret = imx678_set_binning(imx678, state);
+			if (ret)
+				return ret;
+		}
+		break;
 	}
 
 	/*
@@ -887,6 +977,9 @@ static int imx678_set_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_VFLIP:
 		cci_write(imx678->cci, IMX678_REG_WINMODEV, ctrl->val, &ret);
 		break;
+	case V4L2_CID_BINNING_FACTORS:
+		/* Applied to registers on the next stream start. */
+		break;
 	default:
 		dev_warn(&client->dev,
 			 "ctrl(id:0x%x,val:0x%x) is not handled\n",
@@ -942,7 +1035,6 @@ static int imx678_enum_mbus_code(struct v4l2_subdev *sd,
 	struct imx678 *imx678 = to_imx678(sd);
 
 	switch (code->pad) {
-	case IMX678_IMAGE_PAD:
 	case IMX678_METADATA_PAD:
 		if (code->index > 0)
 			return -EINVAL;
@@ -950,6 +1042,12 @@ static int imx678_enum_mbus_code(struct v4l2_subdev *sd,
 		code->code = imx678_default_mbus_code(imx678, code->pad,
 						      code->stream);
 		break;
+	case IMX678_IMAGE_PAD:
+		if (code->index >= ARRAY_SIZE(codes_internal))
+			return -EINVAL;
+
+		code->code = codes_internal[code->index];
+		break;
 	case IMX678_SOURCE_PAD:
 		switch (code->stream) {
 		case IMX678_STREAM_IMAGE:
@@ -978,9 +1076,9 @@ static int imx678_enum_frame_size(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct imx678 *imx678 = to_imx678(sd);
-	const struct v4l2_rect *analogue_crop =
-			v4l2_subdev_state_get_crop(sd_state, IMX678_IMAGE_PAD,
-						   IMX678_STREAM_IMAGE);
+	const struct v4l2_mbus_framefmt *source_format =
+		v4l2_subdev_state_get_format(sd_state, IMX678_SOURCE_PAD,
+					     IMX678_STREAM_IMAGE);
 
 	if (fse->index)
 		return -EINVAL;
@@ -997,14 +1095,14 @@ static int imx678_enum_frame_size(struct v4l2_subdev *sd,
 	} else if (fse->pad == IMX678_METADATA_PAD ||
 		   (fse->pad == IMX678_SOURCE_PAD &&
 		    fse->stream == IMX678_STREAM_METADATA)) {
-		fse->min_width = analogue_crop->width;
+		fse->min_width = source_format->width;
 		fse->max_width = fse->min_width;
 		fse->min_height = 1;
 		fse->max_height = fse->min_height;
 	} else {
-		fse->min_width = analogue_crop->width;
+		fse->min_width = source_format->width;
 		fse->max_width = fse->min_width;
-		fse->min_height = analogue_crop->height;
+		fse->min_height = source_format->height;
 		fse->max_height = fse->min_height;
 	}
 
@@ -1086,6 +1184,10 @@ static int imx678_get_selection(struct v4l2_subdev *sd,
 	case V4L2_SEL_TGT_CROP_BOUNDS:
 		sel->r = imx678_active_area;
 		return 0;
+
+	case V4L2_SEL_TGT_COMPOSE:
+		sel->r = *v4l2_subdev_state_get_compose(sd_state, sel->pad);
+		return 0;
 	}
 
 	return -EINVAL;
@@ -1097,23 +1199,30 @@ static int imx678_set_selection(struct v4l2_subdev *sd,
 				struct v4l2_subdev_selection *sel)
 {
 	struct imx678 *imx678 = to_imx678(sd);
-	struct v4l2_mbus_framefmt *source_format, *meta_format;
-	struct v4l2_mbus_framefmt *meta_source_format;
-	struct v4l2_rect *crop, rect;
+	struct v4l2_rect *crop, *compose, rect;
 	int ret = 0;
 
 	if (!(ci && ci->client_caps & V4L2_SUBDEV_CLIENT_CAP_COMMON_RAW_SENSOR))
 		return -EINVAL;
 
-	if (sel->target != V4L2_SEL_TGT_CROP ||
-	    sel->pad != IMX678_IMAGE_PAD ||
-	    sel->stream != IMX678_STREAM_IMAGE)
+	if (sel->pad != IMX678_IMAGE_PAD || sel->stream != IMX678_STREAM_IMAGE)
 		return -EINVAL;
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
 	    v4l2_subdev_is_streaming(sd))
 		return -EBUSY;
 
+	switch (sel->target) {
+	case V4L2_SEL_TGT_COMPOSE:
+		sel->r = *v4l2_subdev_state_get_compose(sd_state, sel->pad);
+		return 0;
+	case V4L2_SEL_TGT_CROP:
+		/* Handled below */
+		break;
+	default:
+		return -EINVAL;
+	}
+
 	/* Align left, top to 4 */
 	rect.left = clamp_t(s32, ALIGN(sel->r.left, IMX678_CROP_HST_ALIGN),
 			    imx678_active_area.left,
@@ -1145,29 +1254,22 @@ static int imx678_set_selection(struct v4l2_subdev *sd,
 
 	crop = v4l2_subdev_state_get_crop(sd_state, IMX678_IMAGE_PAD,
 					  IMX678_STREAM_IMAGE);
-	source_format = v4l2_subdev_state_get_format(sd_state,
-						     IMX678_SOURCE_PAD,
-						     IMX678_STREAM_IMAGE);
-	meta_format = v4l2_subdev_state_get_format(sd_state,
-						   IMX678_METADATA_PAD);
-	meta_source_format =
-		v4l2_subdev_state_get_format(sd_state, IMX678_SOURCE_PAD,
-					     IMX678_STREAM_METADATA);
-
-	if (rect.width != crop->width || rect.height != crop->height) {
-		source_format->width = rect.width;
-		source_format->height = rect.height;
-		meta_format->width = rect.width;
-		meta_source_format->width = rect.width;
-	}
+	compose = v4l2_subdev_state_get_compose(sd_state, IMX678_IMAGE_PAD,
+						IMX678_STREAM_IMAGE);
 
 	*crop = rect;
+
+	/*
+	 * Apply the current binning factor to the new crop. This updates
+	 * compose, source format and control limits.
+	 */
+	ret = imx678_set_binning(imx678, sd_state);
+	if (ret)
+		return ret;
+
 	sel->r = *crop;
 
-	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
-		ret = imx678_set_framing_limits(imx678, source_format);
-
-	return ret;
+	return 0;
 }
 
 static int imx678_init_state(struct v4l2_subdev *sd,
@@ -1200,7 +1302,7 @@ static int imx678_init_state(struct v4l2_subdev *sd,
 		.routes = routes,
 	};
 	struct v4l2_mbus_framefmt *format, *source_format;
-	struct v4l2_rect *analogue_crop;
+	struct v4l2_rect *analogue_crop, *compose;
 	struct v4l2_mbus_framefmt *meta_format, *meta_source_format;
 
 	int ret;
@@ -1213,6 +1315,10 @@ static int imx678_init_state(struct v4l2_subdev *sd,
 						   IMX678_STREAM_IMAGE);
 	*analogue_crop = imx678_active_area;
 
+	compose = v4l2_subdev_state_get_compose(state, IMX678_IMAGE_PAD,
+						IMX678_STREAM_IMAGE);
+	*compose = *analogue_crop;
+
 	format = v4l2_subdev_state_get_format(state, IMX678_IMAGE_PAD,
 					      IMX678_STREAM_IMAGE);
 	format->code = imx678_default_mbus_code(imx678, IMX678_IMAGE_PAD,
@@ -1271,11 +1377,11 @@ static int imx678_write_common(struct imx678 *imx678)
 }
 
 static int imx678_program_window(struct imx678 *imx678,
-				 const struct v4l2_rect *crop)
+				 const struct v4l2_rect *crop,
+				 const struct v4l2_mbus_framefmt *format)
 {
 	int ret = 0;
 
-	cci_write(imx678->cci, IMX678_REG_ADDMODE, 0x00, &ret);
 	cci_write(imx678->cci, IMX678_REG_WINMODE,
 		  v4l2_rect_equal(crop, &imx678_active_area) ? 0x00 : 0x04,
 		  &ret);
@@ -1285,7 +1391,27 @@ static int imx678_program_window(struct imx678 *imx678,
 	cci_write(imx678->cci, IMX678_REG_PIX_VST,
 		  crop->top - imx678_active_area.top, &ret);
 	cci_write(imx678->cci, IMX678_REG_PIX_VWIDTH, crop->height, &ret);
-	cci_write(imx678->cci, IMX678_REG_ADBIT, 0x01, &ret);
+
+	switch (imx678->binning->val) {
+	case IMX678_BINNING_11:
+		cci_write(imx678->cci, IMX678_REG_ADDMODE, IMX678_ADDMODE_FULL,
+			  &ret);
+		break;
+	case IMX678_BINNING_22:
+		cci_write(imx678->cci, IMX678_REG_ADDMODE, IMX678_ADDMODE_2X2,
+			  &ret);
+		break;
+	}
+
+	switch (format->code) {
+	case MEDIA_BUS_FMT_RAW_10:
+		cci_write(imx678->cci, IMX678_REG_ADBIT, IMX678_AD_10B, &ret);
+		break;
+	case MEDIA_BUS_FMT_RAW_12:
+	default:
+		cci_write(imx678->cci, IMX678_REG_ADBIT, IMX678_AD_12B, &ret);
+		break;
+	}
 
 	return ret;
 }
@@ -1297,6 +1423,7 @@ static int imx678_enable_streams(struct v4l2_subdev *sd,
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct imx678 *imx678 = to_imx678(sd);
 	const struct v4l2_rect *crop;
+	const struct v4l2_mbus_framefmt *format;
 	int ret;
 
 	if (!(mask & 1ULL))
@@ -1308,7 +1435,9 @@ static int imx678_enable_streams(struct v4l2_subdev *sd,
 
 	crop = v4l2_subdev_state_get_crop(state, IMX678_IMAGE_PAD,
 					  IMX678_STREAM_IMAGE);
-	ret = imx678_program_window(imx678, crop);
+	format = v4l2_subdev_state_get_format(state, IMX678_IMAGE_PAD,
+					      IMX678_STREAM_IMAGE);
+	ret = imx678_program_window(imx678, crop, format);
 	if (ret) {
 		dev_err(&client->dev, "%s failed to set mode\n", __func__);
 		goto err_rpm_put;
@@ -1321,6 +1450,8 @@ static int imx678_enable_streams(struct v4l2_subdev *sd,
 		goto err_rpm_put;
 	}
 
+	__v4l2_ctrl_grab(imx678->binning, true);
+
 	cci_write(imx678->cci, IMX678_REG_MODE_SELECT, IMX678_MODE_STREAMING,
 		  &ret);
 	usleep_range(IMX678_STREAM_DELAY_US, IMX678_STREAM_DELAY_US +
@@ -1360,6 +1491,8 @@ static int imx678_disable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		dev_err(&client->dev, "%s failed to stop stream\n", __func__);
 
+	__v4l2_ctrl_grab(imx678->binning, false);
+
 	pm_runtime_put(&client->dev);
 
 	return ret;
@@ -1608,6 +1741,13 @@ static int imx678_init_controls(struct imx678 *imx678)
 			  0, V4L2_METADATA_LAYOUT_IMX678,
 			  1, V4L2_METADATA_LAYOUT_IMX678);
 
+	imx678->binning =
+		v4l2_ctrl_new_int_menu(ctrl_hdlr, &imx678_ctrl_ops,
+				       V4L2_CID_BINNING_FACTORS,
+				       ARRAY_SIZE(imx678_binning_factors) - 1,
+				       IMX678_BINNING_11,
+				       imx678_binning_factors);
+
 	v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx678_ctrl_ops, &props);
 
 	if (ctrl_hdlr->error) {

-- 
2.54.0


