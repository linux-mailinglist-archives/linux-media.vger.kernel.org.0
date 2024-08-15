Return-Path: <linux-media+bounces-16333-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8C39529EC
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 09:30:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98C0B1F22AA5
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 07:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677BE19CD1D;
	Thu, 15 Aug 2024 07:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Enam7f6o"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D8618005B;
	Thu, 15 Aug 2024 07:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723707005; cv=none; b=roN6zL2BJCfKggzeY5UOIb0lrsDUqY89tNGpK/7Rr6J77J1ul4i6jzryXN09zalkbfcOKzp/OR35ekpIzS2Vhgigw+VXINGRLTzK/u1SQoOruPsADSwSL7LKVf3PnBRumS0GLMWLH9hSuHjhEmoxJMFBlEtXnDqc3Ct6q+fpYuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723707005; c=relaxed/simple;
	bh=LTGYVECr/4UG+67KVgOfDzOZKmU4a+lQj00GmjRaLUg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R86jdHLaMDrW6nxo0Mq4X8cUXuVq6RaKxpTcUF75vIlu1M6lnqvEduAOMNVoKR3TlLv/bwjsEdFGMG7L+njhmpxQATl7k/o+F/EmvTbN+7uliKp5KoGpI6PCktjeQ6vFqcLow0oGc1hW28JaPWKeWDZR5QcH7iwyRYvlR1eQlns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Enam7f6o; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 284B7AD8;
	Thu, 15 Aug 2024 09:28:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723706936;
	bh=LTGYVECr/4UG+67KVgOfDzOZKmU4a+lQj00GmjRaLUg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Enam7f6oIwdFk1h4MKj0Rhb7E84saYESf+MqD30LGv4BwNDHd309MM7gBTDlrbI+u
	 5V0uwfO9D4DRq7kF75pAg5faDfVUQmKR9oSCE2bzWuZVn3LW9QLNKasrFO1pMuHWgn
	 dnBCoE9kywhhBbagrRz//+IFJqx4rpFhVF1NISWA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 15 Aug 2024 10:28:53 +0300
Subject: [PATCH v3 2/4] dt-bindings: media: Add bindings for
 raspberrypi,rp1-cfe
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240815-rp1-cfe-v3-2-e15a979db327@ideasonboard.com>
References: <20240815-rp1-cfe-v3-0-e15a979db327@ideasonboard.com>
In-Reply-To: <20240815-rp1-cfe-v3-0-e15a979db327@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Naushir Patuck <naush@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3029;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=LTGYVECr/4UG+67KVgOfDzOZKmU4a+lQj00GmjRaLUg=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBmva5tAVP/qCN0SxDccOoK06h4qGO2CpUFt0K0c
 3kH9Qye7HKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZr2ubQAKCRD6PaqMvJYe
 9bmfD/wKVjZDLlHDVDAU1nOYgm0UaFC7Myhq5CvCtW701wFfmCmYVSjHYfDsbICobgT4u6NwFKV
 1g3HntQVgb58OD7CtjkAl9lQBu8jXIh/uGxU/dzZ/WJQvUUP+WTgLJEKxbdqzgpgCEnmzcZ7YR+
 lXr1n/YxWN1o+DUj5QQHqIzwbBd7u+OV6sp9xrVFH0rMB97lEGQWhosUDSXLZFbu97a9bem3sCY
 AaZMY5hO82V3VvSXWmI4PAW/uF5QhChKRvSvmDq7q8JSKZsLT4zRTyJHdytk7q2WTAdnsMZQGZe
 K21Yf6oaYreWMfjiwX0h4WKQSnU01cyJkzuEJHbS9oCml4HkgZVC8srXnIIGg3HFx1uLM1NUxH/
 GF+7c9fNkhB29/G+5L/h1ZGCsJ8tTa5gRUhCU4TWXtwBcd1wXGPOYqUgw+R7Mt+kIpXr2E9tv7g
 UTQ7kS60TUOgYjbaw8H+aEC01yfQvTnE1mCa+5NnJgRyz+kq9P7K/HpuEsUl/pBKo8mfHySWN54
 ZFhE8H7Mt0EFH0tC09Ed6tj9sCTocmXsUbg6u84l2b/JiLyJfi4RUH2o70yWfu8CwVUua96NFZb
 OgmDj33Xy3EOm6SV7OcBL6j3pNDuyqn+Rh/TD3gk4nwhP4hZYRLhlEWbwrHAyWj9TDEpSyofEYc
 nLxTPR70zcThaUA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add DT bindings for raspberrypi,rp1-cfe.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../bindings/media/raspberrypi,rp1-cfe.yaml        | 98 ++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml b/Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml
new file mode 100644
index 000000000000..851533de2305
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/raspberrypi,rp1-cfe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi PiSP Camera Front End
+
+maintainers:
+  - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
+  - Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
+
+description: |
+  The Raspberry Pi PiSP Camera Front End is a module in Raspberrypi 5's RP1 I/O
+  controller, that contains:
+  - MIPI D-PHY
+  - MIPI CSI-2 receiver
+  - Simple image processor (called PiSP Front End, or FE)
+
+  The FE documentation is available at:
+  https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf
+
+  The PHY and CSI-2 receiver part have no public documentation.
+
+properties:
+  compatible:
+    items:
+      - const: raspberrypi,rp1-cfe
+
+  reg:
+    items:
+      - description: CSI-2 registers
+      - description: D-PHY registers
+      - description: MIPI CFG (a simple top-level mux) registers
+      - description: FE registers
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+    description: CSI-2 RX Port
+
+    properties:
+      endpoint:
+        $ref: video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            minItems: 1
+            maxItems: 4
+
+          clock-lanes:
+            maxItems: 1
+
+        required:
+          - clock-lanes
+          - data-lanes
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    rp1 {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      csi@110000 {
+        compatible = "raspberrypi,rp1-cfe";
+        reg = <0xc0 0x40110000 0x0 0x100>,
+              <0xc0 0x40114000 0x0 0x100>,
+              <0xc0 0x40120000 0x0 0x100>,
+              <0xc0 0x40124000 0x0 0x1000>;
+
+        interrupts = <42>;
+
+        clocks = <&rp1_clocks>;
+
+        port {
+          csi_ep: endpoint {
+            remote-endpoint = <&cam_endpoint>;
+            clock-lanes = <0>;
+            data-lanes = <1 2>;
+          };
+        };
+      };
+    };

-- 
2.43.0


