Return-Path: <linux-media+bounces-10050-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B44CE8B0EA4
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 17:38:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F05DB28721
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 15:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 891BB161B43;
	Wed, 24 Apr 2024 15:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ejXonQAK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4637515EFDB;
	Wed, 24 Apr 2024 15:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713972957; cv=none; b=PVAbt9+NYK87vy/vA2Vf6S1mOXYoPLoC1DbQmbmp3+rhwpyS/mqmfbEjAfpH+4+Kjh97pYtyNgRC0OYHoVwVo+z9vj9hbD9moCBLfQGgPBtEHGFo7i1KvqRbE4i8v/2K7tVkfPeu12cTHEuFwRpy4yxmdDtIUh78FkZn8Ein7m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713972957; c=relaxed/simple;
	bh=+F2nEVe+L21L4TExpThK5RdU79sa68HcoJ3nXSjYZo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R/x08isw1e3Xiuj2+PjiT68Qj0zT4CJQ3TVNSzsABUC5HiLq/ZOhC44nJVljMBw7hJ8c5wI22shk9SoNLDZI7+shSqVbq+OX1LrClR9csbnVcwSwIA5n622o2lWeGLbS8LWaxtRxTCaNztA4plfNSNMKR6Pf/57j3wLQ1fGUk9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ejXonQAK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E4C0EBB;
	Wed, 24 Apr 2024 17:34:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713972899;
	bh=+F2nEVe+L21L4TExpThK5RdU79sa68HcoJ3nXSjYZo4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ejXonQAKp4hnsmS00ZnhwGXqlAvW8aLlGLQdAt60lpa7Hsii9ISMKukfp41v+xXSP
	 3vf69l736x9rjmgh6izuenxdpAG9JBaGLdiXF9IgPgLhjGtgHiAChSkCS5or7f1Ij6
	 mTLEdbbUcLOHeaE46tgbWoO7t158PsnVeAaXPzY4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	kernel-list@raspberrypi.com,
	linux-rpi-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v11 3/5] dt-bindings: media: Add bindings for bcm2835-unicam
Date: Wed, 24 Apr 2024 18:35:39 +0300
Message-ID: <20240424153542.32503-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240424153542.32503-1-laurent.pinchart@ideasonboard.com>
References: <20240424153542.32503-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Introduce the dt-bindings documentation for bcm2835 CCP2/CSI2 Unicam
camera interface.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Co-developed-by: Naushir Patuck <naush@raspberrypi.com>
Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Co-developed-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v7:

- Make bus-type mandatory
- Refuse additional properties for endpoint

Changes since v5:

- Squash MAINTAINERS changes in

Changes since v3:

- Make MAINTAINERS its own patch
- Describe the reg and clocks correctly
- Use a vendor entry for the number of data lanes
---
 .../bindings/media/brcm,bcm2835-unicam.yaml   | 127 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 133 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml

diff --git a/Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml b/Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
new file mode 100644
index 000000000000..5fb5d60f069a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
@@ -0,0 +1,127 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/brcm,bcm2835-unicam.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM283x Camera Interface (Unicam)
+
+maintainers:
+  - Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
+
+description: |-
+  The Unicam block on BCM283x SoCs is the receiver for either
+  CSI-2 or CCP2 data from image sensors or similar devices.
+
+  The main platform using this SoC is the Raspberry Pi family of boards.  On
+  the Pi the VideoCore firmware can also control this hardware block, and
+  driving it from two different processors will cause issues.  To avoid this,
+  the firmware checks the device tree configuration during boot. If it finds
+  device tree nodes whose name starts with 'csi' then it will stop the firmware
+  accessing the block, and it can then safely be used via the device tree
+  binding.
+
+properties:
+  compatible:
+    const: brcm,bcm2835-unicam
+
+  reg:
+    items:
+      - description: Unicam block.
+      - description: Clock Manager Image (CMI) block.
+
+  reg-names:
+    items:
+      - const: unicam
+      - const: cmi
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Clock to drive the LP state machine of Unicam.
+      - description: Clock for the VPU (core clock).
+
+  clock-names:
+    items:
+      - const: lp
+      - const: vpu
+
+  power-domains:
+    items:
+      - description: Unicam power domain
+
+  brcm,num-data-lanes:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 2, 4 ]
+    description: |
+      Number of CSI-2 data lanes supported by this Unicam instance. The number
+      of data lanes actively used is specified with the data-lanes endpoint
+      property.
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        additionalProperties: false
+
+        properties:
+          bus-type:
+            enum: [ 3, 4 ]
+
+          clock-noncontinuous: true
+          data-lanes: true
+          remote-endpoint: true
+
+        required:
+          - bus-type
+          - data-lanes
+          - remote-endpoint
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - brcm,num-data-lanes
+  - port
+
+additionalProperties: False
+
+examples:
+  - |
+    #include <dt-bindings/clock/bcm2835.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/media/video-interfaces.h>
+    #include <dt-bindings/power/raspberrypi-power.h>
+
+    csi1: csi@7e801000 {
+        compatible = "brcm,bcm2835-unicam";
+        reg = <0x7e801000 0x800>,
+              <0x7e802004 0x4>;
+        reg-names = "unicam", "cmi";
+        interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clocks BCM2835_CLOCK_CAM1>,
+                 <&firmware_clocks 4>;
+        clock-names = "lp", "vpu";
+        power-domains = <&power RPI_POWER_DOMAIN_UNICAM1>;
+        brcm,num-data-lanes = <2>;
+        port {
+                csi1_ep: endpoint {
+                        remote-endpoint = <&imx219_0>;
+                        bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+                        data-lanes = <1 2>;
+                };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 7c121493f43d..91420f602eb9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4034,6 +4034,12 @@ N:	bcm113*
 N:	bcm216*
 N:	kona
 
+BROADCOM BCM2835 CAMERA DRIVERS
+M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
+
 BROADCOM BCM47XX MIPS ARCHITECTURE
 M:	Hauke Mehrtens <hauke@hauke-m.de>
 M:	Rafał Miłecki <zajec5@gmail.com>
-- 
Regards,

Laurent Pinchart


