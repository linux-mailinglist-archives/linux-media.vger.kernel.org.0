Return-Path: <linux-media+bounces-35520-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF686AE2852
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 11:38:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5614A189F3E2
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 09:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E69D7206F2A;
	Sat, 21 Jun 2025 09:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MpwQXp+2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D35518C011;
	Sat, 21 Jun 2025 09:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750498691; cv=none; b=Q9RxkzzqtN/XAEI/yY38G3uqNKV3013THYKUK7wa7n7aI61Toxl+CHxKKRsgy0OtRc6Kx33YTBaQmFLrd45pSbvoJGu6NoahGQSOCYMDHbfOC6OOMD9ehLtZHj1UuRJb7VqDIl8wvkWfatyDeeUGKUFZuhaktjhBMnzp/1Z8sN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750498691; c=relaxed/simple;
	bh=KB4LuF0toI0neAdNh4EV8pcyXYzpvMqRrmP459bqGxs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sAf1ghABEswnGsDnbN4AxuuB9Y7AxQD5VMV21qS/dQ5emLmnIr2TooxxwTk45Edq+XovY0khiBEiICu7p0ORm/4isWt/kBCeypeHGI94UMnVGHWT2avVHOt/cvxfSbitk8wiVovzmreHh6qL167jypoCt7gwn66A/3/iZAmvyyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MpwQXp+2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DDB39C4AF10;
	Sat, 21 Jun 2025 09:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750498690;
	bh=KB4LuF0toI0neAdNh4EV8pcyXYzpvMqRrmP459bqGxs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MpwQXp+223uVnK4MgKIngLW6p26Bc9PUNHo6rrjt2ekTvyvy/1UcaKUBlRwNYTrKX
	 9UxQ/W2InFVej3doKAmo/VZrRbkgYRsDYTRU/CwuwP6Xc5phUkBHmBftF9kQaZZOVf
	 mlBo3XemROaNplsE7cJyEthdXMN3EN7DPCaSl1CBFptRMo/Of0ZCUKLSffX1Gu+qpa
	 2hZ7K/5piBjGMIO2V1N/WOVGi+A+Q0TTN08JFqNf+59AJ2eQgUGlqdK7oGvvj+97cA
	 VIAP+x51vKgZIMP5vL1vOwM0Oe85unCkhH/Sn4/E5WqBHS1STKVLeiLJpJhdfN+OnX
	 i5cpwmtFWZkoA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE3B7C7EE2A;
	Sat, 21 Jun 2025 09:38:10 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sat, 21 Jun 2025 11:37:28 +0200
Subject: [PATCH RESEND v4 4/5] media: dt-bindings: sony,imx214: Deprecate
 property clock-frequency
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250621-imx214_ccs_pll-v4-4-12178e5eb989@apitzsch.eu>
References: <20250621-imx214_ccs_pll-v4-0-12178e5eb989@apitzsch.eu>
In-Reply-To: <20250621-imx214_ccs_pll-v4-0-12178e5eb989@apitzsch.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750498689; l=2872;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=HJC1tGsh7JZtHUNjSz48zBwAelpJhWLL5Nb7XTVVqiA=;
 b=J8EU4IdcAG4onT31yDSEoiIXjkPqA/PycZhIzygaVz8zBToAOpEObbBtR55aLJsCDiWBTo3Ya
 gXxa0ZtqaxqBDHhQJLYbBiOeXEEKh/8oaC5GectTIJXM9uCDnhMAEuX
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
2.50.0



