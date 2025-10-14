Return-Path: <linux-media+bounces-44463-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F25BBDAD0D
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 19:41:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 843B518896B8
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 17:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C586630BB83;
	Tue, 14 Oct 2025 17:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sOOwTlnt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28308280025
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 17:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760463668; cv=none; b=XFTVBCxp0X/zAYPXWWP2lCvIIiwnbDj0EPfI/ZenRMHazOyykGYA5Aj5vyF1QVxGURRi7rsiYwNRFkl2S06fqkZYkrp9Ed3GQ+SC6OQncEMDizkhqLdzvRoweqcspaRHpITHXZWRGfD6fBwkB1fwrBJWI2Z8Mbrb2FURR9vTgV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760463668; c=relaxed/simple;
	bh=0bnlDyRb+yHw36YBU5Q5kFj5S/M032PtYadoJNv98HY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TuHl0pN4I6vAMIyo5S3ZNFPhqTh563VZkQfC4YJ0K65N2742fbyKb9FYfoX87vnosBY3ZhdJPTo9t7oyOstNLleSYNl403y2mtksAwRO8yvYYekUCVHcNImhkQ2DlteTCP0SwAxlwRTKEY2NnLAlTJa43VoNo2X4/2DMSWbkaqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sOOwTlnt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63213C4CEE7;
	Tue, 14 Oct 2025 17:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760463664;
	bh=0bnlDyRb+yHw36YBU5Q5kFj5S/M032PtYadoJNv98HY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sOOwTlnty3FcXYtluBWiqHMi3MYDEozZpJ2ebdN+7o0DeRFKIjacXDpi+cIDuHXco
	 JG+j+LoOUMak5xtlTxpNeG3RLpJnKf8u0ge2amG9DDNGlpoC5nNiADo4/u8X4uzV62
	 qGhjhTplsxkV3dzH/JTuWUcEPK9rJUhfQgewQOgDDpIGDfboWkOYu8V7hxZ19XMGGh
	 JIkxxDd7u5jbcnT5ZdbOo+kuVqLmhZ6TDET733wo4IGH453hGF6SJODIFavyAvy2Pj
	 7KeVDDWd3B6yxssOTQzHE2hOOtgceaYLWEh/H9SiB93Fam5TncycMOdWhigcCbEqsL
	 WMIgYB0uhUGbA==
From: Hans de Goede <hansg@kernel.org>
To: Bingbu Cao <bingbu.cao@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 15/25] media: i2c: ov01a10: Use native and default for pixel-array size names
Date: Tue, 14 Oct 2025 19:40:23 +0200
Message-ID: <20251014174033.20534-16-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014174033.20534-1-hansg@kernel.org>
References: <20251014174033.20534-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the OV01A10 product-brief PDF the OV01A10 has an active pixel
array size of 1296x816. In otherwords the native and active sizes are
the same.

Replace the (misspelled) ACTIVE defines for the default resolution of
1280x800 with DEFAULT to avoid giving the impression that the active pixel
array size is only 1280x800.

And replace PIXEL_ARRAY with NATIVE to make clear this is the native pixel
array size / to match the V4L2_SEL_TGT_NATIVE_SIZE naming.

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/i2c/ov01a10.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index d0153e606c9a..f3bcb61c88dd 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -34,10 +34,10 @@
 #define OV01A10_MODE_STREAMING		0x01
 
 /* pixel array */
-#define OV01A10_PIXEL_ARRAY_WIDTH	1296
-#define OV01A10_PIXEL_ARRAY_HEIGHT	816
-#define OV01A10_ACITVE_WIDTH		1280
-#define OV01A10_ACITVE_HEIGHT		800
+#define OV01A10_NATIVE_WIDTH		1296
+#define OV01A10_NATIVE_HEIGHT		816
+#define OV01A10_DEFAULT_WIDTH		1280
+#define OV01A10_DEFAULT_HEIGHT		800
 
 /* vertical and horizontal timings */
 #define OV01A10_REG_VTS			CCI_REG16(0x380e)
@@ -271,8 +271,8 @@ static const struct ov01a10_link_freq_config link_freq_configs[] = {
 
 static const struct ov01a10_mode supported_modes[] = {
 	{
-		.width = OV01A10_ACITVE_WIDTH,
-		.height = OV01A10_ACITVE_HEIGHT,
+		.width = OV01A10_DEFAULT_WIDTH,
+		.height = OV01A10_DEFAULT_HEIGHT,
 		.hts = OV01A10_HTS_DEF,
 		.vts_def = OV01A10_VTS_DEF,
 		.vts_min = OV01A10_VTS_MIN,
@@ -643,8 +643,8 @@ static int ov01a10_init_state(struct v4l2_subdev *sd,
 	struct v4l2_subdev_format fmt = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 		.format = {
-			.width = OV01A10_ACITVE_WIDTH,
-			.height = OV01A10_ACITVE_HEIGHT,
+			.width = OV01A10_DEFAULT_WIDTH,
+			.height = OV01A10_DEFAULT_HEIGHT,
 		},
 	};
 
@@ -693,17 +693,17 @@ static int ov01a10_get_selection(struct v4l2_subdev *sd,
 	case V4L2_SEL_TGT_CROP_BOUNDS:
 		sel->r.top = 0;
 		sel->r.left = 0;
-		sel->r.width = OV01A10_PIXEL_ARRAY_WIDTH;
-		sel->r.height = OV01A10_PIXEL_ARRAY_HEIGHT;
+		sel->r.width = OV01A10_NATIVE_WIDTH;
+		sel->r.height = OV01A10_NATIVE_HEIGHT;
 		return 0;
 	case V4L2_SEL_TGT_CROP:
 	case V4L2_SEL_TGT_CROP_DEFAULT:
-		sel->r.top = (OV01A10_PIXEL_ARRAY_HEIGHT -
-			      OV01A10_ACITVE_HEIGHT) / 2;
-		sel->r.left = (OV01A10_PIXEL_ARRAY_WIDTH -
-			       OV01A10_ACITVE_WIDTH) / 2;
-		sel->r.width = OV01A10_ACITVE_WIDTH;
-		sel->r.height = OV01A10_ACITVE_HEIGHT;
+		sel->r.top = (OV01A10_NATIVE_HEIGHT -
+			      OV01A10_DEFAULT_HEIGHT) / 2;
+		sel->r.left = (OV01A10_NATIVE_WIDTH -
+			       OV01A10_DEFAULT_WIDTH) / 2;
+		sel->r.width = OV01A10_DEFAULT_WIDTH;
+		sel->r.height = OV01A10_DEFAULT_HEIGHT;
 		return 0;
 	}
 
-- 
2.51.0


