Return-Path: <linux-media+bounces-57795-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFjmBVHhy2n0MAYAu9opvQ
	(envelope-from <linux-media+bounces-57795-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 16:59:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC77C36B4AD
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 16:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2D4B8304289E
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 14:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BFF83FFAD0;
	Tue, 31 Mar 2026 14:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riposetti.com header.i=@riposetti.com header.b="PUMdMtVL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-106100.protonmail.ch (mail-106100.protonmail.ch [79.135.106.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912553FF8BE;
	Tue, 31 Mar 2026 14:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774969135; cv=none; b=FHa3y8rgyM5sr/Mx+OYyTGXbAbUNGkuP5HiJWUVsDiuQfvYtewvYfykbD7iHh6zLPmdp70BKbm5IiUSZ8ZLwgKGSCP+Zt+rg49m0m7P1cZloe2pVw01AkCfhVn5NH234hP0BVO/BS/AB7Ayu6pgzX/+2nBtkIq96QNrZvxaCCP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774969135; c=relaxed/simple;
	bh=HANM5EJt4ju45nUxNxvL4TYnkJHnEzlv0DmMsyHPNtg=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZRM55RGeBvQ332u/qtUDNgesTAaAhyM+YGX5mlea9gfIjQXzepB3Q0E1ZnPVsXWxoyDDcOEBi8Za7XixTnRH4M7eR3F+fnvphxblHEp9VMk7hg7sF78KYIUnRJAPj4PaHVrib9hGL6k4Zu82bUzsm+iWUT+PXTBWx7+HQdV3R+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=riposetti.com; spf=pass smtp.mailfrom=riposetti.com; dkim=pass (2048-bit key) header.d=riposetti.com header.i=@riposetti.com header.b=PUMdMtVL; arc=none smtp.client-ip=79.135.106.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=riposetti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riposetti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riposetti.com;
	s=protonmail; t=1774969122; x=1775228322;
	bh=ZZNQD3G9J3JdUO6QCht2m2AihxeJ0DQQI8Ah1eY0QVE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=PUMdMtVLvSINHFjgqmCz+ixCeGZWD3m+U0BGM1jZyhPvYijU9gJ4fyM4fxcPzBnQx
	 2ya2xh6oEFofDKYMP9by00cXkrh/GORzzeTubyFhQ5aOf989B2uzSFrAC+s2UAd7eI
	 H9Nm15kt1x0DIDKLCYInys2ot2kHH2ZD6+jLWBSGEGPWxqeMLfRZrAaxlt/Gr+LgkU
	 jkX4/pT3n+PZ+7Cl7KRpuE1CBOdOkW87y69SLVMFT8VKSxI1ZfhEoHI25JESDuKjHy
	 92TDtlBzR4NtKKAH+TtjbbehzXuuKs/iYwNxVyjNyd/2/jvuWA9+p7wvgSu4wsbWSm
	 0ha4ZXLOHFnIg==
Date: Tue, 31 Mar 2026 14:58:35 +0000
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawn.guo@linaro.org>
From: Andrea Poldi <andrea@riposetti.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrea Poldi <andrea@riposetti.com>
Subject: [PATCH] dt-bindings: media: hisilicon,hix5hd2-ir: convert to YAML
Message-ID: <20260331145748.39349-1-andrea@riposetti.com>
Feedback-ID: 120562977:user:proton
X-Pm-Message-ID: 6e82684393a329d96b689ad0192e691e49dba100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[riposetti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[riposetti.com:s=protonmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-57795-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrea@riposetti.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[riposetti.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,f8001000:email,riposetti.com:dkim,riposetti.com:email,riposetti.com:mid]
X-Rspamd-Queue-Id: CC77C36B4AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert the HiSilicon Hix5hd2 IR bindings to DT schema.

Signed-off-by: Andrea Poldi <andrea@riposetti.com>
---
 .../bindings/media/hisilicon,hix5hd2-ir.yaml  | 53 +++++++++++++++++++
 .../devicetree/bindings/media/hix5hd2-ir.txt  | 26 ---------
 2 files changed, 53 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/hisilicon,hix5h=
d2-ir.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/hix5hd2-ir.txt

diff --git a/Documentation/devicetree/bindings/media/hisilicon,hix5hd2-ir.y=
aml b/Documentation/devicetree/bindings/media/hisilicon,hix5hd2-ir.yaml
new file mode 100644
index 000000000000..f5c28603ed0a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/hisilicon,hix5hd2-ir.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/hisilicon,hix5hd2-ir.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HiSilicon Hix5hd2 Infrared Receiver
+
+maintainers:
+  - Shawn Guo <shawn.guo@linaro.org>
+
+allOf:
+  - $ref: rc.yaml#
+
+properties:
+  compatible:
+    enum:
+      - hisilicon,hix5hd2-ir
+      - hisilicon,hi3796cv300-ir
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  hisilicon,power-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle of syscon used to control power.
+    deprecated: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    ir@f8001000 {
+        compatible =3D "hisilicon,hix5hd2-ir";
+        reg =3D <0xf8001000 0x1000>;
+        interrupts =3D <0 47 4>;
+        clocks =3D <&clock 0>;
+        linux,rc-map-name =3D "rc-tivo";
+    };
diff --git a/Documentation/devicetree/bindings/media/hix5hd2-ir.txt b/Docum=
entation/devicetree/bindings/media/hix5hd2-ir.txt
deleted file mode 100644
index ca4cf774662e..000000000000
--- a/Documentation/devicetree/bindings/media/hix5hd2-ir.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-Device-Tree bindings for hix5hd2 ir IP
-
-Required properties:
-=09- compatible: Should contain "hisilicon,hix5hd2-ir", or:
-=09=09- "hisilicon,hi3796cv300-ir" for Hi3796CV300 IR device.
-=09- reg: Base physical address of the controller and length of memory
-=09  mapped region.
-=09- interrupts: interrupt-specifier for the sole interrupt generated by
-=09  the device. The interrupt specifier format depends on the interrupt
-=09  controller parent.
-=09- clocks: clock phandle and specifier pair.
-
-Optional properties:
-=09- linux,rc-map-name: see rc.txt file in the same directory.
-=09- hisilicon,power-syscon: DEPRECATED. Don't use this in new dts files.
-=09=09Provide correct clocks instead.
-
-Example node:
-
-=09ir: ir@f8001000 {
-=09=09compatible =3D "hisilicon,hix5hd2-ir";
-=09=09reg =3D <0xf8001000 0x1000>;
-=09=09interrupts =3D <0 47 4>;
-=09=09clocks =3D <&clock HIX5HD2_IR_CLOCK>;
-=09=09linux,rc-map-name =3D "rc-tivo";
-=09};
--=20
2.50.1 (Apple Git-155)



