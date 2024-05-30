Return-Path: <linux-media+bounces-12259-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 087928D5083
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 19:07:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B5F51C21C9F
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 17:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BC27433DF;
	Thu, 30 May 2024 17:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="r1cAix2s"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17661224DE;
	Thu, 30 May 2024 17:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717088842; cv=none; b=jdq54Vs1KkMpJzEysoagBMAUtWLBM3zUyDJOFx4xpceiwLRCqAo/0WhBsQP5pI2T+w0PSGhHRC5KZdFF+VbVanV2Hmay+klATJ7YXXa69tfvDZ8dvSFXCMRyylsERV5gstKBGZG/kPpAG60DS7yrkY24yH8iv/L7q3VnuaWvi3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717088842; c=relaxed/simple;
	bh=2iVwbMMUbOM9n/CFhJHEkyhA69N23s8LiCcG1LOOwMk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iNTHR+zRNGt98zVbb3sozRL/tXKAo7/qwVEdMz7cGRm9qY+LBhLomASyNcRrbU9M8zSIA3e61zIKJLsliePkF5FJ/wndBfIt2BztHzX7I0MdGZrvX9svwCjSjB50CtPNbhBhppVAbifKGLyoGzG7G+0cCRN18Eub6fpVvJ1TuO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=r1cAix2s; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44UH7BZq086432;
	Thu, 30 May 2024 12:07:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717088832;
	bh=pDXaFrZNsFbzg111mB1tj844P1eOk1scANJi1dNprZU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=r1cAix2s0CRqtSl8gNb2jLlUmONrAt31qwgujEwbjpAKcLMFHvJBpI3brkhdw8ZYV
	 emWVt+L+f/jY2FNbkw16SoW3l4wFrTbw6JqiSZGGwJPA30BqYPeB07Ls+UtjiKsEz3
	 LbpfPj/KhggkDTfbFRWpIPI7TA1V9QMoec58cZF0=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44UH7Bw3124816
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 May 2024 12:07:11 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 30
 May 2024 12:07:11 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 30 May 2024 12:07:11 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44UH7AwG048811;
	Thu, 30 May 2024 12:07:11 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <mchehab@kernel.org>, <robh@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
        <vijayp@ti.com>, <andrzej.p@collabora.com>, <nicolas@ndufresne.ca>
Subject: [PATCH v10 01/11] media: dt-bindings: Add Imagination E5010 JPEG Encoder
Date: Thu, 30 May 2024 22:37:10 +0530
Message-ID: <20240530170710.2735503-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240530165925.2715837-1-devarsht@ti.com>
References: <20240530165925.2715837-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Add dt-bindings for Imagination E5010 JPEG Encoder [1] which is implemented
as stateful V4L2 M2M driver.

The device supports baseline encoding with two different quantization
tables and compression ratio as demanded.

Minimum resolution supported is 64x64 and Maximum resolution supported is
8192x8192.

[1]:  AM62A TRM (Section 7.6 is for JPEG Encoder)
Link: https://www.ti.com/lit/pdf/spruj16

Co-developed-by: David Huang <d-huang@ti.com>
Signed-off-by: David Huang <d-huang@ti.com>
Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
V10:
 - No change
V9:
 - No change
V8:
 - No change
V7:
 - No change
V6:
 - No change
V5:
 - Add Reviewed-By tag
V4:
 - Use ti-specific compatible ti,am62a-jpeg-enc as secondary one
 - Update commit message and title
 - Remove clock-names as only single clock
V3:
- Add vendor specific compatible
- Update reg names
- Update clocks to 1
- Fix dts example with proper naming
V2: No change
---
 .../bindings/media/img,e5010-jpeg-enc.yaml    | 75 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/img,e5010-jpeg-enc.yaml

diff --git a/Documentation/devicetree/bindings/media/img,e5010-jpeg-enc.yaml b/Documentation/devicetree/bindings/media/img,e5010-jpeg-enc.yaml
new file mode 100644
index 000000000000..085020cb9e61
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/img,e5010-jpeg-enc.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/img,e5010-jpeg-enc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Imagination E5010 JPEG Encoder
+
+maintainers:
+  - Devarsh Thakkar <devarsht@ti.com>
+
+description: |
+  The E5010 is a JPEG encoder from Imagination Technologies implemented on
+  TI's AM62A SoC. It is capable of real time encoding of YUV420 and YUV422
+  inputs to JPEG and M-JPEG. It supports baseline JPEG Encoding up to
+  8Kx8K resolution.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: ti,am62a-jpeg-enc
+          - const: img,e5010-jpeg-enc
+      - const: img,e5010-jpeg-enc
+
+  reg:
+    items:
+      - description: The E5010 core register region
+      - description: The E5010 mmu register region
+
+  reg-names:
+    items:
+      - const: core
+      - const: mmu
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/ti,sci_pm_domain.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+      jpeg-encoder@fd20000 {
+          compatible = "img,e5010-jpeg-enc";
+          reg = <0x00 0xfd20000 0x00 0x100>,
+                <0x00 0xfd20200 0x00 0x200>;
+          reg-names = "core", "mmu";
+          clocks = <&k3_clks 201 0>;
+          power-domains = <&k3_pds 201 TI_SCI_PD_EXCLUSIVE>;
+          interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index dbc5d9ec3d20..f68e1a5757b5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10767,6 +10767,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/auxdisplay/img,ascii-lcd.yaml
 F:	drivers/auxdisplay/img-ascii-lcd.c
 
+IMGTEC JPEG ENCODER DRIVER
+M:	Devarsh Thakkar <devarsht@ti.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/media/img,e5010-jpeg-enc.yaml
+
 IMGTEC IR DECODER DRIVER
 S:	Orphan
 F:	drivers/media/rc/img-ir/
-- 
2.39.1


