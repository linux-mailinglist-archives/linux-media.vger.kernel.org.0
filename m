Return-Path: <linux-media+bounces-16184-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BE895024B
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 12:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37FBB1C22122
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 10:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A4C18DF62;
	Tue, 13 Aug 2024 10:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z3+w1Z1w"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010A9187349
	for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 10:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723544446; cv=none; b=MKw6VarWcB3UDTN7cNNIOtCl17v0OpjpbvHA/xcio7BzAh8w/W9JTPKkrqpJqupPV5X31aU0SHxW+wFC4y05aZdVlJ0sd1/+uGTUB0/X5eAh2DF5LBwrhVg1rn1Mr/rgqdZXk8o8noTDE9x1lcZFCpwxxcKBF/2fwh/FRt08SMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723544446; c=relaxed/simple;
	bh=aqhpo7wrTeZIF4C7nPe7XF9JisDqdIYeaeCsgW4QNb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LenIV41NofWS35aFf3B85IE41xxcWYdFlnZLKJOwoHQiett4VxidgVDfRbu+v7Ia+PWQ14bWFSmUcJSPxpgo8mvC9gabetrzpI1KG4S8JlQhOkZzZfdrLoW0K7RMDAgs9FTD/MK4TMLLz9xGCLSmBBG2w15BOJTED/jWh35G+UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z3+w1Z1w; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52f00427236so879261e87.0
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 03:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723544443; x=1724149243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10cT3V7GvRdqqMfeVs6CaqnKxabDpRzyanXk8MSpT+I=;
        b=Z3+w1Z1wD02k40aK3F6LNl8UzmG8hj/a7D5CkuuG/i117cDsJb5GYHrHO5ErxaY6y5
         g2HKuNANp0bjcX1+UYKBLd50yPkmC/6SxlUdEARtTipLW4KhJ8uOZPI+a8uUa4bPItxY
         RncniehoC6TGXeZcGyeBqs/OOo15GMboCdsc5YF+Yc3LgqFpX56WXZ2hZT5CUL3T0458
         vT0A7AT9XjbKiC2Txua853XiGS+bQ1SHqBCmK69F/WU3e8aEiB67xjrpcWYN4Hw/iKHV
         1UZ7IMSjcr8NmUGUbikZ/RjP6l4klElHlHUT72g7jUblTeauTXzIGDUuubxzpA5RKrIm
         KGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723544443; x=1724149243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=10cT3V7GvRdqqMfeVs6CaqnKxabDpRzyanXk8MSpT+I=;
        b=EN84SwSsykUZ2kPwxW40cNJaWUke+3D2UVTLZLq5YGzTO4yW9uACtoaip6hBRyae0a
         KYLr2F/CZ4CiqwFurdMB1f3JWoswchaEFv+SXqtrjKOO4T+Tm24fGEQGqOBwFnvUqZJm
         N7g2Zehzz96qV34Ycqbq4VSK0NY1ogbzbFv41n5X97cx163h8z/QnzUv2P2Pr34f1aDX
         QB0Sk1X+0QNP3yVQ0WqwoZ8w5DgoxIrqctx1EflT5BulhTVhwYj3hGaRAw3KJ71kplyY
         A1JVV6d1G/yS7ilnlFVoWZzzCbysD/c+R4DVjwtNbqaqeDKAQBhC2tk7OMz0fVT3ssIB
         mgaA==
X-Forwarded-Encrypted: i=1; AJvYcCUAWP5j04TMV0VevHie1fJOajvwswSwxOkN9omJuxvBzRrHb1KxMyuJJ09GioSHiFfqETZVhs04uJnt1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBTiywyXrEfCTu1nm05bRLiSa1nwiBklVQ2cEdCALPlx3bjU/F
	+CXr97OoGpG5UMeHPjPhjkzamU3bqhfRAMwsSjnMhQP5jsvw+deFfY6fsVfVWPA=
X-Google-Smtp-Source: AGHT+IFFYofkEGPy9fDH4aPbhPmN1XkXRqAgEgwS/2XLZjh1TqzjZD0cm1AH8Ks6HjC55CcFIKe4ag==
X-Received: by 2002:a05:6512:3e22:b0:52f:413:30de with SMTP id 2adb3069b0e04-53215d4597bmr498726e87.7.1723544442985;
        Tue, 13 Aug 2024 03:20:42 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53200eb3ca5sm965917e87.55.2024.08.13.03.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 03:20:42 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/6] media: dt-bindings: Add description of OmniVision OG01A1B image sensor
Date: Tue, 13 Aug 2024 13:20:30 +0300
Message-ID: <20240813102035.1763559-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240813102035.1763559-1-vladimir.zapolskiy@linaro.org>
References: <20240813102035.1763559-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings documentation for OmniVision OG01A1B image
sensor.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../bindings/media/i2c/ovti,og01a1b.yaml      | 107 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml
new file mode 100644
index 000000000000..ca57c01739d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2023-2024 Linaro Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,og01a1b.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OG01A1B Image Sensor
+
+maintainers:
+  - Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
+
+description:
+  The OmniVision OG01A1B is black and white CMOS 1.3 Megapixel (1280x1024)
+  image sensor controlled over an I2C-compatible SCCB bus.
+  The sensor transmits images on a MIPI CSI-2 output interface with one or
+  two data lanes.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: ovti,og01a1b
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  reset-gpios:
+    description: Active low GPIO connected to XSHUTDOWN pad of the sensor.
+    maxItems: 1
+
+  strobe-gpios:
+    description: Input GPIO connected to strobe pad of the sensor.
+    maxItems: 1
+
+  avdd-supply:
+    description: Analogue circuit voltage supply.
+
+  dovdd-supply:
+    description: I/O circuit voltage supply.
+
+  dvdd-supply:
+    description: Digital circuit voltage supply.
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+    description:
+      Output port node, single endpoint describing the CSI-2 transmitter.
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            minItems: 1
+            maxItems: 2
+            items:
+              enum: [1, 2]
+
+          link-frequencies: true
+
+        required:
+          - data-lanes
+          - link-frequencies
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
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@60 {
+            compatible = "ovti,og01a1b";
+            reg = <0x60>;
+            clocks = <&clk 0>;
+            reset-gpios = <&gpio 117 GPIO_ACTIVE_LOW>;
+            avdd-supply = <&vreg_3v3>;
+            dovdd-supply = <&vreg_1p8>;
+            dvdd-supply = <&vreg_1p2>;
+
+            port {
+                og01a1b_ep: endpoint {
+                    remote-endpoint = <&csiphy_ep>;
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64 <500000000>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index cf9c9221c388..9b0d1db35b7d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16507,6 +16507,7 @@ OMNIVISION OG01A1B SENSOR DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml
 F:	drivers/media/i2c/og01a1b.c
 
 OMNIVISION OV01A10 SENSOR DRIVER
-- 
2.45.2


