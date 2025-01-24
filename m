Return-Path: <linux-media+bounces-25286-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3230CA1B903
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 16:25:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B3AC188DC2E
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 15:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B33F022488F;
	Fri, 24 Jan 2025 15:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sLqclaMc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E0E2236F0;
	Fri, 24 Jan 2025 15:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737731928; cv=none; b=QA4kleydnhQ2dYHBuJfgQTcU+vIMcl95iY7dA/Mb14x6xl+H+UxL6yoPNJMOiDqXBtY6wl2NUTi6EB+sj6K2a4mzj3bOvAzC30eng3MP3XqSijEBLEHohlTyni9QPT4sdYn/vf8TKWy573ev40h3GjvkaQwAVHfpCP0UkTwYvhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737731928; c=relaxed/simple;
	bh=Z4zQYuoPjQBFh5x4zmq7qWb7wfLWyfEYAIT2NKbVRKY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QWNAkmpxxFi+m78UCxlxhwp1ta56ruCSWQDBGG3upQtqbyT5LthIvZ0zrwua6tP0lEpwgiVOWqUvdVvY3CfjylTDEVF43lrSwOUN7KMNzfJ5D4opbod174RlVhaEhX3XiDtukkifY99OOhZsQ0CR2mUoxkNgEmCoMtS3pvCANlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sLqclaMc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 60F541BA0;
	Fri, 24 Jan 2025 16:17:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737731838;
	bh=Z4zQYuoPjQBFh5x4zmq7qWb7wfLWyfEYAIT2NKbVRKY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sLqclaMc1N1oxWDLSBvWeF6lszLsArVuT4bh8zP2hpH2Pqkd5ZXczUwleaLzvrBqf
	 BFXtHZ8XCdBP6vXtEfPTEdCyTp9O8NYe8RCsKHy0hrIhqZTfZCD9t9TjAs3bZY33fm
	 zr/OyiSl0fUKKrZGTJBLKM7CO1jX3akLUtObVZn0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 24 Jan 2025 17:17:55 +0200
Subject: [PATCH v2 18/22] media: dt-bindings: ti,ds90ub960: Allow setting
 serializer address
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-ub9xx-improvements-v2-18-f7075c99ea20@ideasonboard.com>
References: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
In-Reply-To: <20250124-ub9xx-improvements-v2-0-f7075c99ea20@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5748;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=di3ttQToKeEJeSH98veeT6MaJOloERz3x07GWTMirp4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnk68yP0MOmiJOw+nx92GgFEoikfZuhPCiJ4hbb
 4xarAc/i7iJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ5OvMgAKCRD6PaqMvJYe
 9TvqD/sFcvqxvcUfne2mUIDI+2iTYfVRmH6IRBNL3B2X2Vq+bg3VNCIKp78WETWZgU0CLpe2FI3
 SwBoY5tXv0IPbTwumBaSZO2+gmRF9jAoHCtGJPtz6GE+pKqedOKweBOXBJ2Rf401pre5StpCeY1
 dqc/gSsTSDfPgGNywTHx0G+HOmCrZMLGk/UyQugfTtEpHYIg44j8vEt8FbhdqLPQkwW5oxlrqoh
 p3MqYsQaN/mAfDDbeXG1nallfQ4Z7JgmO/YMaPmX2MPww1f9YTor3ewhmptqMjJzsOHTH4PUo2x
 EYhCD2sV1dtZOn6k5yuFXJyyulMXvQMW89bxxMxvoXTDQJCCbcjiSs5Mt0U6E1xm+c0OLzjWX8S
 LHNb0XfPW2Bdo7cViVsKiiqX/HniSsLRsYSPrqUsjqz/ehfYgdyp3DLLQ0k5eMb3gmoHy7TEDbP
 6QpSGDTpqVq47BSHRzM5JQ8ZC8ymxQIIhzEoAmGYotLh5DR3d7/lMO4cUk1fnLJWzxFpYC2Vg3t
 Fa6AJj0GBllmiWYU9bmC/g3vUBchx7xsVOmUQkN0UCBWwhDYvab2/oc7rnpwhUNb4kH5i4aoant
 1X9HGCY7yyPdxpnJSGg1e1GC6WzPRJKN5krYkB/Hx3vn8sx043880FGfR11slYcQTOtQub1cDGR
 5BJ7/XCt9r7MWQw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Jai Luthra <jai.luthra@ideasonboard.com>

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

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
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
index 2030366994d1..2e129bf573b7 100644
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
index 970f0f36449a..d9ffa369a13d 100644
--- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
@@ -73,6 +73,12 @@ properties:
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
@@ -112,7 +118,8 @@ properties:
             maximum: 14
             description: Manual EQ level
 
-          serializer:
+        patternProperties:
+          '^serializer(@[0-9a-f]+)*$':
             type: object
             description: FPD-Link Serializer node
 
@@ -120,7 +127,6 @@ properties:
           - reg
           - i2c-alias
           - ti,rx-mode
-          - serializer
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -314,13 +320,17 @@ examples:
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
2.43.0


