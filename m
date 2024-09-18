Return-Path: <linux-media+bounces-18374-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A362C97B7AE
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 08:08:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D631B1C236EE
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 06:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067FE170854;
	Wed, 18 Sep 2024 06:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="teAU02WU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B898115C14F;
	Wed, 18 Sep 2024 06:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726639656; cv=none; b=o9OLDxz9IqN2YlVnFN8dLMvKSUe3THrXPq843LzC00qxFj1iB4Vq49kYz4DNIPpSNHWacJQ16+pCU6XkB+f4JYagOOoCn/6L+d/Nex8bJu3MHObgPz9wSZSMt0iLxYRmflViVacntQ+kPXCr2MUoLNsmQyswazwFCqJ2QI1Tu2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726639656; c=relaxed/simple;
	bh=kppESZfBsUInWnhNoLdnkM7msjpMLeO5b9hJTo5bkqU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DhLbmOlUkcNiIDwf3a97hG3lqqQLGJiPUKxoncCMqGkXfLfXxr3kyXG42gmID+RBFdnWCJi87Gf79QIzT8u4BJbTQ9RY38MUW3eNwGnd7KGuIyka7D02kEWRZPqT2W/qtKGVmy18O1IN4TIO7Te9IKx20oQGniB58hTWoY0NjO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=teAU02WU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B13FC4CED7;
	Wed, 18 Sep 2024 06:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726639656;
	bh=kppESZfBsUInWnhNoLdnkM7msjpMLeO5b9hJTo5bkqU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=teAU02WU9fnBG73bfofxI0okOyiYAF4V2qqMePLs12XS/RzAO8jQvpYX0JqnnpXVi
	 F5gBBY5kf9h0z+LntN9fF22tRKYZMdMP/qNA/nQhy6I4aweqWz4Pv6GIMG4OTm5WNl
	 XVIiFYhs3mUJIpgfHV0aGR3eWewj/PqXEjiHqPLRDEfQVfXUNrbsfQX8Bh7BoPhY2x
	 nhhsMSRGrP39rmO7gwLloT+uKVEn4AOZYAz92TT7ls6J2L8E87megjsZUnpXVSnH31
	 8S0hwU1syS+3d6K7k+D6gLL7mw1w9cq1BhrDSg3vofwf/QGauw1NvKIMN59CqBCo5V
	 ayxSNSW9vEJFg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 414FFC3ABB2;
	Wed, 18 Sep 2024 06:07:36 +0000 (UTC)
From: Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>
Date: Wed, 18 Sep 2024 14:07:16 +0800
Subject: [PATCH v3 5/9] dt-bindings: media: Add amlogic,c3-isp.yaml
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240918-c3isp-v3-5-f774a39e6774@amlogic.com>
References: <20240918-c3isp-v3-0-f774a39e6774@amlogic.com>
In-Reply-To: <20240918-c3isp-v3-0-f774a39e6774@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Keke Li <keke.li@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726639635; l=2433;
 i=keke.li@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=6t6d3ae/MzUOlqTRvCXtGy3RhMNxCwUEKczMDIQ1AZ0=;
 b=CsPlkOkXaYTnTgX6WPD25QYJKBXFf9nR4yEosBWioBt4ePjHsB+JLdHb5/n8tnSjqKtW08uBN
 e1snn/ItgUVCYbjRhNt7Mh87Bud2axjJy/PElmRcxUvBTFesdTa+6ph
X-Developer-Key: i=keke.li@amlogic.com; a=ed25519;
 pk=XxNPTsQ0YqMJLLekV456eoKV5gbSlxnViB1k1DhfRmU=
X-Endpoint-Received: by B4 Relay for keke.li@amlogic.com/20240902 with
 auth_id=204
X-Original-From: Keke Li <keke.li@amlogic.com>
Reply-To: keke.li@amlogic.com

From: Keke Li <keke.li@amlogic.com>

c3-isp is used to process raw image.

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
2.46.1



