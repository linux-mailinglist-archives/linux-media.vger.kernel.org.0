Return-Path: <linux-media+bounces-43627-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 080A3BB3A82
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 12:38:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1C093C5BDE
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 10:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7840C30B500;
	Thu,  2 Oct 2025 10:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UE1/5z/c"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A13927F16A;
	Thu,  2 Oct 2025 10:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759401476; cv=none; b=IXLfACBgpciKhGl5RlCL0IvLl16bW8ScXcA/sDTBZTcI17Ve/k96aTz9KLMlPDS8ZxJTIKs1qpKUNuMmErsOnZfNP0NmgpBPxw1pVs8CM4//c1MOEMq4mLA88c4r9efE+DkvSAmpiZKF+r4OKUoqznu+gcOgNfpdzTRb1rG2vxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759401476; c=relaxed/simple;
	bh=hTBo4b3DyjD29ehfyT3Q/ReZdOVWdtA6hgfBivG+UOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fKv2KXC3Cc+scIE8sACsGvCGun3wIMVKS2ReAQqdNj39l+h3eTCt/WxEg9Gz2z6yKdwHQaoKBQG0/yiiC+0EBMPfX31/eIsFzUAR/NiyywB95taxg9acRdyPJI3i2uhjdRlzxXhkHXEubNsMSHjtiMAGaHTYR4LI9sGdZvUFxnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UE1/5z/c; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D2D65122A;
	Thu,  2 Oct 2025 12:36:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759401382;
	bh=hTBo4b3DyjD29ehfyT3Q/ReZdOVWdtA6hgfBivG+UOg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UE1/5z/cYuADjS0KPiVoaxyEd/RETODOglJpYPgXdBy5FISpJh4d4FhRysD5U3vpX
	 2eoPI1pg1kk5JCPfrlnHYTNbdsB2CezvxpHW8/RGS2P9JUed4HbnDv+JUYrULQ3aYv
	 7LW449sjeeI1+fO24NvubhnvL1hOAJwItgqkiIVI=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Thu, 02 Oct 2025 11:37:00 +0100
Subject: [PATCH v5 1/3] dt-bindings: media: Add bindings for the RZ/V2H(P)
 IVC block
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-ivc-v5-1-192c663fa70b@ideasonboard.com>
References: <20251002-ivc-v5-0-192c663fa70b@ideasonboard.com>
In-Reply-To: <20251002-ivc-v5-0-192c663fa70b@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3519;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=hTBo4b3DyjD29ehfyT3Q/ReZdOVWdtA6hgfBivG+UOg=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBo3lX9DXuXoDdjHqUVjIsfedSG3SQCM7HOhPGqS
 GGoAcPoj6KJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaN5V/QAKCRDISVd6bEV1
 MpMpEACqkNHSoKdHgfoMaC7CYakOpOJ9oPgrqMaNb6pMPWk4slkal/mTOvVZbcFtgKE5DbwPCoq
 noUgU+hH795aJNuLf8RmqH2alyUGURBZ26bkdXf4DnZg2eWyzIt0Tg4mBYttURRhA02SWUDAwTa
 jS8YYOjQ8zQz3QVfSW8G3HpKLphkstjNw4UQfiTjbrqxYOeDjZ64/+/gN88j82GfX1f79bxwBCq
 gnc5+rnhcbxtl4aJoceJcTySmYkQzJ+bCgMLmKYURc5aF1E8y1KalansbLRVYYb46EuHUenseNE
 Ri7TqsdPqPb4BPg1Yr08ySDnkdunjHJ8gFakxVzGY6Yzsn/QwgNml21vdVzTa0WnXpKMM2EocOg
 6JTJMzYcgd2NtDKLMkgY8hGOoWbDr+LnCfQ1NTS3oPdnwqwbcUpbn4hrjW3HeaJ4LrzE/fp4RBt
 zNo+h4o3qkSasT9n/QV1f9b3c78hPbyRFy0kimPCz8ZwFIXSWV7KbgmkpqspQIAfO3O+a+4H8au
 zJMlaag3fpHm8SFAd+1KclQlWcFtojfaV/HP8KxMCwntIb148mr4Ev8gfg3C09kk5TwjMIfL1zb
 s5qhllQ/0Z3XA8Gk1RRQJSPp1gcYaYtjh+YYLrhAXghDM4k2KLgX0HZyINDxet/GlcHepAi4GYR
 RpN/SXMIOG6KosQ==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

The RZ/V2H(P) SoC has a block called the Input Video Control block which
feeds image data into the Image Signal Processor. Add dt bindings to
describe the IVC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v5:

	- Rename RZ/V2H to RZ/V2H(P)

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
index 0000000000000000000000000000000000000000..8e236e46882668b2660d175e8b2cffe204aa781c
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/renesas,r9a09g057-ivc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/V2H(P) Input Video Control Block
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
2.43.0


