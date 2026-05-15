Return-Path: <linux-media+bounces-61728-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aG5/NhcyB2qQswIAu9opvQ
	(envelope-from <linux-media+bounces-61728-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 16:47:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CBC551A6C
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 16:47:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BD0730125CE
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5D373B3C0E;
	Fri, 15 May 2026 14:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gR7cgnQb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C0F3859E3
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 14:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778856240; cv=none; b=hsGaZq/P6MQLUA2MDWtE1iUynomaRUdmvQcvfcJ79bX/3zb21+waF8fDwhaPmZLB/Eo5g/6uqqwA19+0hEnMKjBlg/QNgJ+wmZ+SewJMUaR74z/eenM2CWI9V5qZtzW/t83EvFxutVnmO+Rh0KBlepcqmhHwrqW8cDjur9heNTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778856240; c=relaxed/simple;
	bh=wuzNiVvcgCo2MZscxyaSH0QGEode+b57g+QUEIOzYJo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YRIAd+ovEpt4FsydXj5prTTaQJi2IwUFkx1gTjB6V5ROygn+PKkJsYYZRiTDjvPK5Iy5DG9bABKwSbLik4oH3ShaD/NXvNPtZGOXOap/SANHUZfr/xVXBCoQc93S62oFfCotsV+2vYDtXD9zifI3wabjnQRxxoYM+U507rVplgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gR7cgnQb; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso106870595e9.1
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 07:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778856237; x=1779461037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OUGRdso5SroXSeCxlO1HX28CuU+eBajIx2d8dYlqRS0=;
        b=gR7cgnQbr9a88QYJ/oWL3mwl7YWTqysqVfUoNZrts5HOzKdAY+5Sm/zumwQqdWNRPR
         L+siNcn1x39YozNbvVVKSjop13G5toqlePoAzkT+AjlX+Dfl12MwxJgiFxmeQuXiYIPB
         /Yyyr/Tplmo0SCNf3CiATcRsu0vmH0lYUAwp2KSSWgqu8E2uTJKaPyVKcnNRQd2CgK2H
         F4e31gF78liJ17LbCUWaFY91iXCkhMSPdr0ef0RsTtZKE4wig6XWA7anTMjkPau29Qo/
         tUXzSjN/PFly5R6fcChN4zKdf6Lkvb+r/FSyPiwbDqy1+sp4ram4Z/jL01REaGVGp6hY
         0SEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778856237; x=1779461037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUGRdso5SroXSeCxlO1HX28CuU+eBajIx2d8dYlqRS0=;
        b=NMdBGHt4znyhPhpXaIMXgX2kNLKA2PvzIkQtn7NpAB990gMEDmMNDqkmWjTetuTdjW
         EDaiis3czbWv8ZlA5MRE2WVy5AuUZ7+oJG6Pq3i/Wg8bovpe5a6syQsCS2DopVcExgJX
         mfBL82pReKgiTRSJ2PFqO025cT6+p0D91nssCT+f2KqIM/5g5axz4XaYqO7HuH+gM86R
         WoujLZhoWf7fdphdL4CPx5Uu7rkIIIBjk1caqppY8KMvM21u6vvkyv5OGUGOwhIB7lWg
         81izDvMFHWrolvMmoVp9Q11BfJh0dQbX/XNO/nDgsZOAESEk7qWS2Q9J2AoJP+iH60l0
         gdzw==
X-Gm-Message-State: AOJu0YznDzXr1+NzZ8lktd+FgwviwUHX6LHQoJWu/KO81jsRWG7SOTe2
	zV0R6ff4/n543IqcAhdJ/SGemKmzrU6Hz+PH7KTyBHV9kht7ogH/300q
X-Gm-Gg: Acq92OHU8Bo62aL+RwYgE8b9o8oLI3hv5VaC0dgj27pKXRWunyhTH4XK5IFHAdFQlff
	amieoWNAbniLZzVQKqmNHIj3pP9659HJklrrXSvtimZHs5FLtInzOTDY5it3mTVzCQWnhSna1mq
	iDkfmYNAWaWL+Xfg9rmNO0KNzhT3Q50v+DNV30k0cAewI8RBzE+EYoq8zvV38mcXbjsBe9UCogT
	D+b3xbXbPqltRrMndCFG1EVabQjWSpzFCizgx6jQE8Nmv8WB6jfKrw6ga9MxbWhZvRZhqPYSvqy
	yzUUHWOwQ2Ttnbsdu8fhlqaUUR/oU3CkkcfLqd+dsJ9uHW6+3O5E/1L4ir4o/tlZUxz0usHbjd7
	DLaY5tFtKiDySx2mt6Vjg6iHUA7JS/RbwP+3JPu6UUgk/GOzssVjHlJTRYjwiR2IAk9WH1mVhGW
	UDWhAlabameMCOr8PDnnPnN2NdJ+xM2Qxq5nyEg+KdvhzHg3jZ9FNo+o9m7vgPGFgG8boIddQQT
	OPzrQk=
X-Received: by 2002:a05:600d:c:b0:48a:56de:d62a with SMTP id 5b1f17b1804b1-48fe60eca75mr57665825e9.11.1778856236640;
        Fri, 15 May 2026 07:43:56 -0700 (PDT)
Received: from thinkpad ([46.164.90.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fea5297f7sm23788285e9.0.2026.05.15.07.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 07:43:56 -0700 (PDT)
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
Subject: [PATCH v2] media: sun8i-a83t-mipi-csi2: Use V4L2 subdev active state
Date: Fri, 15 May 2026 18:13:35 +0330
Message-Id: <20260515144335.61323-1-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 46CBC551A6C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-61728-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[sys-base.io,kernel.org,gmail.com,sholland.org,ideasonboard.com,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arashgolgol@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
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
Changes in v2:
 - Initialize active state before calling v4l2_subdev_state_get_format()
 - Fix line wrapping reported by checkpatch
 - Link to media-ci report: https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/99865145/artifacts/report.htm

 .../sun8i_a83t_mipi_csi2.c                    | 111 +++++++++---------
 .../sun8i_a83t_mipi_csi2.h                    |   2 -
 2 files changed, 55 insertions(+), 58 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
index dbc51daa4fe3..743bc86bfeab 100644
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
+
+	/*
+	 * This subdev does not perform format conversion,
+	 * initialize both pads identically.
+	 */
+	for (pad = 0; pad < subdev->entity.num_pads; pad++) {
+		struct v4l2_mbus_framefmt *mbus_format;
 
-	mutex_lock(lock);
+		mbus_format = v4l2_subdev_state_get_format(state, pad);
 
-	mbus_format->code = sun8i_a83t_mipi_csi2_formats[0].mbus_code;
-	mbus_format->width = 640;
-	mbus_format->height = 480;
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


