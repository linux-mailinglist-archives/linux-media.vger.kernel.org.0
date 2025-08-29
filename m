Return-Path: <linux-media+bounces-41341-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5873AB3BE5D
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 16:46:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1B7084E123B
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 14:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ABBA3375B2;
	Fri, 29 Aug 2025 14:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WLaTnBDT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01ACC322770
	for <linux-media@vger.kernel.org>; Fri, 29 Aug 2025 14:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478571; cv=none; b=lkflZ1+MJSaeZnimMfztt3GsZcvD9zWirBHci6oRgCdLsnypjUMo06bC83pRclpr9P8JIkieBHKOz88Ia4t7VZmeu4S9AmHcmVQs3GHXR5cYUTFpwTbCicxzZv+InMN3VO3vglr7mZuQ1Y8wRkWcC/SjCcDrH+YQiXpQX8vN2CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478571; c=relaxed/simple;
	bh=K3kLFy5AolmiZmDqbyc8Z1XPsjrCmMxQVG2QVl0nJMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iUzP2bkGJDnTXWcXHj70vNPJH5ziH6ddMyV0u3Hqd8FHWWEkFnD/NYQR8wSXIJT4T5Lkg9GFjbIRb6mF77Iyz/BXYY4T/TewGoGoLTHweLfI8pha7cmSHu/TahTsRQdVIZjq174AjafsKGd2AbzTyxLgJJcApm0IKw1ymSzkHYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WLaTnBDT; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55f47f55f94so293268e87.1
        for <linux-media@vger.kernel.org>; Fri, 29 Aug 2025 07:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756478568; x=1757083368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YmBc8dQru2L96M5/ueLwHF2ffKRnEDVJ8du/tOPy8lY=;
        b=WLaTnBDTKXdqhYv9dY2UpsTKIrjNHkepKg4EXRXtao8AZsXVAENUtnYyqqLelsSpBu
         rugQ2/Tt1jggJ78ukhXFKauPHBI1gGBYlkJayvitdSg9OgIHwyq/3mYrqYLW18UXi2WY
         irLVSGsUtFuKEmfHBbGxL2j2x29hJfcPGppTYjAS1HLXa8l/JIVvCvzFIx2P6oPfqWVN
         zptFBELQxNiUO/wpnh4/kbER/Q4SfadaEcSPsl9lkA7xpdXFXcewIn8dQwGtKgFPzozI
         IHlFkQu81lhkXV8x41B20tqP82MN3Jik9+TdEPDvXI0JUxWSqLbfW5Z9vSayIWxHVMbH
         JLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756478568; x=1757083368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YmBc8dQru2L96M5/ueLwHF2ffKRnEDVJ8du/tOPy8lY=;
        b=I3QQCjQgth8q6qJ8owEWqvgIf0vTwIUVdyFlg3qtry9Va8agjSQCXQX42Bkvr8zW58
         4BzX+4PR0hBD5LVOvdP1G6NVIr6tYxCLFR59l4sGYSiEZ6g48azajI3Cj+bXswZ3NsMO
         GAz1g3ZVzFw+RO4dMMO4jmedyHPuMqvVB7U0cKqb4WcgWbjF6LIWsrSz6MTa3Gqg/3y9
         qujvGGKDjCOrOMimsf89QW9WC8dlFmKK6gWklOs8tjzUh0h+oakGCnDkZoATRU+EtgID
         z8RjWO3gHIGCQPnNN/C2m83Ef+H6by561lk0iWKsBQ5JjkJ7Z77Kl0luS13SbAiJEkJS
         lD6g==
X-Forwarded-Encrypted: i=1; AJvYcCUC1R3oFbrAAa0CAmE/xkULJ0pKTztCpQRfC9XpPqsZtRjDeOAYz7AsxHf1GU9L0BV74ky6I7FHOOh9FA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHbbeuyyu9/Psm+ZL6wib95/7+SK4ajSYlEDFQxBN/tsCpKk8u
	S2OYCrcpDWH2DFhJNtP1o1eLxJM4/oJoJjCpquY3OD3wZEo5W53F+45gq3pszGN0hjs=
X-Gm-Gg: ASbGncudUUpIgxytP5CRRTpWFWJ3lhOpdh9tGTgg/gM+ODuxC6axNBsFieJQqjwDk2m
	VaJSDOXDfSb68DBWui0zZtGn3JGI5P4sCSsBDSQ7noT3mLAAPiqbHaDeL+8jRPKXrKAQeFwkPLu
	Xz1LLkiOr7/cSNdDVWT0sZbBx/A9l2fEuwQUgByFSpARLX3Qj2WjzxaGsVyykzhjbzgHM0p19+a
	/LrDNn7/weabgJjZCR9+BAEH/uYG/amfnHcpYWKwKWpyjd6bWW1JXJEesihBfXBPgDLQc700aCy
	sSEBoKikhP0G1xGc74rbd16gddBkAIKnDL89q8HKvA3S5gAX410ZAwmoLf3fbeY2o4BBbh69q9N
	hT3XgN47Rnnd4TbbZb2iPvYFf8rYTTItV6cSlAPDQAY9wb2rvWZ36lvoeYXzmcL8s5be1Z5w=
X-Google-Smtp-Source: AGHT+IF7rUUtxFHxoZwqCxS2mzNlq1hZ45aW3ccAi6YisO23zrpT87a/u8+0q7UOCZTHCaKP3DOOQQ==
X-Received: by 2002:a05:6512:61a1:b0:55f:433b:e766 with SMTP id 2adb3069b0e04-55f6b1db187mr255896e87.7.1756478567997;
        Fri, 29 Aug 2025 07:42:47 -0700 (PDT)
Received: from thyme.local (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f6771b237sm677240e87.54.2025.08.29.07.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 07:42:46 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: media: i2c: Add OmniVision OG0VE1B camera sensor
Date: Fri, 29 Aug 2025 17:42:41 +0300
Message-ID: <20250829144242.236732-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250829144242.236732-1-vladimir.zapolskiy@linaro.org>
References: <20250829144242.236732-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings documentation for OmniVision OG0VE1B camera
sensor.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../bindings/media/i2c/ovti,og0ve1b.yaml      | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
new file mode 100644
index 000000000000..bd2f1ae23e65
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,og0ve1b.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OG0VE1B Image Sensor
+
+description:
+  OmniVision OG0VE1B image sensor is a low power consuming monochrome
+  image sensor. The sensor is controlled over a serial camera control
+  bus protocol (SCCB), the widest supported image size is 640x480 at
+  120 frames per second rate, data output format is 8/10-bit RAW
+  transferred over one-lane MIPI D-PHY at up to 800 Mbps.
+
+maintainers:
+  - Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: ovti,og0ve1b
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
+    description: Analog voltage supply, 2.6 to 3.0 volts.
+
+  dovdd-supply:
+    description: Digital I/O voltage supply, 1.7 to 3.0 volts.
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
+          camera@3e {
+              compatible = "ovti,og0ve1b";
+              reg = <0x3e>;
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
+                      link-frequencies = /bits/ 64 <500000000>;
+                      remote-endpoint = <&mipi_csi2_ep>;
+                  };
+              };
+          };
+      };
+
+...
-- 
2.49.0


