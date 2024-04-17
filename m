Return-Path: <linux-media+bounces-9668-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACD48A82BF
	for <lists+linux-media@lfdr.de>; Wed, 17 Apr 2024 14:06:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D82F1C21276
	for <lists+linux-media@lfdr.de>; Wed, 17 Apr 2024 12:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5991313CFBC;
	Wed, 17 Apr 2024 12:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="LqBVyY6L";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eTcpsVSn"
X-Original-To: linux-media@vger.kernel.org
Received: from flow2-smtp.messagingengine.com (flow2-smtp.messagingengine.com [103.168.172.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF8013C675;
	Wed, 17 Apr 2024 12:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713355571; cv=none; b=IkQNAlANiVQx0dWzUP7Crj1VHIPTNmNLfIQZwFxj+HzM87sbokfsGws4C19oulgpLgVoMdieu3x/lvuluazfwAB6rHMuJn9crr/fB9IOILuoPTZwZyG8EYLqTkpz0BkOja6nMIa8YInNXugYy35KbGf+uZzZmOSK0kFNx5d73Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713355571; c=relaxed/simple;
	bh=hPwUo1pYLJvWnFOlhtq6S9jAcLckCVZbhC5P+YvYnkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iaobQEqgjGo+8PMHvCwjk9xwuoWxutOQH5sbFfuQPWuImsoLGo/4JXKGo5NNw4aduxnOszOkFFDjRwUhMdXr1Vx725EPOGGZidaN0kEntVtSpa0FHAMHjLmyrAjNFN5EXjKnveiJaRjdNOqBni+cSiMoRqn4uRnQyh2urmDO2uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=LqBVyY6L; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eTcpsVSn; arc=none smtp.client-ip=103.168.172.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailflow.nyi.internal (Postfix) with ESMTP id 4CCD220006A;
	Wed, 17 Apr 2024 08:03:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 17 Apr 2024 08:03:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1713355402; x=1713359002; bh=TO
	fbDp0+Gyk2RzLmGnDRZMqsaYHGvqHXqML+ubNxdBA=; b=LqBVyY6Lm7jvPhjcmi
	L9H7J247E3R4BPFKqnTsQJzbYFM+uNK1HUt9WuqEajoGykQpyx5t4Cqgnqz7y5Ot
	0Tjc2rbbEHTz/dmBSak2UAfFApfHbRjuh/VjL/N3x7h6wKdcXm6IH/T0uI7/q0HN
	klGzlM5XmXMYdgHx2DjLn85H4r3dlFbat82dOf4yTEt6DDQSXtr7UiJgSRqL38P6
	GE/JBZO3ZMqjLNuMT8XpR53n8kzLbfFyY5hMBnZikTj1mbsRUmIgEwuqqMCP4umI
	AuTfr1w+auynjZEgzuE3JAD0RhIg+cKZB1Tojt0XnvDgfzKW9ZSz6WbqhWXDKfXR
	qPww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1713355402; x=1713359002; bh=TOfbDp0+Gyk2R
	zLmGnDRZMqsaYHGvqHXqML+ubNxdBA=; b=eTcpsVSnX7WMRHY8elEhRxxAg+1jw
	UH2qk1Nfge4AOklUQJCR0OUq6X6IP6SxmQfKoeJjRwzFn6B5fIQXS9fSz0pyNbbM
	/BrL4vMZv1A6IJVY9T8e2NmWr6/xXmrPTHKBZ/KsxaUvzXzRhUfxFWqX5Cgqpula
	XLjgJLhOrFc5OIdW+rmSu3NwQCUfw6JH0gCKs5niZoJCKc4idJs9BW12cZlNvWZV
	1COUaCHWTWw8vnhC8tNYWs++51Gop/GZvqwr6lwP/Lb0J+tND2vFfPvkGLJMEKM7
	U9e0ctkswaNt8aBVd+ALecVJLQYzXZrXE2Tl5cBJg7M2jakhWT+7hk5yQ==
X-ME-Sender: <xms:ibofZrQZMRpyQsJMCgd3y4pZFx5LpH7zrKBx09WH_ZxdYI-_d4zQSA>
    <xme:ibofZszF5VXSfHzIPVEntJavB8tTYw8Sef9DpBQBPNMuau74W84O_jpv-DoEaSpHe
    X2xFh8vM-n4RzlGOvM>
X-ME-Received: <xmr:ibofZg3Y-jlOKZQ-uVgRqew0GjQOIgZ0hLx7GivIp8pu71wIrqGwscqainuBeYGKIPFet9K9sGpkpJu7RhtLERH1L7JO0N1LZhO3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudejkedggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefg
    ffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:ibofZrAXycQ1THuiJVBCyugG_dwQAGBAxupEM4AV6RRblKfJ19EMUQ>
    <xmx:ibofZkj6aiezPYrjg92BLWfFJW8SZFOU8GK9gJeOzKu7xzrJcEtPPg>
    <xmx:ibofZvrcr5AWLjI_TBx7Bb7hQz0q8rOJxww7q2qHa0rGpFTJzKWiKA>
    <xmx:ibofZvhDf5DgR7rdGUqnFTZGd1_Yj8N96zWMqyAF46SYppP3-1_1BA>
    <xmx:irofZnsIcCcILuVoEQuhlDQ1ZLzkMVq7QqB9Kgjtra4s9R94Shtfh6us>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Apr 2024 08:03:20 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: rcar-vin: Add support for RAW10
Date: Wed, 17 Apr 2024 14:02:30 +0200
Message-ID: <20240417120230.4086364-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some R-Car SoCs are capable of capturing RAW10. Add support for it
using the V4L2_PIX_FMT_Y10 pixel format, which I think is the correct
format to express RAW10 unpacked to users.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since RFC
- Fix spelling in rcar-vin.h
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c |  1 +
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c  | 12 ++++++++++++
 drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c |  8 ++++++++
 drivers/media/platform/renesas/rcar-vin/rcar-vin.h  |  4 +++-
 4 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 809c3a38cc4a..e9675cb8faa2 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -1279,6 +1279,7 @@ static const struct rvin_info rcar_info_r8a779a0 = {
 	.use_mc = true,
 	.use_isp = true,
 	.nv12 = true,
+	.raw10 = true,
 	.max_width = 4096,
 	.max_height = 4096,
 };
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index e2c40abc6d3d..dd290054dfe7 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -123,7 +123,9 @@
 /* Video n Data Mode Register bits */
 #define VNDMR_A8BIT(n)		(((n) & 0xff) << 24)
 #define VNDMR_A8BIT_MASK	(0xff << 24)
+#define VNDMR_RMODE_RAW10	(2 << 19)
 #define VNDMR_YMODE_Y8		(1 << 12)
+#define VNDMR_YC_THR		(1 << 11)
 #define VNDMR_EXRGB		(1 << 8)
 #define VNDMR_BPSM		(1 << 4)
 #define VNDMR_ABIT		(1 << 2)
@@ -780,6 +782,9 @@ static int rvin_setup(struct rvin_dev *vin)
 	case MEDIA_BUS_FMT_Y8_1X8:
 		vnmc |= VNMC_INF_RAW8;
 		break;
+	case MEDIA_BUS_FMT_Y10_1X10:
+		vnmc |= VNMC_INF_RGB666;
+		break;
 	default:
 		break;
 	}
@@ -888,6 +893,9 @@ static int rvin_setup(struct rvin_dev *vin)
 			dmr = 0;
 		}
 		break;
+	case V4L2_PIX_FMT_Y10:
+		dmr = VNDMR_RMODE_RAW10 | VNDMR_YC_THR;
+		break;
 	default:
 		vin_err(vin, "Invalid pixelformat (0x%x)\n",
 			vin->format.pixelformat);
@@ -1270,6 +1278,10 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
 		if (vin->format.pixelformat != V4L2_PIX_FMT_GREY)
 			return -EPIPE;
 		break;
+	case MEDIA_BUS_FMT_Y10_1X10:
+		if (vin->format.pixelformat != V4L2_PIX_FMT_Y10)
+			return -EPIPE;
+		break;
 	default:
 		return -EPIPE;
 	}
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
index bb4b07bed28d..e7298688541d 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
@@ -86,6 +86,10 @@ static const struct rvin_video_format rvin_formats[] = {
 		.fourcc			= V4L2_PIX_FMT_GREY,
 		.bpp			= 1,
 	},
+	{
+		.fourcc			= V4L2_PIX_FMT_Y10,
+		.bpp			= 4,
+	},
 };
 
 const struct rvin_video_format *rvin_format_from_pixel(struct rvin_dev *vin,
@@ -106,6 +110,10 @@ const struct rvin_video_format *rvin_format_from_pixel(struct rvin_dev *vin,
 		if (!vin->info->nv12 || !(BIT(vin->id) & 0x3333))
 			return NULL;
 		break;
+	case V4L2_PIX_FMT_Y10:
+		if (!vin->info->raw10)
+			return NULL;
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
index 997a66318a29..f87d4bc9e53e 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
@@ -151,7 +151,8 @@ struct rvin_group_route {
  * @model:		VIN model
  * @use_mc:		use media controller instead of controlling subdevice
  * @use_isp:		the VIN is connected to the ISP and not to the CSI-2
- * @nv12:		support outputing NV12 pixel format
+ * @nv12:		support outputting NV12 pixel format
+ * @raw10:		support outputting RAW10 pixel format
  * @max_width:		max input width the VIN supports
  * @max_height:		max input height the VIN supports
  * @routes:		list of possible routes from the CSI-2 recivers to
@@ -163,6 +164,7 @@ struct rvin_info {
 	bool use_mc;
 	bool use_isp;
 	bool nv12;
+	bool raw10;
 
 	unsigned int max_width;
 	unsigned int max_height;
-- 
2.44.0


