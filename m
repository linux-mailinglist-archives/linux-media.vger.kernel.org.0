Return-Path: <linux-media+bounces-19371-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2189D999A94
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 04:38:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96B321F23ED5
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 02:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05CD41F4FC0;
	Fri, 11 Oct 2024 02:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAWJgtXy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF40A1F4737;
	Fri, 11 Oct 2024 02:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728614262; cv=none; b=eVgxs5H4ge0p1lnPeMt4Ntr3iszKk6q7ykpk/kLMTRixtk49ocVAmjcX0fubvHTfa8H0ocyb5I1KSM0706TbDDX2x4t5O+w4qNWQS5nzbhIWU3o+fL+dgAaxbUxKRauBMHBo8c3uO1OI0IOSClwVGptfpcr4uc+eBGFqQNFH9ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728614262; c=relaxed/simple;
	bh=XWzQVx+ZPbKyT7z7RzFveXK/YpRNZFjsz73AFunAuUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lw7J0Xz29Dxv6rR170WA86FLXvluTSmYQl4L6lHhsYvELKjcl8eJM9vEXe1dTlRrGHabp30qP3smDV/zoUjSeP++iNUGW1qGHXoPkbLbV7cjND/X2jEuADOlb4rjpsMzchqGWLeCEh7qZPlsliqd9HOYKgHaYogaZnNq9kkfAnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kAWJgtXy; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7ae3e3db294so77701785a.2;
        Thu, 10 Oct 2024 19:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728614259; x=1729219059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QvlaSJjrx7WxFR3R/ISTFeU1vJcVcOi9I16YDSomeh8=;
        b=kAWJgtXyaRno1xfCLTnyN+T9ZjrZ6iVXjg1aYaTw4uGFVpQhi3tci1+/YL6pQFEjkY
         dX+wr6axBVb5RsskRl+tOqohvJdRxnuZMI26gD90dqSa2qdiB/XaHSNTQ5IvFriR9cV5
         7M61M7Wm1NkfT5457qcMmmcUZ5qTMNmPRMlmN5SCRfuwtQNRoaLtPggPk8/BIwm96iBV
         o8PCy5/OCzB8csZJttDpemo5f0RtDRmat+4TZkDo1SklAfh1cntJI0JAUFvLkKJxacgi
         hawimZIvvkvxZ6TYHGwbCfHAR+iy+3pEehIG2sn4rx9VDjVJXJwA2FlDQQagMYF2KGiQ
         Bhcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728614259; x=1729219059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QvlaSJjrx7WxFR3R/ISTFeU1vJcVcOi9I16YDSomeh8=;
        b=nLgLKXQtBHBko6fHyVdzBNzE3rHRwCBB2D7TQP9GQu1GGd3Ob4dL++FBg+U7BR6dVd
         OLCG3BOIWknemqTDGDO4Z8EsNusWVSJYbpwFVyrIMebkYrstPaBv9tRcmlcdTqAuTZa6
         7ZsaRSosNhd/IcoapJg39aLCHoLjrhifazKNt0aDYI276OkWoCz5xZ8GQbdsDeINJRuL
         irxN6K0vp+Hyt8zt8Q8Sj/W+EJAN70Xtg0ocyT4E+6/QIStOmmSbxQHp+KAkRkov7eyW
         HecLv2xVy2CZ0i8LNp+uu7KNvgHXvkHOdOPl0jcxsWdXE528u7rgYOMnxuSAjn/GQpUG
         geJg==
X-Forwarded-Encrypted: i=1; AJvYcCVWiUA6gIBFNYAD+bCkUosaiE1kaQ5ChvRufJcFlNJCR2KR/c7Op9SgwWwlEOPbISbe6BXp6tCkwBjcKc+UTQ==@vger.kernel.org, AJvYcCVqan+CDD0tEnJO+SXXuni+ByKKeR/LuILdkI4VXeBxVhHjTkIe4X0/RNezCvWBXb8lkf1/iRKYi3jnyOk=@vger.kernel.org, AJvYcCVuPKGFo6b/VlkT+ckgvBXBEgPIF4/U/nX1Bc0riEnEg1WTKyM7lZD3ySkH3Tc8J96t5JUNQsvNP3a+@vger.kernel.org, AJvYcCWRM0cbulPSUPpmE9kM1ttqTMjKyBLAfp/mekmpVwB4+mo0wpOmxhKCmpYYHte4hX2cGEVBnnmDc7R7@vger.kernel.org
X-Gm-Message-State: AOJu0YyKDvRuEK6rDudb9LvY83GY/EwXkyFphV2NagCTi3iTwplC4Hyp
	qpWetGy/L0ufzOptpCHo6gq2ebw7Q/3hSA/Rnol99w2arThCTpdW
X-Google-Smtp-Source: AGHT+IEUAaRz4eKzRY7XjXTOmoswI1fwrJotGKxcEIO6Cxd9uaoGuPF+2VGlQ2tCHvdv0qP4tBHPyw==
X-Received: by 2002:a05:620a:1929:b0:7a1:c40c:fc66 with SMTP id af79cd13be357-7b11a3b83c1mr179605785a.56.1728614259463;
        Thu, 10 Oct 2024 19:37:39 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200::786d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b1148dc6fcsm96695585a.38.2024.10.10.19.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 19:37:38 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v6 2/5] dt-bindings: media: camss: Add qcom,sdm670-camss
Date: Thu, 10 Oct 2024 22:37:27 -0400
Message-ID: <20241011023724.614584-9-mailingradian@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241011023724.614584-7-mailingradian@gmail.com>
References: <20241011023724.614584-7-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As found in the Pixel 3a, the Snapdragon 670 has a camera subsystem with
3 CSIDs and 3 VFEs (including 1 VFE lite). Add this camera subsystem to
the bindings.

Adapted from SC8280XP camera subsystem.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../bindings/media/qcom,sdm670-camss.yaml     | 318 ++++++++++++++++++
 1 file changed, 318 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
new file mode 100644
index 000000000000..670502532d28
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
@@ -0,0 +1,318 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SDM670 Camera Subsystem (CAMSS)
+
+maintainers:
+  - Richard Acayan <mailingradian@gmail.com>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,sdm670-camss
+
+  reg:
+    maxItems: 9
+
+  reg-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: vfe0
+      - const: vfe1
+      - const: vfe_lite
+
+  clocks:
+    maxItems: 22
+
+  clock-names:
+    items:
+      - const: gcc_camera_ahb
+      - const: gcc_camera_axi
+      - const: soc_ahb
+      - const: camnoc_axi
+      - const: cpas_ahb
+      - const: csi0
+      - const: csi1
+      - const: csi2
+      - const: csiphy0
+      - const: csiphy0_timer
+      - const: csiphy1
+      - const: csiphy1_timer
+      - const: csiphy2
+      - const: csiphy2_timer
+      - const: vfe0_axi
+      - const: vfe0
+      - const: vfe0_cphy_rx
+      - const: vfe1_axi
+      - const: vfe1
+      - const: vfe1_cphy_rx
+      - const: vfe_lite
+      - const: vfe_lite_cphy_rx
+
+  interrupts:
+    maxItems: 9
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: vfe0
+      - const: vfe1
+      - const: vfe_lite
+
+  iommus:
+    maxItems: 4
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - const: ife0
+      - const: ife1
+      - const: top
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data from CSIPHY0.
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
+            required:
+              - clock-lanes
+              - data-lanes
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data from CSIPHY1.
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
+            required:
+              - clock-lanes
+              - data-lanes
+
+      port@2:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data from CSIPHY2.
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
+            required:
+              - clock-lanes
+              - data-lanes
+
+  vdda-phy-supply:
+    description:
+      Phandle to a regulator supply to PHY core block.
+
+  vdda-pll-supply:
+    description:
+      Phandle to 1.8V regulator supply to PHY refclk pll block.
+
+required:
+  - reg
+  - reg-names
+  - clock-names
+  - clocks
+  - compatible
+  - interrupts
+  - interrupt-names
+  - iommus
+  - power-domains
+  - power-domain-names
+  - vdda-phy-supply
+  - vdda-pll-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,camcc-sdm845.h>
+    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        camss@ac65000 {
+            compatible = "qcom,sdm670-camss";
+
+            reg = <0 0x0acb3000 0 0x1000>,
+                  <0 0x0acba000 0 0x1000>,
+                  <0 0x0acc8000 0 0x1000>,
+                  <0 0x0ac65000 0 0x1000>,
+                  <0 0x0ac66000 0 0x1000>,
+                  <0 0x0ac67000 0 0x1000>,
+                  <0 0x0acaf000 0 0x4000>,
+                  <0 0x0acb6000 0 0x4000>,
+                  <0 0x0acc4000 0 0x4000>;
+            reg-names = "csid0",
+                        "csid1",
+                        "csid2",
+                        "csiphy0",
+                        "csiphy1",
+                        "csiphy2",
+                        "vfe0",
+                        "vfe1",
+                        "vfe_lite";
+
+            interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csiphy0",
+                              "csiphy1",
+                              "csiphy2",
+                              "vfe0",
+                              "vfe1",
+                              "vfe_lite";
+
+            clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+                     <&gcc GCC_CAMERA_AXI_CLK>,
+                     <&camcc CAM_CC_SOC_AHB_CLK>,
+                     <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+                     <&camcc CAM_CC_CPAS_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_0_CSID_CLK>,
+                     <&camcc CAM_CC_IFE_1_CSID_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+                     <&camcc CAM_CC_CSIPHY0_CLK>,
+                     <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY1_CLK>,
+                     <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY2_CLK>,
+                     <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+                     <&camcc CAM_CC_IFE_0_AXI_CLK>,
+                     <&camcc CAM_CC_IFE_0_CLK>,
+                     <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_1_AXI_CLK>,
+                     <&camcc CAM_CC_IFE_1_CLK>,
+                     <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>;
+            clock-names = "gcc_camera_ahb",
+                          "gcc_camera_axi",
+                          "soc_ahb",
+                          "camnoc_axi",
+                          "cpas_ahb",
+                          "csi0",
+                          "csi1",
+                          "csi2",
+                          "csiphy0",
+                          "csiphy0_timer",
+                          "csiphy1",
+                          "csiphy1_timer",
+                          "csiphy2",
+                          "csiphy2_timer",
+                          "vfe0_axi",
+                          "vfe0",
+                          "vfe0_cphy_rx",
+                          "vfe1_axi",
+                          "vfe1",
+                          "vfe1_cphy_rx",
+                          "vfe_lite",
+                          "vfe_lite_cphy_rx";
+
+            iommus = <&apps_smmu 0x808 0x0>,
+                     <&apps_smmu 0x810 0x8>,
+                     <&apps_smmu 0xc08 0x0>,
+                     <&apps_smmu 0xc10 0x8>;
+
+            power-domains = <&camcc IFE_0_GDSC>,
+                            <&camcc IFE_1_GDSC>,
+                            <&camcc TITAN_TOP_GDSC>;
+            power-domain-names = "ife0",
+                                 "ife1",
+                                 "top";
+
+            vdda-phy-supply = <&vreg_l1a_1p225>;
+            vdda-pll-supply = <&vreg_l8a_1p8>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    csiphy_ep0: endpoint {
+                        clock-lanes = <7>;
+                        data-lanes = <0 1 2 3>;
+                        remote-endpoint = <&front_sensor_ep>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.47.0


