Return-Path: <linux-media+bounces-61469-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHj7A8KeBGr3LwIAu9opvQ
	(envelope-from <linux-media+bounces-61469-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 17:54:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B48536925
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 17:54:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 133BA31B6155
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 15:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3907347DFB3;
	Wed, 13 May 2026 15:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DiQ3s7pw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DFC47DFBA;
	Wed, 13 May 2026 15:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686440; cv=none; b=BPfmEXB7I7C0P3tdJmLNrnvsmwQJAEd2aYwmlw8dl4gVQyM8fmIRECrrzvPXJrRO5k+RinAMeNhZ+DPcrlZGlYkSoL3AwF9ZQT+AI4tjDTg+9Y4d9ET2IxyMLGYz6JxLZ5ASrzbqBeAzGo31yrMm5/03JKhc1+6Voiwcn98PsmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686440; c=relaxed/simple;
	bh=DBQAsVrXxVS3+mEJdi5TrtdDLMvW8z2GzIx8Iylwq44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cr9QV6E0ZXXJLEnCsfFg7gBJeRe1Od9oIPcNp1g1xeeSUZAIcrI3PaWViNMx5r3Iube07DhxxZ7QKGwk++vETmRCYOi3rgWMn2kL9+qdFRMocIAOCfz9GFJcjn0PUcRjPGwq1tcLPJj00BRc9v0KBp/eItnmWEwVVT3yYsk9f/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DiQ3s7pw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:1da4:3c70:f102:9ea:5df7])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ECB22A06;
	Wed, 13 May 2026 17:33:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778686429;
	bh=DBQAsVrXxVS3+mEJdi5TrtdDLMvW8z2GzIx8Iylwq44=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DiQ3s7pwSE2xKkDGVDReCbM2L9NtwJp9uz46hIzKojaId8ozw54sgjA1diR58IZ0R
	 uSGm8pW1PY+Tdkb8CdyephQIaffBYt15Dk5xve9KsMzCZSilat3kff/JNKPmEALj/C
	 mptXbsAHFj0O6+/0BekTOIr0+3OBP/GFJRbv29hQ=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 13 May 2026 21:03:16 +0530
Subject: [PATCH 1/2] dt-bindings: media: i2c: Add Sony IMX678
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-imx678-v1-1-30fc593ed8fa@ideasonboard.com>
References: <20260513-imx678-v1-0-30fc593ed8fa@ideasonboard.com>
In-Reply-To: <20260513-imx678-v1-0-30fc593ed8fa@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4262;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=DBQAsVrXxVS3+mEJdi5TrtdDLMvW8z2GzIx8Iylwq44=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqBJnZDecPOCW5ldIWgzDorTkmX6g16fmIHmKL3
 v9cjKD8X3+JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCagSZ2QAKCRBD3pH5JJpx
 RQykEACeMhGa4DFBGtFUoBhgYVL0oONxGTU4CUTlN2UEyyH+FG2XDCSDt9B6dMGvCLOTSkDe5JC
 uNxpk7dn8ZNcHnVWYO7Lv/JGCz7UwNV5WFMgLaWQtMcEdAv7vl2iuNWP4v5ffOIGmBeG8ANWEtu
 cjGe1Jdjjog7rqloYre806UQg2cuVzo+aI8Fdx8vpPvS2MoW6deLmZyIU9Y+SI+t0pMFxJ0fKpT
 k3by8bCazCeZQHo2ahMRAC9pwKZf9055vEXA6YkXCs5QnkDo+4cNQeH9plHioWlmAeCW8MWm1cl
 QZ804ezHRmA0zoAaHgjxxtKBhqpNi7t6TP9ylcN+99uaf/Y1IZbnMePh+nIPIJI7xltwnhPVL2K
 ESGPX5UFrvCGiO3bQB9hS1hhYllSJGE0N6kDmTgRlw1qBh+vtXo+3ZBJfVywGxNvl8xsGHSqt1W
 x0vB7RaGRemP6imIq1icOMBkXqAMC3CoLpe2Zp9fFdK9DLFxf7fnbtiAVcabkDuaqADOnXoVIYr
 ysx7Y1YBrLuEyC5oBz9WtByWNxp7FORkjQ4Yc/wpaO00ghxdHvlfCMIh8Pjr3r5bERk0aBgnIDG
 evvH3DHSqdWaCLXA1kVHnILlwsahgXLq1eDuCxTQPoZEb0q5Bb3AVd+1kbsvPmDHZRTEZacbQFI
 2z7+6kQ00gLDg/A==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Rspamd-Queue-Id: 97B48536925
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61469-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url,1a:email,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim]
X-Rspamd-Action: no action

Sony IMX678 is an 8.4 Megapixel (3856x2180) CMOS sensor, that can output
pixels over MIPI CSI-2 bus. Add bindings for it.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 .../devicetree/bindings/media/i2c/sony,imx678.yaml | 121 +++++++++++++++++++++
 MAINTAINERS                                        |   7 ++
 2 files changed, 128 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
new file mode 100644
index 000000000000..bb348b6e4f1b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
@@ -0,0 +1,121 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2026 Ideas on Board Oy
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx678.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX678 Sensor
+
+maintainers:
+  - Jai Luthra <jai.luthra@ideasonboard.com>
+
+description:
+  Sony IMX678 diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type solid-state
+  image sensor with a square pixel array and 8.40M (3856x2180) effective pixels.
+
+properties:
+  compatible:
+    const: sony,imx678
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: |
+      Input clock (INCK). Only the rates listed in the datasheet are supported:
+      13.5, 18, 24, 27, 36, 37.125, 72, and 74.25 MHz.
+    maxItems: 1
+
+  avdd-supply:
+    description: Analog power supply (3.3V)
+
+  ovdd-supply:
+    description: Interface power supply (1.8V)
+
+  dvdd-supply:
+    description: Digital power supply (1.2V)
+
+  reset-gpios:
+    description: Sensor reset (XCLR) GPIO
+    maxItems: 1
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
+            oneOf:
+              - items:
+                  - const: 1
+                  - const: 2
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+                  - const: 5
+                  - const: 6
+                  - const: 7
+                  - const: 8
+
+          link-frequencies: true
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - ovdd-supply
+  - dvdd-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@1a {
+            compatible = "sony,imx678";
+            reg = <0x1a>;
+            clocks = <&imx678_clk>;
+
+            avdd-supply = <&camera_avdd_3v3>;
+            ovdd-supply = <&camera_ovdd_1v8>;
+            dvdd-supply = <&camera_dvdd_1v2>;
+
+            reset-gpios = <&gpio 0 GPIO_ACTIVE_LOW>;
+
+            port {
+                imx678: endpoint {
+                    remote-endpoint = <&cam>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <720000000>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..5260cd83a255 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24911,6 +24911,13 @@ T:	git git://linuxtv.org/media.git
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
 F:	drivers/media/i2c/imx415.c
 
+SONY IMX678 SENSOR DRIVER
+M:	Jai Luthra <jai.luthra@ideasonboard.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media.git
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
+
 SONY MEMORYSTICK SUBSYSTEM
 M:	Maxim Levitsky <maximlevitsky@gmail.com>
 M:	Alex Dubov <oakad@yahoo.com>

-- 
2.54.0


