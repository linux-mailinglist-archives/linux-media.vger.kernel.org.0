Return-Path: <linux-media+bounces-40491-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1C3B2E83F
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 00:46:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23356A07E82
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 22:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9B12D9795;
	Wed, 20 Aug 2025 22:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rm2yW1z3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1892D130B
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 22:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755729948; cv=none; b=Gfpl4khSQxB4sRPqi010VD5eOMdI9kqmf5JClqO1z1iU9jb6EtdkvBC4WqQPwLaufX1OHfLItRtyFDOvOiRUfakjoPyz3AmEbG/z0BUSlAEUcVs4HyhomsfIEEEqSBORgEz4HrlT+diHJR0Z/c7wcuMmS+Pyro3QroqNs/+kuZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755729948; c=relaxed/simple;
	bh=sNBRAIxNbZdgsi8xFjgbHnb3yy6AaM1inQVtnrPDCWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NXYgDmOj+yyMoEcsYAHvEFMZ6+zi7RoayT4qfJkMgTU2Vs2lfOEnEZDXSG2nDZycPhPxnVC1mqCv6LTrr6VnfGdjOaSA0rcw5yat8Lu65DHB5L/79Ldkpnztl0emxCwEbK3f6arI8H4zqD3sIUwAZA8VBfmdXsInHx7sWERicSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rm2yW1z3; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-333f914fb11so633321fa.2
        for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 15:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755729945; x=1756334745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=se0PWCm1baVudHXLG+SyQGqop52+Sqr2SWWwd4AQrdw=;
        b=Rm2yW1z3qgSeqrQrN2FVgqaBcsPj8iAykEPZ31euj4SAlOIbOuRLISvLPOWPPjQETg
         wYkotqtrIcbX8DDQnt032z++SmUuB2jXaltM8yPP+yijO14bdzKOO5qt+U9UE3Cj9GH/
         FbWIAXmGa5IBNeyGwfxPwwE5/S0QJiYgGpy+eT+J+9DlTQZxH4VtXHSUegQnqI2ME+5i
         kz5HhMjqZA4tvEb1nIPinS1CrZ35aRhOSBJifPnsBhlc5dOIF1mcpY4+Nyv7xwK8pmmd
         EeFUgyhFa4NInnVJo5EhlYqVW6ym8HpdKYhmwVmnBktny25giUinwcuZE/Kjm5zQ4KVx
         Sz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755729945; x=1756334745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=se0PWCm1baVudHXLG+SyQGqop52+Sqr2SWWwd4AQrdw=;
        b=Z/BAJDFgSVTwg0d0/YNTAv0uBjeN1/XmhG5a7Y/sQA9Cacxw6bsEzlr9QO2t2wyfl3
         zcyvMQNs5Eh8OlT+L672d0Pex7xQIgbOUbeU63FIkOoU7MG/KQtlSIaeozx50lLvgT/T
         bhKAmpJ5y3GEorWBoh7K53KUxfvkRYb8ADTQSJ0ZzDUN/ErauEno9Y19ghH95lkJnY1R
         1WcQ6ByMW8+yrT7nJmpKnUrsGmBRqXm4Q9VsKZnHg04XEY8t55vMyHyOHVJwqed907Nz
         lGXdB8jzjcgzwGj9SmShtyxVume3lhM3pbc7AXdN+r3Hn+4ulvUgcxJ+KLy6ev7MKF/O
         mdjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUckj24aGgXBxqEB+0ALciFR7v7gsfbgb5OZFcK85rKEugJrQSWGtT2lqStQ7l/dmN860wgJsLXveFcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDDSCUYyQ59nRwCB3wfKKIaj0+KdgFweGajV1EBqeK+OkYGmsd
	sXBPiYuUvRMKYF+//xffN44qW3bqvWpliwSiIgEI/cgxIo+vwwJ6ZzEeqZALRmaF8tU=
X-Gm-Gg: ASbGncuGJywT71RlIw/xMug7AuOHXLaOEEAi5FxBS8DvO7Qu8Xz1ovb5jdTItb4iMk6
	IHDUNgVUJ1SFSWH0kpdrbFoBR3l9Yw8Q1yOqQ6pvOp+eIPEF3JCiTtqwgmcu7fRwtRdTg+Y+FTN
	bI+9pgx5J6jV5UrLgknClwel4aFSoBYqwkM4cKmwWLzMnyzfMXcbqiutnCdyb+idd7ZLbF5zKtX
	UaVMX/3EyViB3niugGdyClvb79rD/Y87o+tydCETftFsaa866OAmqeykH3QCh5JEPSAQSp2RM3p
	Zjqu4dvoTZ9g6W+8uJD8viwkW66ECLVbEYgCz0s1kTRvg1zYZvpBam6ZFeUGm2RFfH4qqmU3KK/
	l+17xJqhQ/kpgV3ZY/tdgDA4+wnpAwDEU3nRZGPfeJz5nBvMmtOLwzHfCqm9SFxJMTTWjmAs=
X-Google-Smtp-Source: AGHT+IFgDPIFpyzrmp+0Jb+k1QadHKIi03Ioz0Op8MsWA7On+Cd7YdpCeJux7HH4fqU0ld4SEvZhJg==
X-Received: by 2002:a05:6512:128f:b0:55b:889d:8ddd with SMTP id 2adb3069b0e04-55e0d5c1647mr66802e87.10.1755729944931;
        Wed, 20 Aug 2025 15:45:44 -0700 (PDT)
Received: from thyme.local (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3ffcefsm2763048e87.136.2025.08.20.15.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 15:45:44 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: media: i2c: Add OmniVision OV6211 image sensor
Date: Thu, 21 Aug 2025 01:45:40 +0300
Message-ID: <20250820224541.130229-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250820224541.130229-1-vladimir.zapolskiy@linaro.org>
References: <20250820224541.130229-1-vladimir.zapolskiy@linaro.org>
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


