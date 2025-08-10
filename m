Return-Path: <linux-media+bounces-39364-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 077B4B1FC98
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 00:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E88DE189502D
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 22:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F6F2BD59C;
	Sun, 10 Aug 2025 22:10:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3E0262FE7;
	Sun, 10 Aug 2025 22:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754863813; cv=none; b=qLj6CEwIJkmTDXVYP8K6rZwP2agxVpuV5JbCE7llIicyhdqUDztQmSOKnmrUo0S5L6TWMNYxIdDQNaT7IXjbRJwGiqk18gjT5lVcphfMNXKvZ63JdYMHqMarQqPiTO3Xe1LjN8Wr9xe4OYWL0onv7UurqDpu0be/dBCZrs7szT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754863813; c=relaxed/simple;
	bh=LHPFferjbDH9T0kN0a6xyFMEkYkvwnWXhtJdQjKXzyM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tg43VmQvvhbdd2AXFTeGeCkUq2a8Gl2CwvX9VqEqW4ojgjcV9p3iDzQeAAEIQBuBYaWnc3aseudPj3ljNJcQZXyFviFLVlEMoP4CHaJUWQQrWK+5T98Pt3vhNJnHLzM2iOMEj8b95Xm5mLhiT7/Kj0jqFcDLE2VTBVEK9wcstO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-31efc10bb03so3125910a91.0;
        Sun, 10 Aug 2025 15:10:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754863811; x=1755468611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+k5QpSf7/m1CpBtqnc0T1oblUwlFDKuqZ/ZF6inHpI=;
        b=SiqpF2yOE5R2u1mjLuibRTw84JAzo2q4wirrWvI1BN8vZQWMrs7TtKuljV5NiFOMhf
         b9a0GE0xlc+tUZJXEPywCJKLE+qJGFMNF7HXVLk2Pam/CfVCRI0qIjyWWMXnKGs/j8kC
         PJitwc6nCpXPsUELykzdvQFHfes1SBsM14C14Nc6iHPAwq9GMyHHa7eSJ65UMAy9YaAX
         fuTcgnRAhwAs6AWxh8VXRgG/KNW6ZVbl0sJwLc4soyrrzH+X45vVpAV65CjJmlmd+RHt
         iB3w+g3BfaV1tzJtyOJx7y/5y1QHEEQq0cweWtPN/wNENJDwPGX1eYm3zgT9QWEE4T24
         T/5w==
X-Forwarded-Encrypted: i=1; AJvYcCVPwv/JYFP7SPcvFY8M6vsJ6DMdCJFN0sqFOSRqM754qIkRCJH8v0pj+0NmOmn1x01t6omK5Hv9XSt4@vger.kernel.org, AJvYcCXvR4wV7GccjhrAXev6LyYFKHn0ze8qp5dCItafZT9rDg4UOFnOHJJs/pakdtl4xGUC26Mtone6YsTerRBn@vger.kernel.org
X-Gm-Message-State: AOJu0YypKgJbYwt7q3vjj3L76o1JGyo1E+vLiyHQNqiSyvG+7nW00z3p
	eeW9RfBK71G465TrAJyB5T0DnPgjUrb5yNGMCxnF45PNuPDdRqRc4hp5isG1IDfG+Eg=
X-Gm-Gg: ASbGncvMtAz+A12RIy+LmAoiph/Ma/8Y80Bl41sW9RK7Bfu4XLR9KptbnzKmTwKD3x8
	DgJqG0N5l4boOcKvsz4wZvQIJpnIvk8O1ymw4sbC9ZvYMJ4OzExjjCrs4hAfbgK6bLSSBRGVFlS
	3+A28IdzgHpqNj4WK6Iz0jlhe5OuoCn5wJIhD3DnKl2yJcZz/rg+4tDbwiAwhdVmKYRWWZr0Mur
	vkkaH2Dw3/oaLFHiB+M41OfRHt/JMUlV4sl0UhVi7cw01XVKmbQ8o/NBpqppK0nuRdMDwG7+05e
	cUmeA9HXe5d1sDyMUin2Q0J/YTRYFpZ2wscDHiE1TItoDpBVk2MF+bsXevSjdvw5lU+CWSzOsZY
	4ETYwQWfDNKlznn4GUHSoR22NodfeoTELWQ3IJGIFIKFCgIonVBj6LpVE8bcVnmXotzM=
X-Google-Smtp-Source: AGHT+IGVl8CJiFWkklO6I5zI6wCxzAAtwQhz9tZ2vrCBq6WZrDk7LnhtS7MG6Mvb11mL11vcwI6Hpw==
X-Received: by 2002:a17:90b:2890:b0:321:38e0:d591 with SMTP id 98e67ed59e1d1-32183b3a218mr18565757a91.17.1754863810932;
        Sun, 10 Aug 2025 15:10:10 -0700 (PDT)
Received: from localhost.localdomain (c-24-4-34-163.hsd1.ca.comcast.net. [24.4.34.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321611d6eeesm13150118a91.6.2025.08.10.15.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:10:10 -0700 (PDT)
From: Will Whang <will@willwhang.com>
To: Will Whang <will@willwhang.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/4] dt-bindings: media: Add Sony IMX585 CMOS image sensor
Date: Sun, 10 Aug 2025 23:09:18 +0100
Message-Id: <20250810220921.14307-2-will@willwhang.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250810220921.14307-1-will@willwhang.com>
References: <20250810220921.14307-1-will@willwhang.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document the devicetree binding for the Sony IMX585.  The schema
covers the CSI-2 data-lanes, the optional 'mono-mode' flag,
and the internal-sync properties used by the driver.

Signed-off-by: Will Whang <will@willwhang.com>
---
 .../bindings/media/i2c/sony,imx585.yaml       | 116 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 122 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
new file mode 100644
index 000000000..020b7cfb9
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
@@ -0,0 +1,116 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx585.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX585 CMOS image sensor
+
+maintainers:
+  - Will Whang <will@willwhang.com>
+
+description:
+  IMX585 sensor is a Sony CMOS sensor with 4K and FHD outputs.
+
+properties:
+  compatible:
+    enum:
+      - sony,imx585
+      - sony,imx585-mono
+
+  reg:
+    maxItems: 1
+
+  assigned-clocks: true
+  assigned-clock-parents: true
+  assigned-clock-rates: true
+
+  clocks:
+    description: Clock frequency 74.25MHz, 37.125MHz, 72MHz, 27MHz, 24MHz
+    maxItems: 1
+
+  vana-supply:
+    description: Analog power supply (3.3V)
+
+  vddl-supply:
+    description: Interface power supply (1.8V)
+
+  vdig-supply:
+    description: Digital power supply (1.1V)
+
+  reset-gpios:
+    description: Sensor reset (XCLR) GPIO
+    maxItems: 1
+
+  sony,sync-mode:
+    description: |
+      Select the synchronisation mode of the sensor
+        0 – internal sync, leader (default)
+        1 – internal sync, follower
+        2 – external sync
+    $ref: /schemas/types.yaml#/definitions/uint8
+    enum: [ 0, 1, 2 ]
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
+            oneOf:
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
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        imx585@1a {
+            compatible = "sony,imx585";
+            reg = <0x1a>;
+            clocks = <&imx585_clk>;
+
+            assigned-clocks = <&imx585_clk>;
+            assigned-clock-rates = <24000000>;
+
+            vana-supply = <&camera_vadd_3v3>;
+            vdig-supply = <&camera_vdd1_1v8>;
+            vddl-supply = <&camera_vdd2_1v1>;
+
+            port {
+                imx585: endpoint {
+                    remote-endpoint = <&cam>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <720000000>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 24c557ee0..ef04ee4ec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23178,6 +23178,12 @@ T:	git git://linuxtv.org/media.git
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
 F:	drivers/media/i2c/imx415.c
 
+SONY IMX585 SENSOR DRIVER
+M:	Will Whang <will@willwhang.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
+
 SONY MEMORYSTICK SUBSYSTEM
 M:	Maxim Levitsky <maximlevitsky@gmail.com>
 M:	Alex Dubov <oakad@yahoo.com>
-- 
2.39.5


