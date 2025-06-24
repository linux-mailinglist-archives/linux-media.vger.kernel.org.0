Return-Path: <linux-media+bounces-35742-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F35EAE623F
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 12:23:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33C7F7B3189
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 10:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6472868BD;
	Tue, 24 Jun 2025 10:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TIuJmR6U"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F7528540E;
	Tue, 24 Jun 2025 10:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750760500; cv=none; b=ghKbGyE0igtk1bvzPSiIwDmjRIoe4r/oZZ7AaBqxiUTrOalkoOuVCcOoXLTpRa/wXijXdNr81H4zvN1PfIU1KNeVKn6b8xwrAzbJYY8NBN5hzEt7+OIZai8Sbrv938YbMGtzFDabKBnnvfewJUC/WoBIT/7ilUSoz+f0ROmSlTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750760500; c=relaxed/simple;
	bh=WCZ7Etf0/q8g1Hia+xjF6HIFc84Y5jXMPh0/FyOEK00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V1eCxa0At71UnSreVFI94VobMI/a7d8al967jjSdx/RZp/Tb2SCrInSKLkOf0DJO7wuUbXucVWUbG8JVVP82Q4qg12JusM6aXpEzNL6RKrIf2eTb6MEVgieFVh2bUTM7O9I3kkqhPM+SDs2PY4EWCfT2KmAsAbBSCHXJF4hKF1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TIuJmR6U; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1DB1134A;
	Tue, 24 Jun 2025 12:21:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750760476;
	bh=WCZ7Etf0/q8g1Hia+xjF6HIFc84Y5jXMPh0/FyOEK00=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TIuJmR6UBVxzA0RkWUsMuc5gASopNGzIRMlF9NluY2bMdiLweLzfiALkiA5TV5iTF
	 bZd8f7JCkrwPumBIDLhveoSF1wqrQP129SIYNRqWX7HbPpV3tgkn/B64Xht5vt3368
	 AXv/xcHmTovxUG2w902NrhNKV9j6uRKOlfBHCTBY=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 24 Jun 2025 11:21:16 +0100
Subject: [PATCH v10 03/17] media: v4l2-common: Add RAW16 format info
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-c55-v10-3-54f3d4196990@ideasonboard.com>
References: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
In-Reply-To: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2187;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=WCZ7Etf0/q8g1Hia+xjF6HIFc84Y5jXMPh0/FyOEK00=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoWnwmUw1T5ifJbwFzj5v9YnDRDDnzPGwpmGgzn
 o9sENSXn5CJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFp8JgAKCRDISVd6bEV1
 Mg1qEACmW0uHsjSNIGe1YmyC+iHIcVNN3YvZUQqrPo9Xc4+HoQOjvFuNTLYoVvdCCRfJxcA76vA
 gTPqO/UrKyCDHnhqC5xojADw79UcZWAXnjVDCVJVsxWSbP5XtTAnS91UzAM5PIspjynPLG2ZTT6
 IjWczS5DGFBmz0PR4/KhZcSh5b9oOa4+XwQKmqHiomJtHkp3TEina0hljCsKvNWz6w/N/JKgY8e
 9wxT3zqv3xWyE3aZH1lpLLT8afm4g4RZUSHixDiEkNlkoL5qbQlKeU5yf7jPEWTqOQERiVjTL4h
 T7K8K/ZC8PXV8iQ7gX6yfmR7wYcwnbipHTUNdaEvnqhPL4KRqBn70N2jGU6SsYaaqxsOo60mcxE
 w5gD/mQxQaw+g1kS65q4zqTWTEvGlmVogE/jzT+lDyV4y4vkYGN6YaW7im4c7u1dXTOroJoGRC/
 ermm0Vy8tvYGT2UW0mx1ovZmHPEd3kbX8yJ7V0bb8RN/9jRLKbb74TOjrBskOOBitqlDln9iqn2
 AbJqvB8X3NfsQrMQFiAUoaTb5A7BrJxCUyrVqZ1q+hk0re38Mbo/MK2w3dyAjjqoMRS6LMeSk5W
 ahzFFfG1xnE1rzVWZ7WE+WpuuNm19/NHVZVTvbAR6bHKjToL1NUV0veSsYRQAo0Wnz2QwNCtOoy
 338vp1NSQ13IoiA==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Add entries to v4l2_format_info describing the 16-bit bayer
formats so that they can be used in drivers.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v10:

	- None

Changes in v9:

	- None

Changes in v8:

	- None

Changes in v7:

	- None

Changes in v6:

	- None

Changes in v5:

	- New patch
---
 drivers/media/v4l2-core/v4l2-common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index bd160a8c9efedbcefc58b8ecc829e902f392e5c5..c1c6c61b4dff81f6bf6ef8e5c0066a4e1ed95472 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -344,6 +344,10 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_SGBRG12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SGRBG12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SRGGB12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_SBGGR16,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_SGBRG16,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_SGRBG16,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_SRGGB16,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 	};
 	unsigned int i;
 

-- 
2.34.1


