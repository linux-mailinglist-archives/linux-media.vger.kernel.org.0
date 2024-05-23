Return-Path: <linux-media+bounces-11759-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC798CCE4B
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 10:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C252B21BBB
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 08:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FBDC46AF;
	Thu, 23 May 2024 08:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RgY0Ah/o"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3ED13CA97
	for <linux-media@vger.kernel.org>; Thu, 23 May 2024 08:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716453766; cv=none; b=Sn6Df8QjgphUWjG3/x9+mPiHAYDWO0Jei6VmFTSnMgHfL1RRESsLxeWQiLqju66GbNQykdnhDFoSlxoXXoPZydg/qp/UAWZ8lZB79B34ZKHUB1C85Nm0bNLmDLgQU4LyIWhtC+0wp/vaVGWztsKhTTFlcwZuJmK5uIWCReYyV1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716453766; c=relaxed/simple;
	bh=wGHr7LXYjI0zdZuoQSWBZeA6hdla39Tj9ahiPZjJ+yQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n58NWaRsrKtn3F4NPv/ItwaLujOVOlI3Rrq4dk5j6FO69vQnbunLOTMSVUFECpAApyzUeQ0H8UKr9c/BNfSUjVVv9uvF+2N+sEjqJ6rBXRVNOzI9DJcOsfQBiGquDeSvJFe6I5y4d2FMvA7KAZZtf+L1WYpenIgwKpXwgv64Wn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RgY0Ah/o; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-41fd5dc04f0so11030205e9.0
        for <linux-media@vger.kernel.org>; Thu, 23 May 2024 01:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716453763; x=1717058563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oRRchkIC57qyetE79hyrVGiSg7IXb/wKWZgHcEASk/8=;
        b=RgY0Ah/okHeexNpfnCOp3bJoytjTG5R6xCwx9y5FyEl7ZwI0/eYqumzenOMZfbECLl
         bS5YaFmriqQEnVRscbGkhlEr5slrZUEM1xe2JE401AltDHDImciT4so7T2TIdycv6ozg
         qKqKDBFSqEFaMmeoHlKqmWxG/rl471g5WZZ5UOMbLLcjyfIPGj335jbqCu+ctMv7vcoq
         M7Lkr3bKfKeHqmrEsvukZvASRfaMZviQ7O60yZcdGvkh3Jr5PtsYV8+7fMzP9x1F1VqD
         U1xITnqcSxbjQeRC3Pm0mSBEHiYAhkvc34c+9NLgE5wFa3pnECCz2d2dwOnYfnyAS4Z+
         1VxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716453763; x=1717058563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oRRchkIC57qyetE79hyrVGiSg7IXb/wKWZgHcEASk/8=;
        b=KQw5Vv65c5469G9irBbsXDFLaV6INtgajfhMh1tc9bnrAa/tHSvTHZ2GDhSsewi2Ll
         BgADODhFzMOEDoYG8CS16nC0/4xT1j8XvEIkrM2LE+Q2e+STxA5O2wOIXwleKk0I2nw2
         R9I6MToZf5SLBRNO+2bQI3L9m1iy8IeTMEOLDU3zvrW/3biW22HEYvjuUAE0ure0yAQx
         sW6aEWb019W8xDb1u7wL4kTffLQtLIGCJ7LhDRRwKcdVBqgfgc5LuovNf9lP8tu/yV+N
         drShusgeWLcblP2N4KRtdmi0HpxYf5ArhJRZK5YszwdeoQTycyChMIhdclsE/ZYuq58Z
         pSFw==
X-Forwarded-Encrypted: i=1; AJvYcCViPdRIt/5J8FxzFtyOYMrW2NZSWNq2Wq2qqn1SIYr9QDaPb7rX6iFZG1ynStbQ3pSuynLwSReJFHXQR0C9vsAFKk6aAX/4CqH4tto=
X-Gm-Message-State: AOJu0Yxx7NIda1LYuzIhQhdrxNpbWi5Y3SDogM9lMAgdIv5lXAadNcxY
	bkBJBbXLoFVo2QZOXMoz41rP1L0T8Rt2v9PSz3trzy9SaM8WQ7L0fhoFlxnTrwI=
X-Google-Smtp-Source: AGHT+IH7hyyw000WAGzijwKmdwUBDb1aNXAh4qoFcc2mlr0bQckNxtlwnkKQyoey4PnV8suD3sABYg==
X-Received: by 2002:a05:600c:5107:b0:41a:8b39:8040 with SMTP id 5b1f17b1804b1-420fd310f00mr36829675e9.20.1716453763039;
        Thu, 23 May 2024 01:42:43 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42100f3e03asm18556645e9.17.2024.05.23.01.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 01:42:42 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 10:42:30 +0200
Subject: [PATCH v5 01/16] ASoC: dt-bindings: mediatek,mt8365-afe: Add audio
 afe document
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v5-1-e7e2569df481@baylibre.com>
References: <20240226-audio-i350-v5-0-e7e2569df481@baylibre.com>
In-Reply-To: <20240226-audio-i350-v5-0-e7e2569df481@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTwF/aurR13WZmMOpkRRgAOb0ci6xsJeF8om/A+Li
 hD2G9reJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk8BfwAKCRArRkmdfjHURbqjD/
 9+1I82LSrDbs5xl7ksW8OYAkdDDnVDwHe6KyBg7nUF6flxoCldKlqO5RYVYPeB5PC60mG+I3JWl8rI
 R2iD71p22zaYPQRvJz5Sgn6yCKxRzNDbJOLNr6u0KmtlA6oCMQgW9uH3RP5NGW0shOd54J0Tkpgo+d
 deDugEB597J785L9+cj0QRU0WiInqHOPKUbdEOufWTuQFHi+0E8QBWBzAyppB1bM3vPCNapuE/R79A
 1mE8m6bTcTnpmNbG1fCcCyZ/c/MMtQ+WUJnfLAMPvaARPJ99WhFuStl5F9hlQ+KcJSsv7acI/hleFG
 /0y0w1OrDiP+wi+5Pjzevrb17ml5NtQTPdtF/gSZ5C65mJ01YXanjC8CdsX0MDzyS0ilCvb1+N/IQv
 OK09lnRn3t6vaIDwQafINht0fhxmMmQP10vJbXssXY1kHygkjU9H4A9BDuoBhInwJ5jb2xT7g/VoTp
 sJldDPn/lttwtC9Cwds0p6A7waVECp2X84h+czzXQX8Aj/6a6Bj1J249SMWYcvJ79J+MkYmOww96a6
 eAB2GVtj3QJ68sqiv0bLDCAim6GoB+bUt7JQDcdNQZ10h+ExakAkz/tHRRNaqhqhslWGpmYM4knVyd
 jb04Dnezgv1G1TnxkeKonGK3vkfDC290fpfYTgukDre6C63Dvdu6i0a8alQw==
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


