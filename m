Return-Path: <linux-media+bounces-41226-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E922DB397A8
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 11:00:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EF2D17D9C2
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 09:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 741AE2F6594;
	Thu, 28 Aug 2025 08:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="bJb0VE+L"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61BD2F28F6
	for <linux-media@vger.kernel.org>; Thu, 28 Aug 2025 08:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756371576; cv=none; b=RvTQI8UCFS3OC3Jzm8FTflvOLnyQlVmfBxLXd6335lP+miIweCRtLs+P0hANAUbBYMOkrpOOWF8v1sgA5SsosW7rc3cGgwRdF9x1Pgdm1Y86gEbL6MM5mcFDSwwLuENJjpaxyQjbJgVjjtNi+iqMbVlRwV07f59X/SRstVsvn/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756371576; c=relaxed/simple;
	bh=QBRMX12lgkd2k2KHBbSFK2RcHJBR3Mt0jOEFKQq+tmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=Ezqjs8+Yg8T/+UCcp0iBkELREmgNM399tCb5CksD1vkV9FE+gb3G0b+ImPTpz4wH/2RTD/cHexzibaFEro8iCkxiUdz0H+iSj5YeoDqvhHNxxvdjtKEc5uGeXCAPmu1eLmf3hsEpqaibIrAK4KbnWf6ot4RAOYcpaQ/5eIkdbwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=bJb0VE+L; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250828085933epoutp0420a8cdb7fdac216f1bb1518d9056128f~f4qPdIhVu2436024360epoutp04c
	for <linux-media@vger.kernel.org>; Thu, 28 Aug 2025 08:59:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250828085933epoutp0420a8cdb7fdac216f1bb1518d9056128f~f4qPdIhVu2436024360epoutp04c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756371573;
	bh=XTEfXLQM+A9VUaqsYa0+kOHsGPzuzCyuDiyg7PrGRkI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bJb0VE+LFxbL7o1vASQsDB0UHU+p9VXoi7orhWHXFdgBRjL/mAgmjaDorAUNtZOQ2
	 jwbIleKDa6ZmImqanCLWLPK4ZJlJWUuqA+b5AI71mH1AQuyFWJPpcir+e1DOmIaCz3
	 uFhzi5wk8AnJLdAu3hkUBjL4nOC4unSmAIcctRjQ=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250828085932epcas5p4e09ce768a1e522b1d067b78ba5c19ebd~f4qOvpfmV0476004760epcas5p4R;
	Thu, 28 Aug 2025 08:59:32 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.93]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cCFhM24bmz6B9mK; Thu, 28 Aug
	2025 08:59:31 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250828085930epcas5p1719c7db08074bf1540dc85b71736a6c5~f4qNN7ifM0548005480epcas5p1Y;
	Thu, 28 Aug 2025 08:59:30 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250828085927epsmtip293a425196cb6dc7c30d2f75654487ccd~f4qKkAQCW0306303063epsmtip2V;
	Thu, 28 Aug 2025 08:59:27 +0000 (GMT)
From: Inbaraj E <inbaraj.e@samsung.com>
To: rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com, martink@posteo.de,
	kernel@puri.sm, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: kernel@pengutronix.de, festevam@gmail.com, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
	ravi.patel@samsung.com, shradha.t@samsung.com, Inbaraj E
	<inbaraj.e@samsung.com>
Subject: [PATCH v3 2/7] dt-bindings: media: fsd: Add CSIS video capture
 interface
Date: Thu, 28 Aug 2025 14:29:06 +0530
Message-ID: <20250828085911.81266-3-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250828085911.81266-1-inbaraj.e@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250828085930epcas5p1719c7db08074bf1540dc85b71736a6c5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250828085930epcas5p1719c7db08074bf1540dc85b71736a6c5
References: <20250828085911.81266-1-inbaraj.e@samsung.com>
	<CGME20250828085930epcas5p1719c7db08074bf1540dc85b71736a6c5@epcas5p1.samsung.com>

The Tesla FSD CSIS video capture interface is used to capture frames.

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 .../bindings/media/tesla,fsd-csis-media.yaml  | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/tesla,fsd-csis-media.yaml

diff --git a/Documentation/devicetree/bindings/media/tesla,fsd-csis-media.yaml b/Documentation/devicetree/bindings/media/tesla,fsd-csis-media.yaml
new file mode 100644
index 000000000000..f045094ae539
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/tesla,fsd-csis-media.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/tesla,fsd-csis-media.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tesla FSD SoC MIPI CSI-2 video capture interface(Bridge device).
+
+maintainers:
+  - Inbaraj E <inbaraj.e@samsung.com>
+
+description:
+  The Tesla FSD CSIS has an internal video capture interface to capture
+  frames originating from the sensor. The power supply for the IP is
+  managed by custom firmware and is expected to remain enabled
+  permanently, so power supply control is not added in linux.
+
+properties:
+  compatible:
+    const: tesla,fsd-csis-media
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: pclk
+      - const: pll
+
+  iommus:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - iommus
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/fsd-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    csis0: csis@12641000 {
+        compatible = "tesla,fsd-csis-media";
+        reg = <0x12661000 0x44c>;
+        interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clock_csi CAM_CSI0_0_IPCLKPORT_I_ACLK>,
+                 <&clock_csi CAM_CSI0_0_IPCLKPORT_I_PCLK>,
+                 <&clock_csi CAM_CSI_PLL>;
+        clock-names = "aclk", "pclk", "pll";
+        iommus = <&smmu_isp 0x0 0x0>;
+
+        port {
+            csi_in_0: endpoint {
+                remote-endpoint = <&mipi_csis_0_out>;
+            };
+        };
+    };
+
+...
-- 
2.49.0


