Return-Path: <linux-media+bounces-11305-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F8A8C2190
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 12:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E3841F2172A
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 10:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95DD2165FBE;
	Fri, 10 May 2024 10:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="PNfANvTY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QpmVqh4C"
X-Original-To: linux-media@vger.kernel.org
Received: from wfhigh1-smtp.messagingengine.com (wfhigh1-smtp.messagingengine.com [64.147.123.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0AD1635B5;
	Fri, 10 May 2024 10:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715335498; cv=none; b=aJGMrDtNDuKXipPAM9BWwArp2rwJMb/xTjqjifZDcdoLi0OW+3ErtLK50vLVjckiFg/ZGH7GaLN9/RC5Y3Rrjq0VtGcLJf94J8U7ArZuu1Hy3+troURz9QrJ/BH6Z5/bHFppGHLKzOTSKhia9m/u5JYvKPJd+pughjJX58aRAKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715335498; c=relaxed/simple;
	bh=CC00sFgTDWC9SQHZN5vghkZaBNgbTN7QgEeV6BgEA48=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oyEs8hzYGzsn9hCyqAE3FdRtvWf8UmHMgJqSBwZ9OHrfpKf24yTPHCSUCng6Q9ZPqbxPoyCqjZudOps2mTTQKmPfq1UHzxq5lKtUtZsHwVZzFY9ZCzDgx0cmJpLrnwhk6/6rcS8N9oq14VJ4DUqN5rEaKO5r3hq0BeyeavuLxZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=PNfANvTY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QpmVqh4C; arc=none smtp.client-ip=64.147.123.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfhigh.west.internal (Postfix) with ESMTP id 5B7911800103;
	Fri, 10 May 2024 06:04:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Fri, 10 May 2024 06:04:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1715335493; x=1715421893; bh=ut
	GzqHCYGLMkQ01p311OO4Yqbsn17yCC9KJUN2Gj224=; b=PNfANvTY6nEOpjyk/H
	a+t0h+NAaxJpvY2V7QJdyoIYz4lpWmTWWW/W2YKj9/e4WIWPBr2WYbXin7ZC/+PP
	/vl0AcksoJ9sbJHjNSlOoRJdYP0OXpRY4uLCDD3MjgWlGtw/7PpG78ze4h/wU12F
	QbgBvNUwD80H29rm2FqbRq7n5Flg9mWG4QD3LsAyPWjwWBogZB8lzX2ZE9yWnWCU
	JfPJOkD7jtai8y5PvtQtlocdk4COM1vq8ixr34EFp958Lkdo2mkj0CF9Ym7WNtq1
	eSJPe4gogoCH2sm3aK8otw6fRVOW8d4zTbJlO2xX/ByWKIvTlLwV1U2X2uQphHaP
	2VeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1715335493; x=1715421893; bh=utGzqHCYGLMkQ
	01p311OO4Yqbsn17yCC9KJUN2Gj224=; b=QpmVqh4CyOc8KHOYLzUbS5PtRJRA+
	cbpl3N39tBFJawxeTO7KN8B90f73rVzNNymdh7Y6cEm3t0G5lVXcdi+d6sF0yQyI
	oL2rA0QT7DazqMpg1y70C5aVG0h+QavpJawA6C7cZML2WscvaJW+SBTsGL/YqGkZ
	ub3H3uFFtByyZ7yLOxxPkilzxktohs3Cifw73e+xVLvJBQsoE8K2cqIPaVn44lcW
	36TPj9w9QrrPq7YnlVolkeveL5BRnEd8BWqSH2MyahAZGFxsru8auJiQNp1kICPl
	R8bKJPcf92an3yK2WIIpZZnMYWAgco5aXFuDpBz4Zo6Ff9bEKWBXUeV0w==
X-ME-Sender: <xms:RfE9ZpTfBjRMJpnrAHgMiQb27Xd15VwB9wIzXUyl4ZedEuV4EUGXVA>
    <xme:RfE9ZixGMhALpt7Enn7GGI2NvItszLWXQ9k3A8TgU5gz19jMLvdJKNKcEAMEDQ5ks
    4ip6EH6xu0NkbMq-zU>
X-ME-Received: <xmr:RfE9Zu3AY-ChwWzLGU5q9YPYzGMHy1ISoR7fkj8yeysolcEZAxVOCfArXZrne3r3FPVoOkWCsO-Ayzp5ROriEJcrWbJPSPu05UHn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdefkedgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefg
    ffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:RfE9ZhB_Lc-bgQOZG9HbF9fKW5Y-Im9Z5Fizkccpv5T78KQyyExvXQ>
    <xmx:RfE9Zig-i1VBDeljf1oCNykv2oCC6M3nCDmVs1cj4bmrEiitinXWrw>
    <xmx:RfE9ZloD6APSQjYwQeg7mEueCyrg6bZvUOBn-lO4b5ko-YyOhS3Hdg>
    <xmx:RfE9ZtjaYbJTYRWtjf_nxzq959dkMSJFe8flR05v7sS-l5G0OBFgMw>
    <xmx:RfE9ZpqgTVF8Xoqxab8ePOXZ9DKzqCrKR63A6x0xnD473-N2QEEnKDyG>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 May 2024 06:04:51 -0400 (EDT)
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
Subject: [PATCH] media: staging: max96712: Store format in subdev active state
Date: Fri, 10 May 2024 12:03:47 +0200
Message-ID: <20240510100347.102392-1-niklas.soderlund+renesas@ragnatech.se>
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
---
 drivers/staging/media/max96712/max96712.c | 36 +++++++++++++++++------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index c44145284aa1..2da65ccd2c57 100644
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
@@ -324,6 +338,10 @@ static int max96712_v4l2_register(struct max96712_priv *priv)
 
 	v4l2_set_subdevdata(&priv->sd, priv);
 
+	ret = v4l2_subdev_init_finalize(&priv->sd);
+	if (ret)
+		goto error;
+
 	ret = v4l2_async_register_subdev(&priv->sd);
 	if (ret < 0) {
 		dev_err(&priv->client->dev, "Unable to register subdevice\n");
-- 
2.45.0


