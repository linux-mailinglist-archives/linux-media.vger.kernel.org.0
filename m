Return-Path: <linux-media+bounces-27375-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B6BA4C638
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:08:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E55AF17417F
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB0821ADAB;
	Mon,  3 Mar 2025 16:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EUqe7+di"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5E4230D11;
	Mon,  3 Mar 2025 16:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741017825; cv=none; b=r92F8z0FFsUUBkj6hM0RRnbgF/Tid6cSSpkUiV9gsYvNgNpbLxtU4IsU4vQLTXBgLlNA2nvzk6e5ggffo0uWn3aJSyj4hTSbUdyGc6KiivxPsErVSkKTbQQ4oABCnN5tlhw+8o69kcarM74JBWONjWz6AXc6wJRv1H3K59/stEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741017825; c=relaxed/simple;
	bh=/QCeybUnJLTqM1Grb60cqE75saDatnWd3hl5o+zYPRs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Se9o4xTBCZe9106qjwj4ANNx4tG+O/XMxq6/t7jyoZ15kxkg2EPqZN9COb+UV7zf9pQW9h57LCCoLqQX6o2DfPJQC4PDcz6hkCfJ4BVYUfDskViWBYCOmNzuimEE+yKYAy+RKeGyYDO89EcT4NkakSgIrPuMfFO+jDlTSFx2BXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EUqe7+di; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:8872:6fe4:6987:313:70cc])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E20F22A;
	Mon,  3 Mar 2025 17:02:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1741017730;
	bh=/QCeybUnJLTqM1Grb60cqE75saDatnWd3hl5o+zYPRs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EUqe7+di/HCJxtuxUFokhfV4FgbIcrrRBqHi9GrT9t84A2rKDgqM2g0HnW+UoR4W5
	 U4ZhLACnLm2bktNEerYuPqIKI6lzF0sLgEKzY20UtAKNPbs9Cx88oAdBg26yQg+CqF
	 cX/Yx3blEowJW2+w2JDYqKp5IBb14FcCvu07KJ9Q=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 03 Mar 2025 21:32:19 +0530
Subject: [PATCH v3 16/19] media: dt-bindings: ti,ds90ub960: Allow setting
 serializer address
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-b4-ub9xx-err-handling-v3-16-7d178796a2b9@ideasonboard.com>
References: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
In-Reply-To: <20250303-b4-ub9xx-err-handling-v3-0-7d178796a2b9@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Devarsh Thakkar <devarsht@ti.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5862;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=/QCeybUnJLTqM1Grb60cqE75saDatnWd3hl5o+zYPRs=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnxdKA5vja19IXFXCieRE42kf/KiFp5uSq1DsxN
 VxDQECPA4+JAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ8XSgAAKCRBD3pH5JJpx
 RfxeD/0dOyyeiguoyDWeMZ4T9GnN51ulKbAeXRAsfyVuTqKEXplCKn9GcTfssHfL6CJloD2Hemv
 8vv1LFLNGspxszZbt9US+FYuHjC6iOQz/UhIEOulG6cdLOtXGU02+a7wb3xrd9ttB/Tnazcf5Kn
 zJS2/8L+XSb7cr00w/v0Fmlpag68V7CdaG+lcn3ejZzQlsEm0NcvuqeGxyohrnIWPHI1osO/GNq
 HMrAJYcJ4i5V6dduLTE0CSJsgrWEJ47BvY0ZBXEwx4jBX3OPAdBrOAHnThhxyd5Pw8tDzNEz9IJ
 HO+UGMjBwGJhml1GrKbKuugdMxpDX+drea4j31rbci+Sj22GKN3PBXWtfa4WATPYKwL6tn8Ya/m
 bWlyq2WNY0kqkBJzKOBaG7iwJBBQaUS34IB6zAusql8pLzSIB/nAHqZu2hw1kjxCwihGFOmfQkz
 JVlZBEICpvb65ASuExee5ts99Nk7r/4Kw3sElWpFdiflQjYhveqvHDLmN05APvOAuDaNplgvjl+
 qZmoox9zSHsVFLbN0G0PU9OAP2NgxFmcq2p5BuXFKHry1uzyoyhaF4nDcLM3eay2yZEczCl9Pay
 KlK+MOb1PQdTNCAlWpURCuIe10XHgswOX8HPlxyUEXQrnN8xyo6D+nnqxmzYMQdBzscvVm5bRU9
 i1I5n3zZ+7sArtw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The serializer's I2C address on the FPD-Link bus is usually communicated
to the deserializer once the forward-channel is established. But in some
cases it might be necessary to program the serializer (over the
back-channel) before the forward-channel is established.

This can be used e.g. to correct serializer configuration which
otherwise would prevent the FC to be enabled. To be able to communicate
to the serializer before the forward-channel is up, the deserializer
driver neds to know the default i2c address of the serializer.

Allow setting the serializer i2c address using the 'reg' property. This
is optional, and usually not needed.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Cc: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
---
 .../bindings/media/i2c/ti,ds90ub953.yaml           | 77 +++++++++++++---------
 .../bindings/media/i2c/ti,ds90ub960.yaml           | 16 ++++-
 2 files changed, 58 insertions(+), 35 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
index 2030366994d18b695328194da1a7d95607de4371..2e129bf573b79e0ca8f25b4ec5fc6ea76c50abd7 100644
--- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
@@ -38,6 +38,13 @@ properties:
   '#clock-cells':
     const: 0
 
+  reg:
+    maxItems: 1
+    description:
+      The strap I2C address of the serializer. Can be used by the deserializer
+      to communicate over back-channel when the forward-channel is not yet
+      active.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -81,51 +88,57 @@ examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
 
-    serializer {
-      compatible = "ti,ds90ub953-q1";
+    link {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      serializer@18 {
+        compatible = "ti,ds90ub953-q1";
+        reg = <0x18>;
 
-      gpio-controller;
-      #gpio-cells = <2>;
+        gpio-controller;
+        #gpio-cells = <2>;
 
-      #clock-cells = <0>;
+        #clock-cells = <0>;
 
-      ports {
-        #address-cells = <1>;
-        #size-cells = <0>;
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
 
-        port@0 {
-          reg = <0>;
-          ub953_in: endpoint {
-            clock-lanes = <0>;
-            data-lanes = <1 2 3 4>;
-            remote-endpoint = <&sensor_out>;
+          port@0 {
+            reg = <0>;
+            ub953_in: endpoint {
+              clock-lanes = <0>;
+              data-lanes = <1 2 3 4>;
+              remote-endpoint = <&sensor_out>;
+            };
           };
-        };
 
-        port@1 {
-          reg = <1>;
-          endpoint {
-            remote-endpoint = <&deser_fpd_in>;
+          port@1 {
+            reg = <1>;
+            endpoint {
+              remote-endpoint = <&deser_fpd_in>;
+            };
           };
         };
-      };
 
-      i2c {
-        #address-cells = <1>;
-        #size-cells = <0>;
+        i2c {
+          #address-cells = <1>;
+          #size-cells = <0>;
 
-        sensor@1a {
-          compatible = "sony,imx274";
-          reg = <0x1a>;
+          sensor@1a {
+            compatible = "sony,imx274";
+            reg = <0x1a>;
 
-          reset-gpios = <&serializer 0 GPIO_ACTIVE_LOW>;
+            reset-gpios = <&serializer 0 GPIO_ACTIVE_LOW>;
 
-          clocks = <&serializer>;
-          clock-names = "inck";
+            clocks = <&serializer>;
+            clock-names = "inck";
 
-          port {
-            sensor_out: endpoint {
-              remote-endpoint = <&ub953_in>;
+            port {
+              sensor_out: endpoint {
+                remote-endpoint = <&ub953_in>;
+              };
             };
           };
         };
diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
index 0b71e6f911a8835eb70ccf832888964288a6cac6..4dcbd2b039a58edfc57c5cc0bedceefdf158bf0c 100644
--- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
@@ -68,6 +68,12 @@ properties:
             description: The link number
             maxItems: 1
 
+          '#address-cells':
+            const: 1
+
+          '#size-cells':
+            const: 0
+
           i2c-alias:
             $ref: /schemas/types.yaml#/definitions/uint32
             description:
@@ -107,7 +113,8 @@ properties:
             maximum: 14
             description: Manual EQ level
 
-          serializer:
+        patternProperties:
+          '^serializer(@[0-9a-f]+)*$':
             type: object
             description: FPD-Link Serializer node
 
@@ -115,7 +122,6 @@ properties:
           - reg
           - i2c-alias
           - ti,rx-mode
-          - serializer
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -309,13 +315,17 @@ examples:
           /* Link 0 has DS90UB953 serializer and IMX274 sensor */
 
           link@0 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
             reg = <0>;
             i2c-alias = <0x44>;
 
             ti,rx-mode = <3>;
 
-            serializer1: serializer {
+            serializer1: serializer@30 {
               compatible = "ti,ds90ub953-q1";
+              reg = <0x30>;
 
               gpio-controller;
               #gpio-cells = <2>;

-- 
2.48.1


