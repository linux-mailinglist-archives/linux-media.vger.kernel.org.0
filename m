Return-Path: <linux-media+bounces-26241-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B791A38DC6
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 22:01:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3ABEF188BE3A
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 21:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAB20239082;
	Mon, 17 Feb 2025 21:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bSDoAD+J"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106E3226545;
	Mon, 17 Feb 2025 21:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739826052; cv=none; b=Kr9Mj0Z9tZU85vR83FAGXzeHTIbERhaVIy5hejfZwSjnc0Rc+Eh9xyROwLtiCCzcbMLWPctNYSTGqdQ0tPn5CLycFV3FblJHKlyts+3kfeUOAZimpi8gwI6BbIixcLwrdfOcm0gZGcHyFVHSFyephdEMGJw63lvRWYT5DotiYA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739826052; c=relaxed/simple;
	bh=f5tgNUKn8b8r/9Um0XvFMzVBJvr9yukC/ZCxlBpueLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eFP673BZSm3W8tdZ5QkkLcTMY52bc7Tkk9c2I0dXALXUumLjMBbZmW1FHQrDQtm9h4byKLf2jOKNhzTVQHCEPYt6LZEE/51jGKDiYnO3zxFLbfRdFOgWLvRYCSZfTbNjYveWFb2hFcit0USU6Lt7wk6E9CX071tbqPLw8TG6eNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bSDoAD+J; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739826045;
	bh=f5tgNUKn8b8r/9Um0XvFMzVBJvr9yukC/ZCxlBpueLU=;
	h=From:Date:Subject:To:Cc:From;
	b=bSDoAD+JmM6J6AcSUDPkzxa/vE0iU5XSWGbAfLo/JbUAZXYz3UiFHJ6Uw9pBaWDql
	 6KLWhZbBSdZZogDh0shLRnSSHjQdS3iUr5y+grmvv/sXTWXyYjAdEcnFu1lwWaGs3c
	 ZChyktJ95Uxgy7oeXN3aVBnW3RL7iWVVuvyIC/xgk+obT/KB7M5kT0hiVUZHuowwS0
	 Ld6weeFac+aDBakv6K6JbwtmqmG4ahLU5yPsgZjp/Ra2bMp8z9o02zQmXIPNjWJ/U1
	 ptkkg/N8pv1Y1vK4HjqkVtQDypnoJp8XpEGlIBH5cGgK2aOdqwTW935r/hj0EFLgav
	 NjmuK0IVOApPw==
Received: from [192.168.13.3] (unknown [IPv6:2606:6d00:11:e976::c73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B235C17E1097;
	Mon, 17 Feb 2025 22:00:43 +0100 (CET)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Mon, 17 Feb 2025 16:00:38 -0500
Subject: [PATCH] media: verisilicon: Fix AV1 decoder clock frequency
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-b4-hantro-av1-clock-rate-v1-1-65b91132c551@collabora.com>
X-B4-Tracking: v=1; b=H4sIAHWjs2cC/x2MQQqAIBAAvxJ7biHFCPtKdDBbayky1ohA+nvSc
 QZmMiQSpgR9lUHo5sTxKKDqCvzqjoWQ58KgG902WnU4GSz+kojuVuj36DcUdxFSa2wXlLF2DlD
 yUyjw86+H8X0/3kW3uWoAAAA=
X-Change-ID: 20250217-b4-hantro-av1-clock-rate-e5497f1499df
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: stable@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, kernel@collabora.com, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.14.2

The desired clock frequency was correctly set to 400MHz in the device tree
but was lowered by the driver to 300MHz breaking 4K 60Hz content playback.
Fix the issue by removing the driver call to clk_set_rate(), which reduce
the amount of board specific code.

Fixes: 003afda97c65 ("media: verisilicon: Enable AV1 decoder on rk3588")
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
This patch fixes user report of AV1 4K60 decoder not being fast enough
on RK3588 based SoC. This is a break from Hantro original authors
habbit of coding the frequencies in the driver instead of specifying this
frequency in the device tree. The other calls to clk_set_rate() are left
since this would require modifying many dtsi files, which would then be
unsuitable for backport.
---
 drivers/media/platform/verisilicon/rockchip_vpu_hw.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
index 964122e7c355934cd80eb442219f6ba51bba8b71..9d8eab33556d62733ec7ec6b5e685c86ba7086e4 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
@@ -17,7 +17,6 @@
 
 #define RK3066_ACLK_MAX_FREQ (300 * 1000 * 1000)
 #define RK3288_ACLK_MAX_FREQ (400 * 1000 * 1000)
-#define RK3588_ACLK_MAX_FREQ (300 * 1000 * 1000)
 
 #define ROCKCHIP_VPU981_MIN_SIZE 64
 
@@ -440,10 +439,9 @@ static int rk3066_vpu_hw_init(struct hantro_dev *vpu)
 	return 0;
 }
 
+/* TODO just remove, the CLK are defined correctly in the DTS */
 static int rk3588_vpu981_hw_init(struct hantro_dev *vpu)
 {
-	/* Bump ACLKs to max. possible freq. to improve performance. */
-	clk_set_rate(vpu->clocks[0].clk, RK3588_ACLK_MAX_FREQ);
 	return 0;
 }
 
@@ -807,7 +805,6 @@ const struct hantro_variant rk3588_vpu981_variant = {
 	.codec_ops = rk3588_vpu981_codec_ops,
 	.irqs = rk3588_vpu981_irqs,
 	.num_irqs = ARRAY_SIZE(rk3588_vpu981_irqs),
-	.init = rk3588_vpu981_hw_init,
 	.clk_names = rk3588_vpu981_vpu_clk_names,
 	.num_clocks = ARRAY_SIZE(rk3588_vpu981_vpu_clk_names)
 };

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250217-b4-hantro-av1-clock-rate-e5497f1499df

Best regards,
-- 
Nicolas Dufresne <nicolas.dufresne@collabora.com>


