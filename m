Return-Path: <linux-media+bounces-56500-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEqhLQgTvWnV6QIAu9opvQ
	(envelope-from <linux-media+bounces-56500-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 10:27:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5582D800C
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 10:27:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 96935300DEC8
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 09:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79746361DB4;
	Fri, 20 Mar 2026 09:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="nFDQk0lD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-24424.protonmail.ch (mail-24424.protonmail.ch [109.224.244.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C85C35AC1A
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 09:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773998851; cv=none; b=L3L5pSheck0l3aX0m+SmvgBt+XPp2D833kv0An8FKss/ZL+Xe3IA490cVCI6KbpFk5RVA1KRK8+2i48FhYHH7KKg6Sch0+mVXDZkYs+5JP/1I8S+1zHtrKDBWazaIPsLAIU2uv96ypuVr7NDkBtodeDyGc7/LWxbtffaueKrKyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773998851; c=relaxed/simple;
	bh=BTu10YAWqoUNfjpxxThzV+1+nVFXkDNJdtXBf46Mt8o=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SuDpuro1bxWQnxc280o2wXNikx1QfwEWFBElVj+QGCoUe3SEg4HXNQBQEbHq/M3YxWB5e55LD287Xn39aoqr/o+4/W/SyK2Nb6zs/bsDZQSu7QhOhHPNISghYK0g8b8TCjnLyKI1Rx3w/vS6Z8h1O/vrlLdq0UYS8JqF0Q0eDjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=nFDQk0lD; arc=none smtp.client-ip=109.224.244.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=7qry3kos5raz5g53f7lzjqonzi.protonmail; t=1773998841; x=1774258041;
	bh=5HYBnmKaWYU8S4dJyk1uQ7F+BiJeHb1m106NqEiuGaQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=nFDQk0lDXnfZNrjwRLdGnucPx+NENZUEG1or9dCEld1jq91CJfH/zagxOHZq9aOOY
	 6sc59gughqGL7yn/UdqTe0sxQtu/kovR0J/QwjGLLHlsQ2RCub+9CYqdyyzHdromth
	 NljKVXrBS1zvNrrQXynXsXa4oBOxvhXJgiSq917h6hXeBdo0deBlk4f/hIUF9tgWjx
	 Cpznm3wTQoT4LhCS7VamgaXRQ4ZIqeVKujmbEU3DzQwJMi5XEEbPCS5CEZGQApCXkv
	 7Q1RolHDryW4bZ1VZlY2AArFBivbHQGGM/nQU06cbEyHUVefYiE6y2ctQm7idmwNu3
	 gswgGzrarP7AA==
Date: Fri, 20 Mar 2026 09:27:18 +0000
To: Arec Kao <arec.kao@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Antoine Bernard <zalnir@proton.me>
Cc: "~postmarketos/upstreaming@lists.sr.ht" <~postmarketos/upstreaming@lists.sr.ht>
Subject: [PATCH 2/3] media: dt-bindings: Add OmniVision OV13B10
Message-ID: <cTZxBKdzN37cy_eGcCK3hocAgzwzdfBnsqWXpJnNYFZb6Odl4FspR5333ZBJIJG5dRunnVBB3fWiRJL_pq3SmykhDKxaGPRl_T5_BShJIng=@proton.me>
Feedback-ID: 152853527:user:proton
X-Pm-Message-ID: 54ac38e0603605383db2949ac48107564e1860ae
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
	R_DKIM_ALLOW(-0.20)[proton.me:s=7qry3kos5raz5g53f7lzjqonzi.protonmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56500-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,kernel.org,linux.intel.com,gmail.com,vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zalnir@proton.me,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[proton.me:+];
	NEURAL_HAM(-0.00)[-0.960];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[proton.me:dkim,proton.me:email,proton.me:mid,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,devicetree.org:url,0.0.0.36:email]
X-Rspamd-Queue-Id: 4A5582D800C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Antoine Bernard <zalnir@proton.me>

Document the device tree bindings for OmniVision OV13B10 image
sensor.

Signed-off-by: Antoine Bernard <zalnir@proton.me>
---
 .../bindings/media/i2c/ovti,ov13b10.yaml      | 99 +++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov13b1=
0.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov13b10.yaml =
b/Documentation/devicetree/bindings/media/i2c/ovti,ov13b10.yaml
new file mode 100644
index 000000000000..4d6432488b79
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov13b10.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov13b10.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Omnivision ov13b10 image sensor
+
+maintainers:
+  - Arec Kao <arec.kao@intel.com>
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
+    description: System clock.
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



