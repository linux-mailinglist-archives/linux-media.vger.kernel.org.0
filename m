Return-Path: <linux-media+bounces-8911-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E2189DAEF
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 15:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B25A1F21D9C
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 13:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EEB8130E3C;
	Tue,  9 Apr 2024 13:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="eDY0tDBU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A579F130AD0
	for <linux-media@vger.kernel.org>; Tue,  9 Apr 2024 13:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712670131; cv=none; b=Xf9QzprmL+NJN7hi2xatxOIaKWqalz6OUKRaMwC9PRiRFimnoWJi032oy5dNY40rI4J738ZzEjIuO8aJngyGRlXeTUOSXr+OjgjjoYaeG0TCJDZhoYjSSAKEaWbHVbBgJgO3IAknPZE8VFZPwxsJJzh68hq2kqk4fXFEGVDRg8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712670131; c=relaxed/simple;
	bh=6yP2PSTtW/6RtQgKkMZffCd+b5diqb9RzbFiRrSwUQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OOQcTU54yeEo0ZfoiLaopgu8M2AAZGfYtwVuQHG0w7zpRAb/eoZIOScSPWknzHXxqTuYcUeb4lR4zGC2jDbKcbN7wkqjJUT3kh3lNxw6jAdrthXudZlr6Od21OT+SukmDBChxJJOdz3jwvI+dtN8oZf6lnfQGWThaCEH38La4fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=eDY0tDBU; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-416b7f372b3so1993845e9.3
        for <linux-media@vger.kernel.org>; Tue, 09 Apr 2024 06:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712670128; x=1713274928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vstY9Zznkfygwg0NsHtg7aqDXceNRwx7wPOtr1MNxN0=;
        b=eDY0tDBUZSdZL6QDn00UPXu6K7rVU23PbQjhmyt1byFYj7Wjglz6hwPVKQHZf6oezf
         M3ElPHiaA4oxsjpCocpx1QE2pbpXDCOJn7yTJnEG0BTa4qxAjce6yQ1XPl8t7Qa0NmvF
         oaWjTEAe3bQ4bvDjdGbh9rPSXDSJgQGlmmiWAoYMxfU8Lqw7hcZsavH/YqY+zJIgF0d4
         Z0iFPGExyDfN7M2+45WDV36QJDsKOxYqaRyrMiKrv55g2Qte4tFHw1R/C0YNLjG0U82Z
         U6OBZLbSVOf3bhJhIkL6u81V0zZoIkniQ+i+nuF7ZRL+MgTzWElWf9oK0FGiW+ewzVkE
         kurg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712670128; x=1713274928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vstY9Zznkfygwg0NsHtg7aqDXceNRwx7wPOtr1MNxN0=;
        b=Ib/G3gwCG/84C0p9BX2itLmPmRMBtN1xipcqCln9jHujCAUaAfs5nE4+7nf0tVFhT+
         75fV0W3Bc1sw6Ycsez/KrN2JMr+cFHDHFJAashXzgavXSPHm2netplLaz4WM2vYx72jj
         Ag7UnXZ+FDTgTKtjexoOJspMAyaeFHxLoc1KykeYEs03D4qCaT/0/WyG4ByM2/IHn5IS
         RTUQBz1Zr4q2KGKNYxwych1SyBgvdKGOamSqjRn/C6C6GnLt8CLsg3Zy81ryGKCun89r
         6llESwrL1G4OT1okiEMEQRhkWV0dTyBWihgjuMLIzK4RzUGQfsjx86t04e93hceZuOnq
         XGAA==
X-Forwarded-Encrypted: i=1; AJvYcCWRg5MeOJT5ETXs8EJWxmzH52gK5SLAtBz3w92j/asoE56Pl2L4npVJ6gKFWxzTuyvxh2C12tkYXFEj5xH7cHBzehDKKTDL05sLzdY=
X-Gm-Message-State: AOJu0YyHRyrRHoL1BVx4K5GZiCm9IH6iMlPAf1b3iQTzKkEzDQnqPhvj
	3+QFd4D1Oe9xtPTqTJKIrBsRuplYKSDx2cRV/Q2Uv3wKmIXp+p8ZxAHOoZcCLkY=
X-Google-Smtp-Source: AGHT+IHDIJ/STOp155krHtuE6+R0qF0kV5jQ+r5gMYDmIqloJaNtYXtutH8Pj9jQumpFd65gnSsycA==
X-Received: by 2002:adf:f843:0:b0:346:41a8:2b56 with SMTP id d3-20020adff843000000b0034641a82b56mr703358wrq.29.1712670127888;
        Tue, 09 Apr 2024 06:42:07 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id j11-20020adff54b000000b003433bf6651dsm10753579wrp.75.2024.04.09.06.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 06:42:07 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 15:41:59 +0200
Subject: [PATCH v3 01/18] ASoC: dt-bindings: mediatek,mt8365-afe: Add audio
 afe document
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v3-1-16bb2c974c55@baylibre.com>
References: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
In-Reply-To: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFUWssOQfHcGy+MdWILs/5t3ARO+pL7f5RsuE6THH
 ynPq6KCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhVFrAAKCRArRkmdfjHURX31D/
 99MawtD6kIzixa97HmAbQ/o7rccbyNMGoGu2FufywgtCqwAd9oNQXEjcyeatFyhzjPgMudIh14fVFz
 4LAkH8w1Gq+ZgBk1Gmc7ACALgx8OztnpNaqrtS/tQr82aOE8wS0iOWs3urIgelSMdnoZzrbNM55wkE
 PGUwPMvuNZgFK4CrgFmc6JgUbXOh/FYj8jAXouFJ6qpiNQJmTn+62GLHEUeigYf0NrsiRLzHWTwgaR
 kYdZWTUR/v8F2Ds7My3plKNVch1hGD7Ds9edD8ZcQDi1X0ojL6bC+FnUz5oONzHmOrtOG6lpe5gRZ6
 Xxq1bGwU6PmGnNuZcXzvmawj6mrDYkpP8fqtzAL7k6JHNYFOdHuEXfdV5RFxEtP4JpfUwkoYxJovhY
 iAeyNoGWHM9qEQQLMrBAWkyaUrXXCSwpSJsI1rMTBZwGJBWQJUh9ZpZ/OoH3qIcwwSSYiXtjHiE5SP
 e0UZPCQQfqVz9b84E8lWPROnJWCO9wi5qHKWnLgop4j9N0oUtGb3TQjCjh4DszMfcNLbEtz1FdhM7K
 3w7N24mXoOI6yEivuV6ISE0Uga096weNcygq/V+uiymo+DyGKludezTqHxVzkifkyFUKUr/K0w5W54
 F+IFVx2vpZubDRDsCR2bgDdTjYqnGdR1YzI5EmLJ/1dmMdCXdpSh5EOU8zlA==
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


