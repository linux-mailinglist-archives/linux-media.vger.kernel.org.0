Return-Path: <linux-media+bounces-49178-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A78CD0356
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 15:09:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3700A3056C4F
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 14:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46791329368;
	Fri, 19 Dec 2025 14:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b="ovw3Blnr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gr8pg5d9"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9E4328624;
	Fri, 19 Dec 2025 14:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766153317; cv=none; b=S87zgRrybdWIvmCx43HXbj1EJFO/Ayaij5CeMSgjGz6RVQSJZso7Nw67yGnR4fjzjxvyPFaRuMLjgLOWBd5/t0YiPak7GwtDp1LJQuazFDjh/wuzfONrM9t+6H0dIDnHCY3j33eR1NaLqurRKKrUyTHVDugKfjDnNj3r9R5IaCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766153317; c=relaxed/simple;
	bh=UaRehn1/rOkl/aL6j5i1dFkeHFNgoTAIpiXnnJHp3bw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JUJsmz2D3eMPAGyrgcQY3rL/ehcNMotvzIBx3MTVMIATFu8lg6NV3Zz79DcuZCjDj4Hr/OfHfHRx9ATRq3HuXxKs3OQk8JACaG9+RE6u39WTGIYysJpSY6IjA/iSK4o+c3o2n2YExn4E7wdWIe6BrVdvm63JtY0JPq41MbIOQFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu; spf=pass smtp.mailfrom=schnwalter.eu; dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b=ovw3Blnr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gr8pg5d9; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=schnwalter.eu
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D1CFA14000B2;
	Fri, 19 Dec 2025 09:08:30 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 19 Dec 2025 09:08:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schnwalter.eu;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1766153310; x=1766239710; bh=qb5gVRO9DfUFU0aQRCIg+7QiRU/KOee2
	e9hSIVhT7xM=; b=ovw3BlnrGec8dKb6e5e8ibr3ue6gqgXGVHDwMeUjw/ztFMnM
	q1RCMAv4P/oEL4QMYo4Y1h7U6N4ZBnDSBZl5rvKodhZgIXoiWIQYGhD7tKqItgLq
	byOp88agOBRXlpbfhaaKecIFtXgr/l4a8Ow793IQYeS8g6tMWQY2EkjhKmaICmNR
	ivszEL3gzvX2zp4rHQfQ7C+fsO6RRaAuM1XZ/DusFoqPz+WvVMtG+PQpRagJxitQ
	bdkuE9FzsMnER3T4txKQB6qwJkE9QDQTY9D6yBVSO0OUQEy7V4xNQyoAcyG1/xwV
	9tFBD4MKTaBRN4q8N7LPmLX2Y1F8KAmw1JaG5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766153310; x=
	1766239710; bh=qb5gVRO9DfUFU0aQRCIg+7QiRU/KOee2e9hSIVhT7xM=; b=g
	r8pg5d9fxni3WLVbb96i6m1WU9vvzCFpdS7PYB8lOFTbLOz6Gv1fGDsCB68GEpX5
	HuMbEdc6Dxa7b+sEE1b0qD5tkVxdbOp90YXXtJEayqVw2i1byszSGWcPVgYmXHNQ
	Unx6XRn8W9PReFcRZ+VLr8l61VB2u9bwSIrssrETYaWHky5mDsIRtxwcs7NCpxNm
	xttUZeXblrBN/n6HPrJPsy11K2orEVFNBIv1eG5A5B+VLTkuF1TEA4KNDkw1z6cK
	+rsKMSN1QGN/uhr8Ai0s8zZ9CZF5yDypS7eb47WFNafi0a5M46VWG08I/yr7Aqux
	JZlCqcP/WXVILp/XpCEfA==
X-ME-Sender: <xms:XlxFafU_82UZl2iMsSvSvBv_EYg7zB7mozZYx7BRqSl03Yk8guF6rA>
    <xme:XlxFafxpViLuN28pa7Ypmv5uOJaKLKjplDPHWKGn8IReOfozK3qp7gUjehSX-hrG_
    c3hkVwufCSeAX3VWfpUlAz5dtjixabEToFGWuWyFfeVq-0Ru9om7g>
X-ME-Received: <xmr:XlxFaW9Kzgfyei10XO5DdR8CwozYOsA2NuIcUz9tvg4fCfeAcPdVK0rzgxaUvQc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegkeehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhephggrlhhtvghr
    ucghvghrnhgvrhcuufgthhhnvghiuggvrhcuoegtohhnthgrtghtsehstghhnhifrghlth
    gvrhdrvghuqeenucggtffrrghtthgvrhhnpefhtdehhfegheetjedthfeigeeltdeghfei
    udeikeeiffekuddtlefffeekheelfeenucffohhmrghinhepuggvvhhitggvthhrvggvrd
    horhhgpdhlihhnuhigthhvrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomheptghonhhtrggtthesshgthhhnfigrlhhtvghrrdgvuhdpnh
    gspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtohhn
    thgrtghtsehstghhnhifrghlthgvrhdrvghupdhrtghpthhtoheprhhosghhsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgthhgv
    hhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgrtghophhordhmohhnughi
    sehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehsrghkrghrihdrrghilh
    husheslhhinhhugidrihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:XlxFaU_xgezb4FFrmLmrjCTD_jvcQbvh2rtyWK2aUwnZKZk66ItOGw>
    <xmx:XlxFaVX8QmDjJKklaqrqraqfzz5dds0fp3Uayu3jCPYbYWm6K3uNPg>
    <xmx:XlxFaRehenYqDTPlC1Nzo2bHlbTfQo2BgmIXUycaLbB21ZufRefnQQ>
    <xmx:XlxFaeZb8OE6yY5DZQu2doG2-UVqBL1QPZP9ofH66n2Y1vRqDiSr4w>
    <xmx:XlxFaTDQ3UsbhL2SytnozK2kviB92if-n4kI1TYeGd03wosya5LywPHq>
Feedback-ID: i455149b6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Dec 2025 09:08:28 -0500 (EST)
From: Walter Werner Schneider <contact@schnwalter.eu>
Date: Fri, 19 Dec 2025 16:08:08 +0200
Subject: [PATCH v3 1/2] dt-bindings: media: i2c: Add ov2732 image sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-ov2732-driver-v3-1-579d175e929e@schnwalter.eu>
References: <20251219-ov2732-driver-v3-0-579d175e929e@schnwalter.eu>
In-Reply-To: <20251219-ov2732-driver-v3-0-579d175e929e@schnwalter.eu>
To: linux-media@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Walter Werner Schneider <contact@schnwalter.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766153306; l=3957;
 i=contact@schnwalter.eu; s=20251106; h=from:subject:message-id;
 bh=UaRehn1/rOkl/aL6j5i1dFkeHFNgoTAIpiXnnJHp3bw=;
 b=UXZKr9qm8jtwGXxox60gd8Dxkf1qTozMU/+a4Y/mmhonqVvlHk+O7VXtx0EYXjGdeiff7YbR6
 4RhREpy8fRcDKUCjrFgAAMqe1r1Tr/igQ2dY6HFYv7QYoy8870wsh+S
X-Developer-Key: i=contact@schnwalter.eu; a=ed25519;
 pk=OoafUGtB7zQJLYhKA7ALCjqddXAaem/uP/eb3GGNkTI=

Add bindings for OmniVision OV2732 image sensor.

Signed-off-by: Walter Werner Schneider <contact@schnwalter.eu>
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


