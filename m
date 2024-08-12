Return-Path: <linux-media+bounces-16096-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BA594E54B
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 05:01:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 899811C21457
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 03:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C90D146D7D;
	Mon, 12 Aug 2024 03:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWgjsLdO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DACD13BAF1;
	Mon, 12 Aug 2024 03:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723431655; cv=none; b=WcU9hxcWeHmtio1DWZWA+6ubtnVzJ0EwtZS3y2OS/AMp+rTR0TOWJ5MSdN+NDlqodMf6ewM0eZdFt0ydj01xzLLQYT0wllpIFNZ31c3RXLhypfquVAFG9Q9mjO9W5A1uDhYb/ITb4YqV1s5oH5Ovpj381T84W+Ikmyzq1/HQW14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723431655; c=relaxed/simple;
	bh=qm+uXAI7uIAW7TsqP8YL9lFLNlBCgTI2rS2LbLZ8fJ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y9OUHmnogB/KBejFd4AZYqHARQSJPhiR+tmSiX+l/Ns3FdwXhQhfYZDwFgtD0Uq0KSB/qmgLXdfn9zjuJf+dNRNd86O8dmHd+IkNwr0FIFgrK9wEjC3LFPYSYWm4BJvhWPvAnET7G6fZGoKuTND/X85bP2Tg8ysKi+X9meYgMrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BWgjsLdO; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1fec34f94abso31082005ad.2;
        Sun, 11 Aug 2024 20:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723431654; x=1724036454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IopTiHG0CBw96zUreHMxRe7sxGZ9Qm/2aKgJL9eEcvc=;
        b=BWgjsLdOtj3kEB1b8jVBAFuyVpomVeMPE7+Xmlj/a9rd2lRfUdF4ybNtSGvJ67xoUr
         wRURsy6lLYRwPTJtIRGHeeQpuOIcmSQ4wGRJneAjoUMMiNdG3ZUwegqbX/Fnr24hxTud
         IfWx1Ch1BG35Wt8PbsDtoyHy2KdCRgxdLtn/gYUcPQPgRvNh7L2XpWZ1zs2wVNNRgixT
         eaeUALxFL5EFb8Rl1iEhb2sKwCSRYLAJcKKAp2S94HplK4rAssupwpW0wh7r+ZnEmecd
         PedYdp0qg4dewvYx0lmlLb4G4XblMVkmjsTkeV9k/wKMGAgtxRd0rmnur3lBpwKthx/W
         tyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723431654; x=1724036454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IopTiHG0CBw96zUreHMxRe7sxGZ9Qm/2aKgJL9eEcvc=;
        b=AL1lvoaeQRstwX3EnnuQBD52cqrwexO5mNDAvl7RzwAxoUd8bhfbfzmZDP7HiOeuqp
         1pwzat7XSXxWjl/2DhOOk1Cpp1d46DyShbc3THG1DWSkTABCs/bXiDva03KIkhez8X7Y
         mfJjEW8H0PC9V3qy9UnjLG4Thf/jf8JZkADslUZxBKjeQSqqv+sjOneOwTu3p+MsB1cP
         6yqv/k6Il4+ZeN45ifvjtwJrFuLSp3Ocum66Wtn7zAGufjtxYevsMeLxa/8n245pGtEC
         Lk2Xo2Y/jeKV6vT5orej2gk55wSkT8E1QZFzumm0+0iC7m+exgjx9xvX6WMBN/JOBODd
         gF0A==
X-Forwarded-Encrypted: i=1; AJvYcCXqNT9Vf8x7qnDCeaHtpssmV23oo7Mp9oupvGbRG7f3XAN++yGkOzsjKruzyJXsQCGJxeBhwr2Ae7KYQnjnGK5ifx8i8zkdvFNxyua5NaEYsuSZJpu7uLF6CuaF7ShmeVHwEYjbO6YQGHvwxdhkCgWBj0i7gb7m6qub4rndj5+ukjreZRAf
X-Gm-Message-State: AOJu0YxKluUYBLgy2yQw0nIcWGOahfvERMVFyKWE9+J2wcoCqKgPEgrZ
	K63ChYUk4hB6iu9WPNIgimkYsOq3PA/TPr0cTRBrf/ObmAzGhlSy
X-Google-Smtp-Source: AGHT+IHJXWDmzGqQsCRWNZAXXOnmTHQ9pzhPsPckKmhtROKYEm/n1QxQPzP20fncSjqFX5lD8dFJDA==
X-Received: by 2002:a17:902:ec91:b0:1fb:7b96:8467 with SMTP id d9443c01a7336-200ae624582mr56725935ad.63.1723431653571;
        Sun, 11 Aug 2024 20:00:53 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200bba00f73sm28047105ad.201.2024.08.11.20.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 20:00:53 -0700 (PDT)
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
	Hui-Ping Chen <hpchen0nvt@gmail.com>
Subject: [PATCH 1/2] dt-bindings: mtd: nuvoton,ma35d1-nand: add new bindings
Date: Mon, 12 Aug 2024 03:00:44 +0000
Message-Id: <20240812030045.20831-2-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240812030045.20831-1-hpchen0nvt@gmail.com>
References: <20240812030045.20831-1-hpchen0nvt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt-bindings for the Nuvoton MA35 SoC NAND Controller.

Signed-off-by: Hui-Ping Chen <hpchen0nvt@gmail.com>
---
 .../bindings/mtd/nuvoton,ma35d1-nand.yaml     | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml

diff --git a/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
new file mode 100644
index 000000000000..988c43bc6e99
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/nuvoton,ma35d1-nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 NAND Flash Interface (NFI) Controller
+
+allOf:
+  - $ref: nand-controller.yaml#
+
+maintainers:
+  - Hui-Ping Chen <hpchen0nvt@gmail.com>
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
+    minItems: 1
+
+patternProperties:
+  "^nand@[a-f0-9]$":
+    type: object
+    $ref: raw-nand-chip.yaml
+    properties:
+      nand-ecc-mode:
+        const: hw
+
+      nand-ecc-step-size:
+        enum: [512, 1024]
+
+      nand-ecc-strength:
+        enum: [8, 12, 24]
+
+      nand-bus-width:
+        const: 8
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
+                nand-ecc-mode = "hw";
+                nand-ecc-step-size = <512>;
+                nand-ecc-strength = <8>;
+                nand-bus-width = <8>;
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


