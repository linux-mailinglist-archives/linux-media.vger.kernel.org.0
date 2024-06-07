Return-Path: <linux-media+bounces-12734-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BB99004BC
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 15:26:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24D34287F81
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 13:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8544A196D87;
	Fri,  7 Jun 2024 13:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qkvwqt6+"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2171B194125;
	Fri,  7 Jun 2024 13:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717766706; cv=none; b=jdNOHF5eg4S7A3dZhS4LXIb5WZipTL5zeNy9piiPotZYZ39PEjWLzDNZWe9lLoicG9G7GPU4oBdwaSGeXAaqUydVCFrY2OX+W2zj2KP0ot8+0oJ3PXIVcHLccIsWrJYL/0A785mjcB0jM3CZwPBsPqpOON4+FU5DklsfHvzrCfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717766706; c=relaxed/simple;
	bh=XCkeTdmb5UlSYGoXVQyM1mXHb7Pmwzz3LJ95NLN5jaw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q8BEEI7a0e3r5jYNYAX1Q5AYW7hiFlFUJRZZVioPheWx9xEdU4OIuQJRX8jxQbEGa5eRP0V/47qmHX2eKI2vmlx1trgtrxOy6Z0DOL4fgV7w7eDWR8PRcH8eLrfj2o+2aKa48LQnhtMFHRnvRD3laTZTa6o5DNBJU3pZAp+P+nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=qkvwqt6+; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 457DOiYc087159;
	Fri, 7 Jun 2024 08:24:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717766684;
	bh=2HowkdMKmfe/bA4sdX1zRcikYqQHIjGaVwnlm56Dfgs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qkvwqt6+pnCujOAF6Wv/4v2m58yk3eER3Z5Jvci3873Kw3bRczkKGhRF6Pp9E9Bv2
	 Tqx8BNH4xEEF7Lbc1cbgNCqgoxht/F0F5EAlBJdqpPg+LE7rE1NUSfSO/UymEwDFN7
	 udaGMdwHL5Tn8nY/nDpTlDs5yLFT3ho1tJG/BdN4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 457DOiKf094642
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 7 Jun 2024 08:24:44 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Jun 2024 08:24:44 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Jun 2024 08:24:44 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 457DOhOi033596;
	Fri, 7 Jun 2024 08:24:44 -0500
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
Subject: [PATCH v13 01/13] media: dt-bindings: Add Imagination E5010 JPEG Encoder
Date: Fri, 7 Jun 2024 18:54:43 +0530
Message-ID: <20240607132443.3544826-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240607131900.3535250-1-devarsht@ti.com>
References: <20240607131900.3535250-1-devarsht@ti.com>
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

Link: https://www.ti.com/lit/pdf/spruj16 [1] (Section 7.6 JPEG Encoder)
Co-developed-by: David Huang <d-huang@ti.com>
Signed-off-by: David Huang <d-huang@ti.com>
Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
V13: Update commit message to use Link: syntax
V6->V12: No change
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
index bb9f8077b37d..f2dcab7af2d1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10781,6 +10781,11 @@ S:	Maintained
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


