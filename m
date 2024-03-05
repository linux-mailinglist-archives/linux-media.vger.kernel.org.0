Return-Path: <linux-media+bounces-6485-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 133AD8724C3
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 17:49:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45CA81C22043
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 16:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C56125C9;
	Tue,  5 Mar 2024 16:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="U9kQXNiP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C2ADDB3;
	Tue,  5 Mar 2024 16:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709657336; cv=none; b=ND4rvU6QY2/SNqBhN2Ol4rtYwu8JF6TckzrLn9X/kSZLsk/Lbzanbq0sOXuZELlbcxoqylms9Dk8ayY9RC5ldG6SR89jb/nQojsOJWCrOnNChjNu48lSExR8WCJQhOwySMrwrVt4/J5RrYAiMlzx7PF17Q/XOWsDZTE+NwqeIQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709657336; c=relaxed/simple;
	bh=9n7tse+ABMPiGBNv82znNtq2hephNM0zu9JJO45b9BU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NK1IApoyT/jTI9LlXCCf5RIcnB7+OH58mzofxhhGA8MW3/GLBpGDwQcdX+76RI2kJUHHDkMRxipbSJaobFfT3iEhYDk6iBrttGwcPDm9XLPiKIHMBar1Pp5Fn8J24XNltIPreiKM3xbg8Re4nsp5PkW92qRsTKT7JNakhrIvINs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=U9kQXNiP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D6A1CC8;
	Tue,  5 Mar 2024 17:48:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709657314;
	bh=9n7tse+ABMPiGBNv82znNtq2hephNM0zu9JJO45b9BU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U9kQXNiPASNz8L2IPlfv3/fdTnee5evyaO/40UhSZmdIugxNRCeCb69RqEn0vA1XW
	 cxzvdMg/bwTYsZEYXpvviXFjYZF+gScUAZxQsP/pQ3/jWIeYGgagwXGM6Ni0HZ/VKx
	 mPc7BRTOAw6xeYFmvremIhrAjCpUKoGacT1mA+CA=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com,
	robh+dt@kernel.org,
	mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	jerome.forissier@linaro.org,
	kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v3 2/5] dt-bindings: media: Add bindings for ARM mali-c55
Date: Tue,  5 Mar 2024 16:48:29 +0000
Message-Id: <20240305164832.2055437-3-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240305164832.2055437-1-dan.scally@ideasonboard.com>
References: <20240305164832.2055437-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the yaml binding for ARM's Mali-C55 Image Signal Processor.

Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v3:

	- Dropped the video clock as suggested by Laurent. I didn't retain it
	for the purposes of the refcount since this driver will call .s_stream()
	for the sensor driver which will refcount the clock anyway.
	- Clarified that the port is a parallel input port rather (Sakari)

Changes in v2:

	- Added clocks information
	- Fixed the warnings raised by Rob

 .../bindings/media/arm,mali-c55.yaml          | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/arm,mali-c55.yaml

diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
new file mode 100644
index 000000000000..b9fd6ef3ed54
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/arm,mali-c55.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Mali-C55 Image Signal Processor
+
+maintainers:
+  - Daniel Scally <dan.scally@ideasonboard.com>
+  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
+
+properties:
+  compatible:
+    const: arm,mali-c55
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: ISP AXI clock
+      - description: ISP AHB-lite clock
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: hclk
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input parallel video bus
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/properties/endpoint
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    mali_c55: isp@400000 {
+      compatible = "arm,mali-c55";
+      reg = <0x400000 0x200000>;
+      clocks = <&clk 0>, <&clk 1>;
+      clock-names = "aclk", "hclk";
+      interrupts = <0>;
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+          reg = <0>;
+          isp_in: endpoint {
+              remote-endpoint = <&csi2_rx_out>;
+          };
+        };
+      };
+    };
+...
-- 
2.34.1


