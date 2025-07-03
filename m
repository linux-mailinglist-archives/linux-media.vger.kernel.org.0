Return-Path: <linux-media+bounces-36704-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F46DAF8009
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 20:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AA02583F44
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 18:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D38182F2C78;
	Thu,  3 Jul 2025 18:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FvZ0T79U"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0C527586B;
	Thu,  3 Jul 2025 18:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751567593; cv=none; b=Zfd05t2XbPtqZG737oAZ7qX1bOyNfn7JQVvf2lCqa09ipp6PnZxHzTDL7WtWvf9pqkbaHTLVNgEN5ihUQPxwWy4OsI4TIt9/t7gbrNQbW2fRq9A3RXuuQqK31Fd7aecb1saq0E0v3crarg6eB5+IpVsX5M/gpu/VFDgdqHlVxGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751567593; c=relaxed/simple;
	bh=+RKXSd49QNGxofon9O/ZcqEa2ERFrhs7K98DpEYCjC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=icfa9VX10uXMrlIPA8s1qrAFwrsS1KjZewSKbSEtj6vkuZ0Fs8hZvr6VaEFWpCUjB7N0xdbb92AjWTmiDEUvKR5fMpYEBKLfK5t3wIq/RHzdxlVFbsgsJUYvoRcXCB8yMknSMjnl8BJaxjVbIxy3SFBtAsn7Zwo8DctQ7ycM/dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FvZ0T79U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A17EFC4CEED;
	Thu,  3 Jul 2025 18:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751567592;
	bh=+RKXSd49QNGxofon9O/ZcqEa2ERFrhs7K98DpEYCjC0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FvZ0T79U5BC4bXeJoKKGOoYWP/Jkmx2D+LX++NlPea5UNG092WKAk6ck4szKB5/gn
	 lICR87gKfM2tzA9aAqCQIxd5GRM0onRg6HXafN5ExRpwRruua1BtdeWynLgwQAS8qm
	 1R8sRx7Ivlx39CXkmqCDDn1c0DdN+BRq+j9wUNuO1BmC2mIy1wMi2mqtyHoXolEmYE
	 t35iaG6BxCBaEKMMAMrIGG52roi4JvGnZEMHqfjUhf7Cal1B1bVdym832wEMNVzGro
	 m+MkqM2mR6OJSK3FNLEwHSgWEYNZ5iEWbEASaSWCM/Ew1G+C47/4Bk+xfjhFays8vJ
	 DG31TbkL6fwuA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 912ECC83F03;
	Thu,  3 Jul 2025 18:33:12 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Thu, 03 Jul 2025 14:33:06 -0400
Subject: [PATCH v2 1/4] dt-bindings: media: add i.MX parallel csi support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-imx8qxp_pcam-v2-1-188be85f06f1@nxp.com>
References: <20250703-imx8qxp_pcam-v2-0-188be85f06f1@nxp.com>
In-Reply-To: <20250703-imx8qxp_pcam-v2-0-188be85f06f1@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751567591; l=4271;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=F6iDqFZ8amoJXqI666QahOsEJxKCsFei15ZM+Oj2BqQ=;
 b=7ppXxyhOnTf0rhvMnaPHXuBxIhJFJ6XuY6YkyCBO1UEaSQ0AIcE7qhCD4ApvPzaVhKGn9xJQK
 xYkZ3SuXoc+Ajmw8pv+yKY8oUs119hDRMkjhSlxTDhbOWu8O0pz9FuR
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
Reply-To: Frank.Li@nxp.com

From: Alice Yuan <alice.yuan@nxp.com>

Document the binding for parallel CSI controller found in i.MX8QXP, i.MX93
and i.MX91 SoCs.

Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change in v2:
- use pcif surfix as Laurent Pinchart's suggest.
- put power-domains into required list
---
 .../devicetree/bindings/media/fsl,imx93-pcif.yaml  | 109 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 110 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/fsl,imx93-pcif.yaml b/Documentation/devicetree/bindings/media/fsl,imx93-pcif.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..ff9a32e0bec1d1bd90d93f45dbd7825d1e12650e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl,imx93-pcif.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/fsl,imx93-pcif.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX8/9 Parallel Camera Interface
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description: |
+  This is device node for the Parallel Camera Interface which enables the
+  chip to connect directly to external Parallel CMOS image sensors.
+  Supports up to 80MHz input clock from sensor.
+  Supports the following input data formats
+    - 8-bit/10-bit Camera Sensor Interface (CSI)
+    - 8-bit data port for RGB, YCbCr, and YUV data input
+    - 8-bit/10-bit data ports for Bayer data input
+  Parallel Camera Interface is hooked to the Imaging subsystem via the
+  Pixel Link.
+
+properties:
+  compatible:
+    oneOf:
+      - const: fsl,imx8qxp-pcif
+      - items:
+          - enum:
+              - fsl,imx91-pcif
+          - const: fsl,imx93-pcif
+      - const: fsl,imx93-pcif
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: pixel
+      - const: ipg
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port node.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Output port node.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx93-clock.h>
+    #include <dt-bindings/power/fsl,imx93-power.h>
+
+    pcif@4ac10070 {
+        compatible = "fsl,imx93-pcif";
+        reg = <0x4ac10070 0x10>;
+        clocks = <&clk IMX93_CLK_MIPI_CSI_GATE>,
+                 <&clk IMX93_CLK_MEDIA_APB>;
+        clock-names = "pixel", "ipg";
+        assigned-clocks = <&clk IMX93_CLK_CAM_PIX>;
+        assigned-clock-parents = <&clk IMX93_CLK_VIDEO_PLL>;
+        assigned-clock-rates = <140000000>;
+        power-domains = <&media_blk_ctrl IMX93_MEDIABLK_PD_MIPI_CSI>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                endpoint {
+                    remote-endpoint = <&mt9m114_ep>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                endpoint {
+                    remote-endpoint = <&isi_in>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 8dc0f6609d1fe2e3eefd50088dbe566d9e107bfa..8ae0667d2bb41fb6a1549bd3b2b33f326cbd1303 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15107,6 +15107,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
 F:	Documentation/admin-guide/media/imx7.rst
+F:	Documentation/devicetree/bindings/media/fsl,imx93-pcif.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml

-- 
2.34.1



