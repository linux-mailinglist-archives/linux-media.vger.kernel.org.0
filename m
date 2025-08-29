Return-Path: <linux-media+bounces-41338-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2283BB3BE5C
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 16:46:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6216170A1C
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 14:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17A57322A3B;
	Fri, 29 Aug 2025 14:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uVUiUrw4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AC5322A09
	for <linux-media@vger.kernel.org>; Fri, 29 Aug 2025 14:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478561; cv=none; b=fdZ5KjyKZvAF387uzhrGraUELDNpwZFvF+BJH5iCbot4fjqgSc4w64O5LlwelHGvmEktvEKNgwAFzz62prZO7zLruGPBXqpOSjKx6IwPGNG6mQxHGw8TvgEn+O+Xn4K+wm1V/9UB6oXjfBGp39iLapJXGOnuOgFJ6Y01kfjkwec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478561; c=relaxed/simple;
	bh=sNBRAIxNbZdgsi8xFjgbHnb3yy6AaM1inQVtnrPDCWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KRmjcVIBoBYlyb6f0AQr7jzBltQnpHl8rphCVOTa3tFINVI9I8oNTRYjmWofVou59maVpC8md2XL5wJnV2K52fm43Veh60+XxdHuU7ExpJojcRSk6FFcAEfhLE+iO+k7bXA1TfD5e9wyhy8kX+gFZMHqqDsZbEwsX1sfPWvKpy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uVUiUrw4; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55f6b6301d2so72422e87.0
        for <linux-media@vger.kernel.org>; Fri, 29 Aug 2025 07:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756478557; x=1757083357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=se0PWCm1baVudHXLG+SyQGqop52+Sqr2SWWwd4AQrdw=;
        b=uVUiUrw4Xj1hCnG5QHGo8X4lZD+DSUhRlQPhcNACdxKMdZoWXdTZkpGPs8W+zPQIcm
         8g/xGBkC3BfiBb9SCECXE760/sqoRjcSF/k4HoIA/+8Y3kf8QB6QjNvoVz9YyS0T4Y4S
         CnOFjTrsz13m4BVWSqxoxDHGOuNZNVKbfgp3sGraldf3ccOYBNfP3Lu/HtKyhyd1CVJh
         dGgnMppsFAEfMTc/16MxIUp92Rn9QdGQxwuFntvjf6bsXdhu+EBPDFCkkfnuVC3qU81p
         lKhrW/8O0dDoqXX/zgcqmka/khdHM/whIZ9HiSbVI+DlO+qMSStu2xJVJpRmiZ+z8gLo
         bqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756478557; x=1757083357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=se0PWCm1baVudHXLG+SyQGqop52+Sqr2SWWwd4AQrdw=;
        b=qawdo1NQ5Umv4eB81LZbxY8gS69Il1MBoCMTDozKtyMDs5YzdR3RvbBG2wq4GmnqEF
         FatybCDsA9/3EXBehaeHqjVdI+nT6fqaHM0VpZ6RMd/kENyrV3ZtsHk5B0m/OoiVf1qR
         LfSV8Tlvx3zoBaqRfMtoxqpSLNho2X5OE145RoY5v55TvZY4y/tZOFjGP01KqBqiL23d
         i/L06HS7WuuRvIDXc6L9d7UmIF2tpBhKpvJGryO0wgTJUaEUfwP161hCGYOxX+BBbBa2
         y4vkTPNGUo1cN8jhL8udlAEdcxXWMIF/kuB70oiDV4NqXutNdEezY7KdxuPUQAJGAKlz
         e4IA==
X-Forwarded-Encrypted: i=1; AJvYcCXEapDhI3sRi8HXdC//SMESS8vr1+Dc8cjvPyF77helIe3UWPtRp2mO0gjcni4rBJ4+m07Y6jfrHwAoIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyR2q0MXomUCBC80gIIUe/+AlNoNvxFG7GIrk4OuNs51Sqm25gb
	GeYxwx1E3s6HMEU+wNtj8pZuLo3PnI9qFHQUxglBByOqYPSOAvEqiCtKlMfGBizBMgA=
X-Gm-Gg: ASbGncvFfaOEOOJxq1cRmmNaJXbgx17lsioUfK/AEwoSQni2wNDdo0hfV0gKNmBadi+
	CRLAsOyvA51wFt+VsLRmNtpF+GoEdVhm9HmhProLLOvraatsmL1eCdQuaK6N5vWC+uoC3+QjEfR
	g21F7JPLlWo5W4U4YFppYjCuxS8Nzdaq9jdNFdJbZfNEGf1VYdgOtct0H/EBGJWD8/kZb9sTFTT
	dJlMqPYWOlbKAW9T6bEy7bI4ZKg6fKlwHofyLOgZNEERNujTukJiTjoK6iCs33hg7EykpyryVD/
	b330zpOZo+H5VXhfXLoWhwUqc06TkoooLmNA0grt/u8L1dk9o2VRpN4z5kQIWmqOi/sF8W6nQqT
	gDx84v8Xlvss6NmUqENxLrXym6BBqZF2uLMmlhK8I7x9WZKryc/BCxGgs0Hi7GyGTQ8PlZTc=
X-Google-Smtp-Source: AGHT+IGGhGEuYb00NZbTBQMaSqX9j8TVeMHhp8tNShFY3jRCAuL/woaE/NZnmDD6aupoZ3Aqe57UFQ==
X-Received: by 2002:a05:6512:3b22:b0:55f:4bf6:efe5 with SMTP id 2adb3069b0e04-55f6b1dba0bmr283724e87.8.1756478557443;
        Fri, 29 Aug 2025 07:42:37 -0700 (PDT)
Received: from thyme.local (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f678452e1sm677644e87.85.2025.08.29.07.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 07:42:37 -0700 (PDT)
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
Subject: [PATCH v5 1/2] dt-bindings: media: i2c: Add OmniVision OV6211 image sensor
Date: Fri, 29 Aug 2025 17:42:31 +0300
Message-ID: <20250829144232.236709-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250829144232.236709-1-vladimir.zapolskiy@linaro.org>
References: <20250829144232.236709-1-vladimir.zapolskiy@linaro.org>
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


