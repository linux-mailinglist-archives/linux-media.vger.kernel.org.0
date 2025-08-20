Return-Path: <linux-media+bounces-40494-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F5DB2E849
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 00:47:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 351C61CC2803
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 22:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5921B2D979F;
	Wed, 20 Aug 2025 22:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ofUA6xzD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2992C21E7
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 22:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755730013; cv=none; b=KpVxAMTrtK0B88f7xewXAB7NT7xxGouwnony9a6c8sVI23hjze4PHlVVwE9xuRivojdAybBW43INmVuw9mhHf4ZoeaOXYSmEGi4KYmOcujzQHw2HciL6n12esDhkw7CgJAup0knnsdsYoKd1vkTZ6SaJlZtu8YE6B2wx14eYGYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755730013; c=relaxed/simple;
	bh=zOgRx3Yn+m3MfNCZ7/Efr194CRiUaVpUkdYD9qKDHU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WJq2C7eqY1v0xZFAg9cNOHCrV7IYhq5IL+P8OC9IRms51hA2WkQpkIw9CH9kCSDFdzafxd4wyaM0LF4I50NdcCX+nXtkHASbx+gfwxp45yZr2nafaNiH3KrCqhgVkGZh0m/fUlQC9D4DVCMkAdVsuNZWVYx26ndsPwiaJ/AF7mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ofUA6xzD; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55ce522ffb7so15212e87.1
        for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 15:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755730010; x=1756334810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GLcjM5uGCEzuVCUayytEkMUXVcJWRwPsKtnPCq0+CZU=;
        b=ofUA6xzDiW+msqPrzzsIaG8249eLuMggfhO+Yk+n0jSAIxLbgw3ABHJ/iZjvwDX3HR
         3tUtywWVlf+EG67mlB23CjmkwvdUC/OBS4tf8CyAtxWvYGUqJcofMAveW1b438tZ8ELB
         UCp8Q63QyUKc7zs8Knx7ZLPX42C9JH259nLreGfUgW1xNWCgLCh9CdwyA8tzFz7iHGF4
         kmQSOKAzFdQMvaqGJcYnhV2megU9OfPknRt8bMEo4lxe4PtNFRpT6ORN/TNYH95/owJ3
         EjawH3MheYwPfMoKdwzHix3ZtAZnkaMdWnihznwoLELXSdEngIsrIAET9+xFXCWANkJF
         MVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755730010; x=1756334810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GLcjM5uGCEzuVCUayytEkMUXVcJWRwPsKtnPCq0+CZU=;
        b=OEZuU4z1QxQ8LVN+EFohuMXOE0tpRMtj6aZKlac+zGiz1Q9EWW5yimEXYhDuYD/zk2
         +XMipQUp6Rar+gG/+vV27VhhqYfx6QRlMxqu0wemQ5hPKCPUHz416D4r9H0KkDhXHPQp
         KNqF051K0ONSKjhoGDzrQIbs31PmApV0PHETMw+V/DNl5BvbnItN+uR2zviAIjm4ggEa
         RoR40173GKSz8Mw7emMNeeTEEKo3eGJtnc+ojKfBSdamq69OV62Kx/Rc2ek3rI+48Q/g
         uTpmotHhMcebAH+2w7APpGKrFyRD7bmmRMI8n8YS8LFe5ParSNeO8FGcBC2QXqL456/Z
         8swQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGacAI0FUm/wOnSDU+MDf23aXpiV96HhbrgLdb0Uha3iFQLqHOEklHsHhGfsZjXYr9RWYthYN+VEAIWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiUU/eHb7QrTZELGOHhfCSWYoyE2x4XU4AbWBqt4PNjnhmbWso
	jHzihkG+CEErIx5p4nC25w9bIquu1kUs6TALHy/0lSlxAIjbU8NbzQ72Fbe5FD8k6EWzpg7IPMV
	42vwN
X-Gm-Gg: ASbGncvzpMamVa9gsquEX3U1XHQUzyPsBiqChyn5sh7iu/ImzlGxTfYY/OrxzJF6I0b
	2Z7P39RHbWdbGUkVabtpbFJHRWK9R9B6VCMHAnwA0WmnXnzL7HtedyTzOIb0dY8aVdCkyKK+pwp
	WyauhyJPJAxSBUp64rvnSa1W8zW2zp2YlK1YQ23f3NSMbVbVnwQMjaTT3voBfXVSnBF2igN4qvy
	qL4J7ZZ7PKzbwnXC3VsliGa+ByWNvWQ/qshhOJUU4dZksbqUH+AsN+tnTUk9x7jSyu9OtRFDzOI
	rxF9PkVuU2nUhwAvMYD08QPbdtEtyyvxQb5FGBtuy2a0V/EibRs2v6H7wUj3oyAlWBPOMftYmQV
	gdxx802hMVNAdjk3f8pZ1kEOazKYCZfy7rxucemgcObzskXk+TDU7ydQ3ZDTHAmPf9tF6fQc=
X-Google-Smtp-Source: AGHT+IGlNgZqMzMUeyWdr3GjHyIK7XYOFyI6yiuXPQ3nSeXzvDl9tt2rHtDkm90kEgAC23venGfYAg==
X-Received: by 2002:a05:6512:3c82:b0:55b:8038:ffb9 with SMTP id 2adb3069b0e04-55e0d502211mr83735e87.2.1755730010285;
        Wed, 20 Aug 2025 15:46:50 -0700 (PDT)
Received: from thyme.local (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3ccdfesm2841413e87.91.2025.08.20.15.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 15:46:49 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: media: i2c: Add OmniVision OG0VE1B camera sensor
Date: Thu, 21 Aug 2025 01:46:45 +0300
Message-ID: <20250820224646.130270-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250820224646.130270-1-vladimir.zapolskiy@linaro.org>
References: <20250820224646.130270-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings documentation for OmniVision OG0VE1B camera
sensor.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../bindings/media/i2c/ovti,og0ve1b.yaml      | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
new file mode 100644
index 000000000000..692b06472ea4
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


