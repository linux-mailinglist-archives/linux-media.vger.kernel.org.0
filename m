Return-Path: <linux-media+bounces-66174-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YdszFDHWRGry1goAu9opvQ
	(envelope-from <linux-media+bounces-66174-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 10:56:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4403D6EB56B
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 10:56:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=A5vXwk+K;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66174-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-66174-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4AE27301964E
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 08:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E15563EFD37;
	Wed,  1 Jul 2026 08:55:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D4F3EE1E0
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 08:55:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782896149; cv=none; b=deaVo5B3VS+oBJcpv+UsvSdyyGRcLMgmGs9FdYMiJFJPW5hZXaJjBNgebcVhqeA5gjAcy7tb02weqUvLp4NeA9FHEaqvU6V3DKRiPql1kDUhrFtdUgH2mBoxRA7GmCqqsebHBLRRTYjLo+pv3oCQgnnC/vEOCLN3ze9pazeAswk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782896149; c=relaxed/simple;
	bh=GBwoj0wKX6WvpSwyWFpUryr+T2rxfPCqj4p2MWOY66w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U0K66LcSEPdufRImVyjijVgwG5/Z5l/qir+D5IZcfasa3tmIIWJWUwnMctrO69SofpIODfbAO0ZQFaVo4xZNZKTy/9kjIslERv14urXICTSCAVtfbvd1yUkguG9c/p8dXULEVt/Lk3RevwzV0gXybh0SOFkGTR/GzKlP5FpukRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5vXwk+K; arc=none smtp.client-ip=74.125.82.170
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30ec1ddd510so429988eec.1
        for <linux-media@vger.kernel.org>; Wed, 01 Jul 2026 01:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782896147; x=1783500947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XgMnN8cRWB289smPDCgRPSXeBysJiuiJpvGhUnEqS8I=;
        b=A5vXwk+KgAdDw+ZJ34ecGnx7XaOWViEzUAaasNKQqFzxjl3WGeE3NrLjdaoY5Xq8hb
         d+whjJMt19InNfK1CcDcXCSyz26aAe/UAEXxOohkiud6FDbtBYW+NsqQIIp+TBKPD8Ce
         kE5Tdo9P1iZR/cWHWbdTeENEt3dKz2RwhijWG2C3fpK4P6qK0ceppbG/bR8C/WAzNXx+
         yQQRLMPk59g30k6Tk9etFNPJ1VbNKLmxs1oRYQnsxBi5kTfEOTbFls0fv9qBOvJWDyqW
         UCuK/kNHkoNockfytcDynyIkArLaCsOE9CoIbeNgTItcS6LgNKZr6f7zJ+lCtG7rYyiO
         7pug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782896147; x=1783500947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XgMnN8cRWB289smPDCgRPSXeBysJiuiJpvGhUnEqS8I=;
        b=Kvo+VvvOkLnhlxsnRAq4Y0dVgBmadonY8t4olJVNH+tIyY4gSIlIloKHlVrbvpo3HM
         cKaWbjI7dQlNK6Uqr78yKSmWx1CtcqX5sdgTMgqlnTuLJ4txVPn95G1yT157wgpIDXya
         G/ZJfXWU5P0cI9l1MiBvDXgSmL6ZNF+E1y7DrwBhWquodt3TtYFaO7Buep/Jv8cipaZW
         mwyJxt/T8XpldyH3klyVp7r78MLnwPogJ22327O3IvJ5+YzzKE339QyOo4wpXQ4iAzRW
         ldAL6Yr8CZumw8N5fr/0rLn4HMcHavWWFsgeD9JUBtCttMkeu6BwUnWsQl+IuM3jqfza
         kV6A==
X-Forwarded-Encrypted: i=1; AHgh+RpIYZYUgEcE4tJf5is6hqGQ7nT58PQtqDJ6ZcPOjDtYbDHzw4qzAxtAT8TFy2E9g4uYdm7smWFhZobq5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEPUBeFlR+g1bWvky3bIWY9zoLomCQ1gag9ZE/oYZOGuhc/Hk0
	5MXenb1xFKpm2N+T+/MBrsbRVqUI5HmyiYlQMZtVr4X4NEL/C8kBcBjt
X-Gm-Gg: AfdE7cmSdWUepTXOD+JJL890lPdSNivofDCMwB/rMHQED7d+vAxgDCWKNxpD0KgA64a
	7zjSbbxvBZAXQIyf21MNEQyZL91jSt48N9Fvp83/a6B1YL9Fv0rsqH5YljY0jfNk5O3WnRTGLVl
	HxW727hJqQ1LpO8bxMC3kNP1O95H/ykXfpNkFsU7BC49C38IcGBvnCHI6aQOW1cy0rDIKsQEJf7
	IXzxdPo1xpvX1S16aFwl9m9TzB5CjHCkBZaLfwe4wbNGCCYyn7MUXMjPZcczjaK+2IC66p0O3sV
	mY11BcNqrGCaXVasQFfDEpQwJxEZlW1HCq+sz+LpWyXO4dPiWikPvGJ37k7YF53fcidiIfoXRcQ
	GaoI406N5/Tlz+p9lWKqT+OYv37b0TWcSh8JNCh7id7Agtezmoslh43UlsNJNBjif42ZqCJBqLE
	oG9I+qIbSDqO4Ivpz8WkX4yz1qnn2G
X-Received: by 2002:a05:7300:d518:b0:30b:bda8:a70b with SMTP id 5a478bee46e88-30eff0548dcmr1017051eec.4.1782896147167;
        Wed, 01 Jul 2026 01:55:47 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:8901:272a:9e52:74ee:cc29:fbb8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2fbe011sm17797876eec.9.2026.07.01.01.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:55:46 -0700 (PDT)
From: Ramshouriesh R <rshouriesh@gmail.com>
Date: Wed, 01 Jul 2026 14:25:23 +0530
Subject: [PATCH 1/2] media: dt-bindings: Add Himax HM1092 NIR sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-hm1092-driver-v1-1-d1bd81e233b5@gmail.com>
References: <20260701-hm1092-driver-v1-0-d1bd81e233b5@gmail.com>
In-Reply-To: <20260701-hm1092-driver-v1-0-d1bd81e233b5@gmail.com>
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
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBqRNYIVW+OUizIZ6/uKTlAJQvwciEYC937NVwa2
 qHU2pwQGUKJAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCakTWCAAKCRAVlYpeERwF
 3lqgEACNpS2KPSS/CjDXT00XAnSnbzOUSmDPCW7U/YH/lA1pXq1nvE6hoOutYuqL/RsdpvI/yw3
 WMXRVYiC9IUKdYTr34D18AWU7B9LnnJHHtlrqiLnDk5ouiA/HYXnCbC8+bbeYjEpnq51KTuO0aN
 K3iOJzgdBHm9vdrlfwlxY+OuTBtx5SSw0LlZ5iwpl2J9tBRBJ3Sblsr7vgTLFsW5ys9Mejkrrip
 tYdPr+w+Lh6Wy6AgHAbjWAO16DzbxKpmVaz98rTv61MXRsf2G3hFsA1Y3I9eqlf/e26b6gFyAMq
 DTeX18FD+r/qMtWrlyo4/0zTA7U4FBSG3fJIX6Ze+5AlvO1DcQqfCYSchlbWSss7K40s8+2oOyO
 N7PqY4HZI82KVm1mv+Z/tXh8JbyIjvXyjZ4zJo03/OvMqnXlxlzNzsmFXwhfUy5O/2lIn5HR65k
 Z/AXkOKbQe4AKqt+FRqN0qfHyY2fkydsQlmkxb1cO/dbBFloA28LYISwXxjFFcq6ACtT+8XQG3z
 S+pLZnjVHD+Um37/H3lYLxdmmfLcWqCIJRWDf2pAVGSGESPPrCaAv/OEmqz6KQMLMAGw+/zzyGR
 yYqgeod6lo/+XrlUtNha3cZif9RpwphfgOQEOEz2PeDYTclNAfqTauzFiWTVy8K2HHc9DoOUT2U
 JpMROhr/86XKVgA==
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66174-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4403D6EB56B

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


