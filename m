Return-Path: <linux-media+bounces-33311-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4370AC2E65
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 11:15:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 621B71BA2312
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 09:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF9219D07A;
	Sat, 24 May 2025 09:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P2Z8KIQ9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3CA1624C3;
	Sat, 24 May 2025 09:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748078083; cv=none; b=peffFDmEWYBB89fXC6eG9LGwvoit9FrEG1NM7quL7IhyoZN4ieM+MMqVf5LyhhGDUm98pI6ZogzbEi0YMyw2109sIaK5Dq29rn/BYOCBiAAFJLJhoFd+cL97B5QRiIKZsOh6Hy4msMrCHVk+zKSWIYI6YrDNEACCgoVbmrB0U1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748078083; c=relaxed/simple;
	bh=zjBvC5CJ3JyRl8kS1POe18jEYgJfRwvLs62DrdIw4XE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tVux8mJ3PYvuJuv81w9oMnrDiWaEO+xJ2KgRWCCcV6wopSpoAxmnNEvWqoE0gFIaWSa5ALJrQC3687AvFM+wWtUh6dHdul/ZihSo6cS7v3HHdfyRV/Vg69USRGriARnqfMzA9at4zTXWRtDoeYUaig+tOTArSpsE2A9aNhqoHmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P2Z8KIQ9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10422C4CEF8;
	Sat, 24 May 2025 09:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748078083;
	bh=zjBvC5CJ3JyRl8kS1POe18jEYgJfRwvLs62DrdIw4XE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=P2Z8KIQ9KDmZXURWKKZCk0+UXkopEJmlqto7szTYGQWrOEEXXyGHVR6w8QRV6LtxB
	 HK1XEAQxKpOHJDjz7GAljooKEhrge2p0GAf6qQr3K5pZbmBwjaT02PWM/x01VIquS0
	 r/6SGBEyYi//jwAcXTJ3XRKzn4VB1xXOIANt85IF8QjuoRypQ4qEMxNsB60ECw5Xam
	 GdulpMUOTFPmm6eX/geKq+viWjVIFUOkkrivXDcJuSjfHl790YtQXAaWQlh7z67/K+
	 DzR834Ra8JWAlx0dUUNTF8tUuzJgBwdA/a1wcHdRNYc3AfaDK/kb8QzNTNi7P1UT7H
	 pudCnyySsoxjg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B23C54E71;
	Sat, 24 May 2025 09:14:43 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sat, 24 May 2025 11:14:39 +0200
Subject: [PATCH v4 4/5] media: dt-bindings: sony,imx214: Deprecate property
 clock-frequency
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250524-imx214_ccs_pll-v4-4-f7dc22e5255b@apitzsch.eu>
References: <20250524-imx214_ccs_pll-v4-0-f7dc22e5255b@apitzsch.eu>
In-Reply-To: <20250524-imx214_ccs_pll-v4-0-f7dc22e5255b@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748078081; l=2872;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=F6yHkm4LhqrCYdpvUOaQ0i1w2snFtRkG+SUP7b8g7gU=;
 b=HcxRiRRhTnhm1uDcdNQDfHoVvTpOaHPGC4RbVyLUEEh+4L4qwEGPqPVPGRwWUOpVAlcJ4TGTQ
 TDtKEnmaMNXBr3DgzgWb2/S1WHZJYJjCdLmChr/6TOL1xDQ6VppUzth
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Deprecate the clock-frequency property in favor of assigned-clock-rates.

While at it, re-order properties according to coding style and fix the
link-frequency in the example.  See commit acc294519f17 ("media: i2c:
imx214: Fix link frequency validation").

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 .../devicetree/bindings/media/i2c/sony,imx214.yaml | 29 ++++++++++++----------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
index 0162eec8ca993a7614d29908f89fa9fe6d4b545d..aea99ebf8e9ed15f8066841228d9fdecc822b553 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
@@ -33,20 +33,21 @@ properties:
 
   clock-frequency:
     description: Frequency of the xclk clock in Hz.
+    deprecated: true
 
   enable-gpios:
     description: GPIO descriptor for the enable pin.
     maxItems: 1
 
-  vdddo-supply:
-    description: Chip digital IO regulator (1.8V).
-
   vdda-supply:
     description: Chip analog regulator (2.7V).
 
   vddd-supply:
     description: Chip digital core regulator (1.12V).
 
+  vdddo-supply:
+    description: Chip digital IO regulator (1.8V).
+
   flash-leds: true
   lens-focus: true
 
@@ -84,11 +85,10 @@ required:
   - compatible
   - reg
   - clocks
-  - clock-frequency
   - enable-gpios
-  - vdddo-supply
   - vdda-supply
   - vddd-supply
+  - vdddo-supply
   - port
 
 unevaluatedProperties: false
@@ -104,22 +104,25 @@ examples:
         camera-sensor@1a {
             compatible = "sony,imx214";
             reg = <0x1a>;
-            vdddo-supply = <&pm8994_lvs1>;
-            vddd-supply = <&camera_vddd_1v12>;
+
+            clocks = <&camera_clk>;
+            assigned-clocks = <&camera_clk>;
+            assigned-clock-rates = <24000000>;
+
+            enable-gpios = <&msmgpio 25 GPIO_ACTIVE_HIGH>;
+
             vdda-supply = <&pm8994_l17>;
+            vddd-supply = <&camera_vddd_1v12>;
+            vdddo-supply = <&pm8994_lvs1>;
+
             lens-focus = <&ad5820>;
-            enable-gpios = <&msmgpio 25 GPIO_ACTIVE_HIGH>;
-            clocks = <&camera_clk>;
-            clock-frequency = <24000000>;
 
             port {
                 imx214_ep: endpoint {
                     data-lanes = <1 2 3 4>;
-                    link-frequencies = /bits/ 64 <480000000>;
+                    link-frequencies = /bits/ 64 <600000000>;
                     remote-endpoint = <&csiphy0_ep>;
                 };
             };
         };
     };
-
-...

-- 
2.49.0



