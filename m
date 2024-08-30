Return-Path: <linux-media+bounces-17200-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D1C9657AD
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 08:35:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 165DB1C22AF9
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 06:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 467E11531E8;
	Fri, 30 Aug 2024 06:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="urphI+MH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A1014F13A
	for <linux-media@vger.kernel.org>; Fri, 30 Aug 2024 06:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724999707; cv=none; b=J/VRJVUOMUA2nJxNan2dku9bg5OD1l/hOCGKqwC8MTrDTIMF3A6X9HA65dFkF/M+i8j/8ZhygOJm8/JW5y44SNqAjKw3KSjb63iz9rP0q9k3jmk5fSj6p3wvKO5pF70ZuPcsp4T31FYmZu2sMTs4xq4+rCSrwfZj00v1iqEmqpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724999707; c=relaxed/simple;
	bh=yYQ6acehCyW1zLMUki14le2kpNm27i0RtoBcCYQ15Tw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lsltIGa3pideSwa9mLdsLFQ4FqkKB2v5xLjMtCIFuktnDb6k11TRe8IuNN1Q7S+pFaqjIPW0+KEYNmsZPAEwtrQCsaiqyUqrwuQnN1R8gcvBDxMPUXzYi/bqeLcUX1nNZ8nXjjDL5z4gnp6YhZ854clh+j7yc+w6Omewph2bcyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=urphI+MH; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f401c20b48so961411fa.1
        for <linux-media@vger.kernel.org>; Thu, 29 Aug 2024 23:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724999704; x=1725604504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDnDU3kgVwS7LsssVzzQefO3+iiD2Zk1z7JTxz0bJKQ=;
        b=urphI+MH3FfZe6MLYbCloWgjOsWDVsnfzttyqs+UElSvOA/M6hbslnsO8j7GFXK0RF
         QXJZLU/mLTPX1Kev2MrLiX/HbZv48aggX3O0RSVza9NTU4IB/tjDb7F08ZRLBGoQwcTX
         ggrAv1H642gU7xf3Ekd1bRvRTZDfsPx5ch1a2zHUq5G2XFVIMfg5tUJYt+5zVxF1kQT7
         hE9bhI7idD8IFOU94Z2WsDpUyR+/yXTyiiaOlPBaKrwm2pkDO4h49bZXVTv0w9WXts38
         KvS8SjJqO7wjgqJfAoTvuwHoeR/uXQ1lAg9mPTHzS2XBOIOMuQfL8NTzBcNP27v3vOFg
         vwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724999704; x=1725604504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SDnDU3kgVwS7LsssVzzQefO3+iiD2Zk1z7JTxz0bJKQ=;
        b=Y+XquhnBNJnLtCHsx/lvS5MGp/LRc5da1T+3eOIUVMBXN/LzReFeccb1smoWkDDsG7
         8/b5GXs/aJaUQBVM2/tZL3IOGa9YLfOltjKQxxvXst+hYG8lh7c4Ehy0wOz+ZbVQ0arT
         AFpbYPZzoD2IWpJAIAFMC8u9jdS3vL3OpXZ9JFgIyQfrAAi2++yqbydKdYwELopGiSUd
         049rwfSU4xUFJMg4UXOfNg7vlCufgAy2YCQGujfamAsJZ+GbQYHlaB9t9DX0x2b1shLt
         o27E2tEDQIh4o1LbTfGk/qoIBi1WbuyGf59gJF+BTdb7Zs9DhiPIWmF07/ys4oIJPHNg
         oxtw==
X-Forwarded-Encrypted: i=1; AJvYcCXB5aBit7v5+MX5PmZ657Hd09TNQ80LSAkNHlhbgyEwh+3N40d7vljtEWPncvyl9ARcoU5IM/GNeRNiqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDu9hUvDUo1m2iax5YR3ZvpA/yfGSFKmenLqClre6gT6t/MCCa
	B8We3pv+YtYg8cj8L+jYdOzCYtwfD01QatUIDFIierGxkHIT5nJoqIAsQz8Mu7U=
X-Google-Smtp-Source: AGHT+IHUyvr8pXivZtsQv1J3akeFVxkHJVKRhZ/KiVVOTyEeBR306kHbWJatGH85ERomac9zgh9sqQ==
X-Received: by 2002:a2e:bc0b:0:b0:2ef:226e:bc6d with SMTP id 38308e7fff4ca-2f61e023cf2mr4806181fa.2.1724999703575;
        Thu, 29 Aug 2024 23:35:03 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614f00860sm4879441fa.45.2024.08.29.23.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 23:35:03 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/6] media: dt-bindings: Add OmniVision OG01A1B image sensor
Date: Fri, 30 Aug 2024 09:34:54 +0300
Message-ID: <20240830063459.3088895-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240830063459.3088895-1-vladimir.zapolskiy@linaro.org>
References: <20240830063459.3088895-1-vladimir.zapolskiy@linaro.org>
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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


