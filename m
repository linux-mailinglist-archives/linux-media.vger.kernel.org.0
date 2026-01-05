Return-Path: <linux-media+bounces-49906-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 510E9CF38EE
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 13:38:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D87130B1C73
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 12:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C8EA337B8B;
	Mon,  5 Jan 2026 12:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b="qEGPm2SR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KGH86xJf"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A295D33B955;
	Mon,  5 Jan 2026 12:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767616293; cv=none; b=ox4Nq+xDc5za9ldH1iEaF4PLB25dthj+dHFL/Oes1Calw6wDdb+9HNOMqQv2iVEJ7T5jTZ1ZNqW05LIy2S3K78OE9uU2QaOu4+6LXAoZXEeYRVKDrDisdcSI8UxHn5+kE/ZD3qpo0C8v75Ddr4V08eb/WD41vldD3H+30BPGRAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767616293; c=relaxed/simple;
	bh=M1VYDyxJQFX/m5ktuuQc1q8atYkRafQlcCQVaj0qksI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T+HmIkT4Ms+27QMP3M1xnYcHxjXx/zNJIXwcrvJegxo6jMvPxoFRxEIWgBhEn0sNFAeJs8hg0bCPTMUVf8CxLgIh5Um7cJMetmRiWlRINkxi5q7n9FTPPOpzRh2TybACtpA20ORV7v7iynfq+ygPGqYdHNVH8t1gbrC+jGdGme0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu; spf=pass smtp.mailfrom=schnwalter.eu; dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b=qEGPm2SR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KGH86xJf; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=schnwalter.eu
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 8E576EC00D8;
	Mon,  5 Jan 2026 07:31:29 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 05 Jan 2026 07:31:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schnwalter.eu;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1767616289; x=1767702689; bh=s070XTCtJfahDaDn9crddv317+9jFjln
	/e+jZSQ2Ubk=; b=qEGPm2SRwlV13faGtMZY/MTOaKJSOD8QPzdH8sFmbivkwNBr
	zkaa5cvshcPnnkdak8azTDB4/MMJUEIKTcCp9/TQmvW3oK62sNyFedQsdUusl3zM
	2s1LkZLy35RVNKkZyyRbz4lSAJnT0YXoBzkV1W5Yrv6+IJNfHFmZcQy0MBMLLAcv
	So7fIhyExEywfxlz3Rtg9GRb6+5/TLRtIjeVIzpX8UpXrSkruxkCoo0KhAm41jxm
	8VCGUqITUCfgGXm07iIK0vP80wuQZ0gNSwcy9Hd2UYWep7iaLY5z0oGjuShRgjtX
	+pw69eO9oBAsNkE7qobSHIuXKmUVa6xZcNpR1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767616289; x=
	1767702689; bh=s070XTCtJfahDaDn9crddv317+9jFjln/e+jZSQ2Ubk=; b=K
	GH86xJfKKXpbeODtIFh7ss+DIhX5GE9n851cWQJtaMw/Z+dMfvlP8bt8g6WAKpXq
	lJ+hZVxsrPlpd9MdQ9vEDlfWpczAQkukS0OJXVLbxQksD+t3U2yla+wP7RE9pxI+
	FJYZ4CdCdk/I3Y2b+myt5ZIYJP0Rsf+nm9MF/dmfCt9gT42P1TX41Sas4hlPolX+
	TnUHKupxJx05823jzn0Tz6inmKilJwLiUMyVqYX1z0LfH2KDlj7Q+0FSnOBwXanc
	35R8i7Rj6cP9XpJ2udkzYqTb4Og/gT/8MR0g3EMulaLqsElokCTQl6f4Qfi/symo
	eWeXckbGfGK9HaLsbPXOg==
X-ME-Sender: <xms:Ia9babjvPk_7ojxis4wqJij1BeT0VdzJQVVWwMhqy0Tr0L6UukEKzg>
    <xme:Ia9baZmeeQmM37POfvaHyDtgp85J6gHBSwhxebTYCASU5nkwO-hu_6ydxz8REyLCO
    8ayWg2EfAD69b4Ffvh_YDDxMyOjbuDXDIhtqWOtfjW2tgpOMEJSSg>
X-ME-Received: <xmr:Ia9baaWT3HaqstS2Q_ZrqHgDM_Zw0cqzwjLaQ8yNVzs1rv6HiG2JIs81-4Z1xfA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeljeefudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhephggrlhhtvghr
    ucghvghrnhgvrhcuufgthhhnvghiuggvrhcuoegtohhnthgrtghtsehstghhnhifrghlth
    gvrhdrvghuqeenucggtffrrghtthgvrhhnpefhtdehhfegheetjedthfeigeeltdeghfei
    udeikeeiffekuddtlefffeekheelfeenucffohhmrghinhepuggvvhhitggvthhrvggvrd
    horhhgpdhlihhnuhigthhvrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomheptghonhhtrggtthesshgthhhnfigrlhhtvghrrdgvuhdpnh
    gspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsrghk
    rghrihdrrghilhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehkrh
    iihihsiihtohhfrdhkohiilhhofihskhhisehoshhsrdhquhgrlhgtohhmmhdrtghomhdp
    rhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhnsghorghrugdrtgho
    mhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonh
    horhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Ia9baevsqyVzSDxV0SwD4gfWhw2GwDsETi5tYOmVZq-dYF9rhJtDJA>
    <xmx:Ia9bad4PTH3XflCt8Qzc2cLfHU9PQCpZWdJ9LeeqtwX873txZYQYGg>
    <xmx:Ia9baRS0tiZIxCz-ZzDnUsuK2ot-oNrZm33oT67KxPvLGllJl0lpQQ>
    <xmx:Ia9baQvG9HgleFQhZXszZN9TgfEuUVRhzeAabdxfW2TFiJirlW7rqA>
    <xmx:Ia9babC0_HDSjxUskekKvz_knbfO6sJDlhpZ0qHZbLRNlpWgMfdVwfQC>
Feedback-ID: i455149b6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Jan 2026 07:31:27 -0500 (EST)
From: Walter Werner Schneider <contact@schnwalter.eu>
Date: Mon, 05 Jan 2026 14:30:52 +0200
Subject: [PATCH v6 1/2] dt-bindings: media: i2c: Add ov2732 image sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-ov2732-driver-v6-1-95c1b0b0ba7b@schnwalter.eu>
References: <20260105-ov2732-driver-v6-0-95c1b0b0ba7b@schnwalter.eu>
In-Reply-To: <20260105-ov2732-driver-v6-0-95c1b0b0ba7b@schnwalter.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767616285; l=3936;
 i=contact@schnwalter.eu; s=20251106; h=from:subject:message-id;
 bh=M1VYDyxJQFX/m5ktuuQc1q8atYkRafQlcCQVaj0qksI=;
 b=Gerf7RVsx+iquauEWacM+IgDv9ASqWK2589mLldrxNMRfdUUfT8ireBLmMlDBwcn9o3P5ASzq
 WGcPUjaJwapD0isTi1KJ/NEZ/6zENu5vaN9nDBjuw25qwvwey9ctL4g
X-Developer-Key: i=contact@schnwalter.eu; a=ed25519;
 pk=OoafUGtB7zQJLYhKA7ALCjqddXAaem/uP/eb3GGNkTI=

Add bindings for OmniVision OV2732 image sensor.

Signed-off-by: Walter Werner Schneider <contact@schnwalter.eu>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/media/i2c/ovti,ov2732.yaml | 103 +++++++++++++++++++++
 MAINTAINERS                                        |   6 ++
 2 files changed, 109 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2732.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov2732.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..814fc568c550af58540d92b7ffa427de2363fc7d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2732.yaml
@@ -0,0 +1,103 @@
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


