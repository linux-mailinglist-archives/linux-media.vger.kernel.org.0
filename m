Return-Path: <linux-media+bounces-12571-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA448FC97B
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 12:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54F0228384C
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 10:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5748192B62;
	Wed,  5 Jun 2024 10:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="keGR34Ie"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B5A18C348;
	Wed,  5 Jun 2024 10:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717585001; cv=none; b=ALYYVm1Dc/c24mmoJN+OLFC/eJ3E8HPGXGjT0y3P+hR01uKvDTIc3PwNCnJgwNdu8afPG7gZjniKzVO00fqAtbKOK35URgBmlprurVEtFEsmx3iQmhQN2I+fZyPdHguso09d4h0cpTtrrlAld6EISsSNTcpEj3gss9uPM86NbOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717585001; c=relaxed/simple;
	bh=2nw5Xtm7cIN1uHUJogZWH19Z+z0DaYr7S/ryJVawOZ8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SgaFEm7GxGmHg7KJxzAOgfm+t/9hXQtqq6w2pG7uPBVXyR+fNzo2E2wPgv2kVHhEBOqQbd55TBoVQo0Oe8ozSj114TRxsY0MX/NTlXoyF+zQAdzB7Ghd0JQQXHoUgmxvuo5MaQYmdLYcBrX8k2f7QUF7TGBpDtuX5BCQeaKvgj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=keGR34Ie; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 45f740f8232a11efbace61486a71fe2b-20240605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=fb26AgPNd4BL3KfUcuJ1Y43xEbUdYBkw2/OmhV6m3VQ=;
	b=keGR34IeooZpwGkD+Caw2N8hmoyeLAjwUjh7S7IOh9FI7YBLwIkufLBdiR9gaDrOW7J2KyDS40XvJa/bYIVRdPyu0WqXNDhKQt0rib54/oEHfQnJpuVZc4UPQl9Br3RHSDxpTvw8GC0Y5p2ZLpCCKTyMMRVW0WgxfScJNmGsqkw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:7de8265b-62c5-48e6-8c95-e7efc203956e,IP:0,U
	RL:25,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:69c8a593-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 45f740f8232a11efbace61486a71fe2b-20240605
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <zhi.mao@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 128097778; Wed, 05 Jun 2024 18:56:34 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 5 Jun 2024 18:56:31 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 5 Jun 2024 18:56:30 +0800
From: Zhi Mao <zhi.mao@mediatek.com>
To: <mchehab@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <sakari.ailus@linux.intel.com>
CC: <laurent.pinchart@ideasonboard.com>, <shengnan.wang@mediatek.com>,
	<yaya.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <yunkec@chromium.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <jacopo.mondi@ideasonboard.com>,
	<zhi.mao@mediatek.com>, <10572168@qq.com>, <hverkuil-cisco@xs4all.nl>,
	<heiko@sntech.de>, <jernej.skrabec@gmail.com>, <macromorgan@hotmail.com>,
	<linus.walleij@linaro.org>, <hdegoede@redhat.com>,
	<tomi.valkeinen@ideasonboard.com>, <gerald.loacker@wolfvision.net>,
	<andy.shevchenko@gmail.com>, <bingbu.cao@intel.com>,
	<dan.scally@ideasonboard.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/3] media: dt-bindings: i2c: add GalaxyCore GC05A2 image sensor
Date: Wed, 5 Jun 2024 18:55:38 +0800
Message-ID: <20240605105540.17937-2-zhi.mao@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240605105540.17937-1-zhi.mao@mediatek.com>
References: <20240605105540.17937-1-zhi.mao@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.694300-8.000000
X-TMASE-MatchedRID: +k55+NgUc6auhCBFl/b63mNW0DAjL5p++OI6XsK3BWHfUZT83lbkEEd0
	Rzx07LDV96TYN1fO8g6y9AsAxk+TJQAwGIAo3Shb71Wx2uUbPLdbAoaK+wS4jee+ZCR6qEmPGAg
	eo2y7APIP/Y2o61xSj9FJTP+oKoX59GlJz+74uGzr/EBmiNuXt/ZCh7IN8a4A5vn0qvY6UyajxY
	yRBa/qJV/Hpl/zcOjl5MIx11wv+CPKayT/BQTiGpmUbUziM6CAz/vewFNwGkYrRBmEoUL45+82j
	05Yv7FAgtx5V6mhri+3PqqUxLGdNGUPC3MufmSvhKsq3EUGXry7PFN22SEG4a6c9X2DKLPd82Gj
	2QC3yG0smXVK/H8eHzG7sr7xobSAsPEFD+rZA81DDKa3G4nrLQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.694300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	99AE71AD0B0DA4A7801071FA0DD349A8416C49F4C085F314C2FB0CA500FD13592000:8
X-MTK: N

Add YAML device tree binding for GC05A2 CMOS image sensor,
and the relevant MAINTAINERS entries.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>
---
 .../bindings/media/i2c/galaxycore,gc05a2.yaml | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml
new file mode 100644
index 000000000000..0e7a7b5ac89f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2023 MediaTek Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/galaxycore,gc05a2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GalaxyCore gc05a2 1/5" 5M Pixel MIPI CSI-2 sensor
+
+maintainers:
+  - Zhi Mao <zhi.mao@mediatek.com>
+
+description:
+  The gc05a2 is a raw image sensor with an MIPI CSI-2 image data
+  interface and CCI (I2C compatible) control bus. The output format
+  is raw Bayer.
+
+properties:
+  compatible:
+    const: galaxycore,gc05a2
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  dovdd-supply: true
+
+  avdd-supply: true
+
+  dvdd-supply: true
+
+  reset-gpios:
+    description: Reference to the GPIO connected to the RESETB pin.
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+    description:
+      Output port node, single endpoint describing the CSI-2 transmitter.
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            oneOf:
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+              - items:
+                  - const: 1
+                  - const: 2
+
+          link-frequencies: true
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - dovdd-supply
+  - avdd-supply
+  - dvdd-supply
+  - reset-gpios
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@37 {
+            compatible =  "galaxycore,gc05a2";
+            reg = <0x37>;
+
+            clocks = <&gc05a2_clk>;
+
+            reset-gpios = <&pio 21 GPIO_ACTIVE_LOW>;
+
+            avdd-supply = <&gc05a2_avdd>;
+            dovdd-supply = <&gc05a2_dovdd>;
+            dvdd-supply = <&gc05a2_dvdd>;
+
+            port {
+                sensor_out: endpoint {
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64 <448000000 224000000>;
+                    remote-endpoint = <&seninf_csi_port_1_in>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.25.1


