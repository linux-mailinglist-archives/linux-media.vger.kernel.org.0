Return-Path: <linux-media+bounces-17711-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5118896E5E9
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 00:53:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F9E51C21F26
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 22:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE1C01B252D;
	Thu,  5 Sep 2024 22:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QQcI1qIr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02CF1482E9;
	Thu,  5 Sep 2024 22:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725576809; cv=none; b=Uf9KVUmdlnDcEEm25Hvhdl3JsS20+djvByZ0m36DN6UoVnHTqGtXrOe45gPCsJ3y74qLpJQSXMGmkLk1FvmsUL4JHMhG24fprjPVxb0QKLAaW/HVcZYXt+Sh9Ii8l1y+JzpBnybbAdOxOodKVhg+UzJXilxOyk/giWrvbHudFs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725576809; c=relaxed/simple;
	bh=uHE6wk+VfJ2HylWD36/7bT3qyYq8QnInc44rK8lUwcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aGshzlmsYA2gqnkUxGimqgN9X5CmLbKN9TqlAn9tNF7HXa2A+KZfz4cRpaXcD4EC9s4GXw3DqolNgecSWJOOFlkrvsKGGegSNg43JAquqK3LliMLVb6gafwE4wHySEHHqhwVHlKo7ulSY1Jn6wf/uTBxdsVD60jPX+TGLLTFmbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QQcI1qIr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5DF628BF;
	Fri,  6 Sep 2024 00:52:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725576722;
	bh=uHE6wk+VfJ2HylWD36/7bT3qyYq8QnInc44rK8lUwcM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QQcI1qIr1oUN+oZVF/gcBaSTQufLZzwr+oKY8iZ+JOCsiL5CW+KSBZPuXLgaJMOxJ
	 xqAJcKIWEn7Q0/abRRFZMp9keTTbCv2PHS4jV9naTwtyOnxIPqGurDQm9NFJDTi//t
	 XYUrirtO5/SNf97VaF2ERwIhT1Vl4ZCeQEkZugFU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH/RFC v2 1/9] media: dt-bindings: media: i2c: Add AR0144 camera sensor
Date: Fri,  6 Sep 2024 01:52:59 +0300
Message-ID: <20240905225308.11267-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240905225308.11267-1-laurent.pinchart@ideasonboard.com>
References: <20240905225308.11267-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add device tree binding for the onsemi AR0144 CMOS camera sensor. The
binding supports both the monochrome and color sensor versions.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Drop clock-names
- Rename vdd_io-supply to vddio supply
- Drop unnecessary |
---
 .../bindings/media/i2c/onnn,ar0144.yaml       | 162 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 168 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,ar0144.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ar0144.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ar0144.yaml
new file mode 100644
index 000000000000..50e0908b6473
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,ar0144.yaml
@@ -0,0 +1,162 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/onnn,ar0144.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ON Semiconductor AR0144 MIPI CSI-2 sensor
+
+maintainers:
+  - Krzysztof Hałasa <khalasa@piap.pl>
+
+description: |
+  The AR0144 is a 1/4" 1MP raw CMOS image sensor with MIPI CSI-2 and parallel
+  outputs, and an I2C-compatible control interface.
+
+  The sensor comes in a regular CMOS version (AR0144CS) and an automotive
+  version (AR0144AT). The former is further declined in a colour version
+  (AR0144CSSC) and a monochrome version (AR0144CSSM), while the later exists
+  only in monochrome (AR0144ATSM)
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    enum:
+      - onnn,ar0144c  # Color version
+      - onnn,ar0144m  # Monochrome version
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  vaa-supply:
+    description:
+      Supply for the VAA and VAA_PIX analog power rails (2.8V).
+
+  vdd-supply:
+    description:
+      Supply for the VDD and VDD_PHY digital power rails (1.2V).
+
+  vddio-supply:
+    description:
+      Supply for the VDD_IO digital I/O power rail (1.8V or 2.8V).
+
+  reset-gpios:
+    description: Reset GPIO, active low.
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description:
+      Video output port.
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          bus-type:
+            enum:
+              - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+              - 5 # MEDIA_BUS_TYPE_PARALLEL
+
+          data-lanes:
+            items:
+              - const: 1
+              - const: 2
+
+          bus-width:
+            enum: [8, 10, 12]
+            default: 12
+
+          data-shift:
+            enum: [0, 2, 4]
+            default: 0
+
+          pclk-sample:
+            enum: [0, 1]
+            default: 0
+
+        allOf:
+          - if:
+              properties:
+                bus-type:
+                  const: 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+            then:
+              properties:
+                bus-width: false
+                data-shift: false
+                pclk-sample: false
+              required:
+                - data-lanes
+            else:
+              properties:
+                data-lanes: false
+          - if:
+              properties:
+                bus-width:
+                  const: 10
+            then:
+              properties:
+                data-shift:
+                  enum: [0, 2]
+          - if:
+              properties:
+                bus-width:
+                  const: 12
+            then:
+              properties:
+                data-shift:
+                  const: 0
+
+        required:
+          - bus-type
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - vaa-supply
+  - vdd-supply
+  - vddio-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/media/video-interfaces.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@10 {
+            compatible = "onnn,ar0144c";
+            reg = <0x10>;
+
+            clocks = <&cam_clk>;
+
+            reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
+
+            vaa-supply = <&reg_2v8>;
+            vdd-supply = <&reg_1v2>;
+            vddio-supply = <&reg_1v8>;
+
+            port {
+                ar0144_out: endpoint {
+                    remote-endpoint = <&mipi_csi2_in>;
+                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+                    data-lanes = <1 2>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index d7c9fced9db1..93f758624830 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1650,6 +1650,12 @@ S:	Supported
 W:	http://www.aquantia.com
 F:	drivers/net/ethernet/aquantia/atlantic/aq_ptp*
 
+AR0144 ONSEMI CAMERA SENSOR DRIVER
+M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/onnn,ar0144.yaml
+
 AR0521 ON SEMICONDUCTOR CAMERA SENSOR DRIVER
 M:	Krzysztof Hałasa <khalasa@piap.pl>
 L:	linux-media@vger.kernel.org
-- 
Regards,

Laurent Pinchart


