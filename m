Return-Path: <linux-media+bounces-11772-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D94968CCE88
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 10:47:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F2A71F242A3
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 08:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A3FD14E2E7;
	Thu, 23 May 2024 08:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lS0QNXGc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0941C14AD29
	for <linux-media@vger.kernel.org>; Thu, 23 May 2024 08:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716453789; cv=none; b=Eq04BcGylWttQzfeovispWa3HFSQgfjqs+Mj1QN/1vQvoH6H1jRF7OrMaUqVIHZFS1la664NSKcDQboPW+l1XF9XMmXd/pdvfXSLT96ZqA+3xCQNhZ2WknDZuNHzjWZDROmWI/pvj/6TNwNnyjDh76IvGy9t46gjc5yS/4qFYkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716453789; c=relaxed/simple;
	bh=t0tf5ggyvEv3KEhg9dzpup8fwcOHLyJsYbfkqMonRjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bYhLNHA5F3WXGZyFHyyIIm282bcX55n2twhREpS0a2ygm5I1bAb2WEsEqEEvS/JQTTxunXqQSUQ3rBNWkCUt8emFs6zYQnK7vam963mAn78tUWCNo0/YpN0KZX+NGwxvxQq1tEoBOB8D+UAldrkeiZmG/vZaiiCdlP8majhi+Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=lS0QNXGc; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e72224c395so48259311fa.3
        for <linux-media@vger.kernel.org>; Thu, 23 May 2024 01:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716453785; x=1717058585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qi1a6qRL/sSf88RkAxOBKeEEBw29sLy7LzarlapS72s=;
        b=lS0QNXGc2wIdVINAAKp/TM/AvlzsG8HGMrLDRD9Vqrj+Yj+kuZ1WedrdwJkklg3JZQ
         zO8d5t6DknSzYCw6BdO5Pw+YWPOAB7/JbK44sadMFN5cZUrVeVY7WlaSJaUtglV2I8W7
         h8bEYRgzOrxlliMzdv3SD4A5ZJus7kyl0tWkMctlL8S3s/DDubzpEv46A6i9h2VFSsBR
         EJQsfh++prPqLMKFbOyeRhndcF8w85mfyBHRqUfpl24KEr77gfNUE2wPwC1bwJsZKdDT
         cjAtNvEbrggtecF/Say1K95J/YJS1mRqJ0Lij4vh75NWlWaC5Z9hRVdru+lbZZQ6OtPZ
         vfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716453785; x=1717058585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qi1a6qRL/sSf88RkAxOBKeEEBw29sLy7LzarlapS72s=;
        b=qh5jPcxsqCNt7GRp+Ky8XVfzMcrpAnnUIht0wTAqficnM/aO/8wLmFL/T5JY0MTtWr
         +DOEz2d0Er5lIV8pQ7fbCJfwwTSPqZJh7UaBHwTza7LPzM8rCp/ggPrHNVALIHxIbFmZ
         4tQr74xFQIPv0xmXCX7upA+IzHJg10Ysu7gF153ydo8zAhKftX8ij0HH4EV0cA/gzY9K
         Q/jqvwrA7IZ5jDG9D/OuUcLyvmExSmNpSubcT96x7BL+nKgJMlzXu91+ao08cLRF4tqW
         fgseR5CCEj+6qp71yC8ZzslLlCCycXE4kODtsuhKR6eKDkMDRmbemQuekdnRgcJuv5l/
         S68A==
X-Forwarded-Encrypted: i=1; AJvYcCXT/jmY8cbJeW1k/66TFMLb7Zksn3ADQhvEpqZLyl1/fZlE1Z1x9+WIxRHA59CnPxtY/GJ91dShGMtpLgbx3Ubxbn8gT7T7RrSNB+g=
X-Gm-Message-State: AOJu0Yw5SlF3dpcY4Sl/hRi1aNmqGSVQgLnOsBmui2JMAsAtP2w8LbL0
	KmQ0E/lIfhONQ3BU1GUCm0sz84YHGUGB2C5ioRDoUkd2q+TNK9+Kpm1ZOg7RpI8=
X-Google-Smtp-Source: AGHT+IEC8A0HHPj75NGAeP//54dk/2jVLa5uX488Ev2piYWlbCHwXQw4FvShK6FEUUJOadzfj0zTTQ==
X-Received: by 2002:a2e:9e8e:0:b0:2dc:d2c5:ee9 with SMTP id 38308e7fff4ca-2e9495022d1mr25227941fa.2.1716453785194;
        Thu, 23 May 2024 01:43:05 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42100f3e03asm18556645e9.17.2024.05.23.01.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 01:43:04 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 10:42:44 +0200
Subject: [PATCH v5 15/16] arm64: dts: mediatek: add afe support for mt8365
 SoC
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v5-15-e7e2569df481@baylibre.com>
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
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2357; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=t0tf5ggyvEv3KEhg9dzpup8fwcOHLyJsYbfkqMonRjM=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTwGAc9/Ge7o5DXtFdzw8pFfAbUOoXwPsn9Na27uP
 1jtKDmiJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk8BgAAKCRArRkmdfjHURVhgEA
 DGnMGpkKmQMoej6HMPV795SB24cmQfeb3v9qbkuOFXsVg8Aiu95kwy+f/ezJ1B8ILYuHC5OE9kmpgl
 9/fn0zECIn0xOivhVfxwvZZDULtsR80G4LXm2EuZZAXoC8GkdsnZCZ4PQ0IQ68eLfQ4N9rFP/pfqZR
 GrcimFwxFrH6Y9A2Pq3RAiTyNDpIf6qvTLHqelmm4fa2n67UozjZdWN1iZ9TXaVKijfEa1whxl1McJ
 2jDpItBbjUXfU3ZIfgXkBjNc999wZJWRGt/PpAcKRXB00Zly3TxA9FzV76WVH2a9WS3UW52K6hVBxU
 SVRZBNCdQFIofWoFJosPtcV3EhBuv1t9zQP+bpwR9WQtaYGASWQg+04m3/4smtR63vWWkkcfVICtal
 A/75ahpKxtnDr2+fS7Bj8ZlQiO3y1sJ0KQN2MTkLxR/BqXz8HlER3UReX8HHhCKXG3Qevs5RIlCX2Q
 zFiwXwesYCxfD+R3WXk6GLPuc0TvGDq2hlWPm4IgLLfryBat+/rcLJ1+7BdPukxFMlkYtbxnd4va6B
 ty79KRZeFeyLiyGv/jV+UTWiiXKWxzYSz2x/Q8i9dYRYTkhGlp8Gt3N5Ke0JKYRboFDteQmcBhJ0Dk
 reBFU0Cotj4ggjTE5PhVDafEpxHq4x+4w10YK0LE2kBafEaKYhpum9VarC0w==
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


