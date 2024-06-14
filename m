Return-Path: <linux-media+bounces-13229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 130509084C4
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 09:28:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A923286B30
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 07:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1ADB148850;
	Fri, 14 Jun 2024 07:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IVWRBEXy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51421148FE0
	for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 07:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718350086; cv=none; b=MLYgwb9z3xUKn4UpnzNIMjzles8iClPzXfjFSM7ji+siG5xvJc21jICYViVhTwIaEg2RpxjR+pe2rp3Eq/Bc1nAPzVVdARR8/zO6orSh8LNRkEMikgDTZOry9JXzIfDj1C7UAPoBwplhC6mu1D4p3nC6+huHpxSrX6DBlct5Obc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718350086; c=relaxed/simple;
	bh=wGHr7LXYjI0zdZuoQSWBZeA6hdla39Tj9ahiPZjJ+yQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Owfg+iaLYnwb7RJCDDv4BYkyGJPy/FUuBaEw5YUGJEOCrs8AOeLM6BXyNe8IGYlvwgK28jjKPZuWD3tY6Pc9EnoagnUVvqWMzy7QWVXbI1lVQjMuUnPoWsV1UvYLbFbS1HbxgBW/4BQN7dsm3PPlNUJbWy3/5DwCOnKdBHPmgKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=IVWRBEXy; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-421eab59723so14835465e9.3
        for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 00:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718350082; x=1718954882; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oRRchkIC57qyetE79hyrVGiSg7IXb/wKWZgHcEASk/8=;
        b=IVWRBEXyt5x7w1e0qyGDErw09R4q1jLelAaKsEyxmctcuZcwBAU4KrYUBoblLVNhzX
         Y+RxSgtMlRWDRWURq6j+x/wl/Imzk2/JzWSxurZ9XyMEYd2JunFYzge52q6uMLfrhQc/
         O4PZUvMFxquAioJR29FTRjY1IIBZblVWtc/W99SYfPdXdeiQBb3n6K4W6LX2mZ0kz5Wk
         HfgM1DA9d1qvYjW9n256Tmgi+LWrdoR1L21XUCAsC+lUcwVCpNAyuVZUawb6i4ypmOmz
         B4HjmVC4VD7wL/O22WiUbjylWCEsREibkxrc9fE+KSU3L5+fQJoi8qLyUIJro29JPX8T
         46Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718350082; x=1718954882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oRRchkIC57qyetE79hyrVGiSg7IXb/wKWZgHcEASk/8=;
        b=vC0vc5aVddIpLnOnfXQJbyHWO6geYw6eFjRI/7GMP/WIQ3fmTSGkHuHUtUhTKEAZEf
         rSXFviu4ckQmC+90fYvBFDzsz4E2rgrHLqwDeiLt/mQ6Xs194gySvz7g7fU+Uajdqdqb
         fbrjQT2V5bq9BRmuoxAfSYT/D1dXdJSK6+xKM2IoLB8ryWWxyEYtvwzJkWDC4Pso4NOM
         fhmt3sIr/W8yugyRGaZMnRSVbuahba6WLJfkFRGZ2KJSylWfb0OfBCECrFkSJD42kxta
         a5Q4nOTZ25U8RzfVE3n4XgmvR+LS5h/CqqtimjlEaaF5RAxoy2yLT47acLjNF09BBeao
         zFcg==
X-Forwarded-Encrypted: i=1; AJvYcCV3F68Nc9mHSlxsBN4FOn2+VPtK39MGa+7M7a9mHpTuVPe8ebAcTjaUKcgjqOPsfIGfxSHbR/guov3tmJ3pOVHEoc6GnPmnq4lGl4Y=
X-Gm-Message-State: AOJu0YzMohJcw7v21ECOLnO40sIFOqLmv8oI+X0KUaYlrYFt8l1pVs2K
	Yc3uDSf1krMFEed0sFKXqU0bM7aPZ3TlwswUGaI9fFhpCoL6qTIn/+sz8HAUwkE=
X-Google-Smtp-Source: AGHT+IHQjcQoHjXlNLsKpWPr6mfqI+yT8cy4ddzNpJPAn64e9KFwbXVFkynWSZPbAcSrR/N0H6r0cw==
X-Received: by 2002:adf:fc82:0:b0:360:79d4:b098 with SMTP id ffacd0b85a97d-3607a76609emr1053423f8f.29.1718350082416;
        Fri, 14 Jun 2024 00:28:02 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36075104b2esm3535773f8f.101.2024.06.14.00.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:28:01 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 14 Jun 2024 09:27:44 +0200
Subject: [PATCH RESEND v5 01/16] ASoC: dt-bindings: mediatek,mt8365-afe:
 Add audio afe document
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v5-1-54827318b453@baylibre.com>
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
In-Reply-To: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4635; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=wGHr7LXYjI0zdZuoQSWBZeA6hdla39Tj9ahiPZjJ+yQ=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBma/D+teoDf8J1wcv/7bJFtF7tuUz64CToYXRQnC6s
 1UNQx0WJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZmvw/gAKCRArRkmdfjHURSB6D/
 9rd52WnsoveOv2MK12j+IPradJM041eRc76MBEKty5aWjTxVHDzohmEPTJ/xT3SBxufuEbZ9rvrJnx
 XhSFitkx5+O3OlOEBno2HEvjUSZnFD0SC05Ks9gfNeZ3ugLtrJGteH39GPcJ63es8KG4aQpVim25cB
 CTLbWeLXZi99x6cxXYxp2HwUYNyddkJIPyKCl49u5nIGQTXFqHl/lw/BIjqRPZyvzLhIixGJWsnXnJ
 XngMUpiIl5X3SiESdH+Sd1CmPYZCZtpdj9PS5BCXO61Qte8ES0DPxfLYT+pMspK+EBZwosK/hZdew1
 s4EXTDRTIUvWVk+MBLybwbeHQJ4itgm8inPtIYVx1QN36q/eOFWhc1WVq+GXuuYQRoK0He7ekWC1Bk
 fHHiPaHu0LPT8Klkm6gY6IgrC78PXbKzaTXdcdfP5/qPyoDLeaR2XiVo6vImAi/lAMrQK8fW9374za
 EsCupuWgrqY6yUcgf4/4ZTwqDDXi24EFsfxYt1z9v8TEUcop0NMzn3RuPkIrFEOiRzaLcpgkboVsEx
 meuHXgpNgq3NGF+D/ypko8aQQCKmIY65iFNXZhbeMgsH1ZXAO6evA1HRMSlX4PEHGLw6b9odP1LlkA
 2GVUrbM5KYpL36kuamSVQWuWsfjPHcm1BP62x770/vwr7CIwzMsWJukAzrjg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Add MT8365 audio front-end bindings

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../bindings/sound/mediatek,mt8365-afe.yaml        | 130 +++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8365-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8365-afe.yaml
new file mode 100644
index 000000000000..45ad56d37234
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8365-afe.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8365-afe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Audio Front End PCM controller for MT8365
+
+maintainers:
+  - Alexandre Mergnat <amergnat@baylibre.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8365-afe-pcm
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: 26M clock
+      - description: mux for audio clock
+      - description: audio i2s0 mck
+      - description: audio i2s1 mck
+      - description: audio i2s2 mck
+      - description: audio i2s3 mck
+      - description: engen 1 clock
+      - description: engen 2 clock
+      - description: audio 1 clock
+      - description: audio 2 clock
+      - description: mux for i2s0
+      - description: mux for i2s1
+      - description: mux for i2s2
+      - description: mux for i2s3
+
+  clock-names:
+    items:
+      - const: top_clk26m_clk
+      - const: top_audio_sel
+      - const: audio_i2s0_m
+      - const: audio_i2s1_m
+      - const: audio_i2s2_m
+      - const: audio_i2s3_m
+      - const: engen1
+      - const: engen2
+      - const: aud1
+      - const: aud2
+      - const: i2s0_m_sel
+      - const: i2s1_m_sel
+      - const: i2s2_m_sel
+      - const: i2s3_m_sel
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  mediatek,dmic-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Indicates how many data pins are used to transmit two channels of PDM
+      signal. 1 means two wires, 0 means one wire. Default value is 0.
+    enum:
+      - 0 # one wire
+      - 1 # two wires
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mediatek,mt8365-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mediatek,mt8365-power.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        audio-controller@11220000 {
+            compatible = "mediatek,mt8365-afe-pcm";
+            reg = <0 0x11220000 0 0x1000>;
+            #sound-dai-cells = <0>;
+            clocks = <&clk26m>,
+                     <&topckgen CLK_TOP_AUDIO_SEL>,
+                     <&topckgen CLK_TOP_AUD_I2S0_M>,
+                     <&topckgen CLK_TOP_AUD_I2S1_M>,
+                     <&topckgen CLK_TOP_AUD_I2S2_M>,
+                     <&topckgen CLK_TOP_AUD_I2S3_M>,
+                     <&topckgen CLK_TOP_AUD_ENGEN1_SEL>,
+                     <&topckgen CLK_TOP_AUD_ENGEN2_SEL>,
+                     <&topckgen CLK_TOP_AUD_1_SEL>,
+                     <&topckgen CLK_TOP_AUD_2_SEL>,
+                     <&topckgen CLK_TOP_APLL_I2S0_SEL>,
+                     <&topckgen CLK_TOP_APLL_I2S1_SEL>,
+                     <&topckgen CLK_TOP_APLL_I2S2_SEL>,
+                     <&topckgen CLK_TOP_APLL_I2S3_SEL>;
+            clock-names = "top_clk26m_clk",
+                          "top_audio_sel",
+                          "audio_i2s0_m",
+                          "audio_i2s1_m",
+                          "audio_i2s2_m",
+                          "audio_i2s3_m",
+                          "engen1",
+                          "engen2",
+                          "aud1",
+                          "aud2",
+                          "i2s0_m_sel",
+                          "i2s1_m_sel",
+                          "i2s2_m_sel",
+                          "i2s3_m_sel";
+            interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&spm MT8365_POWER_DOMAIN_AUDIO>;
+            mediatek,dmic-mode = <1>;
+        };
+    };
+
+...

-- 
2.25.1


