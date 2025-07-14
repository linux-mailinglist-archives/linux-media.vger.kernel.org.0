Return-Path: <linux-media+bounces-37677-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B194FB04398
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 17:24:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B41016215B
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFDE625C713;
	Mon, 14 Jul 2025 15:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SISnL3b9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA7023BF9B;
	Mon, 14 Jul 2025 15:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752506373; cv=none; b=YEQFdPuhEdPAIhBH1eUxrg4nznsgLc7wV/NaWo5YmuSuLJ12N4Y7/ChvXGDhFNtQMYzEB/DfPcG1KrqtTv8+8SDbJRD8eEE0Xlow1rE05CLvCS1M0YV7mUy3srWotd3umlCgICqlYf2wR5yOT7xQJ63RHpNqJ0yhZz04/Iy6qXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752506373; c=relaxed/simple;
	bh=FKEWc6Iw4EzJe6M/pl4zqFwAlDEQl6Yj1p9IimOUn8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=osSBAYtQcvJyklXEtmlShwdaFrWB0jb0uxmrolAQcA4fcKWxD2SB0G7bZHdDvZ3CNwrvG+BGq4iRh6/eeX+2BnTa3+xjfvAEuhIeFEm3ibJSS7ahcubR4Pkj7TVY/00yeLuO8MpcqhvmwsQO+bv8nOj0RuzYmnf/DzdMAXo3oJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SISnL3b9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2BD9199F;
	Mon, 14 Jul 2025 17:18:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752506337;
	bh=FKEWc6Iw4EzJe6M/pl4zqFwAlDEQl6Yj1p9IimOUn8E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SISnL3b9Jq/tnqgN7/Rk1HKcJ/1CDEibe+4lsKjWSNkgmmJ34pzUCztNKJMwuDVFh
	 7/lYwlSTre1mMFxTRyuM33ErsWvT/F62KhhvRdvnvl/eDCJtgzeogFsAdlh061zaJU
	 n+V2yuxORFmyCoEqgpr8fVN29CvN+O21ZqU/SY1s=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Mon, 14 Jul 2025 16:19:17 +0100
Subject: [PATCH v4 1/3] dt-bindings: media: Add bindings for the RZ/V2H IVC
 block
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-ivc-v4-1-534ea488c738@ideasonboard.com>
References: <20250714-ivc-v4-0-534ea488c738@ideasonboard.com>
In-Reply-To: <20250714-ivc-v4-0-534ea488c738@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 jacopo.mondi@ideasonboard.com, biju.das.jz@bp.renesas.com, 
 laurent.pinchart@ideasonboard.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3462;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=FKEWc6Iw4EzJe6M/pl4zqFwAlDEQl6Yj1p9IimOUn8E=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBodR/+SvOEMnt6zDs5To/ds+rzxsX/3y7rhUmwN
 0RG/7DOfjSJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaHUf/gAKCRDISVd6bEV1
 MhNbEACW24X9jViZjvTOAYpWDNxuW0IXVeaKJ5CUIIpEl2yUwBz2CPsutRhg9eK12axf+1n1TOu
 hctpjACmhsxfzCAeTfBNvwQbAeDu78R2SDgVdo2ezWgRkYomR11VVuC1+yNHP/CWwfR0OWGq6OC
 /aTKnS/kIanK6XzlxwIIv2UB+OamIm4r9cniYm5K1YED91fiPgScDUkOTgIJ6UW+4dlJziJP432
 PpbuXFAcvJdMQBN4yVaRr/hog5ctqALBd7I0qWifQNgDFcEbFpylv4veEeXABNtHur3YCkR+hUu
 NUNg7sogXU3PfZ+BnuRyIqREXxyiV7HwuaT1A9b5UMxgbtvt2ISKIBbI7xkLtxKitTOWM/J/gIG
 56ygXVRWDOZID8ShdiIqEa7OXl0unpzmV0eZxah7XPTLC5rW3orKCrfML2IbcPmPNZ74cd84BgS
 Q2rciOEjjTjEJEIf4/fKDDA6mJPE5MZPiN0BSBZGbOc2pLrpmJjwuKoOzsLwp0KOTjS6fiMiQ1l
 lBaN0Gpux256F4X3dm3eUwkk4WM8DkM1TDKNtCJIll5PLIE0Q6VGp5QuXDrdSn0k4X4QM1FkfYz
 OibmmzT/y6yaShs6LeGQMmIL0YFpjtEqTv+O6zzTEJQtZYQJU8LOVl5NbBEYO1TBrnPEWuhQkCD
 VkTuJYIExHBQ0cQ==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

The RZ/V2H SoC has a block called the Input Video Control block which
feeds image data into the Image Signal Processor. Add dt bindings to
describe the IVC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v3:

	- Rename from rzv2h-ivc.yaml to r9a09g057-ivc.yaml
	- Update clock and reset names

Changes in v2:

	- compatible matches filename
	- Added power-domains
	- Aligned clock and reset entries on opening "<"
	- Removed status = "okay"; from example
---
 .../bindings/media/renesas,r9a09g057-ivc.yaml      | 103 +++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml b/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..3ecccf0a4b05ffcf90c130924bfe50065b06f87e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/renesas,r9a09g057-ivc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/V2H Input Video Control Block
+
+maintainers:
+  - Daniel Scally <dan.scally@ideasonboard.com>
+
+description:
+  The IVC block is a module that takes video frames from memory and feeds them
+  to the Image Signal Processor for processing.
+
+properties:
+  compatible:
+    const: renesas,r9a09g057-ivc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Input Video Control block register access clock
+      - description: Video input data AXI bus clock
+      - description: ISP system clock
+
+  clock-names:
+    items:
+      - const: reg
+      - const: axi
+      - const: isp
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: Input Video Control block register access reset
+      - description: Video input data AXI bus reset
+      - description: ISP core reset
+
+  reset-names:
+    items:
+      - const: reg
+      - const: axi
+      - const: isp
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: Output parallel video bus
+
+    properties:
+      endpoint:
+        $ref: /schemas/graph.yaml#/properties/endpoint
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - resets
+  - reset-names
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/renesas,r9a09g057-cpg.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    isp-input@16040000 {
+      compatible = "renesas,r9a09g057-ivc";
+      reg = <0x16040000 0x230>;
+
+      clocks = <&cpg CPG_MOD 0xe3>,
+               <&cpg CPG_MOD 0xe4>,
+               <&cpg CPG_MOD 0xe5>;
+      clock-names = "reg", "axi", "isp";
+
+      power-domains = <&cpg>;
+
+      resets = <&cpg 0xd4>,
+               <&cpg 0xd1>,
+               <&cpg 0xd3>;
+      reset-names = "reg", "axi", "isp";
+
+      interrupts = <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>;
+
+      port {
+        ivc_out: endpoint {
+          remote-endpoint = <&isp_in>;
+        };
+      };
+    };
+...

-- 
2.34.1


