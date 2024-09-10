Return-Path: <linux-media+bounces-18048-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EE8972B9D
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 10:10:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 887A41C24CB7
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 08:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E637619148A;
	Tue, 10 Sep 2024 08:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kQIjsuUH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BEE1885BF;
	Tue, 10 Sep 2024 08:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725955658; cv=none; b=kyu6uPrQ6Fzu3a2NTAVs8AvFTAc1aDpU5lbKKQbv6rs9zpQpY5F8BiS7FQISXr1hbVT2VWZ/xDQyeghVlI2BRHEtk11fdgTVUDrQkby9x7l2z2fBLfM/I0MiHWXBHXAoVO3fLsDzNPk/7h234tC+7sAkNqZORv0vA4aXli9YmUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725955658; c=relaxed/simple;
	bh=glmpFc00SsZ+PfwzIlsw73UpQTBgwInpTitkkKEeCPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=keS9mkSVh/pPiMrg5GcLdNxqQuiJ1ppdX0WxzV6JdcKFO1wl5FrKb63L0wtjeyWtIWDADnjf6EuKA9KhD2aRSnBVmFksido2pP4HcrABkpwKgqD6yw587V5nhPFpaX50Zxn/aDhS2E/KDgRLNePO41hjHcNJTtIW1FA/H6nw+Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kQIjsuUH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 51A141920;
	Tue, 10 Sep 2024 10:06:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725955576;
	bh=glmpFc00SsZ+PfwzIlsw73UpQTBgwInpTitkkKEeCPQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kQIjsuUHseW/dvTWKGGKcGZW84VjlMlVVSaZo6cegeX5Png8LNRVVJvvGfy4Bjs9h
	 i1bgUggQJl4CBXyb97cvrbKRvXVMb7GI4s9JQi4WBNKTGq/+5EEI8WpmRqe5DxvFRs
	 5WMkFpbqp3oV5K/fY0tJSgVsJgWctweAafZKztKk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 10 Sep 2024 11:07:07 +0300
Subject: [PATCH v5 2/4] dt-bindings: media: Add bindings for
 raspberrypi,rp1-cfe
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240910-rp1-cfe-v5-2-9ab4c4c8eace@ideasonboard.com>
References: <20240910-rp1-cfe-v5-0-9ab4c4c8eace@ideasonboard.com>
In-Reply-To: <20240910-rp1-cfe-v5-0-9ab4c4c8eace@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2916;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=glmpFc00SsZ+PfwzIlsw73UpQTBgwInpTitkkKEeCPQ=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBm3/5AZD/bnvMVEiJo/Q2UhQHiY6Yhrh+NKwxoA
 2CVJcTONKOJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZt/+QAAKCRD6PaqMvJYe
 9Q08D/9jH2FsfDpjeJN53Woz6dLqaezLtRH8jSkYFb0JFaTcydhOLWSMMPm0K3cmNI30MVOIwzB
 tLwnsVmOs9cQYd3Si63JJhOPvzwZBS4x93UAZ5JfdNGtfBCyZGCkhEKHLC4ggRUGhDgnIrHMfdr
 9IijXeKlzTgIAixn5dcPmRBBLxePuf40zlvWCPQUCPPBbR1W9WvlNZtan/ceKuBhdW3hgp2Ff2R
 nUl0C8VJm3L/O246l2JdqPG//NOU5pmQeMGD72DBTF9buRHnzBJ906OG0YM1bK2IhYrtYEGP8Xk
 lmb/wDlLGd+qz53AbsXGeldMm+oQluB0RsCuHXFT0F1x6uPCx+XgK/fLCIqbhis+jjc6cm852hs
 Lt+PPoNK9kXCH8zHwILP+LRfyArr/mlbaFYvqgVRuhLtdD0NeGd8KtxmB+HKzkotiwqmWRG7z2O
 CXdvwxfCATZd9YOHB0ysRAp1+swOCW2hiNouCtL82/9NWict5VfHxUhU9QxqSRQHvl01pkryQGq
 gSEakN0zpFPwzKtowOCUPP4vfQaI7w9T8ToL2ssOGA782aSVgclCcL8hxaNgna4y8MxagsO7PxO
 /0ugKOp8MZZ8lmgAQhjJeFh4A8EsIuT6r+bk2Latj0KPyzsJrQsQZjX3E+nJLZFxRU6321jcP7R
 ao/u2yavt0YsQAA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add DT bindings for raspberrypi,rp1-cfe.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../bindings/media/raspberrypi,rp1-cfe.yaml        | 93 ++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml b/Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml
new file mode 100644
index 000000000000..eba5394719b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml
@@ -0,0 +1,93 @@
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
+        required:
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
+            data-lanes = <1 2>;
+          };
+        };
+      };
+    };

-- 
2.43.0


