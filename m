Return-Path: <linux-media+bounces-49080-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F92CCD1E2
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 19:16:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7B9463054E6E
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 18:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C649E2E542C;
	Thu, 18 Dec 2025 18:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b="C8M/FRpY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vtSfiBgc"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1081C21E0BA;
	Thu, 18 Dec 2025 18:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766081759; cv=none; b=jpUj/oIsFewPKn89FsVS+QG2MVZL6ikXKujs27fUgkNfM6hA8HnBDiBzmwsYR6kr4lEeZAIBAmmNyfDcIPmDZ8euEBbtfq1AnV8t4phlBExE3otWK8UNBokNQfUBpDMIH52q1aLd4ac4ujPur1edoAONOPDlv+RdF1VwA0tu860=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766081759; c=relaxed/simple;
	bh=lR1n2mQQZU3EfEMMB0xa16RDwa4v26NYBXuSB/54SyA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aIGbFtK1X15n/2BCG7cpfurzi6+3AVywgeK8hTHC44ZIrgTjYCbEARXh63jTrl0EtnrGZIjSEQdUQ71Cf6Xl509Y/OCYUW5hLIcaLOiFXLEDxugvMGS0RZ1aFQr/BZf+b4yaZo2hskgS9al7lK5ZYeLPZPwBIpezl7v9Gagy3JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu; spf=pass smtp.mailfrom=schnwalter.eu; dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b=C8M/FRpY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=vtSfiBgc; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=schnwalter.eu
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 8592BEC0170;
	Thu, 18 Dec 2025 13:15:50 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 18 Dec 2025 13:15:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schnwalter.eu;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1766081750; x=1766168150; bh=ABt2CFNcHAvcw9ujnQ8bL8z8sppyskpX
	AlAk+0SQ4dc=; b=C8M/FRpYBuV4xvwPad6pwgqHdFcPR/66iw7/9cVaIjlBwH+z
	8tL4WoG8CTieVbv7BMbhosOexZkhwVxlv64DoaT/UpW/Xh3+ao+dBo9U4J4O/PEj
	znO+WIciVysLOPE5gSp7llVcDQkRhYvndb8lqXVtpB19WZ4FwyxeoEjI8UR9hNmV
	ZVXPL6SR/seEAl1ywFX6U9kLU0Gs46i8htTEo4L87l0rV7hlOQ9AKbfUF6tb8jKf
	yoMkfX1yIRZMx0OHzMpsBt6wMgCIb+nPBtXyZ2gd/qR6hjSQc3Hp7ThNMdPrnKD/
	7M9pjsra7bBqbvseNFkjTY0CtvK86gPRo9NHug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766081750; x=
	1766168150; bh=ABt2CFNcHAvcw9ujnQ8bL8z8sppyskpXAlAk+0SQ4dc=; b=v
	tSfiBgc2hncacqY+69BJhLZ2rvY1AU3hsjM2ZxxtoX6alYw7SvF7si/S0BNjQGlj
	xnC/AaSNgb+XR5imdmYd2c1OWAFIeRvcYedIBFqxr9TBACfl+vQiEXCwPa3xz7xV
	yp63BHbQ0sq9nNBo5cK9t8eNVXpmbt08YmKbD9sc0SXoNinvAbls8M1xHxQMdjGv
	DDrqAFUQtLbs/LORxqvYmhPx/AlVIG7XwIKVr/Km0csNUfE0Lmhpt3dXGkyTRTkK
	jW2n2SRkNqncfRYHwU0llsGWUy0reHSSVweenMsfW75goIPq/dSbdHIZkArqcy3R
	9cCXTg9i4UJooBdDqdMuA==
X-ME-Sender: <xms:1kREadi1nalwmCH0AS_AiSnTcvkHlruvIbXfeVtjjonsmyYsYDGeBA>
    <xme:1kREaaONGJ-L7D4Ohbx17ermIxbcCMl9j-3QVZeqCS0MvHJJf6coX9FRuSJzJ8jsk
    G4Mor8W4PpSDVIVypC5WooXZUftussLfZvhF7obJxf4qtxib8eE>
X-ME-Received: <xmr:1kREaYqCc0KGcrEs9754S8FEidmiRm0hijTd0T7xetX_5Y4uqDf048aI739SRfI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegieduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhephggrlhhtvghr
    ucghvghrnhgvrhcuufgthhhnvghiuggvrhcuoegtohhnthgrtghtsehstghhnhifrghlth
    gvrhdrvghuqeenucggtffrrghtthgvrhhnpefhtdehhfegheetjedthfeigeeltdeghfei
    udeikeeiffekuddtlefffeekheelfeenucffohhmrghinhepuggvvhhitggvthhrvggvrd
    horhhgpdhlihhnuhigthhvrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomheptghonhhtrggtthesshgthhhnfigrlhhtvghrrdgvuhdpnh
    gspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehkrhii
    khdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhnsghorghr
    ugdrtghomhdprhgtphhtthhopegtohhnthgrtghtsehstghhnhifrghlthgvrhdrvghupd
    hrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptg
    honhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrghkrghrihdrrghi
    lhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopeguvghvihgtvghtrh
    gvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:1kREac4WJ3glegEuTxgNffoauB0X3vNfTDwxmdHest6_miatDHHe8Q>
    <xmx:1kREaWgNWOjTrJrxUaCdcKY4ktl7Uon4GYFIHSJGhsKv2s5-SuGRkw>
    <xmx:1kREaS74TYxDCvZmZRVXNBgBr_hqCve8dvyGJKnqLEgq9SmiJI62zQ>
    <xmx:1kREabEaX0hwtTpmTzEgnZ81BpHnz2ysLK-S78M0l9KXA6yOo7NSgg>
    <xmx:1kREafvRdwrBOyfQfXbcBlrUTg4-aZdXWrnujTqCxjv5bMm2CCuStxVD>
Feedback-ID: i455149b6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Dec 2025 13:15:48 -0500 (EST)
From: Walter Werner Schneider <contact@schnwalter.eu>
Date: Thu, 18 Dec 2025 20:15:34 +0200
Subject: [PATCH v2 1/2] dt-bindings: media: i2c: Add ov2732 image sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-ov2732-driver-v2-1-fb763644d62c@schnwalter.eu>
References: <20251218-ov2732-driver-v2-0-fb763644d62c@schnwalter.eu>
In-Reply-To: <20251218-ov2732-driver-v2-0-fb763644d62c@schnwalter.eu>
To: linux-media@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Walter Werner Schneider <contact@schnwalter.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766081746; l=4048;
 i=contact@schnwalter.eu; s=20251106; h=from:subject:message-id;
 bh=lR1n2mQQZU3EfEMMB0xa16RDwa4v26NYBXuSB/54SyA=;
 b=kCuEqokeEWNLv1iduUyXhMmN/w43FDWh4HePQiMK8VPEONXZmDcFRJK7733nDLBx5kI0mruXj
 XQbROHwtr3hDfGdcyI80l8AG0lmGkuJfl07OYF390m9gBrdordbK/QK
X-Developer-Key: i=contact@schnwalter.eu; a=ed25519;
 pk=OoafUGtB7zQJLYhKA7ALCjqddXAaem/uP/eb3GGNkTI=

Add bindings for OmniVision OV2732 image sensor.

Signed-off-by: Walter Werner Schneider <contact@schnwalter.eu>
---
 .../devicetree/bindings/media/i2c/ovti,ov2732.yaml | 111 +++++++++++++++++++++
 MAINTAINERS                                        |   6 ++
 2 files changed, 117 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2732.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov2732.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..6a59bcb5ecf1f7cbe4b68243a26635937424ff91
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2732.yaml
@@ -0,0 +1,111 @@
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
+  pwdn-gpios:
+    maxItems: 1
+    description: Reference to the GPIO connected to the pwdn pin. Active high.
+
+  reset-gpios:
+    maxItems: 1
+    description: Reference to the GPIO connected to the reset pin. Active high.
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
+            pwdn-gpios = <&gpio0 13 GPIO_ACTIVE_LOW>;
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


