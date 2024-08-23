Return-Path: <linux-media+bounces-16645-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EF395CA75
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 12:27:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6777281E87
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 10:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87B7F185B68;
	Fri, 23 Aug 2024 10:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uU+MzmJw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2293C1607AA
	for <linux-media@vger.kernel.org>; Fri, 23 Aug 2024 10:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724408864; cv=none; b=ltd6eKuMzaBWdogbN8ZHoq/23unpAW+nt1pUdKwxYWWbX+9yAUJuXcRI2hDxgpBNzeiBIka6x2wgD4I7qLq+xsoT5I88LAnX8z1xZjOb92g5mf5phKpoBjPeLeWm8AlEnHjUp75JYylFoD0ftoOKZWBSELDy1Hb43N+adHa823U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724408864; c=relaxed/simple;
	bh=7jtO45iwJAAgfmHOZWPXSXPTcsdPCcn8YU4bEjvnJpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C93CkfYahkxoFp4H+aFc7+U3FZcPW/dXh3HFUEx4tFm8TrHWvM10QZPAH4305fgYlJkx2FzE8wop7/eekAzSMHUgFVJGW9qcWOo4l8dHbcNKSQ0bNFfvX39kxdrT0aQVNyn3JnDgUngDKNKuAREDateKsCNbTWKjIkBg9pF4lQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uU+MzmJw; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f402830d19so2961811fa.0
        for <linux-media@vger.kernel.org>; Fri, 23 Aug 2024 03:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724408859; x=1725013659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZqDlZ0/ZGM06KWmfesFZAE+M+CUqOBy+QMXwudGFcY=;
        b=uU+MzmJwuyPmI+Wxqt4z1vwKdCwrlEU8gT3awvMNMGm5tcoBKepqV4+aP18FQIqg/s
         j91jeViQUhVss9oKdnjvzkIFT9oTxIfCqdv2J6+KWXmkJz/tkqV9kK1Uon1WayIDzAts
         p6uO/NQtrUrf4d2dmMtRd4BJLrIG9WgYLvvh9h5yFI+kR06Ldol+0yhpGUhuZQibTRCF
         y43o9U5BfkmH4upUHgw6PUMnssKNxJppRbI/x2PVX3uwbtvjDmzUsHZsFQrc0oDaOZ2U
         7Tl6NV8px+2OsTZJVVOKSuVhg4l/a8zk+aOXOUx/oqIfNjIeY3fjhGHpeS/0sXvmPDR1
         6nBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724408859; x=1725013659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZqDlZ0/ZGM06KWmfesFZAE+M+CUqOBy+QMXwudGFcY=;
        b=UCdAjuYxJATSTNiYVwQ6sraCi1s+bL+tFfd2udDpppjSbMrNV8a1cS/cDaI0p79KZt
         /d+zlYRCbV1+BTu4ohVUHvaCbv+gCaQ+A+RS1C9F603rzjZUxfVRcpt/HDBtZpOOP1e4
         MJBQU7YoHicAkfBkfGYhatK/4hEY+ADvQOsfGzfZQI9MVIBjVDw3d5p3CZ3amRdKiOlP
         pI7sb8L9SrzUrWK8VG4UyM5+opOHjhYIsN1Klwpu2340m+R0a2nE71Ra6qZKJDvKTyLF
         LNB8i0+X+0Efz08u+GHTNpbx4SatA3q19G2BKE2zLfPFdGdy0UR4eSgQQrTOPc5pysn9
         uXKg==
X-Forwarded-Encrypted: i=1; AJvYcCWLD7aQ4rmR/3B7IbEYRDT+muQD8gfi94USvvMS1SZbo4dWdfYL8odGn3VAE+OOgl1b+g0JjY3bGSn0XA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDbMs5wYL3b1gj3rFv5JriW+HDvQQEXYxzqVBl84/qFVaBI1Ir
	RTnuda1du3ZPWaWVAsLe0J9D+9GgdQkz+rjDFdyG0rp2wF4WkTI515tCT5Cg16I=
X-Google-Smtp-Source: AGHT+IGnbSm5104EwX1aNcAsLt0GTw54/sEIe6+bmsLuIXLRM2An5z1lDSzxzykfIyFwaEGEvPWisQ==
X-Received: by 2002:a05:6512:2814:b0:52e:ccf5:7c3e with SMTP id 2adb3069b0e04-534387be271mr563339e87.7.1724408859253;
        Fri, 23 Aug 2024 03:27:39 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea5d220sm504669e87.183.2024.08.23.03.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 03:27:38 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/6] media: dt-bindings: Add OmniVision OG01A1B image sensor
Date: Fri, 23 Aug 2024 13:27:26 +0300
Message-ID: <20240823102731.2240857-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240823102731.2240857-1-vladimir.zapolskiy@linaro.org>
References: <20240823102731.2240857-1-vladimir.zapolskiy@linaro.org>
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
index 8766f3e5e87e..10d3c510314b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16792,6 +16792,7 @@ OMNIVISION OG01A1B SENSOR DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml
 F:	drivers/media/i2c/og01a1b.c
 
 OMNIVISION OV01A10 SENSOR DRIVER
-- 
2.45.2


