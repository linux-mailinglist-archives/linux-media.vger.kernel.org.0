Return-Path: <linux-media+bounces-50935-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 156A0D38C15
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 05:07:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50B48303832A
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 04:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A8423EA80;
	Sat, 17 Jan 2026 04:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFpKNqc5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B243126B3
	for <linux-media@vger.kernel.org>; Sat, 17 Jan 2026 04:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768622804; cv=none; b=g+G3Ldsz/uNFJaaigZAIh8ymcLBGAc1+mTbYFXmfx+Bx+sundJNPY3h9Kcegr62qo1ZvyJ7IGvphCUlCtdM2+QAxjy77pa6XJKennpQunmOkYeVCA+dOm6+QTq+yczG5BNoGlCQtH7EccLQVHphHq3cHycoj5UMulhynoKo8zVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768622804; c=relaxed/simple;
	bh=q6Zcg5OxkKLFI3E5a9irtIExZJ+tzYy2eTeqFd6joyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pZCYvZdDaBRWAEGduEcZ74nmjAtLim/twayw06Rus32aRLfdz43YNfDhZCmtXiWTm2JNT22YEVYNOb+u573DzSkgY+RevtRlW1DNcy132jkY2klUgEGX7b3X79fSFktz/fKhCiu+hcxo7scXKrs8CXXOaHLAWx0hpcTUUaJ7Jhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFpKNqc5; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8c6aaf3cd62so137870485a.3
        for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 20:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768622801; x=1769227601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nsoz6EWM7qD9/4dVYsGLR4Pmvjatyh5Pk5C2o5rnB9c=;
        b=cFpKNqc5oBsRmw0vkllHTs1mHoWxXD5XF4BGivccm//Ej2uHfkFgU0uFCKDNAMvOEC
         a7Gs2D4tbhU4eZa+kMaVPHb4VH2LDIURrqZCGIRip3t7UVtuaYz103ApufEHqalo0KtS
         P8yWFKayyT/jjhIEtaoj3X0j6NcLUYOW4kXuAs07CrdGqZyu5dmqzGMhW6BcQEH6Wb6h
         oGeZLY/LjtUxRMNC89h0EJnapBXGxLJU/JvUA5rEVwNyc3d6njMy2kxgEFnigezu4bkr
         BSyFfLzYpkZJmABdYXurxF9WmwAod2FyAGuxfka4s+Q1lF0uVONxFIwNj2JwPUTaPQtK
         26yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768622801; x=1769227601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nsoz6EWM7qD9/4dVYsGLR4Pmvjatyh5Pk5C2o5rnB9c=;
        b=Wf/n9kWNam+FdyCmgAatibwNbHHMS58buP4/4mDJhFA4JMIYapnVPcuuP3SfUWH4Ou
         Kh3Yu7ZSKZOWWTPWzIJPXR1jDnzFpgOIqfyQrbAiEmbuxf/elPypkW3ByJut+jnjFTTT
         3YurXWIj/qaong6dHmPU0PIhiGdUXa+DQisk9lJwPURjazPrxjJAjFbDNxXTMtjwDz4t
         aEObQw2K2EPknDluvM/QhlFR0NYJeh5FLxM/5xpBPRD7O7p72wHsx4Oz0uvySD7OS1qU
         P72h3v8dByWEXbpZ5eWeIU0xp4rT+ibUhY65GaF52W0Ha+hPstNKj9LlwA3DDODa6bKP
         XR5g==
X-Forwarded-Encrypted: i=1; AJvYcCWra4+ySWRP0HfSjZuM5TQGNlDHCzuQXe4naQLGAdjoXMciImjmZxkUFLSEgMMIeqNqiK4tfWb5qmdP7w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr/P5U5W8ghWjvpupm3K7WCjEb7kS6KNrVXJlMRNWsmygUuIpq
	55fbpVD+Cnxlt9zqbQSFpoGin8+P/NpOI7ex7r38OfNACMx50247Z6cR
X-Gm-Gg: AY/fxX5HrybdtNWVje4oSUc4rYD0+8VXqC/tybPjx2jR4S8z7QHsk0mboa9Jhqes1jw
	MD2/IcwIWQ+XM9dA8pxvfBBAuaHEHTECg/7HaThKqiaGVvKdhqSZf5F1h4ntanoLr9G3kV0e66a
	/tu0T9kT/+4McI3W8b85nfb7QzzugtoEe7F1cIFrUfA2JW8m9GQBXk6TNdwX7pRZYSFfkINKND7
	/0Rq5VfZJhQ95kh40mxPije0ljGfFVjvLHXeWBvcR38ZQwQd0R3WMA7Ru4Ix8V/VkjZnX2pOGTM
	tDorfC3H8P//JY0sP6CyRIEtmZcqxK+xumgq158NXCfBNgrEYd6EtGMM695nal4fxDPqdj6K681
	HCwHimJ22nWbplRx51Ax+fc4XwlwXl4omY+l8SrCEUHYQClZVR9t9xvtKHrIyZ0yhaoT9yfXKXd
	kLLtHU5LbNBydOokLgzBtGRWEzVucQpjX4bug3ar6gtGlbjRCOegUc5Z3mYIsJxsCzHxil5fOiE
	ME=
X-Received: by 2002:a05:620a:470e:b0:8b2:f29e:3af8 with SMTP id af79cd13be357-8c6a6789933mr662358485a.59.1768622800896;
        Fri, 16 Jan 2026 20:06:40 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6c5adbsm37174806d6.39.2026.01.16.20.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 20:06:40 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v7 1/5] dt-bindings: media: i2c: Add Sony IMX355
Date: Fri, 16 Jan 2026 23:06:53 -0500
Message-ID: <20260117040657.27043-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260117040657.27043-1-mailingradian@gmail.com>
References: <20260117040657.27043-1-mailingradian@gmail.com>
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

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../bindings/media/i2c/sony,imx355.yaml       | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
new file mode 100644
index 000000000000..0a3aa63b7b5f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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
+    description: Reset GPIO (active low).
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
+        required:
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
+
+            assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
+            assigned-clock-rates = <24000000>;
+
+            reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
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
+                    link-frequencies = /bits/ 64 <360000000>;
+                    remote-endpoint = <&camss_endpoint1>;
+                };
+            };
+        };
+    };
-- 
2.52.0


