Return-Path: <linux-media+bounces-47129-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A44AC5E1C9
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 17:10:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D01F63A2E86
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 15:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5403234251E;
	Fri, 14 Nov 2025 15:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J7NFc4Yy"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8405133C520;
	Fri, 14 Nov 2025 15:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763133620; cv=none; b=aFnks9AUvRGqVYP1b1Cw7/4d8YndDTwh/FOkBwSvCgtvGQIbxSprSrYyRcTq7FmUzhKQlmryU/34eCy9O1AV4BVZGEmE4NG7HWTCS1Qq8CIQ9nF56r7P+gIwuiYRYsh2MtwzrVuQ0YgD5RVZfW+oJ7LTbV7Z6R8TJepV4XxU/tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763133620; c=relaxed/simple;
	bh=rtJkcFLFc1knvqExD8Pr/+VubLNDMv/tDbYdwMGF14s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZWkA1TZq2s/jJMLeHG+h1MyyoQJdy6eb/ZHNnDGTag3d+PHu0AIYePsjHpHkR4XUG3DiftNro1NVfv2RxrM7DiTbhuu+KRhJxzg52kByxANVV/HdWDlrFmaQiR9Aeur3vSkI+0/RZOqsUDOu4LdMSDlrK1k0TfVdCXJNPMtvZHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J7NFc4Yy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE15FC4CEF8;
	Fri, 14 Nov 2025 15:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763133620;
	bh=rtJkcFLFc1knvqExD8Pr/+VubLNDMv/tDbYdwMGF14s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=J7NFc4Yyn/swMlV5tdQe49rvyHbSNNDpj9Xeit+RnxxiQH6Rssi/CnMnyLjRyZgsp
	 rVE0Ak0prko9SwAGPhz9NFX6rpGPbIUM5cWpxcRpTRP0Lf922ew5VGPt0MGXgFxuHF
	 /SfdYaHBDcUe8EtGxdGTUiJ1D7LUi/E+nmjWyCVrhBCaG0AeiJ0oLGvjvRcOPXe5SK
	 Pm/QJMDz52N5Sz04Xz8C3IhfAAJgAJF/DhI0IpBMluJXEFbRV0SERYCrBp29DVQite
	 lHEVJRNhkMu4HBWdrHfS07jsjY60FYDPdZRqHNNIXYHGbBy9KQhG7rMqtvSRsV0Y2D
	 dRIOKEdWA2MfA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B88CE8D40;
	Fri, 14 Nov 2025 15:20:19 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 14 Nov 2025 16:20:13 +0100
Subject: [PATCH v15 02/14] media: dt-bindings: video-interfaces: add
 defines for sampling modes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v15-2-8f4915ee365d@collabora.com>
References: <20240220-rk3568-vicap-v15-0-8f4915ee365d@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v15-0-8f4915ee365d@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763133617; l=1070;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=i0G3bjQUxPWSrwDi2kbON/7nXKFuVdlWiYyEBIeG7YY=;
 b=FEHaSk1PIArT1EGJtvOkdAjeayF31//VdjN6qurt+Wg6fMxwQlvw1u+zXDSZXD6qxpK1/ot5A
 EN9R6q1+sDrCcgH/oLObU+xd/jKbd6iw0/amM6811QvlY72UHMfqDv9
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

Add defines for the pixel clock sampling modes (rising edge, falling edge,
dual edge) for parallel video interfaces.
This avoids hardcoded constants in device tree sources.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 include/dt-bindings/media/video-interfaces.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-bindings/media/video-interfaces.h
index 88b9d05d8075..0b19c9b2e627 100644
--- a/include/dt-bindings/media/video-interfaces.h
+++ b/include/dt-bindings/media/video-interfaces.h
@@ -20,4 +20,8 @@
 #define MEDIA_BUS_CSI2_CPHY_LINE_ORDER_CAB	4
 #define MEDIA_BUS_CSI2_CPHY_LINE_ORDER_CBA	5
 
+#define MEDIA_PCLK_SAMPLE_FALLING_EDGE		0
+#define MEDIA_PCLK_SAMPLE_RISING_EDGE		1
+#define MEDIA_PCLK_SAMPLE_DUAL_EDGE		2
+
 #endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__ */

-- 
2.39.5



