Return-Path: <linux-media+bounces-46219-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B82C2C8FB
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 16:06:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 193381887029
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 15:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD90314D3F;
	Mon,  3 Nov 2025 14:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPr2eF4T"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681DD28031C
	for <linux-media@vger.kernel.org>; Mon,  3 Nov 2025 14:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762181815; cv=none; b=EfEA0bIZNEzMFiLkkjPmXTE/fuoIbpUK23zHjVz0LwRZu0uH9igyp4pjIf+YwHWYeyuUF+iHYNdLkH6I5nLVQgZwUHEgYogpiE8CIu4ocDhCroHIDRpjAl5vlQu5uLNk2O/MPQTuk2WfgNgi3+VB21xc5qVpft6ywu79E5p8ZFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762181815; c=relaxed/simple;
	bh=Cwc487Q7TuN+iZw77LSuYBkO6zlPKMprgNtjBsX8sk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QmBgHZI96swCYcLKUUppFvIUjuT+CP4cU7bDMY1oDZZF+VyAPgpI3h67LlogQ5hQLiOGKOUK9pfbf8XOx4+JzTW33Turlt5uNGRaGcxa7fG/xkBhcShihaNogQVHW9jWKtzQIrTViNWbat+63TTEWgcqMCKPvlinSytFSGcscP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPr2eF4T; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-378e8d10494so46789971fa.2
        for <linux-media@vger.kernel.org>; Mon, 03 Nov 2025 06:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762181810; x=1762786610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRJylgA5tDh6J0HyV09+y5kblN0Saxh3CxXH4UQ+jfc=;
        b=BPr2eF4TjcjIxpq41SCmA4OJzGueFBpbSRuueOmCVKZc31GYxWEw4hxxrqd81aHkn8
         JLpQAqrvzNuR5xt9FYRxCplPZMbzNnIArons6dSp9EreobQr9XNzn38fTE8WBh+83fyM
         xYuZresJJ8EYu7q2rWorFazzWfxdcjUai9eg4ppxl++87UNb5EuZR5vRiXe/Dq8BDgP+
         QnVfWRpyMjrRXN+2Q4viUGC4SzEoz8lwlRhbr3mVb+kif3plTGnUcZvZC4DF/m/mVm/t
         SpN/4UvFsWEaYiMlpSejUwKdIcGgF0EwOHA/I4JvD1Rva5iPYOagfpOt97iGgxN0pVie
         kIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762181810; x=1762786610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uRJylgA5tDh6J0HyV09+y5kblN0Saxh3CxXH4UQ+jfc=;
        b=S+5/qFpS3L/yrsiSlZegXZSz8F7dSp/qieLB8TCbdQUntwdszT1C1DVpXw7lVzzblA
         IS+8jSCphTXNerizRYpt/+YzZcanQqfLg2FzQ4XpcA6AXXxhy4xPXjY5mDYeK9Zq/Nxy
         QbpFoMzdwXE3glsD+q04+wdhYKiOagYbVOebXf4GBYPn+0e00ig1AKlVLxBPtf9bqiS0
         8iduW68WLwzj1YWWbuvhlGparvLX1fFXFT0/rw0VSPmhuDng/Gajva7Yn5DifLVeGkHf
         iQW23QkSM6l9CNfS9yeN6Vsd251Mg3oHbw/HY6fBvViy/oFZfpfC8iPuiD3Gy4JLhqhu
         5fdA==
X-Gm-Message-State: AOJu0YwXnPjgqwacSyPx/zuQtOQmBP0QD/8qSrJNo6x3jB5PVxI99DnG
	AnrlDdO4SO2hfBmUxPslTnIre7gXDELuraj1wT8F7kAiQwOTHd1Iy5vf
X-Gm-Gg: ASbGncsfQYNyPC9B59fx+aSHeGwsy8GN+qDNORerpcdk4EV3rUyFCiX+0/qvWp9dLqF
	hoDhjs+J2hAczhS1XAwmxyuXeNomyanqobd7o205+FCn7Pzz29Sik5/+LS6eWBTj06F6q5Z4l8e
	wrEdil2QyZ/VwZh2Z1+zDYEsU9ut20vCrBaG0jf+rTllbfkY8VOMVUkJa5PaqFvTcvtouqiqtrg
	+IIs/6fvniwsZjnLmX8fKhh/AXGaWzLSPfnXGtf7oFoBZiRLdXk0E3SoKFe0TZkfLStl2h/ED0A
	mlX0Jzw4KjusgaoLC6O7AKwpznmpjvMUSFeAHu2+D5WBEqB0hxLyZnXQvf5pbxmPxoQ8LL1pJt6
	no5xiSvHfCVCzr2xpKlW62chfBmt7VIZHIzDWIVNRwLQ5I3pNnTdnbAGfzqSGfmpFc5G/cKo6aX
	Gy
X-Google-Smtp-Source: AGHT+IGJeEBnjP4R5psIFnDlYx1WzqziKeHDlwCz84CqG5SR2VgxHltzzwJIDJwksgTuiJMuglMA9Q==
X-Received: by 2002:a2e:b8c1:0:b0:37a:2c11:2c7b with SMTP id 38308e7fff4ca-37a2c11330dmr21136541fa.18.1762181810210;
        Mon, 03 Nov 2025 06:56:50 -0800 (PST)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a414d58b3sm937061fa.18.2025.11.03.06.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 06:56:49 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: media: i2c: document Sony IMX111 CMOS sensor
Date: Mon,  3 Nov 2025 16:56:28 +0200
Message-ID: <20251103145629.21588-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103145629.21588-1-clamor95@gmail.com>
References: <20251103145629.21588-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for Sony IMX111 CMOS Digital Image Sensor found in LG
Optimus 4X (P880) and Optimus Vu (P895) smartphones.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/media/i2c/sony,imx111.yaml       | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
new file mode 100644
index 000000000000..20f48d5e9b2d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx111.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX111 8MP CMOS Digital Image Sensor
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  IMX111 sensor is a Sony CMOS active pixel digital image sensor with an active
+  array size of 2464H x 3280V. It is programmable through I2C interface. Image
+  data is sent through MIPI CSI-2, through 1 or 2 lanes.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+  - $ref: /schemas/nvmem/nvmem-consumer.yaml#
+
+properties:
+  compatible:
+    const: sony,imx111
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: EXTCLK with possible frequency from 6 to 54 MHz
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  iovdd-supply:
+    description: Digital IO power supply (1.8V)
+
+  dvdd-supply:
+    description: Digital power supply (1.2V)
+
+  avdd-supply:
+    description: Analog power supply (2.7V)
+
+  port:
+    additionalProperties: false
+    $ref: /schemas/graph.yaml#/$defs/port-base
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
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
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/media/video-interfaces.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@10 {
+            compatible = "sony,imx111";
+            reg = <0x10>;
+
+            clocks = <&imx111_clk>;
+
+            iovdd-supply = <&camera_vddio_1v8>;
+            dvdd-supply = <&camera_vddd_1v2>;
+            avdd-supply = <&camera_vdda_2v7>;
+
+            orientation = <1>;
+            rotation = <90>;
+
+            nvmem = <&eeprom>;
+            flash-leds = <&led>;
+            lens-focus = <&vcm>;
+
+            reset-gpios = <&gpio 84 GPIO_ACTIVE_LOW>;
+
+            port {
+                imx111_output: endpoint {
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64 <542400000>;
+                    remote-endpoint = <&csi_input>;
+                };
+            };
+        };
+    };
+...
-- 
2.51.0


