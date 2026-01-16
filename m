Return-Path: <linux-media+bounces-50827-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92754D2CE88
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 08:07:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8DE2A30123C3
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 07:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E5734F47A;
	Fri, 16 Jan 2026 07:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pV+aXBft"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37AA34F47C;
	Fri, 16 Jan 2026 07:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768547258; cv=none; b=ihnalvu0ZS8MkU05f+AbMk9iJ8ZU+2THIQ91bqKA0p4CGDGq90DWLaxeTcdH+zj6d5lFFVYFqgK5bQP0baQ8+tFzIGc392pkFBRv0oQJnRGQPL+Wf8GLeaqoAZItTjSyJR8DU7OGs7KkMB9QPeyGxgqo7vdMC9Qi+FJA8fET74I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768547258; c=relaxed/simple;
	bh=WSemT60HS/833PD/J7h1I0a2h/1auGvt1uPtHCAASvQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sHPClqV4cTM7tebNVzVAA7AS0WCpGWe0OrWenBRoWHDhB5NoRVPRp7t1fCGQrkomgd5TGCLuXId5FdKXV56spQMf38Zfbw6X8+NhOyWqdoGjPOH5LmdKaQE5/koCCrrxfBN/dp3OWotPN8HFeWu8gkq4Yh9WiuijX4yza6qtj6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pV+aXBft; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c31:76ee:df3c:dc54:9316:8c06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8524B594;
	Fri, 16 Jan 2026 08:06:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768547214;
	bh=WSemT60HS/833PD/J7h1I0a2h/1auGvt1uPtHCAASvQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pV+aXBft6mFAS/nQ3U/PIXRUMAHj8iuDKlNBYWfQ/YytfHV/9iQ6+fAf+VcwxpkqV
	 DELqKa0kqCE7KdEJLQu5cGeBvZURG5LXaKfuXHAmae22wRa7a/liJ+XL3zDFU2xhcX
	 go0BSD9+flKimOr6jYg7n5OLat8p5E3Jc9mc3rLY=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 16 Jan 2026 12:36:58 +0530
Subject: [PATCH v2 1/2] media: dt-bindings: Drop starfive,jh7110-camss from
 staging
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-drop-starfive-camss-v2-1-34df57025921@ideasonboard.com>
References: <20260116-drop-starfive-camss-v2-0-34df57025921@ideasonboard.com>
In-Reply-To: <20260116-drop-starfive-camss-v2-0-34df57025921@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6014;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=WSemT60HS/833PD/J7h1I0a2h/1auGvt1uPtHCAASvQ=;
 b=owEBbAKT/ZANAwAKAUPekfkkmnFFAcsmYgBpaeOeqPTvP9pZkE9ioWwPH7MLV1eA7s2RxBUiK
 w7Oi7sEUp+JAjIEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaWnjngAKCRBD3pH5JJpx
 RQUGD/jHcTgdj/bkVOAfgXFGCrJao8kJd0c4D2eCdwQPZap8WjqChe5zhlUYNsIoFCEqywBeggA
 aGcyO6wN+/lU3UZzXgkcPCxk/SB1L/XdF4TsmbYOvX/wmKabvopz91o6mJZqOYyT5995ST8mNmW
 q48HZBDhGgUSn66ZuF9MWnNE5VDiGKMHKeLK+pReUyRzKjERrrofGKl9wi1jRVNUhyNW+XYbQo7
 LPp0pTZuaao+o0wr6z/qCUvjJ1fV0hWjcGkEiVcZkCpM3xknljCO28lRGzHoV0Srd2L8gjUGAT7
 5ZjKMftYj6ImxOnSQSomrRDPZ7HgSvdfRrKlGVi6s+4fRKzUmj2dCtwvu+ls42rwvII89+N7FX4
 uMryRHR8RhegwW6YFqfAwGbw2NULZz++pUDmcZ31uGuvdmo4w8SlmmmBZsBWWendf4QadKiMusf
 L5uTd/IgTcPVB1Ju3Tthj7f+GkGEzPaNPmK3/APGkUulh/9jmOqRJ6a+d04tfpBmeGlJanRSsQf
 ROviSqFQ5UyZ3icYPF0me4H9tAf06cE8drvwvu4lDDxamoO37jXoEWK3wAQcPQHEVRkLuCJsD2Q
 knIVJfohyRQt75NxW9/5XDX0a43LmVK7NZyHSOjyxet3Jc3Vbf+f/zgla32/RnE0qQIUdHO4X3r
 HQuEnpsm3S0nL
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The starfive-camss driver is no longer being worked upon for destaging,
and will be dropped in a subsequent commit, so drop the DT bindings.

Link: https://lore.kernel.org/all/ZQ0PR01MB13024A92926C415C187D2C18F29F2@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn/
Acked-by: Changhuang Liang <changhuang.liang@starfivetech.com>
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


