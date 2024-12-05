Return-Path: <linux-media+bounces-22682-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 709E39E50A3
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 10:06:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B73E01882B21
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 09:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B52241DB951;
	Thu,  5 Dec 2024 09:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Guac1R9B"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5009D1D88BF;
	Thu,  5 Dec 2024 09:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733389474; cv=none; b=FLfPClNKRFJ/w34py0h76ThF8Ygd0we/JBqqVZk+VWxr9M8BjubnrpvlbBtVTI5FKTYLCM1Izt6TrnBsXmYQMXMLwJI7fIYo6gfzMhUnC1IGzcH+E3omobZr2lARzneXVAjsL2UBc9azOKxUjOxtIDJT35Ml+SYauJuyTKoCkLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733389474; c=relaxed/simple;
	bh=K9JwnCiAdInDs2D23EDQqd6Opr2sva676Zmh8STjAls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CflePdCIt0yZnupeGPQjvmVWli4NSWGPDN9mjn/W6TJ8TUXqxIvc5hF37xvYxEqS6u5EG0M+NBeuG1eTwjqJkdJDR7iO1YXtTXBF5lYsTeLZvBhDh2J2QDFNhoyIAYtpONfubH+VPgwFyo3SmoTvVmVoGWrg/X/7VhjrxRlpAQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Guac1R9B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8680C4CEEF;
	Thu,  5 Dec 2024 09:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733389473;
	bh=K9JwnCiAdInDs2D23EDQqd6Opr2sva676Zmh8STjAls=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Guac1R9BzcLY3+p5N9owJOPh6qIan9Zp/2SnBM1JeWkFJ/eD3y2Ue49w2ix18SCcE
	 7+ST+ONDMpbSV/QqEJhYu/sr17Z4RXwCtSCwQ3n8HQQpHe6peESbO3QmY8uYHCovCt
	 3O7zJgdFZddZfquJYhtsnZ8tdpYobnKMFolAg3tZGrxjNx6wO0ckdIUsSkz0Mk8DdK
	 F5wRE9n8mQC6BxWTWLkegBzC8rY3sHbepSOsd8qVR1BOxGxAzOHPQdKfseskbBi0st
	 7aacU7FlEJrcYhsXJjZZdZYDCL7wqUUqK9b/rL3t8ldhxNV516gIpYdl8BM7w3TxjW
	 9GKgZBsIX50bw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEEC4E77173;
	Thu,  5 Dec 2024 09:04:33 +0000 (UTC)
From: Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>
Date: Thu, 05 Dec 2024 17:04:31 +0800
Subject: [PATCH v4 05/10] dt-bindings: media: Add amlogic,c3-isp.yaml
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-c3isp-v4-5-cb1868be0105@amlogic.com>
References: <20241205-c3isp-v4-0-cb1868be0105@amlogic.com>
In-Reply-To: <20241205-c3isp-v4-0-cb1868be0105@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Keke Li <keke.li@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733389471; l=2483;
 i=keke.li@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=8AMy+HQGO+uT4cclhhk8EhjTI2Z7v3UJeGdqFbrhxkQ=;
 b=o/VVLm6AftQ8RVJT2qSJTY/9orQwalTFOfwZkLbFOg7sJaSRATSJs8lzPX2JrmPMoaPM56BZe
 Sc1se8MDuN8Aa80Uke7szLUlKJFXmov7T65y6uLFUtd56FvD2N2mm62
X-Developer-Key: i=keke.li@amlogic.com; a=ed25519;
 pk=XxNPTsQ0YqMJLLekV456eoKV5gbSlxnViB1k1DhfRmU=
X-Endpoint-Received: by B4 Relay for keke.li@amlogic.com/20240902 with
 auth_id=204
X-Original-From: Keke Li <keke.li@amlogic.com>
Reply-To: keke.li@amlogic.com

From: Keke Li <keke.li@amlogic.com>

c3-isp is used to process raw image.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Keke Li <keke.li@amlogic.com>
---
 .../devicetree/bindings/media/amlogic,c3-isp.yaml  | 85 ++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml b/Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml
new file mode 100644
index 000000000000..64ae1946b99b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/amlogic,c3-isp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic C3 Image Signal Processing Unit
+
+maintainers:
+  - Keke Li <keke.li@amlogic.com>
+
+description:
+  Amlogic ISP is the RAW image processing module
+  and supports three channels image output.
+
+properties:
+  compatible:
+    enum:
+      - amlogic,c3-isp
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    items:
+      - const: isp
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: vapb
+      - const: isp0
+
+  interrupts:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: input port node.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - power-domains
+  - clocks
+  - clock-names
+  - interrupts
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/amlogic,c3-peripherals-clkc.h>
+    #include <dt-bindings/power/amlogic,c3-pwrc.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp: isp@ff000000 {
+            compatible = "amlogic,c3-isp";
+            reg = <0x0 0xff000000 0x0 0xf000>;
+            reg-names = "isp";
+            power-domains = <&pwrc PWRC_C3_ISP_TOP_ID>;
+            clocks = <&clkc_periphs CLKID_VAPB>,
+                     <&clkc_periphs CLKID_ISP0>;
+            clock-names = "vapb", "isp0";
+            interrupts = <GIC_SPI 145 IRQ_TYPE_EDGE_RISING>;
+
+            port {
+                c3_isp_in: endpoint {
+                    remote-endpoint = <&c3_adap_out>;
+                };
+            };
+        };
+    };
+...

-- 
2.47.0



