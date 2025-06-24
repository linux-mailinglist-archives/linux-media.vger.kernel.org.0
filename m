Return-Path: <linux-media+bounces-35745-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D84AE6230
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 12:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9EBF4C1B50
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 10:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A862874EC;
	Tue, 24 Jun 2025 10:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NfqvNnAm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FE7286D5E;
	Tue, 24 Jun 2025 10:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750760503; cv=none; b=Px1zWSY683OfH/TS+LgK6wkS4nzvV+8UiOhxyOD9quzj+3kZ3+YVwNGjxUqPURA1mdJfjsavMKjZyLD2LEjnq4OeiezNQt8K8szzsVsdSMBa9NNysdgbU5i099aReNgSu/sUgYjS6hiqEmH/pn+xQTsC+vgOPs2IJegmpH0G9XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750760503; c=relaxed/simple;
	bh=q2N5KYx+ZSfxtVUuz937VLGW/QJTz2MK0lyWI1vVgUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qoZczPMZfU07TzJ+HrcOktafisRbS4fiePA/uZFzpVRxRbYsS1tbBExsUB97MHsiz/ffivIrX1lKu9r4RIyL8ml00TFItTa8R9LCDd8GSpaMJ704Q7j10YhMwGuXWJxCezMU5QzFiku8JXCZiDCgiTbOZvEmI+JfSF7kPo3J/pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NfqvNnAm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07C8B1752;
	Tue, 24 Jun 2025 12:21:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750760477;
	bh=q2N5KYx+ZSfxtVUuz937VLGW/QJTz2MK0lyWI1vVgUI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NfqvNnAmnuaeomRYqezoJdu2brkHgogEsqe/SyxABjgkl/wUs+roN0+iYYmQaVhOu
	 UAbybl5nJBDMVOuTQKUExsx2alOtM8kaeIi+bQA5Mn7cSFGAd9AdBB60squXfpi4Ut
	 XixK7Ei+ijV28X8XUrtu5+QT+5vcjm6olwneDp7w=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 24 Jun 2025 11:21:18 +0100
Subject: [PATCH v10 05/17] dt-bindings: media: Add bindings for ARM
 mali-c55
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-c55-v10-5-54f3d4196990@ideasonboard.com>
References: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
In-Reply-To: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3877;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=q2N5KYx+ZSfxtVUuz937VLGW/QJTz2MK0lyWI1vVgUI=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoWnwnlVWZqvgI/Q+W4MYsR0JxZHvLI9zg/Bj4/
 iLKya9+PrCJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFp8JwAKCRDISVd6bEV1
 MspJD/4q/mkLihyWMHbE5VDwGg/fwFznIA8GBWBg7Xf6yqm4x1J2YnjqbsVFT+HVY/Wi0OgEVmQ
 8rmluE3mge6/pdHDcHlwBwILk11hYoBjDUbWrGR/mPyAFUpzKYwszlSScVecGp4HeQgQbFtagZi
 psfELI4LqqU4T0rX7j7s7fHYE5Xv9S9VRm22XcRKxPqowHgasEdJrPC2yygTS1tZunzMpwVBWt8
 n/Icjhwbep5x8hq/0GeeAl3IH1GhSlfFryZtBIIc3TmVVFztcxo3Bsj0pkcwODOGmvEu9Lh4/bU
 l1oG2ZQQ2Oaezya1QGvcBV2hQ1CA0gAsey4cOSibmf1s7KxyxTHbyyj5kGL29UoOjp4vi8vsuF0
 ESnMIvBnASR+bQw1lLOkBTsA0250Hae0hKeZqYOvh+PmQ5tGl2HCGUf3zYhsOyPAbKiVC+GDqIP
 WcT/tCkIkzrN9RLaOqV0ncpvqwAD4tL29LbiSxqnpP9rzvT1wht8NMnpi8tc7rLoTAMq8mx7Rn+
 R5PHJB/Imgph1Ha+3/LPmecf5xbQk1ZDkijXg2JSy7gGZ9Tp1v7IJvcNWIObeaBVLUUMBRWmzTe
 HUTXRoxb2eutwvzytAue7+5IFGJ/+w7gnsjcCftrw7Cz2OTmDlAV7eu/kC+f04KpQFsohi50tK6
 FCE4UyI/HaokfYQ==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Add the yaml binding for ARM's Mali-C55 Image Signal Processor.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v10:

	- None

Changes in v9:

	- Added the arm,inline_mode property to differentiate between inline and
	  memory input configurations

Changes in v8:

	- Added the video clock back in. Now that we have actual hardware it's
	  clear that it's necessary.
	- Added reset lines
	- Dropped R-bs

Changes in v7:

	- None

Changes in v6:

	- None

Changes in v5:

	- None

Changes in v4:

	- Switched to port instead of ports

Changes in v3:

	- Dropped the video clock as suggested by Laurent. I didn't retain it
	for the purposes of the refcount since this driver will call .s_stream()
	for the sensor driver which will refcount the clock anyway.
	- Clarified that the port is a parallel input port rather (Sakari)

Changes in v2:

	- Added clocks information
	- Fixed the warnings raised by Rob
---
 .../devicetree/bindings/media/arm,mali-c55.yaml    | 89 ++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..539fa8163bd07cf8a80c361012400cbcc7d073eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/arm,mali-c55.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Mali-C55 Image Signal Processor
+
+maintainers:
+  - Daniel Scally <dan.scally@ideasonboard.com>
+  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+
+properties:
+  compatible:
+    const: arm,mali-c55
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: ISP Video Clock
+      - description: ISP AXI clock
+      - description: ISP AHB-lite clock
+
+  clock-names:
+    items:
+      - const: vclk
+      - const: aclk
+      - const: hclk
+
+  resets:
+    items:
+      - description: vclk domain reset
+      - description: aclk domain reset
+      - description: hclk domain reset
+
+  reset-names:
+    items:
+      - const: vresetn
+      - const: aresetn
+      - const: hresetn
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: Input parallel video bus
+
+    properties:
+      endpoint:
+        $ref: /schemas/graph.yaml#/properties/endpoint
+
+  arm,inline_mode:
+    description:
+      The ISP can be either electrically connected to sensor and CSI-2 receiver
+      or driven through a DMA input device. This property declares the ISP as
+      being electrically connected to the source of image data.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    mali_c55: isp@400000 {
+      compatible = "arm,mali-c55";
+      reg = <0x400000 0x200000>;
+      clocks = <&clk 0>, <&clk 1>, <&clk 2>;
+      clock-names = "vclk", "aclk", "hclk";
+      resets = <&resets 0>, <&resets 1>, <&resets 2>;
+      reset-names = "vresetn", "aresetn", "hresetn";
+      interrupts = <0>;
+
+      port {
+        isp_in: endpoint {
+            remote-endpoint = <&csi2_rx_out>;
+        };
+      };
+    };
+...

-- 
2.34.1


