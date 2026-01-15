Return-Path: <linux-media+bounces-50750-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0C0D22C48
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 08:17:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7FBC3133A96
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 07:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 275F3326955;
	Thu, 15 Jan 2026 07:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Aonpp5KJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8253D1E5207;
	Thu, 15 Jan 2026 07:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768461160; cv=none; b=kMTYEb/GBzGRYuB1n+USc7z/w8YiLjTS1ftf51zmar8x71NuZFftBHrd7+X2Q2Zh42ithry1trS3HdcbqnEXU0jAl6PB/vsyPG0GpA0XKl+UEK75/iJYAyS0zQYefVVJWZvfpT6EW6lK6vfilyn+dlV8puoqgM6sD9uIIyDlyPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768461160; c=relaxed/simple;
	bh=OEOvCGe4KvM/7pSexp6VTHEAxHFKOSc7/1S9+LdSjyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NlspSP4WgwDKpbrdtStnG7zBzjdmqC86XWSC/FFOC50RL7G95mHQsL+bOoGuivOQ1OvPqYI5WI7XVdhU3Zl/DUBLkOEPSe+z0FN7Sut7jVQP6W0atsvV1srdDzmcfbXTQnL77c+N5eL4xrKVDChWJ5C+HEWctrUc2pfP5L361Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Aonpp5KJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c31:76ee:df3c:dc54:9316:8c06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1771289A;
	Thu, 15 Jan 2026 08:12:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768461124;
	bh=OEOvCGe4KvM/7pSexp6VTHEAxHFKOSc7/1S9+LdSjyw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Aonpp5KJ3E08Q6gira7ifDfHZp43iDq0xFh6scQlCtfgiqEzCbpgLa8MJqwOzGnk+
	 F86RdpajSfmzmFIBssIUQMLbvBgy7CiDjQoq4tLmE9meijFtk5RY/qOvBfgRsDXak0
	 bJn5M9tFCBbAZo/Wee2LkYvzOLC9SNBBvvGbRAeA=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 15 Jan 2026 12:41:48 +0530
Subject: [PATCH 1/2] media: dt-bindings: Drop starfive,jh7110-camss from
 staging
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-drop-starfive-camss-v1-1-27550e7a9815@ideasonboard.com>
References: <20260115-drop-starfive-camss-v1-0-27550e7a9815@ideasonboard.com>
In-Reply-To: <20260115-drop-starfive-camss-v1-0-27550e7a9815@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Rishikesh Donadkar <r-donadkar@ti.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5950;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=OEOvCGe4KvM/7pSexp6VTHEAxHFKOSc7/1S9+LdSjyw=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpaJNTjF30v/2QK3pWbvbNZ7vePDeKIsnsRaEYt
 X5KJHRhFE2JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaWiTUwAKCRBD3pH5JJpx
 RWetD/sHsIszIr4qztJSwqwL5gI7mPaDLo507AcRchpBpEZhZYoRbuysVGEFAVyYQzWYl7cfzKC
 RwVuyVt9zQga4Aa3w0jX9hXjWjCoQQ/CQwBMgCxuh1LiejgSiWDZ2s3TxVGKtfA4BkwazS1Sv1a
 zWrSIVj7DiI2VG/m1LEwlmK3/0LxowKD4EZwFBazkR2ETbpkYvGFyOSlLDpvqeGow3mfufz5G6h
 QfVl0GqrvefI/ytUpdEisCz2BB+XGMCZYz5uAN0aLmpHCkmS02q5sNmWp0sPlngabInmdkFo0+I
 nVmNMFJGg4EFfzTu924DqtTUmCmXRtHkPgj68WbxCH5PkUFrTnLb0/BIB0gp4J3Ij8+YXOD1tXR
 1QQ1bKwNxQ9/ElRGdl97bohqZhGepESjBGqg5ScNYiPLswkIuCUiNJ3xBQSuddY1REbUtvZEL0T
 0TCAwtHl7X19gYOX7QwbFbp0OnhDWQE1iJFTLot1ez8BKOdBm/zvQXNa1p51TSHxbwRMmKs1Zge
 Xw/DlXo9rb9gZjiYnUZgW0GRIvL9tevXlUQur30Cs6CBYVE99vihG8sR0LPLqy7hJ2AfbMszN1K
 zY608d0x5XLw1DIKp7Dxna633YbluN6l2Dl/ixY+UHp/MxjM1EImBkynpo+uy+7XZ2CG3Hq+49V
 4V3ekDjEEuYaxHA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The starfive-camss driver is no longer being worked upon for destaging,
and will be dropped in a subsequent commit, so drop the DT bindings.

Link: https://lore.kernel.org/all/ZQ0PR01MB13024A92926C415C187D2C18F29F2@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn/
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 .../bindings/media/starfive,jh7110-camss.yaml      | 180 ---------------------
 MAINTAINERS                                        |   1 -
 2 files changed, 181 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml b/Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml
deleted file mode 100644
index c66586d90fa2b4199da758d9dd4ae470e24fda91..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml
+++ /dev/null
@@ -1,180 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/media/starfive,jh7110-camss.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Starfive SoC CAMSS ISP
-
-maintainers:
-  - Jack Zhu <jack.zhu@starfivetech.com>
-  - Changhuang Liang <changhuang.liang@starfivetech.com>
-
-description:
-  The Starfive CAMSS ISP is a Camera interface for Starfive JH7110 SoC. It
-  consists of a VIN controller (Video In Controller, a top-level control unit)
-  and an ISP.
-
-properties:
-  compatible:
-    const: starfive,jh7110-camss
-
-  reg:
-    maxItems: 2
-
-  reg-names:
-    items:
-      - const: syscon
-      - const: isp
-
-  clocks:
-    maxItems: 7
-
-  clock-names:
-    items:
-      - const: apb_func
-      - const: wrapper_clk_c
-      - const: dvp_inv
-      - const: axiwr
-      - const: mipi_rx0_pxl
-      - const: ispcore_2x
-      - const: isp_axi
-
-  resets:
-    maxItems: 6
-
-  reset-names:
-    items:
-      - const: wrapper_p
-      - const: wrapper_c
-      - const: axird
-      - const: axiwr
-      - const: isp_top_n
-      - const: isp_top_axi
-
-  power-domains:
-    items:
-      - description: JH7110 ISP Power Domain Switch Controller.
-
-  interrupts:
-    maxItems: 4
-
-  ports:
-    $ref: /schemas/graph.yaml#/properties/ports
-
-    properties:
-      port@0:
-        $ref: /schemas/graph.yaml#/$defs/port-base
-        unevaluatedProperties: false
-        description: Input port for receiving DVP data.
-
-        properties:
-          endpoint:
-            $ref: video-interfaces.yaml#
-            unevaluatedProperties: false
-
-            properties:
-              bus-type:
-                enum: [5, 6]
-
-              bus-width:
-                enum: [8, 10, 12]
-
-              data-shift:
-                enum: [0, 2]
-                default: 0
-
-              hsync-active:
-                enum: [0, 1]
-                default: 1
-
-              vsync-active:
-                enum: [0, 1]
-                default: 1
-
-            required:
-              - bus-type
-              - bus-width
-
-      port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: Input port for receiving CSI data.
-
-    required:
-      - port@0
-      - port@1
-
-required:
-  - compatible
-  - reg
-  - reg-names
-  - clocks
-  - clock-names
-  - resets
-  - reset-names
-  - power-domains
-  - interrupts
-  - ports
-
-additionalProperties: false
-
-examples:
-  - |
-    isp@19840000 {
-        compatible = "starfive,jh7110-camss";
-        reg = <0x19840000 0x10000>,
-              <0x19870000 0x30000>;
-        reg-names = "syscon", "isp";
-        clocks = <&ispcrg 0>,
-                 <&ispcrg 13>,
-                 <&ispcrg 2>,
-                 <&ispcrg 12>,
-                 <&ispcrg 1>,
-                 <&syscrg 51>,
-                 <&syscrg 52>;
-        clock-names = "apb_func",
-                      "wrapper_clk_c",
-                      "dvp_inv",
-                      "axiwr",
-                      "mipi_rx0_pxl",
-                      "ispcore_2x",
-                      "isp_axi";
-        resets = <&ispcrg 0>,
-                 <&ispcrg 1>,
-                 <&ispcrg 10>,
-                 <&ispcrg 11>,
-                 <&syscrg 41>,
-                 <&syscrg 42>;
-        reset-names = "wrapper_p",
-                      "wrapper_c",
-                      "axird",
-                      "axiwr",
-                      "isp_top_n",
-                      "isp_top_axi";
-        power-domains = <&pwrc 5>;
-        interrupts = <92>, <87>, <88>, <90>;
-
-        ports {
-            #address-cells = <1>;
-            #size-cells = <0>;
-            port@0 {
-                reg = <0>;
-                vin_from_sc2235: endpoint {
-                    remote-endpoint = <&sc2235_to_vin>;
-                    bus-type = <5>;
-                    bus-width = <8>;
-                    data-shift = <2>;
-                    hsync-active = <1>;
-                    vsync-active = <0>;
-                    pclk-sample = <1>;
-                };
-            };
-
-            port@1 {
-                reg = <1>;
-                vin_from_csi2rx: endpoint {
-                    remote-endpoint = <&csi2rx_to_vin>;
-                };
-            };
-        };
-    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9de1e9e43f63787578edd8c429ca39..5e19700e9152b103c194003b4421e6bc26022608 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24853,7 +24853,6 @@ M:	Changhuang Liang <changhuang.liang@starfivetech.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/admin-guide/media/starfive_camss.rst
-F:	Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml
 F:	drivers/staging/media/starfive/camss
 
 STARFIVE CRYPTO DRIVER

-- 
2.52.0


