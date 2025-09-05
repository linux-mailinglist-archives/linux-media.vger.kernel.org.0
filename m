Return-Path: <linux-media+bounces-41877-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 609D4B46638
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 23:55:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 032C0A437A5
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 21:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DB032F2917;
	Fri,  5 Sep 2025 21:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ketaxEqr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10FB2DCF5F;
	Fri,  5 Sep 2025 21:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757109347; cv=none; b=fWAERv4zvzuKsZJ5gpGaOFwBgPKTUgFxPgDimdoJlA32WgXRoiq848R2SwrkK8aO5deK4hop+vCcuiDPEm1lyg3eMeEffaZ4FDgm+Af76UhoUsLBpCyiU7BeCoLibDWgAVPJutZAjhhwNJgtZ+v0sSK8+9AoKuakywlRJGMTdaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757109347; c=relaxed/simple;
	bh=8JuGRpmLU80Pu52S/3fP1pZmc+YGQbq4UoLsnsCy3nU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L9CSaXj8tqB+0SvPxdE+awA+OYfrbc2HTvLgVduvIa7TYxWhLYapjcVLNFLoqq5HE3v9lTCKREWHU9YHTrwqYQfJVElEWv7v966ca/1xFTwHUPJfhyInGm6MrZUVlBiPPRyVq0vHcZSmmPur+CYeQc2ThqiIEq3opd051/nur+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ketaxEqr; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-722e079fa1aso27380146d6.3;
        Fri, 05 Sep 2025 14:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757109345; x=1757714145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzgHAyTGKthujv3G9OVp1g9igF+5bJOM3r8NI6q2Lyc=;
        b=ketaxEqrxL9p0DqNJO4k7b0I2VD/ROtv3Y4J4KyEuF5/N5xTes8156iKSKG2njwY8h
         zgx/hkPwVcVkRDG2fl0LKSCm0YtjexXn2P4uK+r4ii0mu68IHhj8IkgHfpn+QDWeDqeF
         PgoAcQyuNLCggF3L1XAT0wk0U4q7kMbmUJo/Tgthq3bEUEBlhn3dBe8ZZM6KyK1iSjPr
         dq5jE8LJkjcjmuzl5o0GqPjPawSjJrXyn0BdLuEY2+t8n1TMbx3jVkxCPncr7SkQzT5n
         YsA+XQB9ry6G/IDrjpeKhYcI56aqiuJxwhkF9F36cW+s3955W2OySkJOZB81pYg2gSwp
         ZGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757109345; x=1757714145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzgHAyTGKthujv3G9OVp1g9igF+5bJOM3r8NI6q2Lyc=;
        b=ZPsffFvLp24PRj3iM5Ty5QJ585hvCXWU2Sf+7C/oXeoIjTW7+SJp5nX1F9oO7boHj/
         gGeRfNzaykYCQyqX4UjvOrXLlXYTb55HFjIy9BzobiABfyapipid0CPj1FAnz4JE3CHG
         ulo9akyYNNVzM1Ve0oJljpf4AQXhm62mslTTJTlnH6YItcMR8MGgBejoCn8dD87bJKKq
         ZIzft0l/b1W/wP8ucKS82L7YYjg5zdt5SXQPGi0dTDBar1/bUIxTTYWH123+DCGEFslh
         NstY/17Zlqurv4po2TDfuaddUiC86HQOg0DqX4zr2TLG6aCbsct07jfjW89jef+fysf1
         N/6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUKF/73Jj4DxlIDHwK3KhLFc/5OfrE0abc4WZ/kLCOBXALASo+Wpe8rabBX5FhXVlh2bQY//UpiOi2S/RjwhA==@vger.kernel.org, AJvYcCVQEN5Q7OoerkYRQTrAADgq3HBlhA3ayWcW2DfvU4W2qh2CgCTcCRM583/OVMBhY/t7dj7F1ljTaIv4@vger.kernel.org, AJvYcCX8s0CN3lhH9Si8J+nKTF68sJexKkULsQWMS1tV2foj+QerSVT7pTaHBD5/ejIWtRbRut0dryEtnm589rA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQO2dwzyDdaLGW8THsYE+xeGSeyoygv/iPhDGZM15FIFwg0Fe/
	zr6thMHzw5cZ3PsxDhqFdscjWlKvocnAvviRrm+jlDonuO82g9mkjIdY
X-Gm-Gg: ASbGncvIoZvDsRSvKc6u/Bjq0+RamxgaVlhw0vxyueiXPOnsD/+CpUnASFsihdJyFLz
	s1BIhqLPhh11wCAOI9/ckGFblCvwRUvnac/cV6/y1eOikDMhGamVPTbNbBcOiRmv/cpHa9lQPxr
	8u4109RhWiift9nBW6jTJF45hvGV+UYSkuXSGB3eKcwixTaKrWoTDaVDguw6sz9ujDDqvjC80RD
	pFpIXD0T96TGkCaOCtg+rLc0Nhq25/JtSYpeoadBziC+/9OUYqqgTEDbtgQA0f+RvImUQjxA+aP
	MNFLaZqsj0mTLMpWihm8v7SAUCsbI6Ga7QGqd9v8g+CLzk3j7hD8ZDl5i34teBK8SLEXDG3u7xE
	8UTKmxGe9Esi/XmOK0glpNm8BFAnqTGmJghwJ
X-Google-Smtp-Source: AGHT+IH+8FNBCyjXwe65YVxrffDbfZtnSUNtCWycT+kNr4twZyjEhZJEHgvpmfyQyXPzY4nyD4nJ0w==
X-Received: by 2002:a05:6214:b68:b0:718:5e16:94e5 with SMTP id 6a1803df08f44-739322f8bdamr4504036d6.26.1757109344552;
        Fri, 05 Sep 2025 14:55:44 -0700 (PDT)
Received: from localhost ([174.89.105.238])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-720add66632sm72009566d6.32.2025.09.05.14.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 14:55:44 -0700 (PDT)
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
Cc: Robert Mader <robert.mader@collabora.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 1/4] dt-bindings: media: i2c: Add Sony IMX355
Date: Fri,  5 Sep 2025 17:55:18 -0400
Message-ID: <20250905215516.289998-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250905215516.289998-6-mailingradian@gmail.com>
References: <20250905215516.289998-6-mailingradian@gmail.com>
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
 .../bindings/media/i2c/sony,imx355.yaml       | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
new file mode 100644
index 000000000000..d4ba918807a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
@@ -0,0 +1,112 @@
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
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: mclk
+
+  avdd-supply:
+    description: Analog power supply.
+
+  dvdd-supply:
+    description: Digital power supply.
+
+  dovdd-supply:
+    description: Interface power supply.
+
+  reset-gpios:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml
+        unevaluatedProperties: false
+
+        required:
+          - link-frequencies
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - avdd-supply
+  - dvdd-supply
+  - dovdd-supply
+  - port
+
+unevaluatedProperties: false
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
+            assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
+            assigned-clock-rates = <24000000>;
+
+            reset-gpios = <&tlmm 9 GPIO_ACTIVE_HIGH>;
+
+            avdd-supply = <&cam_front_ldo>;
+            dvdd-supply = <&cam_front_ldo>;
+            dovdd-supply = <&cam_vio_ldo>;
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
2.51.0


