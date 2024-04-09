Return-Path: <linux-media+bounces-8882-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 505F089D670
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 12:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48D45280A4E
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 10:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6857684A56;
	Tue,  9 Apr 2024 10:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SQy1QZF0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FC381751
	for <linux-media@vger.kernel.org>; Tue,  9 Apr 2024 10:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712657626; cv=none; b=DYbZK5A2rApuXTP7UACGBnqruvmTO7ACjf7jfng26Qo1D8mpFgDgorJPvQGjqK/XufZVnBjAE85gck8hYtLxv4aYe3gGyGTgeDHPy8Y5UT5+mFkIj9wuJd71ww8U2IxFbaw0SkWjhXXBaOC+wy5JLPOLJH/H+v3nAmN3yAqnRXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712657626; c=relaxed/simple;
	bh=6yP2PSTtW/6RtQgKkMZffCd+b5diqb9RzbFiRrSwUQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l1Kw8k7F3X6iqTQsGN9VE2r2b4AmrjbTXCwA6tXiv/cyo0dWWeMBTvs5Pr3fFtZ9Z6URhkIa+Mzql5C/iCKTsXwPBjUSthBmsxF3pGpLtUky9yi3wFL3x6/MqOpWRt1AL2DBxoRw44vQchcfXoQu8TPdHueR/jbaWqMEnZdJ/NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=SQy1QZF0; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-416b606f3e3so1015605e9.1
        for <linux-media@vger.kernel.org>; Tue, 09 Apr 2024 03:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712657622; x=1713262422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vstY9Zznkfygwg0NsHtg7aqDXceNRwx7wPOtr1MNxN0=;
        b=SQy1QZF0nw5B9nufOfx8jVXx6T40gu1Ed6Tod1HrkQ9TKJKnrs4PY/JZMGJMFMaD9o
         8O2N6FzYi16nqeP+/A2an//rwMp/yptYwW3LJVpCpBzRTsnHey05dXySz1G5gkmw2W8X
         vjAhqihdOuJS/6aSlSmF+uP6y02VZsB1N2pJiu9G+CFEmj4aprCEYlyIc4asTM+QQCil
         JzV32HoDmUfK6eelxgtLjUbpmU5eZnxMO35bpHH8P/509bfA+EIIuscr+f0g9ZxLlKHY
         gKs30tJOSL4MQd6FflopX1cmrzx4UmQpaG8okhXV96ZPv4+mPrQhYYwTCO2Hd9+twzGw
         MKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712657622; x=1713262422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vstY9Zznkfygwg0NsHtg7aqDXceNRwx7wPOtr1MNxN0=;
        b=dNpSCFk9sYkIKOvclRWpCFEBBBUBWk6LOZkruReXUJQ3dIIlvYYmmCSdoJ/1lWQamC
         ei3/E4/t24QQgf5Ico7N/Iez/1OLcIUNMI2WsKTwZm1FOw2PW/p3/6QV3VDHBlQd///A
         6OgB8z4GAt9F+diEdeS+2jDYrPtIlqsunntOaUDO/DCsfIOuJ3fUGscfWlMQsVY+Ycwx
         K4OZWD+gBXAlayUJaGjWGHbtxCJTkrwFoiNyFhJiNecex8vr/CDAoinFHwsuvO3v/ujT
         d/g1N1XmEEo/+3i5woCpeisrfRQnuW/wPY4eoiT6mIR/Z2bGAhfo4X9jzWs/zvkTGgYk
         tmjA==
X-Forwarded-Encrypted: i=1; AJvYcCW5lv8pugwpFQU5OnPod62ybldhDuJ7pdZPdUFTCflgb9GSKneUGyfr/s4PqLd2HEUD/PAkphZyaT8vey6d2/ngNl9he8izI3JmVcc=
X-Gm-Message-State: AOJu0YwlfLzOYQUE4SNM6des3deTFT5VCVjJ3a9VT160EgyWqhMUvXpG
	7LIZwCQOgOK7JdNoYDmZChuuSKdMxEBj5DVQTehxctwaeUbCesqR0XNYItbFbxg=
X-Google-Smtp-Source: AGHT+IHqrZDTpg9fb5GQH0DhI4jx2HY2qdWx0GVAnjcLi1UXF9vEhHArn9ciUPZ9dzVCo8vSXIPiog==
X-Received: by 2002:a05:600c:3509:b0:414:6a1b:819 with SMTP id h9-20020a05600c350900b004146a1b0819mr7911487wmq.13.1712657622311;
        Tue, 09 Apr 2024 03:13:42 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id r7-20020a05600c458700b00416b035c2d8sm1124149wmo.3.2024.04.09.03.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 03:13:41 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 12:13:22 +0200
Subject: [PATCH v2 01/18] ASoC: dt-bindings: mediatek,mt8365-afe: Add audio
 afe document
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v2-1-3043d483de0d@baylibre.com>
References: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
In-Reply-To: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
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
 Rob Herring <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4760; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=6yP2PSTtW/6RtQgKkMZffCd+b5diqb9RzbFiRrSwUQ0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFRTT1RZ83NnSZXFR+xtetcg3ocLkN87pn3rt8lvM
 Bw3SBMeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhUU0wAKCRArRkmdfjHURU8cD/
 9+eYbJh7Z1C/HPcwCIRFa4iJqRud2TZmORRiL5znL6VLbAcmasJM5woFlHIBVSYTfVeRBojFBXQYVu
 KvPJokhiDYNFgPKkVxN4VssP/Ie4lZv/MuySDZWV1vYxpmASA8aAG7JTxxrI2HcBDZroWSEDqtefqc
 MNLvOY6UtAgII7YRXchKGhnNNkAt4FdkNS/i4Z/Whs6p8v49GGUscdm3rkJBmswDqiWF+zGWdTr8fg
 Ai36j4e8dnCaNGujXh4Zyh8mUfZccYvDlc8vGB5XLnh3MV1nXS6pExc1K6ef4HA9oonfv9YwbcT+B7
 H+Z8P+EXmPHzJ7huHtpZ2Ef4Ua6Bu3nt/paAJptBl/Jzc/iCG5yk+hD5JrCS+rYUznWJbfXsbikfiN
 zgOaX8vPMP4k2A8RJUH8uqa3lR3kEUWnzq3xWPPdoEpV5Z8lSBx1uOPh/m8mFSt9MJjRgpFT0POGOp
 mO+0W39uoIpKYhgmeF+BTOO+iCHAkeyVfTfw8Kr57K0JMlHL/BvT70N+C/waciP3FNR+kTZkZl/1Hg
 s77OelmvsvaxF/Jlwd7TRDjl143YApZO4wCThKelYcQxoeJJrvCbH5AGY0tBrK0Z6XbsSMg3tzvpOK
 zfNN7s6B6lj1WhLc1Gkr182cNsggrj1Fnd0dlmMdfqqdVrQ7MLN++zk1wyLg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Add MT8365 audio front-end bindings

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../bindings/sound/mediatek,mt8365-afe.yaml        | 136 +++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8365-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8365-afe.yaml
new file mode 100644
index 000000000000..d0759898b9c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8365-afe.yaml
@@ -0,0 +1,136 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8365-afe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek AFE PCM controller for MT8365
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
+  mediatek,topckgen:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the mediatek topckgen controller
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - power-domains
+  - mediatek,topckgen
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
+        afe@11220000 {
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
+            mediatek,topckgen = <&topckgen>;
+        };
+    };
+
+...

-- 
2.25.1


