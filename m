Return-Path: <linux-media+bounces-16554-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 909F6959575
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 09:12:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9E0BB2170F
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 07:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076AF199FAE;
	Wed, 21 Aug 2024 07:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUYIA8BH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE31192D93;
	Wed, 21 Aug 2024 07:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724224305; cv=none; b=s5Zaya83/5W6sYPc88joJRCSjkrLeKOrZ7HUsreK4dKV13WKg6dXg6OeUQQlsgYuR5hqTkl0jMWL80igHITxctxiyG+PdiK+EQwSA0WCCKUbun4hZABVIHyRdLjc6XMLLa6Y7amY+jrxRG4iMGdXgJH1bWuid8d/B6RHpX3OGDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724224305; c=relaxed/simple;
	bh=r40/nAEsXvar06aK0ePNos7JI6t2NRwL48MnYfhZyYM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DYQYaL6cfIIG5ny1FEnF5k6f8zSekE9U5CjlY7cAwc8Yk//beTO20bQjkkFLKwapWm1QPHx3OIT2iwxfGqJRSPcbDR+ACptfgXUEf0NckOqKNFV+mr/LqhhodoC00kgVkDbV93LH0N6CFQbxDvtmyRKsHuJCKu+pkWhzp+lavF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUYIA8BH; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3db130a872fso3938223b6e.2;
        Wed, 21 Aug 2024 00:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724224303; x=1724829103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGa62lm+NpvJha+MuMU8KQrhYDpQR6aMS0ytEgFfvvk=;
        b=JUYIA8BH0JvIy0BaoCCA+HIn4rSbzGszD7uMs2K57nBy7q+a8i1xIBLNWy4mQgnf+T
         2fyeXMM3Naj5O9PTYtvTKHAY8Vopz5CTWFulUdg1G/hyQmDrGj+ClWUrVl9Wt9xlBmFe
         fSA7MkOOx1YIdzsj5UrFYSIEGcfXCk9fdR5GMN2nkqnlGwfGtEC+SzwoQ6zk3c28f5k1
         GpPRoODQRM5UTdBNF8qujPGvIiYNHIhoAzj4PaQDRfnUH7aUfg7O97R+qzAM8yD3TdOe
         RnxelBFj79NL0jIuuCW4qGnsL0hLtQ6t6sctLTXY8/lJ6tW5G7zz2MR18WW25hOhF4Wp
         0pCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724224303; x=1724829103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGa62lm+NpvJha+MuMU8KQrhYDpQR6aMS0ytEgFfvvk=;
        b=sh9ehiAdy52KgidiKQGZkiBRVfcilEGcpOepwo+zKGiakV4c4mj3fPe90rw9D+6l2p
         aCr1gZjkKuS6uV5rtFuYRbFgHjPP/t+ZlEHS2UU1eLhL45RYwPIc2+Vz5gtrFvODDUiT
         eKEY3rIUEWy+vB3ZQ+9QistM+1DEuH+uv0ji+JouV5bAnbGUUl8WramuVXrLl413UxCK
         8p2sEXU2tUXho3h/n3YhHbtKqmpgYncU6K+kZiyHZAu273SzmwUC6UuxFMv3TAfWzc37
         VxsvjZhLdJZTGfa0xskoknmVTa6nkLXxVFd2QgVdhIMpdf7TgQrUYlnYULuNKgqCx95L
         Zbag==
X-Forwarded-Encrypted: i=1; AJvYcCUmkeFEvJyNZGOM0nQYu5Q1lFlNklYxDLQbX2/sdjbA4vX9sK8kxjJhZhVO+SLQqMbhXo0SlcQujNqPJ4E=@vger.kernel.org, AJvYcCV2gvfwyx58V+cZYn8htZqEG9YgEW2x2vbt/ViYwj1Nk3MmyOZpAZBL1x/cWeKpin99QS8PZy3DMnioGWSi@vger.kernel.org, AJvYcCWvs1t40tUg/BrucwZ0bFx05KYRqAJunHUXSV4BWHX4Xu8SSHWNGLOyGZvKmvlfsk/cq2t1nFAUkhSG@vger.kernel.org
X-Gm-Message-State: AOJu0YzPr8I+KteNiM3PG7xKmB5xPvp2GeZUPIYqHwpWcGFOnXFWTM2i
	7NYlRrU7G3yDiovozWc2Xecupf2PT3eW0MbaJUihpX2F4vqD+3Br
X-Google-Smtp-Source: AGHT+IGo/iprfd3p83aO0Byo3qtSiIKa8o6rPt/g/EWYB/UqHNXIFdHP7tmeIc36eJgXrcnmuZxPFA==
X-Received: by 2002:a05:6808:2022:b0:3d5:64be:890c with SMTP id 5614622812f47-3de194fd581mr1593407b6e.17.1724224302958;
        Wed, 21 Aug 2024 00:11:42 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd8b631303sm526667a12.9.2024.08.21.00.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 00:11:42 -0700 (PDT)
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
Subject: [PATCH v3 1/2] dt-bindings: mtd: nuvoton,ma35d1-nand: add new bindings
Date: Wed, 21 Aug 2024 07:11:31 +0000
Message-Id: <20240821071132.281018-2-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240821071132.281018-1-hpchen0nvt@gmail.com>
References: <20240821071132.281018-1-hpchen0nvt@gmail.com>
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
index 000000000000..152784e73263
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
+      - nuvoton,ma35d1-nand
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
+            compatible = "nuvoton,ma35d1-nand";
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


