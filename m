Return-Path: <linux-media+bounces-37335-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C92CB0085C
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 18:17:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EECD256238C
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 16:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBDC62EFDB6;
	Thu, 10 Jul 2025 16:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e8JK/p+I"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AE82EF9DE
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 16:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752164215; cv=none; b=RRduBU0HnEFh1HQ6k5P/CWGehdh7NzDFFOQUUG8HeXZQY7KTCpyNdedzC9Y/OYEUEX6+DouagrmFf0ga04OVSajKO8wDWBX72HRSV8tXTjT5TvoigPQRzdjXO3l0dpFVHx67RIivjuvir0a5/93lZkFyMT7JcgR6Ti3vhnN+bL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752164215; c=relaxed/simple;
	bh=HOT48a7/uT4n+IMuvJCTkT0/9nEsUgWiQfrXy/kbu4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kvsb7Jhw7YxNr++xiUi8n1EwNUv3BEwKrUPzYribgx5JBoHcGlf1Y9+hzm0tnGVMtg3N8xLi/AeVTTsUby9LtNaCA6FYiq9C/QBVgaPC0oPL3Q2KnfyzzqNoBIOQYRHwuG/wvvzFO+oVy+KPBnDGBWyNb9I/MDb+RnMzsh4uxIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e8JK/p+I; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-3a6e2d85705so817064f8f.0
        for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 09:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752164211; x=1752769011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W98cduZ8q95/8eo1XZtn+h0kJ2XPBTmKn3mkeitD7qM=;
        b=e8JK/p+IwPMPDIBHtRWAQ9tgJkmopCNl/OhiSxSNQVnDVjCmY8To1GMjBnHe7ZKM7C
         tY/pXUEQd+Hta10PpRIp0ya/G88UjeWExiFcGVaOSHByRLIbqUo9lPTPP2OFXpXbDhOf
         hj5TxwDfTR9lrdJjjlCrkHVCT3Zb14r6AoajCYpMkyiI/7ra/9h2Q4fXx69+FLVfE1dT
         O/pTAEx6Lue0ecKEEGuIv7Itiaa/9OI8lJRl9RrfPP68YhWSR07sZEoigPDxwDFkuzLx
         v/nooOC+thUXNVdWHo+aGk+DPMmVkyzGSXhjjcvsQ7+cJg6sifxo4H3Lt2Dg/sgAALwm
         my0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752164211; x=1752769011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W98cduZ8q95/8eo1XZtn+h0kJ2XPBTmKn3mkeitD7qM=;
        b=F1yUdeRud9MBwAfohzPooBWB+OCmxV33Cs2r1AGYHM5ZnioEd0ZpHgPWzkjVEvGrO9
         2BF9KY4qq5iylOzBVDkte4/b+7lsltoPENTEtri2BRlDSy7js+7ou0wpIwQvrlqzbIol
         wWC826+7aD1fboq3KcbjbNxUD/BPY2jNoGgqtOjux3+i9gAq85nESVV4XRdbvhTa0VhX
         bfKKYkSekXL/PWkw8t81IuJdPeWC9SPtwPXnUFrNUKlD2CjxkSeYZs9F/+V8AjaJZIlV
         Tcu2pCZ7PboPlV0ykxXUCszrWin6uWcYpt/2JeVBQbU3M/YenLrfMv5upJNE5pdeME79
         1gSg==
X-Forwarded-Encrypted: i=1; AJvYcCUMZv0JR9QmJHQpfZLXNtb0V2cJk2a6LNr/mMwnvJ7NgFGxXbi586n7GXlPeUuxo73YSKMIXKFCmFz76A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3WvIr8xLvKdfSuwwgIq9GuLWhx8HydCe6/kYSAO1KO/L9r/3K
	J2qU951onO49VadqKxK0uR1ax9aUOhkqYOFEsyxTtzGD1r6nluELF6iJbeSPwzzgaYoxfSN6xvH
	g6RGw6w0rEj8I
X-Gm-Gg: ASbGncuoqeP0elJie0m/nQm8Atn5Qua6lcwD/wc46G2oK1/wTy8ZLjauM8mnO6Uv9W8
	IwpI20/HxBdnIPFYWrR79otszNDwbDKfwgJXkL6MIM3BmSNBlQXtLNqQpgiDKNNgvQyWcyVZhDR
	MvGM6XD+YWLAjjbOr6tTaKhlcjO4bFrXTeUR9plT0YezWkHmxbFPnIKsqAONQIXxFc6B5Pd4wYQ
	Lu2yx1BwYj1jiiWxGdTrLchH6JaDvWAl8wWdiKz1OTaLAkx7vphbGjPp/TUEGxuiAK33E+lyNFm
	godrYE1XQF7yOpVZYaegEzpt7tIZsnpu4KF/NZSwqXuAvRWikWgv3P8D4L8caKuYGHtiIbTYIrQ
	tJQFcyx+epmMuk2eNiVs6OXtuoOVY
X-Google-Smtp-Source: AGHT+IFnrwx5VtuT8iHuPsHxEkalQ5fZHKLoiBAE1Q6F/5Gk3QOaI1+P86OhIKYr1hegftM8ANRKpA==
X-Received: by 2002:a05:6000:2a82:b0:3a0:7d27:f076 with SMTP id ffacd0b85a97d-3b5f18568damr121464f8f.2.1752164211409;
        Thu, 10 Jul 2025 09:16:51 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc22a8sm2314207f8f.34.2025.07.10.09.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:16:50 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 10 Jul 2025 17:16:47 +0100
Subject: [PATCH 1/2] dt-bindings: phy: qcom: Add MIPI CSI2 C-PHY/DPHY Combo
 schema
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-x1e-csi2-phy-v1-1-74acbb5b162b@linaro.org>
References: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
In-Reply-To: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3812;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=HOT48a7/uT4n+IMuvJCTkT0/9nEsUgWiQfrXy/kbu4o=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBob+dwMUP9jabCc+Hi4S+OrOIOQLiXUzUSZKiPt
 zGXVYjadDiJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaG/ncAAKCRAicTuzoY3I
 OrUQD/9BpeLDdZEriwxjmYz9Y69EsGqSwv6ViA3pz213jfQqX/OvrbV2Cu8Jz4l3mSlmFNVzK5k
 OQAuJG/3tsApwgszwugretk4N0MX/P3vgRlojTEmzMUFmcHDCqEbKZA4+vRL+wEfLq41QaiKoGw
 1lO7C/717Clf8UyqsH742tWuJzXXF2ZMM19VhqqgKQf711BTBn07M44AJfWLAbltNMvVRCSn4eC
 rApYw1J2y16+WndJLZxpG4H59gmzdk0YpopBUxCJhgyBrIm67y0jaDhCVc8bksovdYvP7qkgOnu
 bksak61CQBtgDltQOZEpMWXxYgPfxbPducI8o9uBS++tV7+p8LAmBk2HgwYx5QRQIXgW9EZl8NJ
 6/0er6fiut+qV58YB1Sc9prNR+v2ATYOEqkTskXAafNWB/DwZYGUW3dJqlPkMSZkMbYJ17atylX
 IInN5EnBhjbvB6CnreslENpjt2OBDi9rfA6nixmsHpZZ262bL+SDVHGxk7YUJysov+7JHeBT/n/
 jkDhwQtlnF8LCNP6Z6NVWvwrNJpnd/qnKCQRZN1oWPRdLzq47mCKdK+Vabaon1AA8N4nZzaRqgL
 GtCp3lvtye8welxgqQLl725rOtlrGettsQ1PTOBgXmiqAjOBOmO2l5eJj9Q6JosGLOIMemjRyvL
 s1xK9DcyW7YduvA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
PHY devices.

The hardware can support both C-PHY and D-PHY modes. The CSIPHY devices
have their own pinouts on the SoC as well as their own individual voltage
rails.

The need to model voltage rails on a per-PHY basis leads us to define
CSIPHY devices as individual nodes.

Two nice outcomes in terms of schema and DT arise from this change.

1. The ability to define on a per-PHY basis voltage rails.
2. The ability to require those voltage.

We have had a complete bodge upstream for this where a single set of
voltage rail for all CSIPHYs has been buried inside of CAMSS.

Much like the I2C bus which is dedicated to Camera sensors - the CCI bus in
CAMSS parlance, the CSIPHY devices should be individually modelled.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../phy/qcom,x1e80100-mipi-csi2-combo-phy.yaml     | 95 ++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-mipi-csi2-combo-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-mipi-csi2-combo-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e0976f012516452ae3632ff4732620b5c5402d3b
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-mipi-csi2-combo-phy.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,x1e80100-mipi-csi2-combo-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm MIPI CSI2 Combo PHY
+
+maintainers:
+  - Bryan O'Donoghue <bod@kernel.org>
+
+description:
+  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI CSI2 sensors
+  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and D-PHY
+  modes.
+
+properties:
+  compatible:
+    const: qcom,x1e80100-mipi-csi2-combo-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: camnoc_axi
+      - const: cpas_ahb
+      - const: csiphy
+      - const: csiphy_timer
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  vdda-0p8-supply:
+    description: Phandle to a 0.8V regulator supply to a PHY.
+
+  vdda-1p2-supply:
+    description: Phandle to 1.2V regulator supply to a PHY.
+
+  phy-type:
+    description: D-PHY or C-PHY mode
+    enum: [ 10, 11 ]
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - clocks
+  - clock-names
+  - vdda-0p8-supply
+  - vdda-1p2-supply
+  - phy-type
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
+    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
+    #include <dt-bindings/phy/phy.h>
+
+    csiphy0: csiphy@ace4000 {
+        compatible = "qcom,x1e80100-mipi-csi2-combo-phy";
+        reg = <0x0ace4000 0x2000>;
+        #phy-cells = <0>;
+
+        clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+                 <&camcc CAM_CC_CPAS_AHB_CLK>,
+                 <&camcc CAM_CC_CSIPHY0_CLK>,
+                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
+        clock-names = "camnoc_axi",
+                      "cpas_ahb",
+                      "csiphy",
+                      "csiphy_timer";
+
+        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+        vdda-0p8-supply = <&vreg_l2c_0p8>;
+        vdda-1p2-supply = <&vreg_l1c_1p2>;
+
+        phy-type = <PHY_TYPE_DPHY>;
+    };

-- 
2.49.0


