Return-Path: <linux-media+bounces-62462-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOUTLw76DmoSDwYAu9opvQ
	(envelope-from <linux-media+bounces-62462-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 14:26:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE055A4C49
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 14:26:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23C4330995EF
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 12:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD3CD3D0BEF;
	Thu, 21 May 2026 12:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O7FNrEq7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5221B3CF032
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 12:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779366019; cv=none; b=toXWmK4I9DW5Q3K0+YEn5ByQB/AyaLF15mhmZu1oIYv3qn/lDkIamLyyixTLHSjJIXr+0pGoAotV2OH79RiPTIzB3sO6UMrxxgSgj4nR1rcbk7ZaCmHkoyB1a6+5lDLJY6xanGaiJcNydD9mJ+QL6Q18+hJ3cqBG2v/IMde1Uv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779366019; c=relaxed/simple;
	bh=6JZZJIb3jqCfGevSt00nfaH0Kx6CuW3Rx2PHOEjx2HU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JppsMXfYYTxxMzpUAHLpNFWOYppru3RLyTPkqYKaNZfpiwSNlKjBUUYyAKuBa40jNvQaWqwzi+Q6XSnSvcnwntunMMQKOnwEbRWMKoFPN7ZwT6fWXQ7Hjd7EP6TP0hre6mVrXSeu2KOg/onux07FjImtgTs3CBzCb4PnFLa0i6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O7FNrEq7; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so5951575e9.2
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 05:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779366015; x=1779970815; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZXlcTGXFNsTfHxCUPPOhV4q7Vp+Jy7gwY1+EjxWw5A=;
        b=O7FNrEq7NB2yQlu/nZRut3cM+TPtgCou0KMQlTbE7TqYilhynjL1om650swW42R9yi
         NzTsGXgLROJyhvsespRBijBuU6cBZ3TlyqJglS6ImKmrenRG9VVUPHppeZR9ofiBF7N6
         jMJjtNQbvYeuaY4K+wCHuIqYxOlKVd0dLdgQpLTPCHQw0pnTxBvKrQx4Q+9+zaqlCMWy
         rwVEPv38PANSMxf3QbwQCNTkJ6z5592mlLLyeR8mo2ZFAA4vLjxLFqZ3DX132f6DyRf8
         aOk7kjp8bCHf2jb50EudKOfEs0sPFgQFlJsQY7oBhb1sgGBvXzKnLCMXJFXC2DfG1BSf
         FixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779366015; x=1779970815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JZXlcTGXFNsTfHxCUPPOhV4q7Vp+Jy7gwY1+EjxWw5A=;
        b=qZmH3aB36cknNxtW64/NxX38tx8sioh8mXiZ9NqQotcHszOSj5t8fYA4ZjEZ6Tv9/Z
         3w0WDEoYF/qhqZEIjZIFTGIEe9puL52aIshGwMTBqiFqMDF//Arv1yAo0GX6lePtTh29
         5OIIYqB3JvAKymTb7vVa3n78d4Wh89dLmSguGYaumNss44hqFDU3iiud+bqY9T1I/YfO
         pSCtLy/exU0ZSQQLK8ZfmS4hJUvJHiVLb9y6Bz+KIyYFhuaIMOrgckIOvqPvZS3byMZK
         BOluSNeFSGObQKPBVmN6V3BkgbC1lrBUhZVmNgg59UKCmKdHhcc6IS2RDBJTwFlmBl9Z
         JhLg==
X-Forwarded-Encrypted: i=1; AFNElJ+poT+jQaa5PwBgFKPvCJ6UvQNf8vrjmQ2xrhBtibdJJHasPc7Y3O8bLcg4ChhLtEdOyh7uqeXW4is0uQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/qTdb6Ckvp0wW4Gvp7KPRfKhjhsliJtALaH6I1hgRY6kxHByv
	EN+QlaeOmgWn88bw3GMgOSRHZDehxssG7teTEmTXGgDVPs72uprGWkqRO+h20CvYB/s=
X-Gm-Gg: Acq92OH9wY7cbcNCD74RsseWv8GR4yeUlytNGx5t+OG478j8J7oOg28izumLUANAFrS
	EzzjeHy/Ey5asJUFsev378psCYMaLqY3mOiMSnk2WdMPtdB8cHm9ZQL/GtgDejo7H0QA2/khprt
	Zklrj2+y3MhbHeNXLlX3fwineJtOqMfSeybf3FBD8A9XdTH6u2/mTw2sjxscpTMsJlS7+tP+OE9
	7TsUpvoC7M59JduHUZuHKt95izm0sDRakPKSLDllTK54xIg1E13EwzsbhhtXWi4I9ivIr1QuGoq
	YjR6c0109kZ744389ZoAmo4gpnAB/vhLhFTNAzfK1zejBmwEvVxE3YG+1SLUSyspJG4vrAQ7yXD
	WRjQwEB7pPZIebRyvfSJ40xe7wqFpWA8IUsqHLmTMezaCCyX1DER9OO2CYk65ekGuVnV1O1UeHe
	nLcByQZ3IsuusDJ8vwvx2bUzy5fW9hmcA9qQ==
X-Received: by 2002:a05:600c:49a2:b0:48f:d5b8:5b07 with SMTP id 5b1f17b1804b1-4903608937bmr23532865e9.20.1779366014612;
        Thu, 21 May 2026 05:20:14 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.55.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caf0967sm21981685e9.15.2026.05.21.05.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 05:20:14 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 21 May 2026 13:20:08 +0100
Subject: [PATCH v6 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-x1e-csi2-phy-v6-1-9d73d9bd7d20@linaro.org>
References: <20260521-x1e-csi2-phy-v6-0-9d73d9bd7d20@linaro.org>
In-Reply-To: <20260521-x1e-csi2-phy-v6-0-9d73d9bd7d20@linaro.org>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7047;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=6JZZJIb3jqCfGevSt00nfaH0Kx6CuW3Rx2PHOEjx2HU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqDvh7fJ41ROvU72ZtXZysBNB6KvceJ5NAInwwt
 CNwvl6mvUCJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCag74ewAKCRAicTuzoY3I
 OqjFD/95fqEvI1YszjhlusNuXQ/lsteD4O7SUsuzb+tgIGFCQZ9TU0nKD5Nv3jIwdmgx5Dn77VF
 HfD9VEg9x8Fv425ZZuTkUusihJaxGfKNcM+wh7OeMl5EQKfdjBaSrrZS7uk46pFAXO9lAtKiLS6
 U1lSeIoLNlkoa5DYJPxMred02hvMlGk4Quxpm5zrVqVH6Nb2vYMg6Wji7aikHWWvCAOoT7NPvL8
 EzlX4XHBNNemLtcmLPts2+dy1H8PJmMZA2ulLxF2JFO42PASJjjTp/NgKS8m6N3Sp8mdErFLsO0
 wUbqP/JkSnX/AjA1t8E5zQ0U12ERpOAT3EFzQ/eTO5WAyjoyah7DiGr/tY+fA2B4X7SgursLKq8
 lu0Lbbd7NyFD2K/CQNP++nQk/eo8rK/gN1ZUjdhZzDiQ5qk2zHkO4gpEYllWqYZwct4R4YoFMIY
 K62OMZ2E0j0MwA/oit6HeW2ASiK8NY+ayC7J8R1x28q+/5c+DsviJ4oX3X5SyXa1jR1ZSpZ6vE3
 ftcCAzkQnLXKlLkIBBtAH9U0ovL9heNzQsgO195nANnhD/ooIxkXyxkb5hjWSy0eWR/ytDLPh0N
 e3Pbl+nDlMbq1te62+PO4EXBiTY86wJtOmmeaCdk0be6tIlGNPQD5yfgmqUq3Ro+3BJquyh6Ss9
 b9z6e/KIY3MTDJg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_FROM(0.00)[bounces-62462-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,0.0.0.0:email,0.0.0.1:email,linaro.org:email,linaro.org:mid,linaro.org:dkim,ace4000:email]
X-Rspamd-Queue-Id: 3EE055A4C49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
PHY devices.

The hardware can support both CPHY, DPHY and a special split-mode DPHY.

The schema here defines three ports:

port@0:
    The first input port where a sensor is always required.

port@1:
    A second optional input port which if present implies DPHY split-mode.

port@2:
    A third always required output port which connects to the controller.

The CSIPHY devices have their own pinouts on the SoC as well as their own
individual voltage rails.

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
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 205 +++++++++++++++++++++
 1 file changed, 205 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
new file mode 100644
index 0000000000000..c9116246c1e9e
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -0,0 +1,205 @@
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
+    description:
+      The single cell specifies the PHY operating mode.
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: core
+      - const: timer
+
+  interrupts:
+    maxItems: 1
+
+  operating-points-v2:
+    maxItems: 1
+
+  power-domains:
+    items:
+      - description: MMCX voltage rail
+      - description: MXC or MXA voltage rail
+
+  power-domain-names:
+    items:
+      - const: mmcx
+      - const: mx
+
+  vdda-0p9-supply:
+    description: Phandle to a 0.9V regulator supply to a PHY.
+
+  vdda-1p2-supply:
+    description: Phandle to 1.2V regulator supply to a PHY.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description: Sensor input. Always present.
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+              clock-lanes:
+                maxItems: 1
+              remote-endpoint: true
+            required:
+              - data-lanes
+              - clock-lanes
+              - remote-endpoint
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description:
+          Second sensor input. When present, indicates DPHY split mode.
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            properties:
+              data-lanes:
+                maxItems: 1
+              clock-lanes:
+                maxItems: 1
+              remote-endpoint: true
+            required:
+              - data-lanes
+              - clock-lanes
+              - remote-endpoint
+
+      port@2:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description: Output to CAMSS controller.
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+            properties:
+              remote-endpoint: true
+            required:
+              - remote-endpoint
+
+    required:
+      - port@0
+      - port@2
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
+  - power-domain-names
+  - vdda-0p9-supply
+  - vdda-1p2-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
+    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    csiphy4: csiphy@ace4000 {
+        compatible = "qcom,x1e80100-csi2-phy";
+        reg = <0x0ace4000 0x2000>;
+        #phy-cells = <1>;
+
+        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
+        clock-names = "core",
+                      "timer";
+
+        operating-points-v2 = <&csiphy_opp_table>;
+
+        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+        power-domains = <&rpmhpd RPMHPD_MMCX>,
+                        <&rpmhpd RPMHPD_MX>;
+        power-domain-names = "mmcx",
+                             "mx";
+
+        vdda-0p9-supply = <&vreg_l2c_0p8>;
+        vdda-1p2-supply = <&vreg_l1c_1p2>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                csiphy0_in_ep: endpoint {
+                    remote-endpoint = <&sensor_out>;
+                };
+            };
+
+            port@2 {
+                reg = <2>;
+                csiphy0_out_ep: endpoint {
+                    remote-endpoint = <&controller_in>;
+                };
+            };
+        };
+    };
+
+    csiphy_opp_table: opp-table {
+        compatible = "operating-points-v2";
+
+        opp-300000000 {
+            opp-hz = /bits/ 64 <300000000>;
+            required-opps = <&rpmhpd_opp_low_svs_d1>,
+                            <&rpmhpd_opp_low_svs_d1>;
+        };
+
+        opp-400000000 {
+            opp-hz = /bits/ 64 <400000000>;
+            required-opps = <&rpmhpd_opp_low_svs>,
+                            <&rpmhpd_opp_low_svs_d1>;
+        };
+
+        opp-480000000 {
+            opp-hz = /bits/ 64 <480000000>;
+            required-opps = <&rpmhpd_opp_low_svs>,
+                            <&rpmhpd_opp_low_svs_d1>;
+        };
+    };

-- 
2.54.0


