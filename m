Return-Path: <linux-media+bounces-34531-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02716AD5D0C
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 19:20:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 041287AD7BE
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 17:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B929322256B;
	Wed, 11 Jun 2025 17:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uk4Ydl56"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D479221260;
	Wed, 11 Jun 2025 17:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749662358; cv=none; b=j0iCS5Pz01TdCCNF7TfGKZOIWwYe0RR/qKDBm88qlpc/Dqk1jrqKqeQuubaPYFdw78blye73kthFV5QYZagWsNLUW2jvDUiWmI68IQ5xgBAqVYYUKdGVKmiPTAf+5Tpbp+MBP82HCrQiPnuW2TSwO0OEw6Ow0J6j4HkKstlCws4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749662358; c=relaxed/simple;
	bh=nxLCM24P7cubSUi7T31Eqd5AAY6vpTE9c1xWbT9LPwM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F1fo9WVdgNvqPpa7INu/FsoDsndAtbsB4XlroPLGdoqWexzy6YtqLQ69XUIeXayJbbBNwJriqB2xAw2E2DjR330zx02j+CSykxSOKB0pivhKbNpquS9DFihAKpWLB3WwxYEFeopIM9cf/Ex76Uy6OVMw1r5jkar4ZREZca8zleY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uk4Ydl56; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65BEEC19421;
	Wed, 11 Jun 2025 17:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749662357;
	bh=nxLCM24P7cubSUi7T31Eqd5AAY6vpTE9c1xWbT9LPwM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Uk4Ydl56+0jskp364VikNGL/gS2DrXRzbQ+SoAA2fX20lONglMwG3mrXvj+uRJYcQ
	 4PVL3iqhuMGuCve/q/UM8r38Q42CUbC9zBcvKpghaMgEcg2Iv4tVQzQoTXN5FwuFfG
	 Slr3IpAk6SIwm7zyCCzNngWaCQZeJfCHo+XD/Z2tKo7OvKOwHxvnp0seyduy7GWF1R
	 WZ254IrxdVFOdd23UirV79HVIEXjP0e7QLic97BaUipm/rk2HR3loqajdbXZtN8YVd
	 ALzmgIhvvti0OFm7FbLVIOp+pM8lDLXBhNj47gKiNu1VxAL59oCuHDcGFF66nT1fwT
	 NLLqlCnDW3eQQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B97C7113D;
	Wed, 11 Jun 2025 17:19:17 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 11 Jun 2025 19:06:54 +0200
Subject: [PATCH v8 09/13] arm64: defconfig: enable rockchip camera
 interface and mipi csi-2 receiver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v8-9-9d9cbc4b524d@collabora.com>
References: <20240220-rk3568-vicap-v8-0-9d9cbc4b524d@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v8-0-9d9cbc4b524d@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749661609; l=837;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=s455V9CkyvpGzSN6VrzWbnGJFsrnYK1zOquWGv1ME3g=;
 b=mfLu88r0mj7ziuH24iJxgfOkRVs26CXynMOS6vyyAlqmvc/gdRXzv+mQLubStZj5r6nE9BDAM
 Ys/Vf/C7qnTBH+P7PVbxJ513uuV9dgVkhUtyJugXVeTi/FDc61UMriU
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



