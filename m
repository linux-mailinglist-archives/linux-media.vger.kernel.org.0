Return-Path: <linux-media+bounces-28720-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B35FA7043B
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 15:50:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5449189148A
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 14:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE5825A633;
	Tue, 25 Mar 2025 14:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XoDcS+aA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC5025A357
	for <linux-media@vger.kernel.org>; Tue, 25 Mar 2025 14:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742914176; cv=none; b=hPEyORO+08Z1jTppHUOElfvAolEu0clEJDbclkK+L+ANdXQG15N0L6H4fM/CHzRew9jKQI/7+kGKK8q3rDjA1/QNbSmLhIN1VZNCrnEkOjR2ABKz4YYVnR4cO3E2HD2HKB1TOICDZMhpDQBfM4sbN8jC/eFdH6YQLeSJ1Y4raDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742914176; c=relaxed/simple;
	bh=4h90l3uCKnzIWFZ+vJClR6va3K7yLEzxfMXFVnVjwgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RYSI+BSp4KfR3IXoSeh7EnXem2yxxLlr5Iw35lWwh4T7dE+N4oCax8bRV/XOVX6EJqMSC78Om91SKqXM7ufZbi9Y7hVmb3RQCwA6wU7TNpEC1R3JsJfgrJ2FZCNiXsm0Jqe5ujCKvkUfvg5+OUUWLU0Kbs8XBJyKxzuxEo0Pzng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XoDcS+aA; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso26166265e9.3
        for <linux-media@vger.kernel.org>; Tue, 25 Mar 2025 07:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742914173; x=1743518973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SxNSfKs3qjdQU1MDAWHJDUTKqSXIO9sYXN3sPNJ2EKI=;
        b=XoDcS+aA7dgZ/en6ymKq3TUmfBRVx5r6EmU3xKdX47DlrwPb/kegbiQnqBJpXGStz5
         PurqGLLf7o9Lv/Akj+cniNvL0PbqbDPSLvkJrBL5xyp0r5ESx66HjLsN8A7FAQO1n+Le
         9r5GZRD39MP+TOC9NRs0rQBPBaBCQ5vR8/RtdnT2uDZMT8rOJvOx+mjs7cK7Y0ujNKZd
         fcFw1JFxaLSJoDw2ZlUtfqNW0O1AdIgTwuiiOMeFQvXaeucAgEcDujBglZ14oCk9FkdH
         7xwgq+Efi1EZmohqo4cxySPW0IHj9doyyMEvump1h2+utg/VAFWi141l2cwMtUnAAX+I
         riSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742914173; x=1743518973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxNSfKs3qjdQU1MDAWHJDUTKqSXIO9sYXN3sPNJ2EKI=;
        b=TKO+fR+xmMvXnOV2hp3qfNTuanu7443Ly800qTb9XmpyDOwTamBKMy3bi67XYGfMGq
         o1RvEgX6Nd+Qu6rOiMBjJdK+ncG3VzQvvg8tCb7WexQhHzEKWmVvdWEs/1j82giX6dEy
         aiOfrAft4VWMXG9A/ExSfvJpUeh1e72pUZwth6E0y/Jq3xk5AqcdLqUN/C0doYyLklIW
         1YhtPA7/2IX4QumY3f0aVjlIn+OyhruwEE4NN3r4aHJk3pRfUiOus4aNIQAKShpawhVs
         nUxdFfxS4HcpnomHr+Iblr0r9zfPFxLPKwqFIPFTGeo85LraACYKM7bWO0LyKHZUlHjg
         HELg==
X-Forwarded-Encrypted: i=1; AJvYcCUAejGBx2fZ1Sm3Sa/Xrub49hAB2Vj+xBQqsV0xVE++AkX6fRLaj0UdUWXXpnRanWBjnOwBzred/OQVDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoOBYn2BMo87M4U00uvx8ftDLHmeezgE2cSnKXdtqgMaW9Ya3A
	2+lLjrDkSqMddjboikBO/kHVhf1due3Zfcbow1+AFUxd2YyaBOeRuSOSZDPgIBo=
X-Gm-Gg: ASbGncuHMnHRDMaqjC3KF+METmLL29WgD1RTt62m7yPjLRI8EIxQQoQgJ6SKUjvK2XR
	Tohg5KDj667TX6YD/bszxkbIWxBmvAWFJgEtQk/z2rlEfebxCbLkfjzfAjln+MVPz6mNTkectyc
	+qEH1Faxq0HeTEgZP0oufvvjvs1yOg5NqKVhfdzdt2S123VT9doampQZGPMjM8ZXDnEiVBY6z8I
	XZy1OQAvSiBExcdZ8Z5Y5Yg6cVlnZ6d0UcLSVHpNBqGnwT7AAgQIxD100kUr9GymsvrH71+G4wi
	a74q0qV5r6M0cjvRUlu3lMluFKXAwRA3RZhZJRsYhVb+5VFHjB1mPd1NaBsHVV+UoJZ7rr0/UUm
	+zfKBsfZV2w==
X-Google-Smtp-Source: AGHT+IG4CKp1FZaRLBixTMuTyKNtj56FAP2yubtmsAabtieb/14MG43qeHYB8FO5lYDNkcZHx6+TIA==
X-Received: by 2002:a05:6000:1448:b0:391:253b:405d with SMTP id ffacd0b85a97d-3997f933da0mr16760940f8f.41.1742914172633;
        Tue, 25 Mar 2025 07:49:32 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a3b4bsm13796071f8f.25.2025.03.25.07.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 07:49:32 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 25 Mar 2025 14:49:28 +0000
Subject: [PATCH v2 1/2] media: dt-bindings: Add OmniVision OV02E10
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-b4-media-comitters-next-25-03-13-ov02e10-v2-1-4d933ac8cff6@linaro.org>
References: <20250325-b4-media-comitters-next-25-03-13-ov02e10-v2-0-4d933ac8cff6@linaro.org>
In-Reply-To: <20250325-b4-media-comitters-next-25-03-13-ov02e10-v2-0-4d933ac8cff6@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: Jingjing Xiong <jingjing.xiong@intel.com>, Hao Yao <hao.yao@intel.com>, 
 Jim Lai <jim.lai@intel.com>, You-Sheng Yang <vicamo.yang@canonical.com>, 
 Alan Stern <stern@rowland.harvard.edu>, Hans de Goede <hdegoede@redhat.com>, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2

Add bindings for OVO2E10 a two lane MIPI CSI, two megapixel 1080p RGB sensor.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/i2c/ovti,ov02e10.yaml           | 113 +++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..4ac4e11a16c8bb7a53db0c44289b1004dbdc282a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2025 Linaro Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov02e10.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Omnivision OV02E10 CMOS Sensor
+
+maintainers:
+  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+
+description: |
+  The Omnivision OV02E10 is a 2 megapixel, CMOS image sensor which supports:
+  - Automatic black level calibration (ABLC)
+  - Programmable controls for frame rate, mirror and flip, binning, cropping
+    and windowing
+  - Output formats 10-bit 4C RGB RAW, 10-bit Bayer RAW
+  - 2-lane MIPI D-PHY TX @ 720 Mbps per lane
+  - Dynamic defect pixel cancellation
+  - Standard SCCB command interface
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: ovti,ov02e10
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
+            items:
+              - const: 1
+              - const: 2
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
+        ov02e10: camera@10 {
+            compatible = "ovti,ov02e10";
+            reg = <0x10>;
+
+            reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&cam_rgb_defaultt>;
+
+            clocks = <&ov02e10_clk>;
+
+            assigned-clocks = <&ov02e10_clk>;
+            assigned-clock-parents = <&ov02e10_clk_parent>;
+            assigned-clock-rates = <19200000>;
+
+            avdd-supply = <&vreg_l7b_2p8>;
+            dvdd-supply = <&vreg_l7b_1p8>;
+            dovdd-supply = <&vreg_l3m_1p8>;
+
+            port {
+                ov02e10_ep: endpoint {
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


