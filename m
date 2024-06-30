Return-Path: <linux-media+bounces-14416-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7955991D206
	for <lists+linux-media@lfdr.de>; Sun, 30 Jun 2024 16:18:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 328D92813BA
	for <lists+linux-media@lfdr.de>; Sun, 30 Jun 2024 14:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A88B1527A5;
	Sun, 30 Jun 2024 14:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="saaqOlII"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA68512D1E0;
	Sun, 30 Jun 2024 14:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719757116; cv=none; b=UixEf2vZboQYAWXsGy/BtOKmz4BOipgEKlGxahFJVni7mZaKDDnktnrnMFSa6W8WoZmnTVlatZXNbgyigjA5cpkSdYdRFMdPCTrmT6j5RE61c6jp7ZaBoaNNBhnyxf2Pixt/bD1KsPg6xvKtIClgfIT5+03xU52Ffb2N8hN70O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719757116; c=relaxed/simple;
	bh=NAoPLXhf+1S23FwRoRgtZGHyNKRb1J5+vr8TaGFXZGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D3z5E1y0/RrvTmlmgNiU6EQstZP0407dpdBNYYx5pheSZ0y29n65uQhADR8QcMdtALNWlg3oTshGms7uA4xvoZDWfc4QkR2O7ikO+RUKDbkpTFEGiKj/HpxyPIgoBxqjBHhlrtSTfcvBsackORPvrILtORYXZdKuwoH7sFuFl6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=saaqOlII; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-36-175-nat.elisa-mobile.fi [85.76.36.175])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30F4266D;
	Sun, 30 Jun 2024 16:18:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719757081;
	bh=NAoPLXhf+1S23FwRoRgtZGHyNKRb1J5+vr8TaGFXZGA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=saaqOlIIN02PMHP8YsS/oXl7fNNavZNiMJqXbirmEfHEi6FMFQUz/pE2JEYivs92W
	 6yviKuHuXLTpnOqKuCXiJDxK+C0Rfl/UzcuHdwW2c43vJ4xqagfuU12/F+X8hvz2P3
	 3EIevPxDu7cNMMgxVpme5k3GUyHuPuR3w1ieASnc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH/RFC v1 1/9] media: dt-bindings: media: i2c: Add AR0144 camera sensor
Date: Sun, 30 Jun 2024 17:17:51 +0300
Message-ID: <20240630141802.15830-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240630141802.15830-1-laurent.pinchart@ideasonboard.com>
References: <20240630141802.15830-1-laurent.pinchart@ideasonboard.com>
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
 .../bindings/media/i2c/onnn,ar0144.yaml       | 166 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 172 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,ar0144.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ar0144.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ar0144.yaml
new file mode 100644
index 000000000000..3de0c46c3518
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,ar0144.yaml
@@ -0,0 +1,166 @@
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
+  clock-names:
+    const: extclk
+
+  vaa-supply:
+    description:
+      Supply for the VAA and VAA_PIX analog power rails (2.8V).
+
+  vdd-supply:
+    description:
+      Supply for the VDD and VDD_PHY digital power rails (1.2V).
+
+  vdd_io-supply:
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
+    description: |
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
+  - vdd_io-supply
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
+            clock-names = "extclk";
+
+            reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
+
+            vaa-supply = <&reg_2v8>;
+            vdd-supply = <&reg_1v2>;
+            vdd_io-supply = <&reg_1v8>;
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
index 90b3a875cbf4..8e591445bec4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1637,6 +1637,12 @@ S:	Supported
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


