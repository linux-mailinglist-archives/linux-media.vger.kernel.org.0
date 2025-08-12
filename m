Return-Path: <linux-media+bounces-39634-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44024B23ABC
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:30:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FEDB682C7F
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627242D7383;
	Tue, 12 Aug 2025 21:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="udovj8LX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE232AE78
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755034236; cv=none; b=kQuLGBoYzRs3MCaUgI9FHD5RkCg8SMzkqc7beV/uqwGhheRrQLmZZOYaD1XUBzUyLAesNMWw4n060Y3ZnbIMfsMKwy6hJSKAwaHx9YNBQnmgTlgErGEDFfEDWVQo1jwyq0uOO6LSNIP7RZMl1iH7xWjxaQFN36HPnAUhogGxlmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755034236; c=relaxed/simple;
	bh=6rsvHwbq1ZUOU6q2XFxKWKfjdqEYIdIpbdeFfTU+zsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i5Cd2H40Oj3dphzsY8ecgURtU4M3JXoATxgk1WzJWf7u6867QijFBhkHukoBuj9+kJuLpYZ8hLplGgVMWkPeNQXxutAk29yCPYnQWfOeXPCAj5U742bxum9Xua9OVuuATfR4sk+tDbh1UxT3I+9spZPUN91g6kybUytTbpzneQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=udovj8LX; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55b9f78efd8so778016e87.3
        for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 14:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755034233; x=1755639033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gI2iPk6jJ3wjhTXJWjGoGdGR2G0QCZ8PEmF6511ZCvU=;
        b=udovj8LX+57E2BO51a2sVguZtySO85T9megVDzoBb1Q5di6z2bOWS05SR8d+Bgj7JX
         0KDnaMU51d5sP6D4/tiPLSYb79PScSn1Qqr4P9BsiBq0EG0jR9cPIpzwCL9GEE0rHb1q
         p/pVYwf/OJzE70K3q1m5ADndXk8dhMhMCFWLj/jU5CyYXYRovyfSPX2L6Zc/YmWT8Tyn
         n1g918/V0GaykKwC5QtLPCYNDlNJvlLa5bmBkOLJpfrPZcS8sguRLctVjiU5GWW+VhRd
         kP1moaZQ2M0z/aSqVD8gypnDUZvlz4aJ2PXfYso2ZUa7hpDTHWQ0RREiwcbZ7xIbcRAw
         uvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755034233; x=1755639033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gI2iPk6jJ3wjhTXJWjGoGdGR2G0QCZ8PEmF6511ZCvU=;
        b=s5OaquxSC8gORGU9B3hXW9mBVjIN6RtCbswYodyWwTbJC60peAHWphRvdX97/AVtJi
         bz6NrVOZ5oowQ5/ey4ZnkPHLp7Inj95TpdJdAStzqV9XAr7/jyu5nvJO9dqUb0LAnuug
         1nG9uHwGCdJlqvJmNcwhlaZEAbykkhaODdzVkoOnXZL3GbWfx8t1BELGALJRIwxijGI+
         06a83tHVIUXcs4h+4+IMmjL4v+f3TQr/2Y7g7BnNeN5BCSLZNpu/CNDLd6i9Np/fII/d
         Wy0evx4NzwP6g4ysPD9xDWcri5zGL4lwalbo/dCqqOHq5ONT9lBNLOqLLkH9m7V5P/UH
         wj/A==
X-Gm-Message-State: AOJu0Yw3TdedhbUWBEsFRPgN/rTVcv4Upd6bEaT8spOxlsO3X+2omzgv
	UwufZziZCRSHP/VWJzIEyyGsHCNpvZmzgYLFSDRo69fobBoPU2wLgz8q1S5Hg0FKlXhGdYE0HwH
	T4cv70r0=
X-Gm-Gg: ASbGncvl1Yg8QBPRzDqiI5mMn9XeywQQQvDu8dP9hKpq10/SyUIceutA942ywXFVdtv
	sxzwmGCYgIToYWN/elk/NjRITPB1GMHHMhV0/FwAgQ0ayXtyIs0KjZTVcct4c6xgjpkWbCD46Rq
	/7+fOz1UHcQ0+FdbruwVHKrHWceWyQeil63gTR+w7iCEtsZYuyjkv5Hl63VbdcqqhFIBM0jntQr
	UC9IPusp6yVYoKDed03lGDxwJG+KQtOlgvY1teeXuvfAyKmC56mnyD2rsbHffYgXtOP/STtHSaS
	zUceUSwYLtB0uKXw7J9lpRaQVsVmq0PdsK1e7hijk9ZBacRt07RGrmOgGR4q779m1aW0LN+b6H7
	j1g4I10OaE/IDaOPyTokTbipP3IF5CjflcHLz5Gla+k4vx//r+mBT8pt5AOON2WFyWV06ks67PH
	hRZtPXqMUY
X-Google-Smtp-Source: AGHT+IEKaRJoaXImW0N3HeagTSnD2pVoD7yFYSFGpk2bc0PWrHLczMaODdf7nyYOXs5KpSon5OTvUw==
X-Received: by 2002:a05:6512:3e16:b0:55b:8260:3011 with SMTP id 2adb3069b0e04-55ce013caacmr92306e87.7.1755034232826;
        Tue, 12 Aug 2025 14:30:32 -0700 (PDT)
Received: from localhost.localdomain (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55ccccd4917sm1612331e87.106.2025.08.12.14.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 14:30:32 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Tarang Raval <tarang.raval@siliconsignals.io>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: media: i2c: Add OmniVision OV6211 image sensor
Date: Wed, 13 Aug 2025 00:30:23 +0300
Message-ID: <20250812213024.361267-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250812213024.361267-1-vladimir.zapolskiy@linaro.org>
References: <20250812213024.361267-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings documentation for OmniVision OV6211 image
sensor.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Some minor changes from v1 to v2:
* removed dvdd-supply voltage level from its description, it is not fixed,
* changed a MIPI link frequency in the example to 480MHz.

 .../bindings/media/i2c/ovti,ov6211.yaml       | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov6211.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov6211.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov6211.yaml
new file mode 100644
index 000000000000..5a857fa2f371
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov6211.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov6211.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OV6211 Image Sensor
+
+description:
+  OmniVision OV6211 image sensor is a high performance monochrome image
+  sensor. The sensor is controlled over a serial camera control bus
+  protocol (SCCB), the widest supported output image frame size is 400x400
+  at 120 frames per second rate, data output format is 8/10-bit RAW
+  transferred over one-lane MIPI D-PHY interface.
+
+maintainers:
+  - Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: ovti,ov6211
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: XVCLK supply clock, 6MHz to 27MHz frequency.
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
+    description: Analogue voltage supply, 2.6 to 3.0 volts.
+
+  dovdd-supply:
+    description: Digital I/O voltage supply, 1.8 volts.
+
+  dvdd-supply:
+    description: Digital core voltage supply.
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
+        required:
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+      #include <dt-bindings/gpio/gpio.h>
+
+      i2c {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          camera@60 {
+              compatible = "ovti,ov6211";
+              reg = <0x60>;
+              clocks = <&camera_clk 0>;
+              assigned-clocks = <&camera_clk 0>;
+              assigned-clock-rates = <24000000>;
+              reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+              avdd-supply = <&vreg_2p8>;
+              dovdd-supply = <&vreg_1p8>;
+              dvdd-supply = <&vreg_1p2>;
+
+              port {
+                  endpoint {
+                      link-frequencies = /bits/ 64 <480000000>;
+                      remote-endpoint = <&mipi_csi2_ep>;
+                  };
+              };
+          };
+      };
+...
-- 
2.49.0


