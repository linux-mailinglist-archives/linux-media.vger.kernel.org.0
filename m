Return-Path: <linux-media+bounces-50898-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B404D3180C
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 14:05:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7A48E30213FC
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 13:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BA1E25783A;
	Fri, 16 Jan 2026 13:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KkzSWXSM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A3B23EABB;
	Fri, 16 Jan 2026 13:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768568678; cv=none; b=RbeN4RWg1MhX0738kR7HIwbZvk+pdTNfYIRVfpNIhBU9G3Z7Hs3omzCT4+YeFgsOABXl1RGiC+uWAwkNC19LBbBqwSPEdxveEAZvHG8C9OOWddTucce4tb5MxyMHUcsNaIxe8oXWGpBo2lN6pETjouW/kQ6IyP3XSimJuh3zipA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768568678; c=relaxed/simple;
	bh=4CY5Ftxdqdf78iaz/GZPARSYtxXrYl4kHYgo18eZegU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eYrW7pTuwRpo1Bz/4mMeg0Ve1pAvh1V/NK7S8gyztW1+ENvl3QOqVfyl21SERXplIYM3OvzkMKjkI69Hd9Xk+aW4Lb4avNg/zIHzO+dQKlbaGAw0p/7NMwMI+hBC3MXBC0XDRXv98Kue0PazPNuOtHnGFCtq0YdDoN0s7J9iB0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KkzSWXSM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8AB03C4AF0F;
	Fri, 16 Jan 2026 13:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768568678;
	bh=4CY5Ftxdqdf78iaz/GZPARSYtxXrYl4kHYgo18eZegU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KkzSWXSMuaN8tqpedT4ITAYYQIsUuvPx1YzJRL58rzA3lVObIyY35zaHEW2Fo8TXc
	 Q+bPpupHEjosK9WFIdc4x1JF7kWwzVeSyR6e7wfAmOvmCb0g3+BTIFJW+rrcsSeJlb
	 GBzuMCAVgDipOVAPO/We5imZVE2IT2s9NWuJ0K4YTM+T/Q+KLfyxVqLoiYtMMmVbU3
	 N97YosQWyliZVcmUPUzyndr8JAYgr1PjHtCtUm6P6atV9KXY7ilsL1prlzyMt/hvfb
	 zl9d4WUCCtCDr9kS1bpijyqC1STSuGTMfiht2PMbBNKjA5vPFsTV+SKuT7tNQno00h
	 a85zi/xMcQ2xw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E626D4899D;
	Fri, 16 Jan 2026 13:04:38 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 16 Jan 2026 14:02:48 +0100
Subject: [PATCH v5 3/3] arm64: defconfig: enable designware mipi csi-2
 receiver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-rockchip-mipi-receiver-v5-3-45aa117f190a@collabora.com>
References: <20251114-rockchip-mipi-receiver-v5-0-45aa117f190a@collabora.com>
In-Reply-To: <20251114-rockchip-mipi-receiver-v5-0-45aa117f190a@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768568677; l=784;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=C9lnlkDzHuvbmOodwv1mUExRofM5smDG511gbhu0yVQ=;
 b=GtlzAED5qA4BDLUOI836OZbRb5e2245thVw8iwM5pvT6KCJ6Sn/RiDpYDVlgquSoo3/jIopjC
 ndk7KHAt6eDB1XRnhAx9TWPCP0mUIcEqs9QA6xug1stXtl+1BA+huRp
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
index 45288ec9eaf7..26532de26668 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -873,6 +873,7 @@ CONFIG_SDR_PLATFORM_DRIVERS=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
 CONFIG_VIDEO_AMPHION_VPU=m
 CONFIG_VIDEO_CADENCE_CSI2RX=m
+CONFIG_VIDEO_DW_MIPI_CSI2=m
 CONFIG_VIDEO_MEDIATEK_JPEG=m
 CONFIG_VIDEO_MEDIATEK_VCODEC=m
 CONFIG_VIDEO_WAVE_VPU=m

-- 
2.39.5



