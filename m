Return-Path: <linux-media+bounces-18381-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE67697B9CC
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 11:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E26DF1C21E5B
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 09:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6C7817B510;
	Wed, 18 Sep 2024 09:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gLKgHtuG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A95179658;
	Wed, 18 Sep 2024 09:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726650199; cv=none; b=eU/x0VNjYrBGBVsWB7g9sb7kFWMIahtjUXrlxfx9LjllojCQ8rCYYDu5kxA7DSdfnlL9rUryKzSFSDCqrXebMTtVFBKW0MriR1mLY7cOJKBJKMxKsupZkXm6RJYuF/ImQR8CTwS+VcDoajOuT7aQXGzjGQ2TQl77epABWnyhqmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726650199; c=relaxed/simple;
	bh=1z9fnWUuNK0Pc7cPE4EqMowbgf5W39Nzy/4+d/iZNHk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kxPZp78mUfVXJ0q6fEKNTYAuNZ4vARCBH1vyJLq6eKuJZK2A5G2z+8csvA72vapRlECV0IcyrGHmlAeJSs/GdfzAv/StPYoE6YG1lnTPy1sqlqk8awrOrGgjY5PJQQt97le+24BBx9VuD7XnrFeCh1tHCs+dUeCx5A5zd/cTo3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gLKgHtuG; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20543fdb7acso38443805ad.1;
        Wed, 18 Sep 2024 02:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726650197; x=1727254997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AjX+GWxHlPwm32RdWG50sup+7/ylH4rWNpxlnfN528U=;
        b=gLKgHtuGNnmdJL/clxOrg4Eb7frWGhjImg0y4MThjmqcNTfzBf2h+uJcbJ0cbzinD4
         clTimxipRUzGskjEdGSGNEj49yp6WIfbK9+bvGmGy7z9qLDE0BOvI0EMsqAbgabqpKMg
         nByLyYn0uqCidzS7Mej+HCpHGA/5EzvpF862I6/XDFlJZw0vcmXc1dbLjdh9BRNcKo34
         HGV4nv2n7+hr1EpYh2sM8ElKqDEQaX8HKsmVY+T3OXDXe1ObPA5NqhNfg8dmuMQFd+CP
         Qh1RHOsXJkCeSUSSgcYeTNwjoj2ScpLF/4g3naHFO5AGJNSF2tSZ498c6eqJQjMVVZce
         stEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726650197; x=1727254997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AjX+GWxHlPwm32RdWG50sup+7/ylH4rWNpxlnfN528U=;
        b=CANLmDeTMvnABAgvsCzSDwtiIkEQZIHh2ChnNYue+Y8o6nV13NlkEpaudGr4Q5rzeL
         +bv9+TuD4sPI6rUPUtrFxeJ3o9ljIaMO4MAbkIL+KsLLjgZ+WObnf9BGqubNLIyOGGZv
         lFkc1IRYJpsb8ZwGdQHZperXJkYyJMsu8Yj7ZqP+SuBMoDCiKV6rRquD1aXEHsb5fc1B
         Lszn89vn5ihPJWRJkZj+E4H/bOmZQvwZPpRIffg+0QJ56Qic+K9qgj7REC1WWR0KJwSg
         FhGzxvTAzMzrF1piegVnoRCB1WW1/JBmPUlOhfAPdqeiYqMp4sOeomNoQE1zng3kYNtb
         qmcg==
X-Forwarded-Encrypted: i=1; AJvYcCUpJYGB2c4vYi25JcfpEGxxr85ja50ShUk4aVWKKIOFS5pifrINcSvE+Y7xOa7YKYGGcJbQCK32ZcZdlh4=@vger.kernel.org, AJvYcCUsjNl6fPDS++rjX1ojA/SaXv+koA7RWZqJQf/NCSBg29714X/af9osUAJjmkBqJVyh8VifILpmtxLJ@vger.kernel.org, AJvYcCVeZ0q3LziR/bOUTgsSnQJxt3ZUMjqckQLCZ8Y0FIbxiDCEiXPyV6PsckT1FQCoFcD15naGnYJc4d+0Wk5f@vger.kernel.org
X-Gm-Message-State: AOJu0YzUj3NcQpxZKrw9UYJ7IVdE2Opo/UAYN2xSxW+DlnTTLFA3Sp8W
	CIw8L+dP28E8yugJOO1U21+xskdWTKfnwRkih6pahvwq1CMXbQLX
X-Google-Smtp-Source: AGHT+IEu2ExwD56L0eMxFaxhnTGWr5C0LOkIV1Cbr4483wISjxblVpLqyl0/2mVScIM1AHAa8dS/2Q==
X-Received: by 2002:a17:902:e852:b0:203:a14d:ed0 with SMTP id d9443c01a7336-20781b42d61mr326944145ad.11.1726650196885;
        Wed, 18 Sep 2024 02:03:16 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946010f9sm61021875ad.84.2024.09.18.02.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 02:03:16 -0700 (PDT)
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	esben@geanix.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/2] dt-bindings: mtd: nuvoton,ma35d1-nand: add new bindings
Date: Wed, 18 Sep 2024 09:03:07 +0000
Message-Id: <20240918090308.292617-2-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240918090308.292617-1-hpchen0nvt@gmail.com>
References: <20240918090308.292617-1-hpchen0nvt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt-bindings for the Nuvoton MA35 SoC NAND Controller.

Signed-off-by: Hui-Ping Chen <hpchen0nvt@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/mtd/nuvoton,ma35d1-nand.yaml     | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml

diff --git a/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
new file mode 100644
index 000000000000..a8a549644c98
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/nuvoton,ma35d1-nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 NAND Flash Interface (NFI) Controller
+
+maintainers:
+  - Hui-Ping Chen <hpchen0nvt@gmail.com>
+
+allOf:
+  - $ref: nand-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,ma35d1-nand-controller
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+patternProperties:
+  "^nand@[a-f0-9]$":
+    type: object
+    $ref: raw-nand-chip.yaml
+    properties:
+      nand-ecc-step-size:
+        enum: [512, 1024]
+
+      nand-ecc-strength:
+        enum: [8, 12, 24]
+
+    required:
+      - nand-ecc-step-size
+      - nand-ecc-strength
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        nand-controller@401A0000 {
+            compatible = "nuvoton,ma35d1-nand-controller";
+            reg = <0x0 0x401A0000 0x0 0x1000>;
+            interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk NAND_GATE>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            nand@0 {
+                reg = <0>;
+
+                nand-on-flash-bbt;
+                nand-ecc-step-size = <512>;
+                nand-ecc-strength = <8>;
+
+                partitions {
+                    compatible = "fixed-partitions";
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    uboot@0 {
+                        label = "nand-uboot";
+                        read-only;
+                        reg = <0x0 0x300000>;
+                    };
+                };
+            };
+        };
+    };
+
+...
-- 
2.25.1


