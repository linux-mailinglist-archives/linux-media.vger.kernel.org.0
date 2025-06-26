Return-Path: <linux-media+bounces-36044-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCD7AEA94B
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 00:00:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1782643AB7
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 22:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09B1F25C833;
	Thu, 26 Jun 2025 22:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cztn6vm0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7FD23B634
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 22:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750975229; cv=none; b=RcA6bnRZQgvjsBLEXzTgKOaIOnMEs2RcR4r0zPIk2NuHfg6pv4KV/iI6t7O0/eRDrKrPXUV8iL2vNqQHscUeJzVkRkId6MYjvwEkjtPhh4805PhoUZsV9o5i2eYSMgPs88uehDe+bYdoz2ECEunYggcbv6CnRZHhuYS+CT4ZRjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750975229; c=relaxed/simple;
	bh=uQFO2Q5APYbto0JRqwFFJEFUUCG7qxkvCkM2O1/vWDM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RfTXnsLXU3XMiwfRC6c8HkVTcDatK5ur90F2tGARnu1BK0m6Qh9vBYwSBnKCrNwZd2lRuEIYeGyvCu7xNk2KYybfSTsQRH6bgo/NOPs54SS85xOEoJ2GZDtS6YTByJ+zmzDCl1WQjfjMmAYztWLobzbqPHZcBMeweKjvnwZr+T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cztn6vm0; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso1466738f8f.3
        for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 15:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750975226; x=1751580026; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EGnmc59/DGolkaQWmiDZA8Sg5UHpDZJLBf8ExJQn7xo=;
        b=cztn6vm0WUrR76/df21VxdtQrciaPmnk5I2nkb7B2Wx98LNzGjKIZaY/mvjg1e5QEr
         UbJxmcXW1YEq0Qw72h3BUODYXpnbXMJhutUyZWRFyC3UWk1y1p76W6vLbu1JOqzH3qWs
         mM3+2AAZpJtRUvCTS93euL1fUjzxF+q7fgZMFPXh4o2ao6lqJPLcNe6AlT1RF5kl9h2R
         EYZQ9KHTw78c6fnmN561IyEAv0RLiuHsGOljyPUc81LP8SHjMxJIzms/GyCyu8MXYKMw
         2x2a09UEWOxGsDa42XRijDsHP2P57pVSuM2SQMaAhJDxW3mIw+0aNkkWOACXMjekFmST
         qo7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750975226; x=1751580026;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EGnmc59/DGolkaQWmiDZA8Sg5UHpDZJLBf8ExJQn7xo=;
        b=ZI6NKNwtKpa7KlhAwIa/kghk1BmTH4bwETujvzCi3c4lJqPDW2c/knswuGMo9x3djo
         gm13ZKGUMqGfUVK63Sf+PSzcldSsuVa/bEkLCyg097fuPSWDe8AH+Vr2LCo6lTU/raHZ
         h4gwnC3+zc3b870ySUDGgG+2DHStxaUNW/xcJz8hYNjZWgvcGdXVyi9P1dZ1ku3/UU4i
         Ksf+qz8K9WcypaL89E69yapdNMJ6Dw0b2S/0dj5BfsNR/qQJ8B68azx8OJRUp+2RBIya
         l7Mzau/LWd4b3/2N9NBNi+NvApQNDDsJ8ny5gXySE7xoc04Mq2MCzFUCpX1N+muUAsrG
         dRgQ==
X-Gm-Message-State: AOJu0YxfxJBIiY7WVXuFvFOSrUYnI1lPCE3oBfWXHCSzklc6aNJ+UyA/
	mZ5r4n6F+moooQ1b4BnkBu65m7uhH6b9mKOY9Nts545jmzbjZXkXWc8Yld8ybw==
X-Gm-Gg: ASbGncs9ppzWcpW3hD8B/gacSlRLf7N/Cm/7dgsJxbhf0yK5jzW7rBtvESJc/GDPyLn
	PIaI3qOx8wYqu7aez6tDF/6cobGWRxQxUGa6iIh0l6+7rASqotHW8e/681mlH6+2UPDExV3bcqr
	+zpkiHdTcPU04qZWtL4/2ruMfrIIv3JknyTdj0tqssSm7+9+/O1eBeUha009/SgVjYxF+4A5bI3
	zcBtnyTY7ZMNmGEbuYSX8kPEKGE/ovaa/Zae41tXqx9TBwU6mjoLguRNEyrCDpKFxNbloYBtbVd
	Cu2ewvVCrq/mlfQjrCYjsq4rNycmRevqEi7yhxqVlLfaZqqOmFiKXKO0kddsnmqX+96XkfLFiRU
	S0ujmWYvVKpQnrEFwXtwIEcsAr/uQkySJLcCyGnZBnMejmRmisQ==
X-Google-Smtp-Source: AGHT+IE2W6g8TBB31T51y7pNUhfGH0sI0ALLdxEoLAwzEz2T2rgghGtSQ8mK6tlSHykxSfhCPuaLGA==
X-Received: by 2002:a5d:4206:0:b0:3a5:3062:793a with SMTP id ffacd0b85a97d-3a917603e98mr809498f8f.33.1750975225347;
        Thu, 26 Jun 2025 15:00:25 -0700 (PDT)
Received: from raspberrypi (243.79-78-194.adsl-static.isp.belgacom.be. [194.78.79.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406879sm31614325e9.28.2025.06.26.15.00.24
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 15:00:24 -0700 (PDT)
Date: Fri, 27 Jun 2025 00:00:22 +0200
From: philippe baetens <philippebaetens@gmail.com>
To: linux-media@vger.kernel.org
Subject: [PATCH v2 2/2] add bindings for ams Mira220 cmos image sensor
Message-ID: <aF3C9o4bMcSqsPSO@raspberrypi>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

mira220 image sensor bindings
new in v2: add info to Maintainers file

Signed-off-by: philippe baetens <philippebaetens@gmail.com>
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
index a92290fff..272a97c45 100644
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


