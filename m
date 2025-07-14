Return-Path: <linux-media+bounces-37712-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 470EBB048F6
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 23:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C333F1A62B6C
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 21:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB8B925A33E;
	Mon, 14 Jul 2025 21:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1Fr1bMT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA6724C060;
	Mon, 14 Jul 2025 21:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752526974; cv=none; b=MBE5GxAcehlhCKq44yvDPzIB5h9jEjkNt9Fd9Ikvy02GKb8pGxyHuLzWRMJtYHnFNCQGeqqFTIn2n60sW/VKEtVDB2W0COd7+nwJxC3exwxATFN9gcqjjf3NEVyPrnkZy3ujT/TCcTSFPe25S9pu1K3Jxbme0ONMYUNqSQ18z1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752526974; c=relaxed/simple;
	bh=S7UHk8szGhQHhLRTFe1mjczojRsELQ9NCZ/MxIovJrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g7f1nGB/dM2swK9eoHwtSMe2QziEMBEjdWwExxlZG/6sQxYdZlCTvspeZ9io0vQ3NdYblcxp/pfimD8wcqSSZoQNyRy/xsce9CAO2urgmMAfjYOdQK3/YG/52aHlE4mZCodMnLVH6MQyrQBbEwJrZOJUyosv76vIpyzqgbyXnNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1Fr1bMT; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7dd8773f9d9so387841585a.2;
        Mon, 14 Jul 2025 14:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752526971; x=1753131771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TljbnLuPEXV3SC79Oy05jIhRoL7FT16n41k+PhtaR8=;
        b=e1Fr1bMTUyH6JbqgE7bPZxBBUQyOT1Z6zBfQ/kmxQrnZ+oBPrZ/idf3m0uy4r89dFE
         N6DkK16aUXXFXaM94zVgUjl+cH0lX5vdPX/Cv5EF9JqrF7/4LzE4C4cWbZME7kldXM7n
         CRKnHf5/1KwvAX07B00JjE9qFSHShYmi7vjmi0Q6KTENxUZVYPSEzOJ0cndUGGWrjJuf
         lB01u53GVu4CcrjbM9eV2oWuh6Q0T63lCvCYmuhQSr6egFElgv8aaDPx4NZwoZEsqMd7
         hQClLCrF+IRAGAdBcY2yXz8ahLYPqyg32ZbTEzaipVXiKMyT3A5udOO3hNlMqLOTG2MQ
         0FWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752526971; x=1753131771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4TljbnLuPEXV3SC79Oy05jIhRoL7FT16n41k+PhtaR8=;
        b=SkJR6UUvhQ+LIePoQuQ0HwIY8wG4J1FeDYOnMpIIJ6pDqtUc8Hun6ZoEIZKvJ987Pa
         5DBSEmNrwjm8k1KjcOD8/MjPIDdoJRRVjJ2fmMM/R6EyV2bkj4Wf7MOrIOHOVMyZEwXo
         1XHRMg2Uq3rwhbCXimQDILiOkPIvRV+DN96ldriBJ3iTdB8t6j26bfw2JUGaIJ13UmOK
         aygI3rMglln7BmCmEici+v0Sdlk6o2fYuRsCHGZIWqWXGZ6JUx1Ewx5tlN/ZxMrlP5rN
         BuT2A/G3DGhdWWVL7aNZTzOmRxNB8hX6skN5ls6170CECtPPQ84PRsiwopal0vzZgdo9
         AuDw==
X-Forwarded-Encrypted: i=1; AJvYcCWj8cuFZryr/xbIx7UsvjsVDo0l4MOxtqcUKnzB+lrKGHRmRTapXPSJj5x4Liqu9U/RsuAjqdQ1eErL6lM=@vger.kernel.org, AJvYcCX8ZnUB+m2bb4/qacyErChsSuKPgOSUArTYUzz2QDzkbt5hVPZV2QkYiYxCVlaQHh2PvT82C0cUEzpIAgMhgg==@vger.kernel.org, AJvYcCXea9/pDJgVHW+wSjAxFxf8KKXgdCvDen0tb97JM/ir0tXqAj3a/S7RXxqFIKteF04JOy2S6WYtFpNp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+73DQ0PSrqD3DR9Qm2o+5irLmiWM0TnWsMKKUseYy5aKOqiBA
	QterERjgltdkiX3p4L+Vspk2/+TPDvl6vYzLLLwjfsaJpIhERT9/GumLuUfSGg==
X-Gm-Gg: ASbGncsVIyWsnCupcLxIFF6M8JGTV4eIW4eBA1ECVXxTs5WZn8dDZFoNQ+RG5CIjPLR
	rzAkDrVvHCsMTdNh879XSwmv0wjBW3HTp+EE+lxCedzkLK8r6eCsWHk4zhi/8yKCeyp3zvCSOxl
	DvIIouuzoxbH+57ECULxCCdDPird+fQGM9vj6ELN59ySv92d9dyt4N/FyooORaIhqxtD8ACsFoq
	vRyp4lQnjpjjEmxdgGQT9a/qDoFCKU9wUNbn8fPKUH2jCm7a0j3TtyFqtiWFq8ntt2ae350wHOG
	bQtWiHvLcGYiHoEBksVcXAhEQLCLXuuAZ//rgJlPGMVEzqSEvfdLeI7ViIfjMdRSIzWAZM5GQVh
	Dj5e2YZEsfA==
X-Google-Smtp-Source: AGHT+IGR/1Vi/z6E9T4MPMlKnvlQNVTdXoe193WfPJZVclQZvP8RMdkj+zumQcTlVdjKI44rxmuRNg==
X-Received: by 2002:a05:620a:29d0:b0:7e3:3873:ff7c with SMTP id af79cd13be357-7e3387403a4mr86563385a.25.1752526971354;
        Mon, 14 Jul 2025 14:02:51 -0700 (PDT)
Received: from localhost ([2607:fea8:3140:6800::10ce])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7e2d7825258sm164470685a.100.2025.07.14.14.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 14:02:50 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 1/4] dt-bindings: media: i2c: Add Sony IMX355
Date: Mon, 14 Jul 2025 17:02:29 -0400
Message-ID: <20250714210227.714841-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714210227.714841-6-mailingradian@gmail.com>
References: <20250714210227.714841-6-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IMX355 camera sensor is a camera sensor that can be found as the
front camera in some smartphones, such as the Pixel 3, Pixel 3 XL, Pixel
3a, and Pixel 3a XL. It already has a driver, but needs support for
device tree. Document the IMX355 to support defining it in device tree.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../bindings/media/i2c/sony,imx355.yaml       | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
new file mode 100644
index 000000000000..989e8ddc3f95
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx355.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX355 Sensor
+
+maintainers:
+  - Richard Acayan <mailingradian@gmail.com>
+
+description:
+  The IMX355 sensor is a 3280x2464 image sensor, commonly found as the front
+  camera in smartphones.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: sony,imx355
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: mclk
+
+  avdd-supply:
+    description: Analog power supply.
+
+  dvdd-supply:
+    description: Digital power supply.
+
+  dovdd-supply:
+    description: Interface power supply.
+
+  reset-gpios:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml
+        unevaluatedProperties: false
+
+        required:
+          - link-frequencies
+
+    required:
+      - endpoint
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - port
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,camcc-sdm845.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@1a {
+            compatible = "sony,imx355";
+            reg = <0x1a>;
+
+            clocks = <&camcc CAM_CC_MCLK2_CLK>;
+            clock-names = "mclk";
+
+            assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
+            assigned-clock-rates = <24000000>;
+
+            reset-gpios = <&tlmm 9 GPIO_ACTIVE_HIGH>;
+
+            avdd-supply = <&cam_front_ldo>;
+            dvdd-supply = <&cam_front_ldo>;
+            dovdd-supply = <&cam_vio_ldo>;
+
+            pinctrl-names = "default";
+            pinctrl-0 = <&cam_front_default>;
+
+            rotation = <270>;
+            orientation = <0>;
+
+            port {
+                cam_front_endpoint: endpoint {
+                    data-lanes = <0 1 2 3>;
+                    link-frequencies = /bits/ 64 <360000000>;
+                    remote-endpoint = <&camss_endpoint1>;
+                };
+            };
+        };
+    };
-- 
2.50.1


