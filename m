Return-Path: <linux-media+bounces-52726-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sD88FQUkj2lNKAEAu9opvQ
	(envelope-from <linux-media+bounces-52726-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:15:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAD51363D8
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:15:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 658643090B26
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 13:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 336DA35F8DC;
	Fri, 13 Feb 2026 13:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="T8tmow0o"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5057735F8D0
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 13:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770988508; cv=none; b=XPxX2GFLoJm/MB81wQ5fe3V82zjfd2adKWMRtR71US07HqXgMmPHk5nkbF1u3oqKA72K+sRUWar+pCAL8ZFEQDtA+7LmRXjCNg4DaFBGJ7WMC6rrdjaFVdrNzZfcBTxYBV+VjOEtImQv74LgfFLoW4eIO6Ej6yHeNk4Cd5+1IXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770988508; c=relaxed/simple;
	bh=rTJAFXheRFItVqL+IO8ZybQvFNagM/AJXl6pms2q4U8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D6nd6JqkOc34a6qnBjBYDAwE6pLUmEYJWiK+3pKJMYbCuIKMawkRX94JqjrBO5W+4KpCGmU+TtuNpZUGbJdS1+E1vkEfF9BF3yo6HoOOOMpdrFGOrVyuxQ9sCNR61eRSh5q92PLxYxznonm6RAW5FnK7ZkWlndJBj4Mv0Y/+Ytw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=T8tmow0o; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-658b6757f7fso1816822a12.1
        for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 05:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1770988504; x=1771593304; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=calbKI50w+u0j9qzpWX7vwsY0gK/DdIKeOWZVKHexTw=;
        b=T8tmow0o/m7kZgVQdilQ2EjZSWuj7SQm7bIqPyIfC26djP+9+Ljz4RqcTFaZXFgWAk
         Kp7xnKfmCawwTJE4I8gq+xpWu1yxuc+f2JpKNDp22nk6Ceq9W+ivoeBYlScBZFMZEY7I
         5w9EbHToBgXXgc61Dd1AAKyw8ZaWt/+bnbbpMhbTJlgwMyimbt9dD8+civKPLw15qiwp
         eNjxPdGRcPNdkkaKNOdSY5+53lK81zRfWpkQ8WMVkXaYdpMdLUo6t2v0ZJeqrVkkGKLz
         5jRD5Eq7Mzk3nSgZPctNO/7yw/S/isq7ysca4D5l1LLp+P85E11Yg3Jbz/nM41pHgJvD
         DqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770988504; x=1771593304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=calbKI50w+u0j9qzpWX7vwsY0gK/DdIKeOWZVKHexTw=;
        b=BtOJMwNpSjTLJbghGhdSx6ITXz8Np6LtEZ1yaQA4o1sXFhxwtitip4VD3ViEctMpvs
         oay5w0/lKjvctbQYCjM4Pznk55qECMNgEoeJLLq1tjSxY3P63XFepi2ezzgLPlJ/iZe0
         bPVc83lkiLMlCm5asOdCAbKo+uUEIy7RRNk4+Zt3Egu30q1vjwCEjP/IB4pl4Vy9JUOs
         25llMUi9B83ovBfc+PzS85r8esTxmtD9AF9JGRYmBvHYwed+U8dnJPfNYDxmzXEKt1/t
         Hw4jNmhGaLmf4yYIkgfTaLeOnlLCXCPXYVnVa/L+Ooog8RhttSNjTjjO1SRG7rXB7SjC
         i30A==
X-Forwarded-Encrypted: i=1; AJvYcCXcmy4IXWLap7Vn7IjuHbwgXvXhwiVCPY+is/oo+uO3do65lRAFsHMHtKt7q2bvoJ9KdGn4H1mmxiCxhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqhbmHERxN1eFiOW3IpAraTBqBNRqPek6awcvqdvgJVasxNB6i
	filTJOGIRhc3hr0JdpdVhcUeOMnHlsTR1kOGR04gnmgQY4T8Pzwfyy7llDiOT+tRYIPPFFcIq0v
	vG9ip
X-Gm-Gg: AZuq6aK3J4K0hdAMYuQxoBT1arPAoZ+Zy5iSH7u402v73zAIdQ2T2YGQn3M6rTUSyq8
	9vyHPrnI7cwE+EqwKOtwLmGXIO3O3QXpf9VFr/byZy+DkL20Z8Ybt8oR7kKa/oL42yrwoKWxgMD
	xVifFnoAEDjrNtRoJunBjdJIWHMrZHMKBkHsSCB7SUaMXOLgs3QfFgRp85vUrZ44hykP1PjdJEO
	SvSPtv43NDrHcZoohEEihEeFgN/yr3zcOOGODxNJsc+FEV3KrxmW0DUnvaAZGYM80yoK/cH9EXv
	cFd/n+xO6tsOh64oU46LWqB0s/LheI2dJTOY/ssQUCJt+nLQt7LrE1A0TLm9GUfLYgtaaS/Bk5h
	IkHgNfDQKwQlfu4Tt2Tn+Z4PWejMwQD/gffP0cO9J9i5xAM8BcST+K1+sHauNRpJx27e9SSnsmv
	gx9n9YBs88bzfp9er3G+ldURG6dX4tFLHFpZUbFRH27x7VOMrqHj96zpB40Oo801sA1akVSN407
	TK9
X-Received: by 2002:a05:6402:1467:b0:65a:3527:c5d1 with SMTP id 4fb4d7f45d1cf-65bc424a4d2mr59790a12.2.1770988504239;
        Fri, 13 Feb 2026 05:15:04 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bace3fc4esm674231a12.0.2026.02.13.05.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 05:15:03 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Feb 2026 14:15:01 +0100
Subject: [PATCH v3 1/3] dt-bindings: media: camss: Add qcom,sm6350-camss
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-sm6350-camss-v3-1-30a845b0b7cc@fairphone.com>
References: <20260213-sm6350-camss-v3-0-30a845b0b7cc@fairphone.com>
In-Reply-To: <20260213-sm6350-camss-v3-0-30a845b0b7cc@fairphone.com>
To: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770988501; l=16702;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=rTJAFXheRFItVqL+IO8ZybQvFNagM/AJXl6pms2q4U8=;
 b=D3xx9MXy2VKrzzAZVqdc06DERtGVQE35K7DRZUE4/6VFgArcThmIpSqcBKn0aTxjxlmz7fLDW
 hT7iVqtROTZD5ZvpyUDmOw1MqcztQEIWaIVGGdDGk+lyY1HbU702qL5
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52726-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[fairphone.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,fairphone.com:mid,fairphone.com:dkim,fairphone.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: ACAD51363D8
X-Rspamd-Action: no action

Add bindings for the Camera Subsystem on the SM6350 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/media/qcom,sm6350-camss.yaml          | 471 +++++++++++++++++++++
 1 file changed, 471 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml
new file mode 100644
index 000000000000..d9dde154edeb
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml
@@ -0,0 +1,471 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,sm6350-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM6350 Camera Subsystem (CAMSS)
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,sm6350-camss
+
+  reg:
+    maxItems: 24
+
+  reg-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite
+      - const: a5_csr
+      - const: a5_qgic
+      - const: a5_sierra
+      - const: bps
+      - const: camnoc
+      - const: core_top_csr_tcsr
+      - const: cpas_cdm
+      - const: cpas_top
+      - const: ipe
+      - const: jpeg_dma
+      - const: jpeg_enc
+      - const: lrme
+
+  clocks:
+    maxItems: 39
+
+  clock-names:
+    items:
+      - const: cam_axi
+      - const: soc_ahb
+      - const: camnoc_axi
+      - const: core_ahb
+      - const: cpas_ahb
+      - const: csiphy0
+      - const: csiphy0_timer
+      - const: csiphy1
+      - const: csiphy1_timer
+      - const: csiphy2
+      - const: csiphy2_timer
+      - const: csiphy3
+      - const: csiphy3_timer
+      - const: vfe0_axi
+      - const: vfe0
+      - const: vfe0_cphy_rx
+      - const: vfe0_csid
+      - const: vfe1_axi
+      - const: vfe1
+      - const: vfe1_cphy_rx
+      - const: vfe1_csid
+      - const: vfe2_axi
+      - const: vfe2
+      - const: vfe2_cphy_rx
+      - const: vfe2_csid
+      - const: vfe_lite
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+      - const: bps
+      - const: bps_ahb
+      - const: bps_areg
+      - const: bps_axi
+      - const: icp
+      - const: ipe0
+      - const: ipe0_ahb
+      - const: ipe0_areg
+      - const: ipe0_axi
+      - const: jpeg
+      - const: lrme
+
+  interrupts:
+    maxItems: 18
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite
+      - const: a5
+      - const: cpas
+      - const: cpas_cdm
+      - const: jpeg_dma
+      - const: jpeg_enc
+      - const: lrme
+
+  interconnects:
+    maxItems: 4
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_mnoc
+      - const: sf_mnoc
+      - const: sf_icp_mnoc
+
+  iommus:
+    maxItems: 14
+
+  power-domains:
+    maxItems: 6
+
+  power-domain-names:
+    items:
+      - const: bps
+      - const: ife0
+      - const: ife1
+      - const: ife2
+      - const: ipe
+      - const: top
+
+  vdd-csiphy0-0p9-supply:
+    description:
+      Phandle to a 0.9V regulator supply to CSIPHY0.
+
+  vdd-csiphy0-1p25-supply:
+    description:
+      Phandle to a 1.25V regulator supply to CSIPHY0.
+
+  vdd-csiphy1-0p9-supply:
+    description:
+      Phandle to a 0.9V regulator supply to CSIPHY1.
+
+  vdd-csiphy1-1p25-supply:
+    description:
+      Phandle to a 1.25V regulator supply to CSIPHY1.
+
+  vdd-csiphy2-0p9-supply:
+    description:
+      Phandle to a 0.9V regulator supply to CSIPHY2.
+
+  vdd-csiphy2-1p25-supply:
+    description:
+      Phandle to a 1.25V regulator supply to CSIPHY2.
+
+  vdd-csiphy3-0p9-supply:
+    description:
+      Phandle to a 0.9V regulator supply to CSIPHY3.
+
+  vdd-csiphy3-1p25-supply:
+    description:
+      Phandle to a 1.25V regulator supply to CSIPHY3.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports.
+
+    patternProperties:
+      "^port@[0-3]$":
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
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sm6350.h>
+    #include <dt-bindings/clock/qcom,sm6350-camcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,sm6350.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/media/video-interfaces.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp@acb3000 {
+            compatible = "qcom,sm6350-camss";
+
+            reg = <0x0 0x0acb3000 0x0 0x1000>,
+                  <0x0 0x0acba000 0x0 0x1000>,
+                  <0x0 0x0acc1000 0x0 0x1000>,
+                  <0x0 0x0acc8000 0x0 0x1000>,
+                  <0x0 0x0ac65000 0x0 0x1000>,
+                  <0x0 0x0ac66000 0x0 0x1000>,
+                  <0x0 0x0ac67000 0x0 0x1000>,
+                  <0x0 0x0ac68000 0x0 0x1000>,
+                  <0x0 0x0acaf000 0x0 0x4000>,
+                  <0x0 0x0acb6000 0x0 0x4000>,
+                  <0x0 0x0acbd000 0x0 0x4000>,
+                  <0x0 0x0acc4000 0x0 0x4000>,
+                  <0x0 0x0ac18000 0x0 0x3000>,
+                  <0x0 0x0ac00000 0x0 0x6000>,
+                  <0x0 0x0ac10000 0x0 0x8000>,
+                  <0x0 0x0ac6f000 0x0 0x8000>,
+                  <0x0 0x0ac42000 0x0 0x4600>,
+                  <0x0 0x01fc0000 0x0 0x40000>,
+                  <0x0 0x0ac48000 0x0 0x1000>,
+                  <0x0 0x0ac40000 0x0 0x1000>,
+                  <0x0 0x0ac87000 0x0 0xa000>,
+                  <0x0 0x0ac52000 0x0 0x4000>,
+                  <0x0 0x0ac4e000 0x0 0x4000>,
+                  <0x0 0x0ac6b000 0x0 0xa00>;
+            reg-names = "csid0",
+                        "csid1",
+                        "csid2",
+                        "csid_lite",
+                        "csiphy0",
+                        "csiphy1",
+                        "csiphy2",
+                        "csiphy3",
+                        "vfe0",
+                        "vfe1",
+                        "vfe2",
+                        "vfe_lite",
+                        "a5_csr",
+                        "a5_qgic",
+                        "a5_sierra",
+                        "bps",
+                        "camnoc",
+                        "core_top_csr_tcsr",
+                        "cpas_cdm",
+                        "cpas_top",
+                        "ipe",
+                        "jpeg_dma",
+                        "jpeg_enc",
+                        "lrme";
+
+            clocks = <&gcc GCC_CAMERA_AXI_CLK>,
+                     <&camcc CAMCC_SOC_AHB_CLK>,
+                     <&camcc CAMCC_CAMNOC_AXI_CLK>,
+                     <&camcc CAMCC_CORE_AHB_CLK>,
+                     <&camcc CAMCC_CPAS_AHB_CLK>,
+                     <&camcc CAMCC_CSIPHY0_CLK>,
+                     <&camcc CAMCC_CSI0PHYTIMER_CLK>,
+                     <&camcc CAMCC_CSIPHY1_CLK>,
+                     <&camcc CAMCC_CSI1PHYTIMER_CLK>,
+                     <&camcc CAMCC_CSIPHY2_CLK>,
+                     <&camcc CAMCC_CSI2PHYTIMER_CLK>,
+                     <&camcc CAMCC_CSIPHY3_CLK>,
+                     <&camcc CAMCC_CSI3PHYTIMER_CLK>,
+                     <&camcc CAMCC_IFE_0_AXI_CLK>,
+                     <&camcc CAMCC_IFE_0_CLK>,
+                     <&camcc CAMCC_IFE_0_CPHY_RX_CLK>,
+                     <&camcc CAMCC_IFE_0_CSID_CLK>,
+                     <&camcc CAMCC_IFE_1_AXI_CLK>,
+                     <&camcc CAMCC_IFE_1_CLK>,
+                     <&camcc CAMCC_IFE_1_CPHY_RX_CLK>,
+                     <&camcc CAMCC_IFE_1_CSID_CLK>,
+                     <&camcc CAMCC_IFE_2_AXI_CLK>,
+                     <&camcc CAMCC_IFE_2_CLK>,
+                     <&camcc CAMCC_IFE_2_CPHY_RX_CLK>,
+                     <&camcc CAMCC_IFE_2_CSID_CLK>,
+                     <&camcc CAMCC_IFE_LITE_CLK>,
+                     <&camcc CAMCC_IFE_LITE_CPHY_RX_CLK>,
+                     <&camcc CAMCC_IFE_LITE_CSID_CLK>,
+                     <&camcc CAMCC_BPS_CLK>,
+                     <&camcc CAMCC_BPS_AHB_CLK>,
+                     <&camcc CAMCC_BPS_AREG_CLK>,
+                     <&camcc CAMCC_BPS_AXI_CLK>,
+                     <&camcc CAMCC_ICP_CLK>,
+                     <&camcc CAMCC_IPE_0_CLK>,
+                     <&camcc CAMCC_IPE_0_AHB_CLK>,
+                     <&camcc CAMCC_IPE_0_AREG_CLK>,
+                     <&camcc CAMCC_IPE_0_AXI_CLK>,
+                     <&camcc CAMCC_JPEG_CLK>,
+                     <&camcc CAMCC_LRME_CLK>;
+            clock-names = "cam_axi",
+                          "soc_ahb",
+                          "camnoc_axi",
+                          "core_ahb",
+                          "cpas_ahb",
+                          "csiphy0",
+                          "csiphy0_timer",
+                          "csiphy1",
+                          "csiphy1_timer",
+                          "csiphy2",
+                          "csiphy2_timer",
+                          "csiphy3",
+                          "csiphy3_timer",
+                          "vfe0_axi",
+                          "vfe0",
+                          "vfe0_cphy_rx",
+                          "vfe0_csid",
+                          "vfe1_axi",
+                          "vfe1",
+                          "vfe1_cphy_rx",
+                          "vfe1_csid",
+                          "vfe2_axi",
+                          "vfe2",
+                          "vfe2_cphy_rx",
+                          "vfe2_csid",
+                          "vfe_lite",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_csid",
+                          "bps",
+                          "bps_ahb",
+                          "bps_areg",
+                          "bps_axi",
+                          "icp",
+                          "ipe0",
+                          "ipe0_ahb",
+                          "ipe0_areg",
+                          "ipe0_axi",
+                          "jpeg",
+                          "lrme";
+
+            interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 717 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 473 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 461 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 718 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 472 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 463 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 459 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 475 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 476 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csid_lite",
+                              "csiphy0",
+                              "csiphy1",
+                              "csiphy2",
+                              "csiphy3",
+                              "vfe0",
+                              "vfe1",
+                              "vfe2",
+                              "vfe_lite",
+                              "a5",
+                              "cpas",
+                              "cpas_cdm",
+                              "jpeg_dma",
+                              "jpeg_enc",
+                              "lrme";
+
+            interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                             &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+                             &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
+                             &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+            interconnect-names = "ahb",
+                                 "hf_mnoc",
+                                 "sf_mnoc",
+                                 "sf_icp_mnoc";
+
+            iommus = <&apps_smmu 0x820 0xc0>,
+                     <&apps_smmu 0x840 0x0>,
+                     <&apps_smmu 0x860 0xc0>,
+                     <&apps_smmu 0x880 0x0>,
+                     <&apps_smmu 0xc40 0x20>,
+                     <&apps_smmu 0xc60 0x20>,
+                     <&apps_smmu 0xc80 0x0>,
+                     <&apps_smmu 0xca2 0x0>,
+                     <&apps_smmu 0xcc0 0x20>,
+                     <&apps_smmu 0xce0 0x20>,
+                     <&apps_smmu 0xd00 0x20>,
+                     <&apps_smmu 0xd20 0x20>,
+                     <&apps_smmu 0xd40 0x20>,
+                     <&apps_smmu 0xd60 0x20>;
+
+            power-domains = <&camcc BPS_GDSC>,
+                            <&camcc IFE_0_GDSC>,
+                            <&camcc IFE_1_GDSC>,
+                            <&camcc IFE_2_GDSC>,
+                            <&camcc IPE_0_GDSC>,
+                            <&camcc TITAN_TOP_GDSC>;
+            power-domain-names = "bps",
+                                 "ife0",
+                                 "ife1",
+                                 "ife2",
+                                 "ipe",
+                                 "top";
+
+            vdd-csiphy0-0p9-supply = <&vreg_l18a>;
+            vdd-csiphy0-1p25-supply = <&vreg_l22a>;
+            vdd-csiphy1-0p9-supply = <&vreg_l18a>;
+            vdd-csiphy1-1p25-supply = <&vreg_l22a>;
+            vdd-csiphy2-0p9-supply = <&vreg_l18a>;
+            vdd-csiphy2-1p25-supply = <&vreg_l22a>;
+            vdd-csiphy3-0p9-supply = <&vreg_l18a>;
+            vdd-csiphy3-1p25-supply = <&vreg_l22a>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    csiphy0_ep: endpoint {
+                        data-lanes = <0 1 2 3>;
+                        bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+                        remote-endpoint = <&sensor_ep>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.53.0


