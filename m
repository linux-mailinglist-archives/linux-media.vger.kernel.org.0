Return-Path: <linux-media+bounces-45980-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1161AC1EE1F
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 09:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8783534AB13
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 08:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9171D33A036;
	Thu, 30 Oct 2025 07:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HJfwaoK3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CBC338591;
	Thu, 30 Oct 2025 07:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761811162; cv=none; b=L7JzAQptOaDuwEtDDNu4Sb5nACij2I/tARikvJioqn8jf9oFuaLTuXnBdPYEBv5yzLjSJL0iwsDXM/zqW6vK0czu4r0zYnehxhQm7utcnz+1INPpyGTRdXZQeoPcv0MY8av97S7JcspB5L7OQ8ZlUmVKGUiRmyFa+rBii1s44aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761811162; c=relaxed/simple;
	bh=atERiNJWobfmeN7nh+L9YbOC6sECGvqmzOPt+YsIXNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tr1XGUd+41tzlTg6Ow8RBVXmk5u/lOsUS6s6NyX6z3M8BrAZFG7jhLG1WMJ1RPQTuGzMms+oPQbk3K0J/di044buMzLKd34sr9bJb/+uxjMHo04R/xNKKL9zRevtaNXzIPYh26Zvy5QtLdJpyqDCeGzBsKvVoWklTcGO0BhJcMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJfwaoK3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45973C116D0;
	Thu, 30 Oct 2025 07:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761811162;
	bh=atERiNJWobfmeN7nh+L9YbOC6sECGvqmzOPt+YsIXNw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HJfwaoK3Nib0V4WsNh1nGkh+XV4XEbWiRmUY/uRYMNvy8AqhGTFB+nrehJLPEKDtZ
	 haQiCli8ijbjpwo/Nq/SXCa6p79bz8d8N8PwSsAlkT5eEZyVfUKs1EO3HzG1uQxlvS
	 04nsrkGhrijmXiEk14Isi4L/plc6uHw07BgjE8TX144MNH0wn14xr6qWvDhy7bMh4F
	 RT9FaqU/y+UqQ0kfu6nSoEiIFhkh4imFgNPilpcNpuMqU9gh4w7+XfR1sRSNHX5tl7
	 HT2ehGtAOeeCFp3P31mYTcVOaQO6sK7Uossl5QN1mqb8u6g4sJLqN1ZoMH0//TBqDB
	 +Mr8X7N/iiMjg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB6CCCF9F0;
	Thu, 30 Oct 2025 07:59:22 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Thu, 30 Oct 2025 08:59:12 +0100
Subject: [PATCH v8 1/4] media: dt-bindings: Add qcom,msm8939-camss
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251030-camss-8x39-vbif-v8-1-754834937f5c@apitzsch.eu>
References: <20251030-camss-8x39-vbif-v8-0-754834937f5c@apitzsch.eu>
In-Reply-To: <20251030-camss-8x39-vbif-v8-0-754834937f5c@apitzsch.eu>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Bryan O'Donoghue <bod@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vincent Knecht <vincent.knecht@mailoo.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761811160; l=7957;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=l8JUjYkCXPnuBo5q8bU+IKbrnKrXX8otllKkjKJF1dM=;
 b=n315Ioei+nzEAUZt5z8OSvWobPzbIdPXs2bGiJVNFyUnzHR0lUff1P/DRSItD3uhPuXBUeI+S
 FAXyuwQlX2SBghU1KSZLsmwNtm5ke2yeiserb63K3D649WRFws6fg8o
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: Vincent Knecht <vincent.knecht@mailoo.org>

Add bindings for qcom,msm8939-camss in order to support the camera
subsystem for MSM8939.

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
[André: Make order of items the same as in 8916]
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 .../bindings/media/qcom,msm8939-camss.yaml         | 254 +++++++++++++++++++++
 1 file changed, 254 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8939-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8939-camss.yaml
new file mode 100644
index 000000000000..77b389d76a43
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,msm8939-camss.yaml
@@ -0,0 +1,254 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,msm8939-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm MSM8939 Camera Subsystem (CAMSS)
+
+maintainers:
+  - Vincent Knecht <vincent.knecht@mailoo.org>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms
+
+properties:
+  compatible:
+    const: qcom,msm8939-camss
+
+  reg:
+    maxItems: 11
+
+  reg-names:
+    items:
+      - const: csiphy0
+      - const: csiphy0_clk_mux
+      - const: csiphy1
+      - const: csiphy1_clk_mux
+      - const: csid0
+      - const: csid1
+      - const: ispif
+      - const: csi_clk_mux
+      - const: vfe0
+      - const: csid2
+      - const: vfe0_vbif
+
+  clocks:
+    maxItems: 24
+
+  clock-names:
+    items:
+      - const: top_ahb
+      - const: ispif_ahb
+      - const: csiphy0_timer
+      - const: csiphy1_timer
+      - const: csi0_ahb
+      - const: csi0
+      - const: csi0_phy
+      - const: csi0_pix
+      - const: csi0_rdi
+      - const: csi1_ahb
+      - const: csi1
+      - const: csi1_phy
+      - const: csi1_pix
+      - const: csi1_rdi
+      - const: ahb
+      - const: vfe0
+      - const: csi_vfe0
+      - const: vfe_ahb
+      - const: vfe_axi
+      - const: csi2_ahb
+      - const: csi2
+      - const: csi2_phy
+      - const: csi2_pix
+      - const: csi2_rdi
+
+  interrupts:
+    maxItems: 7
+
+  interrupt-names:
+    items:
+      - const: csiphy0
+      - const: csiphy1
+      - const: csid0
+      - const: csid1
+      - const: ispif
+      - const: vfe0
+      - const: csid2
+
+  iommus:
+    maxItems: 1
+
+  power-domains:
+    items:
+      - description: VFE GDSC - Video Front End, Global Distributed Switch
+          Controller.
+
+  vdda-supply:
+    description:
+      Definition of the regulator used as 1.2V analog power supply.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports.
+
+    patternProperties:
+      "^port@[0-1]$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+
+        description:
+          Input port for receiving CSI data.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              bus-type:
+                enum:
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+
+            required:
+              - data-lanes
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - iommus
+  - power-domains
+  - vdda-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,gcc-msm8939.h>
+
+    isp@1b0ac00 {
+        compatible = "qcom,msm8939-camss";
+
+        reg = <0x01b0ac00 0x200>,
+              <0x01b00030 0x4>,
+              <0x01b0b000 0x200>,
+              <0x01b00038 0x4>,
+              <0x01b08000 0x100>,
+              <0x01b08400 0x100>,
+              <0x01b0a000 0x500>,
+              <0x01b00020 0x10>,
+              <0x01b10000 0x1000>,
+              <0x01b08800 0x100>,
+              <0x01b40000 0x200>;
+
+        reg-names = "csiphy0",
+                    "csiphy0_clk_mux",
+                    "csiphy1",
+                    "csiphy1_clk_mux",
+                    "csid0",
+                    "csid1",
+                    "ispif",
+                    "csi_clk_mux",
+                    "vfe0",
+                    "csid2",
+                    "vfe0_vbif";
+
+        clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+                 <&gcc GCC_CAMSS_ISPIF_AHB_CLK>,
+                 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+                 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+                 <&gcc GCC_CAMSS_CSI0_AHB_CLK>,
+                 <&gcc GCC_CAMSS_CSI0_CLK>,
+                 <&gcc GCC_CAMSS_CSI0PHY_CLK>,
+                 <&gcc GCC_CAMSS_CSI0PIX_CLK>,
+                 <&gcc GCC_CAMSS_CSI0RDI_CLK>,
+                 <&gcc GCC_CAMSS_CSI1_AHB_CLK>,
+                 <&gcc GCC_CAMSS_CSI1_CLK>,
+                 <&gcc GCC_CAMSS_CSI1PHY_CLK>,
+                 <&gcc GCC_CAMSS_CSI1PIX_CLK>,
+                 <&gcc GCC_CAMSS_CSI1RDI_CLK>,
+                 <&gcc GCC_CAMSS_AHB_CLK>,
+                 <&gcc GCC_CAMSS_VFE0_CLK>,
+                 <&gcc GCC_CAMSS_CSI_VFE0_CLK>,
+                 <&gcc GCC_CAMSS_VFE_AHB_CLK>,
+                 <&gcc GCC_CAMSS_VFE_AXI_CLK>,
+                 <&gcc GCC_CAMSS_CSI2_AHB_CLK>,
+                 <&gcc GCC_CAMSS_CSI2_CLK>,
+                 <&gcc GCC_CAMSS_CSI2PHY_CLK>,
+                 <&gcc GCC_CAMSS_CSI2PIX_CLK>,
+                 <&gcc GCC_CAMSS_CSI2RDI_CLK>;
+
+        clock-names = "top_ahb",
+                      "ispif_ahb",
+                      "csiphy0_timer",
+                      "csiphy1_timer",
+                      "csi0_ahb",
+                      "csi0",
+                      "csi0_phy",
+                      "csi0_pix",
+                      "csi0_rdi",
+                      "csi1_ahb",
+                      "csi1",
+                      "csi1_phy",
+                      "csi1_pix",
+                      "csi1_rdi",
+                      "ahb",
+                      "vfe0",
+                      "csi_vfe0",
+                      "vfe_ahb",
+                      "vfe_axi",
+                      "csi2_ahb",
+                      "csi2",
+                      "csi2_phy",
+                      "csi2_pix",
+                      "csi2_rdi";
+
+        interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 51 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 55 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 153 IRQ_TYPE_EDGE_RISING>;
+
+        interrupt-names = "csiphy0",
+                          "csiphy1",
+                          "csid0",
+                          "csid1",
+                          "ispif",
+                          "vfe0",
+                          "csid2";
+
+        iommus = <&apps_iommu 3>;
+
+        power-domains = <&gcc VFE_GDSC>;
+
+        vdda-supply = <&reg_1v2>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@1 {
+                reg = <1>;
+
+                csiphy1_ep: endpoint {
+                    data-lanes = <0 2>;
+                    remote-endpoint = <&sensor_ep>;
+                };
+            };
+        };
+    };

-- 
2.51.2



