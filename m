Return-Path: <linux-media+bounces-31407-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E49AA4723
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 11:29:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E111C7B14E8
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 09:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA1A23C4F4;
	Wed, 30 Apr 2025 09:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xi92GO4O"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7410523504B;
	Wed, 30 Apr 2025 09:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746005265; cv=none; b=snwnwo3/3xznxYXYNXDCaNrXa8JA3XOIGW5q/VOCzMWylWQTORu1HzHdLhMHq2x55ATjqsIH7ajPo6PFmfpN0p/mwIHM2ynMDIPaxpo6FhdiVpFqg/s8CWhOVY7+I8Z9dbLWuuWbiHL8inHvIJo3hpc37Haq2z8tfUIz1PZ9Jns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746005265; c=relaxed/simple;
	bh=B5XjYTfglp+Es1h3q+EiooNvXOUXKpsC93FJIsCIIVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nu0RJi3fVxivOLU6y/ZANDCOOPIe9IrggRlrT8SItmytxwJUsR9WykZbuXYnB6YD/qDG0CKTzOpX7Ix4f8W9U2Rn7aDr+uNIVKvBHQhwvc1mLJGkg1Il9NEHJnevTERVAd6ciC9b41lGz3ANPHG0Hxyk5apPVUjhMHEtRX2X6MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xi92GO4O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3629EC4CEF9;
	Wed, 30 Apr 2025 09:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746005265;
	bh=B5XjYTfglp+Es1h3q+EiooNvXOUXKpsC93FJIsCIIVE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Xi92GO4OBS3RutLW0R7/EJBE22y8o+R1kO7QrI6PMZcH84fnVfYbvTgGo0m41SrOL
	 1TNSaFBMMniSgldToHF9zn0oU8h8SAXVlJIlvRQFbcV9dU1loABVPrf4M1j7hN2txX
	 Wx6gxLyk8zu/9tDU1M6xG9UI/h74cWx7r2h2hQR620r8L3EDzXaPmoTNRzyl+XowSD
	 dPhsRflaUf+7HhcpZiIB/aRnEDXmmz/4onjt3LwqLt9RS6nWBrQwkAlm9c2wtp7YuJ
	 ygp+kIT0LxBOg+V9DgckAp/GrvQF4jle+4jdD8Dvp9+P8BIoUt2dE8DTsqRVVg9mur
	 BAEy7sAkiNQKA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C145C369D9;
	Wed, 30 Apr 2025 09:27:45 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 30 Apr 2025 11:15:58 +0200
Subject: [PATCH v6 09/13] arm64: defconfig: enable rockchip camera
 interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v6-9-d2f5fbee1551@collabora.com>
References: <20240220-rk3568-vicap-v6-0-d2f5fbee1551@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v6-0-d2f5fbee1551@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
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
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746004564; l=764;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=YywfWp66Y4vQTxzH3S912ReMsygZed8gsGkdLcdgxgY=;
 b=SOdhNT9BlY2fUd/dPSaj3UF/shCzwOoeaA8W402+CmaOdLhOQFiOMrJyElpFIq3h6bD877lhr
 rAjgMJvGS2xDMl0EUZrO+kARa05Gimvs+XsLlTdLTzdYvdfKMZ5sAaM
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

The Rockchip Camera Interface (CIF) is featured in many Rockchip SoCs
in different variations. Enable the driver for it in the default
configuration.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a2..110ff52195a6 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -858,6 +858,7 @@ CONFIG_VIDEO_RENESAS_FCP=m
 CONFIG_VIDEO_RENESAS_FDP1=m
 CONFIG_VIDEO_RENESAS_VSP1=m
 CONFIG_VIDEO_RCAR_DRIF=m
+CONFIG_VIDEO_ROCKCHIP_CIF=m
 CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
 CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
 CONFIG_VIDEO_SAMSUNG_S5P_MFC=m

-- 
2.39.5



