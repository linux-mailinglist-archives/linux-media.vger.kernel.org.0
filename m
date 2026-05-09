Return-Path: <linux-media+bounces-60987-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGC+AoLB/mn/vwAAu9opvQ
	(envelope-from <linux-media+bounces-60987-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 07:09:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 590A14FE17F
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 07:09:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C95FF3013481
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2026 05:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 398E53793DF;
	Sat,  9 May 2026 05:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g4uxLl1t"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B592433BBAD
	for <linux-media@vger.kernel.org>; Sat,  9 May 2026 05:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778303350; cv=none; b=bT7MrhumSRFJr/PoBWfpOYdYB2uxdIv6GREw7sSY5mmu+QKRNkxh2mtdPXOF+eaQMedceWGgK5KDsEJuC5NBQpory+G/1iqDcYpUFU9u4+Row4667ApRfp8qxvbC53u6dzycosUiNIEC41t/jStN5MJpGdkxDa/+1DUoavc6vOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778303350; c=relaxed/simple;
	bh=IjG5fH2/q1B+J9EebWc5tNop8AosGBY3H7wi23FSFX8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F8iYgGpOzxwGmHiKauV3WZVuChQOvq/Pi8IIjRSH+qgk6kIuPIpMh6qUlYdusDdiRZ2x3Wh2Z+G+jZ++UqOkzaWmx7cD+55Lc0JWaakYDem4ntVDvdonArvu0uPz9IKPwXrjE8/Uh65KDnKCsgQHr0LKRKr92UGYwEtaHW821Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g4uxLl1t; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso24793885e9.2
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 22:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778303347; x=1778908147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5tg72p45px85KLiU0ufW16MM0Cxw33Qtnh9ouyG7qA=;
        b=g4uxLl1tjcfMqrq7mm1TBrcA7+qyZP9JbqqOXQO0Wa6JiFzIlx5RFKme6crSuFQk1b
         nK+bOwL5XKaFvJ+N5NW5bj2RatFsM776gdG8B3Ti6cwH9GBUHhnH4DRq66iDo9+jamtL
         8f0qaZ1+ZJtCDdTSG2jRcuR9nyFpmK74aze0tZqPkSaNF0zRK1O6hcvi9WoFDmQsN3RZ
         Ft3R5m1OV0adKo0gYg47/6AE6rI8FAVexoFwax4A914/R7NRpw61SFPQUqOXZ12L4gI8
         wFytOX3uhXXAk+UuCrIXYDN/KJW/CfJJFprNs+IcMBI6TpqYyJ5tkZdNPdW70NxpmZEN
         rHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778303347; x=1778908147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J5tg72p45px85KLiU0ufW16MM0Cxw33Qtnh9ouyG7qA=;
        b=X2Lw1+PIfB5iOI3SPSQ6bPZdbLKXTWLos5S1hjpsXxrJ+JkEXAVBAoifnkVJ7eN9X4
         fOasu9/fCBNqlmlGRq6HE/SJD3zdVomlkGyLCbM9UAgZW6H0w0RJcbe5uVFMC6D6Yj9z
         sLgNCxX6mOixN0oaP4UF1PUDymORRUbuOF0sqJK5ZyzdsebwTlNODzYjrc1TgbgXPy/F
         /hpzUMZ3id+P4RM9MscQfVAfuF24m/UBfi8BkNhb7kUTE4oFT8SsRJT3/kN6w1bewzLe
         6nFkDzGNc5IenloT9awhLPBB8fOtRuvKeEnBtvzsJv/GAP/wE5Um+Hnmy2vWcmuzO/Wt
         utHQ==
X-Gm-Message-State: AOJu0YwCmQo70UGMTWrk998Nxf0DK15oC+kdyvBIBGu9X18LSOGxULot
	hZzbRm5Oh6foGRWib5pgXu1eUxZgR3+XDOrcWdw/cYIM/P/PXu10h4ZjF3Zzr5sKXqDN2w==
X-Gm-Gg: Acq92OG4VeZCTUNnRWNnp2SkasJUYDE1QhBuoYcGOqnM6yvrHZBFSSVLNKW/OCQmchX
	ZmiE+b1wSJPMTq6wYuCvFe1y7EShKL8HbiHXr9zKvJeSZoFWoSPOlYGBHCXQbOEDvvbjxZO5rkV
	KYkUHG7NtRzKRGHOgbFjhgnrQktUO+F/pzRHd02XsJM/Lo6bsuxfyZzFTbTfPa3+AY98+b73R7f
	v773Yjr9pnavn/P5oQojy5J72AbBQlvE0MJrmlU52qeseQ5HbzKxvjshx2082xBqyOaDIad1Jbm
	FLROANy9ww5ZEGPw8pAZx90dAyZZ5TynksvLQG3bNvXlRvMjI39tJoNIAfwPkfrp06IrTdFvXsv
	Tn1gM63DsB9w9YPKvcqpGpI3yRRKwhHJ7MloDP/VQRvGAfPIP+Nkipdz8f/5bqZmNt6WQJY9MkW
	vEobplg7qkxTuvJiYq//JFwXMzVYLAg9ubSOulQAmXl2RjPpwBelF7om0leMFXbx62a9nHMv4mR
	bCy3jb5eWykDqSGPMnL
X-Received: by 2002:a05:600c:8486:b0:48a:6fd4:d3d3 with SMTP id 5b1f17b1804b1-48e706be062mr14452385e9.20.1778303346981;
        Fri, 08 May 2026 22:09:06 -0700 (PDT)
Received: from thinkpad ([46.164.106.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6db1742asm14778955e9.31.2026.05.08.22.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 22:09:06 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org
Cc: yong.deng@magewell.com,
	paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v3 1/3] media: sun6i-csi: bridge: Use V4L2 subdev active state
Date: Sat,  9 May 2026 08:39:19 +0330
Message-Id: <20260509050921.22158-2-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260509050921.22158-1-arash.golgol@gmail.com>
References: <20260509050921.22158-1-arash.golgol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 590A14FE17F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[magewell.com,sys-base.io,kernel.org,gmail.com,sholland.org,lists.infradead.org,lists.linux.dev,ideasonboard.com,linux.intel.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60987-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arashgolgol@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pages.freedesktop.org:url,sys-base.io:email]
X-Rspamd-Action: no action

Use the V4L2 subdev active state API to store the active format.
This simplifies the driver not only by dropping the bridge mbus_format
field, but it also allows dropping the bridge lock, replaced with
the state lock.

Previously, capture accessed bridge private state directly. After
moving to framework-managed state, resolve the format through the
subdev pad API.

The sun6i-csi-bridge hardware does not perform any format conversion.
Enforce identical formats on the sink and source pads in the set_fmt()
and init_state() callbacks.

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
Tested-by: Paul Kocialkowski <paulk@sys-base.io>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes in v3:
 - Fix Media CI robot warnings about open parenthesis
 - Link to report: https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/99380724/artifacts/report.htm
 - Link to v2: https://patchwork.kernel.org/project/linux-media/patch/20260508161721.94285-2-arash.golgol@gmail.com/

Changes in v2:
 - Fix indentation in link validation path
 - link to v1: https://patchwork.kernel.org/project/linux-media/patch/20260217064050.18388-2-arash.golgol@gmail.com/

 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 155 ++++++++----------
 .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  27 ++-
 3 files changed, 86 insertions(+), 105 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
index d006d9dd0170..43a85bcc2ba2 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
@@ -13,26 +13,6 @@
 #include "sun6i_csi_bridge.h"
 #include "sun6i_csi_reg.h"
 
-/* Helpers */
-
-void sun6i_csi_bridge_dimensions(struct sun6i_csi_device *csi_dev,
-				 unsigned int *width, unsigned int *height)
-{
-	if (width)
-		*width = csi_dev->bridge.mbus_format.width;
-	if (height)
-		*height = csi_dev->bridge.mbus_format.height;
-}
-
-void sun6i_csi_bridge_format(struct sun6i_csi_device *csi_dev,
-			     u32 *mbus_code, u32 *field)
-{
-	if (mbus_code)
-		*mbus_code = csi_dev->bridge.mbus_format.code;
-	if (field)
-		*field = csi_dev->bridge.mbus_format.field;
-}
-
 /* Format */
 
 static const struct sun6i_csi_bridge_format sun6i_csi_bridge_formats[] = {
@@ -226,7 +206,8 @@ static void sun6i_csi_bridge_disable(struct sun6i_csi_device *csi_dev)
 }
 
 static void
-sun6i_csi_bridge_configure_parallel(struct sun6i_csi_device *csi_dev)
+sun6i_csi_bridge_configure_parallel(struct sun6i_csi_device *csi_dev,
+				    const struct v4l2_mbus_framefmt *mbus_format)
 {
 	struct device *dev = csi_dev->dev;
 	struct regmap *regmap = csi_dev->regmap;
@@ -234,11 +215,9 @@ sun6i_csi_bridge_configure_parallel(struct sun6i_csi_device *csi_dev)
 		&csi_dev->bridge.source_parallel.endpoint;
 	unsigned char bus_width = endpoint->bus.parallel.bus_width;
 	unsigned int flags = endpoint->bus.parallel.flags;
-	u32 field;
+	u32 field = mbus_format->field;
 	u32 value = SUN6I_CSI_IF_CFG_IF_CSI;
 
-	sun6i_csi_bridge_format(csi_dev, NULL, &field);
-
 	if (field == V4L2_FIELD_INTERLACED ||
 	    field == V4L2_FIELD_INTERLACED_TB ||
 	    field == V4L2_FIELD_INTERLACED_BT)
@@ -317,13 +296,12 @@ sun6i_csi_bridge_configure_parallel(struct sun6i_csi_device *csi_dev)
 }
 
 static void
-sun6i_csi_bridge_configure_mipi_csi2(struct sun6i_csi_device *csi_dev)
+sun6i_csi_bridge_configure_mipi_csi2(struct sun6i_csi_device *csi_dev,
+				     const struct v4l2_mbus_framefmt *mbus_format)
 {
 	struct regmap *regmap = csi_dev->regmap;
 	u32 value = SUN6I_CSI_IF_CFG_IF_MIPI;
-	u32 field;
-
-	sun6i_csi_bridge_format(csi_dev, NULL, &field);
+	u32 field = mbus_format->field;
 
 	if (field == V4L2_FIELD_INTERLACED ||
 	    field == V4L2_FIELD_INTERLACED_TB ||
@@ -335,19 +313,20 @@ sun6i_csi_bridge_configure_mipi_csi2(struct sun6i_csi_device *csi_dev)
 	regmap_write(regmap, SUN6I_CSI_IF_CFG_REG, value);
 }
 
-static void sun6i_csi_bridge_configure_format(struct sun6i_csi_device *csi_dev)
+static void
+sun6i_csi_bridge_configure_format(struct sun6i_csi_device *csi_dev,
+				  const struct v4l2_mbus_framefmt *mbus_format)
 {
 	struct regmap *regmap = csi_dev->regmap;
 	bool capture_streaming = csi_dev->capture.state.streaming;
 	const struct sun6i_csi_bridge_format *bridge_format;
 	const struct sun6i_csi_capture_format *capture_format;
-	u32 mbus_code, field, pixelformat;
+	u32 pixelformat;
+	u32 field = mbus_format->field;
 	u8 input_format, input_yuv_seq, output_format;
 	u32 value = 0;
 
-	sun6i_csi_bridge_format(csi_dev, &mbus_code, &field);
-
-	bridge_format = sun6i_csi_bridge_format_find(mbus_code);
+	bridge_format = sun6i_csi_bridge_format_find(mbus_format->code);
 	if (WARN_ON(!bridge_format))
 		return;
 
@@ -391,16 +370,17 @@ static void sun6i_csi_bridge_configure_format(struct sun6i_csi_device *csi_dev)
 }
 
 static void sun6i_csi_bridge_configure(struct sun6i_csi_device *csi_dev,
-				       struct sun6i_csi_bridge_source *source)
+				       struct sun6i_csi_bridge_source *source,
+				       const struct v4l2_mbus_framefmt *mbus_format)
 {
 	struct sun6i_csi_bridge *bridge = &csi_dev->bridge;
 
 	if (source == &bridge->source_parallel)
-		sun6i_csi_bridge_configure_parallel(csi_dev);
+		sun6i_csi_bridge_configure_parallel(csi_dev, mbus_format);
 	else
-		sun6i_csi_bridge_configure_mipi_csi2(csi_dev);
+		sun6i_csi_bridge_configure_mipi_csi2(csi_dev, mbus_format);
 
-	sun6i_csi_bridge_configure_format(csi_dev);
+	sun6i_csi_bridge_configure_format(csi_dev, mbus_format);
 }
 
 /* V4L2 Subdev */
@@ -415,6 +395,8 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev *subdev, int on)
 	struct sun6i_csi_bridge_source *source;
 	struct v4l2_subdev *source_subdev;
 	struct media_pad *remote_pad;
+	struct v4l2_subdev_state *state;
+	const struct v4l2_mbus_framefmt *mbus_format;
 	int ret;
 
 	/* Source */
@@ -433,6 +415,10 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev *subdev, int on)
 	else
 		source = &bridge->source_mipi_csi2;
 
+	/* Active State */
+
+	state = v4l2_subdev_lock_and_get_active_state(subdev);
+
 	if (!on) {
 		v4l2_subdev_call(source_subdev, video, s_stream, 0);
 		ret = 0;
@@ -443,7 +429,7 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev *subdev, int on)
 
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0)
-		return ret;
+		goto unlock;
 
 	/* Clear */
 
@@ -451,7 +437,9 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev *subdev, int on)
 
 	/* Configure */
 
-	sun6i_csi_bridge_configure(csi_dev, source);
+	mbus_format = v4l2_subdev_state_get_format(state,
+						   SUN6I_CSI_BRIDGE_PAD_SINK);
+	sun6i_csi_bridge_configure(csi_dev, source, mbus_format);
 
 	if (capture_streaming)
 		sun6i_csi_capture_configure(csi_dev);
@@ -472,7 +460,8 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev *subdev, int on)
 	if (ret && ret != -ENOIOCTLCMD)
 		goto disable;
 
-	return 0;
+	ret = 0;
+	goto unlock;
 
 disable:
 	if (capture_streaming)
@@ -482,6 +471,8 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev *subdev, int on)
 
 	pm_runtime_put(dev);
 
+unlock:
+	v4l2_subdev_unlock_state(state);
 	return ret;
 }
 
@@ -504,21 +495,23 @@ sun6i_csi_bridge_mbus_format_prepare(struct v4l2_mbus_framefmt *mbus_format)
 static int sun6i_csi_bridge_init_state(struct v4l2_subdev *subdev,
 				       struct v4l2_subdev_state *state)
 {
-	struct sun6i_csi_device *csi_dev = v4l2_get_subdevdata(subdev);
-	unsigned int pad = SUN6I_CSI_BRIDGE_PAD_SINK;
-	struct v4l2_mbus_framefmt *mbus_format =
-		v4l2_subdev_state_get_format(state, pad);
-	struct mutex *lock = &csi_dev->bridge.lock;
+	unsigned int pad;
 
-	mutex_lock(lock);
+	/*
+	 * This subdev does not perform format conversion,
+	 * initialize both pads identically.
+	 */
+	for (pad = 0; pad < subdev->entity.num_pads; pad++) {
+		struct v4l2_mbus_framefmt *mbus_format;
 
-	mbus_format->code = sun6i_csi_bridge_formats[0].mbus_code;
-	mbus_format->width = 1280;
-	mbus_format->height = 720;
+		mbus_format = v4l2_subdev_state_get_format(state, pad);
 
-	sun6i_csi_bridge_mbus_format_prepare(mbus_format);
+		mbus_format->code = sun6i_csi_bridge_formats[0].mbus_code;
+		mbus_format->width = 1280;
+		mbus_format->height = 720;
 
-	mutex_unlock(lock);
+		sun6i_csi_bridge_mbus_format_prepare(mbus_format);
+	}
 
 	return 0;
 }
@@ -536,53 +529,32 @@ sun6i_csi_bridge_enum_mbus_code(struct v4l2_subdev *subdev,
 	return 0;
 }
 
-static int sun6i_csi_bridge_get_fmt(struct v4l2_subdev *subdev,
-				    struct v4l2_subdev_state *state,
-				    struct v4l2_subdev_format *format)
-{
-	struct sun6i_csi_device *csi_dev = v4l2_get_subdevdata(subdev);
-	struct v4l2_mbus_framefmt *mbus_format = &format->format;
-	struct mutex *lock = &csi_dev->bridge.lock;
-
-	mutex_lock(lock);
-
-	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*mbus_format = *v4l2_subdev_state_get_format(state,
-							     format->pad);
-	else
-		*mbus_format = csi_dev->bridge.mbus_format;
-
-	mutex_unlock(lock);
-
-	return 0;
-}
-
 static int sun6i_csi_bridge_set_fmt(struct v4l2_subdev *subdev,
 				    struct v4l2_subdev_state *state,
 				    struct v4l2_subdev_format *format)
 {
-	struct sun6i_csi_device *csi_dev = v4l2_get_subdevdata(subdev);
-	struct v4l2_mbus_framefmt *mbus_format = &format->format;
-	struct mutex *lock = &csi_dev->bridge.lock;
+	struct v4l2_mbus_framefmt *fmt;
 
-	mutex_lock(lock);
+	/* The format on the source pad always matches the sink pad. */
+	if (format->pad != SUN6I_CSI_BRIDGE_PAD_SINK)
+		return v4l2_subdev_get_fmt(subdev, state, format);
 
-	sun6i_csi_bridge_mbus_format_prepare(mbus_format);
+	sun6i_csi_bridge_mbus_format_prepare(&format->format);
 
-	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*v4l2_subdev_state_get_format(state, format->pad) =
-			*mbus_format;
-	else
-		csi_dev->bridge.mbus_format = *mbus_format;
+	/* Set the format on the sink pad. */
+	fmt = v4l2_subdev_state_get_format(state, format->pad);
+	*fmt = format->format;
 
-	mutex_unlock(lock);
+	/* Propagate the format to the source pad. */
+	fmt = v4l2_subdev_state_get_format(state, SUN6I_CSI_BRIDGE_PAD_SOURCE);
+	*fmt = format->format;
 
 	return 0;
 }
 
 static const struct v4l2_subdev_pad_ops sun6i_csi_bridge_pad_ops = {
 	.enum_mbus_code	= sun6i_csi_bridge_enum_mbus_code,
-	.get_fmt	= sun6i_csi_bridge_get_fmt,
+	.get_fmt	= v4l2_subdev_get_fmt,
 	.set_fmt	= sun6i_csi_bridge_set_fmt,
 };
 
@@ -780,8 +752,6 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev)
 	};
 	int ret;
 
-	mutex_init(&bridge->lock);
-
 	/* V4L2 Subdev */
 
 	v4l2_subdev_init(subdev, &sun6i_csi_bridge_subdev_ops);
@@ -809,6 +779,12 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev)
 	if (ret < 0)
 		return ret;
 
+	/* V4L2 Subdev finalize */
+
+	ret = v4l2_subdev_init_finalize(subdev);
+	if (ret < 0)
+		goto error_media_entity;
+
 	/* V4L2 Subdev */
 
 	if (csi_dev->isp_available)
@@ -818,7 +794,7 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev)
 
 	if (ret) {
 		dev_err(dev, "failed to register v4l2 subdev: %d\n", ret);
-		goto error_media_entity;
+		goto error_subdev_finalize;
 	}
 
 	/* V4L2 Async */
@@ -852,6 +828,9 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev)
 	else
 		v4l2_device_unregister_subdev(subdev);
 
+error_subdev_finalize:
+	v4l2_subdev_cleanup(subdev);
+
 error_media_entity:
 	media_entity_cleanup(&subdev->entity);
 
@@ -868,5 +847,7 @@ void sun6i_csi_bridge_cleanup(struct sun6i_csi_device *csi_dev)
 
 	v4l2_device_unregister_subdev(subdev);
 
+	v4l2_subdev_cleanup(subdev);
+
 	media_entity_cleanup(&subdev->entity);
 }
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
index 44653b38f722..a5b0a6f064dd 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
@@ -42,20 +42,11 @@ struct sun6i_csi_bridge {
 	struct v4l2_subdev		subdev;
 	struct v4l2_async_notifier	notifier;
 	struct media_pad		pads[2];
-	struct v4l2_mbus_framefmt	mbus_format;
-	struct mutex			lock; /* Mbus format lock. */
 
 	struct sun6i_csi_bridge_source	source_parallel;
 	struct sun6i_csi_bridge_source	source_mipi_csi2;
 };
 
-/* Helpers */
-
-void sun6i_csi_bridge_dimensions(struct sun6i_csi_device *csi_dev,
-				 unsigned int *width, unsigned int *height);
-void sun6i_csi_bridge_format(struct sun6i_csi_device *csi_dev,
-			     u32 *mbus_code, u32 *field);
-
 /* Format */
 
 const struct sun6i_csi_bridge_format *
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index 65879f4802c0..d90abba21309 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -888,14 +888,19 @@ static int sun6i_csi_capture_link_validate(struct media_link *link)
 		media_entity_to_video_device(link->sink->entity);
 	struct sun6i_csi_device *csi_dev = video_get_drvdata(video_dev);
 	struct v4l2_device *v4l2_dev = csi_dev->v4l2_dev;
+	struct v4l2_subdev *src_subdev =
+		media_entity_to_v4l2_subdev(link->source->entity);
 	const struct sun6i_csi_capture_format *capture_format;
 	const struct sun6i_csi_bridge_format *bridge_format;
 	unsigned int capture_width, capture_height;
-	unsigned int bridge_width, bridge_height;
 	const struct v4l2_format_info *format_info;
+	struct v4l2_subdev_format src_fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.pad = link->source->index
+	};
 	u32 pixelformat, capture_field;
-	u32 mbus_code, bridge_field;
 	bool match;
+	int ret;
 
 	sun6i_csi_capture_dimensions(csi_dev, &capture_width, &capture_height);
 
@@ -904,19 +909,22 @@ static int sun6i_csi_capture_link_validate(struct media_link *link)
 	if (WARN_ON(!capture_format))
 		return -EINVAL;
 
-	sun6i_csi_bridge_dimensions(csi_dev, &bridge_width, &bridge_height);
+	/* Resolve csi bridge format. */
+	ret = v4l2_subdev_call(src_subdev, pad, get_fmt, NULL, &src_fmt);
+	if (ret)
+		return ret;
 
-	sun6i_csi_bridge_format(csi_dev, &mbus_code, &bridge_field);
-	bridge_format = sun6i_csi_bridge_format_find(mbus_code);
+	bridge_format = sun6i_csi_bridge_format_find(src_fmt.format.code);
 	if (WARN_ON(!bridge_format))
 		return -EINVAL;
 
 	/* No cropping/scaling is supported. */
-	if (capture_width != bridge_width || capture_height != bridge_height) {
+	if (capture_width != src_fmt.format.width ||
+	    capture_height != src_fmt.format.height) {
 		v4l2_err(v4l2_dev,
 			 "invalid input/output dimensions: %ux%u/%ux%u\n",
-			 bridge_width, bridge_height, capture_width,
-			 capture_height);
+			 src_fmt.format.width, src_fmt.format.height,
+			 capture_width, capture_height);
 		return -EINVAL;
 	}
 
@@ -947,7 +955,8 @@ static int sun6i_csi_capture_link_validate(struct media_link *link)
 	/* With raw input mode, we need a 1:1 match between input and output. */
 	if (bridge_format->input_format == SUN6I_CSI_INPUT_FMT_RAW ||
 	    capture_format->input_format_raw) {
-		match = sun6i_csi_capture_format_match(pixelformat, mbus_code);
+		match = sun6i_csi_capture_format_match(pixelformat,
+						       src_fmt.format.code);
 		if (!match)
 			goto invalid;
 	}
-- 
2.34.1


