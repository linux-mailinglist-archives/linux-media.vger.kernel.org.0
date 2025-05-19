Return-Path: <linux-media+bounces-32803-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EA4ABC0C6
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 16:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4292E1B61589
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 14:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D800428466B;
	Mon, 19 May 2025 14:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fB/rgo3J"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2553283CB5;
	Mon, 19 May 2025 14:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747665267; cv=none; b=Hv2NfTiyp+LjAdTIEdQx1TRw/d9lMOnIWJEZN9vIk+soQNuo9yY/hfqrOi3Y2GPR4wPuuzhIf4amBQQTlNP6u90S0Gf+mCSWbDIaWFCsE7P/JT2j0GnGXr8MerzGQbJSg4QfPbUPx7wBV/6mnD0kWARPS02yROM4bIr4T5anaMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747665267; c=relaxed/simple;
	bh=yb3IXvYbSAfuDIafa4IguM7bAcdendpB5UTdKpuydUA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZGXPkpoy0+7KkAjOdEpalpbncOZx61XYbLdE37YO3rcPmz4Tc0+2oekKkNXj1/7sW+w15HkBph1EHGS212hg8oRCxd13FfP6U1P+O3DKbiECza5qclqpyO3HrP6/Q0747h/t+hKvAdeQTWiNhXOfYcSD4z4IWJOwHbXO6QjtbYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fB/rgo3J; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D2ED1116;
	Mon, 19 May 2025 16:34:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747665241;
	bh=yb3IXvYbSAfuDIafa4IguM7bAcdendpB5UTdKpuydUA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fB/rgo3JLTfzz8Juylgm2MT/shqtTr8UCtfj2cJrunApLR1xLMcwMucT+GxGkZ38T
	 SGMynxKahJfAdpc1JpoAOQyIbUL4VsflQrD2Ri2q0USo4FRg4y++SrpEbGYkla/rGb
	 ju6dqLS5j19VcLjr01ZAm/hPHNLlLw0fO+ZZQmuY=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com,
	jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com,
	robh+dt@kernel.org,
	mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	jerome.forissier@linaro.org,
	kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	sakari.ailus@iki.fi,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v9 03/17] media: v4l2-common: Add RAW16 format info
Date: Mon, 19 May 2025 15:33:55 +0100
Message-Id: <20250519143409.451100-4-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519143409.451100-1-dan.scally@ideasonboard.com>
References: <20250519143409.451100-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add entries to v4l2_format_info describing the 16-bit bayer
formats so that they can be used in drivers.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
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

 drivers/media/v4l2-core/v4l2-common.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index bfefd7d24fd8..ece830df32f9 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -339,7 +339,12 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_SRGGB12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_CRU_RAW12,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 5, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_CRU_RAW14,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 4, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_SBGGR16,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_SGBRG16,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_SGRBG16,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_SRGGB16,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_CRU_RAW20,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0, 0 }, .bpp_div = { 3, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+
 	};
 	unsigned int i;
 
-- 
2.34.1


