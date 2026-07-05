Return-Path: <linux-media+bounces-66611-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WSSRAfbNSWo67QAAu9opvQ
	(envelope-from <linux-media+bounces-66611-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 05:22:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BDC708DB4
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 05:22:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=fGIa6niK;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66611-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66611-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D193B300956F
	for <lists+linux-media@lfdr.de>; Sun,  5 Jul 2026 03:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE232459C5;
	Sun,  5 Jul 2026 03:22:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F4533993
	for <linux-media@vger.kernel.org>; Sun,  5 Jul 2026 03:22:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783221746; cv=none; b=tsDIszuN0Tsl4u8nMt3GpI6FJ/m7ukjM/5X4mih1pg1n2yLi2Tf7Zj9NH9KaK5Uz0loPOR2wJesf9iT2zX+c6NhItZSs71CIJiNYJ+LkxkJwv8TCijtKX0eaGp4390TPPO6KRu0uxFgh7FRUhrIIMSoNG3Zx+QjiIlnEfYg3zYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783221746; c=relaxed/simple;
	bh=AARiKfd2W+SLSBr6CGe7FMomAjcflSVYj2+XRc6YAoI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=StgE+g422r1qCVwvRGjnL3toNdGTHAyCtv7kIus6hAmSh7qZy/fHqVU7GgF5floV3khGrlkyLUfavnbGG/g4NkUfmFbuK+pqtgDZZgsM77IoKbnWpHlL9nOpy2jNTKeZYbO30H786UEp99QUjQ9nSeH++aOGCdYDJO8K5odfEOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fGIa6niK; arc=none smtp.client-ip=209.85.214.171
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cc73e322dbso4691645ad.1
        for <linux-media@vger.kernel.org>; Sat, 04 Jul 2026 20:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783221745; x=1783826545; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TuqQpmGzRnX3zbaZKJbpvLAXlsBzMhwAPHYNslX9wpE=;
        b=fGIa6niKb7r56pd/3rbvaUpUzozEyLKyeEP9T1IkhdeVuGj6ZRckoIDCKxnpFa8YJ+
         rIMYI895Ev8pbxuuTPnzuHlmibOsK+gtq7IWf3wK6hP7mMuTRWkOccNxRSXKW1p2tat5
         mqeQc5LrIPfGVjZa2fqy7Hb2qGqZdiKZOS+qC8MJ1R0JU0Ey7QlPeM3zx6n3g7bvgy4Z
         dY17kEhIhNo56+R5+lBPev/tjpZUeDDW8arjW629MyCYZ46RWjJYyl0Xo0jcnaqj1neN
         2ukdofglwVtRbDEFuSyLigF2dmRgbDT0M0gTMpNGcKHONpzv/7ncqoxPUjz+pIFdVoqi
         E1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783221745; x=1783826545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TuqQpmGzRnX3zbaZKJbpvLAXlsBzMhwAPHYNslX9wpE=;
        b=TzDR2vFYuc7oBLfBdeFkEg8DwjSxPWb2YaKpDhHRLAOxyC74J1fzyE2iGIxWobJysm
         mBoQxRXOUuRQr/bMPnZkufZerRlPGEjukfKBH6IJaCyKRDP9LTJcdn59AD6odxCDjV41
         DXeKLxkvwle+QBgvU2Hd7axEFDGfF4V5mwRXMSK3VOQldq1ieJPKc27lbSTENaxbnG3S
         FnMcfSr2OmYp+D4Dmk88+rMhkFTIf/tyhxJ+6ImdYpW9mmSEzoQ950dmgc2eE67QsgNV
         5kI6AotLVH0SlU6AkDLur7qt75zdgtSixwkAoDOdjazTJKnDJphzjJYeOU93DAF6ENHs
         bPXg==
X-Forwarded-Encrypted: i=1; AHgh+Rqib+S8FGsDGlHo9H0OvQlQU2tB7w8RPfbMsOZG/0mLprRXvQKU1wHBsYFEq3+nqBCcUiMNVtJRExpbyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEysdAzWF3+rUaNiEc3JIdcyGjjdvk6AtcIcMVEgtIkiXuH5AE
	dsrnuLiVOeFlzc3P/qz+OCwJLyfKr1EgYdxhXkt7n7rC0QUxLGuc+jTm
X-Gm-Gg: AfdE7cln7smVswEsVVDRxwHwMla73TzzG1Ve9lJ0IA1qb+wYPXMoOhZRS/Fg5NI27ZJ
	I59hihqsgYwtnm7g3FvjiswSgOJ3aFAuL3D6SQcjl8tlt2Wdky0FzCLox4UV20T/QTXkZQvJjGv
	vT61IlB9bxuLhou+EwGOL/bZMJR1c+grwiGLA8eU9wNSEg9xYPDE9gASLuZQFknddDUybamFrR4
	o6NddcKnMGVZIdhe/5c2sF8HIx9AYhbT19oSX4Xu0R0RznNlYlBO5i57RaigMOi9QwUw0RmItKv
	3U+fTK4bSUzCv3JC1w/djODZ78cLk6hmSIccKiPJ1Xp0NslQNjxDaHM1lrT+3B5PscvXbAKUl1t
	x//24zfy4Ovxvh5KkYz65sj9/hDUanTushCG9yirwQfWt4bjyhfpPVEVhhy7i9kKkW5g9p4SoH1
	RBkIYk+wYT7+mfVpWR
X-Received: by 2002:a17:90a:e7c4:b0:36d:7b62:4767 with SMTP id 98e67ed59e1d1-382802bcb6cmr5020863a91.5.1783221744732;
        Sat, 04 Jul 2026 20:22:24 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:8900:e54d:68b:5bba:3eab:6b41])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813c4dsm35139723eec.7.2026.07.04.20.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 20:22:24 -0700 (PDT)
From: Ramshouriesh R <rshouriesh@gmail.com>
Date: Sun, 05 Jul 2026 08:43:34 +0530
Subject: [PATCH v4 1/2] media: dt-bindings: Add Himax HM1092 NIR sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-hm1092-driver-v4-1-0a13ec274d89@gmail.com>
References: <20260705-hm1092-driver-v4-0-0a13ec274d89@gmail.com>
In-Reply-To: <20260705-hm1092-driver-v4-0-0a13ec274d89@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3470; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=AARiKfd2W+SLSBr6CGe7FMomAjcflSVYj2+XRc6YAoI=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBqSc3lWSXYsaIVI9e1vjbm+XQ1e1aPlqqbZzLRm
 wSJKJnZbVuJAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCaknN5QAKCRAVlYpeERwF
 3r7zEACgHwpiRkOmKbDD6yEq6WSdwbUEaD0ZBZina9jzIaMiSrR3gKwuNNG6dJMTrpEHFF+FeBf
 qBN55b4EKyIZoKwUSMDHY6zB7hn1jsYjbYlkxprOcnmB9soXDOYrsB0iyZOuOThd+5gTRQOjCFn
 AKU90jt5cIwZPM3fspJhPBspt0tcCS2nkpxzXzPj64yXFTtibanIeP4Qt4rrKIc3lkbcxArBhEs
 FP+yACiPFp5QsGj3u9B4w0RLHTTNI8NAVijCN2ZRw/G1Jf5fodTE/2+bLSq6biGHAEwpqpobwOE
 pOF4wJsRDL0kDzl5+kWWBJr5N/3CDfbMPC4w4oGR5e2s7n/0uklejtHLyFGo4//Ou8hblndVej9
 J1gGG3yQaGxTCX4cdNXJtaITwuAlCW4z8Uxtf/2SATHGCCcvGQ9gIAsc8QCdcXkJOGYLHVPOVsh
 vhg2PXP3ViXyq2OtThu7ZfcLsGKG30wcI9nT4kzpXDTZdVWK9mBvQSrvBO8zuqhlOledIfu4ail
 LoAAb+Qq/6aig37fVoL8dYnIJ6b0Nbst6gwmx4AL9eAtpCwq2UKCuIiukwMVPnz8VAGvsvRdA5y
 Ds+13R7tbp9kq92dGiZlFvM2J3+RZVSaNGVhQ2RGLW69RaWIrPksv8n5wXd+kr8Cfg2aaw9Ip07
 /x2v4tIaKJH+GBg==
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
	TAGGED_FROM(0.00)[bounces-66611-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,devicetree.org:url,microchip.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 93BDC708DB4

Add a dt-binding schema for the Himax HM1092, a 1 megapixel monochrome
near-infrared CMOS image sensor used as the face-authentication IR
camera on laptops. The sensor streams 10-bit RAW over a single MIPI
CSI-2 data lane.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Ramshouriesh R <rshouriesh@gmail.com>
---
 .../bindings/media/i2c/himax,hm1092.yaml           | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml b/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
new file mode 100644
index 000000000000..49f8d6e2ef93
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
@@ -0,0 +1,109 @@
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
+            items:
+              - const: 1
+            description:
+              The sensor uses a single MIPI CSI-2 data lane; this defaults
+              to 1 if omitted.
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


