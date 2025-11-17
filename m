Return-Path: <linux-media+bounces-47204-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5ECC63656
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 11:03:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC5663ABF63
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 10:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800BA32721F;
	Mon, 17 Nov 2025 10:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YSiz/Wn2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C890F30FC09;
	Mon, 17 Nov 2025 10:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763373687; cv=none; b=TAD5LoVKzejtA4QNQbtQ8vF6JdkJu2hUCH+/HoKTpYRMxrTarwJertqd8hrIeyYVfyTWYPF/Fc4hKLN3FxhXKgioc6fcsS8MWaO54Yx1jWjmc/g4Q0kJuX5nENhlSp87x2lcZdH2/pgQOVWtu7EZga0pMRYbQZtx6GJfAlRjWfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763373687; c=relaxed/simple;
	bh=xnocN+UVtEWIR/5avN8SC34bZiIurYSuuufPbeT/3Uc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aTiiuqEQ0y/4eob9TiHc6gMWAvHMHWOlbsjxGWdeBK354NDspQCAMZrLFOc2WKCvXEexVqC6VHSIskD14TzfX06UBpgLf2YiYcKWem9Y9C6/4yO6/SAR35u5TeHN84iyMuzCzKZPaCHI+/2s82VesPcyPvOS9baphpd+g+DMkYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YSiz/Wn2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4FCADC2BCB0;
	Mon, 17 Nov 2025 10:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763373687;
	bh=xnocN+UVtEWIR/5avN8SC34bZiIurYSuuufPbeT/3Uc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YSiz/Wn2WUwf1/cDcobK/ebDw4pmNBeumml+mqU/aGqmxtE1S4tTRX9viyw4k1461
	 gs/lnYRro6BFBVBAKfE0WTGMziADi6kpUzeXFhlcq2bNLcuwpfsO1sXfB18m8A2sNM
	 6FfEqJ+EHV84P0qbR00jXB2k9zFcs4V3zL8reIs0YOAH6u2AgtZ+jqJEu+0yTBeWdf
	 RX1ekx7K59OxYTUySh9Xky6aIETK9asTxiRpjQrtSTY9+aV5ns/gDKbMiIS60cKHJP
	 i93K8cnReLH8vQN8EOpp8MhxLRiJtYv2PbQj9OZ/KZPc0IPtrHWj/HdE2G69DPDywh
	 gTTQw5T6uHjog==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42AB1CEACEF;
	Mon, 17 Nov 2025 10:01:27 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Mon, 17 Nov 2025 11:01:11 +0100
Subject: [PATCH 3/3] arm64: defconfig: enable rockchip mipi csi-2 receiver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-rockchip-mipi-receiver-v1-3-d13086e810dd@collabora.com>
References: <20251114-rockchip-mipi-receiver-v1-0-d13086e810dd@collabora.com>
In-Reply-To: <20251114-rockchip-mipi-receiver-v1-0-d13086e810dd@collabora.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763373685; l=775;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=QnSDQN2WWfjs2EWe+e6kdAB9fFyLYhe37xUo+h6vPgM=;
 b=zt8JNwCZhzaZrzJAnP4ZyYk40HPoatQgt9OBh6t8KP0dO2nRZj4svhR/IY0A+8cfaJFYPlL1O
 1wVZnObfa4OBcWolGjElKd3Ivs92U1KAxP0nh9ccgok1HReq1sahHnZ
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

The Rockchip MIPI CSI-2 Receiver is integrated into recent Rockchip
SoCs, such as the RK3568 and the RK3588.
Enable the driver for it in the default configuration.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd104..a161666f2894 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -883,6 +883,7 @@ CONFIG_VIDEO_RENESAS_FCP=m
 CONFIG_VIDEO_RENESAS_FDP1=m
 CONFIG_VIDEO_RENESAS_VSP1=m
 CONFIG_VIDEO_RCAR_DRIF=m
+CONFIG_VIDEO_ROCKCHIP_CSI=m
 CONFIG_VIDEO_ROCKCHIP_RGA=m
 CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
 CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m

-- 
2.39.5



