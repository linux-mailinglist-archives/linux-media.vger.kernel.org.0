Return-Path: <linux-media+bounces-35895-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D75AE8C39
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 20:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD11B7B4DCE
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 18:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 762A61D95A3;
	Wed, 25 Jun 2025 18:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZM6veSrr"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B631DE2DC;
	Wed, 25 Jun 2025 18:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750875686; cv=none; b=qK4Rdijlp1I67FZrYPUzesxo5LKv88ff9jpbSivUAeWQk2w+HMaqpborJmBGI3dMznJ46lJ3XUwjE3s7xUb/3G0YYEIB0j20CveNufh2kCmBAOw2xWTSruT+8NM8win+N3f/wp+oGDpWXfARd6CYOyFzFlBpRzmPXhmxMWIk4Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750875686; c=relaxed/simple;
	bh=huMqLZantm6rr/mH6IfGq3VmFZ5Tj2qOeZLAqM6ZD8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hKU69r3FVPJmnE5OOdSmAwpp/fSS+MV8omcgD4+wZ/T5Jjy4tKLKGLe5t1blJsVwDBYnAf2DfVcZcnywrFYu/bUM9jyGTJv/WEjlJg3X5ZGXkuiBDE1cFZT4RQhX5D/svQK49FSVsnR3XMgJsCrVj9T8eMreWJUUULIavvwGV+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZM6veSrr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 99F85C4CEF0;
	Wed, 25 Jun 2025 18:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750875686;
	bh=huMqLZantm6rr/mH6IfGq3VmFZ5Tj2qOeZLAqM6ZD8U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZM6veSrrFHoQA0qCDye6xH8ij44b+lKGeq+PvmL8up2AozUK5SQElpiOAoTql4Rrs
	 oJTMCXMq2+RQT9yvj4lusO9BGtnVAma7J03HKfjVd6jFq89YfmH7ZV2Pjn6lTosqS2
	 EoRpWNLhLp0jcjhQgGMYPy3NsqMgNcmgjB0ErWlQHenlkJoChbzz2y4ME99Kgdekbg
	 /5tonHZyiagHuJKmx7vx0Vi0OPTQpwor1DKUZroPh1JLWx5Pi4KL0tz4xgKvdSWYEz
	 XIdis9i6RW5fvwjOk8q+hmq/2YZyZOsAAiv4shqoKo+HHhsKup8AfLK4HhcFJD4zIm
	 6go7tC0z0r5gg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82143C7EE2A;
	Wed, 25 Jun 2025 18:21:26 +0000 (UTC)
From: Stuart Burtner via B4 Relay <devnull+sburtner.d3embedded.com@kernel.org>
Date: Wed, 25 Jun 2025 14:20:03 -0400
Subject: [PATCH 1/2] media: dt-bindings: Add Sony IMX728
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-imx728-on-6-12-v4-v1-1-cfc6e18c3e23@d3embedded.com>
References: <20250625-imx728-on-6-12-v4-v1-0-cfc6e18c3e23@d3embedded.com>
In-Reply-To: <20250625-imx728-on-6-12-v4-v1-0-cfc6e18c3e23@d3embedded.com>
To: Stuart Burtner <sburtner@d3embedded.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Spencer Hill <shill@d3engineering.com>, 
 Sebastian LaVine <slavine@d3engineering.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3633;
 i=sburtner@d3embedded.com; h=from:subject:message-id;
 bh=LnlV6L2mJ9TLl5VCqHgQgwZnHhpiFmk9EKuOsHKQ7T0=;
 b=owEB7QES/pANAwAKAUhClGWrMl62AcsmYgBoXD4aYLpvY+uXXjbFsGXv3nCUKyJEvQUiNtRTp
 1tFhCNltW6JAbMEAAEKAB0WIQRYcXSPQoXxpLLN1/FIQpRlqzJetgUCaFw+GgAKCRBIQpRlqzJe
 tsnXC/0WY+8bIZ4zLAHgNHS1DgixNpgeexbCDkneRi8k3jm/A7xbrnkxfOgJ3vkwtFSctoH2JPr
 3dJnMhcLZXbPHDEZLJCfj1J+X6Wgz+56E0HbmnLAXEtzEyvJEFY+Origq0mbTNg73IkEdTPActL
 1Eepo5LzS7d8rVmRO0C6DGJyoe7M5bv/Fpmkodcek6WsTSQKPqHCKb5VcSw/tkxUL1PocnizC+U
 TNw2+gCPDBSPug8nyxZMsw6EG8wrmfvPpMcmHQ29SR0KDih9GLWM8TLXRanXCA7OzFuInzZgyTn
 jiZoEkVjtBbbvPENJ8PLUeoVfgqmsagwR09HFal1LKzDuACiPcMWR7R8iGcB3GHX7ISJlMRoWkR
 fE603gxchbJeUCIDzRo42W2KTop7CJiGDxJK2lJ5NCJUZzMgWnQGRUWd9lk2XoV+RzKkQ7PyCHn
 7G574SePQs12YdxfXByVAx1wLepxi95ZsBSYKYw8djuBVftw59B43F3YjgqqGbTIUcxJw=
X-Developer-Key: i=sburtner@d3embedded.com; a=openpgp;
 fpr=5871748F4285F1A4B2CDD7F148429465AB325EB6
X-Endpoint-Received: by B4 Relay for sburtner@d3embedded.com/default with
 auth_id=441
X-Original-From: Stuart Burtner <sburtner@d3embedded.com>
Reply-To: sburtner@d3embedded.com

From: Stuart Burtner <sburtner@d3embedded.com>

Add bindings for the Sony IMX728.

Co-developed-by: Spencer Hill <shill@d3engineering.com>
Signed-off-by: Spencer Hill <shill@d3engineering.com>
Co-developed-by: Sebastian LaVine <slavine@d3engineering.com>
Signed-off-by: Sebastian LaVine <slavine@d3engineering.com>
Signed-off-by: Stuart Burtner <sburtner@d3embedded.com>
---
 .../devicetree/bindings/media/i2c/sony,imx728.yaml | 95 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++
 2 files changed, 101 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..3da4be0817d1bebf9058cd10b2f8dd81dc484be7
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx728.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX728 Camera Sensor
+
+maintainers:
+  - Stuart Burtner <sburtner@d3embedded.com>
+
+description:
+  The Sony IMX728 is a 1/1.72-Inch CMOS Solid-state image sensor with a
+  color square pixel array and 8.39M active pixels. It is programmed
+  through an I2C interface.
+
+  The sensor can output up to 3840x2160 at a maximum of 45 frames/s over
+  a CSI-2 serial interface. It supports RAW24/20/16/12 and 10.
+
+properties:
+  compatible:
+    enum:
+      - sony,imx728
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: Clock frequency from 18 to 30MHz
+    maxItems: 1
+
+  clock-names:
+    const: inck
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      XCLR (System Reset) pin.
+
+  error0-gpios:
+    maxItems: 1
+    description:
+      XWRN pin.
+
+  error1-gpios:
+    maxItems: 1
+    description:
+      XERR pin.
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: ../video-interfaces.yaml#
+        unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
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
+        camera@1a {
+            compatible = "sony,imx728";
+            reg = <0x1a>;
+
+            clocks = <&fixed_clock>;
+            clock-names = "inck";
+
+            reset-gpios = <&gpio4 17 GPIO_ACTIVE_LOW>;
+            error0-gpios = <&sens_exp 1 GPIO_ACTIVE_HIGH>;
+            error1-gpios = <&sens_exp 2 GPIO_ACTIVE_HIGH>;
+
+            port {
+                camera1: endpoint {
+                    remote-endpoint = <&vin1a_ep>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index d0f18fdba068b0cc2dce434e0471f6a9a3330843..74db2caf18157dec74fb2e23c33f66522092941c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21546,6 +21546,12 @@ T:	git git://linuxtv.org/media.git
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
 F:	drivers/media/i2c/imx415.c
 
+SONY IMX728 SENSOR DRIVER
+M:	Stuart Burtner <sburtner@d3embedded.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
+
 SONY MEMORYSTICK SUBSYSTEM
 M:	Maxim Levitsky <maximlevitsky@gmail.com>
 M:	Alex Dubov <oakad@yahoo.com>

-- 
2.34.1



