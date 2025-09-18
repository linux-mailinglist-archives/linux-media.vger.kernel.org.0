Return-Path: <linux-media+bounces-40467-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F41B2E348
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 19:18:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A37F15E4FD7
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 17:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 776163375C8;
	Wed, 20 Aug 2025 17:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="Zv9peki7"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03160183CA6;
	Wed, 20 Aug 2025 17:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755710119; cv=pass; b=cgzrYnNnhbN9E2w+5DZsxfGGbu+yTKmsI92LqtfnjqGv+tg4vCNSlTMQiRRjEJOxe/tkM2BzdUGe3S3DZrFd6rfui4iuMY69zyy5E++vzPaM1H+iPuHrJFYMYV7jbpPrMqHNwoacgiKZqhBUNEpwgIT8ms6HZu4HkybLMxnf7Hg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755710119; c=relaxed/simple;
	bh=3IQ7DlfQ4S5KQVBBy8u9i3noXWU9AWiFXGwuNB0NvMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rGUGnj7/Dhj+dUAiVm7LCKamzf2i80PiO5Rpj80h5f87H1L6fUT56hHPZqrOXtfTXrXfW+U8yZw5SDEizzzONWnHGtryx6HMIygnpESKOFPBImuImp3E+5Jj5TedVmjlWT32pCSbpUuUc84LHS2TyuS3Hy/DEK4sVKjvnfAlXZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b=Zv9peki7; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1755710071; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Fgv0vo/4eTvYLTGrBunN6RbBFVH2GgZpaujpINNTNWhAD8sUN9k9XiWFjf9/oV1QdpvVcm365Us3h7wMnQRMCGDcpKEwA/QGvYaZ3wVy/igeMJMQ+RlLdNS46LA0RTa2APgveu9iFdJriVmC5qV763zBPO7ustSz0oK/YMHOJHI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755710071; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8+yBHmbqr/zZLRoIg2NnwJrRTTjtfuQblJe79SXBYYA=; 
	b=ixtSgrnxyfbyySBmTna4NESFslrWqAoCAN8SZ2G7vsOGHda2Zavnnqbt56lKdEvRMM2si7YWjqQ/Rxy3oGG8rrtIOBKW5w6+epTqH66ec+t+xo2BjmrDQzJGWTpanv9lbSwtCKtHER3zCC84xUub/ALnQ009G5JTrGzAZiDLVt8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755710071;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=8+yBHmbqr/zZLRoIg2NnwJrRTTjtfuQblJe79SXBYYA=;
	b=Zv9peki7NdiBdhWaFokdbnOjwGygIkr21fheSYJNmrWFXlvA3so7V08PtDYDRnF7
	lWYT04DqtSe3+QftlrGoyWgWQL5vRN1Dk0PbyZ0JtV350EyXhZGy40DguzISCH/4CNV
	ygan79017OsncnA7JqtNQXaS5hksn5RGHSo4DuB8=
Received: by mx.zohomail.com with SMTPS id 1755710069122260.91788975203167;
	Wed, 20 Aug 2025 10:14:29 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: airlied@gmail.com,
	amergnat@baylibre.com,
	andrew+netdev@lunn.ch,
	andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	ariel.dalessandro@collabora.com,
	broonie@kernel.org,
	chunkuang.hu@kernel.org,
	ck.hu@mediatek.com,
	conor+dt@kernel.org,
	davem@davemloft.net,
	dmitry.torokhov@gmail.com,
	edumazet@google.com,
	flora.fu@mediatek.com,
	houlong.wei@mediatek.com,
	jeesw@melfas.com,
	jmassot@collabora.com,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	kuba@kernel.org,
	kyrie.wu@mediatek.corp-partner.google.com,
	lgirdwood@gmail.com,
	linus.walleij@linaro.org,
	louisalexis.eyraud@collabora.com,
	maarten.lankhorst@linux.intel.com,
	matthias.bgg@gmail.com,
	mchehab@kernel.org,
	minghsiu.tsai@mediatek.com,
	mripard@kernel.org,
	p.zabel@pengutronix.de,
	pabeni@redhat.com,
	robh@kernel.org,
	sean.wang@kernel.org,
	simona@ffwll.ch,
	support.opensource@diasemi.com,
	tiffany.lin@mediatek.com,
	tzimmermann@suse.de,
	yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-sound@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v1 02/14] media: dt-bindings: Convert MediaTek mt8173-vpu bindings to YAML
Date: Wed, 20 Aug 2025 14:12:50 -0300
Message-ID: <20250820171302.324142-3-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Convert the existing text-based DT bindings for Mediatek MT8173 Video Processor
Unit to a YAML schema.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 .../bindings/media/mediatek,mt8173-vpu.yaml   | 76 +++++++++++++++++++
 .../bindings/media/mediatek-vpu.txt           | 31 --------
 2 files changed, 76 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-vpu.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/mediatek-vpu.txt

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8173-vpu.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8173-vpu.yaml
new file mode 100644
index 0000000000000..44f5d7cc44042
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8173-vpu.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mt8173-vpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT8173 Video Processor Unit
+
+maintainers:
+  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
+
+description:
+  Video Processor Unit is a HW video controller. It controls HW Codec including
+  H.264/VP8/VP9 Decode, H.264/VP8 Encode and Image Processor (scale/rotate/color convert).
+
+properties:
+  compatible:
+    const: mediatek,mt8173-vpu
+
+  reg:
+    minItems: 2
+
+  reg-names:
+    items:
+      - const: tcm
+      - const: cfg_reg
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: main
+
+  memory-region:
+    description:
+      phandle to a node describing reserved memory used by VPU
+      (see bindings/reserved-memory/reserved-memory.txt)
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+  - clock-names
+  - memory-region
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        vpu: vpu@10020000 {
+            compatible = "mediatek,mt8173-vpu";
+            reg = <0 0x10020000 0 0x30000>,
+                  <0 0x10050000 0 0x100>;
+            reg-names = "tcm", "cfg_reg";
+            interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&topckgen CLK_TOP_SCP_SEL>;
+            clock-names = "main";
+            memory-region = <&vpu_dma_reserved>;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/media/mediatek-vpu.txt b/Documentation/devicetree/bindings/media/mediatek-vpu.txt
deleted file mode 100644
index 2a5bac37f9a22..0000000000000
--- a/Documentation/devicetree/bindings/media/mediatek-vpu.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-* Mediatek Video Processor Unit
-
-Video Processor Unit is a HW video controller. It controls HW Codec including
-H.264/VP8/VP9 Decode, H.264/VP8 Encode and Image Processor (scale/rotate/color convert).
-
-Required properties:
-  - compatible: "mediatek,mt8173-vpu"
-  - reg: Must contain an entry for each entry in reg-names.
-  - reg-names: Must include the following entries:
-    "tcm": tcm base
-    "cfg_reg": Main configuration registers base
-  - interrupts: interrupt number to the cpu.
-  - clocks : clock name from clock manager
-  - clock-names: must be main. It is the main clock of VPU
-
-Optional properties:
-  - memory-region: phandle to a node describing memory (see
-    Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt)
-    to be used for VPU extended memory; if not present, VPU may be located
-    anywhere in the memory
-
-Example:
-	vpu: vpu@10020000 {
-		compatible = "mediatek,mt8173-vpu";
-		reg = <0 0x10020000 0 0x30000>,
-		      <0 0x10050000 0 0x100>;
-		reg-names = "tcm", "cfg_reg";
-		interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&topckgen TOP_SCP_SEL>;
-		clock-names = "main";
-	};
-- 
2.50.1


