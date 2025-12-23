Return-Path: <linux-media+bounces-49421-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C302ECD992B
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 15:12:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7D5323003BCA
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 14:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ABC832C94B;
	Tue, 23 Dec 2025 14:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b="V5MUXE72";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CetWyRUk"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D3831A812;
	Tue, 23 Dec 2025 14:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766499112; cv=none; b=j27xevewNMG1/ayLrZ4yeVuWHDwu92zoBd/lVOufhXEthiPf4ewnOkcH6ZHm7oHV/H1G/Jx7B7+zdA7y9RwJvW++kCTk26y13CmaYUhcXxGm2AOVU4IO+vD6qn1peRp1evSWmPC2Z+ybDbxD5BgcsgBfhTixrvKMFVfmEzAer5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766499112; c=relaxed/simple;
	bh=eh/VXrH3wk7Uvu8NFrwWCb59xvRePFoO6+fYqR3Q1d8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=deWCjHodYr30G1HlKxrssS2+Es9WGpXdWzYFxx2yYOm0ME9ylseEeC+NPXBR+KpWdT0BlV45kTBrUJx1TvCjYPA4K4Ie+gSPySOnnVcFwZI1p+Y7pWvv7xomrhepIJBfVg95TZVmA5FqPoV61sjA5KpfbTNmtVuxVRvyAH7iLOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu; spf=pass smtp.mailfrom=schnwalter.eu; dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b=V5MUXE72; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CetWyRUk; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=schnwalter.eu
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E76FA1400086;
	Tue, 23 Dec 2025 09:11:46 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 23 Dec 2025 09:11:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schnwalter.eu;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1766499106; x=1766585506; bh=MxKVlSFwRYrkWuGtzQgkCWBo4OynWJ7B
	IJI3FcmxYQk=; b=V5MUXE72BuMq3p5gVu7/nbl4+8mX68hdnhF8Dp+A9WF9qZCw
	N7vDYiDc9qukU2KM4P+eA7IoTSTzjFvmW+33T8nIQtyh/Ih/kII+tNDL/czUhfpT
	qeZ/io0Pe4yCG303f100I/avPDmQttJaTNrAxWkfJghg311pTG29QdIVw8pCYZQQ
	4miFfagvRfEX3dXK67mLER9GoBCp9oSuvigPdgi658OSJ535C/uyYaXLmyjjTnJ4
	piSZBkiVaXdYpltZ2vP0XLWXUSOkLJGeNA7xdED+lzQTrx9p3gZpPMOyLuZT8ROo
	eP2KjtVf4CUMRIhF6UvDk4HK5mCbVLHvdwp8Uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766499106; x=
	1766585506; bh=MxKVlSFwRYrkWuGtzQgkCWBo4OynWJ7BIJI3FcmxYQk=; b=C
	etWyRUkvkurHwmAi/e8nncov9MPAuoewB/2AQaG1IrqT5UNGnsKvjeQCQ38+rnrL
	MocfUa1YNsJ3m2rkkJ8tPiCeoUQJNMT66Jf4vowe0hM/ORy1yJqxIn7GyCeh8NiV
	haMAalhYVgW0heCUFQFjZnj3WDLgZHB4v6G47BlsrcmZU15LG+c+4ENelvKPW/+/
	D7ld6w4kJJTTEuqoTdCs7AuqdBQYkiysP14dif2xcuRaQfa0ocVoxjmupf0bmJFD
	9pn4oD0MYhdw2QEMoVr/7QKNqV5yHaH2NNCy6x4v7VRRhE39jv3r+dvcQTDPASKF
	mSBcCFyFhiRQsJxrKZ9bw==
X-ME-Sender: <xms:IqNKaanQ7HZZ9oQH62ja0pDk-vtNn4xGDfMAMSno1RrubNHagF8Xhg>
    <xme:IqNKaTbrxoKK2cZFs-u1VtkdqBf4gAqzGJfy9fJbKNiaScuXCVLpZ242knXU4D0oo
    8kNKBNGXqWqqX-g4WHqtPwa0nCp3lvsxXgZCLHn4WjQZYUHJKQ>
X-ME-Received: <xmr:IqNKaX5AV1Z_c3rIuKZoqOTHhziFl1etReafmb2okOlpmWMDhm2Ep-6Uxo9zWGk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeitddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhephggrlhhtvghr
    ucghvghrnhgvrhcuufgthhhnvghiuggvrhcuoegtohhnthgrtghtsehstghhnhifrghlth
    gvrhdrvghuqeenucggtffrrghtthgvrhhnpefhtdehhfegheetjedthfeigeeltdeghfei
    udeikeeiffekuddtlefffeekheelfeenucffohhmrghinhepuggvvhhitggvthhrvggvrd
    horhhgpdhlihhnuhigthhvrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomheptghonhhtrggtthesshgthhhnfigrlhhtvghrrdgvuhdpnh
    gspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjrggt
    ohhpohdrmhhonhguihesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepkh
    hriiihshiithhofhdrkhhoiihlohifshhkihesohhsshdrqhhurghltghomhhmrdgtohhm
    pdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegt
    ohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvg
    gvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:IqNKaVB7PgotvJj40eqffB5JvcY4QPPcSvk3ftbt9CVAFxzjvjoehA>
    <xmx:IqNKad9uvVYl2nDAnJwekYRS4MIpWrfKzR38xkEqVZWTXCEWJo3Xgw>
    <xmx:IqNKaYENQwql27mmZvzjy6NVIJDO8gJvLzO1MnjsP9ZutjJrmvmkng>
    <xmx:IqNKaXTHimrkjYD86cu-kA-yZEXOhUiISx_mXyWuigowvu6XdjidmA>
    <xmx:IqNKaaV4O0ndfpEUq_CGsQxcNr89mxc0ERdQrQctT1myBD5D44HZc19w>
Feedback-ID: i455149b6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Dec 2025 09:11:45 -0500 (EST)
From: Walter Werner Schneider <contact@schnwalter.eu>
Date: Tue, 23 Dec 2025 16:11:00 +0200
Subject: [PATCH v5 1/2] dt-bindings: media: i2c: Add ov2732 image sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-ov2732-driver-v5-1-34a53bc52910@schnwalter.eu>
References: <20251223-ov2732-driver-v5-0-34a53bc52910@schnwalter.eu>
In-Reply-To: <20251223-ov2732-driver-v5-0-34a53bc52910@schnwalter.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766499102; l=4030;
 i=contact@schnwalter.eu; s=20251106; h=from:subject:message-id;
 bh=eh/VXrH3wk7Uvu8NFrwWCb59xvRePFoO6+fYqR3Q1d8=;
 b=cvGYTeBwQ4BxxW05s18up6uzwCXeF+NJgFnKreuOniK2x8uUqOR2qfGVc5EZtJuqi7gkbSfmI
 4EyTuBvyiHYB72VE/83GbjdkqD0r5cdygdweMNDyeMsSOW5Kk4WkPpq
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


