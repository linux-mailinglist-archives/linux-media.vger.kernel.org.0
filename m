Return-Path: <linux-media+bounces-38404-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A410CB10D0E
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 16:19:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B235168CBB
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 14:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FDFA2EAD1A;
	Thu, 24 Jul 2025 14:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rkxFX7sA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA67C2EAB96;
	Thu, 24 Jul 2025 14:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753366267; cv=none; b=e3EDhUaDQ/WqEuOyKiZwQRzDyAVsjyDSKvsI9dvGFlov7q2tphA/myCpj2VE/i6OMzFQP283vqOfummOM8R9IIJTBIioEsBAndVQ4s5yAFAqY4Hi5O8gzCp2QtUYbGmIXWw3bU8JfxwFbu5QdWf1HR9yLxvFWqyuqSVtpjpb6x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753366267; c=relaxed/simple;
	bh=Rakpl27ZFfuZPNzLUJwkywWxLHQibWoreQq3wqBUYHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fZIavhHAbRO3oZLQMrJHxrD5mWt4xUd56LM/QbPR8aJFdLFug4NNqDh5+tAx83xvyirh6MrQX94bTCWaq5lZ5jt5ulxeCeJP17jRa4HxL38nxWb9oxEjucEgbcijhVmky+G19h4G6mMgucNTA8TkCQuIvxlUXNaQdT3QmBigeRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rkxFX7sA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 033AF1E5F;
	Thu, 24 Jul 2025 16:10:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366212;
	bh=Rakpl27ZFfuZPNzLUJwkywWxLHQibWoreQq3wqBUYHs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rkxFX7sAQCEKaPxSPE2/4a3i2tkB56Hv+1ujwS7RD9Hz2U1UnNsTe3uPaUWJH7GW3
	 HLSoIKsGP9BTmJMgra5HH9J+JPKG67vKyeLc9yKfvl8biarE5pljl5KzxoMafsKv4V
	 lyYdm/h4N8Jn+soiQlInnqXT3NrO4mqIbySApqQ0=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 24 Jul 2025 16:10:27 +0200
Subject: [PATCH v2 20/27] media: v4l2-subdev: Validate media links with
 context
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-multicontext-mainline-2025-v2-20-c9b316773486@ideasonboard.com>
References: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
In-Reply-To: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13600;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=Rakpl27ZFfuZPNzLUJwkywWxLHQibWoreQq3wqBUYHs=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7Q/wJzxHEeiOyXCg/K0SW47Nh8MR3vvMnBO
 cFG4qPLsvKJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+0AAKCRByNAaPFqFW
 PPuHD/4vVZqoTvFMhF/X/zg35PTtWILmEfRXKwssYAm/KpZIwVz1sLTkBaU9dzzT1jkTlyhz5no
 QshxJi3xBYeh1ts2t6caLdg0HtEQDkCFCxiubXzZMAIlaCQz8lWdLDR+MT4YOBqc9axvci+beKw
 D9AErFlXR9yeVQ12NlhZdNxokMV8K6hZnfuVaDLfNwKdfHZtb4m6DWbIkPVkZdhXEj42Q3/6MhH
 eUFRq9vpy/5CZ2ttyfekkfaQIKioyDmNND82ORl/14sWqHPIjCsLtLo/E78jaPOiW3Qzs62dEzZ
 V00+PnMfBa1WT1vE3QCTr4/D+aHqCydDzLbv9CUdeSbZHugpTsYFfyxZGgKVJt4TsGVxeUz2rWl
 Q1765PIuZ9HRAB2+iDUec6vLC8jjfgseNvsLP6vcmtRrHgVDKkPGIZe5dBh4SOM/h5Vy3rtzQqR
 7hIzN5p9aboB6k06VHXck1SdYaRclSL6eBTZ8TQ0nZgfrKtrPGhxIJcJRouqua2b+DtBTGfc5X2
 OEQNVa1P4qGwMjW/1m+G+/qrr69QGNPdnBGyW//MyTLRKN5weSbDGrZ7XDiDIsr51cswU+7qoFi
 pnc4qJWgiFNALqvzW1mx+31sU3eEwjTOrNAQ6Ey81QvMtenPikAwXDOYmACc9HfTJsTCRbbKWo4
 e419l8FUQCiX2Yw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The v4l2-subdev.c file provides an helper for subdevs to implement
the media entity .link_validate() operation which can be used by
subdevice drivers.

Provide an 'overload' of the v4l2_subdev_link_validate() function
that supports contexts to be used by context-aware subdev drivers to
implement .link_validate_context().

When v4l2_subdev_link_validate() is used to validate a subdev-to-subdev
link, propagate the media_device_context to all the call chain and
introduce (and use) helpers to get the subdevice state from either the
context or the subdev in case no context is available.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 148 +++++++++++++++++++++++++++-------
 include/media/v4l2-subdev.h           |  34 +++++++-
 2 files changed, 151 insertions(+), 31 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 66c539d880127844893620d325a2b05ac4aa9e96..59f42a3a9755a77ea74442605dbbc2af1b67a0ea 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1460,6 +1460,71 @@ int v4l2_subdev_get_fwnode_pad_1_to_1(struct media_entity *entity,
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_get_fwnode_pad_1_to_1);
 
+/*
+ * Retrieve the subdevice state from the media device context or,
+ * if there is no context, use the active state from the subdevice.
+ *
+ * These three functions wraps the usual subdev state helpers:
+ *
+ * - get_unlocked
+ * - get_locked
+ * - lock_and_get
+ */
+
+static struct v4l2_subdev_state *
+v4l2_subdev_get_unlocked_state_from_mdev_ctx(struct v4l2_subdev *sd,
+					     struct media_device_context *mdev_ctx)
+{
+	struct v4l2_subdev_context *ctx = NULL;
+
+	if (mdev_ctx) {
+		ctx =  v4l2_subdev_context_get(mdev_ctx, sd);
+		if (WARN_ON(!ctx))
+			return NULL;
+	}
+
+	if (ctx)
+		return v4l2_subdev_get_unlocked_active_state(ctx);
+
+	return v4l2_subdev_get_unlocked_active_state(sd);
+}
+
+static struct v4l2_subdev_state *
+v4l2_subdev_get_locked_state_from_mdev_ctx(struct v4l2_subdev *sd,
+					   struct media_device_context *mdev_ctx)
+{
+	struct v4l2_subdev_context *ctx = NULL;
+
+	if (mdev_ctx) {
+		ctx =  v4l2_subdev_context_get(mdev_ctx, sd);
+		if (WARN_ON(!ctx))
+			return NULL;
+	}
+
+	if (ctx)
+		return v4l2_subdev_get_locked_active_state(ctx);
+
+	return v4l2_subdev_get_locked_active_state(sd);
+}
+
+static struct v4l2_subdev_state *
+v4l2_subdev_lock_and_get_state_from_mdev_ctx(struct v4l2_subdev *sd,
+					     struct media_device_context *mdev_ctx)
+{
+	struct v4l2_subdev_context *ctx = NULL;
+
+	if (mdev_ctx) {
+		ctx =  v4l2_subdev_context_get(mdev_ctx, sd);
+		if (WARN_ON(!ctx))
+			return NULL;
+	}
+
+	if (ctx)
+		return v4l2_subdev_lock_and_get_active_state(ctx);
+
+	return v4l2_subdev_lock_and_get_active_state(sd);
+}
+
 int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
 				      struct media_link *link,
 				      struct v4l2_subdev_format *source_fmt,
@@ -1518,8 +1583,9 @@ int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
 EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate_default);
 
 static int
-v4l2_subdev_link_validate_get_format(struct media_pad *pad, u32 stream,
-				     struct v4l2_subdev_format *fmt,
+v4l2_subdev_link_validate_get_format(struct media_pad *pad,
+				     struct media_device_context *mdev_context,
+				     u32 stream, struct v4l2_subdev_format *fmt,
 				     bool states_locked)
 {
 	struct v4l2_subdev_state *state;
@@ -1533,9 +1599,11 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad, u32 stream,
 	fmt->stream = stream;
 
 	if (states_locked)
-		state = v4l2_subdev_get_locked_active_state(sd);
+		state = v4l2_subdev_get_locked_state_from_mdev_ctx(sd,
+								mdev_context);
 	else
-		state = v4l2_subdev_lock_and_get_active_state(sd);
+		state = v4l2_subdev_lock_and_get_state_from_mdev_ctx(sd,
+								mdev_context);
 
 	ret = v4l2_subdev_call(sd, pad, get_fmt, state, fmt);
 
@@ -1548,6 +1616,7 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad, u32 stream,
 #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
 
 static void __v4l2_link_validate_get_streams(struct media_pad *pad,
+					     struct media_device_context *mdev_context,
 					     u64 *streams_mask,
 					     bool states_locked)
 {
@@ -1560,10 +1629,11 @@ static void __v4l2_link_validate_get_streams(struct media_pad *pad,
 	*streams_mask = 0;
 
 	if (states_locked)
-		state = v4l2_subdev_get_locked_active_state(subdev);
+		state = v4l2_subdev_get_locked_state_from_mdev_ctx(subdev,
+								mdev_context);
 	else
-		state = v4l2_subdev_lock_and_get_active_state(subdev);
-
+		state = v4l2_subdev_lock_and_get_state_from_mdev_ctx(subdev,
+								mdev_context);
 	if (WARN_ON(!state))
 		return;
 
@@ -1592,6 +1662,7 @@ static void __v4l2_link_validate_get_streams(struct media_pad *pad,
 #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
 
 static void v4l2_link_validate_get_streams(struct media_pad *pad,
+					   struct media_device_context *mdev_context,
 					   u64 *streams_mask,
 					   bool states_locked)
 {
@@ -1604,14 +1675,17 @@ static void v4l2_link_validate_get_streams(struct media_pad *pad,
 	}
 
 #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
-	__v4l2_link_validate_get_streams(pad, streams_mask, states_locked);
+	__v4l2_link_validate_get_streams(pad, mdev_context, streams_mask,
+					 states_locked);
 #else
 	/* This shouldn't happen */
 	*streams_mask = 0;
 #endif
 }
 
-static int v4l2_subdev_link_validate_locked(struct media_link *link, bool states_locked)
+static int v4l2_subdev_link_validate_locked(struct media_link *link,
+					    struct media_device_context *mdev_context,
+					    bool states_locked)
 {
 	struct v4l2_subdev *sink_subdev =
 		media_entity_to_v4l2_subdev(link->sink->entity);
@@ -1626,8 +1700,10 @@ static int v4l2_subdev_link_validate_locked(struct media_link *link, bool states
 		link->source->entity->name, link->source->index,
 		link->sink->entity->name, link->sink->index);
 
-	v4l2_link_validate_get_streams(link->source, &source_streams_mask, states_locked);
-	v4l2_link_validate_get_streams(link->sink, &sink_streams_mask, states_locked);
+	v4l2_link_validate_get_streams(link->source, mdev_context,
+				       &source_streams_mask, states_locked);
+	v4l2_link_validate_get_streams(link->sink, mdev_context,
+				       &sink_streams_mask, states_locked);
 
 	/*
 	 * It is ok to have more source streams than sink streams as extra
@@ -1654,7 +1730,8 @@ static int v4l2_subdev_link_validate_locked(struct media_link *link, bool states
 			link->source->entity->name, link->source->index, stream,
 			link->sink->entity->name, link->sink->index, stream);
 
-		ret = v4l2_subdev_link_validate_get_format(link->source, stream,
+		ret = v4l2_subdev_link_validate_get_format(link->source,
+							   mdev_context, stream,
 							   &source_fmt, states_locked);
 		if (ret < 0) {
 			dev_dbg(dev,
@@ -1664,7 +1741,8 @@ static int v4l2_subdev_link_validate_locked(struct media_link *link, bool states
 			continue;
 		}
 
-		ret = v4l2_subdev_link_validate_get_format(link->sink, stream,
+		ret = v4l2_subdev_link_validate_get_format(link->sink,
+							   mdev_context, stream,
 							   &sink_fmt, states_locked);
 		if (ret < 0) {
 			dev_dbg(dev,
@@ -1693,7 +1771,8 @@ static int v4l2_subdev_link_validate_locked(struct media_link *link, bool states
 	return 0;
 }
 
-int v4l2_subdev_link_validate(struct media_link *link)
+int __v4l2_subdev_link_validate(struct media_link *link,
+				struct media_device_context *mdev_context)
 {
 	struct v4l2_subdev *source_sd, *sink_sd;
 	struct v4l2_subdev_state *source_state, *sink_state;
@@ -1716,28 +1795,35 @@ int v4l2_subdev_link_validate(struct media_link *link)
 	if (is_media_entity_v4l2_video_device(link->source->entity)) {
 		struct media_entity *source = link->source->entity;
 
-		if (!source->ops || !source->ops->link_validate) {
+		if (!source->ops ||
+		    (mdev_context && !source->ops->link_validate_context) ||
+		    (!mdev_context && !source->ops->link_validate)) {
 			/*
-			 * Many existing drivers do not implement the required
-			 * .link_validate() operation for their video devices.
-			 * Print a warning to get the drivers fixed, and return
-			 * 0 to avoid breaking userspace. This should
-			 * eventually be turned into a WARN_ON() when all
-			 * drivers will have been fixed.
+			 * Many existing drivers do not implement the correct
+			 * .link_validate() or .link_validate_context()
+			 * operations for their video devices. Print a warning
+			 * to get the drivers fixed, and return 0 to avoid
+			 * breaking userspace. This should eventually be turned
+			 * into a WARN_ON() when all drivers will have been
+			 * fixed.
 			 */
-			pr_warn_once("video device '%s' does not implement .link_validate(), driver bug!\n",
+			pr_warn_once("video device '%s' does not implement the correct .link_validate operation: driver bug!\n",
 				     source->name);
 			return 0;
 		}
 
 		/*
 		 * Avoid infinite loops in case a video device incorrectly uses
-		 * this helper function as its .link_validate() handler.
+		 * this helper function as its .link_validate[_context]()
+		 * handler.
 		 */
-		if (WARN_ON(source->ops->link_validate == v4l2_subdev_link_validate))
+		if (WARN_ON(source->ops->link_validate == v4l2_subdev_link_validate ||
+			    source->ops->link_validate_context == v4l2_subdev_link_validate_context))
 			return -EINVAL;
 
-		return source->ops->link_validate(link);
+		return (mdev_context && source->ops->link_validate_context) ?
+		       source->ops->link_validate_context(link, mdev_context) :
+		       source->ops->link_validate(link);
 	}
 
 	/*
@@ -1750,22 +1836,24 @@ int v4l2_subdev_link_validate(struct media_link *link)
 	sink_sd = media_entity_to_v4l2_subdev(link->sink->entity);
 	source_sd = media_entity_to_v4l2_subdev(link->source->entity);
 
-	sink_state = v4l2_subdev_get_unlocked_active_state(sink_sd);
-	source_state = v4l2_subdev_get_unlocked_active_state(source_sd);
-
+	sink_state = v4l2_subdev_get_unlocked_state_from_mdev_ctx(sink_sd,
+								  mdev_context);
+	source_state = v4l2_subdev_get_unlocked_state_from_mdev_ctx(source_sd,
+								    mdev_context);
 	states_locked = sink_state && source_state;
 
 	if (states_locked)
 		v4l2_subdev_lock_states(sink_state, source_state);
 
-	ret = v4l2_subdev_link_validate_locked(link, states_locked);
+	ret = v4l2_subdev_link_validate_locked(link, mdev_context, states_locked);
 
 	if (states_locked)
 		v4l2_subdev_unlock_states(sink_state, source_state);
 
 	return ret;
+
 }
-EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate);
+EXPORT_SYMBOL_GPL(__v4l2_subdev_link_validate);
 
 bool v4l2_subdev_has_pad_interdep(struct media_entity *entity,
 				  unsigned int pad0, unsigned int pad1)
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 8087c0ae3bc0a0a95512b4b0ff5257522a104ca0..16b6b265e711cf2293ce2478ef90a622beb869e5 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1223,6 +1223,7 @@ struct v4l2_subdev {
  * @vfh: pointer to &struct v4l2_fh
  * @state: pointer to &struct v4l2_subdev_state
  * @owner: module pointer to the owner of this file handle
+ * @context: pointer to subdevice context associated with the file handle
  * @client_caps: bitmask of ``V4L2_SUBDEV_CLIENT_CAP_*``
  */
 struct v4l2_subdev_fh {
@@ -1351,6 +1352,9 @@ int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
 				      struct v4l2_subdev_format *source_fmt,
 				      struct v4l2_subdev_format *sink_fmt);
 
+int __v4l2_subdev_link_validate(struct media_link *link,
+				struct media_device_context *mdev_context);
+
 /**
  * v4l2_subdev_link_validate - validates a media link
  *
@@ -1368,7 +1372,35 @@ int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
  * the video devices also implement their &media_entity_ops.link_validate
  * operation.
  */
-int v4l2_subdev_link_validate(struct media_link *link);
+static inline int v4l2_subdev_link_validate(struct media_link *link)
+{
+	return __v4l2_subdev_link_validate(link, NULL);
+}
+
+/**
+ * v4l2_subdev_link_validate_context - validates a media link in a media context
+ *
+ * @link: pointer to &struct media_link
+ * @mdev_context: the media device context
+ *
+ * This function calls the subdev's link_validate_context ops to validate
+ * if a media link is valid for streaming in a media device context. It also
+ * internally calls v4l2_subdev_link_validate_default() to ensure that width,
+ * height and the media bus pixel code are equal on both source and sink of the
+ * link.
+ *
+ * The function can be used as a drop-in &media_entity_ops.link_validate_context
+ * implementation for v4l2_subdev instances. It supports all links between
+ * subdevs, as well as links between subdevs and video devices, provided that
+ * the video devices also implement their
+ * &media_entity_ops.link_validate_context operation.
+ */
+static inline int
+v4l2_subdev_link_validate_context(struct media_link *link,
+				  struct media_device_context *mdev_context)
+{
+	return __v4l2_subdev_link_validate(link, mdev_context);
+}
 
 /**
  * v4l2_subdev_has_pad_interdep - MC has_pad_interdep implementation for subdevs

-- 
2.49.0


