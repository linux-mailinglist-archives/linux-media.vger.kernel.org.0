Return-Path: <linux-media+bounces-66288-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cwK7BAzARWqaEgsAu9opvQ
	(envelope-from <linux-media+bounces-66288-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 03:34:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD1C6F2C11
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 03:34:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=oiLxg2gx;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66288-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66288-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A18930534DA
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 01:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD9B2868A7;
	Thu,  2 Jul 2026 01:33:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30880222599
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 01:33:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782956000; cv=none; b=LcOX7HA/v9UR7JqWU78QKN0gsO1EaqspAxkRF3Wt/BLSA0FW/Zmzyc8sRQiff/5XeXNvOy80zNjJl8iRaHUkLGP7vzmViGYyyqT4l3gqk9ItNR8ii26nmWvXLwJeHEJQEb8JVi+XJfHSenmV50SJhHlP98zu3suZPGwIQB2BL7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782956000; c=relaxed/simple;
	bh=GBwoj0wKX6WvpSwyWFpUryr+T2rxfPCqj4p2MWOY66w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DlEiANeNKBOAP+izihWucBzaaX8Z/nkvhwETOHu9+yAFfqha3tTiVTF291IeDAAY4Eb5+Yp569asvqTmWNpJ13EAlTpdAjypuQnkyX0CQGjIg1hkbT8deVo/HU23wFbc+uksEMlR2yr3k7FrnmFif0V3xsPvZ331dANSnE5kT/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oiLxg2gx; arc=none smtp.client-ip=209.85.216.43
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38005a36edbso785411a91.1
        for <linux-media@vger.kernel.org>; Wed, 01 Jul 2026 18:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782955998; x=1783560798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XgMnN8cRWB289smPDCgRPSXeBysJiuiJpvGhUnEqS8I=;
        b=oiLxg2gxMmTXwfw4rRMaE+x/5W9TbWmDuqwtGHtmXunXT4yEfglssUcEse9IBeqv19
         VYRrLX0ZXuA8gYk7XgR8kTomvWHsUdac1r4ywosvGqDSzYiCBbkKIyVHr8F8yItxd3gA
         Ar/3XT22EqZS2rxmk0ZszY29Sw/h8w+xwRHT4AzxBJEKOFxIsqSLND7p3ZvhBPLE6FXE
         hINZ//WBF0f61Df5CKxZE6Z28ls6UBkcPol//excvRXqy0krA7a5jHyUucEhX0DqOLW7
         WoPnQROl6Yn16eiv7d8pIkWPSGO4mIR/Lb6L3drEUB+sP4jI7A2k8efjyP7JPR5J54R2
         57pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782955998; x=1783560798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XgMnN8cRWB289smPDCgRPSXeBysJiuiJpvGhUnEqS8I=;
        b=Ad8IKH0TFJ9eOOUteqXbPzbP/g44C/h1ED4wjlBY2kzUbyu5kREuyv90D2UaXFGRt5
         bq+5kV4zOWvXlHADZXWG8BcLqnXfWwqN1FZcr7sKSdh3PX+TpbNve7Mquf489gtwUw7l
         BaG19qdgtCKBmxYAb7qZAfjnBcpUBsbUqW77kZibY4tnzqhwwJTi0VAm8iYQUP51x1AZ
         n8DAC3cwWGnsx6SeeunBK3h9T75+asjuGAY3k9z24iyRojmqcA49KGBBiZjq8YM8jbPs
         JAnVvMDg6X1TQrmV5J//Q2007tYurTgLhm5E7b0DVSsi2F5I3sgFR7ISmO8efu8TKHms
         YSKQ==
X-Forwarded-Encrypted: i=1; AHgh+RpTInHvankEdPj9pQWYzc32jJBcskou5qAGFcdr/vmv+/qYBhwM604ljqOW0/xCotT2wGBWz4wcwlE11A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaGhVg5nLvZAPJarHZJgT6kbXnqKvO8FcljCORWZyz8i86HJHp
	N5ON15cX9Lpq7CW4xQE5DlUpy0i0r6+nbg/vTJHpZndppg878FMzzABHJUDv1eqN0+Q=
X-Gm-Gg: AfdE7cm/dCJXBR3D2qrpKoCqGkH7+u8gI8COPmWydDe1Dp4RO74zNKBMmH1xjLLeiJJ
	9LKycjzYELFzddyW5+7aO2MovJlW26PNeEte839guCr9vwNN++Sg/e644M2CURipzkp5K5MlKAz
	SnG45D2n+n0bAxsceWYG2jNyhsDeExfTRsTKMUsmRGmch96R86XhocGPAS9Grzv2nfqnkcQ3JNQ
	V9Q/Ma/t+qb2h3/4P/+OP4SAq+lHt1fkOdcxaPH2vKoWqG3do/e61tZGB4J1XJKf52gQfnUnJ78
	AWM6tIAHaIV2C/HtIIpWlXOpUpECYfI1QcJ7dYJlWo1tWELp00pnFvmo9BJxr5m2fLpGgTkJhL0
	YCf4sKiL8OgAuoDin+Ip/gY/bMGkKOJBkX0GDfgb2YRys4jng9fb5skzJO5aOPM0VttxJUMBv4K
	a8zdtqAelMzPUwfR2Vag==
X-Received: by 2002:a17:90a:e706:b0:37f:c69d:ce69 with SMTP id 98e67ed59e1d1-380aa0f53e2mr3912923a91.10.1782955998109;
        Wed, 01 Jul 2026 18:33:18 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:8901:272a:3379:8697:e33b:cbe6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f116065c5sm540377eec.11.2026.07.01.18.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 18:33:17 -0700 (PDT)
From: Ramshouriesh R <rshouriesh@gmail.com>
Date: Thu, 02 Jul 2026 07:02:37 +0530
Subject: [PATCH v2 1/2] media: dt-bindings: Add Himax HM1092 NIR sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-hm1092-driver-v2-1-4f9f369d6a48@gmail.com>
References: <20260702-hm1092-driver-v2-0-4f9f369d6a48@gmail.com>
In-Reply-To: <20260702-hm1092-driver-v2-0-4f9f369d6a48@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ramshouriesh R <rshouriesh@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3320; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=GBwoj0wKX6WvpSwyWFpUryr+T2rxfPCqj4p2MWOY66w=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBqRb/SqdP5XbnOtvrTmNT6XnGPxPbuinh3Tfqqa
 e2ON8i4y9CJAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCakW/0gAKCRAVlYpeERwF
 3lACD/9QI+sLmt9JZk9we6koMfTcYg2WSXhifAO3dpKIULbgQdT1FteQA7ziGLu/D8sxET3QeTb
 h7K2MdotmUKCD4xKhf5KDNDhmSCYzumJlyvFE4JX0wK4Gwpd06WVxSaUM47IvCTdiUoYiH6tky8
 JCjj/dbRJRcszcgLmdS9L2k9PMMHHaYGxcTWmPNhv8xuJFE4BIRoyGO6zBKhzoJBfhCGHm8tmdQ
 htGxrWkFi+N+j3D1N4RYJFRbvudEzuDZhzNMEkr7BrmMq14mYGo5XMMx7dv09CEmR1oJ6FwoLwG
 6mrUk6hgoVLcekFWbnYQFWoPYKTLpgqi1UKgrkDAblBKvaQqOHUBQQtUD6PnJcgVXFWg7wjt4F8
 3HSQBR6icKG6/RiwXHgKqEMeHYcTEBg05DElkp8r9XHd6ZCbuoSU49snLzwWvoQwYlU7epDDVH0
 fl2K7bbwonVcOyXFwpsRAk0R3HrjteK/aTfsyCv+JkPtRte+gl2rYXTy9vafJi3UK1xQm7BDBPp
 vl4/KIeY/K7gh/SUZAJnCqUZCt5/iMcyGjJngcrdUtHXDFZTXEpHUv1nwDfl47K2Td6Mtidrnvb
 SXsP2Lq1k5eHeic284G7x0JIwmjGfvNJqGLO/Q32/fAcPEZ3HDxeuT/cnB35qEHIx2C7ZHPnxeE
 +ugYU+EPAt79eeA==
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66288-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rshouriesh@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rshouriesh@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,vger.kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6CD1C6F2C11

Add a dt-binding schema for the Himax HM1092, a 1 megapixel monochrome
near-infrared CMOS image sensor used as the face-authentication IR
camera on laptops. The sensor streams 10-bit RAW over a single MIPI
CSI-2 data lane.

Signed-off-by: Ramshouriesh R <rshouriesh@gmail.com>
---
 .../bindings/media/i2c/himax,hm1092.yaml           | 107 +++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml b/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
new file mode 100644
index 000000000000..d324569836af
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
@@ -0,0 +1,107 @@
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
+        properties:
+          data-lanes:
+            maxItems: 1
+
+        required:
+          - data-lanes
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


