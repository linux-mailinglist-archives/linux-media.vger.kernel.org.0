Return-Path: <linux-media+bounces-63936-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uRiXLbfsImoyfQEAu9opvQ
	(envelope-from <linux-media+bounces-63936-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 17:35:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBA76495A9
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 17:35:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b="fc8sC/e6";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63936-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63936-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5159E30F43EC
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 15:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5FC4DBD69;
	Fri,  5 Jun 2026 15:26:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5DE4183B1;
	Fri,  5 Jun 2026 15:26:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780673207; cv=none; b=nCeKyDS6b7GSQqR5IUK3qU2FUrZdspUshBmaEgMceUh7wrg65gq8hzF4xqQAo7jon/muoKineaWEQvXdAZqCcxUB3H5KEJBBCxLNvlTmRtMNUlHTRHVl+ymYCjCWXHb/VOxM9KI/PNhoFDji1iMiynYCHjhX3Cmy9YTqr8jBx8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780673207; c=relaxed/simple;
	bh=oYCSaJao7f3POZ10hKsx+AI2FSY8f2IJROko9/A+PuY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NZRETtD0kxGQ+NoFoPB9ymecJsPGdpXt9f/lXLrlmEOKTxaprYK7XC/bONOVIWsweKfirBj3SVxULJYREnZRrnsczBUygN1fD02zXazP37vBjc21iZ4Hxf3L12d69FXhocLYdlJENgp9S22Uyj7PYh1/ac9xDQGO6fK+QlxxBMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fc8sC/e6; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:476d:c684:fe78:389f:7375])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7CDB520EA;
	Fri,  5 Jun 2026 17:26:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780673178;
	bh=oYCSaJao7f3POZ10hKsx+AI2FSY8f2IJROko9/A+PuY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fc8sC/e6TBmnMb9IT20N0hYjSK26b4yEB78w+a7FmgeyKoVVhm0fewqMC+j10eRq1
	 dxQN5mbUXkCJdcJA3lt+HvEmGJpQeG8Q+dI3KRf4zaLCYfrCWad28UVWH+Z1XS4PAJ
	 F1sRi067iBvSjgDS++8K/UVu16lRy40elS838sfE=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 05 Jun 2026 20:56:28 +0530
Subject: [PATCH v4 1/2] dt-bindings: media: i2c: Add Sony IMX678
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-imx678-v4-1-58e57c67143d@ideasonboard.com>
References: <20260605-imx678-v4-0-58e57c67143d@ideasonboard.com>
In-Reply-To: <20260605-imx678-v4-0-58e57c67143d@ideasonboard.com>
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
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5682;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=oYCSaJao7f3POZ10hKsx+AI2FSY8f2IJROko9/A+PuY=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqIuqlzBkP10iqd4H8Pe+gAYqD6h8FLPjyHzMir
 xj5PlbPadGJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaiLqpQAKCRBD3pH5JJpx
 Rb/1D/0d9BgDCgKNiWDBv9PomBUwlLM/0fEKoimdzwxOS1kOicp3kNpi1sit9uh6nWJWx0jT7nN
 HXg7TwIbc6DUxKK0z1o8gDmZSK7Lqz8ELyHHfxQkzAyKbY0zsZrBeSPiVnnH+vA2zoIFUYD0Kl+
 bEIpB2HPqL5gOtwd4XxacCGnuAx4oAPmIwfkD8bngWC5oPZnaCFrFYCxO18/9yaahryx4jZv+vu
 w/32Aj1Z7D8kRaudQmEEhBzI95wg7on0UYDqk59wP8EhRpOeGmXRw5KmAmqvj07tJbkNPngPHTb
 3gjrbAguJsTi1UGavo8XBYeJFGfA6VTjSM1Hwt+xKvIeQSLRaCyslm7NslqXzj/9gS26MgqgSvj
 eXKaDtH7oAxASB3nT8WZeRYTT1iSCAaNWSIjP7raCeUkRrJkTBXRk4fOL7Z5io4YgPlwtvkJuDF
 WDIeOenWw9yjTMJB0o7I2tNcTpmHogXtCNef6IMu1zY6JpL5YD6VvcMJzJXHAVm8e2/KW1s5GkL
 +Nrw8v/PXpxokOcbHIXHjRU1hRDClOxOGtvIZU33X8drAkjUSYcwdHfrH04V59mdV2A4pHn7AT0
 noAjbAT4sDFt7NQMuKQVG4/OL2Ebhn2D6RHeKuoipq6xpArcPsieYByfe0v0cUKLOYRKqlutj3J
 57P8voLkV00pSOw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:Lachlan.Michael@sony.com,m:Ryuichi.Tadano@sony.com,m:Kengo.Hayasaka@sony.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jai.luthra@ideasonboard.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-63936-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:from_mime,ideasonboard.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2DBA76495A9

Sony IMX678 is an 8.4 Megapixel (3856x2180) CMOS sensor, that can output
pixels over MIPI CSI-2 bus. Add bindings for it.

Runtime detection for mono vs color variant of this sensor is feasible
by reading a register, but it's not always desirable given the sensor
needs to be powered on for it, potentially flashing a privacy LED or
wasting precious boot time.

The manufacturer or vendor knows which sensor variant they are putting
on their board, so we define the compatible property to expect the
(color/mono) specific name of the sensor.

This should still be followed by the generic fallback device name,
"sony,imx678". If some vendor wants to share firmware (DT blobs) across
"products" or SKUs that only differ in the mono vs color variant of the
sensor used, they *can* do it by skipping the specific name at the cost
of a build-time warning from dtbs_check.

Drivers are expected to handle all three device names (two specific, and
the generic fallback) gracefully.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v4:
- Follow Conor's suggestion of mandating both the specific and generic
  device name in the compatible property.
- Fix DVDD description and example, s/1.2V/1.1V
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


