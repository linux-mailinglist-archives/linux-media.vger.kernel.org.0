Return-Path: <linux-media+bounces-66440-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KHHDFmV/R2pVZgAAu9opvQ
	(envelope-from <linux-media+bounces-66440-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 11:22:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B9A70093D
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 11:22:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=j5Uwm0yl;
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66440-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66440-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28FF93053541
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 09:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F3553B3BFC;
	Fri,  3 Jul 2026 09:20:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589A53B0AFA;
	Fri,  3 Jul 2026 09:20:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783070429; cv=none; b=ZpjeRY4FL9EHG+paM5oopHGHAke3X0CKejC+Fvy2lT8r3BAkD+ApU1ZDXzWf480kecHbiU4jkgAbak7ULghpKKym1/dSoo18hVirbIiOQwzqA4AoBxBBCb4I7Ao/C8mZEtGdeRDrw3E8y7Gm6WZZqx5IO7nl6KtatKAHO1jeDQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783070429; c=relaxed/simple;
	bh=hixTmYPOlsWEt64dkf195rrwR3fcf+oBntoMKBkY6tI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VKyY6KKWMGVTEXu8Re/sDLFmeai2j9cgc1hlXF3PYqPlPGz1DGgagXYMqRx0R0qOxKVsAbQS7CnwgkQVQjY0MLWITkRnv0n+9HylotYhH9+5GrZk8T7wecmZc+f+0rGnPvIagG+Lu/XMEv6Q3Iu6KD+xRzfG5pkCSuc3P9wv8NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=j5Uwm0yl; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:8a87:d565:effa:ccf8:a720])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2FC3B1121;
	Fri,  3 Jul 2026 11:19:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783070376;
	bh=hixTmYPOlsWEt64dkf195rrwR3fcf+oBntoMKBkY6tI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=j5Uwm0ylh3pZju8bSY0pWWAg/JwlW5rRsyZ8IVFrqJlMUlP5f7VUd1OT09NgYUAPB
	 SO+R1f/nwmGgBkv8dsERUqCEMFeOZS+PhXEvNBHtrCr84tP0MQIqIa/2JjRs8vU68n
	 U8KfNijsNq+3bancbKGMq/KsXow43tsDP5FsxaM8=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 03 Jul 2026 14:49:16 +0530
Subject: [PATCH v5 1/2] dt-bindings: media: i2c: Add Sony IMX678
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-imx678-v5-1-0523dbed0dad@ideasonboard.com>
References: <20260703-imx678-v5-0-0523dbed0dad@ideasonboard.com>
In-Reply-To: <20260703-imx678-v5-0-0523dbed0dad@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Lachlan Michael <Lachlan.Michael@sony.com>, 
 Ryuichi Tadano <Ryuichi.Tadano@sony.com>, 
 Kengo Hayasaka <Kengo.Hayasaka@sony.com>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5244;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=hixTmYPOlsWEt64dkf195rrwR3fcf+oBntoMKBkY6tI=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqR37Jw4lomvIzpEXTOP0Q/tMTgr2Biyo6PHNmU
 MFIXjwGQ9GJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCakd+yQAKCRBD3pH5JJpx
 RSR5EACIuLefJSS1Rtlr97qsJWPMm5zzvl2Fn6ptnqHukXMBLvzPd+UWIPruiZHIPH0gf5b5c7Z
 pKUswQgFzYpPOYu+tTW64tygHAyJW1yOcffOBr+TTN8/whQR9z7orikmF6aLyMH/wR/5v4aEUat
 Z3ccAIzuiMgH+GqCxEwdIDvLfTl7mcqUyRHVf9Sr2E5hKDozuWPAilR+ylE76gJE324AKwrdOF7
 WdIB2egy2o5x0hPz73jazrv34IuWyMlK7Lp6FdKxIbGYBUvQUA9nVGr8P7QJOKDyHavicSktpKa
 HPKNEXtOLzgmcf9MBe+TFcXwSE60e3yCDu82eQrHygY9TeNA6frZnLO7lYQLWeARsaYOWUqLNR7
 ve4Ql+k0h3LxEWPRQbUFJ+xRfvVzHKAipbhmpbKkPGXTYE94bBHGhOaSWJdid3x+/0dtoIXH4Ng
 X2ekHh2JiqKTW5Jj9AM2t2AQRoNNETLhoXSOAcF6bdPoQI4X3UGe90OXnyrbtscxcBoVS56r2oI
 fBG5XZxVYhzyWMxHjruiR83d3VWiKmegpMYdBFqwAkxO8LZrzQnDSpdEZlnLXIqU206+lK/cf6I
 Gj7fgoGExw7fT3z4uOXq/LyJcHFdDIdFb/e3RehBuNDErxMsmrk5XfhuS2hr+M4wCsrsJ9umNXI
 9O/WjogQ8WC0bwA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66440-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:Lachlan.Michael@sony.com,m:Ryuichi.Tadano@sony.com,m:Kengo.Hayasaka@sony.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jai.luthra@ideasonboard.com,m:conor.dooley@microchip.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,devicetree.org:url,microchip.com:email,ideasonboard.com:from_mime,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 07B9A70093D

Sony IMX678 is an 8.4 Megapixel (3856x2180) CMOS sensor, that can output
pixels over MIPI CSI-2 bus. Add bindings for it.

Runtime detection for mono vs color variant of this sensor is feasible
by reading a register, but it's not always desirable given the sensor
needs to be powered on for it, potentially flashing a privacy LED or
wasting precious boot time.

The manufacturer or vendor knows which sensor variant they are putting
on their board, so we define the compatible property to expect the
(color/mono) specific name of the sensor, along with a generic fallback.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v5:
- Drop note about the fallback name in the commit message
- No change in patch
---
 .../devicetree/bindings/media/i2c/sony,imx678.yaml | 130 +++++++++++++++++++++
 MAINTAINERS                                        |   6 +
 2 files changed, 136 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
new file mode 100644
index 000000000000..098f72544216
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
@@ -0,0 +1,130 @@
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
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - sony,imx678-aamr
+          - sony,imx678-aaqr
+      - const: sony,imx678
+    description:
+      The IMX678 sensor exists in a colour variant (IMX678-AAQR) and a mono
+      variant (IMX678-AAMR). The variant-specific compatible describes the
+      exact sensor variant, with the generic IMX678 compatible as a fallback.
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
+    description: Digital power supply (1.1V)
+
+  reset-gpios:
+    description: Sensor RESETN (XCLR) GPIO
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
+        camera@1a {
+            compatible = "sony,imx678-aaqr", "sony,imx678";
+            reg = <0x1a>;
+            clocks = <&imx678_clk>;
+
+            avdd-supply = <&camera_avdd_3v3>;
+            ovdd-supply = <&camera_ovdd_1v8>;
+            dvdd-supply = <&camera_dvdd_1v1>;
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
index 15011f5752a9..e764bc2a6627 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25260,6 +25260,12 @@ T:	git git://linuxtv.org/media.git
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
 F:	drivers/media/i2c/imx415.c
 
+SONY IMX678 SENSOR DRIVER
+M:	Jai Luthra <jai.luthra@ideasonboard.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
+
 SONY MEMORYSTICK SUBSYSTEM
 M:	Maxim Levitsky <maximlevitsky@gmail.com>
 M:	Alex Dubov <oakad@yahoo.com>

-- 
2.54.0


