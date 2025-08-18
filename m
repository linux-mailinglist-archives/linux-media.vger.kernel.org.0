Return-Path: <linux-media+bounces-40205-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0DFB2B4E4
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 01:41:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B177E4E7261
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 23:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39BDB283145;
	Mon, 18 Aug 2025 23:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cdZV7uml"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFC527D77B;
	Mon, 18 Aug 2025 23:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755560388; cv=none; b=g9IwHB51BR6hdFdIFh/zg0gwuDmm4ngugPPVDmy5xtJUgWRXrHQUlRvcj5jJRPUXgsBxBjeOxigVIYvp2/qDPmNKVuigFJhxOxlYjBPJQKOwrMEpJEgKTPRANvZHVy2OimF0RQYo9K0aIltsIYjONXncxqsJoHlrKNbFwZMa0m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755560388; c=relaxed/simple;
	bh=F8Qdm9wRtPFj1FUfpuDc+eSbRNZ/9N7OZarf51+gRh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PUKhKL8FcVvMrbmeJg3UofI5dpLXLQZHybgKVkJvlcXVVgHNNRD62G13BzOSRGDdTyzJnbe7SSXlVUoAGamSXhawkvxCruC3CnaLnwfahScdds3fsfTf3Pj22l06GkXTH/qEqBkj1j0mGzj2OW0gs2LuWT9fAZa9ylNNddRxzRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cdZV7uml; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1A00C2BCC7;
	Mon, 18 Aug 2025 23:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755560387;
	bh=F8Qdm9wRtPFj1FUfpuDc+eSbRNZ/9N7OZarf51+gRh0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cdZV7umlOBwLb24CcXHqVtwUyNjPqsa/XF28CHvX8VKh9w9FVmMkjy1hjQz6cvqaG
	 B+dmer9j8tY7B23GYNJQX6/rhB3G+rzKD5AYWkYD9rfwjdj2p/ESOCXkI4lJIYwH8B
	 v7wWydqvav1Z/04uszkpiuZCawMlz2YgKfZxURDGvdDtasDxwerQk+aYmr0EM0OJ7U
	 vzz9Vec7+hPocSDxbxT4+gQnyo+yV0Q88N2a79Oy75OK+Esk+Lcu2svhrKCMM4Iutz
	 7zMk1HMzf1+EPFAHX0YGcyK91vZRZphvzSLSZeRgnihmChXDT5yHWFYoPsX2M8K2gn
	 FpV1mBUPo0BNw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8395CA0EF7;
	Mon, 18 Aug 2025 23:39:47 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 19 Aug 2025 01:26:01 +0200
Subject: [PATCH v10 09/13] arm64: defconfig: enable rockchip camera
 interface and mipi csi-2 receiver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v10-9-62d8a7b209b4@collabora.com>
References: <20240220-rk3568-vicap-v10-0-62d8a7b209b4@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v10-0-62d8a7b209b4@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755559554; l=834;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=ODTHuQlKuPRMOWRDe0uxoXXXqr9wwzui1kpqREL2WCM=;
 b=oOSjRvi11TmPA+x0kQ9FXOuacWH6jgGRCHVkESPgw1DTL00NYUCqTmnbjridOQh1GUTzJjKil
 Ugsof0WjXmUCmPrkcQ4HO0yAmp0rLbrwIq8NM6/fd1XyfmceXLUPdV+
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

The Rockchip Camera Interface (CIF) and the Rockchip MIPI CSI-2 Receiver
are featured in many Rockchip SoCs in different variations.
Enable the drivers for them in the default configuration.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 58f87d09366c..625cb5b47fb5 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -876,6 +876,8 @@ CONFIG_VIDEO_RENESAS_FCP=m
 CONFIG_VIDEO_RENESAS_FDP1=m
 CONFIG_VIDEO_RENESAS_VSP1=m
 CONFIG_VIDEO_RCAR_DRIF=m
+CONFIG_VIDEO_ROCKCHIP_CIF=m
+CONFIG_VIDEO_ROCKCHIP_CSI=m
 CONFIG_VIDEO_ROCKCHIP_RGA=m
 CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
 CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m

-- 
2.39.5



