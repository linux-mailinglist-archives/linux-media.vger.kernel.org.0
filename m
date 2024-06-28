Return-Path: <linux-media+bounces-14342-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D6491BF87
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 15:30:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C217B23058
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 13:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F68515AAD7;
	Fri, 28 Jun 2024 13:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YMocfmVx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F77829B0
	for <linux-media@vger.kernel.org>; Fri, 28 Jun 2024 13:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719581416; cv=none; b=hIC+F1azEHy1tpOAjWnj267fQ/j3lH8jVTsETEWcSuVsxGIchs1Us31u2NogHDC5zKp3QyJ8RJatcvk0pfmMqr+cY33cunUznmqzZt+uy7JJtUqBRay2jcZw76WlnfbF0gbFHm8KdNrT/PmrEqUV/l67ikP3eulbZpzUlF2a7xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719581416; c=relaxed/simple;
	bh=2/TJGAbpZdXIuRAH8d1JX1KZPFgtsSB4eyGYOXRL2XU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y1huF8ZY25OFiRWXfPcXg7BcXKazbG83TOmB5wvAS7aLrvzVFRkX/uKuGTdYArnlUB7A4bgY3Xz5yHsc0upg2OhCyRal+aI7uYQkqDHcVlgils9He8dN74AdrG9zCuNyfDTM6zP+MceX7C8WX8DUERsYZQVZQP3pj+VACz78fbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YMocfmVx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 08E9F16B0;
	Fri, 28 Jun 2024 15:29:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719581379;
	bh=2/TJGAbpZdXIuRAH8d1JX1KZPFgtsSB4eyGYOXRL2XU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YMocfmVxBliFkiIQ7e+wtymRWhZTipnlMogR88hkuUYl+6WoIvRlkNnLhHM2DtJ4K
	 lEs8nC2WN4sX0ce6WBKNNzNhHh3fMUtsToICdOsoYC1yvmHxYYdammeq2DhtbzqR4I
	 4GgJmRjBOTGtYuJ6MztPbQw5ieV3BfGtQUyeXyi0=
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
Subject: [PATCH v2 2/5] media: uapi: pisp_common: Add 32 bpp format test
Date: Fri, 28 Jun 2024 15:29:43 +0200
Message-ID: <20240628132948.871568-3-jacopo.mondi@ideasonboard.com>
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

Add definition and test for 32-bits image formats to the pisp_common.h
uAPI header.

Fixes: c6c49bac8770 ("media: uapi: Add Raspberry Pi PiSP Back End uAPI")
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Acked-by: David Plowman <david.plowman@raspberrypi.com>
---
 include/uapi/linux/media/raspberrypi/pisp_common.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/uapi/linux/media/raspberrypi/pisp_common.h b/include/uapi/linux/media/raspberrypi/pisp_common.h
index b2522e29c976..74d096188233 100644
--- a/include/uapi/linux/media/raspberrypi/pisp_common.h
+++ b/include/uapi/linux/media/raspberrypi/pisp_common.h
@@ -72,6 +72,8 @@ enum pisp_image_format {
 	PISP_IMAGE_FORMAT_SHIFT_8 = 0x00080000,
 	PISP_IMAGE_FORMAT_SHIFT_MASK = 0x000f0000,

+	PISP_IMAGE_FORMAT_BPP_32 = 0x00100000,
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


