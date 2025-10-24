Return-Path: <linux-media+bounces-45514-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B430C065B3
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 14:53:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5148A3BEFF0
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 12:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A028F31E110;
	Fri, 24 Oct 2025 12:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WYIUeuI4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1E631B102;
	Fri, 24 Oct 2025 12:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761310297; cv=none; b=OOGutmOanc6qJ2o5GIvtet2Fhey/VwkyIjA79qdfhnmcuW4+CkBcb4yjJCXLWqOUvLwmkQEeCnZWXs3PBhxXjVy+F+faZ831NPaCIqqqjVG0q/RtGse9MqsYx8JNeZvZalRSdkdzZddp0PfPjxDGCTZ5yyDVgZDRDnQfeNVemLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761310297; c=relaxed/simple;
	bh=aBigsactKw446CLi8wlsqginYIn3IhRT+6NDvM9c2F8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tnBqrEU6z9cw3I0XLFDewEIwcnl9lSzzyXM7Rppiae7D2N2V5yeYO/2w+ROLjV30ERL0hd6JCIM68qCnb4VtiXkpKjW/1ySE/EansSYe0U/P9Gb/UJEavfdNtEWCmiO73ALLn8iLveMi7UbKjplW4IYUxJukPxAZSs/NxjOI45c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WYIUeuI4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D80B5C2BCB2;
	Fri, 24 Oct 2025 12:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761310297;
	bh=aBigsactKw446CLi8wlsqginYIn3IhRT+6NDvM9c2F8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WYIUeuI4Pzv7psdP8daRHCp55UiXjcCvldd8uv+KdgmHIF9Gqb9G+pEjSeDZY0QKq
	 2IiYg1h5UsBqdMQSrH7Afc+1UL6zaZZjQf342ag6Zrij04IVyWjHeu4YVNH+D9tQBm
	 OisIaRUJuczIkPBxug7R/FrfI6nb03rbWfC5zfJmEmEggJ6zLTcVuOiNg6DIEy55Dw
	 eWujhedIFJlKqecGr7VHSME/azDs7CANFlPq9ibdBheTNyXqJ0ujTw/B1pHpSLvJ8Y
	 FlTxUpCvDChLtM01DR+vJPkW8AevA2WADFRXVt/Nj9HnBiGtkGtB72pCEMYYOA83bG
	 l5hGrecY12h2Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA506CCF9E9;
	Fri, 24 Oct 2025 12:51:36 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 24 Oct 2025 14:51:42 +0200
Subject: [PATCH v14 13/18] arm64: defconfig: enable rockchip camera
 interface and mipi csi-2 receiver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v14-13-b38b6da0fc80@collabora.com>
References: <20240220-rk3568-vicap-v14-0-b38b6da0fc80@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v14-0-b38b6da0fc80@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761310293; l=950;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=6j0p86wA9iB9QT1kpUQbcTBHNdUs79VzNYjYvLw2zV4=;
 b=2kJEoaOdMnCXyz7AlDV3YUqPXk+f/bINnh3+MaaaWC5yXKJf15RjGuHtSjP8vkV0UDWvyp+ts
 7/DzblFXtJnBSNdnufWzf4oBHtR1ukOdsb8CNGocvSzw1IrI/qVgG2L
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

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd104..86e39240979a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -883,6 +883,8 @@ CONFIG_VIDEO_RENESAS_FCP=m
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



