Return-Path: <linux-media+bounces-36505-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4FFAF0BC9
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 08:39:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 305D67A4EE0
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 06:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F47228CB5;
	Wed,  2 Jul 2025 06:38:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F199B225768;
	Wed,  2 Jul 2025 06:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751438332; cv=none; b=rT/wP/1MlFMrbSk2UoIFNFIThUrXTvlT6kRjLiCJe/QfWa20y3QO0VFWdNcgKKWamTrbTko+ftYORL5+qAq8SJFN2RAZJHkmbCbzKX6VO6as0LXt3MzZK+KR4k3GdfLwsQSvyDjyBG2rzCwPjLFewMXxGlpPFI3EIIdYonO8kPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751438332; c=relaxed/simple;
	bh=rtoFbXp7Djoc/ChcSP8tyoBS3f73Vjhw9eYQaDbOueU=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J1iUNOaKvSo0ujv9nrmVJwHiUJEp/uRaNfI4iEFvvyGEyULzKjIIDDS+BvwkRkLtP/CpElunscGrXklHsXnGUmW62aizvur4+OvSu+WhYAfHiNueT+iBCvvzJ1ZdzHqGJMxeatuKDfnAcR50YyTjsQR2c/Qu7NJi9EddMt6MKvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-748d982e97cso4159057b3a.1;
        Tue, 01 Jul 2025 23:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751438330; x=1752043130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NldJir8W9VPLyugiOm1F2+u63+x8UhSg95hgPGqSiag=;
        b=R8NVcHKJJC2ZZopfPvCOMILKgqZb/62BURV3ZRu7yZn+GbDqLQCbTWRiu4I/chuJc5
         w3uivV753rKL1O3UPHyamnqcZABqktFnPYCgRbBFrebNICBiZzTDjmhBWd6HEo1o0xsp
         44ianZVck0YG6qhSeBRr+1vUsuiQVFcaeHsy9QacnRlDiZzR3bVcetNInYmj3p74JByA
         GW+2QaFQzQQqNcCWnsizHYUAJfJUJoruX2TqQPOMnl8H4waI+38zq5uK26U5TitAwU7H
         y34VArFQUUogrdo6Mn4asbD/FotRd5Mgci3eEc2/qcfjjKd3IvvXa37tjIDq7SEE1/kQ
         Qf4w==
X-Forwarded-Encrypted: i=1; AJvYcCU+6cbTC6OV9cWpJbPhUWaI1oAqxsLJyXusrxluW02hulOLHZ+uDtqz9FPd4gXPFJ21qQei0sAzpMJe5Qa+@vger.kernel.org, AJvYcCXKQLqmPIk/mnwpMWQWu6EtdK3n96meoDDTOjRZbqZFNUIgRlHM4kQYWn9KiQwanDKBOoL4IXnN84U3@vger.kernel.org, AJvYcCXMdlQ0z+D3S/auICWZtx4EbqvJ42GfDwrNR1cw2pMJpnqtvnYLCciojvAeEVSXwPu//Qup8Cdp4Zn0LMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwebQ4lRJnJje/ImryZULaOl0Jy3iBRC7BPUttsknGPp8Ow/9JD
	kbcHUZtDvgkUmz14k4mMGQatHqvcKcHbLTS+jHUs9CLse/nn0U7b+H5LxJBeSwI4
X-Gm-Gg: ASbGnct2LyrZxiruciYYRtEQsk9f7HkZgfqJ3Lx11wqursUrhBbEnz5pbZfc9FWC7CL
	uDyhpDViLsJPVmbk9bpNqU+q/w1kfsBELfKIpC+c+b7KiYU2CnXdCsGe6voGB7wVM+7Q9sqh0Pi
	B5b3zan9A5KHgbAbmnr1bWqXTLEm9Wk+jSYQarYl0t8xDDx2Li06RdjBPBHn0XZG2cZmOy1XC+K
	2UPG8b+8IZpESPJ1z09ge+dU004WqmNofnOMfzwJKs3eFZp6uXYu7tGMnLGz/TRT9mAv0CPG5hP
	0B51qYNLR3UW5t8UVCm0ViFj9+YSCfrpmHOB1XYYudAtdwZS8gVW++3bcbX5y6SCWM4L3jaFY7g
	rjsN1QDlLyOmr+ZozAhSPBpdtnH+w1Q==
X-Google-Smtp-Source: AGHT+IFFqVZs9mujvPGzuMDR/UlBWy0mPlxEYy0vjW4QxIDngMqnf7l4HCksWE5zzzrVltIxn7fkZg==
X-Received: by 2002:a05:6a21:6d95:b0:21f:e9be:7c3f with SMTP id adf61e73a8af0-222d7def90fmr2956864637.11.1751438330131;
        Tue, 01 Jul 2025 23:38:50 -0700 (PDT)
Received: from localhost.localdomain (c-24-4-34-163.hsd1.ca.comcast.net. [24.4.34.163])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541bd0fsm13044966b3a.40.2025.07.01.23.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 23:38:48 -0700 (PDT)
From: Will Whang <will@willwhang.com>
To: Will Whang <will@willwhang.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org (open list:SONY IMX585 SENSOR DRIVER),
	linux-kernel@vger.kernel.org (open list),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH v1 1/4] dt-bindings: media: Add Sony IMX585 CMOS image sensor
Date: Wed,  2 Jul 2025 07:38:33 +0100
Message-Id: <20250702063836.3984-2-will@willwhang.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250702063836.3984-1-will@willwhang.com>
References: <20250702063836.3984-1-will@willwhang.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document the devicetree binding for the Sony IMX585.  The schema
covers the CSI-2 data-lanes, the optional 'mono-mode' flag,
and the internal-sync properties used by the driver.

Signed-off-by: Will Whang <will@willwhang.com>
---
 .../bindings/media/i2c/sony,imx585.yaml       | 120 ++++++++++++++++++
 MAINTAINERS                                   |   8 ++
 2 files changed, 128 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
new file mode 100644
index 000000000..d050d1642
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2024 Ideas on Board Oy
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx585.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX585 Sensor
+
+maintainers:
+  - Will Whang <will@willwhang.com>
+
+description:
+  IMX585 sensor is a Sony CMOS sensor with 4K and FHD outputs.
+
+properties:
+  compatible:
+    const: sony,imx585
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: xclk
+
+  clock-frequency:
+    enum: [ 74250000, 37125000, 72000000, 27000000, 24000000 ]
+
+  reg:
+    maxItems: 1
+    description: I2C Address for IMX585
+
+  VANA-supply:
+    description: Analog power supply (3.3V)
+
+  VDDL-supply:
+    description: Interface power supply (1.8V)
+
+  VDIG-supply:
+    description: Digital power supply (1.1V)
+
+  reset-gpios:
+    description: Sensor reset (XCLR) GPIO
+    maxItems: 1
+
+  port:
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
+            anyOf:
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+
+          sync-mode:
+            description: |
+              Select the synchronisation mode of the sensor
+                0 – internal sync, leader (default)
+                1 – internal sync, follower
+                2 – external sync
+            $ref: /schemas/types.yaml#/definitions/uint8
+            enum: [ 0, 1, 2 ]
+
+          link-frequencies:
+            description: Select the MIPI-CSI2 link speed in Mhz
+            items:
+              enum: [ 297000000, 360000000, 445500000, 594000000,
+                      720000000, 891000000, 1039500000 ]
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
+  - clock-frequency
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        imx585@1a {
+            compatible = "sony,imx585";
+            reg = <0x1a>;
+            clocks = <&imx585_clk>;
+            clock-frequency = <24000000>;
+
+            VANA-supply = <&camera_vadd_3v3>;
+            VDDL-supply = <&camera_vdd1_1v8>;
+            VDIG-supply = <&camera_vdd2_1v1>;
+
+            port {
+                imx585: endpoint {
+                    remote-endpoint = <&cam>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <720000000>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index da34c7227..9cc404790 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23150,6 +23150,14 @@ T:	git git://linuxtv.org/media.git
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
 F:	drivers/media/i2c/imx415.c
 
+SONY IMX585 SENSOR DRIVER
+M:	Will Whang <will@willwhang.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media.git
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
+F:	drivers/media/i2c/imx585.c
+
 SONY MEMORYSTICK SUBSYSTEM
 M:	Maxim Levitsky <maximlevitsky@gmail.com>
 M:	Alex Dubov <oakad@yahoo.com>
-- 
2.39.5


