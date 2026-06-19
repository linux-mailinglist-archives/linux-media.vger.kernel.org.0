Return-Path: <linux-media+bounces-65250-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ivnzEIjTNGqihwYAu9opvQ
	(envelope-from <linux-media+bounces-65250-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 07:28:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2FE6A3F2D
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 07:28:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=MxXmI7zB;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65250-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-65250-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3E87C303A1A7
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 05:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C0833E348;
	Fri, 19 Jun 2026 05:27:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEF2334C27;
	Fri, 19 Jun 2026 05:27:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781846850; cv=none; b=HwWsDbi+LhhUZOX1lkxcoAzoFWTveeb6VRa9qxXt6jnhqt/D6G5+5fUU6CmapUE8S+iwFNWluOA4gC9PqtkYHYM5LGmDXm69uCfrXenZSdn4HiTxNl7OdxaRLuKTlCB99Eyin+3tHxJ6gUnrffM08ZsYFIyNTZsTUv7gE/W/iSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781846850; c=relaxed/simple;
	bh=gkRGUjurZMyVodKs46qfbS1YBfsxg48y4/aGyquQHxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eq0wbDkjxd/PZR210zz8y9RxUW+sXLhOURh9MI6UU7Tn2ykItHmND/VrAObGdmeaGDGbI6slRLR1aw4yKg0N8fC+Pa4HsSlKb4MuKagINVwN6KtQplQvevh9SxlM3D8138HEx4+MA3c2bxg7b0cJtho2Yn+RZ6xApf3XrHjeG+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MxXmI7zB; arc=none smtp.client-ip=213.167.242.64
Received: from neptunite.hamster-moth.ts.net (unknown [IPv6:2404:7a81:160:2100:327:f131:c148:b7f8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3E393251C;
	Fri, 19 Jun 2026 07:26:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781846811;
	bh=gkRGUjurZMyVodKs46qfbS1YBfsxg48y4/aGyquQHxo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MxXmI7zB05P+O9VYq77EnhgMWXOEw4U6fflhJkV7iZAPJna4xlLgsYh2id55lw9bN
	 Y0sLk+7gYFOBEkWc+bNrHM0AquX0O4zZ7xDX1TgMcvcSIOKH2sQQzowZ3ne6exO1Ni
	 MouBfADGMcK/z2WYVNABFw1z8mSNAr3dpgY/6ejM=
From: Paul Elder <paul.elder@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: Paul Elder <paul.elder@ideasonboard.com>,
	michael.riesch@collabora.com,
	xuhf@rock-chips.com,
	stefan.klug@ideasonboard.com,
	kieran.bingham@ideasonboard.com,
	dan.scally@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hverkuil+cisco@kernel.org,
	nicolas.dufresne@collabora.com,
	ribalda@chromium.org,
	sakari.ailus@linux.intel.com
Subject: [RFC PATCH 6/6] media: rkisp2: Implement inline mode
Date: Fri, 19 Jun 2026 14:26:33 +0900
Message-ID: <20260619052637.1110672-7-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260619052637.1110672-1-paul.elder@ideasonboard.com>
References: <20260619052637.1110672-1-paul.elder@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:paul.elder@ideasonboard.com,m:michael.riesch@collabora.com,m:xuhf@rock-chips.com,m:stefan.klug@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:ribalda@chromium.org,m:sakari.ailus@linux.intel.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65250-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[paul.elder@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul.elder@ideasonboard.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B2FE6A3F2D

Add support to rkisp2 for inline mode. Switching between offline mode
and inline mode is done by disabling/enabling the link between the
rkisp2 and rkcif.

As the link is on a sink pad on rkisp2-isp, rkisp2-dmarx is bypassed in
inline mode, because the v4l2_subdev_call() on the source will go to rkcif
instead of rkisp2-dmarx. Also DMA read only needs to be configured in
offline mode, while in inline mode there is no configuration necessary,
so the change to implement inline mode for rkisp2 is fairly lean.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>

---
Although this patch is meant to serve as an example of how one might
implement inline mode, I think the actual implementation may very well
resemble this. The API for switching between inline mode and offline
is likely to be heavily debated, though that is not a topic for this
series.

Despite it being "just an example", it has been tested and
captures properly, including loading rkcif and rkisp2 in differing
orders, and swapping between offline mode and inline mode (though
capturing in the wrong mode is still a bit problematic).

The shared media graph that was added in an earlier patch has made
media graph manipulation trivial.
---
 .../platform/rockchip/rkisp2/rkisp2-common.h  |   3 +-
 .../platform/rockchip/rkisp2/rkisp2-dev.c     |   6 +-
 .../platform/rockchip/rkisp2/rkisp2-isp.c     | 155 ++++++++++++++----
 3 files changed, 124 insertions(+), 40 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp2/rkisp2-common.h b/drivers/media/platform/rockchip/rkisp2/rkisp2-common.h
index ecf0f5e22064..91ccb84b5a7a 100644
--- a/drivers/media/platform/rockchip/rkisp2/rkisp2-common.h
+++ b/drivers/media/platform/rockchip/rkisp2/rkisp2-common.h
@@ -88,10 +88,11 @@ enum rkisp2_fmt_raw_pat_type {
 
 /* enum for the isp pads */
 enum rkisp2_isp_pad {
-	RKISP2_ISP_PAD_SINK_VIDEO,
+	RKISP2_ISP_PAD_SINK_VIDEO_DMA,
 	RKISP2_ISP_PAD_SINK_PARAMS,
 	RKISP2_ISP_PAD_SOURCE_VIDEO,
 	RKISP2_ISP_PAD_SOURCE_STATS,
+	RKISP2_ISP_PAD_SINK_VIDEO_CIF,
 	RKISP2_ISP_PAD_MAX
 };
 
diff --git a/drivers/media/platform/rockchip/rkisp2/rkisp2-dev.c b/drivers/media/platform/rockchip/rkisp2/rkisp2-dev.c
index f74b7aae3159..2b6b7ee31f1d 100644
--- a/drivers/media/platform/rockchip/rkisp2/rkisp2-dev.c
+++ b/drivers/media/platform/rockchip/rkisp2/rkisp2-dev.c
@@ -117,12 +117,12 @@ static int rkisp2_create_links(struct rkisp2_device *rkisp2)
 		if (i == RKISP2_RAWRD0) {
 			ret = media_create_pad_link(
 				source, 0, &rkisp2->isp.sd.entity,
-				RKISP2_ISP_PAD_SINK_VIDEO,
+				RKISP2_ISP_PAD_SINK_VIDEO_DMA,
 				MEDIA_LNK_FL_ENABLED);
 		} else {
 			ret = media_create_pad_link(source, 0,
 						    &rkisp2->isp.sd.entity,
-						    RKISP2_ISP_PAD_SINK_VIDEO,
+						    RKISP2_ISP_PAD_SINK_VIDEO_DMA,
 						    0);
 		}
 
@@ -150,7 +150,7 @@ static int rkisp2_create_links(struct rkisp2_device *rkisp2)
 
 	ret = media_device_shared_join_link_sink(rkisp2->media_dev, rkisp2->dev,
 						 &rkisp2->isp.sd.entity,
-						 RKISP2_ISP_PAD_SINK_VIDEO, 0);
+						 RKISP2_ISP_PAD_SINK_VIDEO_CIF, 0);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/rockchip/rkisp2/rkisp2-isp.c b/drivers/media/platform/rockchip/rkisp2/rkisp2-isp.c
index 36c1aeed272f..9be5fb4cbd14 100644
--- a/drivers/media/platform/rockchip/rkisp2/rkisp2-isp.c
+++ b/drivers/media/platform/rockchip/rkisp2/rkisp2-isp.c
@@ -24,6 +24,27 @@
 
 #define RKISP2_ISP_DEV_NAME	RKISP2_DRIVER_NAME "_isp"
 
+static u16 rkisp2_isp_get_active_sink_pad(struct rkisp2_isp *isp)
+{
+	struct media_entity *entity = &isp->sd.entity;
+	struct media_link *link;
+
+	list_for_each_entry(link, &entity->links, list) {
+		if (link->sink->entity != entity ||
+		    (link->sink->index != RKISP2_ISP_PAD_SINK_VIDEO_DMA &&
+		     link->sink->index != RKISP2_ISP_PAD_SINK_VIDEO_CIF))
+			continue;
+
+		if (link->flags & MEDIA_LNK_FL_ENABLED) {
+			dev_dbg(isp->rkisp2->dev, "%s: active link is %d\n",
+				__func__, link->sink->index);
+			return link->sink->index;
+		}
+	}
+
+	/* Default to DMA if neither link is active */
+	return RKISP2_ISP_PAD_SINK_VIDEO_DMA;
+}
 
 /* ----------------------------------------------------------------------------
  * Camera Interface registers configurations
@@ -70,9 +91,9 @@ static int rkisp2_config_isp(struct rkisp2_isp *isp,
 	const struct v4l2_rect *sink_crop;
 
 	sink_frm = v4l2_subdev_state_get_format(sd_state,
-						RKISP2_ISP_PAD_SINK_VIDEO);
+						rkisp2_isp_get_active_sink_pad(isp));
 	sink_crop = v4l2_subdev_state_get_crop(sd_state,
-					       RKISP2_ISP_PAD_SINK_VIDEO);
+					       rkisp2_isp_get_active_sink_pad(isp));
 	src_frm = v4l2_subdev_state_get_format(sd_state,
 					       RKISP2_ISP_PAD_SOURCE_VIDEO);
 
@@ -116,6 +137,12 @@ static int rkisp2_config_isp(struct rkisp2_isp *isp,
 	rkisp2_write(rkisp2, RKISP2_CIF_ISP_OUT_H_SIZE, sink_crop->width);
 	rkisp2_write(rkisp2, RKISP2_CIF_ISP_OUT_V_SIZE, sink_crop->height);
 
+	/*
+	 * I think we don't need to configure cif source here because it seems
+	 * like offline mode needs to explicitly configure CSI2RX in offline
+	 * mode, but the default (all zero) is inline mode
+	 */
+
 	irq_mask |= RKISP2_CIF_ISP_FRAME | RKISP2_CIF_ISP_V_START |
 		    RKISP2_CIF_ISP_PIC_SIZE_ERROR;
 	rkisp2_write(rkisp2, RKISP2_CIF_ISP_IMSC, irq_mask);
@@ -273,7 +300,8 @@ static int rkisp2_isp_enum_mbus_code(struct v4l2_subdev *sd,
 	unsigned int i, dir;
 	int pos = 0;
 
-	if (code->pad == RKISP2_ISP_PAD_SINK_VIDEO) {
+	if (code->pad == RKISP2_ISP_PAD_SINK_VIDEO_DMA ||
+	    code->pad == RKISP2_ISP_PAD_SINK_VIDEO_CIF) {
 		dir = RKISP2_ISP_SD_SINK;
 	} else if (code->pad == RKISP2_ISP_PAD_SOURCE_VIDEO) {
 		dir = RKISP2_ISP_SD_SRC;
@@ -322,7 +350,8 @@ static int rkisp2_isp_enum_frame_size(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	if (!(mbus_info->direction & RKISP2_ISP_SD_SINK) &&
-	    fse->pad == RKISP2_ISP_PAD_SINK_VIDEO)
+	     (fse->pad == RKISP2_ISP_PAD_SINK_VIDEO_DMA ||
+	      fse->pad == RKISP2_ISP_PAD_SINK_VIDEO_CIF))
 		return -EINVAL;
 
 	if (!(mbus_info->direction & RKISP2_ISP_SD_SRC) &&
@@ -337,15 +366,14 @@ static int rkisp2_isp_enum_frame_size(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int rkisp2_isp_init_state(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_state *sd_state)
+static void rkisp2_isp_init_state_sink(struct v4l2_subdev_state *sd_state,
+				       u16 pad)
 {
-	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
-	struct v4l2_rect *sink_crop, *src_crop;
+	struct v4l2_mbus_framefmt *sink_fmt;
+	struct v4l2_rect *sink_crop;
+
+	sink_fmt = v4l2_subdev_state_get_format(sd_state, pad);
 
-	/* Video. */
-	sink_fmt = v4l2_subdev_state_get_format(sd_state,
-						RKISP2_ISP_PAD_SINK_VIDEO);
 	sink_fmt->width = RKISP2_DEFAULT_WIDTH;
 	sink_fmt->height = RKISP2_DEFAULT_HEIGHT;
 	sink_fmt->field = V4L2_FIELD_NONE;
@@ -355,13 +383,27 @@ static int rkisp2_isp_init_state(struct v4l2_subdev *sd,
 	sink_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
 	sink_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
 
-	sink_crop = v4l2_subdev_state_get_crop(sd_state,
-					       RKISP2_ISP_PAD_SINK_VIDEO);
+	sink_crop = v4l2_subdev_state_get_crop(sd_state, pad);
 	sink_crop->width = RKISP2_DEFAULT_WIDTH;
 	sink_crop->height = RKISP2_DEFAULT_HEIGHT;
 	sink_crop->left = 0;
 	sink_crop->top = 0;
+}
+
+static int rkisp2_isp_init_state(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state)
+{
+	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
+	struct v4l2_rect *sink_crop, *src_crop;
+
+	/* Video. */
+	rkisp2_isp_init_state_sink(sd_state, RKISP2_ISP_PAD_SINK_VIDEO_DMA);
+	rkisp2_isp_init_state_sink(sd_state, RKISP2_ISP_PAD_SINK_VIDEO_CIF);
 
+	sink_fmt = v4l2_subdev_state_get_format(sd_state,
+						RKISP2_ISP_PAD_SINK_VIDEO_DMA);
+	sink_crop = v4l2_subdev_state_get_crop(sd_state,
+					       RKISP2_ISP_PAD_SINK_VIDEO_DMA);
 	src_fmt = v4l2_subdev_state_get_format(sd_state,
 					       RKISP2_ISP_PAD_SOURCE_VIDEO);
 	*src_fmt = *sink_fmt;
@@ -390,7 +432,7 @@ static void rkisp2_isp_set_src_fmt(struct rkisp2_isp *isp,
 	bool set_csc;
 
 	sink_fmt = v4l2_subdev_state_get_format(sd_state,
-						RKISP2_ISP_PAD_SINK_VIDEO);
+						rkisp2_isp_get_active_sink_pad(isp));
 	src_fmt = v4l2_subdev_state_get_format(sd_state,
 					       RKISP2_ISP_PAD_SOURCE_VIDEO);
 	src_crop = v4l2_subdev_state_get_crop(sd_state,
@@ -490,7 +532,7 @@ static void rkisp2_isp_set_src_crop(struct rkisp2_isp *isp,
 	src_crop = v4l2_subdev_state_get_crop(sd_state,
 					      RKISP2_ISP_PAD_SOURCE_VIDEO);
 	sink_crop = v4l2_subdev_state_get_crop(sd_state,
-					       RKISP2_ISP_PAD_SINK_VIDEO);
+					       rkisp2_isp_get_active_sink_pad(isp));
 
 	src_crop->left = ALIGN(r->left, 2);
 	src_crop->width = ALIGN(r->width, 2);
@@ -508,15 +550,13 @@ static void rkisp2_isp_set_src_crop(struct rkisp2_isp *isp,
 
 static void rkisp2_isp_set_sink_crop(struct rkisp2_isp *isp,
 				     struct v4l2_subdev_state *sd_state,
-				     struct v4l2_rect *r)
+				     struct v4l2_rect *r, u16 pad)
 {
 	struct v4l2_rect *sink_crop, *src_crop;
 	const struct v4l2_mbus_framefmt *sink_fmt;
 
-	sink_crop = v4l2_subdev_state_get_crop(sd_state,
-					       RKISP2_ISP_PAD_SINK_VIDEO);
-	sink_fmt = v4l2_subdev_state_get_format(sd_state,
-						RKISP2_ISP_PAD_SINK_VIDEO);
+	sink_crop = v4l2_subdev_state_get_crop(sd_state, pad);
+	sink_fmt = v4l2_subdev_state_get_format(sd_state, pad);
 
 	sink_crop->left = ALIGN(r->left, 2);
 	sink_crop->width = ALIGN(r->width, 2);
@@ -534,15 +574,14 @@ static void rkisp2_isp_set_sink_crop(struct rkisp2_isp *isp,
 
 static void rkisp2_isp_set_sink_fmt(struct rkisp2_isp *isp,
 				    struct v4l2_subdev_state *sd_state,
-				    struct v4l2_mbus_framefmt *format)
+				    struct v4l2_mbus_framefmt *format, u16 pad)
 {
 	const struct rkisp2_mbus_info *mbus_info;
 	struct v4l2_mbus_framefmt *sink_fmt;
 	struct v4l2_rect *sink_crop;
 	bool is_yuv;
 
-	sink_fmt = v4l2_subdev_state_get_format(sd_state,
-						RKISP2_ISP_PAD_SINK_VIDEO);
+	sink_fmt = v4l2_subdev_state_get_format(sd_state, pad);
 	sink_fmt->code = format->code;
 	mbus_info = rkisp2_mbus_info_get_by_code(sink_fmt->code);
 	if (!mbus_info || !(mbus_info->direction & RKISP2_ISP_SD_SINK)) {
@@ -590,9 +629,8 @@ static void rkisp2_isp_set_sink_fmt(struct rkisp2_isp *isp,
 	*format = *sink_fmt;
 
 	/* Propagate to in crop */
-	sink_crop = v4l2_subdev_state_get_crop(sd_state,
-					       RKISP2_ISP_PAD_SINK_VIDEO);
-	rkisp2_isp_set_sink_crop(isp, sd_state, sink_crop);
+	sink_crop = v4l2_subdev_state_get_crop(sd_state, pad);
+	rkisp2_isp_set_sink_crop(isp, sd_state, sink_crop, pad);
 }
 
 static int rkisp2_isp_set_fmt(struct v4l2_subdev *sd,
@@ -601,8 +639,9 @@ static int rkisp2_isp_set_fmt(struct v4l2_subdev *sd,
 {
 	struct rkisp2_isp *isp = to_rkisp2_isp(sd);
 
-	if (fmt->pad == RKISP2_ISP_PAD_SINK_VIDEO)
-		rkisp2_isp_set_sink_fmt(isp, sd_state, &fmt->format);
+	if (fmt->pad == RKISP2_ISP_PAD_SINK_VIDEO_DMA ||
+	    fmt->pad == RKISP2_ISP_PAD_SINK_VIDEO_CIF)
+		rkisp2_isp_set_sink_fmt(isp, sd_state, &fmt->format, fmt->pad);
 	else if (fmt->pad == RKISP2_ISP_PAD_SOURCE_VIDEO)
 		rkisp2_isp_set_src_fmt(isp, sd_state, &fmt->format);
 	else
@@ -619,12 +658,14 @@ static int rkisp2_isp_get_selection(struct v4l2_subdev *sd,
 	int ret = 0;
 
 	if (sel->pad != RKISP2_ISP_PAD_SOURCE_VIDEO &&
-	    sel->pad != RKISP2_ISP_PAD_SINK_VIDEO)
+	    sel->pad != RKISP2_ISP_PAD_SINK_VIDEO_DMA &&
+	    sel->pad != RKISP2_ISP_PAD_SINK_VIDEO_CIF)
 		return -EINVAL;
 
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP_BOUNDS:
-		if (sel->pad == RKISP2_ISP_PAD_SINK_VIDEO) {
+		if (sel->pad == RKISP2_ISP_PAD_SINK_VIDEO_DMA ||
+		    sel->pad == RKISP2_ISP_PAD_SINK_VIDEO_CIF) {
 			struct v4l2_mbus_framefmt *fmt;
 
 			fmt = v4l2_subdev_state_get_format(sd_state, sel->pad);
@@ -634,7 +675,7 @@ static int rkisp2_isp_get_selection(struct v4l2_subdev *sd,
 			sel->r.top = 0;
 		} else {
 			sel->r = *v4l2_subdev_state_get_crop(sd_state,
-							     RKISP2_ISP_PAD_SINK_VIDEO);
+							     RKISP2_ISP_PAD_SINK_VIDEO_DMA);
 		}
 		break;
 
@@ -663,8 +704,9 @@ static int rkisp2_isp_set_selection(struct v4l2_subdev *sd,
 	dev_dbg(isp->rkisp2->dev, "%s: pad: %d sel(%d,%d)/%ux%u\n", __func__,
 		sel->pad, sel->r.left, sel->r.top, sel->r.width, sel->r.height);
 
-	if (sel->pad == RKISP2_ISP_PAD_SINK_VIDEO)
-		rkisp2_isp_set_sink_crop(isp, sd_state, &sel->r);
+	if (sel->pad == RKISP2_ISP_PAD_SINK_VIDEO_DMA ||
+	    sel->pad == RKISP2_ISP_PAD_SINK_VIDEO_CIF)
+		rkisp2_isp_set_sink_crop(isp, sd_state, &sel->r, sel->pad);
 	else if (sel->pad == RKISP2_ISP_PAD_SOURCE_VIDEO)
 		rkisp2_isp_set_src_crop(isp, sd_state, &sel->r);
 	else
@@ -678,6 +720,46 @@ static int rkisp2_subdev_link_validate(struct media_link *link)
 	return v4l2_subdev_link_validate(link);
 }
 
+static int rkisp2_subdev_link_setup(struct media_entity *entity,
+				    const struct media_pad *local_pad,
+				    const struct media_pad *remote_pad, u32 flags)
+{
+	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
+	struct rkisp2_isp *isp = to_rkisp2_isp(sd);
+	struct media_link *link;
+	u16 other_sink_pad_index; 
+
+	dev_dbg(isp->rkisp2->dev, "link setup %s -> %s\n", remote_pad->entity->name,
+		local_pad->entity->name);
+
+	/* We only care about links being created on a sink pad */
+	if (!(flags & MEDIA_LNK_FL_ENABLED) ||
+	    !(local_pad->flags & MEDIA_PAD_FL_SINK) ||
+	    (local_pad->index != RKISP2_ISP_PAD_SINK_VIDEO_DMA &&
+	     local_pad->index != RKISP2_ISP_PAD_SINK_VIDEO_CIF))
+		return 0;
+
+	other_sink_pad_index =
+		local_pad->index == RKISP2_ISP_PAD_SINK_VIDEO_DMA ?
+				    RKISP2_ISP_PAD_SINK_VIDEO_CIF :
+				    RKISP2_ISP_PAD_SINK_VIDEO_DMA;
+
+	list_for_each_entry(link, &entity->links, list) {
+		if (link->sink->entity != local_pad->entity ||
+		    link->sink->index != other_sink_pad_index)
+			continue;
+
+		/*
+		 * If we are trying to enable DMA sink pad but the CIF
+		 * sink pad (and vice versa) has an enabled link then return
+		 * error
+		 */
+		return link->flags & MEDIA_LNK_FL_ENABLED ? -EBUSY : 0;
+	}
+
+	return 0;
+}
+
 static const struct v4l2_subdev_pad_ops rkisp2_isp_pad_ops = {
 	.enum_mbus_code = rkisp2_isp_enum_mbus_code,
 	.enum_frame_size = rkisp2_isp_enum_frame_size,
@@ -709,7 +791,7 @@ static int rkisp2_isp_s_stream(struct v4l2_subdev *sd, int enable)
 		return 0;
 	}
 
-	sink_pad = &isp->pads[RKISP2_ISP_PAD_SINK_VIDEO];
+	sink_pad = &isp->pads[rkisp2_isp_get_active_sink_pad(isp)];
 	source_pad = media_pad_remote_pad_unique(sink_pad);
 	if (IS_ERR(source_pad)) {
 		dev_dbg(rkisp2->dev, "Failed to get source for ISP: %ld\n",
@@ -769,6 +851,7 @@ static int rkisp2_isp_subs_evt(struct v4l2_subdev *sd, struct v4l2_fh *fh,
 
 static const struct media_entity_operations rkisp2_isp_media_ops = {
 	.link_validate = rkisp2_subdev_link_validate,
+	.link_setup = rkisp2_subdev_link_setup,
 };
 
 static const struct v4l2_subdev_video_ops rkisp2_isp_video_ops = {
@@ -808,8 +891,8 @@ int rkisp2_isp_register(struct rkisp2_device *rkisp2)
 	sd->owner = THIS_MODULE;
 	strscpy(sd->name, RKISP2_ISP_DEV_NAME, sizeof(sd->name));
 
-	pads[RKISP2_ISP_PAD_SINK_VIDEO].flags = MEDIA_PAD_FL_SINK |
-						MEDIA_PAD_FL_MUST_CONNECT;
+	pads[RKISP2_ISP_PAD_SINK_VIDEO_DMA].flags = MEDIA_PAD_FL_SINK;
+	pads[RKISP2_ISP_PAD_SINK_VIDEO_CIF].flags = MEDIA_PAD_FL_SINK;
 	pads[RKISP2_ISP_PAD_SINK_PARAMS].flags = MEDIA_PAD_FL_SINK;
 	pads[RKISP2_ISP_PAD_SOURCE_VIDEO].flags = MEDIA_PAD_FL_SOURCE;
 	pads[RKISP2_ISP_PAD_SOURCE_STATS].flags = MEDIA_PAD_FL_SOURCE;
-- 
2.47.2


