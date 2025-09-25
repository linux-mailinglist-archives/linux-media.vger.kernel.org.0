Return-Path: <linux-media+bounces-43199-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A96CABA05E0
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 17:35:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B04C35E42D8
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 15:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 925052EB5AB;
	Thu, 25 Sep 2025 15:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxpxN4eJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091C12798ED
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 15:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758814102; cv=none; b=ZYBocOsc38A765DTZpOFYpFSwkGVzTEvNb4z671LemJYXz2o5PnEBy7R/W9F591BUMISyxIdqx7Mnluu44Noe9PaJL53eZ7VmYGmP+uBasQ9mC3Z5Qrr+gwKi/WYGusx10cm+uS5ujsqSd3Ng997z9/WeXEmm2DJwwcKjVkQCsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758814102; c=relaxed/simple;
	bh=RGJV+VuDp8KhpE/B0qdGxJZLvV3jaxtUrwVBEol2nZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GvusZ4s10hDZeeIQdstjEDVd2D02p17sOggr+vw4NM1gqmp2m28ql2nwhYcXwiinZ/SAj9AvOjqPuY2EldtICS6gd5cSba0uk+W3YlXzW4IHEh39y6as3nF9VNozjcGf9c6rl2sYtdpelMyQA/W6A1eOu5qik+fdFSZhGh0sr54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxpxN4eJ; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-33ca74c62acso10615451fa.1
        for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 08:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758814098; x=1759418898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hUIomtzjCx3KBPBBPMA+6d2UdIXffn0+Q71ellevLW4=;
        b=kxpxN4eJoX7R/bvSK3sVz/5YNJpKivr2Iu52MLKFKBZlqRHvFFcWSsx+oJxCmEprmU
         LZdXLafFclJRJlkCL6tZG7fIZU2cxy8VCtbL34Tf+H/ujswYNSo7mw3/8LufyQLvUMFy
         rgjxBtinzjUunftchQ3OBw3fJQGcrilHGeuscr0RiQQSDHX+R+UVJASOV7dfkoAfQ1j4
         eGYk5EEjCGv3LLvNIlCeN6n8IUW975nM5Tbr2cJAZLKd0t71kUaza5IRqyiCyq2p1JIc
         w3qvv8huyz5S0uas2Tx4ortRtsXOToRXGxzekX1X+M0c+Z4OBjFC9mA+9fjupoYoHcFG
         LujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758814098; x=1759418898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hUIomtzjCx3KBPBBPMA+6d2UdIXffn0+Q71ellevLW4=;
        b=xQZ9g4UVC/O1cGYHxyr1TOtRJ207YiP/+CDb0Le+4LhfqCqhOmuoj/u/2ohpmsFQjs
         c0X5yGc7/k+W1VPQ9JbKyoI/F5hPkJgf5ABGJundn8PBe6+zDYaM6mcAu5YhQs8Rjdwp
         Kk0B7B8BdtVLhFmmJz9t8hg9jYZggVIZYYqD7mLz0GJbPLt/Tb66n821QBQsE02VyJah
         hvIKq7ci+CHuULGPMwtNy48RemBvnnAiBzuj0EEmgyvs9+wdQ5Aj/1Dahf8PJNXU4xMB
         l+qIxwTWD4Byhy4MGw4MVAvzWrAB69aWVP05v6+ox4SC3qT4NTEywN86HErWXSgitQlv
         7g6Q==
X-Gm-Message-State: AOJu0YwObIsYToMhw996Q14lJ6g/0xVHUikYLqy89ze5S7HBZ4ypBdgp
	AZ8ounV6+3TxN329/W0GF4lh23uD2Tcg/yP5RZCenfA5YYMEDal2gubG
X-Gm-Gg: ASbGncscfKyXX6YtS+6Mp0qWX4dv/7FxxxAE2ywRSkFwmjGskj0qpgJin4PZ0PfXZ+n
	UI0BWyM19rNIgpd0gsNJp6JQDexss6MBbkbpxTEvZoEXvu06PiCZOcLbMAborXCY0iIcUgnkRt1
	srvXdFsxjdrg8bHUlKmXMIaGkr2W8jdVg7wxPgWVvWlGednn70v2M31fA3/kX6/eWbvTLHJhW9W
	+/gaR1V6IAwpjrmD9G0ouCLDBIv4qlca5DcPgOnGsc7xlsAORFjWhbuTI/DrA99/s3BqV1Apb4Y
	cGWa52eCIILuE8cVlIhNVU/NxI2rabH3GzFnJrKDRkYIZ+gHY1MdX50aV5aQIX14rE9NT38SaI6
	28aaGFKrPSBJtgA==
X-Google-Smtp-Source: AGHT+IEoEqJU4JkeL2G0GLtVlz2gmU2P4wTx+sejY3KjaFZKIk7VR3zgfr2eYJuJosIt+iijuFsc2g==
X-Received: by 2002:a05:651c:25ce:10b0:36c:5046:79b3 with SMTP id 38308e7fff4ca-36f8020c9f2mr8144351fa.41.1758814097978;
        Thu, 25 Sep 2025 08:28:17 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb4772c8asm6347801fa.4.2025.09.25.08.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:28:17 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Hans de Goede <hansg@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: media: i2c: document Sony IMX111 CMOS sensor
Date: Thu, 25 Sep 2025 18:28:05 +0300
Message-ID: <20250925152806.80386-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925152806.80386-1-clamor95@gmail.com>
References: <20250925152806.80386-1-clamor95@gmail.com>
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
 .../bindings/media/i2c/sony,imx111.yaml       | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
new file mode 100644
index 000000000000..a70017588891
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
@@ -0,0 +1,112 @@
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
+        properties:
+          data-lanes: true
+          bus-type: true
+          link-frequencies: true
+
+        required:
+          - data-lanes
+          - bus-type
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
+                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+                    link-frequencies = /bits/ 64 <271200000>;
+                    remote-endpoint = <&csi_input>;
+                };
+            };
+        };
+    };
+...
-- 
2.48.1


