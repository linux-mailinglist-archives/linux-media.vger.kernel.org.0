Return-Path: <linux-media+bounces-35196-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C98ADF1D2
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 17:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0591E1BC1917
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 15:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4984E2F2367;
	Wed, 18 Jun 2025 15:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d40sM2Yq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4132F0C6C;
	Wed, 18 Jun 2025 15:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750261850; cv=none; b=IhnUwQwoB4A7siwROf6uMz10UitRpFFekjpZvNCcy8kbU61+dA3wKgwJ0DuWLHfc42A3EITfuHvjv2vm6ecS6wa0MfDDhDySJQrXKjQpY9pA/Ek5Y5j4i3947IHrIpvnCnNodkjfrYCDB0iQFLmYYyrwnUuALjCtFmgU8ir10ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750261850; c=relaxed/simple;
	bh=nxLCM24P7cubSUi7T31Eqd5AAY6vpTE9c1xWbT9LPwM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pxf9d54wwTqtoFfcQDnDC2piAh4/+9ek82GH2MLEpwWxVmcIuWkkLijePfY6pO62cilWY1TwHQIkZgBRnWy0Wue1hzapSu9LHsvtVBMZBXHACqkVV3QiW4eTy8jnvgUUQENfb4trs2w+x74E6ZT+bzCX8sGBhKUe+nF8OrfBjCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d40sM2Yq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5D56C4CEF4;
	Wed, 18 Jun 2025 15:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750261849;
	bh=nxLCM24P7cubSUi7T31Eqd5AAY6vpTE9c1xWbT9LPwM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=d40sM2YqBiaekqcthuGC5aONn6vNOzdIb5uh/hPAJarjavnO6FtOQKxATJJhYN5yq
	 SdWul7oAydwAGQkbbEIC0HFAYKTWjJk7YDtkmsOEjSX/gz2hrbMG9VZFs9N/E1BjIj
	 X9rWx8piYJMn4gYF625TF653XB9N00oKk1cbiwPH2+pyTShhci1ywuayiatOEvuzLX
	 6PryfKylYQJNPOiMoU2CWHE57oSB+To/L7S3BXYLPGexrfGoOd9l1dTYr+uHrq32FY
	 vrn2gfiAYGQ8u42S1WkpvGwtNcy/OLbXUZ4zYMt/3bo1DoPn0b3rhrprwHShBFmEfH
	 ZLBRt90lashhg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A883CC7115B;
	Wed, 18 Jun 2025 15:50:49 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 18 Jun 2025 17:38:04 +0200
Subject: [PATCH v9 09/13] arm64: defconfig: enable rockchip camera
 interface and mipi csi-2 receiver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v9-9-ace1e5cc4a82@collabora.com>
References: <20240220-rk3568-vicap-v9-0-ace1e5cc4a82@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v9-0-ace1e5cc4a82@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750261092; l=837;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=s455V9CkyvpGzSN6VrzWbnGJFsrnYK1zOquWGv1ME3g=;
 b=L/RMU/CEGvp2/p/uPFxjh+Qo4l4nsCCY2q7xVMT+N9ccKNBbv9k4kwb9AKkZRuy5qCe8VgDxD
 8sbGQfLTmhWAJ1NDi38QAwio+38mA7rZ+Z8sltxRkGFR8+wZzxwRG1c
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
index 897fc686e6a9..fe07209102dc 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -865,6 +865,8 @@ CONFIG_VIDEO_RENESAS_FCP=m
 CONFIG_VIDEO_RENESAS_FDP1=m
 CONFIG_VIDEO_RENESAS_VSP1=m
 CONFIG_VIDEO_RCAR_DRIF=m
+CONFIG_VIDEO_ROCKCHIP_CIF=m
+CONFIG_VIDEO_ROCKCHIP_CSI=m
 CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
 CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
 CONFIG_VIDEO_SAMSUNG_S5P_MFC=m

-- 
2.39.5



