Return-Path: <linux-media+bounces-33056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 33321ABFD6A
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 21:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B03C97B761C
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 19:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C355D28FFDD;
	Wed, 21 May 2025 19:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RBMH2hs9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C88521FF45;
	Wed, 21 May 2025 19:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747856151; cv=none; b=nLRr1LZffiVVXm5rackl+3PfiZ1JzZ8jfjgq72lHpjCc/r5PFAqC10JWBzzDgzPUCAtScb8aHFkwYyU470DyRoor9x3dG2ZPKjbcmeIqaZzYK3kqbeXFhMWXuoqwnp3vByI9OeegPDVTsHZ1GAR8CfhIbbSYww+yayG8xkaYlCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747856151; c=relaxed/simple;
	bh=LzIVfil1DJZQnhJzkjaE6xz4thMq1eqeBEY6tHDNioQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ecdJDcC+B6n0Wu2CgrZ7eBfgFrWGXFtLFzdk0IMHA6gPpGOmcQvMeEeg+XzXsDTHN1XcveDeXkw5zTDc5d6Lrmk2rbhxLvA79MsToqzrKGtxAaPsRkReI1pI2DkEBeYBI5ElZR9Pl1vuCqDcCcR6uPIVnGWitJ6WAUl988qsRo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RBMH2hs9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37404C4CEF9;
	Wed, 21 May 2025 19:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747856151;
	bh=LzIVfil1DJZQnhJzkjaE6xz4thMq1eqeBEY6tHDNioQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RBMH2hs9ZldPQmx1Zw0ayXV5TiQ7GnaK8gxNryAjtbP9LwNMWdel7vG3/R5mb2KAn
	 ZTIH7ESot6eGUM8oZq5wfowNTm66mh0/UYeakj1BDUW/FagjVB99Nb5kNzClpkXmdM
	 fHvfgKGe5/HJb8SRIJJOn5pLRn5zxeup8RX1sXx2HGz4c4YW78+vjkYXrXYS/hIxP0
	 ThUkmWCIirPFwSl97XCoi0oYFUHrhFd1fti9HWj9NOwXBVn5sg5HFjFsUtgOAXeEDt
	 BeLBn6f1BXZ+9vznFT+zw9VyUBOKecAv7L1cCyX69xt7AmTahMbPSYzybbx3XHU9+U
	 6HysDS9j+V47A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 271C9C54E90;
	Wed, 21 May 2025 19:35:51 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Wed, 21 May 2025 21:34:27 +0200
Subject: [PATCH v3 4/5] media: dt-bindings: sony,imx214: Deprecate property
 clock-frequency
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250521-imx214_ccs_pll-v3-4-bfb4a2b53d14@apitzsch.eu>
References: <20250521-imx214_ccs_pll-v3-0-bfb4a2b53d14@apitzsch.eu>
In-Reply-To: <20250521-imx214_ccs_pll-v3-0-bfb4a2b53d14@apitzsch.eu>
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
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747856148; l=2752;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=q248WANyfYXH2di2+yApGW8UAy0ZsHlVSh2lDqEYoFQ=;
 b=fMIHmCJL1v1iZuTSYZ6ENcd5/dOvA5ENzFVPuWEFf9SKGAcd1JBcffZOY/yVDocUHUPdrFgHH
 4AhtZB54XUyCdgODHriX/1pv8cUNJJ68/giLLr2Hq07AQeWNhHYWDNS
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



