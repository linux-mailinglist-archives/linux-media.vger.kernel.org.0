Return-Path: <linux-media+bounces-66451-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b4G5EoeIR2oYaQAAu9opvQ
	(envelope-from <linux-media+bounces-66451-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 12:01:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C0E700E9F
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 12:01:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=oTeme9V8;
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66451-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66451-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A088309ECC2
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 09:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E54CB3B71A4;
	Fri,  3 Jul 2026 09:55:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333843B7776;
	Fri,  3 Jul 2026 09:55:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072538; cv=none; b=Pv3qpmpJqWzVdynL7TdYm+8ZEdXxddEUfHz1QZnKCQhnBLqKXycRdD3xpPx3HBrL7kbxRvMqxx2caaZIKAQfob0X3XJ2K9a4PIHlDrBxWOQz7hN0+4eWQPf3KWCBW4RWvB1iFJ4jN/oSkIXrGRjKrm3fIUw/YIiI9PSc4y/nkUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072538; c=relaxed/simple;
	bh=OxqSMiYUO3mSp5Xf6AiKg3jZRlVw04vACaUjbxUFtD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sLMn3KjYjR2XW00tv66hjxPffybdfejBDFGW9NsEWF+UAihqPQedJWWUh3fqn00/p+eMsjI7MtSI+Vv6bGewXYWoADVsezz55Tfkd97HCrEpTmEaMsVE7JaZzDymse/nvh7hzhujgdA3fo15vYPW48uOpvSsMuSG0xGcEbtlJSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oTeme9V8; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:8a87:d565:effa:ccf8:a720])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 016011494;
	Fri,  3 Jul 2026 11:54:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783072470;
	bh=OxqSMiYUO3mSp5Xf6AiKg3jZRlVw04vACaUjbxUFtD0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oTeme9V8/s/8id9NSDFXMVHQKBnX5uf1MqFCpKD7N7LQhhalmc9j8ifPiQEtX69U9
	 n2GSIPKzQnha6sTglCmIoZk4v8A/6yinLiw+TjvJ9+78R93ITLQDVSFmstaynjKeZQ
	 i4mSQAHNQtftZCv1NjQkU+O9DhQ5lOE+7WqdYkFY=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 03 Jul 2026 15:24:13 +0530
Subject: [PATCH RFC 08/10] media: i2c: imx678: Add crop selection support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-imx678-meta-v1-8-7c4924a0df05@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5358;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=OxqSMiYUO3mSp5Xf6AiKg3jZRlVw04vACaUjbxUFtD0=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqR4bR7O+a6IA42D02H5567MwtaV0S6MLQ0cuvF
 OS5ODxVq46JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCakeG0QAKCRBD3pH5JJpx
 RQ8rEAC3cXgMLO7Epyxkp2bn44L+i9PhMLp1v9sV3T4uSg5RHt57Za3zAjB0uUpi7xwy6RNEP9K
 upAeBlIeffbK1Qb4X6a1kxafGoTjmHWQhnRnIzNMr9udKk3m5i4s6kvFHSUFS5MnPVuAuGrQl08
 OQwVfeN5th3nVixSkgkIhpDHXecAwgY1a2PPwNDP1LoPzXLB6U2pt4IuGsTcdcdV4wl61UE4YZm
 VMVFTdboV9GvAVtcPuh5u8ez1DZrjw/q5a3b1ode8cwfCN/0pG9ME4aPMhhloIqVFhntRCivS/I
 HX9p66sREK6zQTyAlDR+GzD8B1f1avs7C4DTeWbs1RUzrv2wjrUbDNHUowFQ9B/YO8lDLErUGJ/
 FE4IoRd325coTj6NL7khFZKUhgWrGlBtK3agdaifZKy7EH9/gxLm/g1drqE2JRT4cy0ZP08Z2w/
 bcaNscpE/+iYIt52V3mA1jRPklfAar3dDoXtApa44yCN83j+6/rkSK7yDwQhjyg7KqOHd3t9Ti6
 Qf4FwyXhlqs23CnqewIr5W/hpig89HZT6Cy9a03b11925SbAERjnByPkgQ6hw7TaOJqZWLDqKgp
 G7rv+0YxqRQC5xddntk8nl6OzOMxNetqDGsVu7pvdfuFdVmJSqnlfSsl8nWdcXq4b2/0AEL5/kC
 1zmEc/Kmtl6Kz7g==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-66451-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:Lachlan.Michael@sony.com,m:Ryuichi.Tadano@sony.com,m:Kengo.Hayasaka@sony.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jai.luthra@ideasonboard.com,s:lists@lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[imx678_active_area.top:query timed out];
	FORGED_SENDER(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,ideasonboard.com:from_mime,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim,imx678_active_area.top:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 05C0E700E9F

Add support for user-configurable analogue crop rectangle using
S_SELECTION api on the internal image pad, following the common raw
sensor model.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx678.c | 113 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/drivers/media/i2c/imx678.c b/drivers/media/i2c/imx678.c
index d72d1c80c68d..c4eda15fbd08 100644
--- a/drivers/media/i2c/imx678.c
+++ b/drivers/media/i2c/imx678.c
@@ -783,6 +783,39 @@ static u32 imx678_get_format_code(struct imx678 *imx678, unsigned int pad,
 	return imx678_default_mbus_code(imx678, pad, stream);
 }
 
+static int imx678_set_framing_limits(struct imx678 *imx678,
+				     const struct v4l2_mbus_framefmt *format)
+{
+	const u32 hmax_4lane = min_hmax_4lane[__ffs(imx678->link_freq_bitmap)];
+	const u32 lane_scale = imx678->lane_mode == IMX678_LANEMODE_2L ? 2 : 1;
+	s32 hblank, max_hblank, vblank;
+	u32 hmax;
+	int ret;
+
+	imx678->vmax = IMX678_VMAX_DEFAULT;
+	hmax = hmax_4lane * lane_scale;
+
+	hblank = hmax * IMX678_PIX_PER_CLK - format->width;
+	max_hblank = IMX678_HMAX_MAX * IMX678_PIX_PER_CLK - format->width;
+
+	ret = __v4l2_ctrl_modify_range(imx678->hblank, hblank, max_hblank,
+				       IMX678_PIX_PER_CLK, hblank);
+	ret |= __v4l2_ctrl_s_ctrl(imx678->hblank, hblank);
+
+	vblank = imx678->vmax - format->height;
+	ret |= __v4l2_ctrl_modify_range(imx678->vblank, vblank,
+					IMX678_VMAX_MAX - format->height, 2,
+					vblank);
+	ret |= __v4l2_ctrl_s_ctrl(imx678->vblank,
+				  IMX678_VMAX_DEFAULT - format->height);
+
+	ret |= __v4l2_ctrl_modify_range(imx678->exposure, IMX678_EXPOSURE_MIN,
+					imx678->vmax - IMX678_SHR_MIN, 1,
+					IMX678_EXPOSURE_DEFAULT);
+
+	return ret;
+}
+
 static int imx678_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct imx678 *imx678 = container_of_const(ctrl->handler, struct
@@ -1058,6 +1091,85 @@ static int imx678_get_selection(struct v4l2_subdev *sd,
 	return -EINVAL;
 }
 
+static int imx678_set_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
+				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_selection *sel)
+{
+	struct imx678 *imx678 = to_imx678(sd);
+	struct v4l2_mbus_framefmt *source_format, *meta_format;
+	struct v4l2_mbus_framefmt *meta_source_format;
+	struct v4l2_rect *crop, rect;
+	int ret = 0;
+
+	if (!(ci && ci->client_caps & V4L2_SUBDEV_CLIENT_CAP_COMMON_RAW_SENSOR))
+		return -EINVAL;
+
+	if (sel->target != V4L2_SEL_TGT_CROP ||
+	    sel->pad != IMX678_IMAGE_PAD ||
+	    sel->stream != IMX678_STREAM_IMAGE)
+		return -EINVAL;
+
+	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+	    v4l2_subdev_is_streaming(sd))
+		return -EBUSY;
+
+	/* Align left, top to 4 */
+	rect.left = clamp_t(s32, ALIGN(sel->r.left, IMX678_CROP_HST_ALIGN),
+			    imx678_active_area.left,
+			    imx678_active_area.left + imx678_active_area.width -
+			    IMX678_PIXEL_ARRAY_MIN_WIDTH);
+	rect.top = clamp_t(s32, ALIGN(sel->r.top, IMX678_CROP_VST_ALIGN),
+			   imx678_active_area.top,
+			   imx678_active_area.top + imx678_active_area.height -
+			   IMX678_PIXEL_ARRAY_MIN_HEIGHT);
+
+	/* Align width to 16 and height to 4 */
+	rect.width = clamp_t(u32, ALIGN(sel->r.width, IMX678_CROP_HWIDTH_ALIGN),
+			     IMX678_PIXEL_ARRAY_MIN_WIDTH,
+			     imx678_active_area.width);
+	rect.height = clamp_t(u32,
+			      ALIGN(sel->r.height, IMX678_CROP_VWIDTH_ALIGN),
+			      IMX678_PIXEL_ARRAY_MIN_HEIGHT,
+			      imx678_active_area.height);
+
+	/* If left/top are big, reduce width/height to fit active area */
+	rect.width = min_t(u32, rect.width,
+			   ALIGN_DOWN(imx678_active_area.left +
+				      imx678_active_area.width - rect.left,
+				      IMX678_CROP_HWIDTH_ALIGN));
+	rect.height = min_t(u32, rect.height,
+			    ALIGN_DOWN(imx678_active_area.top +
+				       imx678_active_area.height - rect.top,
+				       IMX678_CROP_VWIDTH_ALIGN));
+
+	crop = v4l2_subdev_state_get_crop(sd_state, IMX678_IMAGE_PAD,
+					  IMX678_STREAM_IMAGE);
+	source_format = v4l2_subdev_state_get_format(sd_state,
+						     IMX678_SOURCE_PAD,
+						     IMX678_STREAM_IMAGE);
+	meta_format = v4l2_subdev_state_get_format(sd_state,
+						   IMX678_METADATA_PAD);
+	meta_source_format =
+		v4l2_subdev_state_get_format(sd_state, IMX678_SOURCE_PAD,
+					     IMX678_STREAM_METADATA);
+
+	if (rect.width != crop->width || rect.height != crop->height) {
+		source_format->width = rect.width;
+		source_format->height = rect.height;
+		meta_format->width = rect.width;
+		meta_source_format->width = rect.width;
+	}
+
+	*crop = rect;
+	sel->r = *crop;
+
+	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		ret = imx678_set_framing_limits(imx678, source_format);
+
+	return ret;
+}
+
 static int imx678_init_state(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *state)
 {
@@ -1386,6 +1498,7 @@ static const struct v4l2_subdev_pad_ops imx678_pad_ops = {
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = imx678_set_pad_format,
 	.get_selection = imx678_get_selection,
+	.set_selection = imx678_set_selection,
 	.enum_frame_size = imx678_enum_frame_size,
 	.get_frame_desc = imx678_get_frame_desc,
 	.enable_streams = imx678_enable_streams,

-- 
2.54.0


