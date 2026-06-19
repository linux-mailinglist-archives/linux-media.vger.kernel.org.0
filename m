Return-Path: <linux-media+bounces-65249-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lFU5G5zTNGqthwYAu9opvQ
	(envelope-from <linux-media+bounces-65249-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 07:29:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE116A3F3E
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 07:28:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b="evX/gTg6";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65249-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65249-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5ABE930D62D8
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 05:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8246E332EBB;
	Fri, 19 Jun 2026 05:27:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29C331E825;
	Fri, 19 Jun 2026 05:27:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781846844; cv=none; b=Y6Vpd8BD7+hnUOed5TJATHn4ASVGENH1yln7B1f2OcSD47RO3s6gZ7HM6m1CMsztiLGjLv9vVMdTZk5tKZl5B/1UipPqf1TmofS3/5Q/zz3LPSzmDbTg1me0gr1P8/yP6VJvTJ2VxrdDiGfTrWEVCgNobJY+z38FuEz5aL/rstM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781846844; c=relaxed/simple;
	bh=wiX5XaCaBNr256fwOJs6Ea1Lt3QH3EzRDHU1rqy+XtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kzx3YHEJTloiv5ZcRkf+BQmBTl+qMCsRi4idCjAmpMn9KnQ9YtE0+HbMaI832oblUBCR77XV91buHOUYfRzjXYLBBYj1eWvW79j7jLbyOVhoGh5CqISJoYtV/1712ufRy1z74XaIqjxlz3Upl0Re7xjPtO0TZQp95s86MB8jXYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=evX/gTg6; arc=none smtp.client-ip=213.167.242.64
Received: from neptunite.hamster-moth.ts.net (unknown [IPv6:2404:7a81:160:2100:327:f131:c148:b7f8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 29A9816CB;
	Fri, 19 Jun 2026 07:26:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781846806;
	bh=wiX5XaCaBNr256fwOJs6Ea1Lt3QH3EzRDHU1rqy+XtE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=evX/gTg6lLVok8xZT6B4kn0PscJF4fsBEbXpAgfr7leUwba3mb47cqk+/VQW9Dpbu
	 OvIyfeG8EpEBrwbEcZexZmpAJx2oormEjmeo8SonqTbH+QZnqZMLKSRB5/QxAotJVY
	 F7bbQdHhbi6haO7TEgWRNCe1Rr0EyV3vzcDlAPRE=
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
Subject: [RFC PATCH 5/6] media: rkcif: Implement inline mode
Date: Fri, 19 Jun 2026 14:26:32 +0900
Message-ID: <20260619052637.1110672-6-paul.elder@ideasonboard.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-65249-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[paul.elder@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:paul.elder@ideasonboard.com,m:michael.riesch@collabora.com,m:xuhf@rock-chips.com,m:stefan.klug@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:ribalda@chromium.org,m:sakari.ailus@linux.intel.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DAE116A3F3E

Add support to the rkcif for inline mode. Switching between offline mode
and inline mode is done by disabling/enabling the link between the rkcif
and rkisp2.

As the link is on a source pad on rkcif-interface, rkcif-mipi is
bypassed. This is why s_stream is implemented for rkcif_interface and it
calls enable_streams on the remote on the sink pad. Also since
rkcif_mipi_isr is called unconditionally it is skipped when in inline
mode.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>

---
This patch is meant to serve as an example of how one might implement
inline mode. Despite it being "just an example", it has been tested and
captures properly, including loading rkcif and rkisp2 in differing
orders, and swapping between offline mode and inline mode (though
capturing in the wrong mode is still a bit problematic).

The shared media graph that was added in an earlier patch has made media
graph manipulation a non-issue. Although the API for switching between
inline mode and offline can be debated (here it is done with link
manipulation via link_setup), that is not a relevant topic for this
series.
---
 .../rockchip/rkcif/rkcif-capture-dvp.c        |   2 +-
 .../rockchip/rkcif/rkcif-capture-mipi.c       |   3 +
 .../platform/rockchip/rkcif/rkcif-common.h    |  16 +-
 .../platform/rockchip/rkcif/rkcif-interface.c | 240 +++++++++++++++++-
 .../platform/rockchip/rkcif/rkcif-regs.h      |  49 ++++
 .../platform/rockchip/rkcif/rkcif-stream.c    |   6 +-
 6 files changed, 301 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c
index dbaf7636aeeb..6aa1031ac330 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c
@@ -666,7 +666,7 @@ static int rkcif_dvp_start_streaming(struct rkcif_stream *stream)
 	int ret = -EINVAL;
 
 	state = v4l2_subdev_lock_and_get_active_state(&interface->sd);
-	source_fmt = v4l2_subdev_state_get_format(state, RKCIF_IF_PAD_SRC,
+	source_fmt = v4l2_subdev_state_get_format(state, RKCIF_IF_PAD_SRC_DMA,
 						  stream->id);
 	if (!source_fmt)
 		goto out;
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
index bc9518f8db50..50050cfa83b0 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
@@ -821,6 +821,9 @@ irqreturn_t rkcif_mipi_isr(int irq, void *ctx)
 		enum rkcif_interface_index index = RKCIF_MIPI_BASE + i;
 		struct rkcif_interface *interface = &rkcif->interfaces[index];
 
+		if (interface->inline_mode)
+			continue;
+
 		intstat = rkcif_mipi_read(interface, RKCIF_MIPI_INTSTAT);
 		rkcif_mipi_write(interface, RKCIF_MIPI_INTSTAT, intstat);
 
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-common.h b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
index f2989d152ba2..cf9322cae7a9 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-common.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
@@ -58,7 +58,8 @@ enum rkcif_interface_index {
 
 enum rkcif_interface_pad_index {
 	RKCIF_IF_PAD_SINK,
-	RKCIF_IF_PAD_SRC,
+	RKCIF_IF_PAD_SRC_DMA,
+	RKCIF_IF_PAD_SRC_TOISP,
 	RKCIF_IF_PAD_MAX
 };
 
@@ -194,6 +195,8 @@ struct rkcif_interface {
 	struct v4l2_fwnode_endpoint vep;
 	struct v4l2_subdev sd;
 
+	bool inline_mode;
+
 	union {
 		struct rkcif_dvp dvp;
 	};
@@ -247,4 +250,15 @@ struct rkcif_device {
 	struct v4l2_async_notifier notifier;
 };
 
+static inline void
+rkcif_write(struct rkcif_device *rkcif, unsigned int addr, u32 val)
+{
+	writel(val, rkcif->base_addr + addr);
+}
+
+static inline u32 rkcif_read(struct rkcif_device *rkcif, unsigned int addr)
+{
+	return readl(rkcif->base_addr + addr);
+}
+
 #endif
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-interface.c b/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
index cd791186f224..568835e47f92 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
@@ -6,6 +6,8 @@
  * Copyright (C) 2025 Collabora, Ltd.
  */
 
+#include <linux/pm_runtime.h>
+
 #include <media/mc-shared-graph.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-fwnode.h>
@@ -20,8 +22,118 @@ static inline struct rkcif_interface *to_rkcif_interface(struct v4l2_subdev *sd)
 	return container_of(sd, struct rkcif_interface, sd);
 }
 
+static u16 rkcif_interface_get_active_source_pad(struct rkcif_interface *interface)
+{
+	struct media_entity *entity = &interface->sd.entity;
+	struct media_link *link;
+
+	list_for_each_entry(link, &entity->links, list) {
+		if (link->source->entity != entity ||
+		    (link->source->index != RKCIF_IF_PAD_SRC_DMA &&
+		     link->source->index != RKCIF_IF_PAD_SRC_TOISP))
+			continue;
+
+		if (link->flags & MEDIA_LNK_FL_ENABLED) {
+			dev_dbg(interface->rkcif->dev, "%s: active link is %d\n",
+				__func__, link->source->index);
+			return link->source->index;
+		}
+	}
+
+	/* Default to DMA if neither link is active */
+	return RKCIF_IF_PAD_SRC_DMA;
+}
+
+static u32 rkcif_interface_mipi_dt(u32 fourcc)
+{
+	switch (fourcc) {
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+		return RKCIF_CSI2_DT_RAW8;
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+		return RKCIF_CSI2_DT_RAW10;
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+	case MEDIA_BUS_FMT_SGBRG12_1X12:
+	case MEDIA_BUS_FMT_SGRBG12_1X12:
+		return RKCIF_CSI2_DT_RAW12;
+	default:
+		return RKCIF_CSI2_DT_RAW10;
+	}
+}
+
+static u32 rkcif_interface_mipi_parse_type(u32 fourcc)
+{
+	switch (fourcc) {
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+		return RKCIF_MIPI_PARSE_TYPE_RAW8_RGB888;
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+		return RKCIF_MIPI_PARSE_TYPE_RAW10;
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+	case MEDIA_BUS_FMT_SGBRG12_1X12:
+	case MEDIA_BUS_FMT_SGRBG12_1X12:
+		return RKCIF_MIPI_PARSE_TYPE_RAW12;
+	default:
+		return RKCIF_MIPI_PARSE_TYPE_RAW10;
+	}
+}
+
+static int rkcif_interface_subdev_link_setup(struct media_entity *entity,
+					     const struct media_pad *local_pad,
+					     const struct media_pad *remote_pad,
+					     u32 flags)
+{
+	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
+	struct rkcif_interface *interface = to_rkcif_interface(sd);
+	struct media_link *link;
+	u16 other_source_pad_index; 
+
+	dev_dbg(interface->rkcif->dev, "link setup %s -> %s\n",
+		local_pad->entity->name, remote_pad->entity->name);
+
+	/* We only care about links being created on a source pad */
+	if (!(flags & MEDIA_LNK_FL_ENABLED) ||
+	    !(local_pad->flags & MEDIA_PAD_FL_SOURCE) ||
+	    (local_pad->index != RKCIF_IF_PAD_SRC_DMA &&
+	     local_pad->index != RKCIF_IF_PAD_SRC_TOISP))
+		return 0;
+
+	other_source_pad_index =
+		local_pad->index == RKCIF_IF_PAD_SRC_DMA ?
+				    RKCIF_IF_PAD_SRC_TOISP :
+				    RKCIF_IF_PAD_SRC_DMA;
+
+	list_for_each_entry(link, &entity->links, list) {
+		if (link->source->entity != local_pad->entity ||
+		    link->source->index != other_source_pad_index)
+			continue;
+
+		/*
+		 * If we are trying to enable DMA source pad but the TOISP
+		 * source pad (and vice versa) has an enabled link then return
+		 * error
+		 */
+		return link->flags & MEDIA_LNK_FL_ENABLED ? -EBUSY : 0;
+	}
+
+	return 0;
+}
+
 static const struct media_entity_operations rkcif_interface_media_ops = {
 	.link_validate = v4l2_subdev_link_validate,
+	.link_setup = rkcif_interface_subdev_link_setup,
 	.has_pad_interdep = v4l2_subdev_has_pad_interdep,
 };
 
@@ -37,7 +149,8 @@ static int rkcif_interface_set_fmt(struct v4l2_subdev *sd,
 	int ret;
 
 	/* the format on the source pad always matches the sink pad */
-	if (format->pad == RKCIF_IF_PAD_SRC)
+	if (format->pad == RKCIF_IF_PAD_SRC_DMA ||
+	    format->pad == RKCIF_IF_PAD_SRC_TOISP)
 		return v4l2_subdev_get_fmt(sd, state, format);
 
 	input = rkcif_interface_find_input_fmt(interface, true,
@@ -85,7 +198,8 @@ static int rkcif_interface_get_sel(struct v4l2_subdev *sd,
 	struct v4l2_rect *crop;
 	int ret = 0;
 
-	if (sel->pad != RKCIF_IF_PAD_SRC)
+	if (sel->pad != RKCIF_IF_PAD_SRC_DMA &&
+	    sel->pad != RKCIF_IF_PAD_SRC_TOISP)
 		return -EINVAL;
 
 	sink = v4l2_subdev_state_get_opposite_stream_format(state, sel->pad,
@@ -122,7 +236,8 @@ static int rkcif_interface_set_sel(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *sink, *src;
 	struct v4l2_rect *crop;
 
-	if (sel->pad != RKCIF_IF_PAD_SRC || sel->target != V4L2_SEL_TGT_CROP)
+	if ((sel->pad != RKCIF_IF_PAD_SRC_DMA &&
+	     sel->pad != RKCIF_IF_PAD_SRC_TOISP) || sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
 
 	sink = v4l2_subdev_state_get_opposite_stream_format(state, sel->pad,
@@ -176,7 +291,10 @@ static int rkcif_interface_apply_crop(struct rkcif_stream *stream,
 	struct rkcif_interface *interface = stream->interface;
 	struct v4l2_rect *crop;
 
-	crop = v4l2_subdev_state_get_crop(state, RKCIF_IF_PAD_SRC, stream->id);
+	crop = v4l2_subdev_state_get_crop(
+		state,
+		rkcif_interface_get_active_source_pad(interface),
+		stream->id);
 	if (!crop)
 		return -EINVAL;
 
@@ -195,8 +313,11 @@ static int rkcif_interface_enable_streams(struct v4l2_subdev *sd,
 	struct v4l2_subdev_route *route;
 	struct v4l2_subdev *remote_sd;
 	struct media_pad *remote_pad;
+	u32 active_pad = rkcif_interface_get_active_source_pad(interface);
 	u64 mask;
 
+	interface->inline_mode = (active_pad == RKCIF_IF_PAD_SRC_TOISP);
+
 	remote_pad =
 		media_pad_remote_pad_first(&sd->entity.pads[RKCIF_IF_PAD_SINK]);
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
@@ -213,7 +334,7 @@ static int rkcif_interface_enable_streams(struct v4l2_subdev *sd,
 	}
 
 	mask = v4l2_subdev_state_xlate_streams(state, RKCIF_IF_PAD_SINK,
-					       RKCIF_IF_PAD_SRC, &streams_mask);
+					       active_pad, &streams_mask);
 
 	return v4l2_subdev_enable_streams(remote_sd, remote_pad->index, mask);
 }
@@ -222,6 +343,7 @@ static int rkcif_interface_disable_streams(struct v4l2_subdev *sd,
 					   struct v4l2_subdev_state *state,
 					   u32 pad, u64 streams_mask)
 {
+	struct rkcif_interface *interface = to_rkcif_interface(sd);
 	struct v4l2_subdev *remote_sd;
 	struct media_pad *remote_pad;
 	u64 mask;
@@ -230,8 +352,9 @@ static int rkcif_interface_disable_streams(struct v4l2_subdev *sd,
 		media_pad_remote_pad_first(&sd->entity.pads[RKCIF_IF_PAD_SINK]);
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 
-	mask = v4l2_subdev_state_xlate_streams(state, RKCIF_IF_PAD_SINK,
-					       RKCIF_IF_PAD_SRC, &streams_mask);
+	mask = v4l2_subdev_state_xlate_streams(
+		state, RKCIF_IF_PAD_SINK,
+		rkcif_interface_get_active_source_pad(interface), &streams_mask);
 
 	return v4l2_subdev_disable_streams(remote_sd, remote_pad->index, mask);
 }
@@ -246,7 +369,94 @@ static const struct v4l2_subdev_pad_ops rkcif_interface_pad_ops = {
 	.disable_streams = rkcif_interface_disable_streams,
 };
 
+static int rkcif_interface_s_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct rkcif_interface *interface = to_rkcif_interface(sd);
+	struct rkcif_device *rkcif = interface->rkcif;
+	struct v4l2_subdev_state *state;
+	struct v4l2_subdev *remote_sd;
+	struct media_pad *remote_pad;
+	struct v4l2_rect *crop;
+	struct v4l2_mbus_framefmt *mbus;
+	int ret;
+	u32 active_pad = rkcif_interface_get_active_source_pad(interface);
+	u32 val, crop_val, offset_val;
+
+	interface->inline_mode = (active_pad == RKCIF_IF_PAD_SRC_TOISP);
+
+	remote_pad =
+		media_pad_remote_pad_first(&sd->entity.pads[RKCIF_IF_PAD_SINK]);
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
+	if (!enable) {
+		rkcif_write(rkcif, RKCIF_MIPI2_ID0_CTRL0, 0);
+		rkcif_write(rkcif, RKCIF_MIPI2_CTRL, 0);
+
+		ret = v4l2_subdev_disable_streams(remote_sd, remote_pad->index, 1);
+
+		pm_runtime_put(rkcif->dev);
+		return ret;
+	}
+
+	ret = pm_runtime_resume_and_get(rkcif->dev);
+	if (ret < 0) {
+		dev_err(rkcif->dev, "failed to get runtime pm, %d\n", ret);
+		return ret;
+	}
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	crop = v4l2_subdev_state_get_crop(state, active_pad);
+	mbus = v4l2_subdev_state_get_format(state, active_pad);
+	v4l2_subdev_unlock_state(state);
+
+	/*
+	 * Enable interrupts:
+	 * - toisp0 ch{0,1,2} frame start
+	 * - toisp1 ch{0,1,2} frame start
+	 * - toisp0 ch{0,1,2} frame end
+	 * - toisp1 ch{0,1,2} frame end
+	 * - toisp0 fifo overflow
+	 * - toisp1 fifo overflow
+	 * - axi bus errors
+	 */
+	rkcif_write(rkcif, RKCIF_GLB_INTEN, 0xFFFC003);
+
+	/*
+	 * - Enable toisp ch0
+	 * - Select MIPI2 ID0
+	 */
+	val = 0x01;
+	val |= 8 << 3;
+	rkcif_write(rkcif, RKCIF_TOISP0_CH_CTRL, val);
+
+	crop_val = RKCIF_XY_COORD(3840, 2160);
+	offset_val = RKCIF_XY_COORD(0, 0);
+	if (!!crop) {
+		crop_val = RKCIF_XY_COORD(crop->width, crop->height);
+		offset_val = RKCIF_XY_COORD(crop->left, crop->top);
+	}
+
+	rkcif_write(rkcif, RKCIF_TOISP0_CROP_SIZE, crop_val);
+	rkcif_write(rkcif, RKCIF_TOISP0_CROP_START, offset_val);
+
+	val = rkcif_interface_mipi_parse_type(mbus ? mbus->code : 0);
+	val |= RKCIF_MIPI_DATA_SEL_DT(
+			rkcif_interface_mipi_dt(mbus ? mbus->code : 0));
+	val |= RKCIF_MIPI_CAP_EN;
+
+	rkcif_write(rkcif, RKCIF_MIPI2_ID0_CTRL0, val);
+	rkcif_write(rkcif, RKCIF_MIPI2_ID0_CTRL1, crop_val);
+	rkcif_write(rkcif, RKCIF_MIPI2_CTRL, RKCIF_MIPI_CAP_EN);
+
+	return v4l2_subdev_enable_streams(remote_sd, remote_pad->index, 1);
+}
+
+static const struct v4l2_subdev_video_ops rkcif_interface_video_ops = {
+	.s_stream = rkcif_interface_s_stream,
+};
+
 static const struct v4l2_subdev_ops rkcif_interface_ops = {
+	.video = &rkcif_interface_video_ops,
 	.pad = &rkcif_interface_pad_ops,
 };
 
@@ -258,7 +468,14 @@ static int rkcif_interface_init_state(struct v4l2_subdev *sd,
 		{
 			.sink_pad = RKCIF_IF_PAD_SINK,
 			.sink_stream = 0,
-			.source_pad = RKCIF_IF_PAD_SRC,
+			.source_pad = RKCIF_IF_PAD_SRC_DMA,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+		{
+			.sink_pad = RKCIF_IF_PAD_SINK,
+			.sink_stream = 0,
+			.source_pad = RKCIF_IF_PAD_SRC_TOISP,
 			.source_stream = 0,
 			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
 		},
@@ -373,6 +590,8 @@ int rkcif_interface_register(struct rkcif_device *rkcif,
 	sd->internal_ops = &rkcif_interface_internal_ops;
 	sd->owner = THIS_MODULE;
 
+	interface->inline_mode = false;
+
 	if (interface->type == RKCIF_IF_DVP)
 		snprintf(sd->name, sizeof(sd->name), "rkcif-dvp0");
 	else if (interface->type == RKCIF_IF_MIPI)
@@ -381,7 +600,8 @@ int rkcif_interface_register(struct rkcif_device *rkcif,
 
 	pads[RKCIF_IF_PAD_SINK].flags = MEDIA_PAD_FL_SINK |
 					MEDIA_PAD_FL_MUST_CONNECT;
-	pads[RKCIF_IF_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
+	pads[RKCIF_IF_PAD_SRC_DMA].flags = MEDIA_PAD_FL_SOURCE;
+	pads[RKCIF_IF_PAD_SRC_TOISP].flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&sd->entity, RKCIF_IF_PAD_MAX, pads);
 	if (ret)
 		goto err;
@@ -403,7 +623,7 @@ int rkcif_interface_register(struct rkcif_device *rkcif,
 	ret = media_device_shared_join_link_source(interface->rkcif->media_dev,
 						   interface->rkcif->dev,
 						   &interface->sd.entity,
-						   RKCIF_IF_PAD_SRC,
+						   RKCIF_IF_PAD_SRC_TOISP,
 						   0);
 	if (ret)
 		goto err_subdev_unregister;
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-regs.h b/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
index 3cf7ee19de30..3addd2aac691 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
@@ -150,4 +150,53 @@ enum rkcif_mipi_id_register_index {
 	RKCIF_MIPI_ID_REGISTER_MAX
 };
 
+#define RKCIF_BASE		0x00000000
+#define RKCIF_GLB_CTRL		(RKCIF_BASE + 0x00000000)
+#define RKCIF_GLB_INTEN		(RKCIF_BASE + 0x00000004)
+#define RKCIF_GLB_INTST		(RKCIF_BASE + 0x00000008)
+#define RKCIF_TOISP0_CH_CTRL	(RKCIF_BASE + 0x00000780)
+#define RKCIF_TOISP0_CROP_SIZE	(RKCIF_BASE + 0x00000784)
+#define RKCIF_TOISP0_CROP_START	(RKCIF_BASE + 0x00000788)
+#define RKCIF_TOISP1_CH_CTRL	(RKCIF_BASE + 0x0000078c)
+#define RKCIF_TOISP1_CROP_SIZE	(RKCIF_BASE + 0x00000790)
+#define RKCIF_TOISP1_CROP_START	(RKCIF_BASE + 0x00000794)
+
+#define RKCIF_MIPI2_BASE	(RKCIF_BASE + 0x00000300)
+#define RKCIF_MIPI2_ID0_CTRL0	(RKCIF_MIPI2_BASE + 0x00000000)
+#define RKCIF_MIPI2_ID0_CTRL1	(RKCIF_MIPI2_BASE + 0x00000004)
+#define RKCIF_MIPI2_CTRL	(RKCIF_MIPI2_BASE + 0x00000020)
+
+#define RKCIF_MIPI_CAP_EN			BIT(0)
+#define RKCIF_MIPI_PARSE_TYPE_RAW8_RGB888	(0 << 1)
+#define RKCIF_MIPI_PARSE_TYPE_RAW10		(1 << 1)
+#define RKCIF_MIPI_PARSE_TYPE_RAW12		(2 << 1)
+#define RKCIF_MIPI_PARSE_TYPE_RAW14		(3 << 1)
+#define RKCIF_MIPI_PARSE_TYPE_YUV422_8BIT	(4 << 1)
+#define RKCIF_MIPI_CROP_EN			BIT(4)
+#define RKCIF_MIPI_WDDR_RAW_COMPACT		(0 << 5)
+#define RKCIF_MIPI_WDDR_RAW_UNCOMPACT		(1 << 5)
+#define RKCIF_MIPI_WDDR_YUV_PACKET		(2 << 5)
+#define RKCIF_MIPI_WDDR_YUV400			(3 << 5)
+#define RKCIF_MIPI_WDDR_YUV422SP		(4 << 5)
+#define RKCIF_MIPI_WDDR_YUV420SP		(5 << 5)
+
+/* MIPI_DATA_SEL */
+#define RKCIF_MIPI_DATA_SEL_VC(a)			(((a) & 0x3) << 8)
+#define RKCIF_MIPI_DATA_SEL_DT(a)			(((a) & 0x3F) << 10)
+/* MIPI DATA_TYPE */
+/* These are copied from rkisp2 as they are not in the cif trm */
+#define RKCIF_CSI2_DT_EBD			0x12
+#define RKCIF_CSI2_DT_YUV420_8b			0x18
+#define RKCIF_CSI2_DT_YUV420_10b		0x19
+#define RKCIF_CSI2_DT_YUV422_8b			0x1E
+#define RKCIF_CSI2_DT_YUV422_10b		0x1F
+#define RKCIF_CSI2_DT_RGB565			0x22
+#define RKCIF_CSI2_DT_RGB666			0x23
+#define RKCIF_CSI2_DT_RGB888			0x24
+#define RKCIF_CSI2_DT_RAW8			0x2A
+#define RKCIF_CSI2_DT_RAW10			0x2B
+#define RKCIF_CSI2_DT_RAW12			0x2C
+#define RKCIF_CSI2_DT_RAW16			0x2e
+#define RKCIF_CSI2_DT_SPD			0x2F
+
 #endif
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
index 3130d420ad55..f173657fd2b4 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
@@ -283,7 +283,7 @@ static int rkcif_stream_start_streaming(struct vb2_queue *queue,
 
 	mask = BIT_ULL(stream->id);
 	ret = v4l2_subdev_enable_streams(&stream->interface->sd,
-					 RKCIF_IF_PAD_SRC, mask);
+					 RKCIF_IF_PAD_SRC_DMA, mask);
 	if (ret < 0)
 		goto err_stop_stream;
 
@@ -309,7 +309,7 @@ static void rkcif_stream_stop_streaming(struct vb2_queue *queue)
 	int ret;
 
 	mask = BIT_ULL(stream->id);
-	v4l2_subdev_disable_streams(&stream->interface->sd, RKCIF_IF_PAD_SRC,
+	v4l2_subdev_disable_streams(&stream->interface->sd, RKCIF_IF_PAD_SRC_DMA,
 				    mask);
 
 	stream->stopping = true;
@@ -589,7 +589,7 @@ int rkcif_stream_register(struct rkcif_device *rkcif,
 	if (stream->id == RKCIF_ID0)
 		link_flags |= MEDIA_LNK_FL_ENABLED;
 
-	ret = media_create_pad_link(&interface->sd.entity, RKCIF_IF_PAD_SRC,
+	ret = media_create_pad_link(&interface->sd.entity, RKCIF_IF_PAD_SRC_DMA,
 				    &stream->vdev.entity, 0, link_flags);
 	if (ret) {
 		dev_err(rkcif->dev, "failed to link stream media pad: %d\n",
-- 
2.47.2


