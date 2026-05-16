Return-Path: <linux-media+bounces-61808-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKSRJjx9CGqBsAMAu9opvQ
	(envelope-from <linux-media+bounces-61808-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 16:20:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C91955C085
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 16:20:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A78E730234D5
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 14:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1424F280A58;
	Sat, 16 May 2026 14:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bEhlyV99"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE781C01;
	Sat, 16 May 2026 14:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778941186; cv=none; b=hmNPbhfVAvbHi3SqB0F87FPc7pYlEn8updDvfVQaw+56ok7vHhQDJwt8mkGI8bzWkOSa7eIj2YDnQQsD8+LNKGZTpup3CBM/TNBefa0zwfnr97SuPAp29i9w3NqZxNjI8xD1Tqdf7dZs6LTnyEnP65V4zw3528b6aW5M7djtW08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778941186; c=relaxed/simple;
	bh=cBGHZQMvyxLb7fXf0jdXYBKb4IESi5eDceULgCOAbL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G98Z/WmMx/nWVjoCPktmfbu1vToSAH4WmKE03f1gMwZJQCri24nJx1DIxHhGvIr9jWqCOcd+RQYFCF1jDpAAPSZMl44T+Op8rg5hOYBjinKkfXbEGwe8mSI6+byIiKhn113zt2giInIsFfzF4zTidxLRaLCeMMe79nYZ1ksjKf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bEhlyV99; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:1da4:3c70:f102:9ea:5df7])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 407142F8;
	Sat, 16 May 2026 16:19:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778941172;
	bh=cBGHZQMvyxLb7fXf0jdXYBKb4IESi5eDceULgCOAbL4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bEhlyV99PzioshI7R4u0yNv+jnvBQV79xeEHC4k4MuZj5XGP41RBYoJlJHgl9u28K
	 D6P5clZrgIRE2kPabopjLBqjrbj8No6BiUGs3PiY1bN+c+y6FGIthUzUL0DkJdsp9z
	 HQS+ERLQNysSaUcZnBs/8TsVu/5gqGYEwUuvYrr8=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Sat, 16 May 2026 19:49:10 +0530
Subject: [PATCH v2 1/2] dt-bindings: media: i2c: Add Sony IMX678
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-imx678-v2-1-4854ac61d6fb@ideasonboard.com>
References: <20260516-imx678-v2-0-4854ac61d6fb@ideasonboard.com>
In-Reply-To: <20260516-imx678-v2-0-4854ac61d6fb@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4963;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=cBGHZQMvyxLb7fXf0jdXYBKb4IESi5eDceULgCOAbL4=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqCHzyH8CQjKM3Rwls5GvbHeatTaHbFx/bouHnJ
 SiR4paothOJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCagh88gAKCRBD3pH5JJpx
 Rat/D/9FKLo48TZbwK1wCN/+o9Dul3+YWOu7qGmFHslT3ruouMPHLy/SYOk4seQhB8pM7rbRoSn
 GImC+cvUqCU+Q0HzEHv1DC71KK+Q4RREK93l5cOex4lm5WDL7/QKeAH5QTqhXQX9PUELKKw/Kgh
 /hNWr2F2rEaSdwyLR56yKtJHRHwclF9F97KMfR1/1lUDe8Jdpb7GBXZBPhS4Gx24o72+hthIogc
 NxcOVzZd2rhxHYf1RHz6XcU9vRoy0CR8b3netb2puCfUPGamsZSBhBl6qB/qYlcEoEKaeXNeOow
 YVHxk5q9UTU18PQQc4tb4y60GxlpInH0j7C6PyNjaFPY+J3re0hdnBIc0L2ifZmAgC3XMYswuzs
 ch5cXK39SnRkv3qjtM+plxf/WEpvKFtcAne2deTJqYZcQTDrRNunwLqveFZIuE/I092pb6WDHGd
 g4oNer8bYTCv8NK9YuBdnhXD/H8VSMhDROvnR9OavuQ7C9+dCItJrHtpxIYK/tLuIoJCsJ4ahlm
 /mtEq1DRshl56CdowtVv4CW4IXDiTxBpQcgiuHcvCrwYZrCDnG7+doY4buy9CcwOfYOwo7dofXX
 Z2aHegR7HLNgdvDEYcw6vHEz762yTxR0JS9GzlfLsdRAzvLgHA2c+TFE4mQ5pE9W1h7o9VUfLzQ
 nKMG14cVBJ9+dlw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Rspamd-Queue-Id: 0C91955C085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61808-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim,1a:email]
X-Rspamd-Action: no action

Sony IMX678 is an 8.4 Megapixel (3856x2180) CMOS sensor, that can output
pixels over MIPI CSI-2 bus. Add bindings for it.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v2:
- Add per-variant compatibles for mono and colour, alongside the
  generic fallback, so the variant can be declared without powering
  the sensor at probe.
- Rename reset GPIO to xclr as that's what it's called in the
  datasheet, and how it behaves
- Reference the generic video interface devices schema and switch to
  unevaluatedProperties.
- Drop "link-frequencies: true"
- Drop the T: entry for media.git from MAINTAINERS.
---
 .../devicetree/bindings/media/i2c/sony,imx678.yaml | 129 +++++++++++++++++++++
 MAINTAINERS                                        |   6 +
 2 files changed, 135 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
new file mode 100644
index 000000000000..8f12853f40e6
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
@@ -0,0 +1,129 @@
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
+    enum:
+      - sony,imx678
+      - sony,imx678-aamr
+      - sony,imx678-aaqr
+    description:
+      The IMX678 sensor exists in a colour variant (IMX678-AAQR) and a mono
+      variant (IMX678-AAMR). An internal register can also help detect this at
+      runtime.
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
+  xclr-gpios:
+    description: Sensor XCLR GPIO
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
+            compatible = "sony,imx678";
+            reg = <0x1a>;
+            clocks = <&imx678_clk>;
+
+            avdd-supply = <&camera_avdd_3v3>;
+            ovdd-supply = <&camera_ovdd_1v8>;
+            dvdd-supply = <&camera_dvdd_1v2>;
+
+            xclr-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
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
index 2fb1c75afd16..6b368345a771 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24911,6 +24911,12 @@ T:	git git://linuxtv.org/media.git
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


