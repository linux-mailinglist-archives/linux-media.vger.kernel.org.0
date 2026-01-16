Return-Path: <linux-media+bounces-50903-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66224D322ED
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 14:55:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49B0130BAD56
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 13:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E3E929BD8E;
	Fri, 16 Jan 2026 13:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ik4FA65i"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCCB284B4F;
	Fri, 16 Jan 2026 13:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768571705; cv=none; b=Z4CgXRtKIVt+RAQGHy0TEuRTlqfVlIT9O1Aa6a0w7I16Vn4lyyGqmNpqhJnW4mRHjT2eROE1G2D5z5FrxeMBbZ2Ky9hR+mUOtqd6VLXR9P6au+6cw2fHNVp1WZkOtmq4vgsyKatNo1UL5rG2ZTzdP3qmhqXDRgFevlrVEtV65vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768571705; c=relaxed/simple;
	bh=SBMojAQMLBEsq97VBBgUN3ogr+3rX2KzJ0Dl48KhAsI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V5VubdiPI16qAKufFu19Npt3LhBnHSDjpTKdajZ0MprDvnofw8dnzpGRjbeOYewH0le/0rOJJenL8X6zwY+vimGuaMAN+sxdp8y7tgEKHljH2AvJuvWdc3fevwSy/2e6yjfu4lSp3sy4z1nBreo33xlY1TmQiDfSAVHO16wwoPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ik4FA65i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CFBADC4AF0F;
	Fri, 16 Jan 2026 13:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768571704;
	bh=SBMojAQMLBEsq97VBBgUN3ogr+3rX2KzJ0Dl48KhAsI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ik4FA65iokNPkeMZYHyov+0sD1A76whBsN0Wcd1d3t5Q8L9mfLZIa3UFzKP0g9JwE
	 VBXGWEEV3NnX0dScETYg/OIedPHMWTMuCeeAsPETMqvPidURF3HUFn6cXZnAZv8qvv
	 wpBau2L+RQds+s26WxgblaRvMoNmv7fxcm/efbdR2ERXm72jLJbISERpbfDAUce6Nb
	 Ajf07Gd9rbf8cVFFzwHP/LKqM+2KO7zWPk8v3U1MZHkKMiGVulPsPap5IPHvVEuGlY
	 5wlB/XZesRNOBA1DN83WvPynVfWCdAOEfH0rzQ4fyGsTXcGvZ16w9vHXJhvGD/O4Mn
	 13JI2j99R4Uiw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3252C982C0;
	Fri, 16 Jan 2026 13:55:04 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 16 Jan 2026 14:55:01 +0100
Subject: [PATCH v6 3/3] arm64: defconfig: enable designware mipi csi-2
 receiver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-rockchip-mipi-receiver-v6-3-b7ce6e68b3fa@collabora.com>
References: <20251114-rockchip-mipi-receiver-v6-0-b7ce6e68b3fa@collabora.com>
In-Reply-To: <20251114-rockchip-mipi-receiver-v6-0-b7ce6e68b3fa@collabora.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Kever Yang <kever.yang@rock-chips.com>, Frank Li <Frank.li@nxp.com>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768571703; l=786;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=4/e4J7LessS5jdywMTVpeb4iDs9BMTFRupZRi4shvqg=;
 b=Bggx/lzI9bhnAatC3/C5uqs1E8vcMopP7FduWddmNcfFfe0+QykSLVvKqk744etEPuuBt1fKZ
 kiAlPRHEq9ND2eFm45VqIxKK9ATogTlk+JZ0AU4/KhDDYJ6Oa09lNik
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

The Synopsys DesignWare MIPI CSI-2 Receiver is integrated into
recent Rockchip SoCs, such as the RK3568 and the RK3588.
Enable the driver for it in the default configuration.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 45288ec9eaf7..58bda738819a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -873,6 +873,7 @@ CONFIG_SDR_PLATFORM_DRIVERS=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
 CONFIG_VIDEO_AMPHION_VPU=m
 CONFIG_VIDEO_CADENCE_CSI2RX=m
+CONFIG_VIDEO_DW_MIPI_CSI2RX=m
 CONFIG_VIDEO_MEDIATEK_JPEG=m
 CONFIG_VIDEO_MEDIATEK_VCODEC=m
 CONFIG_VIDEO_WAVE_VPU=m

-- 
2.39.5



