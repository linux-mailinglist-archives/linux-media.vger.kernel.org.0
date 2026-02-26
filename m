Return-Path: <linux-media+bounces-53494-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOc5NEs+oGmrhAQAu9opvQ
	(envelope-from <linux-media+bounces-53494-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 13:36:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 396B31A5C41
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 13:36:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 913B431045EB
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 12:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D623815EF;
	Thu, 26 Feb 2026 12:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nhmeTF7s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DADD33B94B
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 12:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772109273; cv=none; b=gUMGVtPTDzCdVG1zzTredpSCoH40XdhHNf+vjT+2KZVsbP8/igDmYmJNjUhmZJ/v7f2DXzqX7wxbVjqozNce9HnmxJF0ukK8m4hKYelO7BGNxBGATbOu5gIhApHXUroYi1WnWH6uBIWL2t6idevnPEhMtqt49FkgqpCkaNhOPqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772109273; c=relaxed/simple;
	bh=Fb14ZMbHWSFCbI5l4Xnt+AafwH2WdWeazS5XcLdJBpU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i+7lftH4gvVgeBK3rIJ5IcOR/AtNwMmpDLuRnyQFMPPYCoVrYAl/INBBI9Ro4sv+bvxRTkAb0oLtAnhVTTZJCJlO9FLHTYcQREwc1bXbKfnS9jnFlVts4ZjbdWRxyKEv7MHGGNAlj/iwscC+klQWHi4PCMFDTE1zW85UxLQsahs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nhmeTF7s; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-436356740e6so843983f8f.2
        for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 04:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772109269; x=1772714069; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lD5KPsmZFgAJkA+qIS4dUtEngpbV+kIY4VWOK3YvjjE=;
        b=nhmeTF7s+VIRTEmh0Q9hYGs20ut0Po6s9KLxpUxTGqXmu22CW5DLAepfeL4TXl0ovC
         kVz6iAFVMrrmE+p+e6vtJl93XN/aIMS8OW8AgtX2bywzHqXAFCEXEEXaFqlmPgLxvbJ9
         fLjvyvpjDmxh2XYNbqeBVpHLBr4JwKKOSguTcJtPqVJGwipxmrxYQtwN92LOEv5Oe7sN
         8L43sgR98/o3igLdKrTQgfNpGlBibXBZRniIbweBpG6A/80PBlBkcJLWBOUNzF+CjRPe
         bDp1DJZNEe+nUxw3dCgAbqbj8Rsa3Pb7+1GHkVCfMtVx2zNbwmNSjHpMNqJZV90n2snT
         qG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772109269; x=1772714069;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lD5KPsmZFgAJkA+qIS4dUtEngpbV+kIY4VWOK3YvjjE=;
        b=H0tdqpm0z7dBaV4jET7RR8L8b5a5JEabx9V8VmRSjCdNdJ0OEPxAYv3Od4c6l4O2R3
         V2ULCEEH40te5UAK1aKpSOoWQQq7JP0rsBqDaZ1KqQAsYmzgD8pR6jQCJYwIg1L9MAio
         Xem02M1J1HzR5/mRUmaX8pyRAbZlLZRv05NyS52O55oS7TNm2pHmgtt+BA3r+JUdkoWx
         i+Jo7jLsQhMOym4OoY00kB2YBunUY263Q0y6Oq9LHACyp6KYpScVGoOFO8rQ4X3ITmBw
         r5TgXz3Tgkn8cYkfRjXDEdWsc+FP2eEMrcmiwAs2Q9EO+uVSQsYCHV1eyZwKrbz2FSQt
         WskQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYXSwF6B4GTVPlTix/ekdSlN4HR4tN+Wj/wDjtLxjWwyLjmNuEzQ06nhOwIlNR7G8oFVEbWNSw55tnTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz42//xHjWvACHNbqzLkTH71bZvpB2zFVOkRzMkeT3J8Hx5ZSBF
	DSigXdlZ5Lvl3IENiU42TFOlCORRMKiLgqDdqbWLUtcGlVTSOlayPMmm1rvK4GV4dsE=
X-Gm-Gg: ATEYQzyKqyrOC8khSkYrkxlGjVt4IsOS6IXfLWnBAZK8es5+eIbqYHDfu6egGcHUavG
	jvM+iJJB3GOk3yVJaz4f3Yu5nt+r0r2hZpknE9QrLdw1rJdGu/CT7d+S0AMwXWMC7BezgR5KLz+
	c4QYypVilhv9bXe3To9cOeDAypagyAskAfZmvPbHj9arIJ7GnGuPsrdPATbiHKA0NjjyMIS+mPT
	dj1A9jgR6EeP7pPatTJqtG6T0UuI4wtiIg6cm34c3xWpLgWQSAfIZkwzO1mI9qQ1SeLfdBn5XcZ
	hijlHUYecRfrFuWYJMa3DS522OQDaZBzn4xnKM0ovYYwA4YyJ5S3cDC/dG7NjHO8v8BDWlLvEvv
	rqgbMYfR/Zx+eCiV1eEPmyP0xnMvML/QMfzQ/Og1WUTOI5ZQ7xCKCc41sqG7bg8OD3SGwinx+I+
	BsHcv8md9yjOPNA/R79LLpzCu2zMruMP8gPYa7mO7tgkXMkyKjjoiODinNH+YDs6zj
X-Received: by 2002:a05:6000:25c3:b0:439:704a:9838 with SMTP id ffacd0b85a97d-439942a422fmr7535125f8f.19.1772109268652;
        Thu, 26 Feb 2026 04:34:28 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d40004sm40800663f8f.21.2026.02.26.04.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 04:34:27 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Feb 2026 12:34:25 +0000
Subject: [PATCH v3 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-x1e-csi2-phy-v3-1-11e608759410@linaro.org>
References: <20260226-x1e-csi2-phy-v3-0-11e608759410@linaro.org>
In-Reply-To: <20260226-x1e-csi2-phy-v3-0-11e608759410@linaro.org>
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
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpoD3UAtH5OWrfI2Nzrg61AauaeQ+EKtK0s9CRd
 kFZkDKQz5iJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaaA91AAKCRAicTuzoY3I
 Ooc3EACde/1mls/OZ5YIwdSIyNFbLxLe5xeEYl95RXJBrTSIZdPMcNOq1M7juovHYI2ium70DLp
 Cw32/JoAWQHmfsJbxP4oD+602/FOCAj6RY6K6vK8Q+ToMZRcPzLrObmIrUZnvbfFJXuyk109z3K
 wht2iAsbOxuoRIlXMhZFBxjY2hLztnkOplXlU+Z2g+KPvHbzC1B0XIRjjmkBcAucxm2VQC1TxYR
 dp+Vca9vg+sS+r0IpEGmy6cHgmlF/AWK9O0DfaXgJiHArOn86noGlOFn1JclG/iQo09OV96YHzC
 5Qnfyu9jH0abLcoN+pTKEZJ4RxbwlDrs6L5z0nOc8WOwXfBdkUtSWuBQ2MiO2QixvGiktksQBDy
 vgYP/adlK39lp88AInfn3kZo3nW7NkSrxa7M+CTNLYWih8dxe+Rqj0yKR818/HUg4+P1u7ULTp8
 VVO5+HPU8pEAXgNJTPlCgYrkkpkWEf3BMd/to651taRP7VG8zOU30VVzsME0ZSXHYxDqXIhRcJQ
 UtawfKc/f9cfLAKciY27ZAkYWPU0AhxdifCAN3AhCeCKRoCS4v4dkyQ2qaBxhQ6FU/arLklyQ/X
 +9HA++9Yp/01KmkXRfsubndsiohiesUI5vI7hsMGwSCRaN7/jnFUo3Ozfc/KHtghn3BZzpYX8L/
 OlQKy+tem1ap41g==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-53494-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ace4000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,linaro.org:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: 396B31A5C41
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


