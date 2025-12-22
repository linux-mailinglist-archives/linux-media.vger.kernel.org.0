Return-Path: <linux-media+bounces-49357-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E40CD6643
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 15:38:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D11730596B7
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 14:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F2C230103F;
	Mon, 22 Dec 2025 14:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b="M80qAdjx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YRroF94j"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55CF2D5C91;
	Mon, 22 Dec 2025 14:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766414286; cv=none; b=RXW6P9saxWg2Avl36jjBcNFL0NufCZoz8wd6KM2l5fs+b0T/SSEtzdER4CURlPmgL4orX/huGXyhoZ4Nm3KBawd4i30MwDyqhYAjGmB0gxEzZbeDDDZlU9nJlx6mFRLdiWLzemGDnuWnNArsFS0wMjn3gipAhPb8Zu7BLBoy3uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766414286; c=relaxed/simple;
	bh=eh/VXrH3wk7Uvu8NFrwWCb59xvRePFoO6+fYqR3Q1d8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y8l3s5AX18vaDtYRZXmHCTnUfinNaKfF7bPsVWnJVeeJpjvcYvzqFTXZX01qaAAAk+3onkpRSnBT0Tu3sHwsOLaTKDWG22de6CNhwo5AyMtb+RPZETHLzFAonc1PsYT3JUGfgf0yRMgURv8rEQsbbgM5hxeXWMKJowjYFNrnjcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu; spf=pass smtp.mailfrom=schnwalter.eu; dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b=M80qAdjx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YRroF94j; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=schnwalter.eu
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E64C614000B6;
	Mon, 22 Dec 2025 09:38:03 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 22 Dec 2025 09:38:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schnwalter.eu;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1766414283; x=1766500683; bh=MxKVlSFwRYrkWuGtzQgkCWBo4OynWJ7B
	IJI3FcmxYQk=; b=M80qAdjx/dGsmU0uCodV5ksFvykmh4XFOpar20+QcRknwndo
	IatTAkzwFxhiEXpCG7tDlxsJqhggyVbpZGNs97L8yhwAHpZ+eHnOgQfAXOhAj9Hp
	GsEjtQ6hjLDoYhyIsHKcVZxQ+Cxi1b0MzJAWg0dLeYBXb5lF8xz37el6pXoKA14I
	u0X9+h16sl5ytW4e3Z70Vqdd8lXDN9PobsSBGxYJSAGT4fcHMYxp3rDh2J2ACTPl
	6bYdo3ZLmdimSOnahoneT9ZuFgOxqjT0nsOGyy/GFmys/W4ZEgpwicOFgcJTYe/E
	ghmTRxnb7ceG27UuNZ7VY0AasoS9cmzIBPD28g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766414283; x=
	1766500683; bh=MxKVlSFwRYrkWuGtzQgkCWBo4OynWJ7BIJI3FcmxYQk=; b=Y
	RroF94jSdEPz4gsTphA2zBozAn1/frE/zf+qiIJ4hLrUD56mVutftkYHkaou0IrR
	oG40KakmlP147uzu+RV3+zzzqV1S1jyz+u7jm+0s+FFoNUIzkbvcsz8NOUJvQ3Y/
	XPiRF8b/78sJhn3QlFOiomRgHp2hRgYf9SNT1Do8jbIiKMB2zrjUHi55kCHhqD43
	Eq37IQkKzjG3xqNfOmL4cyxLKwZApoYhoqBokt50KKGnrlhZEjfYQW3rEY0e0Mmi
	nalN0nR1ohNwzYnWSl1eytDJPdOZGD4KbWLnW3Jv1lanT+1l6ZRLQzNrzsYtZJrK
	/iUt1dZqTmfGOzYRmd++Q==
X-ME-Sender: <xms:y1dJaeJsFbjAZKzKJTx7mPvNDxQxqGWp-sclUu8k8q7qxGLEsjZIUw>
    <xme:y1dJaXul-C_8TZcg-vyilwpZfN3vPEWQ-DMPsjlzczTfIFC10xJgqsghmwzQZWsgB
    O--6Bvk1ChY0w5RdF5fcbL3qxpr5FE0jTw0TjbcfXUo2Sy_1G5btQ>
X-ME-Received: <xmr:y1dJad-NeU-acD8RZnNYrqNJggxCCOxDJ-p0VPJlTrj6aAqvfpgFzuKDwq4RBTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdehjedvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhephggrlhhtvghr
    ucghvghrnhgvrhcuufgthhhnvghiuggvrhcuoegtohhnthgrtghtsehstghhnhifrghlth
    gvrhdrvghuqeenucggtffrrghtthgvrhhnpefhtdehhfegheetjedthfeigeeltdeghfei
    udeikeeiffekuddtlefffeekheelfeenucffohhmrghinhepuggvvhhitggvthhrvggvrd
    horhhgpdhlihhnuhigthhvrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomheptghonhhtrggtthesshgthhhnfigrlhhtvghrrdgvuhdpnh
    gspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehrohgs
    hheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhtrggtthesshgthhhnfigrlh
    htvghrrdgvuhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgrtg
    hophhordhmohhnughisehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehk
    rhiihihsiihtohhfrdhkohiilhhofihskhhisehoshhsrdhquhgrlhgtohhmmhdrtghomh
    dprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsh
    grkhgrrhhirdgrihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:y1dJaZ2TymLVkvJn9JtnD4bnmVtnAswFG44jBM4U2ByPiwZMxazlag>
    <xmx:y1dJaaj1NBWv2woQjuVOdDJKn5V0jW0FdorLOrawDy53ujg-tGsTrA>
    <xmx:y1dJaRYHjBVyypGizsAiVmAcV1xto0Pvyml8VZuBKFUcA12K17OMpw>
    <xmx:y1dJaeXpNBR97ymZ0eGp1SuhuoJHGlZ7YQMGUhCXkb3P10QUXQdlSQ>
    <xmx:y1dJad-M-WdQFByb2kjAEmXHGgm8xwxpvmP0KdDLve_N20XUGcB667tA>
Feedback-ID: i455149b6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Dec 2025 09:38:01 -0500 (EST)
From: Walter Werner Schneider <contact@schnwalter.eu>
Date: Mon, 22 Dec 2025 16:37:10 +0200
Subject: [PATCH v4 1/2] dt-bindings: media: i2c: Add ov2732 image sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-ov2732-driver-v4-1-843652e59990@schnwalter.eu>
References: <20251222-ov2732-driver-v4-0-843652e59990@schnwalter.eu>
In-Reply-To: <20251222-ov2732-driver-v4-0-843652e59990@schnwalter.eu>
To: linux-media@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Walter Werner Schneider <contact@schnwalter.eu>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766414278; l=4030;
 i=contact@schnwalter.eu; s=20251106; h=from:subject:message-id;
 bh=eh/VXrH3wk7Uvu8NFrwWCb59xvRePFoO6+fYqR3Q1d8=;
 b=Cd2/uKgV6cx+BUQUSy7qoFzPk71SeyP9p8j3g4D0bswgvm/kc0pTBntauMpec2qud4TpC1Ged
 WaeVBGhBzMNChY/C9/0xlrk/p0pkqnIFoG+2w0MGTTelZDD8heH3OE+
X-Developer-Key: i=contact@schnwalter.eu; a=ed25519;
 pk=OoafUGtB7zQJLYhKA7ALCjqddXAaem/uP/eb3GGNkTI=

Add bindings for OmniVision OV2732 image sensor.

Signed-off-by: Walter Werner Schneider <contact@schnwalter.eu>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/media/i2c/ovti,ov2732.yaml | 108 +++++++++++++++++++++
 MAINTAINERS                                        |   6 ++
 2 files changed, 114 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2732.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov2732.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..57041d1dc012b88db4bf3eefbd3d1ee96fde777c
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2732.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov2732.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OV2732 Image Sensor
+
+maintainers:
+  - Walter Werner Schneider <contact@schnwalter.eu>
+
+description:
+  The OmniVision OV2732 is a 2MP (1920x1080) color CMOS image sensor controlled
+  through an I2C-compatible SCCB bus.
+
+properties:
+  compatible:
+    const: ovti,ov2732
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XVCLK clock
+
+  clock-names:
+    const: xvclk
+
+  avdd-supply:
+    description: Analog Domain Power Supply
+
+  dovdd-supply:
+    description: I/O Domain Power Supply
+
+  dvdd-supply:
+    description: Digital Domain Power Supply
+
+  powerdown-gpios:
+    maxItems: 1
+    description: Reference to the GPIO connected to the pwdn pin. Active low.
+
+  reset-gpios:
+    maxItems: 1
+    description: Reference to the GPIO connected to the reset pin. Active low.
+
+  port:
+    description: MIPI CSI-2 transmitter port
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
+              - const: 2
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - avdd-supply
+  - dovdd-supply
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
+        ov2732: camera@36 {
+            compatible = "ovti,ov2732";
+            reg = <0x36>;
+            clocks = <&ov2732_clk>;
+            clock-names = "xvclk";
+
+            avdd-supply = <&ov2732_avdd>;
+            dovdd-supply = <&ov2732_dovdd>;
+            dvdd-supply = <&ov2732_dvdd>;
+
+            powerdown-gpios = <&gpio0 13 GPIO_ACTIVE_LOW>;
+            reset-gpios = <&gpio0 8 GPIO_ACTIVE_LOW>;
+
+            port {
+                camera_out: endpoint {
+                  data-lanes = <1 2>;
+                  link-frequencies = /bits/ 64 <360000000>;
+                  remote-endpoint = <&mipi_in_camera>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9de1e9e43f63787578edd8c429ca39..231d5b8df21bc5f3dc6ee5d765ed4027c9772f9a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19308,6 +19308,12 @@ T:	git git://linuxtv.org/media.git
 F:	Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml
 F:	drivers/media/i2c/ov2685.c
 
+OMNIVISION OV2732 SENSOR DRIVER
+M:	Walter Werner Schneider <contact@schnwalter.eu>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ov2732.yaml
+
 OMNIVISION OV2735 SENSOR DRIVER
 M:	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
 M:	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>

-- 
2.51.1


