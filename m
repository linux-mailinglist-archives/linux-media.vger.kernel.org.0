Return-Path: <linux-media+bounces-8926-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 942C189DB1E
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 15:51:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B76001C20DF9
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 13:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FDE613B780;
	Tue,  9 Apr 2024 13:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qvINR6SS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A93C13AA37
	for <linux-media@vger.kernel.org>; Tue,  9 Apr 2024 13:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712670164; cv=none; b=YYK8No5JervWhw8InGem2O08zlgFkOCed035RnzgNFcW21fjQoQtFEsCfeX/BTLYre0HsPQqJHp4FaCW2HLMgVsorpZQ42Hl2C7EVRbWl2qqZQofnny8g6KsS3XUuoFu45IXhnjbudwpqOzHel4bLJfl2FtdkNpkZfibw6IPBGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712670164; c=relaxed/simple;
	bh=OGw78hpGmJopJetuhUNzzTWlhmL6j3P+xSZHkHfTIPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SK7XiNzPxZ2343fi97JU69zdgjK4vowUmDRjuV1frSZvNv9OEQn7lPe5cbBreRbewtPqhIm68D6c8mHotglOHf4T6xvopPL7p3EeasxJ70tzPip3kbStlL8rMqGptpjtROe5t1Wz7YnqMjQv08g0ScSz0+1l0Qi0KIwTeIZANn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=qvINR6SS; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-345522f7c32so817701f8f.0
        for <linux-media@vger.kernel.org>; Tue, 09 Apr 2024 06:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712670159; x=1713274959; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhS125P+ZQHHlpX+fCGmsJ3MAcYkFtKGP8FooRfGuHY=;
        b=qvINR6SSnPWUgdAqBdbrG35GeRnldZ+LVvRygeXWYAjpqrHHZ8STAjSakFfM4JwwWO
         ysTY8KRYvvtssO88RCzpW/62nPakduurFpyBzGKbuIeGOaMHznugO6kCu6KB/9wt+ZhD
         htn/RsDa8bNXT+qWSCgumMK1wJTynqRFvptqAsOSyC8zwZR8e1x9BOih7G6D5jm4kWE/
         V0nuL7Vhrk23RcZiu0lFaHQEi06xBUgyrYMMiSLWFJyz6IukuMrRutPb4/y3i9gk/c3U
         gPMkXjjodfW5YV/Px+wOz24WRuGCg/c4fSNwcWM9GPZxTN2KkHf8HhFenRfFRRn0Ik6m
         CxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712670159; x=1713274959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qhS125P+ZQHHlpX+fCGmsJ3MAcYkFtKGP8FooRfGuHY=;
        b=OQIEQkzIJFRX7pmazGm5aMU5sdG0BnrYa0hoLWV5aGZ6y7SpavtqJjZUQLdbelTGwY
         NNTQ9bI8NGBs4y3FKcQBSuBGXjCgd12B+37H2dpGiET5Yu8iiTrcIiUnMeHF3hGK79EO
         1nkrlfSQu4pwJtkGcSEwPNYyR9e7FKig0R+p0S7p0jL3glNuFqb2DAWL4ryLxYexzGzl
         bakapCqp8QJhxgzN6ip5ZCbJvxs6PjLj1nQeS+LmlBgkhUo7Ujh5qDfhNxijiQdxqfUr
         /fa0godEX7aP5odv0bUFKOyItKUfB23T7tWqnuojTtZyn9/EAXp+O3qY2tLi+ZYq3ust
         3zrg==
X-Forwarded-Encrypted: i=1; AJvYcCVgLHNpYHMOEkfWCi5j/9WK4BY8UKDjyLS0ag4W6YUzzN/Woy+oGcAdsyOgw42m9pUgFF+9IQwPAGX3j2DVzY9Aydjb1CAr6PMhttY=
X-Gm-Message-State: AOJu0Yw0dcg/cYLoics8EmrT70reOJiazHqojQBFAictnrBvWtVoKJDu
	W21KqCNITIJtz2Is0svu1fB2pmWhP+SYNoMpyAlskJAiGkr8SdKO0qX9Sju/Jmo=
X-Google-Smtp-Source: AGHT+IFT/jYxzX0p468amfP5nHBXtig4/DVxbRQhBUZKhrK9R/PHxxzjV5SIG2lyyGfyPgKh/QvY7g==
X-Received: by 2002:adf:e802:0:b0:33b:87fb:7106 with SMTP id o2-20020adfe802000000b0033b87fb7106mr8234539wrm.55.1712670158897;
        Tue, 09 Apr 2024 06:42:38 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id j11-20020adff54b000000b003433bf6651dsm10753579wrp.75.2024.04.09.06.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 06:42:38 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 15:42:15 +0200
Subject: [PATCH v3 17/18] arm64: dts: mediatek: add afe support for mt8365
 SoC
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v3-17-16bb2c974c55@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2480; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=OGw78hpGmJopJetuhUNzzTWlhmL6j3P+xSZHkHfTIPw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFUWs9eiR7ZWjiZTdx2007n+FBL0uclOGOm0NNV6o
 UmMlzmqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhVFrAAKCRArRkmdfjHURcNJEA
 Chxjlb3n+vLAZHqid/+3vD4M6xojFtFRmtMlb9M3yrCHnN8JVfMP+TGc3A9pRZ8iAiuVxTGH0Fc5EE
 iTKV5EcFxZvI2XNRHyFqw7wfe9AIDeSnQ4DAYMErxwACqtmh+kWARRdb12VCL3UZ0apiKLg9xOGAuD
 zqY4xkqyVORgH9vEUDvly8X5bI3HcUw+eGhQ9TsPMgcvKoWaaDh38u4Pg2Hp7ZA0o1Ic+znbXasD7J
 OOJfMrJgXZGkZSgqj57Lxg+JOy6Y4VGCYhQ1Ba/QYbECouEIGxzTTvAhboStntir320jN36L0JPfOd
 5EEGAZAkbRxN6OmUPgXJeNk84zN/zu+sO70shVEIRyS5eQiQrk9ADfuDu+3IorKfo5feipMhYTtUHf
 ykQs/ols7b7AogN3UGBJIQujcVGEGCQK85CaDcFgqy8fYwM4lw9y3D+ZL0gCpG8t4/SfX7Z62X45nN
 nktnf6cuF761LyJbDs/cw1KsqdkdAwurmQZvIiVisn39D/UNsmikAqDRlA0AB/DA+kXOb/0I7nlH91
 Eal2NiCwHeGP/evsHQx6Ma1Hrze+kXJxky2ouqnAjD/pOIG6cCD7KD0WLQ8ZpOACrPwCtxnzeFm2os
 SI/p8jCbTY7ISiOc77/bqm27NYWja6L0CwoKdXwfiJSN+RUH8OWW7XpeJ5tA==
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


