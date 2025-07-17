Return-Path: <linux-media+bounces-38008-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE36B08D34
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 14:40:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59F691C23101
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 021212D1F7E;
	Thu, 17 Jul 2025 12:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hs/4HcAK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975D42C3271
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 12:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752756009; cv=none; b=moZvIdJK/wj+uM6vEeoFN9YkhZVa8co9F33rX3uYwqDjBXIEd1WXsArLbksjjpiG4WtdWeP1mTr2vzEjUIOIHA2tikxw6PDArpzF1obBKOdRm2/AEr7NsyR9yUsl3dy0Ixt8d1KDwqagaswgOEocP8DJoQUQ7zVzcigmbt32k1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752756009; c=relaxed/simple;
	bh=iNcyV6f8QJhDFde6k2bHSrnKeQfUFrXm/xA266oY4fw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mIW0AeU4HE3ni5Jjf4ytKsuNe4TRTer+KfaF3kvXZqg4a28q8TIUGJl1FCBdN4WOwLvxuycbvvvh0nkOHSqNZSiL0bPaHTnEKrPedzvQ6LI9XgetSVChLKLW1y5q+iVOqyvEaE6wKJ4bK1txQlJDYrIntDGQcvFZzCNjNBnhJtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hs/4HcAK; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32b2f369031so775431fa.2
        for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 05:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752756004; x=1753360804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=veyGOvvYMjg6Y3VsI97vNOtI76vebSeLA+JieY8L0FY=;
        b=hs/4HcAKwvtnuTmBh4/NHkZKnl3+0P+72zIgFvx1z9w/oau76TXAW1jCMTDeV6P6BT
         YURtFc0I+T7lcd8BPXj/7l4bPZks1dAcR44WKhLz3+wIakxnda8tg16NHCXipH/whMmU
         L+oS8ip+TxzWAiUVpz2Ow1AsHGLIp8qusgKzi8Sax1ThtaRMMmZAaC6EpY/QJIm6hmE4
         FLy28wn9T+LroAOUSw/J5kjI26OsbMbNqrOz+VMFzi2+0m41hR/riClZCfx0zOIlu1RG
         PRneqbOey+ok2dk8CGHPmI5u4mHC8uC558e6nCHoUwTtmJQnO/UbID9TLhGoPwceL8kJ
         BDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752756004; x=1753360804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=veyGOvvYMjg6Y3VsI97vNOtI76vebSeLA+JieY8L0FY=;
        b=wDeDp0DVDl0cWmvkF93QoLhOzWHttc3yl6TFQ+cClBj5qhpklWNpptWKgQvbYnCYgs
         4ZgWqYqEEZRaFxbpk6PW1tg/5PJLelwEA83Hq2ANf0ZHzyZAWwoaV4kfR1Q6OCvk3t7Y
         iOFTKdQRs7hmVVnUKn3+DOi6jscN304zwW+lTS3f0nsTPSQg61F0TIiXCMgpFYT//YvE
         59H/8xCwUh+2ekNr+CvWcNa60YgzM6lul9o39tovV98EqLBxFP/H196ijK2Gvf/SEPIZ
         fwWgU/Dy9cI+u5Z37lab4EVfiKDCCEin4MgbvONYZ7l4ng8lc+r7a0uB8bE7941zs/EV
         Dzaw==
X-Gm-Message-State: AOJu0YxzI1EZUPujSz23/lt/qGM07ZQWWvkTPfkpxPf+I2U+xpcd5o/0
	Ztpp1QoYHPWNVqXJlEw3hMpA/vOpJmL/icDNCS2g2jGYiKqiunEgAaMPPNCwXtJxGNY=
X-Gm-Gg: ASbGncvVk99b9YOy4uhwXUtl+7ZXRIHSjW3BLsPz/AztY+FJIG5ot7Agk/vDJm/tNJy
	buLA4sItpXjjP/Vdbbb5E38hJh24BAGwfVQomv9rM0Q+bdNnqlDoPFDm6aXrXMmVcI4HuWQteDr
	dcfRTq6FwAFzq9xD58KNH4w8wKuRuOrFNie6arAzkHKDj76SEBOAOmYUWheKJuLsprnnH2jl7wu
	i6zlLDIfB5I0zDta/2PKdy8+5FGht0cttHl/wyOsXnLSBCqReeJyP08Ao3NaaZPB95jotH7WGtj
	11pHrEJgFtIUuzPpAlNf3DPJEJL/3Ni3KkploMS7KEwLkwwLKlvgJTwKeRUlBtnVqkT1fBg2dOK
	5/83yytNrrpxya5174Kr9tRrJFdJ+0q5LsmAT0WYp2vY475gPhW7zEcazL/KbMr+VqcIiPbKMbL
	OKgbS3pc/G
X-Google-Smtp-Source: AGHT+IEJV3SNb2vbOnmaE1rMX7I4DICsCPvaT2EF1G4U0v0KmDYj3ILlbUD36YawYoMfQlsDcPzJOw==
X-Received: by 2002:a05:651c:509:b0:32b:75f0:cfae with SMTP id 38308e7fff4ca-3308e36c4b8mr7861791fa.5.1752756004385;
        Thu, 17 Jul 2025 05:40:04 -0700 (PDT)
Received: from localhost.localdomain (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fab8ed701sm24624871fa.90.2025.07.17.05.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 05:40:04 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: media: i2c: Add OmniVision OV6211 image sensor
Date: Thu, 17 Jul 2025 15:40:00 +0300
Message-ID: <20250717124001.108486-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250717124001.108486-1-vladimir.zapolskiy@linaro.org>
References: <20250717124001.108486-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings documentation for OmniVision OV6211 image
sensor.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../bindings/media/i2c/ovti,ov6211.yaml       | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov6211.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov6211.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov6211.yaml
new file mode 100644
index 000000000000..cf00d350d972
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov6211.yaml
@@ -0,0 +1,100 @@
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
+    description: Digital I/O voltage supply, 1.7 to 3.0 volts.
+
+  dvdd-supply:
+    description: Digital core voltage supply, 1.2 volts.
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        additionalProperties: false
+
+        properties:
+          link-frequencies: true
+          remote-endpoint: true
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
+                      link-frequencies = /bits/ 64 <240000000>;
+                      remote-endpoint = <&mipi_csi2_ep>;
+                  };
+              };
+          };
+      };
+...
-- 
2.49.0


