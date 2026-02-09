Return-Path: <linux-media+bounces-52371-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AbDLeZ2iWlm9gQAu9opvQ
	(envelope-from <linux-media+bounces-52371-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 06:55:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6EF10BE87
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 06:55:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 570F630087A4
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 05:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5982D97B9;
	Mon,  9 Feb 2026 05:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CzzqIcgo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29932222B2
	for <linux-media@vger.kernel.org>; Mon,  9 Feb 2026 05:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770616539; cv=none; b=HbpncYEE7ZYJN7LradVH0Rsx3MNQcBYf8qQ1dN0en1+KJtiZJXlxFlGXjSqPEE6wYWM5g87rMCGVptvL1zZDfvnyhn4RwK9QDUtyRaLzukVBrFSuGfjpn1qFsm2u7ICME9YY9GdKTqm0W6ZYY1960TIGCsOVzATXg/AXEEHZ2dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770616539; c=relaxed/simple;
	bh=Xs1L+PeVa5xFXNjQeHKr47cOVBET8yv3ROzNpeHVCho=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jP9HRhmgyqrV7eS+nhlC+QHQI4qYZwfOYDpI0SW/qB0dMU/afUrWNyboXxOPx79CMLfySXYqNET7U7RQ2UHH/7n40FDPZze5cpo49euKjDEby71349/BscWJITY7mAOfLHKGDr2yYHIJ5TiqYhgBucwum2EphvgiiPR50DtnA4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CzzqIcgo; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso38062245e9.1
        for <linux-media@vger.kernel.org>; Sun, 08 Feb 2026 21:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770616537; x=1771221337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tlfYfZAAOhKPlWI86OOkOxP71ePpXQ8i0toDN3DWIcs=;
        b=CzzqIcgot8jqvkZv5pKTAS+6KkjFrV1xlZ23QUV0mfio9yCgJrKAX4J1MQYHwrxkfT
         vgJ8ZFdrDcRC7uHBpcOn/6Or8QYYQu7uveoEgnq+MUtNw3vqQz5f90LnaV4jQKcO9DnU
         HRLMg23eWofrzesMi6NP3OQDHlmWPAwNcmOC/ds/H9D2HeYA1A4DJZXPfEoA3WRtfHUl
         R+K7/qZcyZdDiNt9hlELhIjYZIEkrBiMAZUWp0OquTrC1XG+sH6A/lkYyP0E99dlSDSS
         9UR0e9T/eSCbKKgt00tamaY6xuh22QjfWkvUHOwYuuBI7jjR/hycd952nKBHeMpeXcV5
         uyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770616537; x=1771221337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tlfYfZAAOhKPlWI86OOkOxP71ePpXQ8i0toDN3DWIcs=;
        b=qMZxmQla5yilhi4BW4HlDpC0oypIduNrUV9PsxaKo1tDbOWhT3ijuPRM0EUQdfFH5/
         EU8ecnenNCkhjkWl/EsnqeFb2nr+/p1LGhr3zPj+xoWxVqq+32FDx2eWeHh9YP2tmWyK
         JtP+xhWbPPWQKLo+K2xal/MxnGMwHbJQRLCi02vb9FaSv0AiswgOLixo/EeHpxgwRbiv
         4vEMcvZR3wbuQpimpTXlc0tEWUJEjhYr0aXGv3UlqDtS9VYieTa1iaAXVgyFKT1m9ABV
         fOPzO8pey3Fqbz4gIF0NNsHvjVmwtpEVCXfB1DJBgDTg3AeETYiKcn7qdxve3HP7HvRr
         /osA==
X-Gm-Message-State: AOJu0YysPVIw0TAdKlX0hqEHCiurDyfEdC7NiWuHgjFmvD5GP0V7YzBk
	rbQKjYMvJoMqLkLmIH6JblJIyHeJyu6JvPEIuoC8eCwSsg/EaEHiBH3C/XSPORFplgH0ng==
X-Gm-Gg: AZuq6aLeG+cK+MSoQ7ZqutCxnuB6riBNgancx3ZZdWWshAfd6EcFu/IWZMTXXEsOa/W
	kmST2Vz3e+o3zjt7+o6kSMIBPu5zZge6yDJr9Va85SXQBotXG2c7t1UB+PoGgEIZyv5qQQMtNwk
	mGM/3WOtc0jFo1EIK42us/KF3yWAVEF7AtdCrOiWfB69mu9ZSrd3ye+yTMCT/a9hw5PtSz/sQlW
	F6Z7rOfitu+b3yust881VjHy+wZs/KTJBustDdER5TWf33YUKEvHa3UCQvX1IhzzzZzD9Cpnlkw
	cqMMqhs0PPoQ4o15YYxBrKQdJgKMNJWXufZzOgqxY0iiGJvkzQ52uZlUhueKCFnn/52mH2n/cGG
	xX0Hfpsfbo9VPZfsjoU40hZKbByljbvA0nViR7hvdUIxqeemRFBTeCro5Jt92h5dqf4lKAK60qH
	I003ZFWS9NaUMI5MaUPfiq3tiEscJEEGBIC5eRUCSk5KIXKwgM2WY7DxgXOv1h32WLwkhr
X-Received: by 2002:a05:600c:3f0d:b0:479:13e9:3d64 with SMTP id 5b1f17b1804b1-483203d5f73mr148535035e9.15.1770616537224;
        Sun, 08 Feb 2026 21:55:37 -0800 (PST)
Received: from thinkpad ([5.217.172.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d7a963sm270720055e9.9.2026.02.08.21.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 21:55:36 -0800 (PST)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org
Cc: paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	laurent.pinchart@ideasonboard.com,
	linux-sunxi@lists.linux.dev,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v2] media: sun6i-mipi-csi2: Use V4L2 subdev active state
Date: Mon,  9 Feb 2026 09:25:29 +0330
Message-Id: <20260209055529.16644-1-arash.golgol@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-52371-lists,linux-media=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[sea.lore.kernel.org:server fail];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[sys-base.io,kernel.org,gmail.com,sholland.org,ideasonboard.com,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[arashgolgol@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3A6EF10BE87
X-Rspamd-Action: no action

Use the V4L2 subdev active state API to store the active format.
This simplifies the driver not only by dropping the bridge mbus_format
field, but it also allows dropping the bridge lock, replaced with
the state lock.

The sun6i-mipi-csi2 hardware does not perform any format conversion.
Enforce identical formats on the sink and source pads in the set_fmt()
and init_state() callbacks.

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
---
Changes in v2:
    - Simplify control flow by dropping the else at end of s_stream()
    - Call v4l2_subdev_cleanup() on bridge setup failure before 
    notifier registration

 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 110 +++++++++---------
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   2 -
 2 files changed, 55 insertions(+), 57 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
index b06cb73015cd..f4d1f876dac8 100644
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
@@ -539,7 +534,7 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6i_mipi_csi2_device *csi2_dev)
 
 	ret = sun6i_mipi_csi2_bridge_source_setup(csi2_dev);
 	if (ret && ret != -ENODEV)
-		goto error_v4l2_notifier_cleanup;
+		goto error_v4l2_subdev_cleanup;
 
 	/* Only register the notifier when a sensor is connected. */
 	if (ret != -ENODEV) {
@@ -565,6 +560,10 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6i_mipi_csi2_device *csi2_dev)
 error_v4l2_notifier_cleanup:
 	v4l2_async_nf_cleanup(notifier);
 
+error_v4l2_subdev_cleanup:
+	v4l2_subdev_cleanup(subdev);
+
+error_media_entity_cleanup:
 	media_entity_cleanup(&subdev->entity);
 
 	return ret;
@@ -579,6 +578,7 @@ sun6i_mipi_csi2_bridge_cleanup(struct sun6i_mipi_csi2_device *csi2_dev)
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


