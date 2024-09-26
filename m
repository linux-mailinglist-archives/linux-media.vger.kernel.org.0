Return-Path: <linux-media+bounces-18648-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 944CE9876D5
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 17:47:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B756F1C21B0C
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 15:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 000C615B12D;
	Thu, 26 Sep 2024 15:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yTYzrfYo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7290D156F41
	for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 15:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727365609; cv=none; b=G2WtDzGxFBBYvvmpLRSxLDpbbcbmu4MzM7S0fUskRRVlTGcbri+se22KPnZZmLWXRnDvVHcHwz/pqa2jkmLcIsMTa2wgEML+ckUVmkciXy75bN7/j8us9AZxWzRdwwFt0YAXbKBZKS79HnZl7GqXiXxgyj9VUtABM15Ba/SYvWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727365609; c=relaxed/simple;
	bh=4FVzIy8QpHWKlC0SqUgcgLp+icF+nOSWpVflVXxObqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nVCY8rlBTvYEG/AXt5feY7gLU9oGmkkAFU4DIDb11/HlzaaCUD8ZXEARX4ODFNUDOAbRNZUFr1GsJ1IvkaocK4G6zrAplALYXU3vIiDt2sTeYnbkaTTRcF/OAgAH9lshTwc1OzJ3toTW15oobNe48uH2OAioncjt7J37NMtw/YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yTYzrfYo; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f74b6e1810so10581921fa.2
        for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 08:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727365605; x=1727970405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/CRYCZo7FKJ+FINfaWBLgAHFnlJxKNwCO23rsvgAsb8=;
        b=yTYzrfYonnQkXsE/GJDbH6VRIiW+y5bXcJ7DLhrAeyUsaDekD0xpUcGgOjHwJBCXBw
         2rJZWqbLX/9uNGPwynfjwX+HTdrt6Ui7iIfO4HPUfmKofr0Ed0JnHCE0sVB3YZmGZTY0
         PA9JTWqpuEHR06uBbo3QR1EVNyHINFGhO0Ar8k1BRJ7NXBsns8FpOG818aUz0Bq8FRh1
         s5xp0AwSKd7EWSevGmNsJQqtLBl3qZi7v9ixFGUW2HexELq1lwp1dWyL3oIHY/qP8Dbd
         N+/owlhpfSo7zq7Q1d7VFhC2ulekQVrPjWDn5uHaH8Gcuwtu6KL8q8LrOp8KhF9k3eIE
         etJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727365605; x=1727970405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CRYCZo7FKJ+FINfaWBLgAHFnlJxKNwCO23rsvgAsb8=;
        b=GsoqB7GJbviT1/C+02FV3JTUB7lxNLBrNIviVyL2VBl4nNeyzi9TCOG+Qi5wik5OAd
         2ZSIMxQaZpiLSJNMkcH+ncQJY+w6IZERDttXwmMAenlYPjPTMfIDm/ipAKEqdNTgAF1S
         mSH76w05WfdXNl7TrHLg+n6H/0PCbcNjCZU4G1QaQfiYj3HWFkGgSi/MBenqclgGn5yR
         wB08UTjodTGQARayu62sGkd8u08ordW9QlO5rQZpYSIP4uqUnAFetv7/7DSlod8EnGF4
         ST0V2gb31KtKFO9jDFUXhlIdlsXBP6eupkgDXLy7CbfHgm6sXx9WfDfe5QUaxsGJgx4m
         W7qg==
X-Gm-Message-State: AOJu0YwdrcLLAbyAC6D4RsawVv9AIAnh79jz0VfwJuGDzL1s4s8AvE+N
	M0bHrC++cLlqUA92Fdxxci2Y/8w50Xx/juUQ5yoBTnxeqxCz0n5+G3A6TE/pfiojj8eTGG73Jqt
	eesQ=
X-Google-Smtp-Source: AGHT+IG0+T+XsEWCeNbh8UesCqshRA43B0vDrHxEbWCEUBLE+cU7D5O3LGoP1fl3F3hZCwU/kUDNnw==
X-Received: by 2002:a2e:be8e:0:b0:2f7:4fac:f69f with SMTP id 38308e7fff4ca-2f9d3e44c83mr886931fa.12.1727365604966;
        Thu, 26 Sep 2024 08:46:44 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c882405166sm75744a12.9.2024.09.26.08.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 08:46:44 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Sep 2024 16:46:38 +0100
Subject: [PATCH 2/4] media: dt-bindings: Add OmniVision OV08X40
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-b4-master-24-11-25-ov08x40-v1-2-e4d5fbd3b58a@linaro.org>
References: <20240926-b4-master-24-11-25-ov08x40-v1-0-e4d5fbd3b58a@linaro.org>
In-Reply-To: <20240926-b4-master-24-11-25-ov08x40-v1-0-e4d5fbd3b58a@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jason Chen <jason.z.chen@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3921;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=4FVzIy8QpHWKlC0SqUgcgLp+icF+nOSWpVflVXxObqE=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBm9YHg0e33Npz0wAHU2EHzLqBUUh68Lfwy9S8Sb
 wG5ma8OUBiJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCZvWB4AAKCRAicTuzoY3I
 OkadD/4u/RdZ7/cqJNC7HnAOc861nIxfZbXUWt+EDABqjYLKi8dob46cLlxxLg6n4fJT/6miVAj
 onoLk6gOyd6/Aci9hwxzu8pqX2SoKrFSR3QcRc+Ebu7GkBf2SfkiA+n6mfFiakPC78P/MSCkWSg
 bBhrfKld98uKRlEeRiIos2yA2Xop0xcTiRt/x7rSoiksA0iA8aTXcjUivYRRUYD92w9FAG269DC
 frc47BL3pF0boRRtHjAJGTz7m/p7kJvWnuDPHls1uZK5AHr5b6dG+rbL5qYDEHV+dRQ0tNkWJ/f
 W3llpz4vkpuzUadplpjrNmY7NyK7y1B7A8WBzHcvPKzt1K6YYjwzO8ELIIge2qX5iPOcMNY1XWI
 p+zcTWlMmsf+ShV8nAFYQqafbQ/iYy1k7Ehz+vj+r1SzHGQs2kBdyLIYhL4dem+qWE/GUuHnN6I
 cGUENwCj9KWowyGY8mfaVZ1qw3lBkg0QT07+NoM3OTxPh+ptrefsmak+Ntfn7/4vSuEuvCE9IaU
 amlt1bU0A1b2yeU138+mVRa5Cct7sOvoCjML+znYvODPjhysATvf1b8NJPCmXgdNGPBsBm0cKLB
 kCzBJMyeMcsfA5jkbx82IIhxz1yURDZymDDswuwrN0Jqv91fx5X91GxlWHFmU+Ug2mh9pmbYkXW
 /EQmywBpVOg/sDQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add bindings for the already upstream OV08X40 to enable usage of this
sensor on dts based systems.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/i2c/ovti,ov08x40.yaml           | 130 +++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov08x40.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov08x40.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..250785f062d0146e8615d8f3e7700aebbd40b1dc
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov08x40.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2024 Linaro Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov08x40.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Omnivision OV08X40 CMOS Sensor
+
+maintainers:
+  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+
+description: |-
+  The Omnivision OV08X40 is a 9.2 megapixel, CMOS image sensor which supports.
+  - Automatic black level calibration (ABLC)
+  - Programmable controls for frame rate, mirror and flip, binning, cropping
+    and windowing
+  - Output formats 10-bit 4C RGB RAW, 10-bit Bayer RAW
+  - 4-lane MIPI D-PHY TX @ 1 Gbps per lane
+  - 2-lane MPIP D-PHY TX @ 2 Gbps per lane
+  - Dynamic defect pixel cancellation
+  - Standard SCCB command interface
+
+properties:
+  compatible:
+    const: ovti,ov08x40
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    description:
+      Input clock for the sensor.
+    items:
+      - const: xvclk
+
+  clock-frequency:
+    description:
+      Frequency of the xvclk clock in Hertz.
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
+  reset-gpios:
+    description: Active low GPIO connected to XSHUTDOWN pad of the sensor.
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
+            oneOf:
+              - items:
+                  - const: 1
+                  - const: 2
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
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
+  - clock-names
+  - clock-frequency
+  - dovdd-supply
+  - avdd-supply
+  - dvdd-supply
+  - reset-gpios
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
+        ov08x40: camera@36 {
+            compatible = "ovti,ov08x40";
+            reg = <0x36>;
+
+            reset-gpios = <&tlmm 111 GPIO_ACTIVE_LOW>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&cam_rgb_defaultt>;
+
+            clocks = <&ov08x40_clk>;
+            clock-names = "xvclk";
+            clock-frequency = <19200000>;
+
+            avdd-supply = <&vreg_l7b_2p8>;
+            dvdd-supply = <&vreg_l7b_1p8>;
+            dovdd-supply = <&vreg_l3m_1p8>;
+
+            port {
+                ov08x40_ep: endpoint {
+                    remote-endpoint = <&csiphy4_ep>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <400000000>;
+                };
+            };
+        };
+    };
+...

-- 
2.46.2


