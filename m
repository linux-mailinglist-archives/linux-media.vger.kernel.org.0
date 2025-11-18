Return-Path: <linux-media+bounces-47264-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D1992C6901B
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 12:13:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E144C4EE2FD
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 11:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9945F34F491;
	Tue, 18 Nov 2025 11:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BGoYB7uq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD77034E764;
	Tue, 18 Nov 2025 11:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763464348; cv=none; b=Ji0+w5MUjBuz9uW+bmrJfjPUqLDV/xy4qHWlQ9Q2JPd8RafWsvuBMw5LlHxn6SgJwGd90VDMs8V86gTGZba8e3Y23akYEbE78SKQtQk7syZStBdeutOpT7AwpBXS2CCVSkWjjkMkTSRe6GAsCn13HxjbgxtIAcr9V4kgwW027sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763464348; c=relaxed/simple;
	bh=xnocN+UVtEWIR/5avN8SC34bZiIurYSuuufPbeT/3Uc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vu+fUdHmMTMRG1jFkIdCN6KbVRWrBGU1DKgI4Fn6a2Y6nB5iwq8UpP5TbFrfjlAJPnF+nyKt/aJjarQgA8oL/UjT8qIKT4PidFxmiwoOrUqFT1XBmaoCo4fAmemj9fCDlb/Gm+tbz6GtAll8qavmlY9/j0p5TPvYAsLuLNmKEg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BGoYB7uq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51285C2BCB6;
	Tue, 18 Nov 2025 11:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763464347;
	bh=xnocN+UVtEWIR/5avN8SC34bZiIurYSuuufPbeT/3Uc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BGoYB7uqZrvv90OkHLoOlaRiBuZQ6Izgj98yvwZdyvUzmNpuTettRuXSf11pBDm1l
	 Lmd3u8rc6e8ImbthAa9crlxbKpeLTi3yGsoV13dT3C2NzcFd34nIP4L6EDtdrbvmt6
	 QUHZfxcFn8Ptd1Qk+oICiL/2NVgbMNaZBWzyMl8pectX6gHoo5H7CQMhcN9rUJLtau
	 xHyXJBFQ4/aLco+NF16aGx645y1cEnAT3e+onhSlBDo2oCcXx1wDDoflFVUvYOzuHX
	 j5rMVKS1VzxdnHn6hoV+la0fiAt+Idci3ExEF8Cf7zfIvmcH9R1roA48xpJrWAH97x
	 PUGwp3pzqowrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 065E9CED61A;
	Tue, 18 Nov 2025 11:12:27 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 18 Nov 2025 12:12:27 +0100
Subject: [PATCH v2 3/3] arm64: defconfig: enable rockchip mipi csi-2
 receiver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-rockchip-mipi-receiver-v2-3-eb9b43377fc4@collabora.com>
References: <20251114-rockchip-mipi-receiver-v2-0-eb9b43377fc4@collabora.com>
In-Reply-To: <20251114-rockchip-mipi-receiver-v2-0-eb9b43377fc4@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763464345; l=775;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=QnSDQN2WWfjs2EWe+e6kdAB9fFyLYhe37xUo+h6vPgM=;
 b=XeLsfJxVtIS8ozuzcmT1zTnkjSz5Yf2qGGwwLGRIxHjZ6cBA6BS/mf738D8ICgTQWu15nX4ss
 J0UOq+plGVWAC5GU1WU4jPL5DUd3E/asiExml3igaqeZAZ1EtAiKboF
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



