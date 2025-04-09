Return-Path: <linux-media+bounces-29798-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C492AA8308E
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 21:30:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A96B3BB8DB
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 19:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3902720765D;
	Wed,  9 Apr 2025 19:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JS6FVVeU"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61107202978;
	Wed,  9 Apr 2025 19:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744227023; cv=none; b=WEe1pxwneY4jvU8rKb/OLCqLicRzhY9FcIM6ETfoRK7UEPttNtX3YJDTJJr0BXQsHAWsB/4IfzVtcI8D5Sk6hi/oe+1gGBKadmfpV6Ejzkd6OacRm/WjRVuMLQrKtuoCLIIosXOB/jvPsFownz2grNMR0HBmWxcqwTGMC8JRKQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744227023; c=relaxed/simple;
	bh=t4u/q6sRSEWyUERde3llNPL9IiDRHYERj2C5djskamU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SwpOanGCKSHn+fIsR8cpgGTMhaNnvCd6W8IjUCjWvGqTSzsVIDUc/90sIoUkxhUY8v76Jn5NHlNZkAHi42ZlL1yOg8cVciTLEwWMzcSzSCg7BjmEKzzJXP0CGyNqN1U0590WDqcFRFed3CcdzNs8GlLWJlI50lnSNC1ljesurEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JS6FVVeU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744227019;
	bh=t4u/q6sRSEWyUERde3llNPL9IiDRHYERj2C5djskamU=;
	h=From:Date:Subject:To:Cc:From;
	b=JS6FVVeUIqgnOONv0XQvXmw23VuDLc0E+7Lvwj5TkaBPfw+pUJHu9qbA4mEX6PxO9
	 JMJgAi/Rbky3lZHs8fI4/ZRrzUSzqB6sYmoPjPd7yPJ+hfGD2P139zBbIufjfAZw0o
	 WT59HFDZgjW+uySU1J3fhYJHfmLsg+W+q++5+TIa57oK9RE6vO7mCPF96Ar9ra/R5E
	 IuoS2wTFpjjrxRtzkapjpCcT7IjT3e5BCkZ94hpok3QtRanuTDKCYF+Maci7gZq8Wi
	 yTtxNOPVZivIPGzHHQdbu/PIh2CBoZM1NCBvlb3LA8f8o4DafdDmpbSZo3iJG/YRE0
	 OecnRd0sDQ9yQ==
Received: from [192.168.13.180] (unknown [IPv6:2606:6d00:11:e976::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 19FBE17E0125;
	Wed,  9 Apr 2025 21:30:17 +0200 (CEST)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Wed, 09 Apr 2025 15:30:09 -0400
Subject: [PATCH] media: verisilicono: Enable NV15 support for Rockchip
 VDPU981
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-b4-hantro-nv15-support-v1-1-7e11e47fd0c9@collabora.com>
X-B4-Tracking: v=1; b=H4sIAMDK9mcC/x2MywqAIBAAfyX23IKZIvQr0aHHVntRWUsC6d+Tj
 jMwUyCRMCUYmgJCmRMHX6FrG1jP2R+EvFUGrbRVRvW4GKz+koA+dxbTHWOQC5XbaDfkZts7qHE
 U2vn5x+P0vh8u04MLaAAAAA==
X-Change-ID: 20250403-b4-hantro-nv15-support-07def4e7a537
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.14.2

This is a "customer" format, though on Rockchip RK3588 it has been
verified to be NV15 format, which matches what the GPU and display
handles has 10bit pixel formats.

Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/platform/verisilicon/hantro_v4l2.c           |  1 +
 .../platform/verisilicon/rockchip_vpu981_hw_av1_dec.c      |  4 ++++
 drivers/media/platform/verisilicon/rockchip_vpu_hw.c       | 14 ++++++++++++++
 3 files changed, 19 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 2bce940a58227c2bfef2bc3343992e4588ab36a4..7c3515cf7d64a090adfb8d8aff368f9a617f8c8a 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -77,6 +77,7 @@ int hantro_get_format_depth(u32 fourcc)
 	switch (fourcc) {
 	case V4L2_PIX_FMT_P010:
 	case V4L2_PIX_FMT_P010_4L4:
+	case V4L2_PIX_FMT_NV15:
 	case V4L2_PIX_FMT_NV15_4L4:
 		return 10;
 	default:
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index 69b5d9e12926fb408c08f8ba2139d05ba44389b7..e4703bb6be7c175a89c0b8868cf2eafb84a872ed 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -2202,6 +2202,10 @@ static void rockchip_vpu981_postproc_enable(struct hantro_ctx *ctx)
 	case V4L2_PIX_FMT_NV12:
 		hantro_reg_write(vpu, &av1_pp_out_format, 3);
 		break;
+	case V4L2_PIX_FMT_NV15:
+		/* this mapping is RK specific */
+		hantro_reg_write(vpu, &av1_pp_out_format, 10);
+		break;
 	default:
 		hantro_reg_write(vpu, &av1_pp_out_format, 0);
 	}
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
index 964122e7c355934cd80eb442219f6ba51bba8b71..f7c4a176167b40fe79ec5a6759dff8a77e849ae3 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
@@ -92,6 +92,20 @@ static const struct hantro_fmt rockchip_vpu981_postproc_fmts[] = {
 			.step_height = MB_DIM,
 		},
 	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV15,
+		.codec_mode = HANTRO_MODE_NONE,
+		.match_depth = true,
+		.postprocessed = true,
+		.frmsize = {
+			.min_width = ROCKCHIP_VPU981_MIN_SIZE,
+			.max_width = FMT_4K_WIDTH,
+			.step_width = MB_DIM,
+			.min_height = ROCKCHIP_VPU981_MIN_SIZE,
+			.max_height = FMT_4K_HEIGHT,
+			.step_height = MB_DIM,
+		},
+	},
 	{
 		.fourcc = V4L2_PIX_FMT_P010,
 		.codec_mode = HANTRO_MODE_NONE,

---
base-commit: 9ddc3d6c16ea2587898a315f20f7b8fbd791dc1b
change-id: 20250403-b4-hantro-nv15-support-07def4e7a537

Best regards,
-- 
Nicolas Dufresne <nicolas.dufresne@collabora.com>


