Return-Path: <linux-media+bounces-11342-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C8F8C284F
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 17:56:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0840A1F2499F
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 15:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2307171E72;
	Fri, 10 May 2024 15:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Ben3F4Mv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="epGMj0EV"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE14412C49A;
	Fri, 10 May 2024 15:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715356598; cv=none; b=oM64IISzocv/ZYGTBbGWpjLmWzIiJsFsBCNvtWQnIQKKvGpB4r4EjuytEqIbfLaXwTOjRzVs/22E0nTl2iVxmlj6hmvPoUyoZyq1j12gzr44diCE2/H75psGdToOofF4wFSVodeK05ZRYfNY0b67EXlfvW69Kii8+iIxm3dQcVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715356598; c=relaxed/simple;
	bh=HiR8WfGbfSDYOJPjzZIbNONbwkpTYSokAc21z+JJGtg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ahgSASn7GYdc3Z/LN/AHYz1qFNTZLnW/9oWSoa1ffbw40J/gnX4P3lSl5mDrEvtq0hibEu8eS3zeUcaFa979CzuowTdto0Szn4j92TM+B99vmeQ8r4gmAhDH08POXZNiBGh6UTVq6t4QqVmQnYRdF6iO9/yAtrINe/LU7L5yys0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Ben3F4Mv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=epGMj0EV; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 270B111400BC;
	Fri, 10 May 2024 11:56:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 10 May 2024 11:56:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1715356595; x=1715442995; bh=G9
	LTBMDTS9PNUDj0pG4HKiQOlyw/9e+UGrHZ0u3qK20=; b=Ben3F4MvGALZwbVwkl
	ZLrdHUW9w8LS7eN3o91aYtfM6W63az+QvjMp1L/xzMCBXJ1DAAbot3YV9uYSsb+6
	0gOOd97NJFWYFFQrSrJ1umI+zTcI1BQ2FqDUrc5GHKipWoyBSi8gWOx6XkzbDAQy
	IUZtGOUXMEPeHdU3Typ++oAIrKVJQ3H1wnRKA+wPCEqWy28WcY42HW3KUNEUNYW9
	1ofhHwyL27vOK9oduiB5Bb6dGm96tplPhNrJmpefd0r8Vmu+zxa+A8WCTc2DBjQH
	Ag6L4EW9LUpik7cDmzfCTiBPEEUq2qCVIDfHcaKj5OLYZdnP6hlG32wjTXZTrJ8k
	3Pgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1715356595; x=1715442995; bh=G9LTBMDTS9PNU
	Dj0pG4HKiQOlyw/9e+UGrHZ0u3qK20=; b=epGMj0EVpKIRh9dl7dSwxDYw6owZ9
	JvlOt66/06/8f/sLwOdUIrVIxTnPczGxXmc7oMXuvvm90atDvF5CeS7iLWz02SaQ
	7zApOku5edHlyiLy8Ghov6W1JzWM1inN9DQ2Aj10z/7+O4sjnXCx4zorhS2UC/G9
	eshyQPJlme8MqHPCNQyyiNP9wQ63BRnTY8cfuNDfmXORIMa4faMP94S+3QSCmR27
	ayXY4E2mfzQ00GK/zD2nqXRT/Yhd7536ZR5OM0tzy7yzJfeE0XbjB5biLLKd0Y8F
	6KexNrrYEASqzXJ/90+QP9Tr3Y/H9Gyji973Z8YPu/Lc3woRGjzmbkyZw==
X-ME-Sender: <xms:skM-ZnJ-Ri6plGj6BO6PNHsdcbzC5nCJntsWAzEGWXDoZVy5zxDc4g>
    <xme:skM-ZrJerL4mHu26cPMx6-1SgG0GiF6vX-I11qS-01xDdzlIo8zjU9w6_8ma0XxQm
    GppHc4v8-Yq35AMJc8>
X-ME-Received: <xmr:skM-ZvuV8KtGcrRKfhQW9dE2JBToh2keif0oIQbKg-NjzslBGoWakfF34c8ma_UdalkYh63Y1M4eN5JloGJWyOKYgHWPReHCQHrj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdefkedgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefg
    ffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:skM-ZgbKdo6ZXX95PJ6iegvnmyxB1VfM6gDImP_f50-QT78-sPBteg>
    <xmx:skM-ZuYs4Q9II0Brku50t23BsXT8_aH4KuZTKfo_drsLxCB0uny13Q>
    <xmx:skM-ZkBeJWp7oiQc3j1rLW5O49Ahnua1qNdIqq_t9RO2T_f1ZywA6A>
    <xmx:skM-ZsYyNJq__D15GuzdHoVIoV2LBoau4Z4RdQ2FAkRKbbPKAsinww>
    <xmx:s0M-ZgCBzzEXgGrnOHPkRcXzr8zybVYJBSCfVmDKJjoFuIQjsQyhG5jx>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 May 2024 11:56:33 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2] media: staging: max96712: Store format in subdev active state
Date: Fri, 10 May 2024 17:56:06 +0200
Message-ID: <20240510155606.317507-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Create and store the subdevice format in the subdevices active state.
This change do not have a huge effect on the driver as it do not yet
support changing the format.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
Hello,

This change is mostly to align all driver used in the R-Car VIN pipeline
to use the same set of API and to make it easier to extend them in
tandem going forward.

This should be seen as a compliment to Jacopo's larger work in "[PATCH
v3 00/11] media: renesas: rcar-csi2: Use the subdev active state" which
updates other drivers in the VIN pipeline to use the active state.

* Changes since v1
- Use the control handler lock as the active state lock.
---
 drivers/staging/media/max96712/max96712.c | 37 +++++++++++++++++------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index c44145284aa1..3b302547aa4b 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -242,21 +242,34 @@ static const struct v4l2_subdev_video_ops max96712_video_ops = {
 	.s_stream = max96712_s_stream,
 };
 
-static int max96712_get_pad_format(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_state *sd_state,
-				   struct v4l2_subdev_format *format)
+static int max96712_init_state(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_state *state)
 {
-	format->format.width = 1920;
-	format->format.height = 1080;
-	format->format.code = MEDIA_BUS_FMT_RGB888_1X24;
-	format->format.field = V4L2_FIELD_NONE;
+	static const struct v4l2_mbus_framefmt default_fmt = {
+		.width          = 1920,
+		.height         = 1080,
+		.code           = MEDIA_BUS_FMT_RGB888_1X24,
+		.colorspace     = V4L2_COLORSPACE_SRGB,
+		.field          = V4L2_FIELD_NONE,
+		.ycbcr_enc      = V4L2_YCBCR_ENC_DEFAULT,
+		.quantization   = V4L2_QUANTIZATION_DEFAULT,
+		.xfer_func      = V4L2_XFER_FUNC_DEFAULT,
+	};
+	struct v4l2_mbus_framefmt *fmt;
+
+	fmt = v4l2_subdev_state_get_format(state, 0);
+	*fmt = default_fmt;
 
 	return 0;
 }
 
+static const struct v4l2_subdev_internal_ops max96712_internal_ops = {
+	.init_state = max96712_init_state,
+};
+
 static const struct v4l2_subdev_pad_ops max96712_pad_ops = {
-	.get_fmt = max96712_get_pad_format,
-	.set_fmt = max96712_get_pad_format,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = v4l2_subdev_get_fmt,
 };
 
 static const struct v4l2_subdev_ops max96712_subdev_ops = {
@@ -293,6 +306,7 @@ static int max96712_v4l2_register(struct max96712_priv *priv)
 	long pixel_rate;
 	int ret;
 
+	priv->sd.internal_ops = &max96712_internal_ops;
 	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max96712_subdev_ops);
 	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
@@ -324,6 +338,11 @@ static int max96712_v4l2_register(struct max96712_priv *priv)
 
 	v4l2_set_subdevdata(&priv->sd, priv);
 
+	priv->sd.state_lock = priv->ctrl_handler.lock;
+	ret = v4l2_subdev_init_finalize(&priv->sd);
+	if (ret)
+		goto error;
+
 	ret = v4l2_async_register_subdev(&priv->sd);
 	if (ret < 0) {
 		dev_err(&priv->client->dev, "Unable to register subdevice\n");
-- 
2.45.0


