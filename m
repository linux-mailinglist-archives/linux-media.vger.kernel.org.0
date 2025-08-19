Return-Path: <linux-media+bounces-40255-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7EBB2C2B2
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 14:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6037D1893566
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 12:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6301E3375B6;
	Tue, 19 Aug 2025 12:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZgjwYLC9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2A332BF30;
	Tue, 19 Aug 2025 12:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605116; cv=none; b=tgrgww92KfwOJ3xKzGPwvNw2cBsHXCopaBLJmJ7o80Lp7qxlxu/QRL59L3wb1limVzFgrd+Ml3Cwcuk+QZ7iyCmhQgKnGpw2lQjrkGmsZCSleuT7IQJjQPpV+Li8sj9IZrop+/9iPKpyBaclcs41LGzw0ym7BBKSr1q9e+X+WmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605116; c=relaxed/simple;
	bh=+BRHomySI3uqBmdzMFIuF6jODIoyPO9L6Rm9Bt8hn84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fd5YAVgFlQH2KKWR/X1p/H/Qk5gad6EDupwVz+eaLBvfz0P1XGJHZsebmIrgoRnC6PUoRWGUmuNJhgKIw5Noqr8RqmiukZ9tzHvn/6nUasWM86UE99IGiIQDXEVJlhzPFTVNU8j3o81K7KfzRlcwUd80GOczDQwVmpgqC6JdonY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZgjwYLC9; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-afcb7aea37cso648092766b.3;
        Tue, 19 Aug 2025 05:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605113; x=1756209913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUQ30VFQmDTdanx6kd08Qotj++xYuYyh6fIkGRF5xNk=;
        b=ZgjwYLC9cR20vtmONrRARy7RY1qEExRskEIU4V5TJm14jizgXSo3xUizlfVqSIEPEP
         FOdHk1jSCOlWt1obQ5Mwlw8AqK01D59VJWV2iVXXyvhqf+PBeAfu9x2mFpas39fvrJ79
         afsmqYg9ERmJMvv8dMARiTNZYL2hv8oAkcjavwO6D7XYuZOij7lmONivzUkrhIm0PluY
         hFDTdzmAu6Iv1mgvMVqhh7KltmLl1HuBjP5GqbLuPDVGv3Nd89UKoJB+yHtQRA8LxD1R
         LOP2iwHJjisoTeOlqil1vXEPHdUvPNyRSqF8BJuACuIGH7NQpB+EB1nacRgCSyMgx7id
         59jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605113; x=1756209913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IUQ30VFQmDTdanx6kd08Qotj++xYuYyh6fIkGRF5xNk=;
        b=E80/L+KGAPV+fed6Vzl0D0RXio07KojDTxA1uTpyqirbFBeuI7RW0SVRfZR/ODmGO9
         yHkJrPMaD50gpr+Xlt45l6eRmkz/k7dqgIEr5vqg7u9MERkwL0SAU5MppDXkQcveced9
         dLgj74nHWiM9VV5uBCwLuHNjQS+PCNjo3AptL9ezP3jJvQzDweYB5GjOrJM/F91TSzlV
         nXTzpMIcYhbTvF+pltR2yI8GWg6Iw1RAGlHOoG37axsyb82yhEP5gbKK9Em2asst9HN0
         yqKp8+GKVCngfTZFnEm6F8GDHAI110PDjQAxkIhb4gZaABOUri2kGOWpjKBUw40J/ZTk
         bPzA==
X-Forwarded-Encrypted: i=1; AJvYcCUrPyfms9+K7gnrCMn3/ypVjgSrHTZ3TZffSwvqNw5e8AGLCXJ/JKqWMKdp+brAja2sDo5HS9u4dYn3@vger.kernel.org, AJvYcCW4qbAUWUK2CEX7WIap97+SPK1OEY6UQV5+SqpjgKLuEk2rtDs2mpR+0gb1TrFmwJGa64ZMltw3LlLCrDu4@vger.kernel.org
X-Gm-Message-State: AOJu0YyC87ESgEWq9KsH23noD2SHn0hOjHA6H3m3czZIwTTZ51fxCzpV
	q5ax/8t5t6jlZhmwG/34pQ7FWlBDJzvxcNLJdXchCkRkeNQiMyLtB/Se
X-Gm-Gg: ASbGncsm3WFgd5GYvVAcOuAjOvq0B1CIAkMxynR3WLlaIo13NV5/lLqjif9fbzdVT57
	m4W/GA2NLAs79m3x4fYw4RRojVxpw8SmbkUVKgRO+FksoYjf+IbUBraaAM7avYuf8j5Mn77X/OT
	irila58oQqWmUq+mfB+gB8mtguLb3lfQ+PNqCckMITlfqbVncHoAFV//0/bDHiplytT1IZQ1GNg
	5Ohw1kn+5YsytRl9JUeG+Q7T01oBQVx66+YJkQ913c8lY2X9fuwqyx2sI5gD10Bz7pp3KMB4R7F
	hrz0U9byYFecrQkCO26FawllIGU5Qb8efozcnayoM4kzH14ylgBZtk3xEu3cxR/LuY7qdW9aqFY
	9bXw+s4orvZN9nA==
X-Google-Smtp-Source: AGHT+IFCZzRcKRmt9s4M5/xR/vkjNHogB1985rxqBBkTsxT5jxwtLlGz8nO8qaGC/mXWGvwAuhRNlQ==
X-Received: by 2002:a17:907:3f99:b0:af9:406d:f0a8 with SMTP id a640c23a62f3a-afddcbdbaefmr210081166b.23.1755605113236;
        Tue, 19 Aug 2025 05:05:13 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a755d9f3bsm1657741a12.1.2025.08.19.05.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:05:12 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Hans de Goede <hansg@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: media: i2c: document Sony IMX111 CMOS sensor
Date: Tue, 19 Aug 2025 15:04:26 +0300
Message-ID: <20250819120428.83437-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819120428.83437-1-clamor95@gmail.com>
References: <20250819120428.83437-1-clamor95@gmail.com>
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
---
 .../bindings/media/i2c/sony,imx111.yaml       | 126 ++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
new file mode 100644
index 000000000000..52d88f5d477e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
@@ -0,0 +1,126 @@
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
+  eeprom:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      A phandle to the node of the eeprom, that holds sensors configuration data.
+
+  flash-leds: true
+  lens-focus: true
+
+  orientation: true
+  rotation: true
+
+  assigned-clocks: true
+  assigned-clock-rates: true
+  assigned-clock-parents: true
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
+        properties:
+          data-lanes: true
+          bus-type: true
+          link-frequencies: true
+
+        required:
+          - data-lanes
+          - bus-type
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
+additionalProperties: false
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
+            eeprom = <&eeprom>;
+            flash-leds = <&led>;
+            lens-focus = <&vcm>;
+
+            reset-gpios = <&gpio 84 GPIO_ACTIVE_LOW>;
+
+            port {
+                imx111_output: endpoint {
+                    data-lanes = <1 2>;
+                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+                    link-frequencies = /bits/ 64 <271200000>;
+                    remote-endpoint = <&csi_input>;
+                };
+            };
+        };
+    };
+...
-- 
2.48.1


