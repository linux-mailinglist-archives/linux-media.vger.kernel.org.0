Return-Path: <linux-media+bounces-45330-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 016B9BFEF64
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 04:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 40E283507C9
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 02:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFAF522068B;
	Thu, 23 Oct 2025 02:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jd6GUXuy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A6E21E0BB
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 02:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761188047; cv=none; b=B029PzqNvbtKkm0mlfeET2Yv+DX+rcBrdesZ0kWgAFUonisTzpb6ELuosdIi2oHLiPrBt0wW8xA17WinEw2J6qr9cKgLQnywd/TkYm0QoXyrHg/ee9/FEJhOLrpGy+FGKRs0ewKGvnz7FyyQxzBxDv4zRaCgn5LidX3yqlR8CzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761188047; c=relaxed/simple;
	bh=DJQjEVoi53sXw4nFoyPKWd577cFyE08NRxA8lyvzhMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VNIKzlUyYWAXKIXIX4flyI5gDyhiNivvVjbGqNp6dsfOz56nJIEk02R8RdnKXgwNpxuRAXNCchoUWWIjAkAV0GJqPy0UHjrodEU9PAyL50mc9w5pFv+hqjuNK8NTyqOGmuI/VIJU0G+gXQ9hLbpRiFXwfs4Ys7FgZ+1Cgfc+ZKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jd6GUXuy; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-592f2c3fd89so49524e87.1
        for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 19:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761188043; x=1761792843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qdNNZle1lsq5bpeZ/5Z6CjKvJklp0yFJe0uf0LN199I=;
        b=Jd6GUXuyKn54zbUFPmFNuyzei+4nXxYEnjjuXCcUx3wfOGLtasqhUMCNnuHCSnRSDw
         CLmtGsHrUlu56E22NfobumJWjmXyTKKbC2rfuzzER3c7oBCjFYNVE6GAYVUY519DbWUV
         ghPxj4pfddcBaWRJwTVsMMuD2q99hso0kXIHGvJBZLjK5mX+PEfZax3RnCRugzSnif1i
         +Lp2tUEQejDEcrIPn5Pm69Ldn9J8v8wxfGx3GhYMFRRw3JJq5yx76ieIBP0QKTFgwmn5
         lo8siDFjlYyrlUKdIhbMbAp+1AJhyJ8y+p6652Rbja28bei+92nPlmeBAJsm7+AWDzZk
         GBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761188043; x=1761792843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qdNNZle1lsq5bpeZ/5Z6CjKvJklp0yFJe0uf0LN199I=;
        b=eF3LayrLHw+tI/PS55JQYcK3PK2xAfY83lG15CGZKOc9xFRAt6GyVI85B7/tubfyJn
         agPqHVxhmJTv1DUuoulxGasH8j5f5v15mJQTGuP9GYnPCGtRRP+sTx1VRko0joc31Q9o
         EZnVD9rPj+g8+y/ew6/4YdhSvHc9Jaa/UWSWFOcBRfr0McCkSNbhsCUIyiA6QI3+8aRr
         S4ub1T1cz15ytQFgbjE1TroVBSYgbDEZJ5TNQsdNUiwBfGftufhfCFP6aNVW00/INUSj
         IUetZdALvm+vDvRWPMHlVz915dbZyi75as31z8K3HiFXFWK6JFUOTMtnTN+QSTdt+F2V
         6jOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxn7e8uv1Z6u2zJZldttnEZK+pyqgXZnCevf429jyFJoi+aF7IdhGwLpCRbTaQT9g0W9TCxqHz8KYKhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxImKMBHeEgnAg7qgPbb+yEyXkP7SdbPo1K3koBt3VeXr3qubWm
	cmPSIbOpJTb/VXUZUAJFq4fNJfZjft2Iwk7jSRD25yQ6AvTukwqiUzjv8tkI8vGTPHI=
X-Gm-Gg: ASbGnctnlPXXxKHqU8ibUZ3U4NoQ/5fPDReCgIxDB9nNTZZ7bVCy6gHE2bYG2whswsv
	xL0ehlrgNH6wwV2M6EPyNGGtjAJYGy/ps+H8ZdXjpqO+q4YZXrN6YpGKdv5MYyLBoe7IUaRC1fR
	lpgjDxWP2TdCKsHGalGUDc3XugZzauqrcoEmBa7bm3V7PR2TsFv5iiYLOeDwqeWeoAa9DkXdQDv
	IUG4XJbpjIdl5kvnWKcp61bJGy3kLeJZqrbodbEojIii7T1It/IaO2+WS0+blCkfcZhRU3clJM2
	CfZYJYYaDDE9fwXGX9ZnbJwO/0QrJkqGl/CRU83FF6vf3/uofszscmQbEtnw4R7xplmLu4RSjXZ
	cdDNuhDsk2v90a0pDuX6CG9vi8f+aC5kycNmU+H1fDYn9L9HKAY1TlJ2vz6TyFT67ZCAQmrdUSF
	R+1CGceujomKXsoKXqCWAW4PI5htPudBeOHHUPrO3njbvcltEqYJEULQ==
X-Google-Smtp-Source: AGHT+IFw0V9gjFQB9E47Mf59e7DDZshCunsn77D2npfvfHYV8ll6tYsiIZtwLFwbwtO+6NUd6G63yw==
X-Received: by 2002:a05:6512:224e:b0:591:c726:4f77 with SMTP id 2adb3069b0e04-591ea42aa44mr1657829e87.8.1761188043339;
        Wed, 22 Oct 2025 19:54:03 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-592f4d1f26bsm346957e87.77.2025.10.22.19.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 19:54:01 -0700 (PDT)
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
Subject: [PATCH v3 1/2] dt-bindings: media: i2c: Add Samsung S5KJN1 image sensor
Date: Thu, 23 Oct 2025 05:53:55 +0300
Message-ID: <20251023025356.2421327-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251023025356.2421327-1-vladimir.zapolskiy@linaro.org>
References: <20251023025356.2421327-1-vladimir.zapolskiy@linaro.org>
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
index 000000000000..f0cc0209b5f0
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


