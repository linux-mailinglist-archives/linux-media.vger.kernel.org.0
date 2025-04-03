Return-Path: <linux-media+bounces-29339-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A87A7ACAA
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 21:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93F2F188F723
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 19:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AAE127EC6E;
	Thu,  3 Apr 2025 19:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gZu8bJG1"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B820E2586F6;
	Thu,  3 Apr 2025 19:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707278; cv=none; b=HSKvlb8Eo+nrznxhiYoYUyX8M9SAi7xc50KCSNsckgECSlUWBQ88PyG2FQ5OqEtf0Zn0SwcsoUt8DE1BW6hbyXwCH5Z7ekJMuzM7rONGmC4/qfEfr7N3uTw0Cet4+w/r2y5j8qAxHU4KQjrAma7X0ZVrvzCZgyMGWd018j28mJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707278; c=relaxed/simple;
	bh=VTL6kwicHLjBdwQujCV+DK1vWwhdgxmpdH1NQF6da1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=W3lgPxMXAxOa+MswNlE5V/uq99tHwjMdlyEak2ZnJI/esTn796JVU/Aqo4btZSLTCBESAQ46GLOmCnSg8GBVTFwxN/dH9OMsOByrxY37BI+QRah+ONl3LliIuoNFePl8zZaWC8varCxNu4J/g1uINM/21BZfTogYfo3k8EIjGkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gZu8bJG1; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743707273;
	bh=VTL6kwicHLjBdwQujCV+DK1vWwhdgxmpdH1NQF6da1E=;
	h=From:Date:Subject:To:Cc:From;
	b=gZu8bJG15cTU399eLCzOpANebfp7k9ztWQups7U5IhmjYheShf76XMC8sHDE67VPM
	 TD8HEa4KNldWr9R/wUlifxmA5BiItb73thWPoLs+0ShcugHohou5vKcYnRTTr8RgnE
	 JCeJVJ0ol+2g7IQjR/ZoTOqUGC6QBtoCUeM+FsY9xuIPdYlrhmn+KEEIum8b3bq2Hz
	 8puGRaNDKz4J7NuJPUlZyxrZYnkWz1fVgXMpFj/ueYPkjepOM4w9mMohpaVySyW67e
	 PEVe6HtkLlBu7DekNVpmH71NgREqFw3Y3IFOEQ2NpMbUHD+0L/j2uPAu8/IUNlWnz3
	 qUuzRgZ4vyTAw==
Received: from [192.168.13.180] (unknown [IPv6:2606:6d00:11:e976::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9888417E0865;
	Thu,  3 Apr 2025 21:07:52 +0200 (CEST)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Thu, 03 Apr 2025 15:07:41 -0400
Subject: [PATCH] media: verisilicon: Enable wide 4K in AV1 decoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-hantro-av1-wuhd-v1-1-334629cb7f63@collabora.com>
X-B4-Tracking: v=1; b=H4sIAHzc7mcC/x2MQQqAIBAAvxJ7bsG1vPSV6GC55V40tCyI/p50n
 IGZBzIn4QxD80DiIlliqEBtA4u3YWMUVxm00kb1qsMqjxTRFsLr9A6JWC+rmZlsD7XaE69y/8d
 xet8PtfnTcmEAAAA=
X-Change-ID: 20250403-hantro-av1-wuhd-11e2cf5be1a4
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.14.2

Tested on RK3588, this decoder is capable of handling WUHD, so bump the
maximum width and height accordingly.

Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/platform/verisilicon/rockchip_vpu_hw.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
index 964122e7c355934cd80eb442219f6ba51bba8b71..b64f0658f7f1e77b3efd960b35cd54dec4edf4ef 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
@@ -85,10 +85,10 @@ static const struct hantro_fmt rockchip_vpu981_postproc_fmts[] = {
 		.postprocessed = true,
 		.frmsize = {
 			.min_width = ROCKCHIP_VPU981_MIN_SIZE,
-			.max_width = FMT_UHD_WIDTH,
+			.max_width = FMT_4K_WIDTH,
 			.step_width = MB_DIM,
 			.min_height = ROCKCHIP_VPU981_MIN_SIZE,
-			.max_height = FMT_UHD_HEIGHT,
+			.max_height = FMT_4K_HEIGHT,
 			.step_height = MB_DIM,
 		},
 	},
@@ -99,10 +99,10 @@ static const struct hantro_fmt rockchip_vpu981_postproc_fmts[] = {
 		.postprocessed = true,
 		.frmsize = {
 			.min_width = ROCKCHIP_VPU981_MIN_SIZE,
-			.max_width = FMT_UHD_WIDTH,
+			.max_width = FMT_4K_WIDTH,
 			.step_width = MB_DIM,
 			.min_height = ROCKCHIP_VPU981_MIN_SIZE,
-			.max_height = FMT_UHD_HEIGHT,
+			.max_height = FMT_4K_HEIGHT,
 			.step_height = MB_DIM,
 		},
 	},
@@ -318,10 +318,10 @@ static const struct hantro_fmt rockchip_vpu981_dec_fmts[] = {
 		.match_depth = true,
 		.frmsize = {
 			.min_width = ROCKCHIP_VPU981_MIN_SIZE,
-			.max_width = FMT_UHD_WIDTH,
+			.max_width = FMT_4K_WIDTH,
 			.step_width = MB_DIM,
 			.min_height = ROCKCHIP_VPU981_MIN_SIZE,
-			.max_height = FMT_UHD_HEIGHT,
+			.max_height = FMT_4K_HEIGHT,
 			.step_height = MB_DIM,
 		},
 	},
@@ -331,10 +331,10 @@ static const struct hantro_fmt rockchip_vpu981_dec_fmts[] = {
 		.match_depth = true,
 		.frmsize = {
 			.min_width = ROCKCHIP_VPU981_MIN_SIZE,
-			.max_width = FMT_UHD_WIDTH,
+			.max_width = FMT_4K_WIDTH,
 			.step_width = MB_DIM,
 			.min_height = ROCKCHIP_VPU981_MIN_SIZE,
-			.max_height = FMT_UHD_HEIGHT,
+			.max_height = FMT_4K_HEIGHT,
 			.step_height = MB_DIM,
 		},
 	},
@@ -344,10 +344,10 @@ static const struct hantro_fmt rockchip_vpu981_dec_fmts[] = {
 		.max_depth = 2,
 		.frmsize = {
 			.min_width = ROCKCHIP_VPU981_MIN_SIZE,
-			.max_width = FMT_UHD_WIDTH,
+			.max_width = FMT_4K_WIDTH,
 			.step_width = MB_DIM,
 			.min_height = ROCKCHIP_VPU981_MIN_SIZE,
-			.max_height = FMT_UHD_HEIGHT,
+			.max_height = FMT_4K_HEIGHT,
 			.step_height = MB_DIM,
 		},
 	},

---
base-commit: f2151613e040973c868d28c8b00885dfab69eb75
change-id: 20250403-hantro-av1-wuhd-11e2cf5be1a4

Best regards,
-- 
Nicolas Dufresne <nicolas.dufresne@collabora.com>


