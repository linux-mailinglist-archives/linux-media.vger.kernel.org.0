Return-Path: <linux-media+bounces-61943-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MhzLsftCmo89gQAu9opvQ
	(envelope-from <linux-media+bounces-61943-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:45:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EE556AE67
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:45:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1DAF53067258
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 10:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126AD3EF647;
	Mon, 18 May 2026 10:31:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42EF3ED5B6;
	Mon, 18 May 2026 10:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100270; cv=none; b=hNPb3g+2BF4r1Hb01zzmSNk1FiyzAgNpommSuEz9KIoX+4IX2PFlTxBv/pZDDi9C5LHIjt0q1qoDo+I2337OohFnFIzrTjcQKHAsdaa7OAXdTUZTyJ5O7tpw8N8/VbnK2S8lfWs48tx/YsNKnS7minRNCdzWak/+OCo5dFztU2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100270; c=relaxed/simple;
	bh=pGb0topKOndkQgyiZuK5FBJvTqlPd3JBn9MwPx7o0Wc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zu/15aTAo+HwiokJ76lA3UM0eQ34jRH3Y9TG6/XK75K5qJzjVRyv1qbtn19sO/KqapG2QSNSJJWclvWpdwrS0jVViPOjVvx3VkxWyCXxY4DnPez+XnTP2LSIyyymLP5thUHTga18wWP7L7v6lZ+ePKy69tTBy5ZLh3FxgpaYVkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 63B3A1F8004A;
	Mon, 18 May 2026 10:30:54 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id A99F1B40821; Mon, 18 May 2026 10:30:53 +0000 (UTC)
X-Spam-Level: *
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id A5E0BB407F8;
	Mon, 18 May 2026 10:25:00 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arash Golgol <arash.golgol@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH 11/16] media: sun6i-csi: Tidy up and unify coding style
Date: Mon, 18 May 2026 12:24:46 +0200
Message-ID: <20260518102451.417971-12-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518102451.417971-1-paulk@sys-base.io>
References: <20260518102451.417971-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E7EE556AE67
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61943-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[sys-base.io];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[sys-base.io,kernel.org,gmail.com,sholland.org,linuxfoundation.org,ideasonboard.com,collabora.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,sys-base.io:email,sys-base.io:mid]
X-Rspamd-Action: no action

Bring recent changes to the same coding style as the rest of the driver.
This is purely cosmetic and no functional change is intended.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 16 ++---
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 72 ++++++++++---------
 2 files changed, 46 insertions(+), 42 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
index 43a85bcc2ba2..18f79075d3ad 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
@@ -473,6 +473,7 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev *subdev, int on)
 
 unlock:
 	v4l2_subdev_unlock_state(state);
+
 	return ret;
 }
 
@@ -533,7 +534,7 @@ static int sun6i_csi_bridge_set_fmt(struct v4l2_subdev *subdev,
 				    struct v4l2_subdev_state *state,
 				    struct v4l2_subdev_format *format)
 {
-	struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_mbus_framefmt *mbus_format;
 
 	/* The format on the source pad always matches the sink pad. */
 	if (format->pad != SUN6I_CSI_BRIDGE_PAD_SINK)
@@ -542,12 +543,12 @@ static int sun6i_csi_bridge_set_fmt(struct v4l2_subdev *subdev,
 	sun6i_csi_bridge_mbus_format_prepare(&format->format);
 
 	/* Set the format on the sink pad. */
-	fmt = v4l2_subdev_state_get_format(state, format->pad);
-	*fmt = format->format;
+	mbus_format = v4l2_subdev_state_get_format(state, format->pad);
+	*mbus_format = format->format;
 
 	/* Propagate the format to the source pad. */
-	fmt = v4l2_subdev_state_get_format(state, SUN6I_CSI_BRIDGE_PAD_SOURCE);
-	*fmt = format->format;
+	mbus_format = v4l2_subdev_state_get_format(state, SUN6I_CSI_BRIDGE_PAD_SOURCE);
+	*mbus_format = format->format;
 
 	return 0;
 }
@@ -779,14 +780,12 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev)
 	if (ret < 0)
 		return ret;
 
-	/* V4L2 Subdev finalize */
+	/* V4L2 Subdev */
 
 	ret = v4l2_subdev_init_finalize(subdev);
 	if (ret < 0)
 		goto error_media_entity;
 
-	/* V4L2 Subdev */
-
 	if (csi_dev->isp_available)
 		ret = v4l2_async_register_subdev(subdev);
 	else
@@ -846,7 +845,6 @@ void sun6i_csi_bridge_cleanup(struct sun6i_csi_device *csi_dev)
 	v4l2_async_nf_cleanup(notifier);
 
 	v4l2_device_unregister_subdev(subdev);
-
 	v4l2_subdev_cleanup(subdev);
 
 	media_entity_cleanup(&subdev->entity);
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index 409c28621093..eea682f47eea 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -812,27 +812,6 @@ static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
 	return -EINVAL;
 }
 
-static int sun6i_csi_capture_enum_framesize(struct file *file, void *fh,
-					    struct v4l2_frmsizeenum *fsize)
-{
-	if (fsize->index)
-		return -EINVAL;
-
-	/* Only accept format in map table. */
-	if (!sun6i_csi_capture_format_find(fsize->pixel_format))
-		return -EINVAL;
-
-	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
-	fsize->stepwise.min_width = SUN6I_CSI_CAPTURE_WIDTH_MIN;
-	fsize->stepwise.max_width = SUN6I_CSI_CAPTURE_WIDTH_MAX;
-	fsize->stepwise.min_height = SUN6I_CSI_CAPTURE_HEIGHT_MIN;
-	fsize->stepwise.max_height = SUN6I_CSI_CAPTURE_HEIGHT_MAX;
-	fsize->stepwise.step_width = 2;
-	fsize->stepwise.step_height = 2;
-
-	return 0;
-}
-
 static int sun6i_csi_capture_g_fmt(struct file *file, void *priv,
 				   struct v4l2_format *format)
 {
@@ -867,6 +846,27 @@ static int sun6i_csi_capture_try_fmt(struct file *file, void *priv,
 	return 0;
 }
 
+static int sun6i_csi_capture_enum_framesizes(struct file *file, void *fh,
+					     struct v4l2_frmsizeenum *frmsize)
+{
+	if (frmsize->index)
+		return -EINVAL;
+
+	/* Only accept format in map table. */
+	if (!sun6i_csi_capture_format_find(frmsize->pixel_format))
+		return -EINVAL;
+
+	frmsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	frmsize->stepwise.min_width = SUN6I_CSI_CAPTURE_WIDTH_MIN;
+	frmsize->stepwise.max_width = SUN6I_CSI_CAPTURE_WIDTH_MAX;
+	frmsize->stepwise.min_height = SUN6I_CSI_CAPTURE_HEIGHT_MIN;
+	frmsize->stepwise.max_height = SUN6I_CSI_CAPTURE_HEIGHT_MAX;
+	frmsize->stepwise.step_width = 2;
+	frmsize->stepwise.step_height = 2;
+
+	return 0;
+}
+
 static int sun6i_csi_capture_enum_input(struct file *file, void *priv,
 					struct v4l2_input *input)
 {
@@ -900,11 +900,12 @@ static const struct v4l2_ioctl_ops sun6i_csi_capture_ioctl_ops = {
 	.vidioc_querycap		= sun6i_csi_capture_querycap,
 
 	.vidioc_enum_fmt_vid_cap	= sun6i_csi_capture_enum_fmt,
-	.vidioc_enum_framesizes		= sun6i_csi_capture_enum_framesize,
 	.vidioc_g_fmt_vid_cap		= sun6i_csi_capture_g_fmt,
 	.vidioc_s_fmt_vid_cap		= sun6i_csi_capture_s_fmt,
 	.vidioc_try_fmt_vid_cap		= sun6i_csi_capture_try_fmt,
 
+	.vidioc_enum_framesizes		= sun6i_csi_capture_enum_framesizes,
+
 	.vidioc_enum_input		= sun6i_csi_capture_enum_input,
 	.vidioc_g_input			= sun6i_csi_capture_g_input,
 	.vidioc_s_input			= sun6i_csi_capture_s_input,
@@ -984,16 +985,17 @@ static int sun6i_csi_capture_link_validate(struct media_link *link)
 		media_entity_to_video_device(link->sink->entity);
 	struct sun6i_csi_device *csi_dev = video_get_drvdata(video_dev);
 	struct v4l2_device *v4l2_dev = csi_dev->v4l2_dev;
-	struct v4l2_subdev *src_subdev =
+	struct v4l2_subdev *bridge_subdev =
 		media_entity_to_v4l2_subdev(link->source->entity);
 	const struct sun6i_csi_capture_format *capture_format;
 	const struct sun6i_csi_bridge_format *bridge_format;
 	unsigned int capture_width, capture_height;
-	struct v4l2_subdev_format src_fmt = {
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-		.pad = link->source->index
+	unsigned int bridge_width, bridge_height;
+	struct v4l2_subdev_format bridge_subdev_format = {
+		.which	= V4L2_SUBDEV_FORMAT_ACTIVE,
+		.pad	= link->source->index,
 	};
-	u32 pixelformat, capture_field;
+	u32 pixelformat, capture_field, mbus_code;
 	int ret;
 
 	sun6i_csi_capture_dimensions(csi_dev, &capture_width, &capture_height);
@@ -1004,21 +1006,25 @@ static int sun6i_csi_capture_link_validate(struct media_link *link)
 		return -EINVAL;
 
 	/* Resolve csi bridge format. */
-	ret = v4l2_subdev_call(src_subdev, pad, get_fmt, NULL, &src_fmt);
+	ret = v4l2_subdev_call(bridge_subdev, pad, get_fmt, NULL,
+			       &bridge_subdev_format);
 	if (ret)
 		return ret;
 
-	bridge_format = sun6i_csi_bridge_format_find(src_fmt.format.code);
+	bridge_width = bridge_subdev_format.format.width;
+	bridge_height = bridge_subdev_format.format.height;
+	mbus_code = bridge_subdev_format.format.code;
+
+	bridge_format = sun6i_csi_bridge_format_find(mbus_code);
 	if (WARN_ON(!bridge_format))
 		return -EINVAL;
 
 	/* No cropping/scaling is supported. */
-	if (capture_width != src_fmt.format.width ||
-	    capture_height != src_fmt.format.height) {
+	if (capture_width != bridge_width || capture_height != bridge_height) {
 		v4l2_err(v4l2_dev,
 			 "invalid input/output dimensions: %ux%u/%ux%u\n",
-			 src_fmt.format.width, src_fmt.format.height,
-			 capture_width, capture_height);
+			 bridge_width, bridge_height, capture_width,
+			 capture_height);
 		return -EINVAL;
 	}
 
-- 
2.54.0


