Return-Path: <linux-media+bounces-55822-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPWxD0dGt2m/PAEAu9opvQ
	(envelope-from <linux-media+bounces-55822-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 00:52:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 929BD2930E5
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 00:52:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14D94302416D
	for <lists+linux-media@lfdr.de>; Sun, 15 Mar 2026 23:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C0272D5C8E;
	Sun, 15 Mar 2026 23:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m6Tf0urn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297AE2C17B3
	for <linux-media@vger.kernel.org>; Sun, 15 Mar 2026 23:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773618726; cv=none; b=hSyC5C5Gqvu/T+UY4Z82HKsFODmrHZpSPQG2yWEvKYWMKd9qY1kst3OR7/VF9g217O7PGiXCWXyLkqTdEPEYb3bPkfs3ubLp78WZGWuQ+OhjSZj/f30cRKw9e3jgaxCtFyC7n0YzkxoPIIu8sSc6h+ZEynuqrQcUMBfDBsDia9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773618726; c=relaxed/simple;
	bh=5HEh4Jzmjb+xpe1JeCJgfmz80o4mkPxB++PCRD7AH68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aGq37CB1Ya85B+xILh0umpGjzA+EBUu/73/0kbylAhlVfTH42Vw1Wh/tgWFGZf+NwGMdzQBkxpgX8KPuieyqujJxlbriZAD5OL9Dq8KhAxohvEJafR+/fAJho0/PoHuq3v8qbCruVVga/V7599Uny4+tRxVmH82XFnNWO7/GYP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m6Tf0urn; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439b6d9c981so2807043f8f.1
        for <linux-media@vger.kernel.org>; Sun, 15 Mar 2026 16:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773618723; x=1774223523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SyuDGIxScz9o+1b+2ev2e6nu0IBiytGXGEcolSic1kM=;
        b=m6Tf0urnqq9aIc1m65B8ndzBbwceFvgYA0ILeX0MnKgD7dwN4SBhGLPtaqMs0b349r
         g6I0IKW9Xd9YYTYe7gXvTO7ATY2J35bRR0UXQyZOSDre4Dcp+fafrXXFnUqJCSS0HeEE
         j9qgMcGeCX+1y2lIzcRIGVc02+c6SdrRqKFIcccRHGstVRPIyDzun8I7dSU07rgJpCgB
         u3s5AR8c6FOS5HZ6C9Z5WX1c1sL1+Vg5CWmCSNtgVpe9gstusMssMYlP1W/77/2w8W51
         Ff4dbigOA35A4U6ZW5KX7tLQGf9TfFo3uz2YRnQTeDZJvg5EpM4pzXRe4gWxN5mM1/68
         5PLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773618723; x=1774223523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SyuDGIxScz9o+1b+2ev2e6nu0IBiytGXGEcolSic1kM=;
        b=UzAWgbxggq94cRqf/kmdERjZKirWimk7NJRjgU1886BK/dEbN/Cl104htlb1KOSXnt
         LvxajtONnZyk6SDicgXpee3yh6dl0oZvkzplfWeC+51hQwguZ1INE63N2GuFC4Xq639M
         tlsGZZ2SkM43BRYNANgLmo9dTtSqJe2AFpAW3A+2gN0oIQJTSs+hPNrhnFaKw/DA7ywa
         VrgoLwPmnE/i1ct8GrJWptd2HVIrm0Fx75/z6THjhfhi+3Nub+1vNEEy8LVZ3Yp4iM4/
         dsIppajkbIncLtNJNl2lIpZBnvntI6U75YyB7kyDLrzujTbu3BQ3w1CiCS1XznXYkWK5
         ZSyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwknCXc6CF607v/Jrakx6cOWHsQry6nvLwQfEHw6wgFDiBHthjCuMJA1TuYjM5VabYGVlae/tKaBDwxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLznF6oBrLkaudiZrIHWsxvvMt8WwegrXWLtVu8xXBRsnQobps
	4FkjUJkKJs80gYsHk584S1XhUE7senG6UL9Xr/Nm/I9H9IM3gw0W+OmG6zK6XTC+FeY=
X-Gm-Gg: ATEYQzxBheEj13AJZngjC6UH0IcEWpqHQrdHfmfDH2e8QtZEtHiZ2MTOId0t49pnIGi
	t2p2H5W/kAjPdtaM6jStHJRkdHzbgLQ3OzZvA5xberyd7t/8ej3+MSesmj2bTq86IFqplM4mZaA
	t15G5odGVjoYe59T+VSMVLBh/ThSW49ixOX4N22KsEqHA7T/sMvRTMLZdP2pwwmJ8L+TIWOWshr
	Bjg3Dk6NCWwb2f9ZI71rqAYeKXVr74GngSjfo+f8EqTKcfzXKixyfXygiMt0TXbcRKQWML9DE6H
	p3QV2C60v0I6rShssEbNWAVdRGispiyjfvs6iuDASyDLDHw5SETo7esbo7N9RD1aKCaHVXvfqb2
	ffiU68aYBqP5gOC9w5MqJilzo2UfyFqGV6QPNEI77YCVY/SN4iUgXF89obGYovFLJqQbLmJ9qTZ
	NBOLaLdn4Mf2ZXgZPyE0gcUea8HyqeUIwSZJk=
X-Received: by 2002:a05:6000:310c:b0:43b:40f6:36fb with SMTP id ffacd0b85a97d-43b40f63922mr4908583f8f.31.1773618723446;
        Sun, 15 Mar 2026 16:52:03 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.190.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b544sm38233082f8f.20.2026.03.15.16.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 16:52:02 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 15 Mar 2026 23:52:06 +0000
Subject: [PATCH v4 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260315-x1e-csi2-phy-v4-1-90c09203888d@linaro.org>
References: <20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org>
In-Reply-To: <20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4842;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=5HEh4Jzmjb+xpe1JeCJgfmz80o4mkPxB++PCRD7AH68=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpt0Yozg80iLZBMId4uWiwO/4+zJHWS38AW7mCj
 f97Md+Xpn+JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCabdGKAAKCRAicTuzoY3I
 OoxyD/9FXYcDjbqrKaXDMVRY1cBoYm8VneQCsmty3ndAdPjHHT4SRWGCWGQYveFPkEgieDP6QcZ
 6iXPmPk5aR1mRlLqPgyBYSildKnAjHzAkqaPtpIHVr/clXqsR/teR2Gj1M+owfX/d/cjgfzihEM
 cmnGwPZMDur0IWEttW03F9QdCEcBLE8UZbDs7NxQaQnQq9Iry51HlcnGA3i2QdffVZM+6kIPB6k
 CxiZiH5de0oy8/fI1X0hb4lXfWRhJ/ilqk1BHSTU7XaqgY/D9u+ctq7AO0KQqirwtBeqycMjPDA
 SmhKEus80jntMbibWloqGtDl3V/07jXacNdzvRtT2Te65OCRDUEFsCpvFl22ttTL+oyNz6De+XS
 /3PPJz9hx6WgFbYmkJ4jjivx7HBMHAxJse9YtjGmoiUMrPiGxeytAHT4kjfwH791xZbp3Co1qMx
 chHgI6X8wdhxy2yQdCoFCn6xdrBtLWwO2blmODXUWdDs7JDu7O9cpxIDHhT5x3ez8DoXQ08b2My
 xccLUf+83eQj9rW0l79S63kjA/K8N17jf5DVn7o38gKCu2h/LwODYYuwalE/2yL9tWW7XYehBaD
 uOFzZSJ8fDWiqHyYyEHDs+WvtrVf+GT/kyifJr7qO0qXug7hD+vLfQ165zE4ngNpGtaLjze9PJT
 1iwiF9hK9jJtpEw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-55822-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 929BD2930E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 133 +++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
new file mode 100644
index 0000000000000..b83c2d65ebc6e
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -0,0 +1,133 @@
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
+    items:
+      - description: TITAN TOP GDSC
+      - description: MXC or MXA voltage rail
+      - description: MMCX voltage rail
+
+  power-domain-names:
+    items:
+      - const: top
+      - const: mx
+      - const: mmcx
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
+  - power-domain-names
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
+    #include <dt-bindings/power/qcom,rpmhpd.h>
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
+        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+                        <&rpmhpd RPMHPD_MX>,
+                        <&rpmhpd RPMHPD_MMCX>;
+        power-domain-names = "top",
+                             "mx",
+                             "mmcx";
+
+        vdda-0p8-supply = <&vreg_l2c_0p8>;
+        vdda-1p2-supply = <&vreg_l1c_1p2>;
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
+                            <&rpmhpd_opp_low_svs>;
+        };
+
+        opp-480000000 {
+            opp-hz = /bits/ 64 <480000000>;
+            required-opps = <&rpmhpd_opp_low_svs>,
+                            <&rpmhpd_opp_low_svs>;
+        };
+    };

-- 
2.52.0


