Return-Path: <linux-media+bounces-35744-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D7BAE622F
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 12:22:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F20BE402A6D
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 10:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF60F28851E;
	Tue, 24 Jun 2025 10:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OGu3v6CL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F5F286D5C;
	Tue, 24 Jun 2025 10:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750760503; cv=none; b=LffbMoe2ETJ1PjHBKT4fyoKYry00MRuVMgo45Qs/JOcJ6sS/93H3LeKqKmrxjwB8CoWp77qXs3q2ncaOdWHCf6JSemlgMVIBSVj5NR/yt0fbWUo8IC53sV5GglUtO8HR/cfKwTQ9ecHxQmD6EyOOmy+p1GqvD9XAyUl0Kk3E9TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750760503; c=relaxed/simple;
	bh=CtrA02D0TrXi2G+EYcSXTmlf7VKeqz+VdclJGy+0hzo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kas/Ho/KlkWCQSQAc4PPFUHKlaPGkW4sxW/PugiJLlTmT+I/ynw0hdrLEg8fXNrUVxmPAOEOfTDNlBRJWCj7xA90MMTRcsSafRe28r93CNQ5eyRlYWy2tsAASYehNLrz1/HWw6IsOyWQNzSyGZN7YmUr74UEH0iVyYjju49j7Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OGu3v6CL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 622B51648;
	Tue, 24 Jun 2025 12:21:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750760476;
	bh=CtrA02D0TrXi2G+EYcSXTmlf7VKeqz+VdclJGy+0hzo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OGu3v6CLcpAiyA+yrI7PXqMW6eHoDaEqRLJyU9CUKNwUPAQO3rKxjrP00hSTgAuLF
	 tH6LnXcb75YQSdkbXtJynPUg0SZaE1vkLg71KtV0v+wAME6MUCsWHh5McDv7dTJMuB
	 de58E5sWt6rk/XTKAgRFgW7Gni9MSn10Eb8FsdSs=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 24 Jun 2025 11:21:17 +0100
Subject: [PATCH v10 04/17] media: v4l2-common: Add RAW14 format info
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-c55-v10-4-54f3d4196990@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2676;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=CtrA02D0TrXi2G+EYcSXTmlf7VKeqz+VdclJGy+0hzo=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoWnwnrvVDJ7NhkS1kztl9nrE+JR3s3OUFxq4Ik
 +q+Py8sI0uJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFp8JwAKCRDISVd6bEV1
 MkuxEACQYNGPHffbsljumWxzoTwJ+M+DNdXha2wYfWJgPobugV4Ef7Mx4rKStztIOqaAG2NMxk6
 mm/AAQrt0sISynArKEV4D4otNPIDIDDpaRNiatjhSAGviEVsLHfT2jwh1qJDc7Ac290pulLtZQZ
 CxF/Kb6nFNdBphdL3MiAp8Dhp/IgENZLE0V7MDyo7t7J3QGnc6O23kB1akAWvCb/7V2frNwBqAs
 tAShT8vxEGCQL8MRGgS3kBm1qp7lvmkKtKn7mK0y+WlC+IZQp3Wd+GRwSxleC9OYBTZyNsvnvqH
 DejRbDTzuvv02FrbTafKBfa5kAriZXEe8vLLEmnUncOsimueMgRSg5JbU+3xwCJ8qeqm7P46k0a
 YcflPGhf8+osOAOxVJKM/U9hHYgeklGfkuYvVO0KKh5SAKixVjGFK3rNX+NYrHTLEa239o6Xt6t
 gi/ciepN4uOYuMnJqFsQKgTVkQN4MqYP6/XPpyi9Ue9jq2s8ZDIfl2eSTrx2nuv672IkiKkotM0
 Wjk7Muxp5IxoGTewgJqYGssClSNKMzD+0mJgvkA7+OZJijXLU6zXC6wMfbWhTbj18C6aJ5kxUS/
 3bbf7gBKy7yV/FZ+OOe2QCBlqB/4WQ1NktztvcZvwFgUsddVODU1nHxT1+mbuVrO0W0ewh+l0Ep
 DY5Aj2MdeAvu5JQ==
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
index c1c6c61b4dff81f6bf6ef8e5c0066a4e1ed95472..1123975db9877e747d7e8c2c8c3bd41eafa05032 100644
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


