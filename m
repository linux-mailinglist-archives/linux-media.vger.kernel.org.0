Return-Path: <linux-media+bounces-8897-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC5089D6BC
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 12:19:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BF25287D65
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 10:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 632B4131BA5;
	Tue,  9 Apr 2024 10:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="BXu3f1XD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B825B130AE0
	for <linux-media@vger.kernel.org>; Tue,  9 Apr 2024 10:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712657651; cv=none; b=saa9xDCXH0EESfl2W0ORGJrxxmniemetPdMUvzH7mV/PkglE3Cea/Qvj4/uow+tmzrsexVUvK48DWkRgqgHEgfG0map41LtBP8gFPO9ECDInXDhIRFxUfiDsCThtrPbb+Y5yvRUNBaFxbkNWSLjuHm79WCPwZPIE4kGa65SDVlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712657651; c=relaxed/simple;
	bh=OGw78hpGmJopJetuhUNzzTWlhmL6j3P+xSZHkHfTIPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aCacpBpJF/cUd4YSSEIPCaAFfdDk0fDJCuQQQFUE89TFp/NKBYI2dtsAVGerYd0PB0UGb4enOO8A7l0AkFELqDP03M+mACNiRxsVgAYxISK/Y63qWYUFZ9N1yrmbKEmiYVKkrcmpWfVBGrOk6fcLz1r04sDt/UzA7k0/2KwOn94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=BXu3f1XD; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d4886a1cb4so65526441fa.0
        for <linux-media@vger.kernel.org>; Tue, 09 Apr 2024 03:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712657647; x=1713262447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhS125P+ZQHHlpX+fCGmsJ3MAcYkFtKGP8FooRfGuHY=;
        b=BXu3f1XD0xwX4WIz/1dB/VEZ9j6cEx6iwtVDdWS77eYjwZsY25I16BuiXtD8xtLAI7
         lYB6I7knqNb1m67cNIknNOtOJvHQcpOrZUS1BITB8av+WsxhcklMbwDq7p9i3PJod155
         nIPzhJBXwfkVsrG9L1dECf8NRMM+aGBt29WOrQGtYjFxf6o4WR0D1au7Ct8Nt1Ga/AZz
         C/dBAG0Ox5gNWGlm5yf/RetxwZr4akPBPG7uUsSw+ENwHg6NhEVL5T95xhQL9p9kDJCq
         OWUqQulX+i8ndbpZsz4eDW76uGi3CFHRUkjf+NqhPkBKCiMnvf9XbOCT0B23+wOqvYZ8
         AIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712657647; x=1713262447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qhS125P+ZQHHlpX+fCGmsJ3MAcYkFtKGP8FooRfGuHY=;
        b=MLNMvtXMOt+1mNWctNv8W5I/YAQRyn0P1d0Tx7dPC0nwbikFS9Svtzja0558KeEPEg
         NSSJqF5PTObUYYeRE9GDawKaXIUOI7idJNLyE8oduTeIcZwG/Y/App+8bn/DP1X8Blcb
         JOGnIZBKnQ19NXftVgC82rbA4O9xYszzUOPCmppiATuaDKev5CZnsoU6C5gnH1srrZ2m
         wMIt8MOXO3F9MPnUcy48AJZ64mt5B8mZY+5I1GWCnnxypXSnxcvYDkczElH7yGHoRd6c
         RfHTio3on3UqrB/pZrJBlFp6gYqw4+p/ymGCpRC7EzNy+9loFn9LkFFwlXjbUc6XYCg+
         cpZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfGHFx5LtfL70iMmb7L7mgkAeS7pvH9y27SA9v1ys1CtfrDnAWhfG+JYG4spOc/UkfVORYB1CFp/q9cFfF0ttA6r4ZxZsi6UCOYQ4=
X-Gm-Message-State: AOJu0Yx40dU3qRSazXzdCZuaaAciLmm/FAAvBFxkhP+sXvHFlCh8Oxd5
	WayKic6rqZvmlSmcQEK26/Mge0EwNxy5wFc/60b/bgI8fCW+4CAsHHhttfi+tAI=
X-Google-Smtp-Source: AGHT+IFF17tHptZ9yy6IboRmSrKnC6vMAvTQkGkS1sBkZY8PuDxFonOZnqVYYrkMq5Oo47sHNuMP1w==
X-Received: by 2002:a2e:888f:0:b0:2d6:cd05:1890 with SMTP id k15-20020a2e888f000000b002d6cd051890mr8048170lji.0.1712657646820;
        Tue, 09 Apr 2024 03:14:06 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id r7-20020a05600c458700b00416b035c2d8sm1124149wmo.3.2024.04.09.03.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 03:14:06 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 12:13:38 +0200
Subject: [PATCH v2 17/18] arm64: dts: mediatek: add afe support for mt8365
 SoC
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v2-17-3043d483de0d@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2480; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=OGw78hpGmJopJetuhUNzzTWlhmL6j3P+xSZHkHfTIPw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFRTTEUNfu/l/RVmmFfvIfx7YUtVHj60bjRZ75BE3
 zH4QqnqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhUU0wAKCRArRkmdfjHURTusEA
 CtYibBPzDz7hlWPn5zSwhUIaHtQ40nqsNB9rX8kXiBuFjqyqRdaTX4wbJqkHHUGFeEEJR4qJpOPE4s
 s1FqxsB0qzQrHAyMk4ZL5Zbs7M7n+hNutLNMbnpckX7/CNf1knNSHZ+/HO0FyXueP0/j+fvp0DOGA2
 3KFSEW84DMto/lKOKx0d4axfVmzoAwVOXBjYM2hV3R4dVnQuSD6HhkzazzXFiGC6FUZq9pEyqdfqoj
 Wwy/zAD75w/a34+bPUxNBah8QclxBSI6/49cY4mROW/i60I0VaVqhwNNFUG34tetH2lCVcd9bPEgdp
 G0ZfQDDFaFxdmma+3rgRvL8eOY+6XaB/bsS83DCgUAaXQL8dvaGn7G4VwzU1NsFeMcEwPZJwUClZRl
 tqi6Gr4zpFdzLqpSYvfp+G3rKzC4e/Aa+8JnPnRCAmTWpGvvHBlRZKuHMTB0d3hJ4Dhw7rkQ3BFYEv
 uTAsJEtd6pHT1ZT4/ib+Yu26zW6fqmbQUJuAadg+77yDN0cn8zLzkefbEHPccxQ7xfuc9knTbAVqbX
 Vo2VfjkeOfce2+Z5kOh8cpVi0QGNKKJow+sy2J0CKGevUYP4J9PSZs05Njy0DiRECnXCNiYizvMc5h
 C9ZwmafDd+g+rjVce2iRRt/FLjXkkjRlYZcm8ti8E+bZaGuMrTs2t2MUmc+A==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Add audio front end support of MT8365 SoC.
Update the file header.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 46 +++++++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 24581f7410aa..0bb6f6388bb8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -1,10 +1,12 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
 /*
  * (C) 2018 MediaTek Inc.
- * Copyright (C) 2022 BayLibre SAS
- * Fabien Parent <fparent@baylibre.com>
- * Bernhard Rosenkränzer <bero@baylibre.com>
+ * Copyright (C) 2024 BayLibre SAS
+ * Authors: Fabien Parent <fparent@baylibre.com>
+ *	    Bernhard Rosenkränzer <bero@baylibre.com>
+ *	    Alexandre Mergnat <amergnat@baylibre.com>
  */
+
 #include <dt-bindings/clock/mediatek,mt8365-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
@@ -813,6 +815,44 @@ apu: syscon@19020000 {
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
+			mediatek,topckgen = <&topckgen>;
+			status = "disabled";
+		};
 	};
 
 	timer {

-- 
2.25.1


