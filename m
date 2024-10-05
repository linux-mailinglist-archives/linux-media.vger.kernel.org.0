Return-Path: <linux-media+bounces-19120-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDC99915FB
	for <lists+linux-media@lfdr.de>; Sat,  5 Oct 2024 12:31:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1842AB22A60
	for <lists+linux-media@lfdr.de>; Sat,  5 Oct 2024 10:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4673714C5B0;
	Sat,  5 Oct 2024 10:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wnibTZxp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE4F149013
	for <linux-media@vger.kernel.org>; Sat,  5 Oct 2024 10:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728124274; cv=none; b=qGpbswNkA4T4SyPLA8PIeDRxikzUW85J95HsF4POPLSpVoDEtKd+bF/2G9Ena2pBzhBA2LGLLqs30nFItOsAcA+oBhcRwshbzWRvpb0pcxXl8ql25p22gul9D46NobJYQeyOO3QcsOpdQBpHlsPPlHwFYoxBPLwvOBhqD0T1H+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728124274; c=relaxed/simple;
	bh=mYuK773IRT+YGybwbHjM35dYaPg0a7sBAF8PXfbece8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jiq7+YIIbnfy8TJ1H3e5syMt60vUNwXMlj+iCs+UTU7899yadar1Inmoi7pR+LudmTwIIZOpJ3NYi0dxtl28lTtQl8kWEJKpTKSBIjkWXtPlQZrTpltH62g9jzoVoC+CW+RaAiPxrLdfrt0apd4OdK6CUhJeYADEVJjS4Pjqo14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wnibTZxp; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a93c1cc74fdso500647066b.3
        for <linux-media@vger.kernel.org>; Sat, 05 Oct 2024 03:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728124271; x=1728729071; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HwzWgYqivhHj7+dnzlG3c8h9sTHdrV9evRLKyR/6z8s=;
        b=wnibTZxpNRHdCTy6d5LflvJ1BSFOsbKXF+I1oUV/GUoYEiaBvkvxUFGi73Rgb3R42A
         5QwzgpLqIPpmYO+Y0VDACO1Shy9ufBHOepxqe0uEWUpjOtAMTnXMdcAY26PL8HtyTXII
         7JCFir0maxZz1QaVFjCPPVD4WUSEYtYBnMBlKiSlYI7YCA0brL1/8J6a4FV82HkPygDv
         pYW4+esBmRSCCtEUPVwEKJyDze07cje7S+juMxm04LPfYWJvXrYds10zYViir9g37F/y
         Utxpor1fc3NLKyaRQgYAqb8ReVk4hG2Al5DavS8EGPZBS/L1BUkdsGAwgHsu9Uvid4oG
         uKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728124271; x=1728729071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HwzWgYqivhHj7+dnzlG3c8h9sTHdrV9evRLKyR/6z8s=;
        b=v5mXtgM2rZcpAsfATZPWGocZAnk9TeigXOEhv5KmgWxGVYvJ91xEb8WbK5qdxZgIJp
         vTyTKyOzr2CNvTcj/76rfCMh05v1HtWpdTbyo7iIXEFJFCeph4pVtIt1YcH3lLB7bw9a
         H01HVbiWHa9iLcuEJGBhkb5fT6nEOY+JJv90uR1/xKbpZr8qlnBQK3KGAeU+8V0muonI
         rg2mU8dXhTStdbO+smQg6pAQIyuZL21BEAvbRAPVluFFxi1Wisf+yLIHAIQJwydGWQGF
         7kDFNQcRemESpsKGFaL903taz3nFB7IkRFdZmwlZPVbpWrGqH2woSB5hX54OiLqpy6oE
         nx3Q==
X-Gm-Message-State: AOJu0Yxoh1ZtaN5C5oTXaGiXm/rXeNtCTHJo7gnu1V9tfUBQtUTwuBEi
	sXtzl933vK8CW2l+QB1RsI88nT0EKt5ukyZYY1hScmNiPASzGaZwm4H4zfQAGaI=
X-Google-Smtp-Source: AGHT+IEOPMtL4BVfUFgMWZuRnFGsRtNqb/uP3ixzcZgVM2LYwmah3ZToT5wqwMDj8CDUs2Vq8HgMQg==
X-Received: by 2002:a17:907:3f04:b0:a8a:8d81:97ac with SMTP id a640c23a62f3a-a991bce418emr642020966b.4.1728124271181;
        Sat, 05 Oct 2024 03:31:11 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a992e7856bfsm116315566b.138.2024.10.05.03.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 03:31:10 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sat, 05 Oct 2024 11:31:04 +0100
Subject: [PATCH v5 2/4] media: dt-bindings: Add OmniVision OV08X40
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241005-b4-master-24-11-25-ov08x40-v5-2-5f1eb2e11036@linaro.org>
References: <20241005-b4-master-24-11-25-ov08x40-v5-0-5f1eb2e11036@linaro.org>
In-Reply-To: <20241005-b4-master-24-11-25-ov08x40-v5-0-5f1eb2e11036@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jason Chen <jason.z.chen@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3716;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=mYuK773IRT+YGybwbHjM35dYaPg0a7sBAF8PXfbece8=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBnARVpRfAm2zMkwC9vLk5NPBOv36YYy3xgdQzhd
 FR7OjAR2zWJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCZwEVaQAKCRAicTuzoY3I
 OgEzD/9OGf0LkAtJLwcxh0LsUp7S2uA5/4Nf653XkuGpLS+BWoCutUixaaTZpITXOzA+vWSc4Ud
 wAqbU0Dyh8o9a0cqoT3G6NMI6iMA9+e6o0lsG9QHH4qXvpjKjBMe6PG9u9Mb2Z+YTgUHCeIBAFQ
 0fCYGS3Q/6Bvi8gZ1dlAkHc/CwJ2V2Ek6aswF60qRe1jATzWHdHFIKTH4PnQTNX5OcJCMiDtA83
 8jzenjk3uHeopuOtkp05A99IEaKpWUkV6qvP7jQEgWEjCRFouYKWX4UG9xSCdWqRQvomAwN0slS
 TVXGd7Z35BioXpMLjqUrvAbIU4w8v5gJWtDpnDR+YMCOZi6mHIpnycczNU0pxZy7+cCJhq/C85X
 vomoSwAwdF4SeBZPXVTjRHx9qwIRRXYVdGxZaxTKFYqC429wTxmynAuy4hFZ3S4A/hh3QA/veNk
 0t3jwKyc8qjN4dNWwXlSrXjP1chU/aCHodh4O7I8xM6YnFLgDjNOl5yfVgf2umMcSxHL8I34tzf
 ESXZEUDsAZvVKwYqUZR0hcsOI5u6wmftQyFPULVIcY23EHapxNWrvs8Cj66gldbCtv9U246RSTN
 vX3NwI0rJk+/evjWNfwOdLBza44sqbVYpXdZ9Xdz14r53X93ngO58SWKTgAoQFbEyeVPy3LeBFp
 HfLvsEku8kGI6yQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add bindings for the already upstream OV08X40 to enable usage of this
sensor on DTS based systems.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/i2c/ovti,ov08x40.yaml           | 114 +++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov08x40.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov08x40.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..51f29033e1d94b1822fcfd90a6eee4bacd677c18
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov08x40.yaml
@@ -0,0 +1,114 @@
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
+description: |
+  The Omnivision OV08X40 is a 9.2 megapixel, CMOS image sensor which supports:
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
+
+            assigned-clocks = <&ov08x40_clk>;
+            assigned-clock-parents = <&ov08x40_clk_parent>;
+            assigned-clock-rates = <19200000>;
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


