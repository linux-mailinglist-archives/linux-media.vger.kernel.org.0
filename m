Return-Path: <linux-media+bounces-61764-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJYTDzVaB2orzwIAu9opvQ
	(envelope-from <linux-media+bounces-61764-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 19:39:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BFA5555F7
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 19:39:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D930C306B53D
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 17:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01059380FC4;
	Fri, 15 May 2026 17:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qIcPo/Ys"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A479F2DF15C
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 17:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778866284; cv=none; b=RfW9rv9d3x9sk98ev9KMGMnEWIlyEAVuOe5+iHvTzM5Q1cdRkUEsNC5N7uzn/WSaT3UdJVfAwKGs/4ReCilvauRL/WVCf8yEEzHZBR98+mZLRp20GnoV2ZmsHlEqPbeZGZ1FqCLIAzmSTEAyeEjKJotikrSHRJUUyHjrIoTDpVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778866284; c=relaxed/simple;
	bh=mtRaeSTm22szPuQEOfRz5jfPAzXvm/3/BfPURC2QZAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Zxfl8/xiqLiRGyribgtGfpL3lKF1kVvLTNKzKQpR/BRexaW+rtjOa4kdg3yP+S+i3KzUFJQdcGQaKldiJv2PIkLKdB/eo2BwUyDl8gkkAoR5UGLZ6DRi8ro1Hw22EbfJC+28Y4u/5D8K81wOjYFB/6e4moP34raqz15w2fglN1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qIcPo/Ys; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45d96d21e82so18563f8f.0
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 10:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778866281; x=1779471081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YQ909tteUlib6r5Zln7gE9fXVg66KPSxybEgXF2LXGY=;
        b=qIcPo/YsuhaaqZ4XO7tsCqpjbeYuJCNkZQmPs4negCtYotaDUdjN5+5Gf9nDQnQvaF
         rzDyThUUDP07LhdxxhCeM6F5QtZOqvMO4/GLDSSUUlgYnbiUwdtRMi638mkFUo5r/Mr4
         IhFQzgezyNZcem0PFik9zencZ5koe01XjocJJUv6iUmqKN4zju7FVH7cDo0Oy95b2VIy
         okdpn1UkCrRp9JdGvdD0GmyExVU2iKlJLHyiMnAKYxLMHml3xPKCknrU1Bf5MD1wk0qT
         wVck7B8D3h2f9xLGei8uTutMD9iC4gMq9QG4yxJ6YTJdvmhCNVSLeMP5BsVqEPPRpSor
         EEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778866281; x=1779471081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQ909tteUlib6r5Zln7gE9fXVg66KPSxybEgXF2LXGY=;
        b=jbPJLAiV9IrOj7rlGqZB7wMaW3jOz8VKt9Yc5yARGMbssd9QKvjVPE6aJw+gdNfWXI
         EGuEo7s2rNq4bBzqJtBGmPOq+VZSC7Jw7b3RwIfYzeC+mnOCvyjaJKSB5lX7xXkmFtMh
         GP6bJZMIu1zVwL65tkc4mMPjTgfLlEIRDtkVF3R9mP25wxkcPOor2JQk92jsfUN6wYCJ
         3D6cIpZrO/Q/fBwHathHc2RPiu3T4LNQnwHH0PSyRPnoWA7uv91eq7Rl8M+ZsdE7lAfe
         AxQUF7/DowB/+GXeR3sGQhXfNZ8TZ+XHqCxXbz92yF6Rgn4wGJ/RdOYNyLZnqyh3+f2j
         jHgA==
X-Gm-Message-State: AOJu0YwLaQ0hD8lO46F1kg9BTHoP3pvkwIm96rTY12GvNZaw9SwzfeFb
	8FT2dBiH8lS+mJKItc1/BZtxQSFWR20XuK1iZR5Wj4Xaxh88gUXOX6rh
X-Gm-Gg: Acq92OGzvEScHP2qiiCfF7bRVjvUOcTyGVKTpXju7NY6EPP1bRsr0FOmjpLAxHXmPnV
	ivphU5Af3fI/iUnwZhpwUaYfuFdKGFAEorr/2PnvWdPN/IE2Coaa82GkAw1bCdMvdRUJo6M6nui
	Q/ZXwddNUNlYgjqkrvTx/2sZFSkOE6U1LMDAvU99LD7HAlSbo9wq/mMQ0Q3FhN8de4JsrahuD9x
	2KLMNh+NXF3Yj2KreZrO19MV4j/G+ewgceRvltyRDOJ1XfCttXZKm8cfhcjQR3VD61LnGVXoe1z
	8byHkmjZ/lrGb6XEnGODeEAY0k/NkUToNVoGjS+b1vCui96blbrKs9LiNjhCQh6FD3hOcMAHY/m
	xCdNka/uJL5lw1zNPIoVpTmhvnJdwYcKvhNAwG9QDCEQ2G6ws/UE262LJCFm1cH9QKMVvP+H95T
	8nSHATYoPlytsAgPROGSlAAzgimatepL/dPkXbIriVNbcrtk6n2lE895aZAyPzkbFxIetrMoMhC
	HMFM8E=
X-Received: by 2002:a05:6000:1863:b0:44f:ba97:6d8c with SMTP id ffacd0b85a97d-45e5c5cf1a6mr6597732f8f.23.1778866280886;
        Fri, 15 May 2026 10:31:20 -0700 (PDT)
Received: from thinkpad ([46.164.90.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe13a7sm17227141f8f.29.2026.05.15.10.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 10:31:20 -0700 (PDT)
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
Subject: [PATCH v3] media: sun8i-a83t-mipi-csi2: Use V4L2 subdev active state
Date: Fri, 15 May 2026 21:01:01 +0330
Message-Id: <20260515173101.8978-1-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D4BFA5555F7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61764-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[arashgolgol@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[sys-base.io,kernel.org,gmail.com,sholland.org,ideasonboard.com,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Use the V4L2 subdev active state API to store the active format.
This simplifies the driver not only by dropping the bridge mbus_format
field, but it also allows dropping the bridge lock, replaced with
the state lock.

The sun8i-a83t-mipi-csi2 hardware does not perform any format
conversion. Enforce identical formats on the sink and source pads in
the set_fmt() and init_state() callbacks.

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
---
Changes in v3:
 - Fix active state lock leak on runtime PM error path

Changes in v2:
 - Initialize active state before calling v4l2_subdev_state_get_format()
 - Fix line wrapping reported by checkpatch
 - Link to media-ci report: https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/99865145/artifacts/report.htm

 .../sun8i_a83t_mipi_csi2.c                    | 113 +++++++++---------
 .../sun8i_a83t_mipi_csi2.h                    |   2 -
 2 files changed, 56 insertions(+), 59 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
index dbc51daa4fe3..2b7635f3952d 100644
--- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
+++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
@@ -144,12 +144,12 @@ sun8i_a83t_mipi_csi2_disable(struct sun8i_a83t_mipi_csi2_device *csi2_dev)
 }
 
 static void
-sun8i_a83t_mipi_csi2_configure(struct sun8i_a83t_mipi_csi2_device *csi2_dev)
+sun8i_a83t_mipi_csi2_configure(struct sun8i_a83t_mipi_csi2_device *csi2_dev,
+			       const struct v4l2_mbus_framefmt *mbus_format)
 {
 	struct regmap *regmap = csi2_dev->regmap;
 	unsigned int lanes_count =
 		csi2_dev->bridge.endpoint.bus.mipi_csi2.num_data_lanes;
-	struct v4l2_mbus_framefmt *mbus_format = &csi2_dev->bridge.mbus_format;
 	const struct sun8i_a83t_mipi_csi2_format *format;
 	struct device *dev = csi2_dev->dev;
 	u32 version = 0;
@@ -205,7 +205,8 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 	struct v4l2_subdev *source_subdev = csi2_dev->bridge.source_subdev;
 	union phy_configure_opts dphy_opts = { 0 };
 	struct phy_configure_opts_mipi_dphy *dphy_cfg = &dphy_opts.mipi_dphy;
-	struct v4l2_mbus_framefmt *mbus_format = &csi2_dev->bridge.mbus_format;
+	struct v4l2_subdev_state *state;
+	const struct v4l2_mbus_framefmt *mbus_format;
 	const struct sun8i_a83t_mipi_csi2_format *format;
 	struct phy *dphy = csi2_dev->dphy;
 	struct device *dev = csi2_dev->dev;
@@ -215,8 +216,12 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
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
@@ -228,7 +233,7 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0)
-		return ret;
+		goto unlock;
 
 	/* Sensor pixel rate */
 
@@ -254,6 +259,9 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 		goto error_pm;
 	}
 
+	mbus_format =
+		v4l2_subdev_state_get_format(state,
+					     SUN8I_A83T_MIPI_CSI2_PAD_SINK);
 	format = sun8i_a83t_mipi_csi2_format_find(mbus_format->code);
 	if (WARN_ON(!format)) {
 		ret = -ENODEV;
@@ -292,7 +300,7 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 
 	/* Controller */
 
-	sun8i_a83t_mipi_csi2_configure(csi2_dev);
+	sun8i_a83t_mipi_csi2_configure(csi2_dev, mbus_format);
 	sun8i_a83t_mipi_csi2_enable(csi2_dev);
 
 	/* D-PHY */
@@ -309,7 +317,8 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 	if (ret && ret != -ENOIOCTLCMD)
 		goto disable;
 
-	return 0;
+	ret = 0;
+	goto unlock;
 
 disable:
 	phy_power_off(dphy);
@@ -318,6 +327,8 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
 error_pm:
 	pm_runtime_put(dev);
 
+unlock:
+	v4l2_subdev_unlock_state(state);
 	return ret;
 }
 
@@ -341,22 +352,24 @@ sun8i_a83t_mipi_csi2_mbus_format_prepare(struct v4l2_mbus_framefmt *mbus_format)
 static int sun8i_a83t_mipi_csi2_init_state(struct v4l2_subdev *subdev,
 					   struct v4l2_subdev_state *state)
 {
-	struct sun8i_a83t_mipi_csi2_device *csi2_dev =
-		v4l2_get_subdevdata(subdev);
-	unsigned int pad = SUN8I_A83T_MIPI_CSI2_PAD_SINK;
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
 
-	mbus_format->code = sun8i_a83t_mipi_csi2_formats[0].mbus_code;
-	mbus_format->width = 640;
-	mbus_format->height = 480;
+		mbus_format = v4l2_subdev_state_get_format(state, pad);
+
+		mbus_format->code = sun8i_a83t_mipi_csi2_formats[0].mbus_code;
+		mbus_format->width = 640;
+		mbus_format->height = 480;
 
-	sun8i_a83t_mipi_csi2_mbus_format_prepare(mbus_format);
+		sun8i_a83t_mipi_csi2_mbus_format_prepare(mbus_format);
+	}
 
-	mutex_unlock(lock);
 
 	return 0;
 }
@@ -375,55 +388,33 @@ sun8i_a83t_mipi_csi2_enum_mbus_code(struct v4l2_subdev *subdev,
 	return 0;
 }
 
-static int sun8i_a83t_mipi_csi2_get_fmt(struct v4l2_subdev *subdev,
-					struct v4l2_subdev_state *state,
-					struct v4l2_subdev_format *format)
-{
-	struct sun8i_a83t_mipi_csi2_device *csi2_dev =
-		v4l2_get_subdevdata(subdev);
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
 static int sun8i_a83t_mipi_csi2_set_fmt(struct v4l2_subdev *subdev,
 					struct v4l2_subdev_state *state,
 					struct v4l2_subdev_format *format)
 {
-	struct sun8i_a83t_mipi_csi2_device *csi2_dev =
-		v4l2_get_subdevdata(subdev);
-	struct v4l2_mbus_framefmt *mbus_format = &format->format;
-	struct mutex *lock = &csi2_dev->bridge.lock;
+	struct v4l2_mbus_framefmt *fmt;
 
-	mutex_lock(lock);
+	/* The format on the source pad always matches the sink pad. */
+	if (format->pad != SUN8I_A83T_MIPI_CSI2_PAD_SINK)
+		return v4l2_subdev_get_fmt(subdev, state, format);
 
-	sun8i_a83t_mipi_csi2_mbus_format_prepare(mbus_format);
+	sun8i_a83t_mipi_csi2_mbus_format_prepare(&format->format);
 
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
+	fmt = v4l2_subdev_state_get_format(state,
+					   SUN8I_A83T_MIPI_CSI2_PAD_SOURCE);
+	*fmt = format->format;
 
 	return 0;
 }
 
 static const struct v4l2_subdev_pad_ops sun8i_a83t_mipi_csi2_pad_ops = {
 	.enum_mbus_code	= sun8i_a83t_mipi_csi2_enum_mbus_code,
-	.get_fmt	= sun8i_a83t_mipi_csi2_get_fmt,
+	.get_fmt	= v4l2_subdev_get_fmt,
 	.set_fmt	= sun8i_a83t_mipi_csi2_set_fmt,
 };
 
@@ -540,8 +531,6 @@ sun8i_a83t_mipi_csi2_bridge_setup(struct sun8i_a83t_mipi_csi2_device *csi2_dev)
 	bool notifier_registered = false;
 	int ret;
 
-	mutex_init(&bridge->lock);
-
 	/* V4L2 Subdev */
 
 	v4l2_subdev_init(subdev, &sun8i_a83t_mipi_csi2_subdev_ops);
@@ -570,6 +559,12 @@ sun8i_a83t_mipi_csi2_bridge_setup(struct sun8i_a83t_mipi_csi2_device *csi2_dev)
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
@@ -603,6 +598,9 @@ sun8i_a83t_mipi_csi2_bridge_setup(struct sun8i_a83t_mipi_csi2_device *csi2_dev)
 error_v4l2_notifier_cleanup:
 	v4l2_async_nf_cleanup(notifier);
 
+	v4l2_subdev_cleanup(subdev);
+
+error_media_entity_cleanup:
 	media_entity_cleanup(&subdev->entity);
 
 	return ret;
@@ -617,6 +615,7 @@ sun8i_a83t_mipi_csi2_bridge_cleanup(struct sun8i_a83t_mipi_csi2_device *csi2_dev
 	v4l2_async_unregister_subdev(subdev);
 	v4l2_async_nf_unregister(notifier);
 	v4l2_async_nf_cleanup(notifier);
+	v4l2_subdev_cleanup(subdev);
 	media_entity_cleanup(&subdev->entity);
 }
 
diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.h b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.h
index f1e64c53434c..819527bcd64d 100644
--- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.h
+++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.h
@@ -33,8 +33,6 @@ struct sun8i_a83t_mipi_csi2_bridge {
 	struct media_pad		pads[SUN8I_A83T_MIPI_CSI2_PAD_COUNT];
 	struct v4l2_fwnode_endpoint	endpoint;
 	struct v4l2_async_notifier	notifier;
-	struct v4l2_mbus_framefmt	mbus_format;
-	struct mutex			lock; /* Mbus format lock. */
 
 	struct v4l2_subdev		*source_subdev;
 };
-- 
2.34.1


