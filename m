Return-Path: <linux-media+bounces-67112-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /SatLx1YT2pTewIAu9opvQ
	(envelope-from <linux-media+bounces-67112-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 10:13:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F3F72E1AB
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 10:13:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=iudFpAPg;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67112-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67112-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94A46303F27A
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 08:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448A83E9C12;
	Thu,  9 Jul 2026 08:12:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EADF3E9F8D
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 08:12:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783584759; cv=none; b=p+/bKrxZ16nVUisRcqgh0CBZKrE/s7+ydfrWbbJe2ilnX4J6mqqM/fkqeL1qLbcXXILNUhfPO2Bq/T1u91ZnY5Ffn8gx/gYx+PL0o9sWFPu5IHqKNpmo5r7xfJclAHrBc+fXAZRLkdvhVJfsxwUjFtKwb2rm6b3SGLGLwFWLWqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783584759; c=relaxed/simple;
	bh=Ca5oY9EVWdqeLM+1rPJ3LJsH2g0BEAQYPWpbNiHXhGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FTn7slFqdAIAb+P7Pn/M/nBCsd768i1PBz/zCgb0M52lqt/PVB0ONm/h8bT+KqYwrFYbbgjHZ5PAFfdIbIWJFbsxGJRBJ4gzEgjFW0pMScRglDAd6/JMeW6i/pTADjPk+9GHzFnoSA88A6mK/O8VwD0XKeQY72O5t5iye9n+luQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iudFpAPg; arc=none smtp.client-ip=209.85.216.41
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38426d04bb4so539287a91.1
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 01:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783584757; x=1784189557; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qQNWYSwyJwFhm2jLpB/Imxcdp7qalA7fsluMuu4gak8=;
        b=iudFpAPg+Ak5sG2gVx7FUrHnjJXU2bEDW2xRXgE4YotCJ32HnjoyWANAZPtrcUvT4x
         29ASxnYxNs+SdXUPMOcBpkY2byv9uo1BG/n9xZVu6PE+Cg725MW959wfibOGrmZAhb36
         hIkC+e8J0glH6oePSY81xdSWinK5APZmUzvFsuvpuN0SgwH+PqdZhpVUGti9Pa3ygHk7
         VgoiDk9Kz//1HmhQaIGQ0YATzqAzWV/89wsb243HNh6mR9yl0uqHYUXB1SFX5WB4bpbU
         Hb6negov7QlZEXD/UKKv7Q0OJ1MXfUpwO/H9rlhGvb2uP2MzhWp9oSAufE0L7FP7sh0O
         gNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783584757; x=1784189557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qQNWYSwyJwFhm2jLpB/Imxcdp7qalA7fsluMuu4gak8=;
        b=dCIdBZXtVkMhlkypoaA6KUqhPE/R4NL3+R3yme/V1lb3PotZZ6A+e2QyhQsgdn2bxW
         8/UcAquNK487P+kOiOm4wPZwLlxS4B9923zIotzbdJM/SONX98cKjoKwzeMh/Njjriuu
         3z2O6d8jey4Rmb6CWotivvJJjii8AuGDjg1V8/cpmwZchOzgNu7Zdwx9/jxFD/31cgaM
         BPHchQzlThJpjVwi/dTFtvfmACrNWhgMzTr93dEasZKcPibr9JvhSmaGfqjZov2qO1B7
         qkh54a2G/s9SulAv/UQadOT0Gy+Lr09YrZ8BfUJB8oMj6MQeQOrn2ah4tU1dCfHN5BNp
         bkOg==
X-Forwarded-Encrypted: i=1; AHgh+RquB80k6Ok+hbG5YLsoOoq2Hf0oQ6ZrhQZJarPAanJYu2AS0tCdMC2HIbFQ6OcXVmq4rSobucvnBy86mA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjAzogb7IsmPZm/etc6J8FfVUAkD52yDYjAlIZaIEk3QQtDvZ8
	L9fVADKVVXteUrnu1IT5gQ3irCYZK6KtgFWfixcyco2xs00qX9miFv1J
X-Gm-Gg: AfdE7ckO0krzzPjigLtRFQZK9LURRXsm4A1iw6oMOMrwwOkIf7QcOMeUafa8Y+RkuMs
	kdx/DWv51ZMtyUaQO84bG3sM9am8HXZ6UjhW3zHcOIZjIQU0z/XcBXdzNk4z/nQXsRczwDzIvCD
	lUQFBUNUY/1XE3euHriBcbYr6+jP7F6ZklEx77JqnBClG+axJPIRIwuoTwlrK8PuyT0GCXSk5qo
	zdk9C1WYD40O1hj6LIcLFjT3SvGjT5zurSTKU57fS48NUk790Nw8azpiDTxz6s3VkmcYssNXo8q
	Y8lD5zUP8JlW5L8CpleEjheV6v9G6UpkfglYSiL2+OOKZbRACc9dLW6r1lYQ5FB71H8xJI52XyT
	gyH2gJcKk/ewUvqCfUK/tMYjAvFdg54r5mCKdRmg3efKiU71z2UrwdyaIgJZdWOm5WivxEH6oQI
	xqiWwugbNOqAsgPDpyEQ==
X-Received: by 2002:a17:90b:3848:b0:387:d9cc:7dc1 with SMTP id 98e67ed59e1d1-38b75bf6895mr1962443a91.19.1783584756903;
        Thu, 09 Jul 2026 01:12:36 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:8902:7295:9616:9031:8f8a:a80a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31198cb2b99sm10274601eec.26.2026.07.09.01.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:12:36 -0700 (PDT)
From: Ramshouriesh R <rshouriesh@gmail.com>
Date: Thu, 09 Jul 2026 13:41:54 +0530
Subject: [PATCH v5 1/2] media: dt-bindings: Add Himax HM1092 NIR sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-hm1092-driver-v5-1-a1f5baa6fe08@gmail.com>
References: <20260709-hm1092-driver-v5-0-a1f5baa6fe08@gmail.com>
In-Reply-To: <20260709-hm1092-driver-v5-0-a1f5baa6fe08@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ramshouriesh R <rshouriesh@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3236; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=Ca5oY9EVWdqeLM+1rPJ3LJsH2g0BEAQYPWpbNiHXhGk=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBqT1fptBzX3HMk88MBwL/4qY7OUNl2NV0oExy1U
 MJsUH9A6zqJAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCak9X6QAKCRAVlYpeERwF
 3px3D/9UX4e4ruLLAobJ+4lCK80mmZET0l9Uok/utlX5Lr3wlGepjPJpSn/tvVMhnlldZuUUVuU
 vrpDZazpv0s1g1vaYyreVfhd4L+KWYj7r94e2BSdIDePNXrfZKCf+2grKLoOiLT4hanYH7z0CvA
 k+UfxKVDYVBa4I9xLrz+leYL0sjcDbBzNS3CXr2oieULVM1noRCyo6MBa9/k+CZYPxN12+Bk3DV
 BMBj+4AqkHLRNNK7AmRaKH6i53Igd3TaZSCekpjYFnawigGnGNgLeslY8gDAUBr9TVBWgVCOHYi
 LH0z6fYZn2d83X4XrDy/txz6Aty2ddqtqNzNtGpEUf9hgpUy0k9bnXNKDnvc6q5tcvBZ/A8CRgG
 zpq2UXSw2DUUxVVrWVmasWDNTSzYnu5LCWVzMOrHu2gB2dNHVnWV2+Nqe73iRca2aQh5VKL6/lG
 FxEhNw94klyb2kXZYL9jl4ADEeu3uRV1zMZic1Aq3x5oeTGLacIXjaLrFD2RukkUcGkDGrYuv/l
 N4rIAWU+7lN059lfDx0cPvA8dI3QouyNaXTrtrrJ5TubQRon+th7sGOJXzewcQlfgBfF/SIfM8b
 chvAgTeFBQJM/38Iz7iPR25zeFQnJvgkCTOzSHv9riXYbOfwrxvPD2Bxwyfplqn0cwkc/dnvLGY
 KJXVYSnlWgzPgKQ==
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-67112-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rshouriesh@gmail.com,m:conor.dooley@microchip.com,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[rshouriesh@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,vger.kernel.org,gmail.com,microchip.com];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rshouriesh@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 34F3F72E1AB

Add a dt-binding schema for the Himax HM1092, a 1 megapixel monochrome
near-infrared CMOS image sensor used as the face-authentication IR
camera on laptops. The sensor streams 10-bit RAW over a single MIPI
CSI-2 data lane.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Ramshouriesh R <rshouriesh@gmail.com>
---
 .../bindings/media/i2c/himax,hm1092.yaml           | 101 +++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml b/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
new file mode 100644
index 000000000000..87c43ef883c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/himax,hm1092.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Himax HM1092 Monochrome NIR Sensor
+
+maintainers:
+  - Ramshouriesh R <rshouriesh@gmail.com>
+
+description:
+  The Himax HM1092 is a 1 megapixel monochrome near-infrared CMOS image
+  sensor with a MIPI CSI-2 interface, commonly used as the IR camera for
+  face authentication on laptops. It outputs 10-bit RAW over a single
+  MIPI CSI-2 data lane.
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
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        required:
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dovdd-supply
+  - dvdd-supply
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
+            avdd-supply = <&vreg_l7m_2p9>;
+            dvdd-supply = <&vreg_l7m_2p9>;
+            dovdd-supply = <&vreg_l4m_1p8>;
+
+            port {
+                hm1092_ep: endpoint {
+                    link-frequencies = /bits/ 64 <400000000>;
+                    remote-endpoint = <&camss_csiphy0_inep>;
+                };
+            };
+        };
+    };
+...

-- 
2.53.0


