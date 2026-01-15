Return-Path: <linux-media+bounces-50810-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DFDD27F86
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 20:14:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 61AD5307B68C
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 18:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC3013C00BF;
	Thu, 15 Jan 2026 18:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q3Jdpmn8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1BA3B8D5F;
	Thu, 15 Jan 2026 18:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768501577; cv=none; b=iW3ACxl7ShXN4UQSbidzxC1/tteEz4UzBaP1gRjdoWDcdbnfnhgLZ/wN3eao6TxxMh0Md9yULeQEIt19PsVwHPlHF4GkXGpZtpmJnsCP8qsMsLCKLSg0NJcedj/f+gQUu1m5hVricTBQuw2JjWOg3izHk2Pep92gb3CwzGpwaHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768501577; c=relaxed/simple;
	bh=4CY5Ftxdqdf78iaz/GZPARSYtxXrYl4kHYgo18eZegU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lH3zFEw9cXA9uFjuuMHO8bmFQYP65iUObcOaY08MfjvAn8muQF94LWhmkS2tqocor+S3vJb5J3rkl4LLqK34UEuMqf7ZqsoHWFcgR/jbRqNRcYBmsr9XynlWjXqGY61sXPmSKhSvK0lSQ3MYhWdzoZtguWS3ffD6K+/MmHjHvn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q3Jdpmn8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02BE0C4AF0B;
	Thu, 15 Jan 2026 18:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768501577;
	bh=4CY5Ftxdqdf78iaz/GZPARSYtxXrYl4kHYgo18eZegU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=q3Jdpmn8EEbB3mWwupIToNeIyoBaKWdOXTKQGT6Uq+O9Jt0v6yXuIt+8g81EGeIPt
	 +66CbyhZIBH0x2F0rIGw6QiXI1+7hB/saOxV8M/chCS7A8qcr/Nvi8JpQElAFkgbkr
	 c7LjuyC7zFkUfrGZjQXlcU+1CJqNwh1gnVlxL3Jb6D9xSKIipkBYd3Ci5CNYJIzRNs
	 muhoM4nRPH7NSxns2ETLhEcFCXtuHq/Y3fkRs4eUQNiZM/3JNzqM6c4xs9MLORfpSH
	 S770KYjZDNrxpFopVkEzz0QF8eX5VXF9VtbQE7SOrxEP/kjg6zJSP6axYnVnqTgE42
	 P5kQFZwCXAoWg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED98ED4660D;
	Thu, 15 Jan 2026 18:26:16 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Thu, 15 Jan 2026 19:26:09 +0100
Subject: [PATCH v4 3/3] arm64: defconfig: enable designware mipi csi-2
 receiver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-rockchip-mipi-receiver-v4-3-a9c86fecd052@collabora.com>
References: <20251114-rockchip-mipi-receiver-v4-0-a9c86fecd052@collabora.com>
In-Reply-To: <20251114-rockchip-mipi-receiver-v4-0-a9c86fecd052@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768501575; l=784;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=C9lnlkDzHuvbmOodwv1mUExRofM5smDG511gbhu0yVQ=;
 b=lcKel1VKfg/RAFBSyMUvAvqmAljYnMlAt/L20N08+aQR7aXL9B87XAr+ErJkQJhQyy35q0yc4
 eJt1IR32ZveBxL+D2I5TU3cjL8jFSu+n9++4AQH5yEGtyj6I/Dc/h2W
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



