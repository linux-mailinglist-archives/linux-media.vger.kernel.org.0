Return-Path: <linux-media+bounces-36364-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E91CBAEEAAF
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 01:00:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 456EF189DA47
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 23:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9067828D844;
	Mon, 30 Jun 2025 23:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L4cOhEZg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9AE236431;
	Mon, 30 Jun 2025 23:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751324405; cv=none; b=YyTRYGNq/7R8OR/1xGsmWu5WjmbACKLY3HxwRrbCmRk2ItNVNOnHWD871h2G34v1hR3rtU4v7btddTQX8+334Mz/FYSkfekZWYlhX7uAN3HzrP5V3fmTPgT8rLkNDXPnlyOtvGyXZXkpcI4XHucV1AUHjS950NbNqaBXNA8ZAHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751324405; c=relaxed/simple;
	bh=r1lGSSPF+EvZA2aybOiiv4ISwGDofZY/n7EbjbwkoO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O7O/4rw5xi2KQI5zxGNJ3P/mzs/lFoUgyAHpzKpkrFDUv0ZnCG5NdeCzBvU77hkgLufl24vjxvSVMX6cb4uRsfX6rRig1xrcUCVw0laztwJIHJ7/yKCbsq3xxshffyIssMiJ2XIWXxdshgR9B97cuvEfaTc7eftOXnocwAhyksQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L4cOhEZg; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4a5903bceffso68582011cf.3;
        Mon, 30 Jun 2025 16:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751324402; x=1751929202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dh8dllJRq1G4VC7UeDAm7CFiX6b3yV8+IjQCOyA0GeI=;
        b=L4cOhEZgKW6STc2uAS1Ur1lF67sx6cIgsQOpafgttI+HzLWB7VylJ/DsQeJ/6Pld4h
         jkzbpG6JfMuXq0zMKl1XzqJC+kY1gd892hSny0Y6WEom/cfXYMRPLvF8bTXpyS3Vywz2
         wp1unsrE5ZKiqU5314jHGoNSeerNpOa74f5ZQ833FY09nhQLd8OggWJ6YMx+Ze0T01bs
         Pj3tgZPzcdBoq59youudcLMPnmRvLPa9vRL3T9BO4mpC29fYDVqxrbAT9NmcBk8QJXpc
         dJqFSe0cXZywO1poP8W+IG/WtMv0haHxrUojwint1j86xrFDUsfYi9kJoBLVc8gTe6ue
         tjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751324402; x=1751929202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dh8dllJRq1G4VC7UeDAm7CFiX6b3yV8+IjQCOyA0GeI=;
        b=mTYMl7fIZThHtgKhLjY08WDj0DpB8q+WIMV6R/An5gpSIKy6Vjf6xIyPy2QbiO5l/w
         O6w8JNFin9pGar+3p/5/ZCsEckSJRz5UJ8PmArcfxJa6zMPdVlnVkC0HgcU5FBz/qSg+
         U4Th1ZohGDGoG3IedN2qxzi19JPYuUDALnWpTjv7ygnDDx3lc4uCMMJr1POvtgk42vPh
         1BlU4jQtX7GMy0Qbrm1BFnIv+NlUYaPf6asxFHFjoXPe2L+Md7XP8dy/i164ntIdnA0X
         CC9hJc5h8ZcjFZ1J0mbcdM+zVxW5XtoqDmLHKcpOG/uQQ3Iq+M8VyX4xRQmOoW67k7dQ
         P9LQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1UVo8xQ2NF2rfjTxAd/agFng6rrLgHLq+WYFsJ5GyS8BUL7G47s6GyFx9fVbN0e0pcDq6vldNZqUfH5A=@vger.kernel.org, AJvYcCV7DGdFWKeZbUa8UhdkSju8d/DjbRJa4PmVDJTW/bqYAv8u8LlF53+YGpDbUZt9POcNr2QDzwdfQXv0@vger.kernel.org, AJvYcCVPTuBLCisBZykdaqpRH+MwTLZHCHAnlr6Aa15MUDNVJvPe8hgsIszQPm1BmmOJf79l5fZAefQmYQT5cye8Cg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxE5FfWaneLCgNEBAXvJhJmGgSF8aW3FoEIEymU0Ow2gewFi1Qm
	79mzuyHK8TLxu5fWpNP10SVFzgi1p/pdThJdAcqAY/FxcIAGHDwlSnQX
X-Gm-Gg: ASbGnctY9ume6s/FtMcHUiCLDLu4Ey4Xth7krno8twPaKRwjbGTxWuu7v7osg2d3MiM
	YJYi7s7bQIlATct0qIItZkSH/IFSKYnT0Fn+7Hk7G8nbI1/tEpvgR66nA2fwIt5D1MF1lN0pgYR
	12hCnvmqvBEcKapiuqF8UlcW7Bt+B8xI1oPqrupVDcMP6WPb5tF6q4eNOV63IF5AWbr6e6avMfG
	Eir9Scs3fVXhrt6ovU7iUhhN7Elmsf+fdWA2v3T1zPk5ihnGvCqoIox+6vo3S383SZ0MewcCtDq
	3lEw6iFeqIUxT68GPYl20CjFHq++EL/vAUnIT0vUSWVPwgSXFQ==
X-Google-Smtp-Source: AGHT+IGkIp21BWoysa7zoWRLcNcJBoAta8QoelVpQoNX2MRrLG2RYD3hMHLYFUCBzQgIXA3x3K/FMA==
X-Received: by 2002:a05:622a:1301:b0:4a4:4da5:8b55 with SMTP id d75a77b69052e-4a7fcac4866mr271055211cf.28.1751324401997;
        Mon, 30 Jun 2025 16:00:01 -0700 (PDT)
Received: from localhost ([2607:fea8:3140:6800::10ce])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4a7fc10616esm66602951cf.8.2025.06.30.16.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 16:00:01 -0700 (PDT)
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
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 1/5] dt-bindings: media: i2c: Add Sony IMX355
Date: Mon, 30 Jun 2025 18:59:46 -0400
Message-ID: <20250630225944.320755-8-mailingradian@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630225944.320755-7-mailingradian@gmail.com>
References: <20250630225944.320755-7-mailingradian@gmail.com>
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
 .../bindings/media/i2c/sony,imx355.yaml       | 122 ++++++++++++++++++
 1 file changed, 122 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
new file mode 100644
index 000000000000..7f5f365ee5df
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
@@ -0,0 +1,122 @@
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
+  assigned-clocks: true
+  assigned-clock-rates: true
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: mclk
+
+  clock-frequency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: External clock frequency.
+
+  vana-supply:
+    description: Analog power supply.
+
+  vdig-supply:
+    description: Digital power supply.
+
+  vio-supply:
+    description: Interface power supply.
+
+  reset-gpios:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    description:
+      CSI output port.
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml
+        description:
+          CSI endpoint for the sensor output.
+
+        unevaluatedProperties: false
+
+        required:
+          - link-frequencies
+
+    unevaluatedProperties: false
+
+    required:
+      - endpoint
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - clock-frequency
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
+            clock-frequency = <19200000>;
+
+            assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
+            assigned-clock-rates = <24000000>;
+
+            reset-gpios = <&tlmm 9 GPIO_ACTIVE_HIGH>;
+
+            vana-supply = <&cam_front_ldo>;
+            vdig-supply = <&cam_front_ldo>;
+            vio-supply = <&cam_vio_ldo>;
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
2.50.0


