Return-Path: <linux-media+bounces-17607-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBE896C1C3
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 17:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C8271C21EC1
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 15:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8291DC723;
	Wed,  4 Sep 2024 15:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="C92foaJq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="E3IntG+R"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62377DDCD;
	Wed,  4 Sep 2024 15:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725462472; cv=none; b=sqiWceg79kqRwsb+6m4kLLahdjxTSc7ogxMehZKoYmeZNH4PXOwlu85KATg7K+0DAAKn6EWBh7mEnNMwlTBwXeXGrFzzPJ09b95uvJRF4d2YsIdhviO8osFeopBst/Coy+2Lm0NkyS4NSopHlC2/fPVQQ53cgRAmTlxn15u4uhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725462472; c=relaxed/simple;
	bh=ni/BNtS+LVF6hehk/pejQfUJSDyj5OKt3TZU0cE96VI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=omubumL2M5DGG0U3IEDZG3i512ydVsvRIrVCk1NCg+7kDcmniVP1y9YvYk2Gwri3IiQ3CD8iFWx6IdwxQrWKwAhdRwUBHHbWab71u/fZVcskNkroi1Ua4mw3gJwGqp58hT8yN45q5uOp7xU3mJAUiEJr5ouOZQch/pX1PZvaLK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=C92foaJq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=E3IntG+R; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3DFD911402B7;
	Wed,  4 Sep 2024 11:07:47 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 04 Sep 2024 11:07:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1725462467; x=1725548867; bh=oX
	U4ySuEw133d+hVH1hAwzzqFdvqLDQ7uEYJ1Csl/HU=; b=C92foaJqMbTI57EAL5
	+RVsabuda1yGq+kwQwEsu6TZ/VRNMmvoLiSXSJwsXtTh1yULFTUZPCyfZXsNug+2
	15SIvRy1a9KUCW+yDQToW6/kgmfSVNAHvRpP8NShUck70sBLWFzwpXUesNsCrmXI
	VpFqCO05CFKnVKjlk7XiLpYjCDQtEi8UDTkME89gQNiwfFZuoHneJWRjJ/+1MeEy
	L22aaEnQsqLddRIKdmCUxrHTz0MREr+RREcK3EPFOtEWCEwXk7wQ6K2GhSk+d+WK
	9weMglyR1ILchfyZn1tKJMwpAFO2I1x4Ap43mXbAV4UghF0dx5UrO8cQYlZ/ZNmu
	5KQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1725462467; x=1725548867; bh=oXU4ySuEw133d
	+hVH1hAwzzqFdvqLDQ7uEYJ1Csl/HU=; b=E3IntG+RUlfD7tlN2gmEOXdCTHl7c
	lCXVGb/p7TTEwGzLzW/af37ceLDHbuJZa7lq0j/Ql0qTJ1Z4aUTp6rwhqOXM2IJ/
	NLLj/ZJz80smNzpXWJteae3xJPC8Kfwqvq29DhftmodFNrXTcohcF9fUQa1Q4g4a
	d34H80ArZ9DOAUcEn31kcIrEkgSZPHr1CCjO3Ea47Ey4bFX/gN+aZOSgA++vH0JI
	DHBU88OA+EOYv1nTuLW8Zp6CVSESKLBBYVUs2DNUliF0v/Y4FWMPVivG8pdaINKQ
	QCri26ZdabnYxps4d3j0Lf+E+Nt/92atlJoLWOZ5/JJibKnjob73YCnQg==
X-ME-Sender: <xms:wnfYZomw6EK9Tknagy-Y22uSY4l2YJkMUQjhc7HrdnqGT1MWqu88Zw>
    <xme:wnfYZn1c8F_PaZ0U1B8o6x4uh9bDkWjYufDmkk9rBFVlhHklcRiz_O6dbVJilOEb8
    T0rAWIz4epOt02i-rA>
X-ME-Received: <xmr:wnfYZmoHDG3PyIvcPN_GdBuHeX5VrFDMQbVSSiMGbI6hQY_e5uO9Qkyg3KTDIOPfqzNZI18nz9gU6LmT01uZ4BbVrw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehjedgkeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecu
    hfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrh
    hluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgv
    rhhnpeehudelteetkefgffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfeetge
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhk
    lhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtth
    hopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehhvhgvrhhkuhhilhesgihs
    gegrlhhlrdhnlhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgu
    rdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhguod
    hrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:wnfYZknQY0PBfvLpBzI0iChhTZKL793ciD9a_bF4xG4ziCk3Wev46Q>
    <xmx:wnfYZm0JMexxdUfEObrTY49su87eff5l0TSE_nAnR4nrqYi_xl7CqQ>
    <xmx:wnfYZruNu1Y774PB4NSm6WcJ_z4SeFRb_JY2sLe0O_6nXpQmAQZfqw>
    <xmx:wnfYZiXsMrTALf4dAuBiLGxE-UIb5Bp6cUCgL0wXP-c3RDXTcXHNZA>
    <xmx:w3fYZgpK99cspnKWRjwYiVvL4UEfodlUeYMGdZ42IUkJLC9G9mblxMDX>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Sep 2024 11:07:46 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2] media: rcar-vin: Add support for RAW10
Date: Wed,  4 Sep 2024 17:06:56 +0200
Message-ID: <20240904150656.1495705-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some R-Car SoCs are capable of capturing RAW10. Extend the format
enumeration, validation and setup to expose and configure for this
format if the particular device supports it.

The VIN is usually capable of converting from most media bus formats to
a range of different pixel formats. However if the input media bus
format is a RAW10 format this is not possible so the corresponding pixel
output format is forced.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Update rvin_enum_fmt_vid_cap().
- Switch to use the correct bayer media and media bus formats.

* Changes since RFC
- Fix spelling in rcar-vin.h
---
 .../platform/renesas/rcar-vin/rcar-core.c     |  1 +
 .../platform/renesas/rcar-vin/rcar-dma.c      | 30 +++++++++++++
 .../platform/renesas/rcar-vin/rcar-v4l2.c     | 43 +++++++++++++++++++
 .../platform/renesas/rcar-vin/rcar-vin.h      |  4 +-
 4 files changed, 77 insertions(+), 1 deletion(-)

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
index 21d5b2815e86..a6e79d47408d 100644
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
@@ -790,6 +792,12 @@ static int rvin_setup(struct rvin_dev *vin)
 	case MEDIA_BUS_FMT_Y8_1X8:
 		vnmc |= VNMC_INF_RAW8;
 		break;
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+		vnmc |= VNMC_INF_RGB666;
+		break;
 	default:
 		break;
 	}
@@ -898,6 +906,12 @@ static int rvin_setup(struct rvin_dev *vin)
 			dmr = 0;
 		}
 		break;
+	case V4L2_PIX_FMT_SBGGR10:
+	case V4L2_PIX_FMT_SGBRG10:
+	case V4L2_PIX_FMT_SGRBG10:
+	case V4L2_PIX_FMT_SRGGB10:
+		dmr = VNDMR_RMODE_RAW10 | VNDMR_YC_THR;
+		break;
 	default:
 		vin_err(vin, "Invalid pixelformat (0x%x)\n",
 			vin->format.pixelformat);
@@ -1280,6 +1294,22 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
 		if (vin->format.pixelformat != V4L2_PIX_FMT_GREY)
 			return -EPIPE;
 		break;
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+		if (vin->format.pixelformat != V4L2_PIX_FMT_SBGGR10)
+			return -EPIPE;
+		break;
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+		if (vin->format.pixelformat != V4L2_PIX_FMT_SGBRG10)
+			return -EPIPE;
+		break;
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+		if (vin->format.pixelformat != V4L2_PIX_FMT_SGRBG10)
+			return -EPIPE;
+		break;
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+		if (vin->format.pixelformat != V4L2_PIX_FMT_SRGGB10)
+			return -EPIPE;
+		break;
 	default:
 		return -EPIPE;
 	}
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
index bb4b07bed28d..756fdfdbce61 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
@@ -86,6 +86,22 @@ static const struct rvin_video_format rvin_formats[] = {
 		.fourcc			= V4L2_PIX_FMT_GREY,
 		.bpp			= 1,
 	},
+	{
+		.fourcc			= V4L2_PIX_FMT_SBGGR10,
+		.bpp			= 4,
+	},
+	{
+		.fourcc			= V4L2_PIX_FMT_SGBRG10,
+		.bpp			= 4,
+	},
+	{
+		.fourcc			= V4L2_PIX_FMT_SGRBG10,
+		.bpp			= 4,
+	},
+	{
+		.fourcc			= V4L2_PIX_FMT_SRGGB10,
+		.bpp			= 4,
+	},
 };
 
 const struct rvin_video_format *rvin_format_from_pixel(struct rvin_dev *vin,
@@ -106,6 +122,13 @@ const struct rvin_video_format *rvin_format_from_pixel(struct rvin_dev *vin,
 		if (!vin->info->nv12 || !(BIT(vin->id) & 0x3333))
 			return NULL;
 		break;
+	case V4L2_PIX_FMT_SBGGR10:
+	case V4L2_PIX_FMT_SGBRG10:
+	case V4L2_PIX_FMT_SGRBG10:
+	case V4L2_PIX_FMT_SRGGB10:
+		if (!vin->info->raw10)
+			return NULL;
+		break;
 	default:
 		break;
 	}
@@ -407,6 +430,26 @@ static int rvin_enum_fmt_vid_cap(struct file *file, void *priv,
 			return -EINVAL;
 		f->pixelformat = V4L2_PIX_FMT_SRGGB8;
 		return 0;
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+		if (f->index)
+			return -EINVAL;
+		f->pixelformat = V4L2_PIX_FMT_SBGGR10;
+		return 0;
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+		if (f->index)
+			return -EINVAL;
+		f->pixelformat = V4L2_PIX_FMT_SGBRG10;
+		return 0;
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+		if (f->index)
+			return -EINVAL;
+		f->pixelformat = V4L2_PIX_FMT_SGRBG10;
+		return 0;
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+		if (f->index)
+			return -EINVAL;
+		f->pixelformat = V4L2_PIX_FMT_SRGGB10;
+		return 0;
 	default:
 		return -EINVAL;
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
2.46.0


