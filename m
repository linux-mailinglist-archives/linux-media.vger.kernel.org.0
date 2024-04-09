Return-Path: <linux-media+bounces-8922-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7100689DB13
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 15:50:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 632BB1C2125F
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 13:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B4E13B28A;
	Tue,  9 Apr 2024 13:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="auf/YK1V"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD3113AA2D
	for <linux-media@vger.kernel.org>; Tue,  9 Apr 2024 13:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712670160; cv=none; b=f1IfqQg78yjBosUnC9JcVv3u16vXPibUjHf8VkBrSj4lf0XFpDV9RKuFE82wKnf6+DixjLHN4y5CBr+2m49uvbO2O9O2v7RmVL76NS6eF0nEfRLLlqRo/8+G6qnwl1o8Ez0yS2GRbj+wREWKybNaRGuRiv2AnRaiHixayZ4EOTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712670160; c=relaxed/simple;
	bh=A2PASoilqpYSI/+vuK5IOoXc5LlU1gMN/yOVGVWPN5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DmsNCmfRIIWkjkukf+WgVgiBFzkursZmEAwdrS7uBtxHHS1LtufZyPS/23AXN0lftOS60O8/Z2mteZzQ8okNwA8VEdisfFjerovxUT6sNdKy9+BG/Od6sl517CYnMGP2xCabCmZRdQBVq9dG4GR2hZrFI537qVZgzMi1JFIkKqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=auf/YK1V; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-343e096965bso2906371f8f.3
        for <linux-media@vger.kernel.org>; Tue, 09 Apr 2024 06:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712670155; x=1713274955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+HA5hs8xf/jy+EOJ7+HP5joeg+9+VSnSpeoghvWaVeM=;
        b=auf/YK1VbtjirGSfgM8qahDbXg1K1Fp7WR6Xc0pRoNVZTzC7IbiK4mVmHhNhZ2FzSn
         FiROs0h7Eyprdwe4O5VZbc5oiW2jabOK26pCnDdc7Ns5Yw+AN7JMpzrWA/wvMB56efTC
         YExPvFY9l9MLHNMwqqxCrFh9hYMd6Ct9ZXrpZk0Jx13BIQoH3I5dQXBubHgL1hNChBLx
         mxEnC6BOilNoheAlXPWw4mVEqfx/HqTruVH7qvrZ1ad5nLeciMiXVW4CrZjd6kq94YqL
         /y3M+BCSVDpBdjJDccw/gaS1to+yzFQ+b+jp0rjUcXtv7WzmpWSwo4vmEo/60pkJmDJr
         lwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712670155; x=1713274955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+HA5hs8xf/jy+EOJ7+HP5joeg+9+VSnSpeoghvWaVeM=;
        b=LMvEeHwEaWECun4IdDK4ECpZnIwmbTYdL/tLDz5TveFSFtLvBo10tHlemgMcdgkjIq
         yOyvu3QnaUFQK7kXY+C1tiHhRXMOk3apdk7lWlL6Id2JMoiZ1jSTorPNbDJtv9vkf+4K
         lHPjwbHk4jd8JbgWszQdG4kZJGg4+3+JDuLrFgZpZD5Og4T5bylpMpI51NPw6pdcM70y
         AiLmtwu2g6qdVjjnjJbZjgHn4cok4NaYMMHHPBZBwFiQ1GaSkRZ0tZnI+grqVZuud7a6
         iK7YUoLCAyvog5TyBOXdYPIZt6K9z+yJRXg4zlQMMCWhdMgPX6w22ZAMkPDN1ZU0Amhh
         3wQA==
X-Forwarded-Encrypted: i=1; AJvYcCWG8cyJ2f29NgBdnRkvVApJu//sKKiXaGYxHcPrh4abuRizC4Ap8E8yv2SkI6nqd8mljfJVwRjYzq4xfHsfpX//kjeOFvEUnAjko7M=
X-Gm-Message-State: AOJu0Yy6zS6Q5k/pEVT7EN6TcUQOlVztoWCFablOB5UZzwte1UF73xYq
	sSPD3EgV4Pj1eloNndLu68YTpN4WjbKVM5gnt9hIoPh0wpNtPK+lERIT6DXe3zo=
X-Google-Smtp-Source: AGHT+IE50TCMrfjZuXTdnKL9WNw3DK/tmRr+qyF9NLMMXasFNF8KgA/SVj2Jw2fTgEXVgf0xXcm+Nw==
X-Received: by 2002:a5d:6a8b:0:b0:343:ae9a:b8c0 with SMTP id s11-20020a5d6a8b000000b00343ae9ab8c0mr8260845wru.65.1712670154718;
        Tue, 09 Apr 2024 06:42:34 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id j11-20020adff54b000000b003433bf6651dsm10753579wrp.75.2024.04.09.06.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 06:42:34 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 15:42:12 +0200
Subject: [PATCH v3 14/18] ASoC: mediatek: Add MT8365 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v3-14-16bb2c974c55@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2430; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=A2PASoilqpYSI/+vuK5IOoXc5LlU1gMN/yOVGVWPN5c=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFUWs9pRJy7KUZ4H2C6Wten4uME6QtcFeAGTtQRY2
 FdINPIOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhVFrAAKCRArRkmdfjHURXBAEA
 C1kIAcewmz3E1DLy4mjYqDKJDGwbRrzHCTjplKxlDH2U9LDCdhuXjjk3NJP55d7ykayD6oWA4N0LlT
 I3onvj9JNUb7Ki5+mDTqlxboZSLHXwOOMC0jk/OsBem3UxJxDLfoiNZYIOiPOO93638rGzqpXA5BtD
 eq/zkOiRxER1Tcht4pzXjTAWeYfv9w16EzypL0ju+VW6cYC0ZJ1ITWiaOT1WVwN8Nv0iSZDiaWyCVl
 MmCiPDqUBooM16xfXUqnRCLRNizoUUc096eUWMVAJGFBnpFvx6xdCv2lmeHbW/+5mEhE6UqcpvZuzr
 647OQB2xxJUZg3Qgkg+9H4XcCkwyYEJ8vWl7Bv4Njehf4GIhz4Illu9EGEBl6FhpJqyvgFXQentbGg
 tCrg+4cJESVdzQBe7pgLsIOYc9zI+egw8BRC/IsndIeiQIGWsnA1JZJcNzyJimY67OYciBGcy1sb5X
 YjKAIRAUQKhg45pHj9x2ZAwn92CbYAEFmBu+Va7HnNRBoMpMKBE6USoG8fLdb+yPUPXCXnFSUCdgXt
 oOaYeRhZPvSwgqObB1hlgmxX+AkeCQ5tlK0npBAu3Xu+k5mMo01325CZ9JsNFqyNT1alaWMIgwMXtT
 PE3GXzld3msBEzj7Tm2j/B1jvFLYtx9uaGK/lGWjx3iOg9cNZvmZz7ncBRaQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

- Add specific config to enable:
  - MT8365 sound support
  - MT6357 audio codec support
- Add the mt8365 directory and all drivers under it.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 sound/soc/mediatek/Kconfig         | 20 ++++++++++++++++++++
 sound/soc/mediatek/Makefile        |  1 +
 sound/soc/mediatek/mt8365/Makefile | 15 +++++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 5a8476e1ecca..c1c86ecc0601 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -298,3 +298,23 @@ config SND_SOC_MT8195_MT6359
 	  boards with the MT6359 and other I2S audio codecs.
 	  Select Y if you have such device.
 	  If unsure select "N".
+
+config SND_SOC_MT8365
+	tristate "ASoC support for Mediatek MT8365 chip"
+	depends on ARCH_MEDIATEK
+	select SND_SOC_MEDIATEK
+	help
+	  This adds ASoC platform driver support for Mediatek MT8365 chip
+	  that can be used with other codecs.
+	  Select Y if you have such device.
+	  If unsure select "N".
+
+config SND_SOC_MT8365_MT6357
+	tristate "ASoC Audio driver for MT8365 with MT6357 codec"
+	depends on SND_SOC_MT8365 && MTK_PMIC_WRAP
+	select SND_SOC_MT6357
+	help
+	  This adds support for ASoC machine driver for Mediatek MT8365
+	  boards with the MT6357 codec.
+	  Select Y if you have such device.
+	  If unsure select "N".
diff --git a/sound/soc/mediatek/Makefile b/sound/soc/mediatek/Makefile
index 3938e7f75c2e..4b55434f2168 100644
--- a/sound/soc/mediatek/Makefile
+++ b/sound/soc/mediatek/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_SND_SOC_MT8186) += mt8186/
 obj-$(CONFIG_SND_SOC_MT8188) += mt8188/
 obj-$(CONFIG_SND_SOC_MT8192) += mt8192/
 obj-$(CONFIG_SND_SOC_MT8195) += mt8195/
+obj-$(CONFIG_SND_SOC_MT8365) += mt8365/
diff --git a/sound/soc/mediatek/mt8365/Makefile b/sound/soc/mediatek/mt8365/Makefile
new file mode 100644
index 000000000000..52ba45a8498a
--- /dev/null
+++ b/sound/soc/mediatek/mt8365/Makefile
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# MTK Platform driver
+snd-soc-mt8365-pcm-objs := \
+	mt8365-afe-clk.o \
+	mt8365-afe-pcm.o \
+	mt8365-dai-adda.o \
+	mt8365-dai-dmic.o \
+	mt8365-dai-i2s.o \
+	mt8365-dai-pcm.o
+
+obj-$(CONFIG_SND_SOC_MT8365) += snd-soc-mt8365-pcm.o
+
+# Machine driver
+obj-$(CONFIG_SND_SOC_MT8365_MT6357) += mt8365-mt6357.o

-- 
2.25.1


