Return-Path: <linux-media+bounces-32240-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0AEAB296B
	for <lists+linux-media@lfdr.de>; Sun, 11 May 2025 17:47:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 225403B8590
	for <lists+linux-media@lfdr.de>; Sun, 11 May 2025 15:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D362571C8;
	Sun, 11 May 2025 15:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Bkd52J7i";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EhM6moet"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674A91EA90
	for <linux-media@vger.kernel.org>; Sun, 11 May 2025 15:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746978443; cv=none; b=OEMiEZsjqBJBtP1IL6WWmxak7G21zSHLZS7KwbauBm4RAm9HPxuqF6OuZPqdmGVGtbt4EHqLUCDwYd9pRZBscuVkiPtSCk7PUBReux/mxCnxKhp5ICxi7DopzUzVuJ7p9UrnqP+G3pGUKpwKdgqFBWt7uAjiUIFFHI8KILThobI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746978443; c=relaxed/simple;
	bh=SaEgtNVOZMsAKQ2x1bG7/9X7X1g+a101rNccmImymAs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pgPruiH7CEUpywajDXgcniqXbVXTfeDJwwNEGQViJ/2DzooPHwVbvtmvEORU2xUXIyxBw5oDktk97naRf01gIahiJylzGiu+pJgFyh8xjTAWnd3HtFme9904wmGMCY2xNaAu8l1WLyiWIHnc0rh7S9vtEQzPrNec+LLc0x6cxak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Bkd52J7i; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EhM6moet; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 46BC2138004F;
	Sun, 11 May 2025 11:47:17 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 11 May 2025 11:47:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1746978437; x=1747064837; bh=JK
	Uh7xD+fCn7GI8RRa0K8uZCr96ffYknr5zplbIgZTg=; b=Bkd52J7iykBPp5jd77
	wwV/OMX6E1IWZi8AdoZggFLe/U23KeJubjuwjKxwwols0eHPRIZzNkeJT8QJ9fbm
	l1WxtDK5XIUHqahkKvsFzlu7c6+flrQJIa9rqNQFyPhOaElFP6nogyuvpMvb7C8F
	4RRqVoyvmFDZRRao9KHkQvnm9sZ7fxzeGhBUu0Th4CaW3ZUnUEAX6cBx3MdG+QOu
	aIwZFoKjIJ2BTsci+kj+5vfBZ8oDf8SObPZmEDQckQPmXtxZs0uo93aMVoJvFLV3
	Qs9owUuqfKBWYfAf5kzHabRwX+NEXNYmGdo5OZuI9um2QpkPlucRbTnY7K9SDTFH
	egoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1746978437; x=1747064837; bh=JKUh7xD+fCn7GI8RRa0K8uZCr96f
	fYknr5zplbIgZTg=; b=EhM6moetWtSPfJrTesBlqmK6N5VZF1G4ERXABLxAn02O
	rmLouPpDK5evfIj+V4nYg9pP9WlJ/R0A92gTFuRZa/4Z81anNhcZQXTZXVDNxUJy
	fqucVuQYVEPm0EWGb8apI85pJ7e4LuowjtNJse5QUQIEY2GKTwoJWvMCPJOFClUq
	4hLIBtHBQv01nptA3p7XOJoQ4DIBX8AUz7Msa7pMokA7EbcOAWgReQeHYIrOj6Bk
	ajC6cvErpTDYjpfrXbqZmwAQh3WYF4hca5o10KsvIxlg4xkAmYfsCxpnNvz8BZHQ
	kfeVu1SRzLSsFDfYavtoITftI9NexGb2G5jI/Sq9OQ==
X-ME-Sender: <xms:hMYgaFk9xVkFKYsHwYtWa-m_FAobqr2N96ZrB0-0KUEbqXDXmxSXog>
    <xme:hMYgaA0xG3LSFFoZUmWqaWCwlUSoTxsedr9sM6ZusGBOHiJa8Qwmz0wgDp9-oIV5v
    JbvJLpU0MzN4HdD42s>
X-ME-Received: <xmr:hMYgaLroAXlvlLvsyaMy3n8goPiSjO6QAwC_jYDu9mBA2nDLPWOtXBTMFHwMI18u9Yz1eJ33TKJCOHa4hm5qEpr8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleekjeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpedttdfh
    geffveevgeekteegleegtdeltefhgfeuveffffeigefggfejfeehjeevkeenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshho
    uggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeegpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhu
    gidrihhnthgvlhdrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrth
    esihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughi
    rgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhoug
    gvrhhluhhnugesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:hMYgaFmfQllagj3CcpHomplh4T7VVhbzpxv36x6ER4KVhP1MAHKpYA>
    <xmx:hMYgaD2T1yyTIBorTsJyLzCiADbQbtL2ZUxJcvMwTaGQbMoBCUC6lg>
    <xmx:hMYgaEsbNemaFANpFFdVKG0hqf7NdC6UL2jDyEB4FUNqa_Obw1cJKQ>
    <xmx:hMYgaHWS46dgKl9oo0gVlxuYfoC3-yhuiyI1h9T0C3j1n1UPL7r7NA>
    <xmx:hcYgaI1Yk6OC-aiy7PObgm5NO20fACZvxRDIwfYcwNesDGf6pWNVU4dN>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 May 2025 11:47:16 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: [raw2rgbpnm,PATCH] Add support for all RAW memory layouts
Date: Sun, 11 May 2025 17:46:59 +0200
Message-ID: <20250511154659.778725-1-niklas.soderlund@ragnatech.se>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Convert all supported RAW input images to GRBG memory layout before
feeding it to the RAW to RGB conversion algorithms. This way all layouts
can produced good colors in the output image.

Limit the conversion to input images that have an even width and height
to make the conversion easier.

Images with and uneven width or hight can sill be processed, but will
be processed without first being converted to GRBG layout. Such input
images will result, just as before this change, in output images with
bad colors. The warning message about this have been preserved.

Signed-off-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
---
 raw2rgbpnm.c | 98 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 95 insertions(+), 3 deletions(-)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index 5838bc7347e9..b834add4ea6c 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -186,6 +186,97 @@ static unsigned char *read_raw_data(char *filename, int width, int height,
 	return b;
 }
 
+static int raw_layout_to_grbg(const struct format_info *info, unsigned char *src,
+			      int src_width, int src_height, unsigned int src_stride)
+{
+	int swap_line = 0;
+	int swap_gbrg = 0;
+	int dst_x, dst_y;
+
+	switch (info->fmt) {
+	case V4L2_PIX_FMT_SBGGR16:
+	case V4L2_PIX_FMT_SBGGR14:
+	case V4L2_PIX_FMT_SBGGR12:
+	case V4L2_PIX_FMT_SBGGR10:
+	case V4L2_PIX_FMT_SBGGR8:
+		swap_line = 1; /* BGGR -> GBRG */
+		swap_gbrg = 1; /* GBRG -> GRBG */
+		break;
+	case V4L2_PIX_FMT_SGBRG16:
+	case V4L2_PIX_FMT_SGBRG14:
+	case V4L2_PIX_FMT_SGBRG12:
+	case V4L2_PIX_FMT_SGBRG10:
+	case V4L2_PIX_FMT_SGBRG8:
+		swap_gbrg = 1; /* GBRG -> GRBG */
+		break;
+	case V4L2_PIX_FMT_SRGGB16:
+	case V4L2_PIX_FMT_SRGGB14:
+	case V4L2_PIX_FMT_SRGGB12:
+	case V4L2_PIX_FMT_SRGGB10:
+	case V4L2_PIX_FMT_SRGGB8:
+		swap_line = 1; /* RGGB -> GRBG */
+		break;
+	case V4L2_PIX_FMT_SGRBG16:
+	case V4L2_PIX_FMT_SGRBG14:
+	case V4L2_PIX_FMT_SGRBG12:
+	case V4L2_PIX_FMT_SGRBG10:
+	case V4L2_PIX_FMT_SGRBG8:
+		/* No conversion needed. */
+		break;
+	default:
+		return -1;
+	}
+
+	if (src_width % 2 != 0 || src_height % 2 != 0) {
+		printf("WARNING: bayer layout conversion not supported for uneven sized images -> expect bad colors\n");
+		return 0;
+	}
+
+	if (swap_line) {
+		/* Swap pixel pairs on each line AB -> BA. */
+		for (dst_y=0; dst_y<src_height; dst_y++) {
+			for (dst_x=0; dst_x<src_width; dst_x += 2) {
+				if (info->bpp == 8) {
+					unsigned char *p1 = &(src[src_stride*dst_y+(dst_x+0)]);
+					unsigned char *p2 = &(src[src_stride*dst_y+(dst_x+1)]);
+					unsigned char tmp = *p1;
+					*p1 = *p2;
+					*p2 = tmp;
+				} else {
+					unsigned short *p1 = (unsigned short *)&(src[src_stride*dst_y+(dst_x+0)*2]);
+					unsigned short *p2 = (unsigned short *)&(src[src_stride*dst_y+(dst_x+1)*2]);
+					unsigned short tmp = *p1;
+					*p1 = *p2;
+					*p2 = tmp;
+				}
+			}
+		}
+	}
+
+	if (swap_gbrg) {
+		/* Swap R and B components, format is always GBRG at this point. */
+		for (dst_y=0; dst_y<src_height; dst_y += 2) {
+			for (dst_x=0; dst_x<src_width; dst_x += 2) {
+				if (info->bpp == 8) {
+					unsigned char *p1 = &(src[src_stride*(dst_y+0)+(dst_x+1)]);
+					unsigned char *p2 = &(src[src_stride*(dst_y+1)+(dst_x+0)]);
+					unsigned char tmp = *p1;
+					*p1 = *p2;
+					*p2 = tmp;
+				} else {
+					unsigned short *p1 = (unsigned short *)&(src[src_stride*(dst_y+0)+(dst_x+1)*2]);
+					unsigned short *p2 = (unsigned short *)&(src[src_stride*(dst_y+1)+(dst_x+0)*2]);
+					unsigned short tmp = *p1;
+					*p1 = *p2;
+					*p2 = tmp;
+				}
+			}
+		}
+	}
+
+	return 0;
+}
+
 static void raw_to_rgb(const struct format_info *info,
 		       unsigned char *src, int src_width, int src_height, unsigned char *rgb)
 {
@@ -480,7 +571,8 @@ static void raw_to_rgb(const struct format_info *info,
 	case V4L2_PIX_FMT_SBGGR10:
 	case V4L2_PIX_FMT_SGBRG10:
 	case V4L2_PIX_FMT_SRGGB10:
-		printf("WARNING: bayer phase not supported -> expect bad colors\n");
+		if (raw_layout_to_grbg(info, src, src_width, src_height, src_stride))
+			error("Can't convert RAW layout to GRBG");
 		/* fallthrough */
 	case V4L2_PIX_FMT_SGRBG16:
 	case V4L2_PIX_FMT_SGRBG14:
@@ -523,10 +615,10 @@ static void raw_to_rgb(const struct format_info *info,
 	case V4L2_PIX_FMT_SBGGR8:
 	case V4L2_PIX_FMT_SGBRG8:
 	case V4L2_PIX_FMT_SRGGB8:
-		printf("WARNING: bayer phase not supported -> expect bad colors\n");
+		if (raw_layout_to_grbg(info, src, src_width, src_height, src_stride))
+			error("Can't convert RAW layout to GRBG");
 		/* fallthrough */
 	case V4L2_PIX_FMT_SGRBG8:
-		/* FIXME: only SGRBG8 handled properly: color phase is ignored. */
 		buf = malloc(src_width * src_height * 3);
 		if (buf==NULL) error("out of memory");
 		qc_imag_bay2rgb8(src, src_stride, buf, src_width*3, src_width, src_height, 3);
-- 
2.49.0


