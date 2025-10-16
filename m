Return-Path: <linux-media+bounces-44647-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A6092BE136E
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 04:04:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4A1594E50E8
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 02:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88ED92116E9;
	Thu, 16 Oct 2025 02:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y+Fw5Voz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2661EB1A4
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 02:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760580272; cv=none; b=DXfiUg1sjx1QeEg45YWCSaWqKjzQxG36U0zqqxFjoeizgdAiDH0WkWHbPG3xu6HdsbAHFO6wu8Ldq/e2rsKmvWnr5AwFATyH4j90wIDX2EFfpyWNCG48UXokQF0GG+cQXRmzwtE3pwzjRc+gRV4FEin9XGkeqy7KJSTdZ/8tgZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760580272; c=relaxed/simple;
	bh=PoZl5grWD/NQZ3HMbnHj4LX4d7+4nvcz+PlDzUUThCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X428SbS/H/nK3TQDkS7IWqHsh9WWdgTlAfPiYx5ve3SF/k/K8g1p7ar7Jq4jP4dzeJkz/8xD37DtNW+6ysROjsm4FmI9eP1nFA+opFqF/vx0aQYaNeP69m3logcYGb2qhRYHPY1OeFbQWmC6v4Qm8OQNf0MePRrC3v6DJ2q1Ygk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y+Fw5Voz; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-58af7f8b8b3so28790e87.1
        for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 19:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760580267; x=1761185067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tebtNfhgAB05GsDEYtuVI6Z+mVaFmi+5+oc7dw15j5Q=;
        b=y+Fw5VozOEiFOuPgKPBZ6wicZeyP2A8YXE1iC8E+XiQ37M4MbOlaZU3iCi/qwN7I4w
         KvAdM3zUj1YVS30pCHkOW+dIY49iiTJVDOKYcLpVuMC3dS6lGDB6zYWaMc9C6wAaAgH3
         /aAw2b0x5tA9aQn8kJzmYMQoLGkTKGEkbZTEKzHSSlpQX3h/B8+P2j0sWYbZnB/kjyw+
         fDU9VDDmsgvxyy8K8NMTssq3xzeICJPxFHIWCRK1U8ROzgkpbrF7pF76YaZ/Lypc/JgE
         Gogrv0mcUlbdPKIV/6p8svc5XAdzZvzZrkjPBY859Z7KofW0XohLPJqN2JFXNr/6po+3
         A2FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760580267; x=1761185067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tebtNfhgAB05GsDEYtuVI6Z+mVaFmi+5+oc7dw15j5Q=;
        b=P5QEhkzweUCqE+aB/wlNFpWiCQbtCsO0J/gIYDvsp+jJkORCHUNspoD6mnc9PwlYUR
         cyBy5rqVcaup6zgFbZzt3zUHgavSqFuzc66UVz+H/UmttxTbbVXRtRUZkWL4F5Gr2jPw
         PP0Oqo1aTIB3PAx1ZUpFOCzx/hB4B+pYuTTFTWB9wobtdLSZ20Psmawnuro2gQvIbn2e
         uIOuOWA5bpK29/M2b75Yvr4WAjEi39Gx7vZaOKpeVGvxSd7xjdZxVRpAmabHyqDOOIG/
         QIYZgmd1CqHCfhfEFtsOVcYQ1Su8fbpCsHT6kwqKBtIQyR37K8PeYTgFIGe5Vr0jC3o+
         WjXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCBWHZ6as+KjsqPSYg5GDiqYX21ZSEaXY25xn8BZ3HjOYCLuf7ajzdDO1HSzCSoETGahR91c6WVHxxPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9fKwQ7GtOBOkHJ5QP4XKTMUOs4YMAt7m88z6ie4RGzPnNEfWR
	t6bXIlg/4VjsXbjxJy+yrU+/4ANGuNLE0DytP6DOO1ajmwdY8sBV6h3jZo7MgkISKCY=
X-Gm-Gg: ASbGncuQdsZI9xxxxXcpQolKIGb56sbB5MaWw3CNu4CMFDs2aLK7TLjRma4UB+kbChP
	g6Mnc8RblXb5MfnMkk//cvsdpcBFQaVu8h2IV8NZKHwmrC2LRnnHgbTCTjKaXmbsCCTfcebYgmz
	vk73Yh2fk7ZfLdS/LNcnAxkO4OC0Tga2rBzKtlNeXY+p27PsrC/NQL8c1nXrEwaj+0jFYmIxPcE
	e4PcGT64fLvGm1biFGCtn7ov30uOS3kBP0TDWYgCUi6YbWR5AKcBv21ADSb1dzXskhEa9fry2xc
	5MJBRSSruB3qsk7BLHfPGK8L5NRF/MVTnKBFpTkSSsdl0VhnoEO8Nil3gckna96KqBtY396COKU
	FZ9dMBZHvbAWt+Sf23HysTCy6QYfT35DahSL73rUIIJh7N96HD+CV6wkzBBXA/ujvwETeAMvMXs
	ZKEenEYK3rVZxd0Wk4SODJq4EJEYiMRXast2b/m3n6RgWrFFk=
X-Google-Smtp-Source: AGHT+IHqfMl8gv1F8rsb4SStR8YvLqcKsNJa6UUQ2bSh0cOxqdo4nDlQ0B7TUka5LMWHCixYALln3A==
X-Received: by 2002:a05:6512:159b:b0:55f:5965:e4e5 with SMTP id 2adb3069b0e04-5906d8ed3f1mr5250959e87.6.1760580266879;
        Wed, 15 Oct 2025 19:04:26 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088563c98sm6703951e87.74.2025.10.15.19.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 19:04:26 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: media: i2c: Add Samsung S5KJN1 image sensor
Date: Thu, 16 Oct 2025 05:04:18 +0300
Message-ID: <20251016020419.2137290-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251016020419.2137290-1-vladimir.zapolskiy@linaro.org>
References: <20251016020419.2137290-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings documentation for Samsung S5KJN1 image sensor.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../bindings/media/i2c/samsung,s5kjn1.yaml    | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml
new file mode 100644
index 000000000000..2220b3e528d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/samsung,s5kjn1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5KJN1 Image Sensor
+
+description:
+  Samsung S5KJN1 (ISOCELL JN1) image sensor is a 50MP image sensor.
+  The sensor is controlled over a serial camera control bus protocol,
+  the widest supported output image frame size is 8160x6144 at 10 frames
+  per second rate, data output format is RAW10 transferred over 4-lane
+  MIPI D-PHY interface.
+
+maintainers:
+  - Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: samsung,s5kjn1
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: MCLK supply clock.
+    maxItems: 1
+
+  reset-gpios:
+    description: Active low GPIO connected to RESET pad of the sensor.
+    maxItems: 1
+
+  afvdd-supply:
+    description: Autofocus voltage supply, 2.8-3.0 volts.
+
+  avdd-supply:
+    description: Analogue voltage supply, 2.8 volts.
+
+  dovdd-supply:
+    description: Digital I/O voltage supply, 1.8 volts.
+
+  dvdd-supply:
+    description: Digital core voltage supply, 1.05 volts.
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
+          camera@56 {
+              compatible = "samsung,s5kjn1";
+              reg = <0x56>;
+              clocks = <&camera_mclk 0>;
+              assigned-clocks = <&camera_mclk 0>;
+              assigned-clock-rates = <24000000>;
+              reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+              avdd-supply = <&vreg_2p8>;
+              dovdd-supply = <&vreg_1p8>;
+              dvdd-supply = <&vreg_1p05>;
+
+              port {
+                  endpoint {
+                      link-frequencies = /bits/ 64 <700000000>;
+                      remote-endpoint = <&mipi_csi2_ep>;
+                  };
+              };
+          };
+      };
+...
-- 
2.49.0


