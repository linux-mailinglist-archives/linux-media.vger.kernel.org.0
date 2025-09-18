Return-Path: <linux-media+bounces-40470-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2021DB2E354
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 19:20:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9ED0A217AD
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 17:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0584C341645;
	Wed, 20 Aug 2025 17:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="MeEwTWBj"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47049277C8F;
	Wed, 20 Aug 2025 17:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755710167; cv=pass; b=C+62WCKHWhHt1E7WCo4jYyWAW8Q5Q+tguHUzwDty9B4vN8TL9OLFoKxzImA1Dz+pYZNG52PxRlBMeBkqqS6mMAgJ6E/X0gw2h61bB49IPoa/eqJ8sobH4shdyPqOaetaOetBnCItmgKE2WKMOK0bC9ZQHV2b3gcEgSLjIR1wv1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755710167; c=relaxed/simple;
	bh=FCeCbCg4bT/63exJ5fo9gJ6zp3KUtcVempgrRS3eJQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D5kT8XZSD9moXm0OEEzSAgR5nOVTUHGBdcOcGJvIEt1q3YLzPj3da3Got1BvMavtasZlmGlYSG91MZBKqEhYNQgAbzpycGReotOrVqwdmPdSXHpvE/tc/ZDhmvBIWAV+n9yWtYVxytl2XU2+f2VkFG1B9vFm3JlGyDhlTDAaHA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b=MeEwTWBj; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1755710115; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DW1P2yGNKe6qXJoKXXfFz5jUZSgrriqhPb+s3ETw9zNw7hhBBDXWEDwveJsO1mIjnL/wzeqyMmdMe7osAIGcdKxF9AworKXwhNAP/rxLbFwuglY2eWMYBPX5n/0cm3jjU1bo4bKCRTD8mXD/HVGrcHvO3GbsnFiS1uKt0r2OB2s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755710115; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3clLzDqiAjd9muEt1mhFe8RslCpeKQ/erZdnmWFEp58=; 
	b=A3KJezBLkFPw4/Ek8ae8+DOkFWU7csmSlTtOAeRRPf6vKWQwZrzJE8RgdTd1/xC1qxKr8XQlCD365dIfG3zJaYbzVBFbSKv+q47nM5RAAOG/Qig8AfyEvUTkJf5WbZ6Km2ZVMmhTZPDueOAp4DnEVaBCCXPHXNpxCGjHKhYmRxE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755710115;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=3clLzDqiAjd9muEt1mhFe8RslCpeKQ/erZdnmWFEp58=;
	b=MeEwTWBjXIQNQvw79Cg7wjQvjxyWMwB8FA58UCPuRQY6g/CQvXvBHzWiOWbVCn4Z
	qyBMtuJagwMwbjnRRMZ2KYB/e2d2/feokesLV2tMCNWODTJn54S0G5DC4+DsCCXHI0+
	t72GdcuPPc8T7QWEdp1N5IGL1lEj1qBr8mndVyKc=
Received: by mx.zohomail.com with SMTPS id 1755710113355559.3878365147298;
	Wed, 20 Aug 2025 10:15:13 -0700 (PDT)
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
Subject: [PATCH v1 05/14] sound: dt-bindings: Convert MediaTek RT5650 codecs bindings to YAML
Date: Wed, 20 Aug 2025 14:12:53 -0300
Message-ID: <20250820171302.324142-6-ariel.dalessandro@collabora.com>
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

Convert the existing text-based DT bindings for Mediatek MT8173 RT5650
codecs to a YAML schema.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 .../sound/mediatek,mt8173-rt5650.yaml         | 73 +++++++++++++++++++
 .../bindings/sound/mt8173-rt5650.txt          | 31 --------
 2 files changed, 73 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mt8173-rt5650.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml
new file mode 100644
index 0000000000000..36e4f9c4c3d62
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8173-rt5650.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT8173 with RT5650 codecs and HDMI via I2S
+
+maintainers:
+  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
+
+properties:
+  compatible:
+    const: "mediatek,mt8173-rt5650"
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  mediatek,audio-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      The phandles of rt5650 codecs and of the HDMI encoder node.
+    minItems: 2
+
+  mediatek,platform:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of MT8173 ASoC platform.
+
+  mediatek,mclk:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      The MCLK source.
+      0: external oscillator, MCLK = 12.288M
+      1: internal source from mt8173, MCLK = sampling rate * 256
+
+  codec-capture:
+    description: Subnode of rt5650 codec capture.
+    type: object
+
+    properties:
+      sound-dai:
+        maxItems: 1
+        description: phandle of the CPU DAI
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - mediatek,audio-codec
+  - mediatek,platform
+
+additionalProperties: false
+
+examples:
+  - |
+    sound: sound {
+        compatible = "mediatek,mt8173-rt5650";
+        mediatek,audio-codec = <&rt5650 &hdmi0>;
+        mediatek,platform = <&afe>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&aud_i2s2>;
+
+        mediatek,mclk = <1>;
+        codec-capture {
+            sound-dai = <&rt5650 1>;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/mt8173-rt5650.txt b/Documentation/devicetree/bindings/sound/mt8173-rt5650.txt
deleted file mode 100644
index 29dce2ac8773a..0000000000000
--- a/Documentation/devicetree/bindings/sound/mt8173-rt5650.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-MT8173 with RT5650 CODECS and HDMI via I2S
-
-Required properties:
-- compatible : "mediatek,mt8173-rt5650"
-- mediatek,audio-codec: the phandles of rt5650 codecs
-                        and of the hdmi encoder node
-- mediatek,platform: the phandle of MT8173 ASoC platform
-
-Optional subnodes:
-- codec-capture : the subnode of rt5650 codec capture
-Required codec-capture subnode properties:
-- sound-dai: audio codec dai name on capture path
-  <&rt5650 0> : Default setting. Connect rt5650 I2S1 for capture. (dai_name = rt5645-aif1)
-  <&rt5650 1> : Connect rt5650 I2S2 for capture. (dai_name = rt5645-aif2)
-
-- mediatek,mclk: the MCLK source
-  0 : external oscillator, MCLK = 12.288M
-  1 : internal source from mt8173, MCLK = sampling rate*256
-
-Example:
-
-	sound {
-		compatible = "mediatek,mt8173-rt5650";
-		mediatek,audio-codec = <&rt5650 &hdmi0>;
-		mediatek,platform = <&afe>;
-		mediatek,mclk = <0>;
-		codec-capture {
-			sound-dai = <&rt5650 1>;
-		};
-	};
-
-- 
2.50.1


