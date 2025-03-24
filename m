Return-Path: <linux-media+bounces-28600-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4BBA6D284
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 01:09:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DC0E3B024E
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 00:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2373B661;
	Mon, 24 Mar 2025 00:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WOU0RtbS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EED817E4
	for <linux-media@vger.kernel.org>; Mon, 24 Mar 2025 00:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742774962; cv=none; b=jl9uNHKDMlWVrRDUhQa87K55ZPunqnOP7gRu51Z+VyeMZV+6pSMEs0v0lMtOKGag7NuOoWFSSuWyW2qrTezizxrLFmmhljz/SS7MN2lWl5Zgu3rxGb0Ze1EECv/Zs5ym/dDdN6py9Q02obFBgPnHz7/HYQYYXNf2se7pQxVB9mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742774962; c=relaxed/simple;
	bh=xG7KMDmzZFEzMN+AkPk2HVIMj7xs9rXBgCDJ/MFJG+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kOHUCUu5L1VMTRkObJib7RN6+nnCqKhSstEqRyLb6ndOOvmiOlmJcLPt+J4sKmYsgOrZrB8SgNFMdL4AfXDXWW7hG45GiFgL+2mmQP7VT7Uc3BgeXRnmCsGJIByjhYqAaJrZyS2f2i/35na3p62Wm3i/m1x00sLXViElRRYUw/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WOU0RtbS; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3913958ebf2so3048725f8f.3
        for <linux-media@vger.kernel.org>; Sun, 23 Mar 2025 17:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742774957; x=1743379757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4Yw/yIFJwPSRIFaWhDguD+3BszBLpL7OesKcw5YFc8=;
        b=WOU0RtbShGEeZvX4arWxIpH7nywv9kzFESLG2OsdEBgE3VwNxq2Lnll6uE7ws3zGhq
         tva4WGopmk0rv7bGn98BvC6ev4zIv3zH+BDjTpevl3aWY5CYOajUBrH3+En3DSuSpU47
         oMA7DbQ7ftD93gWrGuNDFHLweLtWivPZs/Vw2PvKQ37qi0OIUDyiVE9wjURmwr2Kx3jw
         bL0ZosCoazfCzne0ABNtOD8AIg/qnmFPX2RgKJ0MfDVgXyDPAMsmK8QlTqf4sCE2yVBm
         28e8Bs6ZB+vGqhpk5lfwKNS+TR6SBMkWzREpPwt9hhSuBEsbTgYZzVirSd+3Z5yzp3vb
         F0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742774957; x=1743379757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u4Yw/yIFJwPSRIFaWhDguD+3BszBLpL7OesKcw5YFc8=;
        b=XWPvi/KJwGstnPqr1pRNGGqfECgjh/qtGI9Rf4veyqTTH1rzgj+CTyQyVeABYTPCEC
         gr/X6/IJSy6mMbrrIx4TZU3lUBhe5SYMMyDy+weoSKhpTbd2Oc1VdGZ/cBsL1vYns0DE
         RdLSD9FmK3e2Omyhlfa3E6sLENEzwwDnx4VhxuyrQnv8lNcLQaZPmGiIuOsrQNMqgjbA
         AUYZG583PrQ5jH6/aAySBRYEIc0CZOXdhz0PNKtQu5Rt3MNnHzmJkqkk2rTHj5b5Q0Dp
         KrPRi0bbg+iLdX169htX6sNN2hkpZBDk/8o4fF2/GL0XAxoe9uURPOb7V6Rq+LnbsV7+
         5VQQ==
X-Gm-Message-State: AOJu0YxtsOFEdrRupAiBGJYI804HrTRMmHX1uuh9c0Q71BWzYIaa+EVs
	NAMDDSWO8Yu4RmuGW5XWIeNIiWOp4w5Jdsy9ZWQHO0I/XKd3dx5rG9rX6/oxmJ0=
X-Gm-Gg: ASbGncuEyrWLAGwKXZXxKG4xCl/0xj2a6VcnhAQIsRaRA6EKVgQB2SnEW9GMpa2Zd2M
	j4OC8w5AgZ8lBBoH0sfjuSxu8wlCC0/UFuwdzMRGKL/UurH3cdrtDRaRTCYnzC47ftiIukddmA5
	+jie9x6cDsqa1xZvzggOWQtwlwjShELjqf1T2fmJCuEgSPzUz4hRIk8zcfEsqorN+7kYTpYcRU4
	LykYobXZuIiM5YX64g/G5oeHeNRazKn2tgE4cl8SI8Agd4vQT8zyPSGUuv4kcMA8PdB7H+JxGvn
	HeMpm/hvPuDQdtZaPYXnnN5AWEDCte1aohNWyJazoaTAuvpOSautAehmZoFixWL0emdbJyRndSM
	oQvODe4VnFsf5jEpB+Rq7MPn+
X-Google-Smtp-Source: AGHT+IGY7VtMpwcOgN7vWpF0VeukoOJo86n8xPqYGzuZ9slPTAXMmzoVR8afEL0XrlDXByZw4H9iNw==
X-Received: by 2002:a5d:6c63:0:b0:38d:e304:7470 with SMTP id ffacd0b85a97d-3997f90aa79mr10650444f8f.25.1742774956693;
        Sun, 23 Mar 2025 17:09:16 -0700 (PDT)
Received: from inspiron14p-linux.ht.home (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fcea6ecsm103160875e9.5.2025.03.23.17.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 17:09:16 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil@xs4all.nl
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 1/1] media: dt-bindings: Add OmniVision OV02C10
Date: Mon, 24 Mar 2025 00:09:12 +0000
Message-ID: <20250324000912.105662-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250324000912.105662-1-bryan.odonoghue@linaro.org>
References: <20250319145927.70534-1-hdegoede@redhat.com>
 <20250324000912.105662-1-bryan.odonoghue@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for OVO2C10 a two megapixel 1080p RGB sensor.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/i2c/ovti,ov02c10.yaml      | 117 ++++++++++++++++++
 1 file changed, 117 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02c10.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02c10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02c10.yaml
new file mode 100644
index 000000000000..6380a17fe65f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02c10.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2025 Linaro Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov02c10.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Omnivision OV02C10 CMOS Sensor
+
+maintainers:
+  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+
+description: |
+  The Omnivision OV02C10 is a 2 megapixel, CMOS image sensor which supports:
+  - Automatic black level calibration (ABLC)
+  - Programmable controls for frame rate, mirror and flip, binning, cropping
+    and windowing
+  - Output formats 10-bit 4C RGB RAW, 10-bit Bayer RAW
+  - 2-lane MIPI D-PHY TX @ 800 Mbps per lane
+  - 1-lane MIPI D-PHY TX @ 1.5 Gbps per lane
+  - Dynamic defect pixel cancellation
+  - Standard SCCB command interface
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: ovti,ov02c10
+
+  reg:
+    maxItems: 1
+
+  clocks:
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
+        additionalProperties: false
+
+        properties:
+          data-lanes:
+            oneOf:
+              - items:
+                  - const: 1
+              - items:
+                  - const: 1
+                  - const: 2
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
+        ov02c10: camera@36 {
+            compatible = "ovti,ov02c10";
+            reg = <0x36>;
+
+            reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&cam_rgb_defaultt>;
+
+            clocks = <&ov02c10_clk>;
+
+            assigned-clocks = <&ov02c10_clk>;
+            assigned-clock-parents = <&ov02c10_clk_parent>;
+            assigned-clock-rates = <19200000>;
+
+            avdd-supply = <&vreg_l7b_2p8>;
+            dvdd-supply = <&vreg_l7b_1p8>;
+            dovdd-supply = <&vreg_l3m_1p8>;
+
+            port {
+                ov02c10_ep: endpoint {
+                    remote-endpoint = <&csiphy4_ep>;
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64 <400000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.49.0


