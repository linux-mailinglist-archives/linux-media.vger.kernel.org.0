Return-Path: <linux-media+bounces-48111-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BD293C9DB35
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 05:03:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3DB6034AFA4
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 04:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C84C270EBA;
	Wed,  3 Dec 2025 04:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J5jdYb10"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40C626F476
	for <linux-media@vger.kernel.org>; Wed,  3 Dec 2025 04:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764734584; cv=none; b=uzGHPeO5+hNmHUTQD8+U1Tywy69N6MG/rTY4IUKftToIkDUdc4dqHwTnPC4R7GG4tqxYvrxS/diq2IvTz6ykvQKG24+4OrJE76abyjIGg6mxinaktOYQT3x3v7tDrTjrR56jokOQSSHeGyS4kCp3VPQkGepQtGHQqtQO1Z7IJPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764734584; c=relaxed/simple;
	bh=saWiG8xBbWrVikPvLcHvf4svNuw21bKNWGsW61HfF4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hn6yqnPxyHAWg8TVhtKWWChzHkCWNOVNSl3SkZAGdf+VOet9CCAMANZrJbzoMuYixe5XrzS7IONpZRVxSGyuC/mQ1RXyKBYzQLQZyYGzfGt8j3gJe7/iQEt5Zmha/nQJpvVLd6+TvOia7oU7L3aC7wbx/rH8Icn7UedV6EEZSdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J5jdYb10; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-596a55d3c0cso454897e87.2
        for <linux-media@vger.kernel.org>; Tue, 02 Dec 2025 20:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764734581; x=1765339381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYjS3XR8Me4P3FqI+QDyTGuqgkr9+a18DJhvBYko5Og=;
        b=J5jdYb10IX6zCyc8IfZ6WskcMYb4d3iGANeOdIiaDAMgXxkA4l4XJIDTI88Pg2Hh+U
         dllN//m5KNd2QHqS57/xRUrEiqMz/quaZz3NWULDBc9Se3vVOhHY19EoJ6ZlhRp30spf
         Ykpt1FxpsXPKDKikl9Hy9E1a+a/1jMD81hhKRoprmzrR5wWAVegouzg1Hp9jY7b2d1ww
         GEW+kjnYpyTpJxDYplfhSv0U0U5l6DfvbF7cJ7FpgIRrlolOtcBqQdZAOq/nKi2wTMy2
         3w/M24EGr02jZ1txtjEe5IEmEDaKoG5tQt8rxex4Q7iVmB5aWCzAr61BuKtQW+WyRXAa
         fE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764734581; x=1765339381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dYjS3XR8Me4P3FqI+QDyTGuqgkr9+a18DJhvBYko5Og=;
        b=btfJ5rYqHPnj+HXlnWfFS6ldDromLPO+MU3BuAJYSpeF1ozPwIL+WRzjqY+vssJRyS
         hs1phEQalq7jCMcenBNkofc6KFgcLXVZmwZkCAmtaxTRs/fj/weMHfk0js+k0KgcjQ2d
         PLvVvYXMZNmlPzQxR+hUSeLY3hgQIEquJjtZTmDTqHvqsiqyTSd0xqWJaInnmcNtLGVL
         cV1tzCL9SCzOKSoyFFLqhI5q0kvVWmZ3ppVLtY+oB1XRxCHQQzcYiyFL9qGSDNYkN7EP
         ZbgGEkYAVqmOh+/x1odn99RPIN6dGeRG2iCnZXP81ERDjvwWowgqDHyWTiCExeuF4Ip3
         Q1HQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8epQBUthEd19kij2y5h3gBR/WU/mXnkGIcmDXN67Qe1rF5N2u14RXAt0SvNva/ZjCgaOAqqfNMaoxOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWT3yZPbdruisZggfq3d4yay3kRy4PZ3jj2sglRRNNDSI04Stw
	qTYX1Ivjk1kyRak12JaiGjDSFzc9lliNHUEz0txhe4k5Pl6jRM0bUf10tWz7WMN6Fc8=
X-Gm-Gg: ASbGncvQHMHTWp0/BhFNdt6yJP2j3So7h6A9esLRzzvhmvMqaCvjL8+nt2aojOik6rF
	t0Trtxv8P6R4Tz/oxnHtyK7jLnwqh4FEsRMjstS+A6j4ntpgWqkRpRJKzx0cXerBgZNH0fyQldu
	RM6u0IMqaQs+/GQOTqvqEDfs1r05xCS8K1a6AAV2Dg2GjAZfX88xhT8jryK7LHs8h3uG+s4DiPb
	EU26mVrVyOnK8DYdK0lra5UksA2gCTNNy9D4cjXouu1OZ/RhVSxrNDPcCZniZiv0EQy4AyYRlth
	9aDzwM2BD0tTRaMSj5uOsRqfb5oZLWaFOx1q/TxFiq4hor37fDNOupgPaTFQ39D1I83J1wJ5X01
	F7GhWdjeDGjZbbeUPr//KRI7JxO2Eq5/e783prHdBzM2IPOyi+AMFFEsvXOxjiNfPy/muZB+e0q
	fXswMv1D6/2EGg3FNzRyXaUu4uHPQWHnsVb6FOUz+VkTsGE1DOzROXjg==
X-Google-Smtp-Source: AGHT+IFcfTM3kqM9LjvHHlSYO4A2jT/l8RAigc8DvbluGZOZhp8NJ+AXKJI58lTKG7cb4Quq1CSoLA==
X-Received: by 2002:ac2:4c49:0:b0:595:9161:f837 with SMTP id 2adb3069b0e04-597d4afbd47mr1375e87.4.1764734580981;
        Tue, 02 Dec 2025 20:03:00 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bf8b1082sm5210181e87.29.2025.12.02.20.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 20:02:59 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: media: i2c: Add Samsung S5K3M5 image sensor
Date: Wed,  3 Dec 2025 06:02:39 +0200
Message-ID: <20251203040241.71018-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251203040241.71018-1-vladimir.zapolskiy@linaro.org>
References: <20251203040241.71018-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings documentation for Samsung S5K3M5 image sensor.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../bindings/media/i2c/samsung,s5k3m5.yaml    | 103 ++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k3m5.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k3m5.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k3m5.yaml
new file mode 100644
index 000000000000..434f15f64bcd
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k3m5.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/samsung,s5k3m5.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5K3M5 Image Sensor
+
+description:
+  Samsung S5K3M5 (ISOCELL 3M5) image sensor is a 13MP image sensor.
+  The sensor is controlled over a serial camera control bus protocol,
+  the widest supported output image frame size is 4208x3120 at 30 frames
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
+    const: samsung,s5k3m5
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
+    description: Digital I/O voltage supply, 2.8 or 1.8 volts.
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
+          camera@10 {
+              compatible = "samsung,s5k3m5";
+              reg = <0x10>;
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
+                      link-frequencies = /bits/ 64 <602500000>;
+                      remote-endpoint = <&mipi_csi2_ep>;
+                  };
+              };
+          };
+      };
+...
-- 
2.49.0


