Return-Path: <linux-media+bounces-30883-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 582DEA99B6D
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 00:20:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8509F1B83896
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 22:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8BB621FF2D;
	Wed, 23 Apr 2025 22:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FvACobxJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238CF1EF099
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 22:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745446812; cv=none; b=T1TOk73yHioAKLLk49+wZUDSYkzhOE6o4WClYX6ljWqcwfk25EePh5RkImKqwepKIxH6Rq9nr7grVJdtpT5ULccUa7k/yTSgLKvj0WlQ1xLhUJGh5V8DBm8YWIyPr10LN+TNA/q5ZFr3efvhWtCnDtzB2Ezd72a/CWq3oytqsG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745446812; c=relaxed/simple;
	bh=PM45wRrE95sQV1t+nw4v7KeSnbp7wMzUiI+T0aFYiEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h/aIIHGC45GDEfNZemlPOeTv9NIeQ70mxB60i/G5cdqeOEN5I//fMorXbxu/Zu1b7iaQlHBxze0LMlVcSI9vBbGoCy4YamYnAm/vZOKbLRuuOnXuf1JfKkm0DqK5HPfDIZMf3JMOPkjKTtaykefV3McD9KmZF17fbkM/8SC+K1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FvACobxJ; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-549c70bf6caso52477e87.0
        for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 15:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745446807; x=1746051607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7L1JnDvgJ6K/eZLm9yc+TRRgGRtYEXb98tTHwQE0v5E=;
        b=FvACobxJUCFe650jWS9obMLj56I/oJQD0rFHAXi+FjWJW4bD4NhQMjjh/Qhrhj1KqR
         G0yb9pOjjuthGQDW30P+Dlf1SPK6b2Jqj9mBs4vAg901yG8jDICq8Xe+At9kZwQVgJoD
         MzITYxsXx8yodKW8s2G/1Om6154++kE2QAVM3O4WKmLbqcVWuR1+9lgdk453mtpwHBnW
         S1AMDhbKnp/8tW3MdoIGKQUQOogOc6FRybyRRcQ6cO30zPjfbLdts3cWpW9RzyazT1eT
         gy8ZJtjklN3ftbkSGtOSU19YtsFHC994qQuxI7Lg2bt3081hUAIX4A2OTBrn4xpIvwFO
         PwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745446807; x=1746051607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7L1JnDvgJ6K/eZLm9yc+TRRgGRtYEXb98tTHwQE0v5E=;
        b=KxKBpTCgyXb2f71IacQheBca+fHLJ22NgsuJhXEySLRib9bTBwLSMwgUHPNIM9qM43
         CsdhytHOcptfLqTXu/D/Iwyj/PLnryeikx3yspT3Mj2OXdYF385Ekz4VHPXo+3LAmvbT
         k/gWg0m1cNXB9HXafOoSJqtxCcidGjPw561I/VZTzfhVZRsowbG95kaOhTnyBswyLBut
         QQKjlmmDAnIbqnqGgGItk4a63RY+LJueNXAxQdVkpq2vrdBCn+xV+LlzM6gNPQtyrgFM
         FBtY20zEEJ+Fncn1iPddvGXxM4BMQPBWHEQS9DEUAoJjyeYyiKr+VQK/Wl8AXC/0n4Hw
         3dcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXx8MYf1IK2WVicYbBDpMRqNC358SOtzZlfqC4et37aAwMPfrfpaf1J42mySIoYzdKGiuTuc4F0xpcs8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQGztCjZNksDJ05dJ1VqfmxH8cmEXtljWnWPd24EyDqRM9ooWP
	gevEN19diupMZ3XBDxK4cy3ZteMu0cPysI110+vRKD+L+JBBId1uC50WtQ9LjlY=
X-Gm-Gg: ASbGncsqdPuN7nnbEU1AfUvLeLqMP5DehAMhvJd0OF/Ml/WYkI49mTGkv5kHwHYult/
	NGD/ZFiCIzuH317ciLnJ98lp1nU7VJsMjl8xIR9fELsrUkM3iKlHjzjFeqR5Exk7OOWKVLCVxNB
	U0Mui+EnOFGyBgIuRAhEpMYir6P+9lFn17Tpgi8ZuSkWjYmv1qR8WvYooVz2dAMX980CFkR3Wic
	2LL3MauePTufoy7e7hr6J2+XS8Aq14q2wbOZ8Xtnk8lvvUD8QNjgI3Rdq+ed8MMnjJaSh07w2Nz
	c2sxdR2AYkXD+iVmUMoC59Bks/ernOdcAIs/gTaBdmRt1Isd/q9V2PTo/CF2AGZk5FNyNgFbvX1
	qjkHaOFdVBRXlWPy7o4ZfIIB2b9D6Ew==
X-Google-Smtp-Source: AGHT+IHR9epiQGoXJX6+KgyadlPHbtAvaATMyOTfUeJbqN2RhK0VIZP9lU/oW0giTWk/gtnpUXtZXg==
X-Received: by 2002:a05:6512:3baa:b0:54c:a7c:cbcb with SMTP id 2adb3069b0e04-54e7c554774mr46247e87.14.1745446807156;
        Wed, 23 Apr 2025 15:20:07 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb371a2sm19547e87.57.2025.04.23.15.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 15:20:06 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: media: Describe Qualcomm SM8650 CAMSS IP
Date: Thu, 24 Apr 2025 01:19:52 +0300
Message-ID: <20250423221954.1926453-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250423221954.1926453-1-vladimir.zapolskiy@linaro.org>
References: <20250423221954.1926453-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for Qualcomm SM8650 camera subsystem.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../bindings/media/qcom,sm8650-camss.yaml     | 394 ++++++++++++++++++
 1 file changed, 394 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
new file mode 100644
index 000000000000..2a7c243993c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
@@ -0,0 +1,394 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,sm8650-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM8650 Camera Subsystem (CAMSS)
+
+maintainers:
+  - Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,sm8650-camss
+
+  reg:
+    maxItems: 17
+
+  reg-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csid_wrapper
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: csiphy4
+      - const: csiphy5
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  clocks:
+    maxItems: 36
+
+  clock-names:
+    items:
+      - const: camnoc_axi_nrt
+      - const: camnoc_axi_rt
+      - const: cpas_ahb
+      - const: cpas_fast_ahb
+      - const: cpas_vfe0
+      - const: cpas_vfe1
+      - const: cpas_vfe2
+      - const: cpas_vfe_lite
+      - const: csid
+      - const: csiphy0
+      - const: csiphy0_timer
+      - const: csiphy1
+      - const: csiphy1_timer
+      - const: csiphy2
+      - const: csiphy2_timer
+      - const: csiphy3
+      - const: csiphy3_timer
+      - const: csiphy4
+      - const: csiphy4_timer
+      - const: csiphy5
+      - const: csiphy5_timer
+      - const: csiphy_rx
+      - const: gcc_ahb_clk
+      - const: gcc_axi_hf
+      - const: gcc_axi_sf
+      - const: qdss_debug_xo
+      - const: vfe0
+      - const: vfe0_fast_ahb
+      - const: vfe1
+      - const: vfe1_fast_ahb
+      - const: vfe2
+      - const: vfe2_fast_ahb
+      - const: vfe_lite
+      - const: vfe_lite_ahb
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+
+  interrupts:
+    maxItems: 16
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: csiphy4
+      - const: csiphy5
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  iommus:
+    maxItems: 3
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_0_mnoc
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: IFE2 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: Titan GDSC - Titan ISP Block, Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - const: ife0
+      - const: ife1
+      - const: ife2
+      - const: top
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports.
+
+    patternProperties:
+      "^port@[0-5]$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+
+        description:
+          Input port for receiving CSI data from a CSIPHY.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+  vdda-csi01-0p9-supply:
+    description:
+      Phandle to a 0.9V regulator supply to CSIPHY0 and CSIPHY1 IP blocks.
+
+  vdda-csi24-0p9-supply:
+    description:
+      Phandle to a 0.9V regulator supply to CSIPHY2 and CSIPHY4 IP blocks.
+
+  vdda-csi35-0p9-supply:
+    description:
+      Phandle to a 0.9V regulator supply to CSIPHY3 and CSIPHY5 IP blocks.
+
+  vdda-csi01-1p2-supply:
+    description:
+      Phandle to a 1.2V regulator supply to CSIPHY0 and CSIPHY1 IP blocks.
+
+  vdda-csi24-1p2-supply:
+    description:
+      Phandle to a 1.2V regulator supply to CSIPHY2 and CSIPHY4 IP blocks.
+
+  vdda-csi35-1p2-supply:
+    description:
+      Phandle to a 1.2V regulator supply to CSIPHY3 and CSIPHY5 IP blocks.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interconnects
+  - interconnect-names
+  - interrupts
+  - interrupt-names
+  - iommus
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sm8650-camcc.h>
+    #include <dt-bindings/clock/qcom,sm8650-gcc.h>
+    #include <dt-bindings/interconnect/qcom,sm8650-rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp@acb8000 {
+            compatible = "qcom,sm8650-camss";
+            reg = <0 0x0acb8000 0 0x1000>,
+                  <0 0x0acba000 0 0x1000>,
+                  <0 0x0acbc000 0 0x1000>,
+                  <0 0x0accb000 0 0x1000>,
+                  <0 0x0acd0000 0 0x1000>,
+                  <0 0x0acb6000 0 0x1000>,
+                  <0 0x0ace4000 0 0x2000>,
+                  <0 0x0ace6000 0 0x2000>,
+                  <0 0x0ace8000 0 0x2000>,
+                  <0 0x0acea000 0 0x2000>,
+                  <0 0x0acec000 0 0x2000>,
+                  <0 0x0acee000 0 0x2000>,
+                  <0 0x0ac62000 0 0xf000>,
+                  <0 0x0ac71000 0 0xf000>,
+                  <0 0x0ac80000 0 0xf000>,
+                  <0 0x0accc000 0 0x2000>,
+                  <0 0x0acd1000 0 0x2000>;
+            reg-names = "csid0",
+                        "csid1",
+                        "csid2",
+                        "csid_lite0",
+                        "csid_lite1",
+                        "csid_wrapper",
+                        "csiphy0",
+                        "csiphy1",
+                        "csiphy2",
+                        "csiphy3",
+                        "csiphy4",
+                        "csiphy5",
+                        "vfe0",
+                        "vfe1",
+                        "vfe2",
+                        "vfe_lite0",
+                        "vfe_lite1";
+
+            clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
+                     <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+                     <&camcc CAM_CC_CPAS_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_1_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_2_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_CSID_CLK>,
+                     <&camcc CAM_CC_CSIPHY0_CLK>,
+                     <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY1_CLK>,
+                     <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY2_CLK>,
+                     <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY3_CLK>,
+                     <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY4_CLK>,
+                     <&camcc CAM_CC_CSI5PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY5_CLK>,
+                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+                     <&gcc GCC_CAMERA_AHB_CLK>,
+                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                     <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>,
+                     <&camcc CAM_CC_IFE_0_CLK>,
+                     <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_1_CLK>,
+                     <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_2_CLK>,
+                     <&camcc CAM_CC_IFE_2_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+            clock-names = "camnoc_axi_nrt",
+                          "camnoc_axi_rt",
+                          "cpas_ahb",
+                          "cpas_fast_ahb",
+                          "cpas_vfe0",
+                          "cpas_vfe1",
+                          "cpas_vfe2",
+                          "cpas_vfe_lite",
+                          "csid",
+                          "csiphy0",
+                          "csiphy0_timer",
+                          "csiphy1",
+                          "csiphy1_timer",
+                          "csiphy2",
+                          "csiphy2_timer",
+                          "csiphy3",
+                          "csiphy3_timer",
+                          "csiphy4",
+                          "csiphy4_timer",
+                          "csiphy5",
+                          "csiphy5_timer",
+                          "csiphy_rx",
+                          "gcc_ahb_clk",
+                          "gcc_axi_hf",
+                          "gcc_axi_sf",
+                          "qdss_debug_xo",
+                          "vfe0",
+                          "vfe0_fast_ahb",
+                          "vfe1",
+                          "vfe1_fast_ahb",
+                          "vfe2",
+                          "vfe2_fast_ahb",
+                          "vfe_lite",
+                          "vfe_lite_ahb",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_csid";
+
+            interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 602 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 604 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 688 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csid_lite0",
+                              "csid_lite1",
+                              "csiphy0",
+                              "csiphy1",
+                              "csiphy2",
+                              "csiphy3",
+                              "csiphy4",
+                              "csiphy5",
+                              "vfe0",
+                              "vfe1",
+                              "vfe2",
+                              "vfe_lite0",
+                              "vfe_lite1";
+
+            interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_CAMERA_CFG 0>,
+                            <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI1 0>;
+            interconnect-names = "ahb",
+                                 "hf_0_mnoc";
+
+            iommus = <&apps_smmu 0x800 0x20>,
+                     <&apps_smmu 0x18a0 0x40>,
+                     <&apps_smmu 0x1860 0x00>;
+
+            power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+                            <&camcc CAM_CC_IFE_1_GDSC>,
+                            <&camcc CAM_CC_IFE_2_GDSC>,
+                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
+            power-domain-names = "ife0", "ife1", "ife2", "top";
+
+            vdda-csi01-0p9-supply = <&vreg_0p9>;
+            vdda-csi01-1p2-supply = <&vreg_1p2>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@1 {
+                    reg = <1>;
+
+                    csiphy1_ep: endpoint {
+                        clock-lanes = <4>;
+                        data-lanes = <0 1>;
+                        remote-endpoint = <&camera_sensor>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.45.2


