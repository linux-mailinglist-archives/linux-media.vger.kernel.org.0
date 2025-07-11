Return-Path: <linux-media+bounces-37488-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CD0B01C87
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 14:59:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D061C7BCF4A
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 12:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59872D46D5;
	Fri, 11 Jul 2025 12:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UWKEDGPz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5E02D3215
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 12:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752238687; cv=none; b=HpQyhWypFmP52c2cIDkFG1HxyOyQqHxaJz5Zyjc44pMQhPhkOp8HTzXV2prLLdjl7nF/ZTyEo4GtJcGJXggT+QQrhM9Mg3WhcnTuO9cdErTxLY7brOljFRMM8oF/plaNPKewMUrUYPohdT/3IX1K88VOhuiOVRsoWxEO3dEfPzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752238687; c=relaxed/simple;
	bh=5gV/Pwg1WP+ZZILJzt3fi0xEnri4ukNILoHO+6sJ6I4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DoAx7ib8Yuzm5PfkHQjVDimtCX3BAI9gKPZXTURVONa3gPTV2ZmBeJtgrgQpQ3dm0Vs4T7s9SRMfhOAyCG43j+wy3gHg+HjOcMA1r5iMOTNBVBcXbuhbKXZjCpdGTpg4Q/I4Dhg4Htfc73fe3sJ0uQvUrzBdVbzBE0po3xVyM5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UWKEDGPz; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a54700a46eso1333059f8f.1
        for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 05:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752238682; x=1752843482; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JkUr4CGEFUQkYRmGivVe3aB7iO026zPS12jaFJau+Cw=;
        b=UWKEDGPzs1KCdumbySFkJY2rMywXY+ytv9zT1AwvNa3ulXzbvSd/vgkzWHcdPSVlDB
         Fr81fyDZ/1dLUEh4IfCoIfqWYLBW8u7N9mKPixAwZ1OGgty6+zmfgyH7CI+W19h84wFI
         GJEwbkYgg8a1CKeVaqChp9FHqD5V07ezFWapOqIWbuOoh/Y7J6ZhGKsk93kH/0I84Dsq
         DdvwokETAf9PhEajdkCSybIVBZrvoemdfsQBxVOnWJBLPM40o0Nq1756hWmmqZUuhYQ6
         DMaX6i0rdmUQ+IW/LK1kKqZM4kcKUBnaOKonmkOCTbzkJ2lVY6Qld7KdLay/XokoyAx8
         tI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752238682; x=1752843482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JkUr4CGEFUQkYRmGivVe3aB7iO026zPS12jaFJau+Cw=;
        b=l30+mncChscKo7f67UcQmHCwIzUkX+yPVzvz5WvxZdA9j3nUnDhOl4NkRK1bkflw3H
         yJoke5S5W/JEsYom1DqNs+aVft0jki4FdUEXr8EqiWHo7J2lH/q63NNQoKEHkdJJdUK+
         8Z5RUMZakOFV76mhnOYxLtqDeThrnlxUKQ3rT4pxnru4sVeHeuqfz+dGPeMyapnlwFNg
         5q2J9s67ch626BzRbGKRC/5VYHr92VnalZY2vYYq5whbjL7AOsBeyAw2DyvGb0jhCJaC
         JkTqXMZUppazDcUpKqzgrA4yYcYLnNo9NvkWC/bU3wvivrT2hCxjRCm3f2penTXo1n4x
         vcBA==
X-Forwarded-Encrypted: i=1; AJvYcCXhoQHwsIfaHAof+5ZCkA4M95LXm24uRXm5eVBLDR31YEQDOgHhhzpYTvN63Bf9C6EUckjjnlVBzREA0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7xUa3kebbTU2OFpYVI9yO3q6TPtIGDiU9L+ePlQEYXy2psQKG
	o3fGSO7oLooih5wd6rzVDlLqg8Nh/n5Mby+tG3hGqDYNS26EgXcBUL0CLiip8l2xQYU=
X-Gm-Gg: ASbGncsIPAnJr9iyU6hWEyPL58KTA0NQ4U+Kby5w5Pw27rE7xo9DA0L9Z/hU9u3cTzV
	UCQQ9iM669Aav3PXcdCqbrnl0x9uZJ3eB0ZdfRIA3Bzlbgmn2Ua8al5A8S/b+DW9xlbZHinkz9I
	y0CcmghRyoklwqEL73Bs5TdQqeSLIXbZagQol4CefkSx/AJTU/Hl4F4bvFi78tEvlPwb3QOUf7M
	7u6huaiq6yQQG3fFNSbNh7Mon6WZTBDr350qdI+C1RguG54M3BgHDEdvZHM+J27vgTa7DaKe2M/
	B+KmzyV1qh6rOI+IFJ5pSVJe56dA6ZqYZNKCL6Kc2Lg8JkjAn+aBZqV6XzylHRIy//JI/Y8g4Vo
	sjATQF8KIptomteJaGxMpl6tXuwg+TNs6Vp3+WJhi2S+/6XubZlOFopCtwSwF286D
X-Google-Smtp-Source: AGHT+IGcQTpuyD1+OjKXfLSy343mJnTIdFl+2rVUM9fSCtV0mrtcrWkbOJTUTiN4BGnL3emlOBR7CQ==
X-Received: by 2002:a05:6000:4412:b0:3a6:d145:e2cc with SMTP id ffacd0b85a97d-3b5f187e927mr2077584f8f.15.1752238682076;
        Fri, 11 Jul 2025 05:58:02 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc1f70sm4373648f8f.27.2025.07.11.05.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 05:58:01 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 11 Jul 2025 13:57:54 +0100
Subject: [PATCH v7 02/15] dt-bindings: media: qcom,x1e80100-camss: Convert
 from inline PHY definitions to PHY handles
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-2-0bc5da82f526@linaro.org>
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
In-Reply-To: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8032;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=5gV/Pwg1WP+ZZILJzt3fi0xEnri4ukNILoHO+6sJ6I4=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBocQpSlGQ68k1c1n3/pDUm2g4dycogVyIVjOB6y
 1NLaf0nYJ+JAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaHEKUgAKCRAicTuzoY3I
 Om82EACBuKGAY/JgbJMmDmVaH2Rh8pL8YMvj9ofNzHmskTZtDg689vihLFJd0La1Jue4cufIwbJ
 ANlYFJSFB4faOegzSJx903gPuxv9i4FeC/NcpgN9b0u7OL/n8r4N7XOkXfjtzp4R48CoR6UoBUL
 UoxgGSbYQ/6MjAixE/oHDa4eLtc8kr3smvviYE0O7PXcbfwbpyy7qmQc8bcqFJdqB83yqwUi3Wx
 HCSpOmrOQFTlalutJbSdIHroTvH344929cMXtxv8F4MgOoh5zUL+reKft8PI049vpviCYE0iUe2
 AXGm6+2QmvTankttf106TgXTsxlp//iRg5m1S/tnPD8f7CvxQkGWgpbwbQ3S6sANZHHgFOpSBNo
 COcp6l52FkLBX/uN5e0BoVjIn1GGBxHTlKfR9vdsjjb0PSmi30vDtBzkHKH5E2tUPvxytqi/9Se
 +Y/iLF2wxYy4zSexSvLaV8H27w/zTXqDbBobmdwbJ1qEqrEqXO8BzdcqmTSxS/3QInbyJpkfN3a
 CBSOgEP54Xw16hKHQ2RcNQ9b2R9jSHZY0WVvwDNu4fSfZ3bZOXKb3VESMVwPFirkvEgxunzXApq
 3f4Z7Jxpk6kXsdlVKtRHiZjDH2NSYMFg0lwWoRvGC4FkSOy6TtAF5VkL1JPqin3g81UcWtosFLN
 G6IS7HvHR36DIHw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

We currently do not have an upstream user of the x1e CAMSS schema which
allows us to make this the first platform to treat the CSI PHYs as separate
devices in much the same way as we treat the CCI block as separate devices.

Convert the embedded CSIPHY node data to simple phys = <> removing all of
the PHY specific stuff previously embedded.

I gave some serious thought to making the Test Pattern Generators TPGs into
PHY nodes also but, unlike the CSIPHYs the TPGs have no dedicated external
pins nor regulators.

The CSIPHYs OTOH have dedicated in-fact generally unmuxed pins on Qualcomm
SoCs and each CSIPHY has its own set of input power rails usually 0p8 and
1p2.

Instead of defining the CSIPHYs as children of the CAMSS block, we take the
same approach as the CCI/I2C bus dedicated to CAMSS and define the CSIPHYs
as their own nodes.

Remove the embedded CSIPHY specific data and give CAMSS regular,
bog-standard phys = <>;

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,x1e80100-camss.yaml        | 80 +++++-----------------
 1 file changed, 16 insertions(+), 64 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 2438e08b894f4a3dc577cee4ab85184a3d7232b0..c130733887e39afe51f3d2df2a5c943c6fc2ca9f 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -17,7 +17,7 @@ properties:
     const: qcom,x1e80100-camss
 
   reg:
-    maxItems: 17
+    maxItems: 13
 
   reg-names:
     items:
@@ -27,10 +27,6 @@ properties:
       - const: csid2
       - const: csid_lite0
       - const: csid_lite1
-      - const: csiphy0
-      - const: csiphy1
-      - const: csiphy2
-      - const: csiphy4
       - const: csitpg0
       - const: csitpg1
       - const: csitpg2
@@ -40,7 +36,7 @@ properties:
       - const: vfe_lite1
 
   clocks:
-    maxItems: 29
+    maxItems: 21
 
   clock-names:
     items:
@@ -55,14 +51,6 @@ properties:
       - const: cphy_rx_clk_src
       - const: csid
       - const: csid_csiphy_rx
-      - const: csiphy0
-      - const: csiphy0_timer
-      - const: csiphy1
-      - const: csiphy1_timer
-      - const: csiphy2
-      - const: csiphy2_timer
-      - const: csiphy4
-      - const: csiphy4_timer
       - const: gcc_axi_hf
       - const: gcc_axi_sf
       - const: vfe0
@@ -75,7 +63,7 @@ properties:
       - const: vfe_lite_csid
 
   interrupts:
-    maxItems: 13
+    maxItems: 9
 
   interrupt-names:
     items:
@@ -84,15 +72,17 @@ properties:
       - const: csid2
       - const: csid_lite0
       - const: csid_lite1
-      - const: csiphy0
-      - const: csiphy1
-      - const: csiphy2
-      - const: csiphy4
       - const: vfe0
       - const: vfe1
       - const: vfe_lite0
       - const: vfe_lite1
 
+  phys:
+    maxItems: 4
+
+  phy-names:
+    maxItems: 4
+
   interconnects:
     maxItems: 4
 
@@ -118,14 +108,6 @@ properties:
       - const: ife1
       - const: top
 
-  vdd-csiphy-0p8-supply:
-    description:
-      Phandle to a 0.8V regulator supply to a PHY.
-
-  vdd-csiphy-1p2-supply:
-    description:
-      Phandle to 1.8V regulator supply to a PHY.
-
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -166,13 +148,13 @@ required:
   - clock-names
   - interrupts
   - interrupt-names
+  - phys
+  - phy-names
   - interconnects
   - interconnect-names
   - iommus
   - power-domains
   - power-domain-names
-  - vdd-csiphy-0p8-supply
-  - vdd-csiphy-1p2-supply
   - ports
 
 additionalProperties: false
@@ -199,10 +181,6 @@ examples:
                   <0 0x0acbb000 0 0x2000>,
                   <0 0x0acc6000 0 0x1000>,
                   <0 0x0acca000 0 0x1000>,
-                  <0 0x0ace4000 0 0x1000>,
-                  <0 0x0ace6000 0 0x1000>,
-                  <0 0x0ace8000 0 0x1000>,
-                  <0 0x0acec000 0 0x4000>,
                   <0 0x0acf6000 0 0x1000>,
                   <0 0x0acf7000 0 0x1000>,
                   <0 0x0acf8000 0 0x1000>,
@@ -217,10 +195,6 @@ examples:
                         "csid2",
                         "csid_lite0",
                         "csid_lite1",
-                        "csiphy0",
-                        "csiphy1",
-                        "csiphy2",
-                        "csiphy4",
                         "csitpg0",
                         "csitpg1",
                         "csitpg2",
@@ -240,14 +214,6 @@ examples:
                      <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
                      <&camcc CAM_CC_CSID_CLK>,
                      <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
-                     <&camcc CAM_CC_CSIPHY0_CLK>,
-                     <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
-                     <&camcc CAM_CC_CSIPHY1_CLK>,
-                     <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
-                     <&camcc CAM_CC_CSIPHY2_CLK>,
-                     <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
-                     <&camcc CAM_CC_CSIPHY4_CLK>,
-                     <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
                      <&gcc GCC_CAMERA_HF_AXI_CLK>,
                      <&gcc GCC_CAMERA_SF_AXI_CLK>,
                      <&camcc CAM_CC_IFE_0_CLK>,
@@ -270,14 +236,6 @@ examples:
                           "cphy_rx_clk_src",
                           "csid",
                           "csid_csiphy_rx",
-                          "csiphy0",
-                          "csiphy0_timer",
-                          "csiphy1",
-                          "csiphy1_timer",
-                          "csiphy2",
-                          "csiphy2_timer",
-                          "csiphy4",
-                          "csiphy4_timer",
                           "gcc_axi_hf",
                           "gcc_axi_sf",
                           "vfe0",
@@ -294,10 +252,6 @@ examples:
                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
                         <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
                         <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
@@ -308,15 +262,16 @@ examples:
                               "csid2",
                               "csid_lite0",
                               "csid_lite1",
-                              "csiphy0",
-                              "csiphy1",
-                              "csiphy2",
-                              "csiphy4",
                               "vfe0",
                               "vfe1",
                               "vfe_lite0",
                               "vfe_lite1";
 
+            phys = <&csiphy0>, <&csiphy1>,
+                   <&csiphy2>, <&csiphy4>;
+            phy-names = "csiphy0", "csiphy1",
+                        "csiphy2", "csiphy4";
+
             interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
                              &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
                             <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
@@ -348,9 +303,6 @@ examples:
                                  "ife1",
                                  "top";
 
-            vdd-csiphy-0p8-supply = <&csiphy_0p8_supply>;
-            vdd-csiphy-1p2-supply = <&csiphy_1p2_supply>;
-
             ports {
                 #address-cells = <1>;
                 #size-cells = <0>;

-- 
2.49.0


