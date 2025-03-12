Return-Path: <linux-media+bounces-28099-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B48FA5E43D
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 20:18:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 177667A5011
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 19:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 545F8258CC0;
	Wed, 12 Mar 2025 19:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="jVZQYja1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="V3CeWC67"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6611D79A0
	for <linux-media@vger.kernel.org>; Wed, 12 Mar 2025 19:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741807083; cv=none; b=aPIEUXFX2QC4Puxo3XeCubXnRasbslbv1MIhfqEsKiD3BJNhxJ6kVK8RPR4pHasWHJ1BYqn6oxmTrqR3fzVicvZhbVY6SfxLTvFJDuV9eRGNKl6xm889JOK4k37mstLD+Zy8hNA/Y/GVVlECaulNiZRX82Xbwhx47PrHznmCkf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741807083; c=relaxed/simple;
	bh=1shuGN1fmfMh/ncO2CqgDZ375XDzzKrVtaalnYg891c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IqTpdI8jASr2dECrJ+gF5PemtSlIhULQg5LMWRtRp4S6kItTTjAM40srXG051CMljygaYAaBI/YmnN19ICmXBvKaFlGpjDK9DbLWj/FluVSRSFlpCHntj4CG5wmESJBmlY3796x3cHN7eSzk6r7nyx/KfwThfJhJDEuL/G7s2OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=jVZQYja1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=V3CeWC67; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 6ECC61140166;
	Wed, 12 Mar 2025 15:18:00 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Wed, 12 Mar 2025 15:18:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1741807080;
	 x=1741893480; bh=Z6NSzSxPnKynhriOxdCiZBxvLt4HWN908taU8hGlNCk=; b=
	jVZQYja1xm6wghYmo9E0WixY7cNTZm84cvbZgbvBqjGVcRDIOCJP6zE5GATZ+K4V
	ERNdQ7G1TzvFokP3f+7oyihOBr6pNRBTH9rMjKiC5N+8hDOj73flTwQ75bra9rC0
	CeR71y9DxsmIVr4yYqJ5fQaBoWYKGkOosvKWKzFR58JL2VNT6H5LB42nXw6rYldR
	i4tnTmCDo9Zd1iA+UnyMMMGPckZzwi6eIo6YBOTYYKqvmxVPuJE7So9duTFBGWt+
	BPVcUbL5y+GEJ7fO3/bw4sf6Y0FvVVKg10YR7yRSckpDAzM8+BE6JcA/Pru84eiA
	uhNlMnburY0lwkBHnnNfOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1741807080; x=
	1741893480; bh=Z6NSzSxPnKynhriOxdCiZBxvLt4HWN908taU8hGlNCk=; b=V
	3CeWC67w9sMwndB0JQbOugdCV7a63gx4ELur/7rYiTR6UjPGPefc83goAe9nEl2F
	MGR3HeYTAYfpWApEvGAMhRb4aK0IMHauJRAeJNsKH9oJDzath536u50U2ioiBtWm
	eH3N67q73QGoS2aMIl8dpqlGpIO3FNJGcrm//t/vDDr7KUZyKqmIM77VTvHnJ90F
	ZzVP66mB9k3pw74db+1gYeYc5AQE2mjdnzx8y+ctaWK44NzVzKsgq3dHT5Hvz1Nl
	ZFHuY76aV2CIjx5PmJCSKYCuiPm4cR1otm7CX8QAxR9aJipSOa7MpxYhG+wfCklb
	RWi2hOe9i8gBpUVMSZsEA==
X-ME-Sender: <xms:6N3RZ9rNiF9LxNGU9Q7vk8gVEnnKu2mXa5n_QSY0PGnarKw22AT1Ww>
    <xme:6N3RZ_qdH6_f3U4jt7vxLGIqD0OSMKoP_qP1EfftQa5DzyV8ivkkof6VswZiT0phG
    UaI1lXLVmMPmYk1Jh0>
X-ME-Received: <xmr:6N3RZ6M3PV6BKsMNraV0dT2zD-VzbUYe5UaBWfvLWElCOUjvWUVoP3vhbQ1FBL8Pt6NAzEeV7a_gTt87yXx7iM5cdA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdehkeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpedt
    jeegkeeiudffhefhgedugeefueekkeffgeeltdeifeekheejveeifeffheevueenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdr
    shhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeegpd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhi
    nhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrg
    hrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgv
    ughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrsh
    houggvrhhluhhnugesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:6N3RZ46ONAmf2hwED0H345p_utO6nSUBDc_X9RzGAGAlm8ijZs9sAg>
    <xmx:6N3RZ84KoO4NPcLKCPFyhFcDqzHNHUbWBarUDMlqRXzU6ci7CC4tyg>
    <xmx:6N3RZwhKqH5zCwjTbBJZYIZnQju_Btd4309byS_tMvYcuy3ZGOdq3w>
    <xmx:6N3RZ-5GKMKDIVJHrm1juzbRZ1i_fFqtcp8Zgo2-A2t6npwzOg5pnQ>
    <xmx:6N3RZ32FlnIhjm_oTQMBLadoxZP2j7Axu3_oLkY43jztr_fPNERhyl3R>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Mar 2025 15:17:59 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: [raw2rgbpnm 3/3] Add support for multi plane formats with stride
Date: Wed, 12 Mar 2025 20:17:10 +0100
Message-ID: <20250312191710.1823147-4-niklas.soderlund@ragnatech.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312191710.1823147-1-niklas.soderlund@ragnatech.se>
References: <20250312191710.1823147-1-niklas.soderlund@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Parsing NV16 that have a stride that is larger then the image width
results in incorrect frames, and no warning message being printed.

Fix this by extending the format information structure with how many
(concatenated) planes an image is constructed of. And by extending the
raw reader to take this information into account.

With this change it is possible to parse NV12, NV21, NV16, and NV61
frames from disk with a stride larger then the image width and have
correct frames produced.

Signed-off-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
---
 raw2rgbpnm.c | 121 +++++++++++++++++++++++++++------------------------
 1 file changed, 65 insertions(+), 56 deletions(-)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index d8d4bb198498..5838bc7347e9 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -55,60 +55,61 @@ static const struct format_info {
 	unsigned int y_pos;
 	unsigned int cb_pos;
 	unsigned int cr_pos;
+	unsigned int planes;
 } v4l2_pix_fmt_str[] = {
-	{ V4L2_PIX_FMT_RGB332,	8,  0,  "RGB332 (8 RGB-3-3-2)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_RGB555,	16, 5,  "RGB555 (16 RGB-5-5-5)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_RGB565,	16, 0,  "RGB565 (16 RGB-5-6-5)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_BGR24,	24, 8,  "BGR24 (24 BGR-8-8-8)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_RGB24,	24, 8,  "RGB24 (24 RGB-8-8-8)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_BGR32,	32, 8,  "BGR32 (32 BGR-8-8-8-8)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_RGB32,	32, 8,  "RGB32 (32 RGB-8-8-8-8)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_GREY,	8,  8,  "GREY (8 Greyscale)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_Y10,	16, 10, "Y10 (10 Greyscale)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_Y12,	16, 12, "Y12 (12 Greyscale)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_Y16,	16, 16, "Y16 (16 Greyscale)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_UYVY,	16, 8,  "UYVY (16 YUV 4:2:2)", 1, 0, 2 },
-	{ V4L2_PIX_FMT_VYUY,	16, 8,  "VYUY (16 YUV 4:2:2)", 1, 2, 0 },
-	{ V4L2_PIX_FMT_YUYV,	16, 8,  "YUYV (16 YUV 4:2:2)", 0, 1, 3 },
-	{ V4L2_PIX_FMT_YVYU,	16, 8,  "YVYU (16 YUV 4:2:2)", 0, 3, 1 },
-	{ V4L2_PIX_FMT_YUV32,	32, 8,  "YUV32 (32-bit A/XYUV 8-8-8-8)", 1, 2, 3 },
-	{ V4L2_PIX_FMT_AYUV32,	32, 8,  "AYUV32 (32-bit AYUV 8-8-8-8)", 1, 2, 3 },
-	{ V4L2_PIX_FMT_XYUV32,	32, 8,  "XYUV32 (32-bit XYUV 8-8-8-8)", 1, 2, 3 },
-	{ V4L2_PIX_FMT_VUYA32,	32, 8,  "VUYA32 (32-bit VUYA 8-8-8-8)", 2, 1, 0 },
-	{ V4L2_PIX_FMT_VUYX32,	32, 8,  "VUYX32 (32-bit VUYX 8-8-8-8)", 2, 1, 0 },
-	{ V4L2_PIX_FMT_YUVA32,	32, 8,  "YUVA32 (32-bit YUVA 8-8-8-8)", 0, 1, 2 },
-	{ V4L2_PIX_FMT_YUVX32,	32, 8,  "YUVX32 (32-bit YUVX 8-8-8-8)", 0, 1, 2 },
-	{ V4L2_PIX_FMT_YUV411P,	12, 8,  "YUV411P (12 YUV 4:1:1 planar)", 0, 0, 1 },
-	{ V4L2_PIX_FMT_YUV420,	12, 8,  "YUV420P (12 YUV 4:2:0 planar)", 0, 0, 1 },
-	{ V4L2_PIX_FMT_YVU420,	12, 8,  "YVU420P (12 YVU 4:2:2 planar)", 0, 1, 0 },
-	{ V4L2_PIX_FMT_YUV422P,	16, 8,  "YUV422P (16 YUV 4:2:2 planar)", 0, 0, 1 },
-	{ V4L2_PIX_FMT_YVU422M,	16, 8,  "YVU422P (16 YVU 4:2:2 planar)", 0, 1, 0 },
-	{ V4L2_PIX_FMT_YUV444M,	24, 8,  "YUV444P (24 YUV 4:4:4 planar)", 0, 0, 1 },
-	{ V4L2_PIX_FMT_YVU444M,	24, 8,  "YVU444P (24 YVU 4:4:4 planar)", 0, 1, 0 },
-	{ V4L2_PIX_FMT_NV12,	12, 8,  "NV12 (12 Y/CbCr 4:2:0)", 0, 0, 1 },
-	{ V4L2_PIX_FMT_NV21,	12, 8,  "NV21 (12 Y/CrCb 4:2:0)", 0, 1, 0 },
-	{ V4L2_PIX_FMT_NV16,	16, 8,  "NV16 (16 Y/CbCr 4:2:2)", 0, 0, 1 },
-	{ V4L2_PIX_FMT_NV61,	16, 8,  "NV61 (16 Y/CrCb 4:2:2)", 0, 1, 0 },
-	{ V4L2_PIX_FMT_SBGGR8,	8,  8,  "SBGGR8 (8 BGBG.. GRGR..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SGBRG8,	8,  8,  "SGBRG8 (8 GBGB.. RGRG..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SGRBG8,	8,  8,  "SGRBG8 (8 GRGR.. BGBG..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SRGGB8,	8,  8,  "SRGGB8 (8 RGRG.. GBGB..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SBGGR10,	16, 10, "SBGGR10 (10 BGBG.. GRGR..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SGBRG10,	16, 10, "SGBRG10 (10 GBGB.. RGRG..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SGRBG10,	16, 10, "SGRBG10 (10 GRGR.. BGBG..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SRGGB10,	16, 10, "SRGGB10 (10 RGRG.. GBGB..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SBGGR12,	16, 12, "SBGGR12 (12 BGBG.. GRGR..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SGBRG12,	16, 12, "SGBRG12 (12 GBGB.. RGRG..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SGRBG12,	16, 12, "SGRBG12 (12 GRGR.. BGBG..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SRGGB12,	16, 12, "SRGGB12 (12 RGRG.. GBGB..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SBGGR14,	16, 14, "SBGGR14 (14 BGBG.. GRGR..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SGBRG14,	16, 14, "SGBRG14 (14 GBGB.. RGRG..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SGRBG14,	16, 14, "SGRBG14 (14 GRGR.. BGBG..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SRGGB14,	16, 14, "SRGGB14 (14 RGRG.. GBGB..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SBGGR16,	16, 16, "SBGGR16 (16 BGBG.. GRGR..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SGBRG16,	16, 16, "SGBRG16 (16 GBGB.. RGRG..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SGRBG16,	16, 16, "SGRBG16 (16 GRGR.. BGBG..)", 0, 0, 0 },
-	{ V4L2_PIX_FMT_SRGGB16,	16, 16, "SRGGB16 (16 RGRG.. GBGB..)", 0, 0, 0 },
+	{ V4L2_PIX_FMT_RGB332,	8,  0,  "RGB332 (8 RGB-3-3-2)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_RGB555,	16, 5,  "RGB555 (16 RGB-5-5-5)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_RGB565,	16, 0,  "RGB565 (16 RGB-5-6-5)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_BGR24,	24, 8,  "BGR24 (24 BGR-8-8-8)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_RGB24,	24, 8,  "RGB24 (24 RGB-8-8-8)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_BGR32,	32, 8,  "BGR32 (32 BGR-8-8-8-8)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_RGB32,	32, 8,  "RGB32 (32 RGB-8-8-8-8)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_GREY,	8,  8,  "GREY (8 Greyscale)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_Y10,	16, 10, "Y10 (10 Greyscale)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_Y12,	16, 12, "Y12 (12 Greyscale)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_Y16,	16, 16, "Y16 (16 Greyscale)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_UYVY,	16, 8,  "UYVY (16 YUV 4:2:2)", 1, 0, 2, 1 },
+	{ V4L2_PIX_FMT_VYUY,	16, 8,  "VYUY (16 YUV 4:2:2)", 1, 2, 0, 1 },
+	{ V4L2_PIX_FMT_YUYV,	16, 8,  "YUYV (16 YUV 4:2:2)", 0, 1, 3, 1 },
+	{ V4L2_PIX_FMT_YVYU,	16, 8,  "YVYU (16 YUV 4:2:2)", 0, 3, 1, 1 },
+	{ V4L2_PIX_FMT_YUV32,	32, 8,  "YUV32 (32-bit A/XYUV 8-8-8-8)", 1, 2, 3, 1 },
+	{ V4L2_PIX_FMT_AYUV32,	32, 8,  "AYUV32 (32-bit AYUV 8-8-8-8)", 1, 2, 3, 1 },
+	{ V4L2_PIX_FMT_XYUV32,	32, 8,  "XYUV32 (32-bit XYUV 8-8-8-8)", 1, 2, 3, 1 },
+	{ V4L2_PIX_FMT_VUYA32,	32, 8,  "VUYA32 (32-bit VUYA 8-8-8-8)", 2, 1, 0, 1 },
+	{ V4L2_PIX_FMT_VUYX32,	32, 8,  "VUYX32 (32-bit VUYX 8-8-8-8)", 2, 1, 0, 1 },
+	{ V4L2_PIX_FMT_YUVA32,	32, 8,  "YUVA32 (32-bit YUVA 8-8-8-8)", 0, 1, 2, 1 },
+	{ V4L2_PIX_FMT_YUVX32,	32, 8,  "YUVX32 (32-bit YUVX 8-8-8-8)", 0, 1, 2, 1 },
+	{ V4L2_PIX_FMT_YUV411P,	12, 8,  "YUV411P (12 YUV 4:1:1 planar)", 0, 0, 1, 1 },
+	{ V4L2_PIX_FMT_YUV420,	12, 8,  "YUV420P (12 YUV 4:2:0 planar)", 0, 0, 1, 1 },
+	{ V4L2_PIX_FMT_YVU420,	12, 8,  "YVU420P (12 YVU 4:2:2 planar)", 0, 1, 0, 1 },
+	{ V4L2_PIX_FMT_YUV422P,	16, 8,  "YUV422P (16 YUV 4:2:2 planar)", 0, 0, 1, 1 },
+	{ V4L2_PIX_FMT_YVU422M,	16, 8,  "YVU422P (16 YVU 4:2:2 planar)", 0, 1, 0, 1 },
+	{ V4L2_PIX_FMT_YUV444M,	24, 8,  "YUV444P (24 YUV 4:4:4 planar)", 0, 0, 1, 1 },
+	{ V4L2_PIX_FMT_YVU444M,	24, 8,  "YVU444P (24 YVU 4:4:4 planar)", 0, 1, 0, 1 },
+	{ V4L2_PIX_FMT_NV12,	12, 8,  "NV12 (12 Y/CbCr 4:2:0)", 0, 0, 1, 2 },
+	{ V4L2_PIX_FMT_NV21,	12, 8,  "NV21 (12 Y/CrCb 4:2:0)", 0, 1, 0, 2 },
+	{ V4L2_PIX_FMT_NV16,	16, 8,  "NV16 (16 Y/CbCr 4:2:2)", 0, 0, 1, 2 },
+	{ V4L2_PIX_FMT_NV61,	16, 8,  "NV61 (16 Y/CrCb 4:2:2)", 0, 1, 0, 2 },
+	{ V4L2_PIX_FMT_SBGGR8,	8,  8,  "SBGGR8 (8 BGBG.. GRGR..)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_SGBRG8,	8,  8,  "SGBRG8 (8 GBGB.. RGRG..)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_SGRBG8,	8,  8,  "SGRBG8 (8 GRGR.. BGBG..)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_SRGGB8,	8,  8,  "SRGGB8 (8 RGRG.. GBGB..)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_SBGGR10,	16, 10, "SBGGR10 (10 BGBG.. GRGR..)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_SGBRG10,	16, 10, "SGBRG10 (10 GBGB.. RGRG..)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_SGRBG10,	16, 10, "SGRBG10 (10 GRGR.. BGBG..)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_SRGGB10,	16, 10, "SRGGB10 (10 RGRG.. GBGB..)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_SBGGR12,	16, 12, "SBGGR12 (12 BGBG.. GRGR..)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_SGBRG12,	16, 12, "SGBRG12 (12 GBGB.. RGRG..)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_SGRBG12,	16, 12, "SGRBG12 (12 GRGR.. BGBG..)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_SRGGB12,	16, 12, "SRGGB12 (12 RGRG.. GBGB..)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_SBGGR14,	16, 14, "SBGGR14 (14 BGBG.. GRGR..)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_SGBRG14,	16, 14, "SGBRG14 (14 GBGB.. RGRG..)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_SGRBG14,	16, 14, "SGRBG14 (14 GRGR.. BGBG..)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_SRGGB14,	16, 14, "SRGGB14 (14 RGRG.. GBGB..)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_SBGGR16,	16, 16, "SBGGR16 (16 BGBG.. GRGR..)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_SGBRG16,	16, 16, "SGBRG16 (16 GBGB.. RGRG..)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_SGRBG16,	16, 16, "SGRBG16 (16 GRGR.. BGBG..)", 0, 0, 0, 1 },
+	{ V4L2_PIX_FMT_SRGGB16,	16, 16, "SRGGB16 (16 RGRG.. GBGB..)", 0, 0, 0, 1 },
 };
 
 static void *xalloc(int size)
@@ -130,14 +131,17 @@ static const struct format_info *get_format_info(__u32 f)
 	return NULL;
 }
 
-/* Read and return raw image data at given bits per pixel (bpp) depth. */
-static unsigned char *read_raw_data(char *filename, int width, int height, int bpp)
+/* Read and return image data at given width, height and format information. */
+static unsigned char *read_raw_data(char *filename, int width, int height,
+				    const struct format_info *info)
 {
 	/* Get file size */
 	unsigned int line_length;
 	unsigned int padding = 0;
 	unsigned char *b = NULL;
 	unsigned int i;
+	int bpp = info->bpp;
+
 	FILE *f = fopen(filename, "rb");
 	if (!f) error("fopen failed");
 	int r = fseek(f, 0, SEEK_END);
@@ -147,6 +151,11 @@ static unsigned char *read_raw_data(char *filename, int width, int height, int b
 	r = fseek(f, 0, SEEK_SET);
 	if (r!=0) error("fseek");
 
+	if (info->planes > 1) {
+		bpp = info->bpc;
+		height *= info->planes;
+	}
+
 	if (file_size*8 < width*height*bpp) error("out of input data");
 	if (file_size*8 > width*height*bpp) printf("warning: too large image file\n");
 	if (file_size % height == 0) {
@@ -741,7 +750,7 @@ int main(int argc, char *argv[])
 	}
 
 	/* Read, convert, and save image */
-	src = read_raw_data(file_in, width, height, info->bpp);
+	src = read_raw_data(file_in, width, height, info);
 	printf("Image size: %ix%i, bytes per pixel: %i, format: %s\n",
 	       width, height, info->bpp, info->name);
 	dst = xalloc(width*height*3);
-- 
2.48.1


