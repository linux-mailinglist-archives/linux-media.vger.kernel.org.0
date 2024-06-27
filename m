Return-Path: <linux-media+bounces-14261-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A96D291A93D
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 16:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAC241C229FD
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 14:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 040D5195FE6;
	Thu, 27 Jun 2024 14:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cgi83A3K"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168DE1442FE
	for <linux-media@vger.kernel.org>; Thu, 27 Jun 2024 14:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719498683; cv=none; b=G5IuRIRBF6f3tIgdnlsLDuvqwzLjjLeVkGZj8iTX9I0eF8wlqN5bE/dMotj7vJiX14YriP8CxXLE7kt6XZGw9vgqZ6NUjqJ3ewD5rwIJTEw3JAg0j9hwiuHGzr0Q5xFc4hviNED4aeMoiLWwMiGTaB9/8zt2m/O3EpO8hv5/T7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719498683; c=relaxed/simple;
	bh=1dw9a1wZdGIU0VNx1xpi71yvY1zWp0wWFTQ+Fd/CQj0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ItcwcJZTJtEUPwQ05cGsCZp6YqYPSYS+Lk/qLJFVurSwdJtltHlqHFcyPh1Gsrq5DFalE2mOzNitTDMLSscVcRUBOAn90N/FcH6v2kOqEy2rJNxScts9/qATHL5yUrXP+qnWgSJfaeTfiDIOI0irE/NuQptO5tN5OgNpzkgoZKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cgi83A3K; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FDC2E22;
	Thu, 27 Jun 2024 16:30:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719498654;
	bh=1dw9a1wZdGIU0VNx1xpi71yvY1zWp0wWFTQ+Fd/CQj0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cgi83A3K0L014fFsZzXr+XIGLkoxIr5SCfP+8+Ap1QF67bwZMaSYklZTHVbJU/GZM
	 n913aITQzOqKP3s5817QNbIedLm5uaj3jHZT9hvS88bMjILFhVPPffbRRetehHFO8H
	 l9OiituKWcJ/BqOsvMbKqjzjxttPCAa1TnlRZXIg=
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
Subject: [PATCH 2/2] media: uapi: pisp_common: Add 32 bpp format test
Date: Thu, 27 Jun 2024 16:30:57 +0200
Message-ID: <20240627143059.300796-3-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240627143059.300796-1-jacopo.mondi@ideasonboard.com>
References: <20240627143059.300796-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add definition and test for 32-bits image formats to the pisp_common.h
uAPI header.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

---
RPi: I found not traces of this in your BSP pisp_types.h header but
these identifiers are used by libpisp and are part of the pisp_types.h
header shipped with the library.

https://github.com/raspberrypi/libpisp/blob/main/src/libpisp/backend/backend_prepare.cpp#L374
https://github.com/raspberrypi/libpisp/blob/main/src/libpisp/common/pisp_types.h#L137

in mainline, pisp_types.h has been absorbed by pisp_common.h so I'm
adding it here (only PISP_IMAGE_FORMAT_bpp_32, as it's the only one used
by libpisp).

Could you ack/nack this patch please ?
---
---
 include/uapi/linux/media/raspberrypi/pisp_common.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/uapi/linux/media/raspberrypi/pisp_common.h b/include/uapi/linux/media/raspberrypi/pisp_common.h
index b2522e29c976..031fdaa4da69 100644
--- a/include/uapi/linux/media/raspberrypi/pisp_common.h
+++ b/include/uapi/linux/media/raspberrypi/pisp_common.h
@@ -72,6 +72,8 @@ enum pisp_image_format {
 	PISP_IMAGE_FORMAT_SHIFT_8 = 0x00080000,
 	PISP_IMAGE_FORMAT_SHIFT_MASK = 0x000f0000,

+	PISP_IMAGE_FORMAT_BPP_32                 = 0x00100000,
+
 	PISP_IMAGE_FORMAT_UNCOMPRESSED = 0x00000000,
 	PISP_IMAGE_FORMAT_COMPRESSION_MODE_1 = 0x01000000,
 	PISP_IMAGE_FORMAT_COMPRESSION_MODE_2 = 0x02000000,
@@ -134,6 +136,7 @@ enum pisp_image_format {
 	 PISP_IMAGE_FORMAT_PLANARITY_PLANAR)
 #define PISP_IMAGE_FORMAT_wallpaper(fmt)                                       \
 	((fmt) & PISP_IMAGE_FORMAT_WALLPAPER_ROLL)
+#define PISP_IMAGE_FORMAT_bpp_32(fmt) ((fmt) & PISP_IMAGE_FORMAT_BPP_32)
 #define PISP_IMAGE_FORMAT_HOG(fmt)                                             \
 	((fmt) &                                                               \
 	 (PISP_IMAGE_FORMAT_HOG_SIGNED | PISP_IMAGE_FORMAT_HOG_UNSIGNED))
--
2.45.2


