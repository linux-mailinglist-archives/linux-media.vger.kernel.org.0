Return-Path: <linux-media+bounces-56582-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHDeL1EgvmmAHAMAu9opvQ
	(envelope-from <linux-media+bounces-56582-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 05:36:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 619A32E3436
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 05:36:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6E587301DF4B
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 04:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF672DA775;
	Sat, 21 Mar 2026 04:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="XIHvNP5/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2F129C35A;
	Sat, 21 Mar 2026 04:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774067788; cv=none; b=FztG9QNCvBnad02jz1cBBSJLolDLrfvcSuwXUj3PBE0BXiiKz4As8xQBBDydRijZFlsmCZ4+ElsP765VtIB6U0+EQYx7NQy1R7ijilcu2l5EhhS0ik5gWwO+evKxwweFwi6t47BN3i+wcrcK3tiNBOHBMCs5PurTOKCzMKyZcqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774067788; c=relaxed/simple;
	bh=TTU+3w5gGlP1PFBmnkXXBArYboBBptajddKJ11/ezWw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uYa28SianhL9OYvDTwjDmsGG8uBXbLtzLajJMegMtN58wdHhr9sKaBzJEitjoeyOjqTKlmvbfiNtkCnw9e6AXLmOszJibr6L9uWq/UHAUKpSYj5OUCtHKFfKLN7wol31u/799YHoxTog76wXj3He5vuIclKZG8xdpSJvRseg45s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=XIHvNP5/; arc=none smtp.client-ip=185.70.43.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1774067776; x=1774326976;
	bh=nVGlVY7PnevwT+dRlwuWfy8apTEDeJhggUN3B7DPXV8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=XIHvNP5/2jcs6+IP986woyMfkhlyXfBXTDWfxTuBsMKmQfZGgbUFsT2Oaiy/Td1Go
	 D1CgBjICB3X4k9mbZkpJ4wArkSwaD4HXjAp+46bvrLwHffYGflXPhmaF/E3InDbW9a
	 ZbzOgo/6+K2xKsRpRnv/aJDZWJZLBRosX4/uRaLRB2WgS5tm6bI/i7vhFjuC3m060C
	 2Em5REyquxjmXJqDd82mkmIEnAbRvgJEKgxVJcpMvKvtrx9CUpUY5QlLsaBDZHld99
	 yhDtn9RG52GLPuKWKCjwL8nAZXQoRS2Ryb+fA6u3qebx/278PhUJ27/1wH9HlkbMsg
	 CqSj+lBeyKRwg==
Date: Sat, 21 Mar 2026 04:36:09 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Antoine Bernard <zalnir@proton.me>
Cc: Arec Kao <arec.kao@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "~postmarketos/upstreaming@lists.sr.ht" <~postmarketos/upstreaming@lists.sr.ht>
Subject: [PATCH v2 2/3] media: dt-bindings: Add OmniVision OV13B10
Message-ID: <8or0YwK4oKEWSf5sBtuu8Xo6CYaQTVSu3BhkNBR_xv6se8zLgy4VVO3Q5gvuNk4UyQs_omqdqaqHhZBfLJuoaibc7A8foK9ISRweQCkInb8=@proton.me>
In-Reply-To: <ab2-j6tMKTAlCDcT@kekkonen.localdomain>
References: <cTZxBKdzN37cy_eGcCK3hocAgzwzdfBnsqWXpJnNYFZb6Odl4FspR5333ZBJIJG5dRunnVBB3fWiRJL_pq3SmykhDKxaGPRl_T5_BShJIng=@proton.me> <ab2-j6tMKTAlCDcT@kekkonen.localdomain>
Feedback-ID: 152853527:user:proton
X-Pm-Message-ID: 6a4873795d72cd1a34934a69a68083d479986038
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[proton.me:s=protonmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,gmail.com,vger.kernel.org,lists.sr.ht];
	TAGGED_FROM(0.00)[bounces-56582-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[proton.me:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zalnir@proton.me,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.36:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 619A32E3436
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the device tree bindings for OmniVision OV13B10 image
sensor.

Signed-off-by: Antoine Bernard <zalnir@proton.me>

---
v2:
- Rename to "external clock".
- Drop link-frequencies and remote-endpoint.
- Set maintainer as myself.
---
 .../bindings/media/i2c/ovti,ov13b10.yaml      | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov13b1=
0.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov13b10.yaml =
b/Documentation/devicetree/bindings/media/i2c/ovti,ov13b10.yaml
new file mode 100644
index 000000000000..b96b3683bc71
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov13b10.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov13b10.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Omnivision ov13b10 image sensor
+
+maintainers:
+  - Antoine Bernard <zalnir@proton.me>
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: ovti,ov13b10
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: External clock.
+    maxItems: 1
+
+  reset-gpios:
+    description: GPIO connected to the XSHUTDOWN pin. Active low.
+    maxItems: 1
+
+  avdd-supply:
+    description: Analog circuit voltage supply.
+
+  dvdd-supply:
+    description: Digital circuit voltage supply.
+
+  dovdd-supply:
+    description: Digital I/O circuit voltage supply.
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
+            maxItems: 4
+            items:
+              enum: [1, 2, 3, 4]
+
+        required:
+          - data-lanes
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
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        ov13b10: camera@36 {
+            compatible =3D "ovti,ov13b10";
+            reg =3D <0x36>;
+
+            clocks =3D <&sensor_xclk>;
+            reset-gpios =3D <&gpio 117 GPIO_ACTIVE_LOW>;
+
+            avdd-supply =3D <&ov13b10_avdd>;
+            dvdd-supply =3D <&ov13b10_dvdd>;
+            dovdd-supply =3D <&ov13b10_dovdd>;
+
+            port {
+                ov13b10_ep: endpoint {
+                    data-lanes =3D <1 2 3 4>;
+                    link-frequencies =3D /bits/ 64 <560000000>;
+                    remote-endpoint =3D <&csiphy_ep>;
+                };
+            };
+        };
+    };
+...
--=20
2.52.0



