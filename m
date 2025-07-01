Return-Path: <linux-media+bounces-36445-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4718FAEFDC9
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 17:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECFD31C075A5
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 15:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F28E51DE2A5;
	Tue,  1 Jul 2025 15:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FzpqeED0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980A1140E34;
	Tue,  1 Jul 2025 15:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751382770; cv=none; b=S8mjuGpKFuHC4flqJQgWEaVaQXVp13jw04YfQESFikYQiFCUhX+PR421Yv/sYkCVmIzu2xVJDfRMpitfkscPrFea9Oh1Bsoz6wu2dFbxJCY3icFPaoFc6+6+oH++92Y4ivNkVV0fuCOkpMhtPx2Rhcjm+Zi5Ym8FzhoXG9r/q0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751382770; c=relaxed/simple;
	bh=I/eyMyp2LA66gaDF/UqkR0xIbTzn1d9pzMij5T97teI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IowGtYaFT9eoYy/reesezk++6WZfsDY88T2S71zBWcfiS+5lGU5RsW2/gmjPnCAOyqXxN8T95yPOHAJ2gBDegwlYEDZ9hnwxweVhvwXl8RF6U79zLLs7MBxoxeb1CN+GLZ/MTtJ3eS3rjucgALnh7j7d0Kwy+Iv2RvJPBe3YXpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FzpqeED0; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4537edf2c3cso57783965e9.3;
        Tue, 01 Jul 2025 08:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751382767; x=1751987567; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cbLR7rFkQ+qcnaBt6K4n98zS7vbhXqcvI5uhIsLvqZ0=;
        b=FzpqeED0sBHQW8AM1solfjmTav5eO5jUXSusEdEaidRx1kD9Iz5kxQZIn4eKfGYKdo
         IqTdDUzYGD4FrbOal2gvT2Uf/Ivok9sTVMkcBU3Cfs3qqAt0huuuY1czfdEXZmoumme5
         6X8FC+u1mhu4SAaE8tztHyB8Ov92kbjsBZsS60gFf/FdaSaGFeqNPVlRc7nZYJdaZ00e
         RsXNgVaWrTJpY9Jisqsu6V0xoLg9n7tVSZkkvqFdshIhuKra5HipIrv/VyncGzOBmguz
         WZkP/mT7QxVy1AU2gG3F2to0CVRTVNqCE8nCCs4bkwsjtE0+Wg/5EqSgymwNNvCRkpF5
         hHmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751382767; x=1751987567;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cbLR7rFkQ+qcnaBt6K4n98zS7vbhXqcvI5uhIsLvqZ0=;
        b=ZKWc3Ct0mEhXFTzjWHAT/ZV1kryoDzMWP0RtY39+t+rreBoNHvU4do5caJLKTqne5H
         YRK2+oSX4duYBWc5BpCjPjrhc4oEGQrUzPdZ8hVc0hHEGWGdqhROdFUkOzZ9AUsgDeo2
         PDHLzZkeJOr3a7KIDlyrQdY3GoarP7jPPPSxirO/QnHkoc/kbfwhMNQUHpRu237BvDLl
         J6fm7XKVrCH1LkK1P6pR5G9/67w0VLumc4OkRd9dFMsv6dbC8+E/FKVuwxnB8vF1eI+y
         DWO23jH2jLHgIuou6N8loDfgVkgb8QqJ9gDpGtGCzBrZ9OpuFz8s5cZ6+ei5x7lm/qfH
         kCzg==
X-Forwarded-Encrypted: i=1; AJvYcCU1K9/eg8jcNgeQyH+srFY9gldd0HLf5UT6VSXxkwmOvf3ZYWU/7uLB2AauyONufGtWLItCL73f4fA1u/E+@vger.kernel.org, AJvYcCXVJFoEp31AmmFLjiZJpatW5ougjDpUJc67wFRsA00BortpiMHzs0466RW6B9DRWPxYqOhgbBkLMFjx@vger.kernel.org
X-Gm-Message-State: AOJu0YzlDR5ETAt1ghDQf23U6TmcYRz+ZAs84UCUXKHxDio47zkUPDP2
	RsCO+xSGePLIfkgYbL5eiY9w00WG1S+J7Gl28sLMAiCN4ljnYMwWj5/F
X-Gm-Gg: ASbGncspIcx/xWKykwz6l6xZbePhyi/CynxzdeP6vRPDu1XdN1sSNPZYo9gPEwMDgBj
	pUdiHQceijYEuCMjfzVdv522RVaGgNUj82alh5NsPq6UEWUwJhGGIA3uSOS6FKG83QTW0DluvEa
	wnNoAY1TjD/rBhED/7BzP2KiLVqemIyzfL26NSyEf7LA4E62MZPHpQKkwuruhm0vDsUgffZmfNZ
	wCwmJo1Q2vBKNcK5Cs0h+VMGJ0xgiKhHkM/akTsj8uRPs+tRIivMQPZy02tUbTUkIeNryVZS5HN
	9vRlZZZSshLVS+hbhUlxw2PFYAVMj1pXJC+5M5Cr29LPfQ6ulUgVpUccs5bQeNLxlc2a5cwqs7s
	24Nt3ObjaWZqQinI2ktSf0AlfB5q/KNznMkhMn8T+ySxet24Fow==
X-Google-Smtp-Source: AGHT+IGDPPH3Bm9ETTAiYlboexkctAvFgaNBjqjRhr6XsMTjyoOUulhWaS3zHPavXfwNeSlXUjzVKQ==
X-Received: by 2002:a05:600c:1910:b0:43c:ec0a:ddfd with SMTP id 5b1f17b1804b1-4538ee15b9cmr172626355e9.6.1751382766460;
        Tue, 01 Jul 2025 08:12:46 -0700 (PDT)
Received: from raspberrypi (243.79-78-194.adsl-static.isp.belgacom.be. [194.78.79.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7facf9sm13411659f8f.22.2025.07.01.08.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 08:12:45 -0700 (PDT)
Date: Tue, 1 Jul 2025 17:12:44 +0200
From: philippe baetens <philippebaetens@gmail.com>
To: mchehab@kernel.org, philippebaetens@gmail.com, robh@kernel.org,
	conor+dt@kernel.org, krzk+dt@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] Add bindings for ams Mira220 cmos image sensor
Message-ID: <aGP67H5_GxL4z2Nc@raspberrypi>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Mira220 is a global shutter NIR-enhanced image sensor made by AMS.
Driver is submitted in the next patch of this series and verified on a raspberry pi.

Signed-off-by: philippe baetens <philippebaetens@gmail.com>
---
Changes in v3:
	 - Improve commit message
	 - add mailing list for device tree.

Changes in v2:
	 - add maintainers and Documentation.yaml

---
 .../bindings/media/i2c/ams,mira220.yaml       | 125 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 131 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml b/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
new file mode 100644
index 000000000..21a55ff07
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
@@ -0,0 +1,125 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ams,mira220.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ams 2.2 MP NIR enhanced global shutter image sensor
+
+maintainers:
+  - Philippe Baetens <philippebaetens@gmail.com>
+
+description: |-
+  2.2 MP NIR enhanced global shutter image sensor designed for 2D and 3D
+  consumer and industrial machine vision applications.
+  Due to its small size, configurability and high sensitivity both
+  in visual as well as NIR, the Mira220 is well suited for 2D and
+  3D applications, which include Active Stereo Vision,
+  Structured Light Vision for Robotics and AR/VR.
+
+properties:
+  compatible:
+    const: ams,mira220
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    description: Input clock (38.4 MHz)
+    items:
+      - const: inck
+
+  vdig-supply:
+    description:
+      Digital I/O voltage supply, 1.35 volts
+
+  vana1-supply:
+    description:
+      Analog1 voltage supply, 2.8 volts
+
+  vana2-supply:
+    description:
+      Analog2 voltage supply, 1.8 volts
+
+  vddl-supply:
+    description:
+      Digital core voltage supply, 1.8 volts
+
+  reset-gpios:
+    description: Sensor reset (XCLR) GPIO
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    description: |
+      Video output port
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            anyOf:
+              - items:
+                  - const: 1
+                  - const: 2
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+
+          link-frequencies: true
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - vdig-supply
+  - vana-supply
+  - vddl-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mira220: camera-sensor@1a {
+            compatible = "ams,mira220";
+            reg = <0x54>;
+
+            clocks = <&cam1_clk>;
+            clock-names = "xclk";
+
+            vana-supply = <&cam1_reg>;	/* 2.5v */
+            vdig-supply = <&cam_dummy_reg>;	/* 1.8v */
+            vddl-supply = <&cam_dummy_reg>;	/* 1.35v */
+
+            port {
+                mira220_ep: endpoint {
+                    clock-lanes = <0>;
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64 <750000000>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index da34c7227..5cb93390f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1330,6 +1330,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/light/ams,as73211.yaml
 F:	drivers/iio/light/as73211.c
 
+AMS MIRA220 DRIVER
+M:	Philippe Baetens <philippebaetens@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
+F:	drivers/media/i2c/mira220.c
+
 AMT (Automatic Multicast Tunneling)
 M:	Taehee Yoo <ap420073@gmail.com>
 L:	netdev@vger.kernel.org
-- 
2.39.5


