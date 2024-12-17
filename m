Return-Path: <linux-media+bounces-23569-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2666B9F4913
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 11:41:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D425F1883766
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 10:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D66F1EB9E8;
	Tue, 17 Dec 2024 10:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uovcrRAB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785721E2845;
	Tue, 17 Dec 2024 10:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734432072; cv=none; b=MOzwbxSEEDw5YTsZdomLdhHTY3IuD2qVgLCkFrCz8lyUzX1/gtkp9u96rPsUnvZ+PlNXgRIacr01+Aa8UPMtbQiaIaqOVpj73lHV7LTH3fgDEnbToC2AaSqgfyCQLvjpU4u3MXQIEJi7GBAuDF/v5AjMFarqhJtYNVV1jaKzkTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734432072; c=relaxed/simple;
	bh=1760CCO3gWZHNeVfY5/f+c2AnK/nJwtzD4p2QC2Rpx4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tWAtGJMl7b/1sEZ9CaIUALuz2nN5tXncmrJXRvVLpOOCffQBjqECtBs/lbFAM151S8NWv2N6kv8vKXs5Eh/CZAzA/pkUin5A5NCMJaH5c6V7zAo8Ar4lmmJnQw99fwcVWYGP/8p/i7MAyXblVHnd4OJ0WcJeRgfPjdpQ5XapxSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uovcrRAB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B0FEC4CEDD;
	Tue, 17 Dec 2024 10:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734432072;
	bh=1760CCO3gWZHNeVfY5/f+c2AnK/nJwtzD4p2QC2Rpx4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uovcrRABs+VkZ9rv6ljq4Xa7ySSTNETAJ69DOTlHwIJNh+it5X35ezs15GL71loeC
	 ITHngykkH1N7iLRpXm+pRdtc8IjU3bbWs20P0L/9IAR5stciz2Lsa2VsKRhtdnk2u7
	 OXgbDqjTjGaC7UUCFX7brv9C6wtAw4aL4/4bqh4ogpi/0vSQnIOSMFNPStgal9jugw
	 SmK/nfy1D9EK/Ub+yMoETBlQQ4qeXsrdhAHBt2nVui6kCSs0T5ycTNETLc9gaVB+HV
	 NQmyBhK0TF3fl/x0FK9P42NNOx9ezYZjDnqu50TUWgkq8LNoiaEiYoDgZvmFlyYmvw
	 HJ3Hvjowzq6TA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA2B0E77187;
	Tue, 17 Dec 2024 10:41:11 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Tue, 17 Dec 2024 18:16:49 +0800
Subject: [PATCH v11 1/2] dt-bindings: mtd: Add Loongson-1 NAND Controller
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-loongson1-nand-v11-1-b692c58988bb@gmail.com>
References: <20241217-loongson1-nand-v11-0-b692c58988bb@gmail.com>
In-Reply-To: <20241217-loongson1-nand-v11-0-b692c58988bb@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734432069; l=2999;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=0n3iHa5vTKitylZMSJRQyTKQkBBQcI0nit09XDnkuhg=;
 b=6lL4GjLHOMmCi1U22+Sk2hzYN0ANTJsOeExsV2GdTN/z1pvz9TTEPD8SUurFSYshVscmRp6Xc
 XPi1X2fGT+lC7MkIr0TJ9dx/SZNZiYF/SSa4uB2WEblZBFDo1a+xkTy
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
Reply-To: keguang.zhang@gmail.com

From: Keguang Zhang <keguang.zhang@gmail.com>

Add devicetree binding document for Loongson-1 NAND controller.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
Changes in v11:
- Remove the requirement for 'nand-use-soft-ecc-engine' and 'nand-ecc-algo'.
- Add 'reg-names' to support DMA address.

Changes in v10:
- None

Changes in v9:
- Change the compatible to 'loongson,ls1*-nand-controller'.
- Rename the file to loongson,ls1b-nand-controller.yaml
- Some minor adjustments.

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
 .../mtd/loongson,ls1b-nand-controller.yaml         | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/loongson,ls1b-nand-controller.yaml b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nand-controller.yaml
new file mode 100644
index 000000000000..f6530d64dc54
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nand-controller.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/loongson,ls1b-nand-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Loongson-1 NAND Controller
+
+maintainers:
+  - Keguang Zhang <keguang.zhang@gmail.com>
+
+description:
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
+          - loongson,ls1b-nand-controller
+          - loongson,ls1c-nand-controller
+      - items:
+          - enum:
+              - loongson,ls1a-nand-controller
+          - const: loongson,ls1b-nand-controller
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: nand
+      - const: nand-dma
+
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    const: rxtx
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - dmas
+  - dma-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    nand-controller@1fe78000 {
+        compatible = "loongson,ls1b-nand-controller";
+        reg = <0x1fe78000 0x24>, <0x1fe78040 0x4>;
+        reg-names = "nand", "nand-dma";
+        dmas = <&dma 0>;
+        dma-names = "rxtx";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        nand@0 {
+            reg = <0>;
+            nand-use-soft-ecc-engine;
+            nand-ecc-algo = "hamming";
+        };
+    };

-- 
2.43.0



