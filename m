Return-Path: <linux-media+bounces-37659-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2C0B042B7
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 17:09:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3D847B4D9C
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99DFA25DB07;
	Mon, 14 Jul 2025 15:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="viqs2+IX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AA525B663;
	Mon, 14 Jul 2025 15:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752505621; cv=none; b=lPowRFnN6qJrYWsno19Df5Tyw86wVlIneg3Im2FP+Gew7gPhV4Pr7nLmr2AK+Pyvdtdy7H2CGyx0w1nQjFarfz3gAZ+sYyPiZTJ7vN6JIs66FUbs45ZaCUrMlGk/jgZseKGkGpV7wUnillqeLkUjfpvTr8sk00NiAIYoDKlHhDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752505621; c=relaxed/simple;
	bh=LUnMkSihpSZDwWh2x85x1J1CVcob8kgOfAp2ap0QDpI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H76rfkUAMkWmuP+dpMs36km+K/JJdi7j81ZI+azO2wEzcvF/Rhb5mDIkNkGcZgFowJiIdaELEOU+w2aHddfMJhh7S39NULRr4BcW7NjEE1MM3AY+Pm34DyccOfPyyTtRstRxzwDjjbg6ZCuaDtx+d0S+VeSh+Dkp0s+tpIlw+yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=viqs2+IX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A515754E4;
	Mon, 14 Jul 2025 17:06:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752505577;
	bh=LUnMkSihpSZDwWh2x85x1J1CVcob8kgOfAp2ap0QDpI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=viqs2+IX3rkPB5JEjDb1zNGTyyKMQq302u6di5k7NeQ9FJGfHGEGy3trP/9ggBgmz
	 Zqn+uabdMEqys5oG0c62gvznR5muSV9DGNRfjUhKWuqN139AtNNhw3OUm+VtUrqte9
	 GBaxHc+/YWLeuLZCwSRPDqojhMfgfGU88PQoSoIA=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Mon, 14 Jul 2025 16:06:32 +0100
Subject: [PATCH v11 06/19] media: v4l2-common: Add RAW14 format info
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-c55-v11-6-bc20e460e42a@ideasonboard.com>
References: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
In-Reply-To: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2676;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=LUnMkSihpSZDwWh2x85x1J1CVcob8kgOfAp2ap0QDpI=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBodR0A9FAFvJqJNqpHv6M1aFuiqDEFaeLqGZ2D/
 deMpEeAzQSJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaHUdAAAKCRDISVd6bEV1
 Mn1AD/oDqN/oTWj6bZ3fTWHf0iIRY7MQeS9c3GC7TIQgtgKzR3yqOHoGwvt/+UvvXtFRokYi3qJ
 wvzYzSK+2she9ZdSFuvdCqT45o/2dxSxpy8zYkoQDXQ1FqwLsXJaN1NhdmYxl4BhpMRBJlhPPrE
 zzgp3m+h9naZjxUT4xqSsjOUTN2PzaCp9vNaGu+KiQG6M0kgUg3Rc756FI/ISwo35Zxz1y4cUYS
 BbKFhY1si3K/y9E5M6oNwaHpAutgXKnj4bS43DRccVUZfT+LWrQmjAxjexEhaoN2EOVZvJEb4Gv
 V+/ghVf/VWhnlMvZnViZSXkq4DbPhSABZI8yJAnsdXUHEc6r4s62v8mzfc3GM5INfQOrWcuPcyn
 4ggjju4ARGWyIaXlD/R5wlF7mCPAvQJ8R5s4L+ZQnzdbKH92zYBKiyaZPIH1trOS6B7wqnOo+2Z
 8JcJvspdW/uIS/KPUH+MgLExin8/+cooU4xqeJMnMjkLLH71S/ZqJsQ0aaIgu3leN+/OtDMRLeh
 vjs+xwtFivTTll3sarD2QYxlfHY66gb49Mfze+ooUhA1uE4d5fQEAOw7L78Xz+any3oRy4f4o/0
 2yXsRNkfjQ7bEkCn0CQ7AcjXg/cATA1QsLl+X5XWQOzDvVzUe40cXICWw0j9j5+o43CunbAVT9s
 ObZV0lGYpv790wg==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Add entries to v4l2_format_info describing the 14-bit bayer
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

	- New patch
---
 drivers/media/v4l2-core/v4l2-common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 5bac5d45c5ad19f2e76eda127338409d400d5aca..209e73a715fa8346a15eeb19cd2caa26a6b3e9e1 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -344,6 +344,10 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_SGBRG12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SGRBG12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SRGGB12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_SBGGR14,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_SGBRG14,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_SGRBG14,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_SRGGB14,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SBGGR16,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SGBRG16,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_SGRBG16,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },

-- 
2.34.1


