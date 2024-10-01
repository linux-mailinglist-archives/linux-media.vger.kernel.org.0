Return-Path: <linux-media+bounces-18921-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F8398BD38
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 15:16:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 448EAB23F8E
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 13:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41C021C5784;
	Tue,  1 Oct 2024 13:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rRyYp68M"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C88D1C3315
	for <linux-media@vger.kernel.org>; Tue,  1 Oct 2024 13:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727788561; cv=none; b=MGYLN2bX9/4ZGUXA9QYotMHP0xnijp6ics+9aybbtoGZiDwMBo/ADw98IAj0RM4N1RTYinVBikT1ao7cWV07cWUuljU7g8K7RQkDGQ3Qshp9KZ4Yt5+e+Ge1vnLCekQaSnM2AGDksg6Rs20Y55w8FeM0ZXIWvrh8/8EeK4flIX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727788561; c=relaxed/simple;
	bh=Lqdd3Iex9Ieycc9m4bbhq0l+g+TliLP6Lt7etgxesno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mwenSuLmeeuzeFIIrdAbrKuaJOSMS6lTmVu94LSPA1af/DPjrxcpqFj5acrEpz0CpUPOhvwWhtYkpqcs50WQdUr1Ib2+Qko4WHhBjWI7qW70Az2GssA1RUM85HSvqfmgCzRyPIm0uiF/WVJPey9OC6N9caKAwIFhL9PAGiGqiFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rRyYp68M; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5389917ef34so6346384e87.2
        for <linux-media@vger.kernel.org>; Tue, 01 Oct 2024 06:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727788556; x=1728393356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OlXAikEDwAtjOIbwMBno+zyl47bykwn2jCgyJZs+uR8=;
        b=rRyYp68M75u/4bHH8YZdY61UMh8BI9UJiMC7ws8CpspEQj10MvGI65bwxEYhYllhvA
         KgN0VRa7eTK5OuYEqMQXrhjME6PKVQdMbd3qwnp2CQ9oGGLzlWTvPMiVWbyD26sWYuiy
         NSwf0OW0nrVgrpvpoPpBqqzYuzdLMKKE06AiTP0Ieu+61mePbQ0+DbGRjEkHBIRiAhJn
         ruCiXxtVL3SkRlaChcn4bq1fvuek67PqR+txaSVY8USnQE/ktfrZDASr0bXEZZtJrYqE
         GOrQcmEm5cleDVonQqnu9AAxD4Tutyo3N3g7bERbTfol6UjuHk3oByATseCV9jybfhjQ
         8Imw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727788556; x=1728393356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OlXAikEDwAtjOIbwMBno+zyl47bykwn2jCgyJZs+uR8=;
        b=ktivXzw2FLA6oN5Xgih0DGfgHTv8ouT6Uw06zZenGAF1B7C0BVgJh7Si9Qq3eiLE+q
         dUZrU67m87t3I2P01V5q43V0NXXn1mbFZtb/ix/8o+lktqSiqZBRFuTsAn4MW8FMo2D1
         8LinEWo3aKuY4unx/G8igZNyiBB2mkrg77QXcwJG7hMpaePoFcgBKtnstdBEeuyGNQrl
         S3JzstgrY1wWeC0kfzNfQfW7PfzUsoEHvuwzKB5rYysgY+ztC5KaecAXctbX54LvPXH5
         lGz4Zfxnbyd3/MKOXeOd9Uzu+SVSrFiMEorC/uWRU/QkJ/IDMRF3UGXAwGtZ3WG/GU5d
         b20Q==
X-Gm-Message-State: AOJu0Yw536hH5cgUf3o3gwbCUKZqZ6YVC8y3BEBMoaUMHmTlH9CRAv0q
	+reEtovGTt2z0BLESKz3kKcGU1dczXm6NzGN1lD2qMLWozU3VHVs34Qc1XGhHyk=
X-Google-Smtp-Source: AGHT+IHNo9CACCWv9p7CK3KBj/Iiahgfbdnox0jvdyvCrXh8Zhk6yeMmUeyRPHsmRWzsVYK0FMwxHA==
X-Received: by 2002:a05:6512:b21:b0:536:54df:bff2 with SMTP id 2adb3069b0e04-5389fc6ce3fmr8500110e87.54.1727788556018;
        Tue, 01 Oct 2024 06:15:56 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c88248abf5sm6170875a12.77.2024.10.01.06.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 06:15:55 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 01 Oct 2024 14:15:50 +0100
Subject: [PATCH v2 2/4] media: dt-bindings: Add OmniVision OV08X40
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241001-b4-master-24-11-25-ov08x40-v2-2-e478976b20c1@linaro.org>
References: <20241001-b4-master-24-11-25-ov08x40-v2-0-e478976b20c1@linaro.org>
In-Reply-To: <20241001-b4-master-24-11-25-ov08x40-v2-0-e478976b20c1@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3777;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=Lqdd3Iex9Ieycc9m4bbhq0l+g+TliLP6Lt7etgxesno=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBm+/YH6qhGt1OnCw8VR4lfYovDxEKyANfFBA6g+
 dywFMkGSTyJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCZvv2BwAKCRAicTuzoY3I
 OrukEACIOwTCc0LpzFRqm+9/Zk+l2pvjzV+EOLMeex4UhL5hZMH+E0CFUHmZRKVO+5fc2mnqOvX
 Mu7FabWbBFD/UM2EKBKFOOl6NGSNqmbityXYBuvsmRhEWdjLHLcT3kwA29sanK8ICEOfH53IfV6
 Yc1FO2B2U+27/CnWU7a4rU4eTe1GVq6oAUGBgRav8qw0eruL8XrCWJn7pkF9Zt0hUW6Yc5TFHlx
 YFVHI65QRM5LTPH2dIbCua02n6xrK7D5SefwPjZF0RrSrkhE7cGTiXR+ISk4GOYZZaWKoErIzd4
 JIETyDgar7v1DwF8UFshz9z62L1zQxyavdMpuGQLa9a2kKCmxTwepwW2meSQuWxX/c/GiK92CWC
 Cos6ud5SRL3XCNPdfD21MiU5zgT8Q8bX9x/Uh/NQqcTNoNPufcEUPcRRETekDMk1JF2zNVtGVLO
 5H0KT4ywTnFgSYdSRx9YShIggwSRMuRxOFkdFMf3XVJPfyHQtzjxSDLugjWiS3Pu1yWV/RmKATS
 EdyLo/wislwX7T84N2ffLa+4p077Jq1iPkcNxN/RFL6sZI+LN5FRCDQXu0zgCD0OYnYEc1Ja3QV
 hMczJBD+l9RdlqljumAkxGO95N7ygsALcaI9rYhJAPSQPFU00mpy/DDyLkX5Aujuw84TYeeDE1T
 FvyZmVmTKHoqdBQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add bindings for the already upstream OV08X40 to enable usage of this
sensor on DT based systems.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/i2c/ovti,ov08x40.yaml           | 120 +++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov08x40.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov08x40.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..bc499e4b5d48ed57250dec33a91c92552f137cf9
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov08x40.yaml
@@ -0,0 +1,120 @@
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
+  assigned-clocks: true
+  assigned-clock-parents: true
+  assigned-clock-rates: true
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
+            assigned-clocks = <&ov9282_clk>;
+            assigned-clock-parents = <&ov9282_clk_parent>;
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


