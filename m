Return-Path: <linux-media+bounces-46004-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEAEC1FE62
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 12:59:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01291188D008
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 11:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B458342CBB;
	Thu, 30 Oct 2025 11:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f4n+qQKb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD3A34217C
	for <linux-media@vger.kernel.org>; Thu, 30 Oct 2025 11:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761825509; cv=none; b=Rkwa1omfC2YOZymjjz7YV/tY1svDTcQLUh0Ns+aieN46yjgvQ+m6D5RF/7Bw5Z8NHTauoTnciaZedBiZofixnDJeQDPwGuL6BUvFF1c2tGPEhasx02S+8LFp1nCj6Y7wgjc35lklFaH1OXQ960ou+T4j1gKNEV5PTAu4YXnglK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761825509; c=relaxed/simple;
	bh=z8+/TiRnqkkKhbz/FE5y0ykIKcQoH6t739+vrrDNkVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=njXI1VffWeaPdAiDiGJOrYW3bWLczT1Yyk816/JeBeoAE3DfmRnGYmeZX8VjoOBNQoidd5X1MdC+dP3F9kyvf0k+Ib1kcZ838AVnohJVXt7YDrq3qS1uiWDzDEKyWUjGDzHEwqZg75y8UuAvYW8NoCo2jhHWJieEhIwoP1bGy3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f4n+qQKb; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b5a8184144dso150256166b.1
        for <linux-media@vger.kernel.org>; Thu, 30 Oct 2025 04:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761825506; x=1762430306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LgqDr2FdByIC3kvKF2/wW7lARGVAOjJzTLXp8RXcVms=;
        b=f4n+qQKbUdgruadyC9rsrpYIT8MzHOEfRUbY99gNBF9cObAMO+IB+IuGaT9Rs5vsgY
         nDxFf/4XIoh5pZ/zhqoMlLW/905qrxTLYqfOiztRBrWDiwy2bMWQV/kMDXZ8bV0llv7C
         ElM3T0q1KpCj2xbYpkWLUubHzFkfy2WnsfJaAzfZODVYfIErgQvYqb0uHu6iXdM9rbaO
         AGnMDuMNZSNexAwophPhQtudTm/EQ3LIDgyt+TEyP9HXreTR8aKAjC5ph3lCPaLzQUKp
         R+OuO0IDPRq7xEdM29+hZzU/rq1lR0NwgpxN7ICZxEFwQ+AJCY4l/QlMaIqjxAcKR8Pe
         f7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761825506; x=1762430306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LgqDr2FdByIC3kvKF2/wW7lARGVAOjJzTLXp8RXcVms=;
        b=RZm7/AgGgev0qFEc6B04YiHio1IdE2pcpv5wrAzqNre1yRXNoqaUQmO01TnmW1r0M5
         vGM/ARMXYxhOd3BmUK24jMEVA60w2CRpNP+vq+lD9uu2cDpSfJJJ7LM00IjbkZR3vD+I
         irnaesvsqu+a4B0pKu+d/Nt8/5MVK+1V1XRktRORSyGxYsu9JYUFDYtNZtKnyVRyReU7
         e7ku1ztlUTsY0tUPWXNdurmCc41DBqD5N4FR7ZINPkC9SqGttVTxkYowWf+pEoRITCaT
         6Gl5KJPWyiH2h+ZxCvtUCCKxBPyoRSn5bL+Waxnkz3MIqlHYUPGBFfeQ+FxXraod4Ipy
         LyVQ==
X-Gm-Message-State: AOJu0Yw6fYrRbCOfejzRmgzX0K4fodnLxahPJCVcvCT29uLx868t6j9k
	VS/NC0XElYkagpUlQlEbl8rpeGsnCHnk6/U1A8FBpgEBrFrBFLnzQdi9
X-Gm-Gg: ASbGncvTCMDuSA4JRi/qCsgABqqiNovX/ihjJkvnqqI4iHGYhjCK4v/2Byh03V+OYQp
	Pp+hwr4HiL3j2lbJb+PQZFxO4jDeASiE6mt1oKvaIFKWu2Vui7KxAYqPPx1DVclmk9gxgQu7cuU
	jAYI763XGca24ZmYB4/oE0VLF12UqsJYsYdInbv477iNbMih87OU6SczxQYQi0qTEre3tyFEpy+
	6b3/XRLuv5Zup6ZcgBwaFxiTepSqrA3VFZxypTNo4diFJ7rVOee3NTmF1tqLnfqtnxgm+7FI+Nq
	KoflKJc+BasFQD/JU4V17EnJREHpCxmsVyHNcAP9nMlk3t1Gf3n55EykEZN+wSNttrGwBRX0r3Q
	qlXvHQxn+/lNlozZ1nM2/iQw5hPJOtH6umcFQI03ZpmQWB4VwPK+F19q1at7JUsjyZ84=
X-Google-Smtp-Source: AGHT+IEOsIqXvX4XMDlcUuqmCWZeHt5WzeFQ5I60zX1ZWFQCMUMZGW0CUcXNsPFzkeC/WIVGiRU9Hg==
X-Received: by 2002:a17:907:934c:b0:b3f:ccac:af47 with SMTP id a640c23a62f3a-b703d4f7d94mr691571366b.31.1761825505841;
        Thu, 30 Oct 2025 04:58:25 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85308c82sm1752564566b.5.2025.10.30.04.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 04:58:25 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: media: i2c: document Sony IMX111 CMOS sensor
Date: Thu, 30 Oct 2025 13:57:56 +0200
Message-ID: <20251030115757.33695-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251030115757.33695-1-clamor95@gmail.com>
References: <20251030115757.33695-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for Sony IMX111 CMOS Digital Image Sensor found in LG
Optimus 4X (P880) and Optimus Vu (P895) smartphones.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/media/i2c/sony,imx111.yaml       | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
new file mode 100644
index 000000000000..20f48d5e9b2d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx111.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX111 8MP CMOS Digital Image Sensor
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  IMX111 sensor is a Sony CMOS active pixel digital image sensor with an active
+  array size of 2464H x 3280V. It is programmable through I2C interface. Image
+  data is sent through MIPI CSI-2, through 1 or 2 lanes.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+  - $ref: /schemas/nvmem/nvmem-consumer.yaml#
+
+properties:
+  compatible:
+    const: sony,imx111
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: EXTCLK with possible frequency from 6 to 54 MHz
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  iovdd-supply:
+    description: Digital IO power supply (1.8V)
+
+  dvdd-supply:
+    description: Digital power supply (1.2V)
+
+  avdd-supply:
+    description: Analog power supply (2.7V)
+
+  port:
+    additionalProperties: false
+    $ref: /schemas/graph.yaml#/$defs/port-base
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/media/video-interfaces.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@10 {
+            compatible = "sony,imx111";
+            reg = <0x10>;
+
+            clocks = <&imx111_clk>;
+
+            iovdd-supply = <&camera_vddio_1v8>;
+            dvdd-supply = <&camera_vddd_1v2>;
+            avdd-supply = <&camera_vdda_2v7>;
+
+            orientation = <1>;
+            rotation = <90>;
+
+            nvmem = <&eeprom>;
+            flash-leds = <&led>;
+            lens-focus = <&vcm>;
+
+            reset-gpios = <&gpio 84 GPIO_ACTIVE_LOW>;
+
+            port {
+                imx111_output: endpoint {
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64 <542400000>;
+                    remote-endpoint = <&csi_input>;
+                };
+            };
+        };
+    };
+...
-- 
2.48.1


