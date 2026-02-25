Return-Path: <linux-media+bounces-53351-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEhhFVoOn2neYgQAu9opvQ
	(envelope-from <linux-media+bounces-53351-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 15:59:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E936F1991A0
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 15:59:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A4C5930349B9
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 14:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59CF43D413F;
	Wed, 25 Feb 2026 14:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u8dZZA1O"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455623D4122
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 14:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772031567; cv=none; b=XC1N6rSAIy5kUYg07dlyfYaRqvsXk/jKw4vKPKwKhT/DbTPRrB46nW1uwOadLZ4w1XW8YEGc5Qj0bFjqzQZxjDQq4aY96l8IX32CEDygbUm+gQ/3hl0an7fysEq3i9s49g2PTz4YVTSP5SWRo0qvDE8JdEtaiA2/txBOhevgwh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772031567; c=relaxed/simple;
	bh=Fb14ZMbHWSFCbI5l4Xnt+AafwH2WdWeazS5XcLdJBpU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lYgUO3JhQGnnZ2ZsAB3l6P6ELvSOXc89yfIwoq9gTX1CtOK0Plz25epibXVzXiydPeIySWyqTb7EvoqdWqfyGMw/JPSLslmQi6T/tIUDYNm1w76iR1FfoNycx3FnAzqToE6Shz2oDT4BBSGho96z1os7RxabAF8tmbmt0Iy4fno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u8dZZA1O; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-437711e9195so4616634f8f.1
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 06:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772031564; x=1772636364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lD5KPsmZFgAJkA+qIS4dUtEngpbV+kIY4VWOK3YvjjE=;
        b=u8dZZA1OakAqZyECx6HKmmrU0BO8OZWHQEBO1m1QCZclu1Tc4GqamkM3IcDUDNtmb7
         RWbMR/tIQWIRts7d7rFVuYS4lQVACQO1mfnVpvboFAerSgOOKSypzKfGiX6JQFee4Qb6
         rI4I54MiHIlHBmIaqZ36QWPMjAnsHo4pWRvMvB6lXfxMP4RXScM6VisqmJQHVVZHVnnL
         a04bxP+mcNymowcxl7vrCVGbNpLjmIflAe3s980p1tsCHss/0MtSwzBrgDv8E2tn3ref
         be5c/nn7qkq26vJRf3pm3wQkguWFgQPZjmN59HJyY9kMCYu+rl8tK2TTQ9+/euF6SX8t
         lHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772031564; x=1772636364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lD5KPsmZFgAJkA+qIS4dUtEngpbV+kIY4VWOK3YvjjE=;
        b=HdBxaOTIkUqdXU9si8Pt+wOg3MMcqHf/w/97IXcC+7Bc/x2SYqkezxykzCdMpyciCG
         mdaNMxHW5Vcv+JFYzp5JlF8MBz4cN/i3o/tayUaWqZjhzyk17K2JhQZz6tosDSF6buYq
         qtFvy47wg/08m5LgnwUuLrQ8/7zLK9ENK+zHfeLb0Dd6MeiqmmYDBjaE8m9Ynqvd/ze6
         JogIljdGAM4rEV40LdnnrGWEyzTQegtI+PrBgB4VqkHf3Pt4Pbc65qkwNaGPil6JCaXV
         /U/RiDosF1DcxgE6XSbBvZQev468m5S8azISqvAk0kyIsqxOg7M04oFLODA7tirezhR9
         90Ng==
X-Forwarded-Encrypted: i=1; AJvYcCUAL7n9JBgbtWLavHCQGEmOdQesKS62m84rt/5M0Gk+7P2QCiGv5o8yWV0ndRuMTD1LDz5KuGeIVRup3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy83ihn5CGBiooDaeMDKEloGCDzncqzrRrMRLB3ElTqgz/bZB6P
	5TF012Vuupuv+lrBh6+hmCKI/UU1IpLiVbCfmMqDz6m5d/5XQC4c+eUCz+ySrMKog2o=
X-Gm-Gg: ATEYQzzuazMdkc1bOvpiO1EA44wbY1DI0qnI8yBtkzxr3Cg77tPbRO00NpI4Crt+39l
	oZutDz4M/mnlEENoBn0//tCZTbD9ksGOiVdbUJIXH/x4Y+lXN4TbEmt8PN714BBniLnfrE6/BH6
	96eY1CXL47bjLhh8ZVBikvGzux4pXkkf+IdI9pBQQRu7eF175Pqr73VbWlW/g4kj1u4AcnTpXLZ
	COhyZaF7stpn8pC6YY4y/C7R+YA4/417lt9lAdbWWINoVnouAM3tmz+78ri7A7RFcx0Q1fhx7bD
	n47bg0W9uwEB0XSW6EUGM3MpdXDe+1csqq08NzMzqmrdR8MrcfpkMBUJCRA4GPoqj7qAl9CTEiy
	WiyVk9LTeuuKuTIHCduPWe/Xap4eczYSCnesHhUl05iY9QITSGRvwdqwHvGPBWCE8TlYOby0o42
	ujc3I04rT/E8jj2xh3xXzKVsLS5S0A8KVp9jJBCh2XoIo9ab4Bmj/fcHYkQdvVG0Oc
X-Received: by 2002:a05:6000:2288:b0:436:d824:620b with SMTP id ffacd0b85a97d-4396f19e239mr27927106f8f.39.1772031564504;
        Wed, 25 Feb 2026 06:59:24 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3fc12sm32445600f8f.24.2026.02.25.06.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 06:59:23 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 25 Feb 2026 14:59:12 +0000
Subject: [PATCH v2 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-x1e-csi2-phy-v2-1-7756edb67ea9@linaro.org>
References: <20260225-x1e-csi2-phy-v2-0-7756edb67ea9@linaro.org>
In-Reply-To: <20260225-x1e-csi2-phy-v2-0-7756edb67ea9@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4179;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=Fb14ZMbHWSFCbI5l4Xnt+AafwH2WdWeazS5XcLdJBpU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpnw5KQp00QBm1YfmKi8Vnt75xPXqZLRcezK6mA
 cnFmoYNfzyJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaZ8OSgAKCRAicTuzoY3I
 OieiD/43WKOywRAOYv7f9nhA9QwcmaDbv+zwkgk3wp3uuFyL5HIpvv2wpMRbX4y1XGE78oZr0m2
 vzKzCuReM6ITwwln0eMYDrggcAOIHe43YvBmN0pP8dcQBhLf8NQw1FeTTBr6uXgqJtb2dwT5N0s
 OqVm4t3Oz76t+QigA7I3l7kJl7nZB7/wOygvvjKNGcl0BhqiLuKQhKh6NOwqMK+K8OxlMfzIWRm
 66/5q7b7PmR+W4VEf5HSiyfiwS4cqppKAReoHcxDua1dMOfT8RHewQMm4RYVMx0mdJdrGIi4fMe
 GiOE+A3yet91W3WnLPVFIuGCDFxGL5mCp3sTuzchC/wT/sW6gXhHmEhyvhIpiaVaM61ff1Jd3iO
 1bDy6OMoA5EwLv6sklQO+4tLTyBMcaeRPlkniXg05Y20D8U/W4gcct6lVz1pXgQgwQqbD5nv0CP
 uLnE7N/qZc4dPh461Ii8qekDUCIBfc1/qjfDwzPXAwXlCb0CCH26tZBuu6p9LM0/nhc4f2UKWuX
 kBvIzYU1lPYkhTudfZlSlOz7gTGQy37n9TK+GToQ+l+ERG1uIERlMWr3wBzZd0ouxIaSL/LSEx8
 0RZmxE2hR2MTP6kmSQ1BDugtJHlfOLBNo+CGGCzwQbB6ZDVxJqDvMvIqcuwYwz2p9373I0rbRLh
 x2xwN4gV0D4Pwxg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-53351-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ace4000:email]
X-Rspamd-Queue-Id: E936F1991A0
X-Rspamd-Action: no action

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
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 114 +++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
new file mode 100644
index 0000000000000..c937d26ccbda9
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm CSI2 PHY
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
+    const: qcom,x1e80100-csi2-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 1
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: csiphy
+      - const: csiphy_timer
+      - const: camnoc_axi
+      - const: cpas_ahb
+
+  interrupts:
+    maxItems: 1
+
+  operating-points-v2:
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
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - clocks
+  - clock-names
+  - interrupts
+  - operating-points-v2
+  - power-domains
+  - vdda-0p8-supply
+  - vdda-1p2-supply
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
+    csiphy@ace4000 {
+        compatible = "qcom,x1e80100-csi2-phy";
+        reg = <0x0ace4000 0x2000>;
+        #phy-cells = <1>;
+
+        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+                 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+                 <&camcc CAM_CC_CPAS_AHB_CLK>;
+        clock-names = "csiphy",
+                      "csiphy_timer",
+                      "camnoc_axi",
+                      "cpas_ahb";
+
+        operating-points-v2 = <&csiphy_opp_table>;
+
+        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+        vdda-0p8-supply = <&vreg_l2c_0p8>;
+        vdda-1p2-supply = <&vreg_l1c_1p2>;
+    };
+
+    csiphy_opp_table: opp-table-csiphy {
+        compatible = "operating-points-v2";
+
+        opp-300000000 {
+            opp-hz = /bits/ 64 <300000000>;
+            required-opps = <&rpmhpd_opp_low_svs_d1>;
+        };
+
+        opp-400000000 {
+            opp-hz = /bits/ 64 <400000000>;
+            required-opps = <&rpmhpd_opp_low_svs>;
+        };
+
+        opp-480000000 {
+            opp-hz = /bits/ 64 <480000000>;
+            required-opps = <&rpmhpd_opp_low_svs>;
+        };
+    };

-- 
2.52.0


