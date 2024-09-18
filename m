Return-Path: <linux-media+bounces-18372-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D0497B7AB
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 08:08:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CC69284996
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 06:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C2B16D30B;
	Wed, 18 Sep 2024 06:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KoON7lRh"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861F214A0B8;
	Wed, 18 Sep 2024 06:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726639656; cv=none; b=u4lEWaM6gzgbSbaT4iV7KBUPCbcA/DQQCtOyzN1rBbhxmq6EeZ/vX2XozZFi/Ek8jwTy214FDxTLKHYGZerWyJcURWQV+unGkh+mTbNQZzk1VP5uZdSmLPLK+8AkiOzrz43WNe5Rfv9LvrMOV+x0IMT1/luMAXHwDgakw10B3no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726639656; c=relaxed/simple;
	bh=taiPwo/5rp14b+pe9AH9/ntG2kGPWEXKzxmnSHfAD10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PI4tUPJST5k/MiaWOAXP6QYOh1CwVOdQDtKtG1MQOGw9LEhnYwygwjTVfhUOyzghTfxZ2k8iL2EPTpbvYEsYifmRj+I8FN2JEsfr1wsqoe8EFU/5NEVXk4FVf8EDp9o349ZJ7JCFcigU5gu+a0WApZhrAfDB8pOldOIl1hTOhGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KoON7lRh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26959C4CECD;
	Wed, 18 Sep 2024 06:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726639656;
	bh=taiPwo/5rp14b+pe9AH9/ntG2kGPWEXKzxmnSHfAD10=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KoON7lRh/WcLVzkQX+X+vSpQyGGvvfusyHMjjiLKPAoawXrFFwSLXJrj6/mdt0hqw
	 WOuaouw+91SHUjJb1uRqWVLo58MB8y8bgx9ViR3j3unaYOg3IvSMa7Gvd56iDIRdsO
	 YU8FqcgzAtK9JacFwLLJk9Yle58gdqlINT+KYVFlrY1+A6MsmjzPh77OK/CM+o6Lqc
	 gnWkTyKwfXpTwKfzDIvA3nCWLRoJUjxn2I7ypWXTDGefReSPcPEUNlhweauUtmYGgy
	 EdweEw6bMIRoUtl8uZAefM5ynSDD0C+ebo8e/N1uxj6oBEF+TZAPrEMLEn6kF+zvjT
	 9vNudJvpGlt1w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A3AAC3600F;
	Wed, 18 Sep 2024 06:07:36 +0000 (UTC)
From: Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>
Date: Wed, 18 Sep 2024 14:07:14 +0800
Subject: [PATCH v3 3/9] dt-bindings: media: Add
 amlogic,c3-mipi-adapter.yaml
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240918-c3isp-v3-3-f774a39e6774@amlogic.com>
References: <20240918-c3isp-v3-0-f774a39e6774@amlogic.com>
In-Reply-To: <20240918-c3isp-v3-0-f774a39e6774@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Keke Li <keke.li@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726639635; l=3217;
 i=keke.li@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=M15y/KY2ciR/aOCQ6H8VpsEywY52oYEbCP67gjniwV8=;
 b=Sd7to8PxEgmFhTyjyyxPG8fpsz5H7faHdofkN/6d2iFgI3DRWZ1Q5UBUccqptRnLGal6Rm8es
 RAuw2lGK8t8AGRwLiG5YEejWaNYdEB12fCTzUhV1tOIO31tBNO+Gbp8
X-Developer-Key: i=keke.li@amlogic.com; a=ed25519;
 pk=XxNPTsQ0YqMJLLekV456eoKV5gbSlxnViB1k1DhfRmU=
X-Endpoint-Received: by B4 Relay for keke.li@amlogic.com/20240902 with
 auth_id=204
X-Original-From: Keke Li <keke.li@amlogic.com>
Reply-To: keke.li@amlogic.com

From: Keke Li <keke.li@amlogic.com>

c3-mipi-adapter is used to organize mipi data and
send raw data to ISP module.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Keke Li <keke.li@amlogic.com>
---
 .../bindings/media/amlogic,c3-mipi-adapter.yaml    | 108 +++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml
new file mode 100644
index 000000000000..d900ff9df61b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/amlogic,c3-mipi-adapter.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic C3 MIPI adapter receiver
+
+maintainers:
+  - Keke Li <keke.li@amlogic.com>
+
+description:
+  MIPI adapter is used to convert the MIPI CSI-2 data
+  into an ISP supported data format.
+
+properties:
+  compatible:
+    enum:
+      - amlogic,c3-mipi-adapter
+
+  reg:
+    maxItems: 3
+
+  reg-names:
+    items:
+      - const: top
+      - const: fd
+      - const: rd
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
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: input port node.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: output port node.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - power-domains
+  - clocks
+  - clock-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/amlogic,c3-peripherals-clkc.h>
+    #include <dt-bindings/power/amlogic,c3-pwrc.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        adap: adap@ff010000 {
+            compatible = "amlogic,c3-mipi-adapter";
+            reg = <0x0 0xff010000 0x0 0x100>,
+                  <0x0 0xff01b000 0x0 0x100>,
+                  <0x0 0xff01d000 0x0 0x200>;
+            reg-names = "top", "fd", "rd";
+            power-domains = <&pwrc PWRC_C3_ISP_TOP_ID>;
+            clocks = <&clkc_periphs CLKID_VAPB>,
+                     <&clkc_periphs CLKID_ISP0>;
+            clock-names = "vapb", "isp0";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    c3_adap_in: endpoint {
+                        remote-endpoint = <&c3_mipi_csi_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    c3_adap_out: endpoint {
+                        remote-endpoint = <&c3_isp_in>;
+                    };
+                };
+            };
+        };
+    };
+...

-- 
2.46.1



