Return-Path: <linux-media+bounces-13242-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3331908517
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 09:33:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6ED061F21A92
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 07:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66EAB18FC9E;
	Fri, 14 Jun 2024 07:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RcjOlPu4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2651C18F2E3
	for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 07:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718350108; cv=none; b=Q9cIpFLE1RMO31mUclk2ggApvM79GIKRAbAqDgFhMhBPQBT43rr8X2Hm7ddkToHnWTPxRdVmFtBx4NfmV4fEcGaJaOUpvHJdQltiixHJGhgkU0RivlgGnZaENLEPRn08k0xJSjcFn/gflJAcVZ562HrlEU+evScfoZQns62MaYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718350108; c=relaxed/simple;
	bh=t0tf5ggyvEv3KEhg9dzpup8fwcOHLyJsYbfkqMonRjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WOGh0LVlpkZbVgaD8MkKV1A6vHLjWRb0BpmVQfKIg+26OOaxr23rYaCuMifX3B+nj1bgues1YBydTC6oLjaEGdWfQqURKx0l/hbUsNSviuI8D3Lz2eEJrMI0TUcCpb8N046N2PRFoBWLdzqEsz4eiecWsLuXarArJVhO0dS1TBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RcjOlPu4; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2e724bc46c4so19912071fa.2
        for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 00:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718350104; x=1718954904; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qi1a6qRL/sSf88RkAxOBKeEEBw29sLy7LzarlapS72s=;
        b=RcjOlPu4plXecdbb0+lRn9hQC8vuqxT1eL18t/wSJ28okFVpIwAWU/v6LNpxbQYkS2
         RUuUjfN+jm4mMuEmtUTF+/ehSAyEiLg98iW/0Ci2SBkq4hbkKKsBcNDmfSDYDsWz5OQ8
         eG016BOsS6JCSQyPj5t8gPOAE84ZSx1xc6r9D15XG13V/f3fXDS9/P3ox0GgAXTt3aYs
         YU67WntUAX5PdFXiSKw8+VuPM1BucaUIvN3BBXOntYsi9/RnAvJzedhtrVszfgOygfMh
         ZHVj9UCwdMaBwL7n1kQdQR8lR+W68oQBIcgw3g7xxm9q8I/aoARuiAHsE1kGLEHJkZGm
         T/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718350104; x=1718954904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qi1a6qRL/sSf88RkAxOBKeEEBw29sLy7LzarlapS72s=;
        b=nmpiJhoy3tmdfVgpJt0Y71H13++ArArZA/ObxUCE0IjRlSDcH6az9IV4+FrPxufBE1
         pgnGkyePJYX3VXxf+NmeWqB6bY1HotacWGND/aYyokTKKAl9r+dQ64bde/+xkwPnU4yo
         DqCuOxF1K3+1Un33lKlG9UqWXu9/xEBXmjGDeDg/hbag+sKVK9Ztk/15woXXqC41Yzbm
         1HiIP396wYwfcqUYSWBxcj7v8HXpSdm4KLi8p7zRr3QRK/spjZZQRZsF1N4Fc0Z13OSG
         osyKIeTABp5qL9+sli+OjC1l/rXJHsfJZqHZZU7cfNNjkdUoU/me97llqhpA5wkpsPNt
         ipng==
X-Forwarded-Encrypted: i=1; AJvYcCVOFUUgTkayrduAShS195vCmCvTNU6rnqqX+JIvfm04AUGGW4cEuQP2+NJUvbqWcEXuSvYbAcMmOOwXmhOaEBx0lb+6BJzkJvnjxg4=
X-Gm-Message-State: AOJu0YyxcWmdMLlpRO2e7khLFp+Ya5w9VJQJiO3M5RSmcGbgWN2Yi7z7
	aEyl6m1zIAFK0IYCZASI/goaZStTfKzR35Lx+e/hUC+Wukmq74h1Go3pv0h6kuc=
X-Google-Smtp-Source: AGHT+IGnyuTyl004zNEknsuOkKnFWyFDczGzzd63f7Ew8B3WBH5+1B0Z8HM3W/isRBTFc2QhVm2A2A==
X-Received: by 2002:ac2:5613:0:b0:52b:c0af:6876 with SMTP id 2adb3069b0e04-52ca6e987c7mr985960e87.60.1718350104243;
        Fri, 14 Jun 2024 00:28:24 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36075104b2esm3535773f8f.101.2024.06.14.00.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:28:23 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 14 Jun 2024 09:27:58 +0200
Subject: [PATCH RESEND v5 15/16] arm64: dts: mediatek: add afe support for
 mt8365 SoC
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v5-15-54827318b453@baylibre.com>
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
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2357; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=t0tf5ggyvEv3KEhg9dzpup8fwcOHLyJsYbfkqMonRjM=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBma/D/A8g4JQKGf/bpZClCZkdFBg2gy1TwJe3EHB0N
 zfIyizqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZmvw/wAKCRArRkmdfjHURZMZD/
 0U4U3mFaqelf8+oXtjqp6va1E/hhZpK7ad8wAzeSFAimNE5m6rjbrFIu7WQxmMtYUVuFDL6tC5lkfn
 hfHWunT2Pm55GneefMiXpOuK5Zv+9UZfUrkfxXq2nav0GXUpR5J8cI4WM0p4nG/SWpSLXHEOicKOh6
 QCCocL43vKiNyk42G4exPFaShPNfylM8iMhD/c6iH93CcLR3eLYVtnV+UiVKWpPtoIxrpkUxyEpOPm
 Lfa0xZFWClVCEqz+9fH3rIQBGLnwk1qqtd3gYlnk9trSO/bZ5vtluK05KEFkynYi0/zU031UkDZkhI
 K9nGooP7It3JfUaSCCd2V8igTMoHyW4h0QvDYMcWrPu4/7xJoZh3lCtP4vO2sZrbv/mPHIwIeXC2Tv
 Lhha9ERXxtTlkNgPvARVW3MV5JEwYkrqm/J4yuWeqp9mtdUcr51CdbPkxXiGRRRBsksaz9ps0oclPk
 pY8i6w1QN2Q/a8wJntO6vDsRpd2I5evI+GIzzFc5p1dJmNK8hUCublsqjnDt/Gm7kZphssf1MDW4ej
 LtGVuS2jPtGoZPdM6rS0UTZRdqvV7SKdAuf/WDh9uRQ6Gmym3KDz09L3XzXSssFNsB1kPW9q/DnYWf
 Aeln75CpqX3eUtieL8n1LurXJjbM8MNkX6h1qMEA0lEw8JtRQUF4kZSwTVVQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Add audio front end support of MT8365 SoC.
Update the file header.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 43 ++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 24581f7410aa..0051d5613bcb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -2,9 +2,11 @@
 /*
  * (C) 2018 MediaTek Inc.
  * Copyright (C) 2022 BayLibre SAS
- * Fabien Parent <fparent@baylibre.com>
- * Bernhard Rosenkränzer <bero@baylibre.com>
+ * Authors: Fabien Parent <fparent@baylibre.com>
+ *	    Bernhard Rosenkränzer <bero@baylibre.com>
+ *	    Alexandre Mergnat <amergnat@baylibre.com>
  */
+
 #include <dt-bindings/clock/mediatek,mt8365-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
@@ -813,6 +815,43 @@ apu: syscon@19020000 {
 			reg = <0 0x19020000 0 0x1000>;
 			#clock-cells = <1>;
 		};
+
+		afe: audio-controller@11220000 {
+			compatible = "mediatek,mt8365-afe-pcm";
+			reg = <0 0x11220000 0 0x1000>;
+			#sound-dai-cells = <0>;
+			clocks = <&clk26m>,
+				 <&topckgen CLK_TOP_AUDIO_SEL>,
+				 <&topckgen CLK_TOP_AUD_I2S0_M>,
+				 <&topckgen CLK_TOP_AUD_I2S1_M>,
+				 <&topckgen CLK_TOP_AUD_I2S2_M>,
+				 <&topckgen CLK_TOP_AUD_I2S3_M>,
+				 <&topckgen CLK_TOP_AUD_ENGEN1_SEL>,
+				 <&topckgen CLK_TOP_AUD_ENGEN2_SEL>,
+				 <&topckgen CLK_TOP_AUD_1_SEL>,
+				 <&topckgen CLK_TOP_AUD_2_SEL>,
+				 <&topckgen CLK_TOP_APLL_I2S0_SEL>,
+				 <&topckgen CLK_TOP_APLL_I2S1_SEL>,
+				 <&topckgen CLK_TOP_APLL_I2S2_SEL>,
+				 <&topckgen CLK_TOP_APLL_I2S3_SEL>;
+			clock-names = "top_clk26m_clk",
+				      "top_audio_sel",
+				      "audio_i2s0_m",
+				      "audio_i2s1_m",
+				      "audio_i2s2_m",
+				      "audio_i2s3_m",
+				      "engen1",
+				      "engen2",
+				      "aud1",
+				      "aud2",
+				      "i2s0_m_sel",
+				      "i2s1_m_sel",
+				      "i2s2_m_sel",
+				      "i2s3_m_sel";
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_AUDIO>;
+			status = "disabled";
+		};
 	};
 
 	timer {

-- 
2.25.1


