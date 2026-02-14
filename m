Return-Path: <linux-media+bounces-52805-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FXVG8kDkGlxVAEAu9opvQ
	(envelope-from <linux-media+bounces-52805-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 06:10:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DCE13B1D9
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 06:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABE6E302002E
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 05:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0642426299;
	Sat, 14 Feb 2026 05:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQGjKPHw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D614B286897
	for <linux-media@vger.kernel.org>; Sat, 14 Feb 2026 05:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771045827; cv=none; b=ow4eDjX27xq3gU3Pc71KiiYy+6xqClGWmbWBUgkLBg2yzd4rQHx3XGHxfRH3saKY3UXuE31ucRQZrmbwHnh/THpLGxsIsByK8PXaKLaq29bUxF1WNu5erkYrFGfTNU+S9OALxoETFkRuFbJ5lOIVoFsM3VKMSBwlT0ue7YZlfaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771045827; c=relaxed/simple;
	bh=TvNz0U9qRj2MWFvEQWBYw4ry/dUXhcEsoboCvU3Lk1U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jgCpAFr34xdMj2ZN6eumO+erHgAhhR27L14aKRJDX5az40KiD3PiGZpnEpHN5oxiCHMwGa7pdUo4DVe1UngclbgdXFzE1h5ZoL3jP+SjVoDizURUbV7pjLJqRoVFR2dpFZ2b32DD/bzDUpix0SztISzxPSn0AJkMT9kKDMbLpmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQGjKPHw; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4359249bbacso2567256f8f.0
        for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 21:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771045821; x=1771650621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jKSGP/yPagwmS68ig/gbLeqP/cxsFqTu4QEVGKWYtq8=;
        b=cQGjKPHwwPYQSNzn2UB4Zbw3287OdwCb2Gtxw8aUAK7Gcs2ybgDsLqBot3tBI21cVh
         6n1KDGG9zTcgkMiL9pYpovdRHW7NmNJLWPmPolUu+TzPUbowr+gW8g5+R0COyfjdlrGt
         CWduRTMAC63iNGX9bmcWiZ4qQ67+oXoeSdY/TC6x1LdfNNQmoKupiod+97jhWIO7B5XY
         OpDsa7z+QyCouRkai4+0D6bPBvtvUmry4s9jC1QL2VRkU6BFQthcra0nX7cmImF9Mgc2
         nKnxSPgf9ZyPj5dLWQ1UI1rui5MGyPQ8Vm0MPSCWAR3rOgaSCE5Rr3qzAapkHJ1gS4gV
         f6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771045821; x=1771650621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKSGP/yPagwmS68ig/gbLeqP/cxsFqTu4QEVGKWYtq8=;
        b=HhtFuuwSGm4Xf7Acthl+hv/vdMWhJETxiuqZP4CKsJP9M3u0x/FJPOaMQV8U2Rz8qD
         gn79gQrehzY2K4ocS3+JrxD8VKg4MFdSnYXphWCWJ4rQoGRakCEJbbr0evqs7NnanyUR
         9v19NO6lAy7YIpXHAhJz5V/6jmQN87xIUneHgeTKIzM7accepat/sRj1CCNzE39SB2BU
         rsEf2eqEoswOLXYuQGlhwM5UNxOO/zWw8YjJVob/vjG8DHzf4zlEjOS5I+P+FJvDyaca
         lOkzZypGhY944kxWWCc/VKYGB866A7ZD66cOhwyNgIhj169AxBVmxHX4HtTRAYQzC7kk
         SIsA==
X-Gm-Message-State: AOJu0Yzm2Mk+TJr6fz4u4fKXEnyF3TxauUVDb5Y93BfpDmrQWg1DNuie
	4bBk0bbE9roDl1RCDWho8Dq9UOkq6FNjrb1UQL9yjlLXlpYOTw5OE7AqZ36CnFYK
X-Gm-Gg: AZuq6aLQ+PF4USgkU5fAD8p01BzPTzreUMVPGzn+9n1sVfqg7s3948JdcengeRBm8YO
	zIhlyYx5mFPNbbFMBG+dQl4B8+BaKNluJoepEA+MB5q6lSTNamJZDHjDom7P2RVweCcP5DLIB7C
	RbGlpYidlAYpNDhapKNYi54USMvHcovwbZSKz9gWXqbEjZexjhyE5zD9mP2PiMteuETGC6Xcm1/
	DyFmOU6JAFJkeXiP3CFYWPMqTPBPLmYDQh+euyfs58opq6LxG6LEYryEGqVhcFkKQOlr/FtMOXY
	wJiAY+iZuvOGKqvKfqOUBCMahh9U4j1MzT35kvQlxB8Os7MKQZASaFATYRd+m39bCw3jP3dHiDz
	SQ4aWb7i4JU65sQhawYUJiuXEuik6OaXXSKuFJk6R5vfggxV0mr8PAChtLKLNKrTMQOxvtThysH
	n928ZpeYsAXNMNYG1diG+kLx9Izq7a6NYJSDu6+UUrrqyTA33W3yp1qF+vVG0KCT3bdhAgZ+34Y
	Mx6AgioCw==
X-Received: by 2002:a05:600c:1d10:b0:483:29f4:26b3 with SMTP id 5b1f17b1804b1-48378d58838mr37642755e9.1.1771045820941;
        Fri, 13 Feb 2026 21:10:20 -0800 (PST)
Received: from thinkpad ([89.199.52.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a44d2asm30639435e9.30.2026.02.13.21.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 21:10:20 -0800 (PST)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org
Cc: paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-sunxi@lists.linux.dev,
	Arash Golgol <arash.golgol@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3] media: sun6i-mipi-csi2: Use V4L2 subdev active state
Date: Sat, 14 Feb 2026 08:39:43 +0330
Message-Id: <20260214050943.6306-1-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-52805-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[sys-base.io,kernel.org,gmail.com,sholland.org,lists.linux.dev,ideasonboard.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arashgolgol@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email]
X-Rspamd-Queue-Id: 97DCE13B1D9
X-Rspamd-Action: no action

Use the V4L2 subdev active state API to store the active format.
This simplifies the driver not only by dropping the bridge mbus_format
field, but it also allows dropping the bridge lock, replaced with
the state lock.

The sun6i-mipi-csi2 hardware does not perform any format conversion.
Enforce identical formats on the sink and source pads in the set_fmt()
and init_state() callbacks.

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes in v3:
    - link to v2: https://patchwork.kernel.org/project/linux-media/patch/20260209055529.16644-1-arash.golgol@gmail.com/
    - Keep error path jumping to error_v4l2_notifier_cleanup on 
    bridge setup failure

Changes in v2:
    - link to v1: https://patchwork.kernel.org/project/linux-media/patch/20260206123455.46476-1-arash.golgol@gmail.com/
    - Simplify control flow by dropping the else at end of s_stream()
    - Call v4l2_subdev_cleanup() on bridge setup failure before 
    notifier registration

 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 107 +++++++++---------
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   2 -
 2 files changed, 53 insertions(+), 56 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
index b06cb73015cd..682bdd82098c 100644
--- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
+++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
@@ -95,12 +95,12 @@ static void sun6i_mipi_csi2_disable(struct sun6i_mipi_csi2_device *csi2_dev)
 			   SUN6I_MIPI_CSI2_CTL_EN, 0);
 }
 
-static void sun6i_mipi_csi2_configure(struct sun6i_mipi_csi2_device *csi2_dev)
+static void sun6i_mipi_csi2_configure(struct sun6i_mipi_csi2_device *csi2_dev,
+				       const struct v4l2_mbus_framefmt *mbus_format)
 {
 	struct regmap *regmap = csi2_dev->regmap;
 	unsigned int lanes_count =
 		csi2_dev->bridge.endpoint.bus.mipi_csi2.num_data_lanes;
-	struct v4l2_mbus_framefmt *mbus_format = &csi2_dev->bridge.mbus_format;
 	const struct sun6i_mipi_csi2_format *format;
 	struct device *dev = csi2_dev->dev;
 	u32 version = 0;
@@ -173,7 +173,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 	struct v4l2_subdev *source_subdev = csi2_dev->bridge.source_subdev;
 	union phy_configure_opts dphy_opts = { 0 };
 	struct phy_configure_opts_mipi_dphy *dphy_cfg = &dphy_opts.mipi_dphy;
-	struct v4l2_mbus_framefmt *mbus_format = &csi2_dev->bridge.mbus_format;
+	struct v4l2_subdev_state *state;
+	const struct v4l2_mbus_framefmt *mbus_format;
 	const struct sun6i_mipi_csi2_format *format;
 	struct phy *dphy = csi2_dev->dphy;
 	struct device *dev = csi2_dev->dev;
@@ -183,8 +184,12 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 	unsigned long pixel_rate;
 	int ret;
 
-	if (!source_subdev)
-		return -ENODEV;
+	state = v4l2_subdev_lock_and_get_active_state(subdev);
+
+	if (!source_subdev) {
+		ret = -ENODEV;
+		goto unlock;
+	}
 
 	if (!on) {
 		v4l2_subdev_call(source_subdev, video, s_stream, 0);
@@ -196,7 +201,7 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0)
-		return ret;
+		goto unlock;
 
 	/* Sensor Pixel Rate */
 
@@ -222,6 +227,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 		goto error_pm;
 	}
 
+	mbus_format = v4l2_subdev_state_get_format(state,
+						   SUN6I_MIPI_CSI2_PAD_SINK);
 	format = sun6i_mipi_csi2_format_find(mbus_format->code);
 	if (WARN_ON(!format)) {
 		ret = -ENODEV;
@@ -260,7 +267,7 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 
 	/* Controller */
 
-	sun6i_mipi_csi2_configure(csi2_dev);
+	sun6i_mipi_csi2_configure(csi2_dev, mbus_format);
 	sun6i_mipi_csi2_enable(csi2_dev);
 
 	/* D-PHY */
@@ -277,7 +284,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 	if (ret && ret != -ENOIOCTLCMD)
 		goto disable;
 
-	return 0;
+	ret = 0;
+	goto unlock;
 
 disable:
 	phy_power_off(dphy);
@@ -286,6 +294,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 error_pm:
 	pm_runtime_put(dev);
 
+unlock:
+	v4l2_subdev_unlock_state(state);
 	return ret;
 }
 
@@ -308,21 +318,23 @@ sun6i_mipi_csi2_mbus_format_prepare(struct v4l2_mbus_framefmt *mbus_format)
 static int sun6i_mipi_csi2_init_state(struct v4l2_subdev *subdev,
 				      struct v4l2_subdev_state *state)
 {
-	struct sun6i_mipi_csi2_device *csi2_dev = v4l2_get_subdevdata(subdev);
-	unsigned int pad = SUN6I_MIPI_CSI2_PAD_SINK;
-	struct v4l2_mbus_framefmt *mbus_format =
-		v4l2_subdev_state_get_format(state, pad);
-	struct mutex *lock = &csi2_dev->bridge.lock;
+	unsigned int pad;
 
-	mutex_lock(lock);
+	/*
+	 * This subdev does not perform format conversion,
+	 * initialize both pads identically.
+	 */
+	for (pad = 0; pad < subdev->entity.num_pads; pad++) {
+		struct v4l2_mbus_framefmt *mbus_format;
 
-	mbus_format->code = sun6i_mipi_csi2_formats[0].mbus_code;
-	mbus_format->width = 640;
-	mbus_format->height = 480;
+		mbus_format = v4l2_subdev_state_get_format(state, pad);
 
-	sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
+		mbus_format->code = sun6i_mipi_csi2_formats[0].mbus_code;
+		mbus_format->width = 640;
+		mbus_format->height = 480;
 
-	mutex_unlock(lock);
+		sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
+	}
 
 	return 0;
 }
@@ -340,53 +352,32 @@ sun6i_mipi_csi2_enum_mbus_code(struct v4l2_subdev *subdev,
 	return 0;
 }
 
-static int sun6i_mipi_csi2_get_fmt(struct v4l2_subdev *subdev,
-				   struct v4l2_subdev_state *state,
-				   struct v4l2_subdev_format *format)
-{
-	struct sun6i_mipi_csi2_device *csi2_dev = v4l2_get_subdevdata(subdev);
-	struct v4l2_mbus_framefmt *mbus_format = &format->format;
-	struct mutex *lock = &csi2_dev->bridge.lock;
-
-	mutex_lock(lock);
-
-	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*mbus_format = *v4l2_subdev_state_get_format(state,
-							     format->pad);
-	else
-		*mbus_format = csi2_dev->bridge.mbus_format;
-
-	mutex_unlock(lock);
-
-	return 0;
-}
-
 static int sun6i_mipi_csi2_set_fmt(struct v4l2_subdev *subdev,
 				   struct v4l2_subdev_state *state,
 				   struct v4l2_subdev_format *format)
 {
-	struct sun6i_mipi_csi2_device *csi2_dev = v4l2_get_subdevdata(subdev);
-	struct v4l2_mbus_framefmt *mbus_format = &format->format;
-	struct mutex *lock = &csi2_dev->bridge.lock;
+	struct v4l2_mbus_framefmt *fmt;
 
-	mutex_lock(lock);
+	/* The format on the source pad always matches the sink pad. */
+	if (format->pad != SUN6I_MIPI_CSI2_PAD_SINK)
+		return v4l2_subdev_get_fmt(subdev, state, format);
 
-	sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
+	sun6i_mipi_csi2_mbus_format_prepare(&format->format);
 
-	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*v4l2_subdev_state_get_format(state, format->pad) =
-			*mbus_format;
-	else
-		csi2_dev->bridge.mbus_format = *mbus_format;
+	/* Set the format on the sink pad. */
+	fmt = v4l2_subdev_state_get_format(state, format->pad);
+	*fmt = format->format;
 
-	mutex_unlock(lock);
+	/* Propagate the format to the source pad. */
+	fmt = v4l2_subdev_state_get_format(state, SUN6I_MIPI_CSI2_PAD_SOURCE);
+	*fmt = format->format;
 
 	return 0;
 }
 
 static const struct v4l2_subdev_pad_ops sun6i_mipi_csi2_pad_ops = {
 	.enum_mbus_code	= sun6i_mipi_csi2_enum_mbus_code,
-	.get_fmt	= sun6i_mipi_csi2_get_fmt,
+	.get_fmt	= v4l2_subdev_get_fmt,
 	.set_fmt	= sun6i_mipi_csi2_set_fmt,
 };
 
@@ -502,8 +493,6 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6i_mipi_csi2_device *csi2_dev)
 	bool notifier_registered = false;
 	int ret;
 
-	mutex_init(&bridge->lock);
-
 	/* V4L2 Subdev */
 
 	v4l2_subdev_init(subdev, &sun6i_mipi_csi2_subdev_ops);
@@ -532,6 +521,12 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6i_mipi_csi2_device *csi2_dev)
 	if (ret)
 		return ret;
 
+	/* V4L2 Subdev finalize */
+
+	ret = v4l2_subdev_init_finalize(subdev);
+	if (ret < 0)
+		goto error_media_entity_cleanup;
+
 	/* V4L2 Async */
 
 	v4l2_async_subdev_nf_init(notifier, subdev);
@@ -565,6 +560,9 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6i_mipi_csi2_device *csi2_dev)
 error_v4l2_notifier_cleanup:
 	v4l2_async_nf_cleanup(notifier);
 
+	v4l2_subdev_cleanup(subdev);
+
+error_media_entity_cleanup:
 	media_entity_cleanup(&subdev->entity);
 
 	return ret;
@@ -579,6 +577,7 @@ sun6i_mipi_csi2_bridge_cleanup(struct sun6i_mipi_csi2_device *csi2_dev)
 	v4l2_async_unregister_subdev(subdev);
 	v4l2_async_nf_unregister(notifier);
 	v4l2_async_nf_cleanup(notifier);
+	v4l2_subdev_cleanup(subdev);
 	media_entity_cleanup(&subdev->entity);
 }
 
diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
index 24b15e34b5e8..d72dfbd6a993 100644
--- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
+++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
@@ -32,8 +32,6 @@ struct sun6i_mipi_csi2_bridge {
 	struct media_pad		pads[SUN6I_MIPI_CSI2_PAD_COUNT];
 	struct v4l2_fwnode_endpoint	endpoint;
 	struct v4l2_async_notifier	notifier;
-	struct v4l2_mbus_framefmt	mbus_format;
-	struct mutex			lock; /* Mbus format lock. */
 
 	struct v4l2_subdev		*source_subdev;
 };
-- 
2.34.1


