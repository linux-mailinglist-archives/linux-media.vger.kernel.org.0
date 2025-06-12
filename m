Return-Path: <linux-media+bounces-34624-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD358AD70DD
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 14:54:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A6B03A0F99
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 12:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B1D24678F;
	Thu, 12 Jun 2025 12:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tsBSimhI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF692459D4;
	Thu, 12 Jun 2025 12:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749732843; cv=none; b=GP5vV82+I9etL4Tsn2oZh3TTSqCR76y6GjjEm0VEeSIxM+YKX1VzfWslf68eoN1aYVRD2NDNMD9O2Y7TycgfSdJPO75Y5JYeas2CWptTS+hsVSUHCe3Q/Oe6luB0f0f+y4wocb1Y/uTFOBO8190/CPl410FGbZSg9OLjpPLDthc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749732843; c=relaxed/simple;
	bh=qi5lfHwQHhJGRjqK2zsDjKYabHNZy+zeTYkiDzXpm7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c989LvKcb4LkLSjLhLiYQXUxjCg4bOMQwGhfXFGZVMoPLLdQqekY4um7KN6mQIgkxAcUem+2HHaZc6oruVgQHSxIz12Glv2Zcj9m4s2WR9S4j8UKKH3RQv+bXx1YjqYTB0GdLCfy+q5cbPP91grKKQiIYBBWEOpMKrXnXD751eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tsBSimhI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 809E9C4CEEA;
	Thu, 12 Jun 2025 12:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749732842;
	bh=qi5lfHwQHhJGRjqK2zsDjKYabHNZy+zeTYkiDzXpm7c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tsBSimhIJ5dk+rnIBtVQDgOX4s1Wj9N3wHF/QVwIpSiNUULxoXVT0X9gn1uImpTwc
	 tgl0MD2h2KAS3x1asGEcvyL/bhZDGa/+fP689ptZHREqBqpUd1DgXeiG52Y7l1Jkz0
	 hyMHoG2fZ2Hyysr/ws1jHRITl8q9vreegHVUopnZh3wVEzsHGVgZOQCf0DGVIlibIT
	 udNZnxvQm8REoGpDJx7KMBneJ3z9kCGWZN8SQ5JD9Hh606eLnTVYe5ry3V1X29OycM
	 56m+8m2r9J4ixucy+Hb92A87D5rW6AuQTsbkkb5HK6sRV9cOsd82nUhhsj6XzvjqX6
	 XDZ2S9U3CexMA==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 12 Jun 2025 14:53:42 +0200
Subject: [PATCH 4/4] media: gc2145: Fix the RGB MBUS format
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-csi-bgr-rgb-v1-4-dc8a309118f8@kernel.org>
References: <20250612-csi-bgr-rgb-v1-0-dc8a309118f8@kernel.org>
In-Reply-To: <20250612-csi-bgr-rgb-v1-0-dc8a309118f8@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Mats Randgaard <matrandg@cisco.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hans.verkuil@cisco.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1985; i=mripard@kernel.org;
 h=from:subject:message-id; bh=qi5lfHwQHhJGRjqK2zsDjKYabHNZy+zeTYkiDzXpm7c=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBleZ28fCT6UcMWzJvJvYWC1wMXrQq8fBVb5vDv67bnXI
 8ucS0ElHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAimZcYGy5X5ysGPHad4WCy
 NyHb+jezoqb5fK9ZkUEXtG3eL3l7MqGoJen1iqaVte8tb9q76bhaMzbsNWrdMvnm3fXvD9ks31Z
 367B9zxpVK9klenp20vd3q/G0/byiV/4m8kfBjBnPROeczWEHAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The GalaxyCore GC2145 is an MIPI-CSI2 sensor. is an HDMI to MIPI-CSI2
bridge. Among others, it support the MIPI-CSI2 RGB565 format, listed in
the driver as MEDIA_BUS_FMT_RGB565_1X16.

Most CSI2 receiver drivers then map MEDIA_BUS_FMT_RGB565_1X16 to
V4L2_PIX_FMT_RGB565.

However, V4L2_PIX_FMT_RGB565 is defined as having its color components
in the R, G and B order, from left to right. MIPI-CSI2 however defines
the RGB565 format with blue first.

This essentially means that the R and B will be swapped compared to what
V4L2_PIX_FMT_RGB565 defines.

The proper MBUS format would be BGR565, so let's use that.

Fixes: 03cc7fefbb09 ("media: i2c: gc2145: Galaxy Core GC2145 sensor support")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/media/i2c/gc2145.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/gc2145.c b/drivers/media/i2c/gc2145.c
index ba02161d46e723d14e8670ef89ba10b270d7d178..12ce1c7aa0a9e028bd7d4c84356e0e166294a1f6 100644
--- a/drivers/media/i2c/gc2145.c
+++ b/drivers/media/i2c/gc2145.c
@@ -579,11 +579,11 @@ static const struct gc2145_format supported_formats[] = {
 		.colorspace	= V4L2_COLORSPACE_SRGB,
 		.datatype	= MIPI_CSI2_DT_YUV422_8B,
 		.output_fmt	= 0x03,
 	},
 	{
-		.code		= MEDIA_BUS_FMT_RGB565_1X16,
+		.code		= MEDIA_BUS_FMT_BGR565_1X16,
 		.colorspace	= V4L2_COLORSPACE_SRGB,
 		.datatype	= MIPI_CSI2_DT_RGB565,
 		.output_fmt	= 0x06,
 		.switch_bit	= true,
 	},
@@ -696,11 +696,11 @@ static int gc2145_init_state(struct v4l2_subdev *sd,
 	struct v4l2_rect *crop;
 
 	/* Initialize pad format */
 	format = v4l2_subdev_state_get_format(state, 0);
 	gc2145_update_pad_format(gc2145, &supported_modes[0], format,
-				 MEDIA_BUS_FMT_RGB565_1X16,
+				 MEDIA_BUS_FMT_BGR565_1X16,
 				 V4L2_COLORSPACE_SRGB);
 
 	/* Initialize crop rectangle. */
 	crop = v4l2_subdev_state_get_crop(state, 0);
 	*crop = supported_modes[0].crop;

-- 
2.49.0


