Return-Path: <linux-media+bounces-66314-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fAYqKocWRmpvJgsAu9opvQ
	(envelope-from <linux-media+bounces-66314-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 09:43:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 151AE6F44D1
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 09:43:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=OeTpNOKT;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66314-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66314-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6E11330C7078
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 07:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E461D3932C3;
	Thu,  2 Jul 2026 07:34:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F89E3932D5
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 07:34:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977692; cv=none; b=Z7K4PLfU/FrI87Rk92cme6jH8qY14b6OVbRdIEjH2PJMzbr7mePOEVYCxrAxri0qCimGWiCw0B66qJwt92c31wvH4j+CQJq3kRGUn34ZFGa83nFZTtIfNHghDqUN1FNLSsh170CGv9LSdNgLDf3mNWw96qjI+jKX6asOd7R5mu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977692; c=relaxed/simple;
	bh=cv9nHvHq94cyshMFED23S0p/8n2aHyuezbgSJ8p2hTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UT9hPOn0hVI2fFf0p8Wgv8fPP34TIgjR13T3bN1VUb4oBmmv58EyWZ65QYUsy7KJXagXLNlruKh1YPE2awv4gg013HZSac2LI8Pv288u5SEFVm4DJzRY8UHsusAMIHa8nP2DEy+XwWITBIRpmJUdeSJYbjkZzCHVRf9/89ItqD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OeTpNOKT; arc=none smtp.client-ip=209.85.215.173
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c9672e02e05so653020a12.3
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 00:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782977690; x=1783582490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UUB+0in7NeYsVonwfzqEHaDpNUcQJFtKaqdplo8pdwM=;
        b=OeTpNOKTae7qQ6WylJnAxyCZFrtGbpi3z6oDqkXaUa1FODb74pZbXjjm302Ok5ADZ4
         uSv8iqfYfFxyy5B/y0aAD25FDHykzdQyorHbB+1/q0OIYZ16V8qZjRGrkcHhdwM1oZBR
         Vag6kVrzlvk6yrnxKhS+XyfI2gaaCgLbZIxLC5j4jGPhIKrBQfR6MwAvys9zAVyIa4hQ
         ZCLWUIwflGZTZ2oTqv8UMhGk+L0O0iGz/SPOz7C4IwUXgjx8xEbwIqDoeNPdYihH6WPn
         GAgGrYCDtvYB4+wlpLxdXwby8daMUkJjkx6/jD8xs2bwiH4GZT7s5tf3QSDwP1W5hfvw
         waTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782977690; x=1783582490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UUB+0in7NeYsVonwfzqEHaDpNUcQJFtKaqdplo8pdwM=;
        b=pGEfWulyKlDPGuNd/XX3aCfkyDvy4pGd3WkP6pfxfayCz8SGpt+viLhUkUqxr6cltr
         7Ie1rFdLrI0caF0THx0R1gvGacDx/aRrFgoeFCw13mz8KrDNdEzhgefSft2wliUmMEff
         OKBJG4PfJBFkiJeQzjrOF5Juhr3pCCLpQT9ORikbsFagQMXSgAzxVJ6fR0Y5tRFMSkTz
         SPqrSKQ75AoxVgkHCmneh/XylzcqmNbLeVm6Vf8RjIXIxCIykbDrCj3VG8mLYaCBG8cz
         57LtgEZJQRUaAiHmmJy43L5vQmneFlvcvLEwzqRkyEaIel/PB2GtUg7J/f6GmgHpOLz4
         4npA==
X-Forwarded-Encrypted: i=1; AFNElJ/LcM735isZvfrq+ot/Fy5vc8OsFwp5N+fpmpnhSSn7ASfn3W0cvH0HGfV2iUNA8RhHYx95mcidGak9gw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr9yyDypDViQ47+QrUQL6GMkSl4ZIsjiCGAip2rWjf03Ju6YJN
	KWXhYDcoXHDzTbigqfYZ7aup4ovM42YEitLf8h6VS2dbmcPYENdbdurXZzAI8SApyEtteA==
X-Gm-Gg: AfdE7ckc6j+MsNDvgZV2021fT+xU/+PQEEmn4qPdPIUrTofsteDSNm2+u4Rw5TFe1TL
	q60W4W/eplCeoKWQsFt7T40OgzDTvwFp+q/Su7+5Vd/8DdMZxA0LeZKv7LfRjd1RW5LgV0Osq4M
	0sUzRZZVKBXiRglgibIiO/XWdx5cH8rMLKxALBa8V37hxVMOHq9eCXffi6AoHBgvSOrWbRP1ImH
	PFppIBSDXtVs3hVT00KhGAFxR1wVxSlJe7lRpVK78j0uIRVqbk58PyZmOdnnf0ry7/H2nHTgq8j
	rq0lvVdP3lss10yiWwNHBsVN+4EJn7RcBOG239OzHOukq8DjlkkXMd5wmQ7v/v+bRt1uawFwoPO
	0J2J1W1IHF9VEj0abiwvxJZjndDnVCS/7JAZUnpzwybMRi7wsfk6+zn8pfFBSSS93Ww21mQKu/p
	q4ltENAIdZ6ZwVj80JKw==
X-Received: by 2002:a05:6a21:3987:b0:3bf:ae43:4d26 with SMTP id adf61e73a8af0-3bfed0e1385mr5829279637.5.1782977690185;
        Thu, 02 Jul 2026 00:34:50 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:8901:272a:b5f0:4094:eeda:86b5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb84405sm8461440eec.17.2026.07.02.00.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:34:49 -0700 (PDT)
From: Ramshouriesh R <rshouriesh@gmail.com>
Date: Thu, 02 Jul 2026 13:04:25 +0530
Subject: [PATCH v3 1/2] media: dt-bindings: Add Himax HM1092 NIR sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-hm1092-driver-v3-1-85faa7ff4fec@gmail.com>
References: <20260702-hm1092-driver-v3-0-85faa7ff4fec@gmail.com>
In-Reply-To: <20260702-hm1092-driver-v3-0-85faa7ff4fec@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3376; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=cv9nHvHq94cyshMFED23S0p/8n2aHyuezbgSJ8p2hTw=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBqRhSOvrhFFntHdwL1IfH/M2DJ/suFQtVp1GNzN
 tXJbZ/fct+JAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCakYUjgAKCRAVlYpeERwF
 3vJnD/9u2KhvXVZQZPSkBj7pGF1AhbbU4d1PYu3MYS3oVrLvj+y7VSSQ3wEgqXdgEwY3lYi7o2W
 +wB6M1TW321w/dtIbP6xmuinc8xacAYIitZe3uGmdIojdlBOzocQyd6iG8mcvjDfNiElP+pROJe
 SO51L4wcO3eQHbUf2rVMRVM2daON5gsWDV+5bbXQCfmPPZ0I7kIZRdVl1s/5C/E/8Bp08hzTVlf
 qlMMO5yX09pZ5uaj/Nyssh5uAnbGkXMOa34eOM1b7XR8SiFuPRmFyT0zxb3pv7+ONH94Bg+IVcf
 Exib6H7n5p01v214xZBsxLCg29S1n64/tb1Wy6Jc9l/GXfpJ3NNwgMo2aiSFrBgfCSDpvsmqFrX
 pt4nP4blLcpVvFn0L8pozjtWwNHCc9LJdlf9YDErI3wcx9zi5/EKdE64LxfOU/gEkAkQG/SFf5T
 w2ohi7rZmSfV9tJ73yB8xNaRYX28x4cElnkEYmPR9JVZUnq+PfXfksateYlb39pHfu0yV2MxmoU
 sJmPudaBoB2MovvnYn+wbsbYiMT1tTpo1fKrsjrsf6ZnESHN7cqlWRLq+Ms7MluJN2O7LlaQhKu
 gSbDmH8+lzp1YlvjHNyYJDp1gwk8L7wOezkdFOBn8sU4Dp9v4rmBMm//PtbY0kAuP7Rz5bX14FK
 HvWTQrtohoXOL6g==
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66314-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rshouriesh@gmail.com,m:conor.dooley@microchip.com,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rshouriesh@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,vger.kernel.org,gmail.com,microchip.com];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,microchip.com:email,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 151AE6F44D1

Add a dt-binding schema for the Himax HM1092, a 1 megapixel monochrome
near-infrared CMOS image sensor used as the face-authentication IR
camera on laptops. The sensor streams 10-bit RAW over a single MIPI
CSI-2 data lane.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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


