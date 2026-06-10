Return-Path: <linux-media+bounces-64411-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PIfEIFhHKWoFTgMAu9opvQ
	(envelope-from <linux-media+bounces-64411-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 13:15:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C56668A49
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 13:15:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=lA+7wizK;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64411-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64411-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DCA8C30A2EA6
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 11:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A799403AEA;
	Wed, 10 Jun 2026 11:10:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA6640315B
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 11:10:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089845; cv=none; b=XHord/6oVIuGf+5o8bMeNTuXAck6CFBdQHr0DNTDcS8pQvYY0hr0o0iaQgOWfU8IG6uftVwRMNduSbKVDWvqDJqzxMBTaP4kC2bmfCrJuLMWKM2Je4E7lUcw7y3Ye8a/H+ifrWTFwa96kHmgV5aNIu4TW6cu8NF2dgNl7sjguWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089845; c=relaxed/simple;
	bh=VWR+UfxFqG4y2XgGqNFvBLcEeTwzUQd31HSReE2GSKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ATMJ6K1GFXWnNZXzPVnS6vLtyy7vqB0pJNGotdaP6eFxuIotrDAbx6CesOQV61A/vXlltyfOD39djCVyBmui1SAmX2n4kR6Fg600Oo4Pnv3B31NxndAwN2L6baCjT8p7nHRicB1+wl/WJ/IsLRvNgqvlAzk/xk1wjEaahIkRjjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lA+7wizK; arc=none smtp.client-ip=209.85.214.174
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c0bb4a94b8so55699865ad.2
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 04:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781089838; x=1781694638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8pl4zL6FnCSl3D9yZvxGpHfWt8VIgNStkRi0gondAh0=;
        b=lA+7wizKLOBE7xC5N2txvm+9pJKXSjTWBnVrKVaRtyww+2BmSO4v+sMlIKm6OmVPyM
         coMKzYjgGe8eBWKEPjrRgbTFAVJkwSswW8Wbu0Wcb2a/cxSnqduaeVSNpxV3bum215rJ
         Mvqjbzhx1SC/G6ZguL6waYGQZWmLU8my3q+VXtnmYWPJ6/F4nAeVsw2tXLBU0sqnZVyb
         UnQSW0uOefbDPGDkbmd2bkY+4alWYC0a77CZyd8S5DQyxlPRkTtiPo6wxXk/KTmscl5w
         Stg2gv3GEOVWYbxMsyIzmzH2O2GZ7Z01EBZ3wAvhpRa1cedFfZXZ6EA/6QWjKf1F4kB/
         Fk3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781089838; x=1781694638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8pl4zL6FnCSl3D9yZvxGpHfWt8VIgNStkRi0gondAh0=;
        b=Jxgtz0KjJuemMYgGHvIM2f+BDU5MxyKBAY0/HFciT2qpoHgv63QIylyxE+lCVqwSDY
         qIDYxYPofnT1HyC8DmITUGVJNTU0UObhziZ/SXuOCyDKCjjGy76aPFveAX/EAcclGMVU
         hktW7e8XvnDoneAI2BpuzsO3An9XlR1Pe+/WuSSzVHbb/4FEvU0CDUJakjBgufoLdUTH
         Fg+q4Igy5ocY2IuJ4q6LEJfxlv7VZIX2cXRPTFD2S+CuH3LEJLtLFzhCtCxFBqbWmytu
         zmUNcC9YXCdfX8xNpfuinDiUyb8MhOgp0ykYUmfcDT6zIS/LWjcUXXTBLYRUdkqnevI2
         SycQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Qts57YG0wAvpwgYOTD8KV6+WTbDeyng3P5wpomZNAYmD5mn4yxlsD/+EAy/fp1js8LvDefRyT5YgwEw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4tXz5u3C5fq5Wi+nZkZ2vWi7f6n44yCo93yvyAGzC+stiJjj4
	EcnXwaRVsNmzOD85P2/Qvl96AL1bPYrcvmnfdk8nJOnEMHjMIRp+Hh6T
X-Gm-Gg: Acq92OHvxsMN6Q2XB16U+NsZZt2Ky32Cs+Vvt4QZo2tlssfHqEyVrC3kkZKpHLegjxE
	Cdfq7V63b4XPgkh5/h7LDNZr9j56fBmFvvDA7C1zw5bCrq7NhUaIEI6UcwRBBfY8wLfNuG3ATUp
	3+ck7ydF77kXSJIjBxQ0hCEnbGH6pNDcB/xiH2sd0SQom5mjfdFtqKQcCF7fb5Ydw5X/GKrAibs
	XlZosOTST8SrzmOmMT1EOkbbv4jiOcawEpGwCF7TA+Y/ttc7Oas+kWbDJ8DhQHj4BESThCL8BAX
	CXnh3QMVky2m8/oFAsRpH8EUNpHyzf+k4lDHKRctxB3Noji3aAr/2D4c8KXXQ4N1Cm8j5rnzlql
	4xxHfys0RgZxYg5k/n+4l0Fs5+JiSeh3g5hCx8l+CjGBAmc3mi3GxTXUb3fOWu2Qxda/Pk7oxQv
	7KN0ekxhurFbEye2qdkhF0QKz44WhCIoX3WMRLhZ55j656lk6Y
X-Received: by 2002:a17:903:1aed:b0:2c1:69cb:4423 with SMTP id d9443c01a7336-2c1e7e527bdmr282301365ad.14.1781089837945;
        Wed, 10 Jun 2026 04:10:37 -0700 (PDT)
Received: from [127.0.1.1] ([2409:40f4:4111:52c8:138e:8096:a8df:e68b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm317175205ad.9.2026.06.10.04.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:10:36 -0700 (PDT)
From: Ramshouriesh <rshouriesh@gmail.com>
Date: Wed, 10 Jun 2026 16:39:27 +0530
Subject: [PATCH 2/9] media: dt-bindings: Add Himax HM1092 NIR sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-a14-himax-hm1092-v1-2-0c9907da47ed@gmail.com>
References: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
In-Reply-To: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Aleksandrs Vinarskis <alex@vinarskis.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-phy@lists.infradead.org, Ramshouriesh <rshouriesh@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3984; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=VWR+UfxFqG4y2XgGqNFvBLcEeTwzUQd31HSReE2GSKc=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBqKUYNQ0lDIYKRKLGlAdAaa7mRH+rmFxzbk0An/
 +RFXhSngMyJAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCailGDQAKCRAVlYpeERwF
 3vn1EACmNQOTttnHuckeeKdueEVCHPwLA9ghWtrqwfH/g7yudqQ4EM0nI2bRq+SuH6BbXS94Oys
 /7pgxfpYKk6w2EFHM9BnrQxaGrfTfCEuP1fXmc4VJ9tjOY+PImPr8DgLJ+xYEGdshXN0jRsjiJn
 rEhgmQyHt5gUj2yDPAw1MFheNT3WOXoI2Ka0ZuE2O9LcW/pPM0eXa06veZM8uBPHz2FZ9PAEbL/
 s95Aqz8vzDRzj6VZqpqkuAKnZXFb9KVQPzvM6nvxs7c5c6UKBzKKz+b20YFi1Utvcmn4ruGvwAi
 K0NU3UqPa7XAR2RokYFn8Roxa0ht5eFcsoOXAbaj8OrrBm9YvjN+hHeRM3SpNggHvmxUG9+OrK/
 SPRRXI8TCZyDQ2bALoGmxlde9tCo5+lAAzz7s/NT78KBLBClDmMuS1/6luPJjpuT6babxRLbmdg
 i+1FvoFDvlGTJDwzrJPr+nzyPELq4Bw5blBniKcQWSe0VFwG31/W0Htf8xKUjyK1+/Rx2lP8oCT
 2dRvK9tfb5dDpjdrm7U3hEgwhu4sNgmD83l2YoEzeJWFVVHCr/oV1YavvYWS0E9/Wsy/IuLMbeS
 1dV+NsYpca1XVMKEdkYKT0czF5whnKZ113PTp3wx6ti1iO7/JzWfzIgWy3KhontbvoDbEXwb379
 KC8OILPPm+CDiBA==
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64411-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mchehab@kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:bod@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:alex@vinarskis.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-phy@lists.infradead.org,m:rshouriesh@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rshouriesh@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vinarskis.com,vger.kernel.org,lists.infradead.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rshouriesh@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 22C56668A49

Add a dt-binding schema for the Himax HM1092 1MP monochrome
near-infrared CMOS sensor, used as the face-authentication IR camera on
Snapdragon X laptops such as the ASUS Zenbook A14. The sensor streams
10-bit RAW over 1 or 2 MIPI CSI-2 data lanes.

The optional generic "leds" property (video-interface-devices.yaml)
associates an IR illuminator flash LED with the sensor, which the
driver strobes while streaming.

Signed-off-by: Ramshouriesh <rshouriesh@gmail.com>
---
 .../bindings/media/i2c/himax,hm1092.yaml           | 118 +++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml b/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
new file mode 100644
index 000000000000..085001493a20
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
@@ -0,0 +1,118 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/himax,hm1092.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Himax HM1092 Monochrome NIR Sensor
+
+maintainers:
+  - Ramshouriesh <rshouriesh@gmail.com>
+
+description:
+  The Himax HM1092 is a 1 megapixel monochrome near-infrared CMOS image
+  sensor with a MIPI CSI-2 interface, commonly used as the IR camera for
+  face authentication on laptops. It supports 10 bit RAW output at
+  1288x728 over 1 or 2 CSI-2 data lanes. An optional infrared
+  illuminator LED may be associated with the sensor through the generic
+  "leds" property; the driver strobes it while the sensor is streaming
+  so the scene stays lit for IR capture.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: himax,hm1092
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  avdd-supply:
+    description: Analogue circuit voltage supply.
+
+  dovdd-supply:
+    description: I/O circuit voltage supply.
+
+  dvdd-supply:
+    description: Digital circuit voltage supply.
+
+  reset-gpios:
+    maxItems: 1
+    description: Active low GPIO connected to the XSHUTDOWN pad.
+
+  leds:
+    description:
+      Optional phandle to an infrared illuminator flash LED strobed by
+      the driver while streaming.
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        additionalProperties: false
+
+        properties:
+          data-lanes:
+            minItems: 1
+            maxItems: 2
+          link-frequencies: true
+          remote-endpoint: true
+
+        required:
+          - data-lanes
+          - link-frequencies
+          - remote-endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@24 {
+            compatible = "himax,hm1092";
+            reg = <0x24>;
+
+            reset-gpios = <&tlmm 109 GPIO_ACTIVE_LOW>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&cam_ir_default>;
+
+            clocks = <&camcc 1>;
+            assigned-clocks = <&camcc 1>;
+            assigned-clock-rates = <24000000>;
+
+            orientation = <0>;
+
+            leds = <&ir_flash>;
+
+            avdd-supply = <&vreg_l7m_2p9>;
+            dvdd-supply = <&vreg_l7m_2p9>;
+            dovdd-supply = <&vreg_l4m_1p8>;
+
+            port {
+                hm1092_ep: endpoint {
+                    data-lanes = <1>;
+                    link-frequencies = /bits/ 64 <400000000>;
+                    remote-endpoint = <&camss_csiphy0_inep>;
+                };
+            };
+        };
+    };
+...

-- 
2.53.0


