Return-Path: <linux-media+bounces-13808-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E71791046C
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 14:48:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 117E31F229FC
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 12:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2222D1ACE65;
	Thu, 20 Jun 2024 12:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k2W0HM1j"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB9C1ABCB2
	for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 12:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718887674; cv=none; b=jfxVn9LRQ1+RL61McAqYazmkPJxbv7ps1H0XE90nQPMWbe1hkSD5ELkQx1z+lfzEvmBSWxR0zVuFyX2Du+nD1uzb+sFdfn7tEz2rdjz0oAeyIcUZs/2/3iOeidNFMZIY3igokPvul4th9Zxvx/zE9fgknokYJJdZ/PPBnl6ZoQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718887674; c=relaxed/simple;
	bh=P41aa7WDElOn4XJZBkUGownDE7+B+k/xhDJi2TpSQfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HLflfh23MdyTlypNSyp5I0HmPmfXTjs5PwxVibvtyZWVzl+m/FKIYe1+TKbg55pFydwY0Aymd2Ri/Kkp8y5LcwuHLgpGIyrsSA522llz7s08xyIFnxqAe9ukgL2jBH+35ZPhtl7t7ZEi8oiSNpLCfH3F/RvbYj0FU5g1nfFDt44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k2W0HM1j; arc=none smtp.client-ip=209.85.208.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f193.google.com with SMTP id 38308e7fff4ca-2ebf5987909so936051fa.0
        for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 05:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718887671; x=1719492471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8u0U2kPrmfNx7ufbqQxQVsCfOifpaLBvfvEUHbGXwI=;
        b=k2W0HM1jtekAyEq+CwWXhtji0OIgS9o58PI4juVK2eU+nH6jiR/o8BLvUzogtXMX08
         Fl76+EF3R04uLjf5p7LkQmNqvLs6xSkaZjf495Whuq4UBbNLFachakkJQEzLpiGwMJw6
         ZYXR3CW8PqnjTv4nG1s32BeE6GxIfUo3+Wcm0w/Vf4sHoqI1tMIIZNypiE23WQSY8V8V
         5JcdN6LO9aDfTU718boJBLMhR1L0i4cKJ+haDZ3zDcwDMiNe1KzStbPQXgx6UZpqRKJu
         Uj3+Whsj2eQuzO3nGjTDZemPGpR+h3l1Dyf9OW0Vny27Iw3LRtZEWarZYGX9yLEOE4N2
         F7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718887671; x=1719492471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8u0U2kPrmfNx7ufbqQxQVsCfOifpaLBvfvEUHbGXwI=;
        b=N6Z6XpyHhpfs8k3e2IBiSzO0eQF1pihNYszle052sur7aAkfrUXIEdyM7sGFAM3K4N
         UTYiXCGhDpGCm6WXAgxf7W6CNWGg2tDrNTKi9atms9+v4Rvb2BTaBC+i5rOSlNvGHBAK
         SMenzcJTJmxFvKyJ855paiAZY95k6K1pJkNkcCrJSEYK59/ODdaAU2EVjC0oECzN5k5b
         92+ZCavEDk7Hx87gr1P3VaU9PiglPMEXxzNTODfvGC4kzTCUJpJi/wI8SAVQ3p2if8w8
         I3bGkohBhFr2q/MBge5odGLMOFJqi67Lk6TKni2KuuOfh4cv7dAcHXykBU4vCR1UgjFM
         L22w==
X-Forwarded-Encrypted: i=1; AJvYcCVff6BdZVETmPzp82LDRP+/sXTJs2dwkMQx8OJcCAwMpG6Dy/x8OFXU/1ealNhSyXLyEeHXcK2W5PY8wQHd9rWfe8Jng8KFrpK1WkA=
X-Gm-Message-State: AOJu0Yz/OdLLGTGVbfTtIhLUYD8tIP0MQFGhKDY1B1iUuB1UGq2iW0vR
	dAO9MiQ/NvPMAp1ItyTmqwg2C1F/2KHHP1OWfBc5VEupsONop2KKuk/HaPMQMQQ=
X-Google-Smtp-Source: AGHT+IE4KTRBYTjWtTkJ5PdDFsgGZk5wt6fJvBCyFqaRhLvhQ4C4Y1Ext0P0TROYuT2OfAiMyH6r+w==
X-Received: by 2002:a05:651c:1255:b0:2ec:31d9:16e1 with SMTP id 38308e7fff4ca-2ec3cff8f63mr24714151fa.5.1718887671027;
        Thu, 20 Jun 2024 05:47:51 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c17ba8sm22421411fa.72.2024.06.20.05.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 05:47:50 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/3] media: dt-bindings: Add description of OmniVision OG01A1B image sensor
Date: Thu, 20 Jun 2024 15:47:43 +0300
Message-ID: <20240620124745.1265011-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620124745.1265011-1-vladimir.zapolskiy@linaro.org>
References: <20240620124745.1265011-1-vladimir.zapolskiy@linaro.org>
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
 .../bindings/media/i2c/ovti,og01a1b.yaml      | 108 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml
new file mode 100644
index 000000000000..5f4c9c4c1ee5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml
@@ -0,0 +1,108 @@
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
+description: |-
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
+    description: External clock connected to the sensor system clock.
+    maxItems: 1
+
+  clock-frequency:
+    description: Frequency of the external clock to the sensor in Hz.
+
+  reset-gpios:
+    description: Active low signal GPIO to control sensor.
+    maxItems: 1
+
+  strobe-gpios:
+    description: GPIO connected to the sensor strobe pad.
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
+
+          link-frequencies: true
+
+        required:
+          - data-lanes
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
index d6c90161c7bf..eff16776a287 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16509,6 +16509,7 @@ OMNIVISION OG01A1B SENSOR DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/og01a1b.yaml
 F:	drivers/media/i2c/og01a1b.c
 
 OMNIVISION OV01A10 SENSOR DRIVER
-- 
2.45.2


