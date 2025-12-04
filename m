Return-Path: <linux-media+bounces-48206-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF66CA24B9
	for <lists+linux-media@lfdr.de>; Thu, 04 Dec 2025 05:12:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D0263071F82
	for <lists+linux-media@lfdr.de>; Thu,  4 Dec 2025 04:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CA562FABF8;
	Thu,  4 Dec 2025 04:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yEUW6Z8Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB412F8BCB
	for <linux-media@vger.kernel.org>; Thu,  4 Dec 2025 04:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764821504; cv=none; b=qqlfmjicjYFQ2NV+GHQQf3ULI0L4jkdkwtAY465QbiyG99S8jrQDMKInSVt7unnw3F1hT3ZePTeOH0eHhGkie32VSm/tTeDIKOKq2M2t44zefTAQ2jmM1jwzDlXzSH/vCOoMxVk4hEHkcSUw/b+Xlo5tj4RzlnT5nHkPlPB4XNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764821504; c=relaxed/simple;
	bh=gIL+TWivA2uhLwER5Jpa28rIpzr3APwr/jS5t/hTjYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uQuZCliwGNQ5pB4MSK2IdwR7lzlfVUjokqe/yDc/nACfQZOYPWfSpi1BE3/osCM1N0AUX1S3pmPwyDYAbqqI9yXwcCsoxFuF74Ut1Jg/xe2q9xBll+zX4MGI8nVOcaYXAKy6OcGIrERjbTjoL/H2tA7ZLwmCONoBpUBwBQeid9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yEUW6Z8Q; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-37a5a3f6bc2so356751fa.1
        for <linux-media@vger.kernel.org>; Wed, 03 Dec 2025 20:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764821501; x=1765426301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVgleDBvljzUApGSA0PgZ43pPHCzyhi6os873tb65jQ=;
        b=yEUW6Z8QSzHc2xQUERdSQ0a0hVGmTAYR3DfRxoMmZyjgWNnOA/gMGS8aPc85OT5Syt
         7BMNhBBucHOtZ34qktl3a5hk6+hpvg1T/80fj74sSirFgqxuXsQrO7l0BUBLSi44rn6z
         FZoEV0tKeNa621dzoaWBENPKORPyBOSkmEl3Ckk3yhlpuwWMS+IrTDRy2bnlHbuii/jQ
         4U1yxQm5pOi1WJhzv6z8BPeJR7Nz2GyoeDVbOa6Ezpa+6iMvmPxH09QYXeCnS0PLSqBM
         ShIYL+cp3t9px/eICI8nMUA87yVZkK0EU5VHxFnQItTikL3xuWe1Km80uo5rtOL5oMGk
         keAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764821501; x=1765426301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eVgleDBvljzUApGSA0PgZ43pPHCzyhi6os873tb65jQ=;
        b=Wcy9p3LsCalI96Q9rLBxY5UU9vD1K/y7gQB/CQcP1OnQK1m+70CMSyqwP0h4/++hzW
         FM294kudHqsOlJBFABCfxH1MNUKoB6/jOlZp89PYbbnzDD0gZdE1N1obSdwmjFVv01xZ
         zQb6H1R60075IPqepU2/SlKBwgGJOkBXzY3PyHDAmrnJXRnQv4pyMVCplg9djR9Xd0j3
         UfQYmJRKF5WYGw2E24dyQQRxyC/vMf+4jvGget3GsMhiM+xmuh1wqi0bh3MLbis0oY3r
         729CGk5KWYVg+ywCNphHpL9S5XvFT8D9TVGPAaD0unSQ5xa6uGFa+HUYZ4TC9RlvfFcQ
         HZpg==
X-Forwarded-Encrypted: i=1; AJvYcCXCtKz/are+MOLDxNer92bpw6pFu8GK9wzUiI9AHBLCCAOtl0y3qmNt99dMnhmrc3bbL9LPXQ2q/QPNTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YytaVRjQsBIAH7VL65T2KuS6tWQo+BVhRGHIaJ72cstmh+CZ2JK
	ZITN5hcQYVppw0cavd0Vt96SvwobksQGcebgaiwjLpQ6WkSGtkSxvdLaXsH74Prtl3U=
X-Gm-Gg: ASbGncvJIRe5OEve520+V8Sl5ZSiYTFgx5yWS2u9WhBgt0QopW4iYMvSMAYP0bOtg/L
	BHXVgL21I2+ndjpRbH6+hit+juh6KfzGu0yqhmQcaR6wApicBvXWjvqI81ISlILyzBnt3wjbMRi
	09WbQH4VCM0Tf1FoATciZcVBGkppEeDUr5TZn7XP1E7kfwwTkOlIgCYBoefidhJsa3ZRLTxg7Ku
	1ieyZTJcrvUhHqc0qwYXC35Z/8ixm+nc1RUn1CQpYbJMO4Hdiepx/iSEwPOJZNPhT0c4a1DWGBS
	QEtldhLeZhjiSsrPh16JBr1jDFYMYI84s2fHz0OXPIUYS9dsu68Pc/h/u3ve+mL6SJjNKe8QCZI
	wi++27aAbeaDYu+xQIQvRE1XsBbH3iaLST1CspZcJjmzHJxi0ZQrbvKJKhV7BTCJOotsHanyJ0T
	s2ZMu5zEgAMMHrgHVvSi79791pirpKrUiHgd/96AobayOdN5B1rov7JA==
X-Google-Smtp-Source: AGHT+IGlnIJwZAQcLVQQdHlas/icM8wIh2nJGbhrjemj/PzUESEoTXNPETOzolXCzUIry1dsT/gZqQ==
X-Received: by 2002:a05:651c:210b:b0:37a:43ad:859c with SMTP id 38308e7fff4ca-37e66a5d675mr7600951fa.0.1764821500861;
        Wed, 03 Dec 2025 20:11:40 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e6feba575sm1984031fa.21.2025.12.03.20.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:11:39 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: media: i2c: Add Samsung S5KJN1 image sensor
Date: Thu,  4 Dec 2025 06:11:33 +0200
Message-ID: <20251204041134.131707-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251204041134.131707-1-vladimir.zapolskiy@linaro.org>
References: <20251204041134.131707-1-vladimir.zapolskiy@linaro.org>
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
 .../bindings/media/i2c/samsung,s5kjn1.yaml    | 103 ++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml
new file mode 100644
index 000000000000..8f368ae044b4
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml
@@ -0,0 +1,103 @@
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
+  per second, data output format is RAW10 transferred over 4-lane
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
+    description: Autofocus actuator voltage supply, 2.8-3.0 volts.
+
+  vdda-supply:
+    description: Analogue voltage supply, 2.8 volts.
+
+  vddd-supply:
+    description: Digital core voltage supply, 1.05 volts.
+
+  vddio-supply:
+    description: Digital I/O voltage supply, 1.8 volts.
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
+            items:
+              - const: 1
+              - const: 2
+              - const: 3
+              - const: 4
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
+              vdda-supply = <&vreg_2p8>;
+              vddd-supply = <&vreg_1p05>;
+              vddio-supply = <&vreg_1p8>;
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


