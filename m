Return-Path: <linux-media+bounces-25870-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4D6A2E640
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 09:21:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48FCA164156
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 08:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C7011C2317;
	Mon, 10 Feb 2025 08:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="ULPsU6ld"
X-Original-To: linux-media@vger.kernel.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDD51C07C4
	for <linux-media@vger.kernel.org>; Mon, 10 Feb 2025 08:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739175682; cv=none; b=pKzSKs4GYmdBmUMGoU/hnARLns8Z7oX2tUwNctVGQyZ+kyZ5O77yE5RTvd3n/mlOArxTU1uR92VzLWydfYLz9cfeQe3GieQlanBVepBNGy5OFfpkNIuZX1453cTW0XwwtKa9JjHE7qBleD+ZHc8d3y/GD/N+U2DGnMHYT4aOTK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739175682; c=relaxed/simple;
	bh=KhGb/9SxbyxpeT8+zSuAk9qCVcXcY7x2UfLZVXGxtc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LGFvhqvtJJkQOmDNDXm49qylMO/QbGDgQd9yZzzVjOXMEUY4T5Hp8o0SodP0g1p6tWh4yZeC9xzN2BsYwCoKO5MBGMHvtHcfruOljMbsWtzCj3QE85frVLjJwFGKOkMAYMmiHLwYFkpQDRzYoMCy6y7ICSW/vsLvBrljV31TZwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=ULPsU6ld; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1739175678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OB9aSO2g4DlrBMgHzU59SnbKaWT6bVOPaBsyKw9AqEM=;
	b=ULPsU6ldY03eiFXO+Vhcu8eecoZ22b3N6wLAKHvhTBDnQmdWsOBz1usZUUWGdbi4o0Z2BH
	5x7xRCvMaA+LjMcDpLOneSxZK2GjkIKEd3B5Lok51KBRWhcNvGLm+zom4OAQMTDPB5GFyM
	pQ1eD7t9MqcshEVOjhNmSORfyvLyQFyYqDwdmoSguH/HON7bt5REj2Hze26KVz9xbFmTxQ
	N0jS5TYwhSbRigM60eYkKMOzeKs3v6bM4hvY3VSxNs1HmYBt4ps54nDOUJ0nNvRfy6ktX/
	H88mPaKjhDRYECinL7PlM6yJcPDNKAnr1JcvupUxaEeePecWwveSTeSq11jjjw==
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Daniel Scally <djrscally@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] media: dt-bindings: i2c: add DW9719/DW9718S VCM binding
Date: Mon, 10 Feb 2025 05:19:16 -0300
Message-ID: <20250210082035.8670-2-val@packett.cool>
In-Reply-To: <20250210082035.8670-1-val@packett.cool>
References: <20250210082035.8670-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add DT bindings for the dw9719 voice coil motor driver, which is getting
devicetree compatibles added along with DW9718S support.

Also mention the binding file in the corresponding MAINTAINERS entry.

Signed-off-by: Val Packett <val@packett.cool>
---
 .../bindings/media/i2c/dongwoon,dw9719.yaml   | 110 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 111 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
new file mode 100644
index 000000000000..88161038223f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9719.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dongwoon Anatech DW9719 Voice Coil Motor (VCM) DAC
+
+maintainers:
+  - Daniel Scally <djrscally@gmail.com>
+
+description: |-
+  The Dongwoon DW9719/DW9718S is a single 10-bit digital-to-analog converter
+  with 100 mA output current sink capability, designed for linear control of
+  voice coil motors (VCM) in camera lenses. This chip provides a Smart Actuator
+  Control (SAC) mode intended for driving voice coil lenses in camera modules.
+
+properties:
+  compatible:
+    enum:
+      - dongwoon,dw9719
+      - dongwoon,dw9718s
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: VDD power supply
+
+  dongwoon,sac-mode:
+    description: |
+      Slew Rate Control mode to use: direct, LSC (Linear Slope Control) or
+      SAC1-SAC6 (Smart Actuator Control).
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0    # Direct mode
+      - 1    # LSC mode
+      - 2    # SAC1 mode (operation time# 0.32 x Tvib)
+      - 3    # SAC2 mode (operation time# 0.48 x Tvib)
+      - 4    # SAC3 mode (operation time# 0.72 x Tvib)
+      - 5    # SAC4 mode (operation time# 1.20 x Tvib)
+      - 6    # SAC5 mode (operation time# 1.64 x Tvib)
+      - 7    # SAC6 mode (operation time# 1.88 x Tvib)
+    default: 4
+
+  dongwoon,vcm-freq:
+    description:
+      The switching frequency for the voice coil motor.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: dongwoon,dw9718s
+    then:
+      properties:
+        dongwoon,vcm-freq:
+          default: 0
+          enum:
+            - 0    # 5.00 MHz
+            - 1    # 3.33 MHz
+            - 2    # 2.50 MHz
+            - 3    # 2.00 MHz
+            - 4    # 1.67 MHz
+            - 5    # 1.43 MHz
+            - 6    # 1.25 MHz
+            - 7    # 1.11 MHz
+            - 8    # 1.00 MHz
+            - 9    # 0.91 MHz
+            - 10   # 0.83 MHz
+            - 11   # 0.77 MHz
+            - 12   # 0.71 MHz
+            - 13   # 0.67 MHz
+            - 14   # 0.63 MHz
+            - 15   # 0.59 MHz
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: dongwoon,dw9719
+    then:
+      properties:
+        dongwoon,vcm-freq:
+          default: 0x60
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        vcm_rear: camera-lens@c {
+            compatible = "dongwoon,dw9718s";
+            reg = <0x0c>;
+
+            vdd-supply = <&pm8937_l17>;
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 603b11222d67..42dd86f5d5c8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6932,6 +6932,7 @@ M:	Daniel Scally <djrscally@gmail.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
+F:	Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
 F:	drivers/media/i2c/dw9719.c
 
 DONGWOON DW9768 LENS VOICE COIL DRIVER
-- 
2.48.1


