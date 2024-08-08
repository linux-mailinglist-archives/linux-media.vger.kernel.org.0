Return-Path: <linux-media+bounces-15992-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3D994BC2A
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 13:22:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C77928368E
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 11:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB75B18C337;
	Thu,  8 Aug 2024 11:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d6HVMPmP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0103B12C7FD;
	Thu,  8 Aug 2024 11:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723116155; cv=none; b=UgIw7dCy/x3NDtWvOLMkIeQAhKjvC4ffu9ML7lNkRLzVRvf94N19Ze7BVW1nvOdXCcph0caZMXFYqa708eZIUHRCkVhuyeJpIDvwa2OKX6Ht8r/87x+7NpzaHo2IDkcKr1uf9N0t6lg0tWZFBf9XiQrCeFVHqpOMCjud4DSxIDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723116155; c=relaxed/simple;
	bh=CDwKJA/uu3OGplk5NSlMNfEYskSGArcrLLejB20802Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fNEY1tsQy9C7X+vT7hacUbjG1fleFrXzCUx/0rv0E9tYKVrcETQnfdUbfRMBs8y2lBP3FI/BKEecMixuZjJi2BBUlRf1F0M8YGphMhqoTKgO2MRE2IbXF8948n6rr9htlT2njYIYsq3asnQoQQM3qTpA0ysHF2qWwQb2921ntWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d6HVMPmP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98E8DC4AF0C;
	Thu,  8 Aug 2024 11:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723116154;
	bh=CDwKJA/uu3OGplk5NSlMNfEYskSGArcrLLejB20802Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=d6HVMPmPl5YpwTkTRg0qC2D5PrrdY8Zd9fIQlI0NcI0KNT+tBC45MXMqatnpFbTWJ
	 8hAaoT6bjlSrXTx2zDx4lA4PBPDn93ScaJaDR+Vtp3fQ98mOq9XA2d//PB+fUerutK
	 dmasIPTe2qtTR5npE23F9WLkYqbZhTDh9wnES7tQdC9re4UO3UhM+zHt87mhrnTF7I
	 gq51cYtgV/KNWFpEkXBqhA9a6FOaGXVI77AW6/Dwkn42t6w4K8NZlu9VMb1gmXb2z9
	 3qMldQvmvZ+L3ej8eTYOSX10cSZvz8GxwxZTzNsJ3qZYNE0OWEOhYsDUMQjUeFrfDP
	 MVMJCP74EFSGA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 882CDC52D6F;
	Thu,  8 Aug 2024 11:22:34 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Thu, 08 Aug 2024 19:22:19 +0800
Subject: [PATCH v8 1/2] dt-bindings: mtd: Add Loongson-1 NAND Controller
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240808-loongson1-nand-v8-1-c96dea418b41@gmail.com>
References: <20240808-loongson1-nand-v8-0-c96dea418b41@gmail.com>
In-Reply-To: <20240808-loongson1-nand-v8-0-c96dea418b41@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
 Keguang Zhang <keguang.zhang@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723116152; l=2566;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=Vtn3xAEQPno1t8MbB7sh3XS5+5h43vqaMfiWPSo6hUU=;
 b=vCA1lIZ+DiRFPepmmjKvfvp2cOUqgqgCl1GQc4ljZ4dt3k26znwBASox7rClwJo+7/8hzCnZl
 uE+FsN5lYygC983w0LplFRWOd0Jf+CkXoCLny1CziXCfdFKd74+YvYL
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
Reply-To: keguang.zhang@gmail.com

From: Keguang Zhang <keguang.zhang@gmail.com>

Add devicetree binding document for Loongson-1 NAND Controller.

Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
Changes in v8:
- Add a description part.
- Adjust the compatible because the match data for ls1c-nfc differs from ls1b-nfc.
- Mark 'nand-use-soft-ecc-engine' and 'nand-ecc-algo' as mandatory.
- Delete the superfluous blank lines.

Changes in v7:
- rename the file to loongson,ls1b-nfc.yaml

Changes in v6:
- A newly added patch
---
 .../devicetree/bindings/mtd/loongson,ls1b-nfc.yaml | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/loongson,ls1b-nfc.yaml b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nfc.yaml
new file mode 100644
index 000000000000..7ce335324a29
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nfc.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/loongson,ls1b-nfc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Loongson-1 NAND Controller
+
+maintainers:
+  - Keguang Zhang <keguang.zhang@gmail.com>
+
+description: |
+  The Loongson-1 NAND controller abstracts all supported operations,
+  meaning it does not support low-level access to raw NAND flash chips.
+  Moreover, the controller is paired with the DMA engine to perform
+  READ and PROGRAM functions.
+
+allOf:
+  - $ref: nand-controller.yaml
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - loongson,ls1b-nfc
+          - loongson,ls1c-nfc
+      - items:
+          - enum:
+              - loongson,ls1a-nfc
+          - const: loongson,ls1b-nfc
+
+  reg:
+    maxItems: 1
+
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    const: rxtx
+
+patternProperties:
+  "^nand@[0-3]$":
+    type: object
+    $ref: raw-nand-chip.yaml
+
+    required:
+      - nand-use-soft-ecc-engine
+      - nand-ecc-algo
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - dmas
+  - dma-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    nand-controller@1fe78000 {
+        compatible = "loongson,ls1b-nfc";
+        reg = <0x1fe78000 0x40>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        dmas = <&dma 0>;
+        dma-names = "rxtx";
+
+        nand@0 {
+            reg = <0>;
+            nand-use-soft-ecc-engine;
+            nand-ecc-algo = "hamming";
+        };
+    };

-- 
2.43.0



