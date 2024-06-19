Return-Path: <linux-media+bounces-13721-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA47390F136
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 16:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50E34287EFB
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 14:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3762156C67;
	Wed, 19 Jun 2024 14:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="S6GdtNpM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C7D15218A
	for <linux-media@vger.kernel.org>; Wed, 19 Jun 2024 14:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718808433; cv=none; b=jbkPrWOSY9JtYoGK1Su7Z4GXVWL7oVBsyTEwhQB3u9/zOLB+pRX1MVtublU32zX18YYKjsUzyzTwkWVrGDvit7hyLftpUpFY5xn8tak8HMYe15pktdhuqxWZw99CDXsMSnzMrdv1GQ+Cuq+W56l83vimlGxCeAjVFjEFe6L3qyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718808433; c=relaxed/simple;
	bh=vnmd2mVApxPLc2R6K6xVxS7OxGsZNFmbe/RXhcwO8AY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZZoQm+c41WRMDrJ+BsbIRL1KIE4KjKWpw5oiv/nokoikpdN/vl4lWo5dgYj3OH7EzIBS5FLh6NPK/b1JYjfijP8j1lvR64JeRQ+6qsMCezE1zI35mI44mAILyM6jm33IP61Xvw4S9RKM4i+CgVNBWL0lyX8X77e19NeVsk5f6No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=S6GdtNpM; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a6f9fe791f8so152198066b.0
        for <linux-media@vger.kernel.org>; Wed, 19 Jun 2024 07:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718808428; x=1719413228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PtNAnqgNG24R8NK/m4hXcoIVXnpKbw66g/FsBrMA5y0=;
        b=S6GdtNpMKTTEMMlN9R/6VAn5/0+Fz5fq51LiVAtTTsU+OU4DWb7CVIk2+fS1pHMtUJ
         KGNGXTs1grzzNujdlTjvGGMpvc7Z54lUQ/0sTzCvb9PaLmFAbVIYDVwysmBgXQy7U3Jc
         eZATTdX13aJEicd7h9ESaRXLvnsffl2R1eQD6o7JVvq1JV9xDHNEejRSpDq8NnLfobic
         PsEpf1WeYMy6ZcCtX5sWrj8kUEA9T79dlYbawX02+xC9zN1ZXrnYOz7/XMR9ocFp9Hia
         yqhp9Lw/UyKIxZ4jNrQddCL6sjynRnv3d1J4m+oIdg63YtIhhK4rxTGEjAcnD8KZS83O
         23eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718808428; x=1719413228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PtNAnqgNG24R8NK/m4hXcoIVXnpKbw66g/FsBrMA5y0=;
        b=FAO85BuayMDaYvS3pz54CVYAFFhtax6Y9ECM3Ljyg6mGGK7AyldnumH9D8+/YbHNoF
         pv5Esq4sMOAGvPftFp1q38SsWx1Wx7q3OrL5cUSzLKMWEX3htUK6LGoGE+LbuneFqwe8
         q82diblVwtbJpg0vTacUJa0eJLNqvCXx6PT7wDItYdF2TyG90WYDxqiNXrPXh5y03iWM
         SBlSZkod9LhuiH/jcxXVpfjwHFe/6Xfm3QyB04TdVdnBzNymC7KludIm4lRSc4S1hpdz
         +ElazvYr2yWRfVIvV2HARE//WG76McBTWGH3lYlaPxJCfWf4HmGeOuIiQq1WqltbnNlY
         rGMg==
X-Forwarded-Encrypted: i=1; AJvYcCXi+MZ9arFCUjQalrZqAtSeuIC6KWVxFOL9gQsc+s3/Ji33AixQIdHxj1csN4/OV3NoLXG0vo5xTLrl1WlykZ7wrywZ4gRdvXTACq0=
X-Gm-Message-State: AOJu0YweCN2oR5+mw4KiQyqsEGJVrUuLj6irtXFNrPbqZKUyVOr1l5NT
	ztxgazpOoGvotnPTQDGUrNbogkzSvWiJZIUAHnVZHNhtBb+bLv6/rROKpoze6Vw=
X-Google-Smtp-Source: AGHT+IFv39hM7/l8g49ZpE5FDQEiJIiaQKcf6Hu3dgwo3RGzqjnnsleD/QS3ueaABfQwUjrDhVVxVg==
X-Received: by 2002:a17:907:c24a:b0:a6f:5609:954f with SMTP id a640c23a62f3a-a6fa4109c82mr170872266b.12.1718808428102;
        Wed, 19 Jun 2024 07:47:08 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a6f56da32c3sm679787566b.13.2024.06.19.07.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 07:47:07 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 19 Jun 2024 16:46:49 +0200
Subject: [PATCH v6 13/16] ASoC: mediatek: Add MT8365 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v6-13-f754ec1a7634@baylibre.com>
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
In-Reply-To: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2518; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=vnmd2mVApxPLc2R6K6xVxS7OxGsZNFmbe/RXhcwO8AY=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmcu9RBTFZeOuKXLXrXwZoDyc1QzgOCCMR27WWisOY
 1YDIi8+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZnLvUQAKCRArRkmdfjHURYhIEA
 CeXVUCni9rqNKd2DLi8IUlc5fKgW6IWa3fAQtP/LfODJVCGNrNVaCeHEsKaySSSiZ51dV7Uq2gjT+E
 a2JVk5eBflZh5FLqax8aVo4XB5BLdfoBmXx76vYPkjKj+eUOgSvkJrqt130CayO7pLPqJ3adUcqJWY
 LFuskW96CnzZsU6RBHianwApzN8MgBLGth5bJfkhxJug1Fq/L8UtN99sLrhBNw99OiKT7IpeE18LPv
 PEr1dyv/Y4jrVnjaLCvTl7Chlzs9iT4GsCyPvA1hhTKiipSGOLl9bvL3LatVpP/tA1a4HLBEclPylf
 7Poi5Hz1XgOw7AlBWqPavi0xu3DWXyEDJrzIT55eOSidGmuzhIhmu6YP1uzxNg0TAuRxeiJihcpsu9
 aLIiJPQEjlnbpHGTJhSWBmaXIfRJuWXpkOTIzGVX20xa0LKYatEjl1ExK8FFt+bPkLq6Je7Dr/Mt3L
 FHv/OVi42in/ARSAcVCuG53Ahp1V6DnqpfCqFknDwQQy0mb4UlZ+VBjSTHN7rzskOP8LBoejaU4JaT
 HXIz1AS9YEynRGgj+7VlYRasTcwS8iZ/j69SP97pCOFZ8ooWMp0DqbAwlN/xDx5/y0au4+I0L1U7Kf
 mXvttQiAEWseJQNaSwkaM+ANg6kj2tr4XbjWjTZL8OnPnRNs0E6j8ZbOGIrQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

- Add specific config to enable:
  - MT8365 sound support
  - MT6357 audio codec support
- Add the mt8365 directory and all drivers under it.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 sound/soc/mediatek/Kconfig         | 20 ++++++++++++++++++++
 sound/soc/mediatek/Makefile        |  1 +
 sound/soc/mediatek/mt8365/Makefile | 15 +++++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 5a8476e1ecca..e6f7a5a49794 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -298,3 +298,23 @@ config SND_SOC_MT8195_MT6359
 	  boards with the MT6359 and other I2S audio codecs.
 	  Select Y if you have such device.
 	  If unsure select "N".
+
+config SND_SOC_MT8365
+	tristate "ASoC support for MediaTek MT8365 chip"
+	depends on ARCH_MEDIATEK
+	select SND_SOC_MEDIATEK
+	help
+	  This adds ASoC platform driver support for MediaTek MT8365 chip
+	  that can be used with other codecs.
+	  Select Y if you have such device.
+	  If unsure select "N".
+
+config SND_SOC_MT8365_MT6357
+	tristate "ASoC Audio driver for MT8365 with MT6357 codec"
+	depends on SND_SOC_MT8365 && MTK_PMIC_WRAP
+	select SND_SOC_MT6357
+	help
+	  This adds support for ASoC machine driver for MediaTek MT8365
+	  boards with the MT6357 PMIC codec.
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


