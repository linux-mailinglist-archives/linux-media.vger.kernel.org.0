Return-Path: <linux-media+bounces-23180-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A3E9EC903
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 10:25:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AFCE28480A
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 09:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AEE3236F8F;
	Wed, 11 Dec 2024 09:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QkHyuQsJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FD4236F8E
	for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 09:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733909120; cv=none; b=QH8Ph7bR6Lw78Ohs0J9jkJIINTqs7oso72hQ4a19HKpA32zyYoLypzSzI2lkLwAwVUFi0utGm5h6Ju0LxtJlDvMOBt4cdyUObUtDhVBHdcsO/5aF2B/PmA6m2u430OZR+N7H54GrbJgxC1zTSJVS/GWqSHcaTr0K9vWd+/v1zq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733909120; c=relaxed/simple;
	bh=OorsYFI2yOigJgO5bO69ZT+ApNYpUlucr9QC0hagCak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fIwpyBTdRPHKZO+CGV6GTfb9Elpaa7PPEj/hf2KrderIDuufn23PcU+FUPjXBWHA+rOertb5fB6z/uLuGGmxA0Axe6JwneWQT18wWg3dpQfV28/pbip4MkoVgBLY3QqcoMEvYKBqjXhyIf2F9PpFslg4CPgl6BYNTtGH/4LkigM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QkHyuQsJ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa659775dd5so50748866b.0
        for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 01:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733909115; x=1734513915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NXcqVV41GkS5OCdhP1LRH9L5Mcp24WkFvJlZaO+kog4=;
        b=QkHyuQsJ3O0lhlfw5w2CStBho5X+Gob9P9co0Z/oMbC435sGqWudvNuWhcYglaQfE+
         TOeXbHa/WXkY2Zf1vtxPFJDaPx2mjtRKj+fiaPb8Sw5IFK7Lrj8C1LhFhGjMjyl1t7Tc
         jJF8oZzBXMqCUFl2tHHSVWBXMfxXBDqbrCO2XxSO8+JL0QO78lsW46Rq0oQjY9T5ru4O
         B3e+SxIivU1mLqLg/PvCSkU/KRjHCN8yDgIP+L4Z7EwcqZgP27NbCJkCbNSqnp/Eri8s
         LoT1TtF8fvYS3C1CNe8sXQxR9AUvdAKEgSWZEaQxuxdc9t0OnT38wI0Lsh0lN9ENDojT
         9VoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733909115; x=1734513915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXcqVV41GkS5OCdhP1LRH9L5Mcp24WkFvJlZaO+kog4=;
        b=UiCRhA4UWMNXKtl2Dy3Y9znKqC197Q9Tjhm0qlCbx2fyKbE6qX5zS8A4Hze3mqDCID
         YKGw30y3sEJYI1jVCnTN+Mc4/hmExxDQfP9aOs1lp2bgTc6hSpZS6KvZIklZFJA79klz
         MQzMkJusZiHAYSN5otfHS9PJfD1RY72JUeAFmy16rD9DPW3YI75ByAttN5DatUVkQfIH
         Z4vLWokPMa1r/hl0Cx7eTRFQp0FerlrZo4GXJZ0RMKm7N/cXojlzNNnLsbjhd+YLnfrW
         xKqhzWs1RhUrRhTbSQb+X+V4923s5B8iGKMJ5mjnByrhSTk4MWw6KFf3eW5jXBF9X0/3
         aRMA==
X-Forwarded-Encrypted: i=1; AJvYcCXiKSQt2TkSnftjFUF0DuoLW3E3hQG9FFLcXUtAbj7lPJRRrRD2zSW5iXwekp7bCllVLrEb9rbSs49/4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YySqgObL5/gx8n2OsC8JVwgbVdJ1MEs+vAO8HwjADHMZu7yYmG7
	AWypke3PbuNwbszLWgZelx84DlrIFxW8jQuBIGg+wnnY1GgT7iEZhVkgLxYYPyU=
X-Gm-Gg: ASbGncskekXUCaqVz/DfJJQ2ISqARix2Mguu09cXtQ3npy/LYlI2E1HFWgw25hCd/NJ
	/7yrkRjdiEdP598h0IS2ab+3j6iie3qDt+0DAIxuAV1A8HhMLQUW4Nx63mFUi67Mqs823VaEVgx
	muMuEK/XIivxbNO5ro5XNBU1M7deeSTtaFNfpcVarN9GXPSQfd6F9gm3+qtbZFjubbLAzY6RaI6
	fKT3P0eWA3PstIU8mVYO1I2DXiFAoS+Ts5opJ/AC7hLO1WsfLVwgwhxZaUh+PHtUp7n
X-Google-Smtp-Source: AGHT+IHFyHBEA5HZHRpwyOqKtZhm48a+yS1LNgYQVR3j87nj6Xk8rdjKvJ/QyHwbpikKDarceoIpOg==
X-Received: by 2002:a17:907:3fa7:b0:aa6:79e6:5b03 with SMTP id a640c23a62f3a-aa6b116dff6mr82732466b.6.1733909115063;
        Wed, 11 Dec 2024 01:25:15 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa698a9b74asm333831466b.140.2024.12.11.01.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 01:25:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Ming Qian <ming.qian@nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
	Shijie Qin <shijie.qin@nxp.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Emil Velikov <emil.velikov@collabora.com>,
	Del Regno <angelogioacchino.delregno@somainline.org>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH] media: dt-bindings: trivial white-space and example cleanup
Date: Wed, 11 Dec 2024 10:25:09 +0100
Message-ID: <20241211092509.34342-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Minor cleanups without funcitonal impact:
 - There should not be an empty blank line after SPDX tag,
 - Convention is to indent DTS examples in coding style with 2- or
   4-space indentation (4 is preferred),
 - Drop unused labels in DTS examples.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Resending second time, because I missed previous Rob's review.

I added now also Bryan's and Heiko's reviews from last resend.
---
 .../media/allwinner,sun50i-h6-vpu-g2.yaml     |  1 -
 .../bindings/media/amlogic,meson-ir-tx.yaml   |  1 -
 .../bindings/media/amphion,vpu.yaml           |  1 -
 .../bindings/media/fsl,imx6ull-pxp.yaml       |  1 -
 .../media/mediatek,vcodec-decoder.yaml        |  1 -
 .../media/mediatek,vcodec-encoder.yaml        |  1 -
 .../media/mediatek,vcodec-subdev-decoder.yaml |  1 -
 .../media/microchip,sama5d4-vdec.yaml         | 17 ++++----
 .../bindings/media/nxp,imx8mq-vpu.yaml        | 41 +++++++++----------
 .../bindings/media/qcom,msm8916-camss.yaml    |  1 -
 .../bindings/media/qcom,msm8996-camss.yaml    |  1 -
 .../bindings/media/qcom,sdm660-camss.yaml     |  1 -
 .../bindings/media/qcom,sdm845-camss.yaml     |  1 -
 .../bindings/media/qcom,sm8250-camss.yaml     |  1 -
 .../bindings/media/rockchip,rk3568-vepu.yaml  |  1 -
 .../bindings/media/rockchip-vpu.yaml          | 29 +++++++------
 16 files changed, 42 insertions(+), 58 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml b/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml
index a4f06bbdfe49..8ba5177ac631 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/allwinner,sun50i-h6-vpu-g2.yaml#
diff --git a/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml b/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
index 377acce93423..6da8a6aded23 100644
--- a/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
+++ b/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/amlogic,meson-ir-tx.yaml#
diff --git a/Documentation/devicetree/bindings/media/amphion,vpu.yaml b/Documentation/devicetree/bindings/media/amphion,vpu.yaml
index 9801de3ed84e..5a920d9e78c7 100644
--- a/Documentation/devicetree/bindings/media/amphion,vpu.yaml
+++ b/Documentation/devicetree/bindings/media/amphion,vpu.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/amphion,vpu.yaml#
diff --git a/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml b/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
index 84a5e894ace4..3f47744459aa 100644
--- a/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
+++ b/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/fsl,imx6ull-pxp.yaml#
diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
index b401c67e3ba0..d726d141a434 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/mediatek,vcodec-decoder.yaml#
diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
index b45743d0a9ec..110e8f5f1f9e 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
index a500a585c692..5865e6f0be89 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/mediatek,vcodec-subdev-decoder.yaml#
diff --git a/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml b/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
index 59b805ca47c5..ede086d55add 100644
--- a/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
+++ b/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/microchip,sama5d4-vdec.yaml#
@@ -36,12 +35,12 @@ additionalProperties: false
 
 examples:
   - |
-        #include <dt-bindings/clock/at91.h>
-        #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
 
-        vdec0: vdec@300000 {
-                compatible = "microchip,sama5d4-vdec";
-                reg = <0x00300000 0x100000>;
-                interrupts = <19 IRQ_TYPE_LEVEL_HIGH 4>;
-                clocks = <&pmc PMC_TYPE_PERIPHERAL 19>;
-        };
+    vdec@300000 {
+        compatible = "microchip,sama5d4-vdec";
+        reg = <0x00300000 0x100000>;
+        interrupts = <19 IRQ_TYPE_LEVEL_HIGH 4>;
+        clocks = <&pmc PMC_TYPE_PERIPHERAL 19>;
+    };
diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
index 3d58f02b0c5d..19528262810a 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/nxp,imx8mq-vpu.yaml#
@@ -44,26 +43,26 @@ additionalProperties: false
 
 examples:
   - |
-        #include <dt-bindings/clock/imx8mq-clock.h>
-        #include <dt-bindings/power/imx8mq-power.h>
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/imx8mq-clock.h>
+    #include <dt-bindings/power/imx8mq-power.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
 
-        vpu_g1: video-codec@38300000 {
-                compatible = "nxp,imx8mq-vpu-g1";
-                reg = <0x38300000 0x10000>;
-                interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
-                clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>;
-                power-domains = <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G1>;
-        };
+    video-codec@38300000 {
+        compatible = "nxp,imx8mq-vpu-g1";
+        reg = <0x38300000 0x10000>;
+        interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>;
+        power-domains = <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G1>;
+    };
   - |
-        #include <dt-bindings/clock/imx8mq-clock.h>
-        #include <dt-bindings/power/imx8mq-power.h>
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/imx8mq-clock.h>
+    #include <dt-bindings/power/imx8mq-power.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
 
-        vpu_g2: video-codec@38300000 {
-                compatible = "nxp,imx8mq-vpu-g2";
-                reg = <0x38310000 0x10000>;
-                interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
-                clocks = <&clk IMX8MQ_CLK_VPU_G2_ROOT>;
-                power-domains = <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G2>;
-        };
+    video-codec@38300000 {
+        compatible = "nxp,imx8mq-vpu-g2";
+        reg = <0x38310000 0x10000>;
+        interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk IMX8MQ_CLK_VPU_G2_ROOT>;
+        power-domains = <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G2>;
+    };
diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
index 9cc0a968a401..3469a43f00d4 100644
--- a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/qcom,msm8916-camss.yaml#
diff --git a/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
index 5cb0e337ea6e..644646de338a 100644
--- a/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/qcom,msm8996-camss.yaml#
diff --git a/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
index 584106e275f6..68d8670557f5 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/qcom,sdm660-camss.yaml#
diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
index d32daaef1b50..289494f561e5 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/qcom,sdm845-camss.yaml#
diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
index 06db2c1e6079..a372d991e652 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/qcom,sm8250-camss.yaml#
diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
index 947ad699cc5e..d246f5d38427 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/rockchip,rk3568-vepu.yaml#
diff --git a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
index 719aeb2dc593..8c2501634080 100644
--- a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
@@ -92,18 +91,18 @@ additionalProperties: false
 
 examples:
   - |
-        #include <dt-bindings/clock/rk3288-cru.h>
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
-        #include <dt-bindings/power/rk3288-power.h>
+    #include <dt-bindings/clock/rk3288-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/rk3288-power.h>
 
-        vpu: video-codec@ff9a0000 {
-                compatible = "rockchip,rk3288-vpu";
-                reg = <0xff9a0000 0x800>;
-                interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
-                             <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
-                interrupt-names = "vepu", "vdpu";
-                clocks = <&cru ACLK_VCODEC>, <&cru HCLK_VCODEC>;
-                clock-names = "aclk", "hclk";
-                power-domains = <&power RK3288_PD_VIDEO>;
-                iommus = <&vpu_mmu>;
-        };
+    video-codec@ff9a0000 {
+        compatible = "rockchip,rk3288-vpu";
+        reg = <0xff9a0000 0x800>;
+        interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "vepu", "vdpu";
+        clocks = <&cru ACLK_VCODEC>, <&cru HCLK_VCODEC>;
+        clock-names = "aclk", "hclk";
+        power-domains = <&power RK3288_PD_VIDEO>;
+        iommus = <&vpu_mmu>;
+    };
-- 
2.43.0


