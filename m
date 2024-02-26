Return-Path: <linux-media+bounces-5964-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5118677BC
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 15:06:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6E272909AA
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 14:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C902012F5B0;
	Mon, 26 Feb 2024 14:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iN/vHt4U"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282DC12EBE4
	for <linux-media@vger.kernel.org>; Mon, 26 Feb 2024 14:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708956154; cv=none; b=KxgcEATWh0Wk8UNLcy6+AULDoGNu/ZNxjPV1b6JXqYDk0TYynl3jXyjteRQa3f9x14gSPAqkySvn8uwzNn9dvOta5jns47l0pjYYQ07DfTxUCyFNqgfCdqvhG4KFBymE1gCDnCX8wNyppTHL9qLcA59DL7WUrOWTHI96HMZ6JdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708956154; c=relaxed/simple;
	bh=xG6Nj+SE5fOs36aPHS6J8P8h9OIISvMcqRKMRAq4LYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B9scPRYKXEN9TeUC4a7ln9ELjTRYV/phXWMaQYNC3hkgfoTSMBJigqtndiSTWsg6ZzNRlzPKYlZlcOhMToBrpIRJia3TkmTGzXsA4Jl1FXxJVXPSf3l0jkcShvV/0epHNhs63XfUVtlUZ2V5mhV3MJhICH0rMgckIzEACmyrF4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=iN/vHt4U; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-41296dce264so20675195e9.3
        for <linux-media@vger.kernel.org>; Mon, 26 Feb 2024 06:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708956150; x=1709560950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F62eeTl4P/lUv2qXfQTeyM9lbIH8G1u8VXxO64mOOAU=;
        b=iN/vHt4Uq6z/vmVhjgKBF2VKujoigCPp6jKDr3UlQY42SliNh8smXWUFjbMUkuWyqu
         JWxL49qVpPpfClJxGQmjzUvsPtKbCDswCcVXipaximDI5F17g0xcvd1dCDQfeycZR2OE
         x7HJdNzKc5m3mGcPa9mLZ5PVty/AdL90DlLjjLBLVm2GgEEMpYl7sVs8LbOqviXSMODt
         ddEpbRnTE1vR4W3cQXYpJJVIqcon6QliaJXtSA1juCHhUqGWFzB42bEVr6JmSIl0oG9B
         CllXwh+t883qb9+fl/siF6lYfzO5t/OzsTuHb6k1Mc/BBTIRcojR1441Z8lprB5h7ElK
         C5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708956150; x=1709560950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F62eeTl4P/lUv2qXfQTeyM9lbIH8G1u8VXxO64mOOAU=;
        b=ReADxxXvD6e4aRfggfyuto4Ki5KUwWjacA5xYhfhXvyzsq8VJ1AlukIbhoNZezdhN6
         sfb8wvsNuxvzlg8eQzhMBneqIrvZ6Z+hy5aIC7ZJLxMvqm0liTkI4/IEJim2vs0LJYEa
         9oLPs8lQhcNMMWsCPQfrQvnMbqjivQ2wFwxu/becsHqWQML9Ek9KDbKzny6/+vHoM67i
         T6+9nQOAPDexCGMZVUnP6rnx9DdUrGfUhup3tQ06PC7bgj1MTahlTNNDWOsAHLoAH3a5
         IXVDiLjA+ODewuCwdCv/dfpgRCpJ4W6el6a9yTdb572OrM08BJ+g5A7VngH8iA8SW2aB
         +lqA==
X-Forwarded-Encrypted: i=1; AJvYcCU2JprxBEQ1JYcdYgh5cQUi48zMMUBS2WpZQ0LL3A14YDu6P6zFawur2mkYjwaJvGSmroCV0SH6aBLKiZ2WsLT6vSvcMzmI5SWxCpg=
X-Gm-Message-State: AOJu0YwaAW8kPubcZBsFmK6NnoG2FK6pvhCyaeUPPs5g71ENSK+wc0Wh
	wfDkc80BvMJf+MD4DVbw8PWpijv3Ne0X/bH7XK/wiscd7rCk9zdgjTNO+f/tZ2A=
X-Google-Smtp-Source: AGHT+IHscKedkQ0b/ug4V8wD/SHcqJqmEUf1to81tnkJ5MmC7hJV2OxNQvlYaWfsvt7J++chxx9drQ==
X-Received: by 2002:a05:600c:4712:b0:412:a1c6:ecd with SMTP id v18-20020a05600c471200b00412a1c60ecdmr2618588wmo.30.1708956150455;
        Mon, 26 Feb 2024 06:02:30 -0800 (PST)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d33-20020a05600c4c2100b004129f87a2c6sm2838475wmp.1.2024.02.26.06.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 06:02:29 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 26 Feb 2024 15:01:55 +0100
Subject: [PATCH 17/18] arm64: dts: mediatek: add afe support for mt8365 SoC
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v1-17-4fa1cea1667f@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
In-Reply-To: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
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
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2516; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=xG6Nj+SE5fOs36aPHS6J8P8h9OIISvMcqRKMRAq4LYM=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBl3JndiuFBdHmvYSuhV3YrAB4ZgAGaQLk95FRZXpfT
 wtQhZmaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZdyZ3QAKCRArRkmdfjHURXRbEA
 CB9zjhs3sNHEteUCvQ7PrQLUoBwpi65oTqrtSHIx+d2xsx9LuHXmpU/xqe38wf+OtnmZOOJXZzKrpY
 i0XGXZ/6LpLMRhDtX3j8bre7wiZCd7P/u4QlKd1wEe308TC58uug9S5heRGPAG1FkkBAeRjMY96U9t
 pUZ2vFGYevyYNZ3hhdImBX8Eiyxum8nLgcwRTvy1GKYk8x1tNBNpvcIj2mDXX5vzTmwzYBZDSBILkD
 48ugwynpcguHwd+liyeNx752fp//0e2p1mo5uvO3SgAVjaRCLtujqhfaU1PIpis7Bj2oWMuF2dIouh
 cKX1zee+YOUH2t4EzgOIU+EFVz0P4NTEaQJnm/cHhlDcM+iFsYFqjrWSmhUOOeutQ7/Zohp27vtSTV
 +k07l7G5eQJ/fWDCLNpr5Um3MUer6A0GPYc+oD/n1N1IwUTUfkqSVYpIjIWGbetyn1Kl5y0aqEDPpL
 a9XAD58F/z9THIwcEtj5QIg5QwlfyjjanLxk4UEJq4MLstDl7/N84yXPN5F+WGYnmsMldbGRbGh1aV
 ZXUdVCS6iGy4MG65GdrHOZvVANbQ+8AD/4Oyqm3g8qDxWqUvTcvZugmTVO+S3yPP6WU8lV0bvZ+IuK
 ovAQgS57irkAK2DYyA2a6OjucJzc4Bof15oIZvsaabiHCsMnhhLk60UlZPLQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Add audio front end support of MT8365 SoC.
Update the file header.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 47 ++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 24581f7410aa..13cd1298832b 100644
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
@@ -813,6 +815,45 @@ apu: syscon@19020000 {
 			reg = <0 0x19020000 0 0x1000>;
 			#clock-cells = <1>;
 		};
+
+		afe: audio-controller@11220000 {
+			compatible = "mediatek,mt8365-afe-pcm";
+			reg = <0 0x11220000 0 0x1000>,
+			      <0 0x11221000 0 0xA000>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8365_POWER_DOMAIN_AUDIO>;
+			mediatek,topckgen = <&topckgen>;
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
+			status = "disabled";
+		};
 	};
 
 	timer {

-- 
2.25.1


