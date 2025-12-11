Return-Path: <linux-media+bounces-48606-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FC0CB476C
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 02:48:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7FA0F30164EA
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 01:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707E3266B6B;
	Thu, 11 Dec 2025 01:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROEdoZCK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5111520013A
	for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 01:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765417727; cv=none; b=AaSgJ5H4JBZ7yph8mmgftOHd9lFUjNhckgRF+eNE2xE1OU91lt5TAmkk1PGNhqXq/SROLnaOBl9JD8kNmrwnnEC11wqDa5wewqtgORLOSVlngEkA2pqHk0UTFG9brBzT0/uXS3/9bwJeppy8oNeFvKjU9ysN27ANBbU466ELRoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765417727; c=relaxed/simple;
	bh=QdBqqfDNOpAQKzHE1tQ4FXPnpRF6omQ4FeX1zj4ON8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U+Nx7xwlMi9bZttxosoy5bQQdraVQ5l180OAbPqmK4jwPCzGNOTvf6S0ARPLX8pXkBw6iXsPHsXNK7p+WiB1R7nJboL/ihKwTcbI3Eiy+AmCH03x+jGV7ZLgsuaGy0ysIeQm/IAlL3nr1G3iUusYnIsfUZ7M1DM9FtcTN/AHh0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROEdoZCK; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-888490962d5so5351386d6.3
        for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 17:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765417725; x=1766022525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9JNq6bdKybb9IZDvi+Tj4qzsFHfQp3SJjSyhV6i1LE=;
        b=ROEdoZCKcpUcMfoNWlYucBsZstynwC5H//tUeipKwtXSlssdUvP/KPmdTMDDDfEFNR
         8kIafsCJOOXbJQJl8WJAnFRPFuF5HGzWAhfQJn6sCgm/y5LzKQDbZ7xgD252DVyohvUN
         +uL7fK+MZms1oySz4zlHKBLCP9YvBEeKqHTjM0ZlSNnyB9Tn/VTNwWfCIcxzmg4SIyRi
         YCEgDYeM1hVOIAdREpEWKUr/KT/Tm6LclpzpcVu7eW5xcdjxfjPhmpqRcL1il0wGAaiQ
         ebjuNEH6kV5VdkRQk47EM/YQwhyRu/nmmcqZNvmIHxi+fXmVUENhFCu2ET7Kr/5Z+C7i
         3Opg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765417725; x=1766022525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N9JNq6bdKybb9IZDvi+Tj4qzsFHfQp3SJjSyhV6i1LE=;
        b=u11i1pOris3NZRBmp+oE8nKOM8ik8F1/GxuHv1GdErS5qilzQTcD5BLlG23tU6xhXW
         IAUb/le/m3pg9khPZrs+l5Mg63NuIvwMJJKP4XOMYb+8rGKuOB7zRLW4p3i3f/FinUdI
         htam2hkVMIovHgc9hPgfw8GnLwEEGae2+ncbp7JyBVgOYYhqP3Vmx5yz6J01SAoklt8l
         2ybON4D9pWqptLz1xVR0rDxcnCLW+n381xidxGKIkUIR4SH7M5NM4Ya3QkbvjjIO0Dja
         jdhtMToYksWdk8lT44BP+mXne7w4fg47jDJ0ID/31fGz0j0kFU3jLSCmvfwV+axjXn8u
         zGiA==
X-Forwarded-Encrypted: i=1; AJvYcCXDHAHnm/uVhHkJ5A5DizVP/1/ojLjgK9XUcxbbcL+VVm0a5/kX9f0Q3lP41NkCi4MyalhB7mqDi/zwQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ7gVVnLoKkucveZ7YX9zps9ViVoK6IAXGyGweTLB9IfFI+G8T
	kF8p80+HrcDlfh7c02JixLG4Y2++z/nJuapZLukSf3J6MhoNs/QbjQA5
X-Gm-Gg: AY/fxX7Z6VMaed4JWBidQLUZS0eEedXrQiV92h+MSx1W8XEvdo4Mq8r/l/ef75yghQQ
	WM81ZmTfWGXn4dcKL1lLYHtxNuxnZIp1YnH1ukI7hiKFVFsQ065xpE215HtQ2nOpJYdyw/Ct2bC
	3sV8qKFbL88fvIK24IidG15OQ2ZpU8SO0DV34KYxaa+BtbjXi4uRS4zD/8YQsQU0WI9qTFNJZjT
	H9j8Ef9ifD8ST2GnitMFSKm+h/fPzWr9SfNDpkJyby5Yg+BIOY6DzD+YiuuzcKsuN1ORSsIep2q
	VkVE9panj+oTXw1W9bdADWDcL7+CoU2eR0XH6CljfknPVqDU9cS++zw+2TAwb5VDGkaTnsA4BYe
	UPho3oxRccmnaUCtu86qlds/LsrRsfXAkVt183JMRkUyArFrMPOrBu8734dRbS9G7PlmhQL0uQg
	O/YmLaBFO8/s1dcQ==
X-Google-Smtp-Source: AGHT+IHta5f0o4nkTV1MWaD9SlMxgp6rPn3E487tqAL2Uwjh7PWbhQIgGGj1rxIaKt3XO107B3L7Ng==
X-Received: by 2002:a05:6214:5091:b0:880:2b54:2b91 with SMTP id 6a1803df08f44-88863ae1ef2mr73086226d6.36.1765417725218;
        Wed, 10 Dec 2025 17:48:45 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8886ec2f32esm11054626d6.11.2025.12.10.17.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 17:48:44 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 1/5] dt-bindings: media: i2c: Add Sony IMX355
Date: Wed, 10 Dec 2025 20:48:42 -0500
Message-ID: <20251211014846.16602-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251211014846.16602-1-mailingradian@gmail.com>
References: <20251211014846.16602-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IMX355 camera sensor is a camera sensor that can be found as the
front camera in some smartphones, such as the Pixel 3, Pixel 3 XL, Pixel
3a, and Pixel 3a XL. It already has a driver, but needs support for
device tree. Document the IMX355 to support defining it in device tree.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../bindings/media/i2c/sony,imx355.yaml       | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
new file mode 100644
index 000000000000..9aa2c7b7ea71
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx355.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX355 Sensor
+
+maintainers:
+  - Richard Acayan <mailingradian@gmail.com>
+
+description:
+  The IMX355 sensor is a 3280x2464 image sensor, commonly found as the front
+  camera in smartphones.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: sony,imx355
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: mclk
+
+  avdd-supply:
+    description: Analog power supply.
+
+  dvdd-supply:
+    description: Digital power supply.
+
+  dovdd-supply:
+    description: Interface power supply.
+
+  reset-gpios:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml
+        unevaluatedProperties: false
+
+        data-lanes:
+          items:
+            - const: 0
+            - const: 1
+            - const: 2
+            - const: 3
+
+        required:
+          - link-frequencies
+          - data-lanes
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - avdd-supply
+  - dvdd-supply
+  - dovdd-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,camcc-sdm845.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@1a {
+            compatible = "sony,imx355";
+            reg = <0x1a>;
+
+            clocks = <&camcc CAM_CC_MCLK2_CLK>;
+            clock-names = "mclk";
+
+            assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
+            assigned-clock-rates = <24000000>;
+
+            reset-gpios = <&tlmm 9 GPIO_ACTIVE_HIGH>;
+
+            avdd-supply = <&cam_front_ldo>;
+            dvdd-supply = <&cam_front_ldo>;
+            dovdd-supply = <&cam_vio_ldo>;
+
+            pinctrl-names = "default";
+            pinctrl-0 = <&cam_front_default>;
+
+            rotation = <270>;
+            orientation = <0>;
+
+            port {
+                cam_front_endpoint: endpoint {
+                    data-lanes = <0 1 2 3>;
+                    link-frequencies = /bits/ 64 <360000000>;
+                    remote-endpoint = <&camss_endpoint1>;
+                };
+            };
+        };
+    };
-- 
2.52.0


