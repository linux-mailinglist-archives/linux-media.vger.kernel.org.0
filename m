Return-Path: <linux-media+bounces-14343-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E3491BF88
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 15:30:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB823B22DC3
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 13:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF83F1991DF;
	Fri, 28 Jun 2024 13:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Haz3Mff7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0E61E89A
	for <linux-media@vger.kernel.org>; Fri, 28 Jun 2024 13:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719581416; cv=none; b=U7H5BuKItX1Q/g1T67J6YHG8P18WDJnTTW+mhoTHJZvhR8l0mjH5PaXWf8i0nyTkBYjWUc4hKcPfFlwv7ydDeHEjFHN4SrFOWKeDwQqoWbU5CGXdyrGfXtO4CzYar1orqd1iIN+WksrM+E5bpWPXUJdhQY+Te0gGiDCwnaFX7Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719581416; c=relaxed/simple;
	bh=0lNPrP/MnDESw/OyHxx2M6JwQEZQz9GEnrxABjvlAOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lbSCjcx1icjbwr5pPpr1ngiYfvR4q0YalGCSo9Mc3PsEQUZZfWZlCAi+VR/R7X2QqaN2fV8KjLGk7B0pu7KHA1PSvxHTbgH+rVOqZvMjX5htvurzoSrNvoHRpTlsvTBAPhy+HxVQ0J3wIWTmzfyUfdS1VFrCvTxPEzZjzTLAIyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Haz3Mff7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D87D4191B;
	Fri, 28 Jun 2024 15:29:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719581380;
	bh=0lNPrP/MnDESw/OyHxx2M6JwQEZQz9GEnrxABjvlAOI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Haz3Mff74pkdekmbUAhQ5i+fOq1k8gO/SVvNhCFLljclhtqv44NZpn6aCXS49GD7k
	 YGEhxVyyXo2gjD/GCH/qbFmfF4+WyG5XsAfQqzrLZrMmyvcSbTfFv9w5YVlGvScUpP
	 0Cbn9SrDbxeB9VJp+awIWM376AMiBh/VB80hvqW4=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Naushir Patuck <naush@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v2 3/5] media: uapi: pisp_common: Capitalize all macros
Date: Fri, 28 Jun 2024 15:29:44 +0200
Message-ID: <20240628132948.871568-4-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240628132948.871568-1-jacopo.mondi@ideasonboard.com>
References: <20240628132948.871568-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro used to inspect an image format characteristic use a mixture
of capitalized and non-capitalized letters, which is rather unusual for
the Linux kernel style.

Capitalize all identifiers.

Fixes: c6c49bac8770 ("media: uapi: Add Raspberry Pi PiSP Back End uAPI")
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../linux/media/raspberrypi/pisp_common.h     | 38 +++++++++----------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/include/uapi/linux/media/raspberrypi/pisp_common.h b/include/uapi/linux/media/raspberrypi/pisp_common.h
index 74d096188233..cbdccfed1261 100644
--- a/include/uapi/linux/media/raspberrypi/pisp_common.h
+++ b/include/uapi/linux/media/raspberrypi/pisp_common.h
@@ -92,51 +92,51 @@ enum pisp_image_format {
 				     PISP_IMAGE_FORMAT_THREE_CHANNEL
 };

-#define PISP_IMAGE_FORMAT_bps_8(fmt)                                           \
+#define PISP_IMAGE_FORMAT_BPS_8(fmt)                                           \
 	(((fmt) & PISP_IMAGE_FORMAT_BPS_MASK) == PISP_IMAGE_FORMAT_BPS_8)
-#define PISP_IMAGE_FORMAT_bps_10(fmt)                                          \
+#define PISP_IMAGE_FORMAT_BPS_10(fmt)                                          \
 	(((fmt) & PISP_IMAGE_FORMAT_BPS_MASK) == PISP_IMAGE_FORMAT_BPS_10)
-#define PISP_IMAGE_FORMAT_bps_12(fmt)                                          \
+#define PISP_IMAGE_FORMAT_BPS_12(fmt)                                          \
 	(((fmt) & PISP_IMAGE_FORMAT_BPS_MASK) == PISP_IMAGE_FORMAT_BPS_12)
-#define PISP_IMAGE_FORMAT_bps_16(fmt)                                          \
+#define PISP_IMAGE_FORMAT_BPS_16(fmt)                                          \
 	(((fmt) & PISP_IMAGE_FORMAT_BPS_MASK) == PISP_IMAGE_FORMAT_BPS_16)
-#define PISP_IMAGE_FORMAT_bps(fmt)                                             \
+#define PISP_IMAGE_FORMAT_BPS(fmt)                                             \
 	(((fmt) & PISP_IMAGE_FORMAT_BPS_MASK) ?                                \
 	       8 + (2 << (((fmt) & PISP_IMAGE_FORMAT_BPS_MASK) - 1)) : 8)
-#define PISP_IMAGE_FORMAT_shift(fmt)                                           \
+#define PISP_IMAGE_FORMAT_SHIFT(fmt)                                           \
 	(((fmt) & PISP_IMAGE_FORMAT_SHIFT_MASK) / PISP_IMAGE_FORMAT_SHIFT_1)
-#define PISP_IMAGE_FORMAT_three_channel(fmt)                                   \
+#define PISP_IMAGE_FORMAT_THREE_CHANNEL(fmt)                                   \
 	((fmt) & PISP_IMAGE_FORMAT_THREE_CHANNEL)
-#define PISP_IMAGE_FORMAT_single_channel(fmt)                                  \
+#define PISP_IMAGE_FORMAT_SINGLE_CHANNEL(fmt)                                  \
 	(!((fmt) & PISP_IMAGE_FORMAT_THREE_CHANNEL))
-#define PISP_IMAGE_FORMAT_compressed(fmt)                                      \
+#define PISP_IMAGE_FORMAT_COMPRESSED(fmt)                                      \
 	(((fmt) & PISP_IMAGE_FORMAT_COMPRESSION_MASK) !=                       \
 	 PISP_IMAGE_FORMAT_UNCOMPRESSED)
-#define PISP_IMAGE_FORMAT_sampling_444(fmt)                                    \
+#define PISP_IMAGE_FORMAT_SAMPLING_444(fmt)                                    \
 	(((fmt) & PISP_IMAGE_FORMAT_SAMPLING_MASK) ==                          \
 	 PISP_IMAGE_FORMAT_SAMPLING_444)
-#define PISP_IMAGE_FORMAT_sampling_422(fmt)                                    \
+#define PISP_IMAGE_FORMAT_SAMPLING_422(fmt)                                    \
 	(((fmt) & PISP_IMAGE_FORMAT_SAMPLING_MASK) ==                          \
 	 PISP_IMAGE_FORMAT_SAMPLING_422)
-#define PISP_IMAGE_FORMAT_sampling_420(fmt)                                    \
+#define PISP_IMAGE_FORMAT_SAMPLING_420(fmt)                                    \
 	(((fmt) & PISP_IMAGE_FORMAT_SAMPLING_MASK) ==                          \
 	 PISP_IMAGE_FORMAT_SAMPLING_420)
-#define PISP_IMAGE_FORMAT_order_normal(fmt)                                    \
+#define PISP_IMAGE_FORMAT_ORDER_NORMAL(fmt)                                    \
 	(!((fmt) & PISP_IMAGE_FORMAT_ORDER_SWAPPED))
-#define PISP_IMAGE_FORMAT_order_swapped(fmt)                                   \
+#define PISP_IMAGE_FORMAT_ORDER_SWAPPED(fmt)                                   \
 	((fmt) & PISP_IMAGE_FORMAT_ORDER_SWAPPED)
-#define PISP_IMAGE_FORMAT_interleaved(fmt)                                     \
+#define PISP_IMAGE_FORMAT_INTERLEAVED(fmt)                                     \
 	(((fmt) & PISP_IMAGE_FORMAT_PLANARITY_MASK) ==                         \
 	 PISP_IMAGE_FORMAT_PLANARITY_INTERLEAVED)
-#define PISP_IMAGE_FORMAT_semiplanar(fmt)                                      \
+#define PISP_IMAGE_FORMAT_SEMIPLANAR(fmt)                                      \
 	(((fmt) & PISP_IMAGE_FORMAT_PLANARITY_MASK) ==                         \
 	 PISP_IMAGE_FORMAT_PLANARITY_SEMI_PLANAR)
-#define PISP_IMAGE_FORMAT_planar(fmt)                                          \
+#define PISP_IMAGE_FORMAT_PLANAR(fmt)                                          \
 	(((fmt) & PISP_IMAGE_FORMAT_PLANARITY_MASK) ==                         \
 	 PISP_IMAGE_FORMAT_PLANARITY_PLANAR)
-#define PISP_IMAGE_FORMAT_wallpaper(fmt)                                       \
+#define PISP_IMAGE_FORMAT_WALLPAPER(fmt)                                       \
 	((fmt) & PISP_IMAGE_FORMAT_WALLPAPER_ROLL)
-#define PISP_IMAGE_FORMAT_bpp_32(fmt) ((fmt) & PISP_IMAGE_FORMAT_BPP_32)
+#define PISP_IMAGE_FORMAT_BPP_32(fmt) ((fmt) & PISP_IMAGE_FORMAT_BPP_32)
 #define PISP_IMAGE_FORMAT_HOG(fmt)                                             \
 	((fmt) &                                                               \
 	 (PISP_IMAGE_FORMAT_HOG_SIGNED | PISP_IMAGE_FORMAT_HOG_UNSIGNED))
--
2.45.2


