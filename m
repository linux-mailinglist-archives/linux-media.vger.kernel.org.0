Return-Path: <linux-media+bounces-28100-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91621A5E43E
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 20:18:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E7ED17A1BE
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 19:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA0F2561A3;
	Wed, 12 Mar 2025 19:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="pUAI1vkc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ybY64IzJ"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ED1257ACA
	for <linux-media@vger.kernel.org>; Wed, 12 Mar 2025 19:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741807085; cv=none; b=Z7sHThkFVuIFoJ5MyZV9jeAtwW3XQ1oiGXSBiMRc1F27DuwLWSlkLp6CiAYBT363LJln1doUA9MAgmILrehwEASdtSkjYlWt+tcGWGHCdGbqdZ1jJXEaeM1S7nw75wGl1BeyC3azHQyX4Xbd+6BBV4JKS0i2UNZbv1imVrQbmxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741807085; c=relaxed/simple;
	bh=Wkx4gCvAe9LbJO+NqlntUcKS8anfIeqb7oQ5/ASYNiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r0t6eaSZVinAYMZTMTgSkq6DznVM4j/Qy+ZUstze56E18CN3wTROwHNoOG6dRgtjpnZL+s6Rr1QbzyOIdDLj33UOrnNBOcgKq6jZNPx5qAO+52DXwomTI260uL0ow0axkNI4sFTkR35PhbE+J5ickHdZ1be3vcHNc7/St1aFLuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=pUAI1vkc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ybY64IzJ; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id 305CC11400C0;
	Wed, 12 Mar 2025 15:17:58 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Wed, 12 Mar 2025 15:17:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1741807078;
	 x=1741893478; bh=9VW6HsZ7MZ+NznOFxRK5BLZzz1F7JyRChSdOW4AHUx4=; b=
	pUAI1vkcNViTy1hWC2iYeqMsqEyKP7x/HSnda1YTqlvn0N35+B2oLkpTQFbbdWvV
	t5ouUYXDdqnM26FxQdcDA+3MHVa4kil0CTV7goZB9AOc0Y+HJQTVVNcBmuMwnWDv
	2ZtPzmsRwUOOMJm7BGaFHyyyki5YLCbEhQxGS+DRm+hUSgd0c3dDikq+YLSIaTa/
	yPVE5LCDjfOwwV0p/Q75qYVAb1DXRvXROT7GzKIbiF5m4sK9TdA4uQmzjWuY7TNj
	p3ZciKeDCBhMV2mBQrm8ctNb0vC6KTx8aO4yYk13EySxW/Kp0JL3VMvGMOANfiLM
	hrm/5K26SbIC0Hepd3rjLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1741807078; x=
	1741893478; bh=9VW6HsZ7MZ+NznOFxRK5BLZzz1F7JyRChSdOW4AHUx4=; b=y
	bY64IzJ2lcM3nyvdwsv3c9QdVXT7IQLtMjzuA48yDcRECK45cQcf7xYKQF7OvOI1
	ATss6t5PnZxu5F7ym50FGqKaE49xst4/hWIpmNSHbUSY/Pt9OQE/PyyeKJpLYHPd
	t7xe9t8me0DsYd1woCZcjD3DkUBfHtse/nlRbd665ugOHaInaRyA0HRpgfi6WqTZ
	5Vhh+QtG53AWFesQGujO848tJNbMnrCOIoSQm8dlIp7jaQLh1pt2/6FFYbxYAPhi
	72LVwkEI1tgzU6Bld/kyKtIzojZ0zxTKZVs1tAl0H8AIYDu7Ahyi9LGxLk7ZpIlj
	HoF0CEX5n/ItuCG6BfZJA==
X-ME-Sender: <xms:5d3RZzUJ4w1HP8LTYypgV0or3l8ZugNY7oyDsB-PaVISX3acpCnpPw>
    <xme:5d3RZ7mlwp58SuiuRZbk4ObQM9P7zleRJKHNX6Z26bHANMySMM3pLI56Jy4ylRRi7
    R1DqLp9V52h8CbWKa0>
X-ME-Received: <xmr:5d3RZ_YdsaUoHsC8oWwx6mnKSscszes2rn3dImZEUB7ejxzEowcA6Yqo0W_6-IJs05G8ZE6d5JT0GnkH_jbXHKUN7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdehkeekucetufdoteggodetrf
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
X-ME-Proxy: <xmx:5d3RZ-UxAOU654mbBbYeAk_AdL7guAJhmzoXv1GXz5MJ8Ro_pNXqlg>
    <xmx:5d3RZ9nASH-AHU5O2rpQNdMdTLWz1_4aSBVvHY1W3klFNEWA2InUSQ>
    <xmx:5d3RZ7euLwZJZyJO0b-98XVtClqvfgghiPo957GInxcDmQhe5gR3lA>
    <xmx:5d3RZ3Ffl640ibTRox0ie9_0pXXJiVoq67mQ4ny9yUNx0PG7ldUPFA>
    <xmx:5t3RZ2ALEdWN8j8rUw_CuAswBllYQ7ts1TY4OSX5P4IkyEfgzSusdwzS>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Mar 2025 15:17:56 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: [raw2rgbpnm 2/3] Remove guessing of source image size
Date: Wed, 12 Mar 2025 20:17:09 +0100
Message-ID: <20250312191710.1823147-3-niklas.soderlund@ragnatech.se>
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

Remove the feature to guess a frame size from file size. This is an
odd feature and the list of resolutions to guess from contains entries
for '5 MP + a bit extra', which don't feel like a good standard
resolution.

This feature however block trying to make the function calls stricter by
making it explicit which functions can, and can not, modify the frame
size. Remove the guessing and tighten up the all function calls using
the source image size.

Signed-off-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
---
Hello,

This patch could possibly be reworked to keep the guessing, while still
allowing for a stricter interface. But I'm in a cleaning mode and this
guessing feels wrong. But if somebody is actually using it I would be
happy to do the work.
---
 raw2rgbpnm.c | 195 +++++++++++++++++++++++----------------------------
 1 file changed, 87 insertions(+), 108 deletions(-)

diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
index e5ed0af99070..d8d4bb198498 100644
--- a/raw2rgbpnm.c
+++ b/raw2rgbpnm.c
@@ -130,24 +130,8 @@ static const struct format_info *get_format_info(__u32 f)
 	return NULL;
 }
 
-static const int resolutions[][2] = {
-	{ 176, 144 },		/* QCIF */
-	{ 320, 240 },		/* QVGA */
-	{ 352, 288 },		/* CIF */
-	{ 640, 480 },		/* VGA */
-	{ 720, 576 },		/* PAL D1 */
-	{ 768, 576 },		/* 1:1 aspect PAL D1 */
-	{ 1920, 1440 },		/* 3VGA */
-	{ 2560, 1920 },		/* 4VGA */
-	{ 2592, 1944 },		/* 5 MP */
-	{ 2592, 1968 },		/* 5 MP + a bit extra */
-};
-
-/* Read and return raw image data at given bits per pixel (bpp) depth.
- * size should be set correctly before calling this function.
- * If set to {-1,-1}, try to guess image file resolution.
- */
-static unsigned char *read_raw_data(char *filename, int size[2], int bpp)
+/* Read and return raw image data at given bits per pixel (bpp) depth. */
+static unsigned char *read_raw_data(char *filename, int width, int height, int bpp)
 {
 	/* Get file size */
 	unsigned int line_length;
@@ -163,33 +147,24 @@ static unsigned char *read_raw_data(char *filename, int size[2], int bpp)
 	r = fseek(f, 0, SEEK_SET);
 	if (r!=0) error("fseek");
 
-	/* Check image resolution */
-	if (size[0]<=0 || size[1]<=0) {
-		for (i=0; i<SIZE(resolutions); i++)
-			if (resolutions[i][0]*resolutions[i][1]*bpp==file_size*8) break;
-		if (i >= SIZE(resolutions)) error("can't guess raw image file resolution");
-		size[0] = resolutions[i][0];
-		size[1] = resolutions[i][1];
-	}
-
-	if (file_size*8 < size[0]*size[1]*bpp) error("out of input data");
-	if (file_size*8 > size[0]*size[1]*bpp) printf("warning: too large image file\n");
-	if (file_size % size[1] == 0) {
-		line_length = size[0] * bpp / 8;
-		padding = file_size / size[1] - line_length;
+	if (file_size*8 < width*height*bpp) error("out of input data");
+	if (file_size*8 > width*height*bpp) printf("warning: too large image file\n");
+	if (file_size % height == 0) {
+		line_length = width * bpp / 8;
+		padding = file_size / height - line_length;
 		printf("%u padding bytes detected at end of line\n", padding);
-	} else if ((file_size * 8) % (size[0] * size[1] * bpp) != 0) {
+	} else if ((file_size * 8) % (width * height * bpp) != 0) {
 		printf("warning: input size not multiple of frame size\n");
 	}
 
 	/* Read data */
-	b = xalloc((size[0]*size[1]*bpp+7)/8);
+	b = xalloc((width*height*bpp+7)/8);
 	if (padding == 0) {
-		r = fread(b, (size[0]*size[1]*bpp+7)/8, 1, f);
+		r = fread(b, (width*height*bpp+7)/8, 1, f);
 		if (r != 1)
 			error("fread");
 	} else {
-		for (i = 0; i < (unsigned int)size[1]; ++i) {
+		for (i = 0; i < (unsigned int)height; ++i) {
 			r = fread(b + i * line_length, line_length, 1, f);
 			if (r != 1)
 				error("fread");
@@ -203,10 +178,10 @@ static unsigned char *read_raw_data(char *filename, int size[2], int bpp)
 }
 
 static void raw_to_rgb(const struct format_info *info,
-		       unsigned char *src, int src_size[2], unsigned char *rgb)
+		       unsigned char *src, int src_width, int src_height, unsigned char *rgb)
 {
-	unsigned int src_stride = src_size[0] * info->bpp / 8;
-	unsigned int rgb_stride = src_size[0] * 3;
+	unsigned int src_stride = src_width * info->bpp / 8;
+	unsigned int rgb_stride = src_width * 3;
 	unsigned char *src_luma, *src_chroma;
 	unsigned char *src_cb, *src_cr;
 	unsigned char *buf;
@@ -229,8 +204,8 @@ static void raw_to_rgb(const struct format_info *info,
 		cb_pos = info->cb_pos;
 		cr_pos = info->cr_pos;
 
-		for (src_y = 0, dst_y = 0; dst_y < src_size[1]; src_y++, dst_y++) {
-			for (src_x = 0, dst_x = 0; dst_x < src_size[0]; ) {
+		for (src_y = 0, dst_y = 0; dst_y < src_height; src_y++, dst_y++) {
+			for (src_x = 0, dst_x = 0; dst_x < src_width; ) {
 				cb = src[src_y*src_stride + src_x*4 + cb_pos];
 				cr = src[src_y*src_stride + src_x*4 + cr_pos];
 
@@ -264,8 +239,8 @@ static void raw_to_rgb(const struct format_info *info,
 		cb_pos = info->cb_pos;
 		cr_pos = info->cr_pos;
 
-		for (src_y = 0, dst_y = 0; dst_y < src_size[1]; src_y++, dst_y++) {
-			for (src_x = 0, dst_x = 0; dst_x < src_size[0]; ) {
+		for (src_y = 0, dst_y = 0; dst_y < src_height; src_y++, dst_y++) {
+			for (src_x = 0, dst_x = 0; dst_x < src_width; ) {
 				a  = src[src_y*src_stride + src_x*4 + y_pos];
 				cb = src[src_y*src_stride + src_x*4 + cb_pos];
 				cr = src[src_y*src_stride + src_x*4 + cr_pos];
@@ -287,13 +262,13 @@ static void raw_to_rgb(const struct format_info *info,
 		/* fallthrough */
 	case V4L2_PIX_FMT_NV12:
 		src_luma = src;
-		src_chroma = &src[src_size[0] * src_size[1]];
+		src_chroma = &src[src_width * src_height];
 		src_stride = src_stride * 8 / 12;
 
-		for (src_y = 0, dst_y = 0; dst_y < src_size[1]; src_y++, dst_y++) {
+		for (src_y = 0, dst_y = 0; dst_y < src_height; src_y++, dst_y++) {
 			cr = 0;
 
-			for (dst_x = 0, src_x = 0; dst_x < src_size[0]; ) {
+			for (dst_x = 0, src_x = 0; dst_x < src_width; ) {
 				a  = src_luma[dst_y*src_stride + dst_x];
 				cb = src_chroma[(dst_y/2)*src_stride + dst_x + 1 - color_pos];
 				yuv_to_rgb(a,cb,cr, &r, &g, &b);
@@ -318,14 +293,14 @@ static void raw_to_rgb(const struct format_info *info,
 	case V4L2_PIX_FMT_NV16:
 	case V4L2_PIX_FMT_NV61:
 		src_luma = src;
-		src_chroma = &src[src_size[0] * src_size[1]];
+		src_chroma = &src[src_width * src_height];
 		src_stride = src_stride * 8 / 16;
 
 		cb_pos = info->cb_pos;
 		cr_pos = info->cr_pos;
 
-		for (src_y = 0, dst_y = 0; dst_y < src_size[1]; src_y++, dst_y++) {
-			for (dst_x = 0, src_x = 0; dst_x < src_size[0]; ) {
+		for (src_y = 0, dst_y = 0; dst_y < src_height; src_y++, dst_y++) {
+			for (dst_x = 0, src_x = 0; dst_x < src_width; ) {
 				cb = src_chroma[dst_y*src_stride + dst_x + cb_pos];
 				cr = src_chroma[dst_y*src_stride + dst_x + cr_pos];
 
@@ -350,12 +325,12 @@ static void raw_to_rgb(const struct format_info *info,
 
 	case V4L2_PIX_FMT_YUV411P:
 		src_luma = src;
-		src_cb = &src[src_size[0] * src_size[1]];
-		src_cr = &src[src_size[0] * src_size[1] / 4 * 5];
+		src_cb = &src[src_width * src_height];
+		src_cr = &src[src_width * src_height / 4 * 5];
 		src_stride = src_stride * 8 / 12;
 
-		for (src_y = 0, dst_y = 0; dst_y < src_size[1]; src_y++, dst_y++) {
-			for (dst_x = 0, src_x = 0; dst_x < src_size[0]; ) {
+		for (src_y = 0, dst_y = 0; dst_y < src_height; src_y++, dst_y++) {
+			for (dst_x = 0, src_x = 0; dst_x < src_width; ) {
 				a  = src_luma[dst_y*src_stride + dst_x];
 				cb = src_cb[dst_y*src_stride/4 + dst_x/4];
 				cr = src_cr[dst_y*src_stride/4 + dst_x/4];
@@ -374,16 +349,16 @@ static void raw_to_rgb(const struct format_info *info,
 	case V4L2_PIX_FMT_YVU420:
 		src_luma = src;
 		if (info->cb_pos == 0) {
-			src_cb = &src[src_size[0] * src_size[1]];
-			src_cr = &src[src_size[0] * src_size[1] / 4 * 5];
+			src_cb = &src[src_width * src_height];
+			src_cr = &src[src_width * src_height / 4 * 5];
 		} else {
-			src_cr = &src[src_size[0] * src_size[1]];
-			src_cb = &src[src_size[0] * src_size[1] / 4 * 5];
+			src_cr = &src[src_width * src_height];
+			src_cb = &src[src_width * src_height / 4 * 5];
 		}
 		src_stride = src_stride * 8 / 12;
 
-		for (src_y = 0, dst_y = 0; dst_y < src_size[1]; src_y++, dst_y++) {
-			for (dst_x = 0, src_x = 0; dst_x < src_size[0]; ) {
+		for (src_y = 0, dst_y = 0; dst_y < src_height; src_y++, dst_y++) {
+			for (dst_x = 0, src_x = 0; dst_x < src_width; ) {
 				a  = src_luma[dst_y*src_stride + dst_x];
 				cb = src_cb[(dst_y/2)*src_stride/2 + dst_x/2];
 				cr = src_cr[(dst_y/2)*src_stride/2 + dst_x/2];
@@ -402,16 +377,16 @@ static void raw_to_rgb(const struct format_info *info,
 	case V4L2_PIX_FMT_YVU422M:
 		src_luma = src;
 		if (info->cb_pos == 0) {
-			src_cb = &src[src_size[0] * src_size[1]];
-			src_cr = &src[src_size[0] * src_size[1] / 2 * 3];
+			src_cb = &src[src_width * src_height];
+			src_cr = &src[src_width * src_height / 2 * 3];
 		} else {
-			src_cr = &src[src_size[0] * src_size[1]];
-			src_cb = &src[src_size[0] * src_size[1] / 2 * 3];
+			src_cr = &src[src_width * src_height];
+			src_cb = &src[src_width * src_height / 2 * 3];
 		}
 		src_stride = src_stride * 8 / 16;
 
-		for (src_y = 0, dst_y = 0; dst_y < src_size[1]; src_y++, dst_y++) {
-			for (dst_x = 0, src_x = 0; dst_x < src_size[0]; ) {
+		for (src_y = 0, dst_y = 0; dst_y < src_height; src_y++, dst_y++) {
+			for (dst_x = 0, src_x = 0; dst_x < src_width; ) {
 				a  = src_luma[dst_y*src_stride + dst_x];
 				cb = src_cb[dst_y*src_stride/2 + dst_x/2];
 				cr = src_cr[dst_y*src_stride/2 + dst_x/2];
@@ -430,16 +405,16 @@ static void raw_to_rgb(const struct format_info *info,
 	case V4L2_PIX_FMT_YVU444M:
 		src_luma = src;
 		if (info->cb_pos == 0) {
-			src_cb = &src[src_size[0] * src_size[1]];
-			src_cr = &src[src_size[0] * src_size[1] * 2];
+			src_cb = &src[src_width * src_height];
+			src_cr = &src[src_width * src_height * 2];
 		} else {
-			src_cr = &src[src_size[0] * src_size[1]];
-			src_cb = &src[src_size[0] * src_size[1] * 2];
+			src_cr = &src[src_width * src_height];
+			src_cb = &src[src_width * src_height * 2];
 		}
 		src_stride = src_stride * 8 / 24;
 
-		for (src_y = 0, dst_y = 0; dst_y < src_size[1]; src_y++, dst_y++) {
-			for (dst_x = 0, src_x = 0; dst_x < src_size[0]; ) {
+		for (src_y = 0, dst_y = 0; dst_y < src_height; src_y++, dst_y++) {
+			for (dst_x = 0, src_x = 0; dst_x < src_width; ) {
 				a  = src_luma[dst_y*src_stride + dst_x];
 				cb = src_cb[dst_y*src_stride + dst_x];
 				cr = src_cr[dst_y*src_stride + dst_x];
@@ -458,8 +433,8 @@ static void raw_to_rgb(const struct format_info *info,
 	case V4L2_PIX_FMT_Y12:
 	case V4L2_PIX_FMT_Y10:
 		shift = info->bpc - 8;
-		for (src_y = 0, dst_y = 0; dst_y < src_size[1]; src_y++, dst_y++) {
-			for (src_x = 0, dst_x = 0; dst_x < src_size[0]; ) {
+		for (src_y = 0, dst_y = 0; dst_y < src_height; src_y++, dst_y++) {
+			for (src_x = 0, dst_x = 0; dst_x < src_width; ) {
 				a = (src[src_y*src_stride + src_x*2+0] |
 				     (src[src_y*src_stride + src_x*2+1] << 8)) >> shift;
 				rgb[dst_y*rgb_stride+3*dst_x+0] = a;
@@ -472,8 +447,8 @@ static void raw_to_rgb(const struct format_info *info,
 		break;
 
 	case V4L2_PIX_FMT_GREY:
-		for (src_y = 0, dst_y = 0; dst_y < src_size[1]; src_y++, dst_y++) {
-			for (src_x = 0, dst_x = 0; dst_x < src_size[0]; ) {
+		for (src_y = 0, dst_y = 0; dst_y < src_height; src_y++, dst_y++) {
+			for (src_x = 0, dst_x = 0; dst_x < src_width; ) {
 				a = src[src_y*src_stride + src_x];
 				rgb[dst_y*rgb_stride+3*dst_x+0] = a;
 				rgb[dst_y*rgb_stride+3*dst_x+1] = a;
@@ -504,8 +479,8 @@ static void raw_to_rgb(const struct format_info *info,
 	case V4L2_PIX_FMT_SGRBG10:
 		shift = info->bpc - 10;
 
-		for (dst_y=0; dst_y<src_size[1]; dst_y++) {
-			for (dst_x=0; dst_x<src_size[0]; dst_x++) {
+		for (dst_y=0; dst_y<src_height; dst_y++) {
+			for (dst_x=0; dst_x<src_width; dst_x++) {
 				unsigned short *p = (unsigned short *)&(src[src_stride*dst_y+dst_x*2]);
 				int v = *p;
 				if (highbits)
@@ -522,12 +497,12 @@ static void raw_to_rgb(const struct format_info *info,
 			}
 		}
 
-		buf = malloc(src_size[0] * src_size[1] * 3);
+		buf = malloc(src_width * src_height * 3);
 		if (buf==NULL) error("out of memory");
-		qc_imag_bay2rgb10(src, src_stride, buf, src_size[0]*3, src_size[0], src_size[1], 3);
-		for (dst_y=0; dst_y<src_size[1]; dst_y++) {
-			for (dst_x=0; dst_x<src_size[0]; dst_x++) {
-				unsigned char *p = buf + src_size[0]*3*dst_y + dst_x*3;
+		qc_imag_bay2rgb10(src, src_stride, buf, src_width*3, src_width, src_height, 3);
+		for (dst_y=0; dst_y<src_height; dst_y++) {
+			for (dst_x=0; dst_x<src_width; dst_x++) {
+				unsigned char *p = buf + src_width*3*dst_y + dst_x*3;
 				rgb[dst_y*rgb_stride+3*dst_x+0] = swaprb ? p[2] : p[0];
 				rgb[dst_y*rgb_stride+3*dst_x+1] = p[1];
 				rgb[dst_y*rgb_stride+3*dst_x+2] = swaprb ? p[0] : p[2];
@@ -543,12 +518,12 @@ static void raw_to_rgb(const struct format_info *info,
 		/* fallthrough */
 	case V4L2_PIX_FMT_SGRBG8:
 		/* FIXME: only SGRBG8 handled properly: color phase is ignored. */
-		buf = malloc(src_size[0] * src_size[1] * 3);
+		buf = malloc(src_width * src_height * 3);
 		if (buf==NULL) error("out of memory");
-		qc_imag_bay2rgb8(src, src_stride, buf, src_size[0]*3, src_size[0], src_size[1], 3);
-		for (dst_y=0; dst_y<src_size[1]; dst_y++) {
-			for (dst_x=0; dst_x<src_size[0]; dst_x++) {
-				unsigned char *p = buf + src_size[0]*3*dst_y + dst_x*3;
+		qc_imag_bay2rgb8(src, src_stride, buf, src_width*3, src_width, src_height, 3);
+		for (dst_y=0; dst_y<src_height; dst_y++) {
+			for (dst_x=0; dst_x<src_width; dst_x++) {
+				unsigned char *p = buf + src_width*3*dst_y + dst_x*3;
 				rgb[dst_y*rgb_stride+3*dst_x+0] = swaprb ? p[2] : p[0];
 				rgb[dst_y*rgb_stride+3*dst_x+1] = p[1];
 				rgb[dst_y*rgb_stride+3*dst_x+2] = swaprb ? p[0] : p[2];
@@ -558,8 +533,8 @@ static void raw_to_rgb(const struct format_info *info,
 		break;
 
 	case V4L2_PIX_FMT_RGB332:
-		for (src_y = 0, dst_y = 0; dst_y < src_size[1]; src_y++, dst_y++) {
-			for (src_x = 0, dst_x = 0; dst_x < src_size[0]; ) {
+		for (src_y = 0, dst_y = 0; dst_y < src_height; src_y++, dst_y++) {
+			for (src_x = 0, dst_x = 0; dst_x < src_width; ) {
 				pixel = src[dst_y*src_stride + dst_x];
 				r = (pixel << 0) & 0xe0;
 				g = (pixel << 3) & 0xe0;
@@ -574,8 +549,8 @@ static void raw_to_rgb(const struct format_info *info,
 		break;
 
 	case V4L2_PIX_FMT_RGB555:
-		for (src_y = 0, dst_y = 0; dst_y < src_size[1]; src_y++, dst_y++) {
-			for (src_x = 0, dst_x = 0; dst_x < src_size[0]; ) {
+		for (src_y = 0, dst_y = 0; dst_y < src_height; src_y++, dst_y++) {
+			for (src_x = 0, dst_x = 0; dst_x < src_width; ) {
 				pixel = (src[dst_y*src_stride + dst_x*2 + 1] << 8)
 				      | src[dst_y*src_stride + dst_x*2 + 0];
 				r = (pixel >> 7) & 0xf8;
@@ -591,8 +566,8 @@ static void raw_to_rgb(const struct format_info *info,
 		break;
 
 	case V4L2_PIX_FMT_RGB565:
-		for (src_y = 0, dst_y = 0; dst_y < src_size[1]; src_y++, dst_y++) {
-			for (src_x = 0, dst_x = 0; dst_x < src_size[0]; ) {
+		for (src_y = 0, dst_y = 0; dst_y < src_height; src_y++, dst_y++) {
+			for (src_x = 0, dst_x = 0; dst_x < src_width; ) {
 				pixel = (src[dst_y*src_stride + dst_x*2 + 1] << 8)
 				      | src[dst_y*src_stride + dst_x*2 + 0];
 				r = (pixel >> 8) & 0xf8;
@@ -611,8 +586,8 @@ static void raw_to_rgb(const struct format_info *info,
 		swaprb = !swaprb;
 		/* fallthrough */
 	case V4L2_PIX_FMT_RGB24:
-		for (src_y = 0, dst_y = 0; dst_y < src_size[1]; src_y++, dst_y++) {
-			for (src_x = 0, dst_x = 0; dst_x < src_size[0]; ) {
+		for (src_y = 0, dst_y = 0; dst_y < src_height; src_y++, dst_y++) {
+			for (src_x = 0, dst_x = 0; dst_x < src_width; ) {
 				r = src[dst_y*src_stride + dst_x*3 + 0];
 				g = src[dst_y*src_stride + dst_x*3 + 1];
 				b = src[dst_y*src_stride + dst_x*3 + 2];
@@ -626,8 +601,8 @@ static void raw_to_rgb(const struct format_info *info,
 		break;
 
 	case V4L2_PIX_FMT_BGR32:
-		for (src_y = 0, dst_y = 0; dst_y < src_size[1]; src_y++, dst_y++) {
-			for (src_x = 0, dst_x = 0; dst_x < src_size[0]; ) {
+		for (src_y = 0, dst_y = 0; dst_y < src_height; src_y++, dst_y++) {
+			for (src_x = 0, dst_x = 0; dst_x < src_width; ) {
 				r = src[dst_y*src_stride + dst_x*4 + 2];
 				g = src[dst_y*src_stride + dst_x*4 + 1];
 				b = src[dst_y*src_stride + dst_x*4 + 0];
@@ -641,8 +616,8 @@ static void raw_to_rgb(const struct format_info *info,
 		break;
 
 	case V4L2_PIX_FMT_RGB32:
-		for (src_y = 0, dst_y = 0; dst_y < src_size[1]; src_y++, dst_y++) {
-			for (src_x = 0, dst_x = 0; dst_x < src_size[0]; ) {
+		for (src_y = 0, dst_y = 0; dst_y < src_height; src_y++, dst_y++) {
+			for (src_x = 0, dst_x = 0; dst_x < src_width; ) {
 				r = src[dst_y*src_stride + dst_x*4 + 1];
 				g = src[dst_y*src_stride + dst_x*4 + 2];
 				b = src[dst_y*src_stride + dst_x*4 + 3];
@@ -678,13 +653,14 @@ static int parse_format(const char *p, int *w, int *h)
 int main(int argc, char *argv[])
 {
 	FILE *f;
-	int size[2] = {-1,-1};
 	unsigned char *src, *dst;
 	char *file_in = NULL, *file_out = NULL;
 	int format = V4L2_PIX_FMT_UYVY;
 	const struct format_info *info;
 	int r;
 	char *algorithm_name = NULL;
+	int height = -1;
+	int width = -1;
 
 	for (;;) {
 		int c = getopt(argc, argv, "a:b:f:ghs:w");
@@ -737,7 +713,7 @@ int main(int argc, char *argv[])
 			       "-w            Swap R and B channels\n", progname, argv[0]);
 			exit(0);
 		case 's':
-			if (parse_format(optarg, &size[0], &size[1]) < 0) {
+			if (parse_format(optarg, &width, &height) < 0) {
 				error("bad size");
 				exit(0);
 			}
@@ -750,6 +726,9 @@ int main(int argc, char *argv[])
 		}
 	}
 
+	if (width < 0 || height < 0)
+		error("specify image size");
+
 	if (algorithm_name != NULL) qc_set_algorithm(algorithm_name);
 	if (argc-optind != 2) error("give input and output files");
 	file_in  = argv[optind++];
@@ -762,17 +741,17 @@ int main(int argc, char *argv[])
 	}
 
 	/* Read, convert, and save image */
-	src = read_raw_data(file_in, size, info->bpp);
-	printf("Image size: %ix%i, bytes per pixel: %i, format: %s\n", size[0], size[1],
-		info->bpp, info->name);
-	dst = xalloc(size[0]*size[1]*3);
+	src = read_raw_data(file_in, width, height, info->bpp);
+	printf("Image size: %ix%i, bytes per pixel: %i, format: %s\n",
+	       width, height, info->bpp, info->name);
+	dst = xalloc(width*height*3);
 
-	raw_to_rgb(info, src, size, dst);
+	raw_to_rgb(info, src, width, height, dst);
 	printf("Writing to file `%s'...\n", file_out);
 	f = fopen(file_out, "wb");
 	if (!f) error("file open failed");
-	fprintf(f, "P6\n%i %i\n255\n", size[0], size[1]);
-	r = fwrite(dst, size[0]*size[1]*3, 1, f);
+	fprintf(f, "P6\n%i %i\n255\n", width, height);
+	r = fwrite(dst, width*height*3, 1, f);
 	if (r!=1) error("write failed");
 	fclose(f);
 
-- 
2.48.1


