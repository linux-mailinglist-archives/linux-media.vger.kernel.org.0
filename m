Return-Path: <linux-media+bounces-13718-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D6490F12B
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 16:49:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB4571C2409C
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 14:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159F1152531;
	Wed, 19 Jun 2024 14:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="D0da/ffR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A246150981
	for <linux-media@vger.kernel.org>; Wed, 19 Jun 2024 14:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718808422; cv=none; b=hRZRpRautHqkdKqgjLJ3mfqfyL/LHtZH9tufCFKh92RvyVPBTFq+upCwfkQKEgkgy/iRf/sfRHMziwhRQV+XQo1ai5qNsCrds3G91TnaEfz+eIAsNVtldfvSaG+IZ5ec5X5JDyG+v3Vk5auPs+uDag2xhWnsXDfpgYkfIUH74vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718808422; c=relaxed/simple;
	bh=fmlf0bc9F41+TvcfaGY0F47V2fRUbpB6vlMcFvgwFUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jqzwqsvyshnVOxZSF0ItnfOQKoCb5Xyxi6ABRiNo6O+Ec1mS/jPZNaQDf8GdzBIul3OSmCgeF5wypApWqer/u3SxGA3OG8kBiY40OjKs9RFACfq6V4ziZnw8UkjJH6CQIdfTLCOBJvE+ddGjCmYoTUbILsjQZKHceZ3/HaGvy6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=D0da/ffR; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-57d0eca877cso1088622a12.2
        for <linux-media@vger.kernel.org>; Wed, 19 Jun 2024 07:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718808418; x=1719413218; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T6IZnq7j2sV1/M6T8jj6UPbyiVEGD86209uSCUxRrlE=;
        b=D0da/ffR8gzjFID3tGyxznVv3WsHhiiOLKhIsHLQ1vhE4giQfzfXdRTBTy10Yq9x5Q
         tuxk4VCAnzfAQMYQeTzETj4rkGOHwojhrU+uwVyzpLeVJXkH9hbRUfsvK2IhbJhOJhpO
         2o9zqF+Aosa1qBRDfcvjvy/S1+DMnqoz86+qsfzexuiNueb/BPwJ6VPxlOV6lXW6Ffsg
         Xdt4WBhMlwaC+Mq+Gp0X6GuzU4FR7lPc/VK3yVMdT0vzVwHJ9zq2ht+Y6TyJNgNd0JC1
         RJmUw3OyX1/fp1d8JsZBhNybRO4OPJqgjir4OPU3CEy0owddDQFK1CjHZ0ZeeQp/M3Ad
         m9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718808418; x=1719413218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T6IZnq7j2sV1/M6T8jj6UPbyiVEGD86209uSCUxRrlE=;
        b=VvG9wNOKUJ0pdYcvQOdYsK7lBw6YDKjYz95nJEPApPKhV1t81Ddpm8CQSR4VQeMAlo
         MWsGhfCCpbAOmNWYTLV3ZjEdeQCAXX/ulskczxTIeTlv6XsGH2pPt+iXozKgLmYIT5Lt
         C9bFH5Ujjdely33EvdYU7WJ+48JLfAPAeJSO1bedv+WNZF61l5HsSseZe5+hgtEcLh7J
         Y0pN4CL8UjBWKmXRZk/hrosmMKWztaGLkh8kxhU7x70T+oIyaoGWQgxFterCdazVrmyb
         wg9EwU6yvy1sV+SiPpkpsJqlE7hJ1L+tw0iMI9EvHdEQkOzD7eO6yuvjZVx1R9U0s34I
         K8gQ==
X-Forwarded-Encrypted: i=1; AJvYcCUn7/nGqatsFBQYKJcWpUQCxcoj84tCA1j2p1xdy3tc6xS32jiaZvadOcDO4dmqV74+T2vohxqAhO7LUyIZtZP41ZtzQL7SYXkfRwg=
X-Gm-Message-State: AOJu0YzAjZmO0BpdcewK9GXcDOMCMQs8SlnWdT8sSCTTxka1xTSqhJ/8
	QYaBNlukc+3pmcQqayLDnNzgpPWey0XA8XGPi0YH2e4Iszx3zlVGtE/dGt2M0XA=
X-Google-Smtp-Source: AGHT+IHj5XjjIU33a6xtAo+lTUu5VZNuR7f207wVS4oregFKPpT60M+iQAqKCeAgFEurgDGAL9mkhA==
X-Received: by 2002:a17:906:6298:b0:a6f:b819:31d1 with SMTP id a640c23a62f3a-a6fb8193248mr94155966b.45.1718808418568;
        Wed, 19 Jun 2024 07:46:58 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a6f56da32c3sm679787566b.13.2024.06.19.07.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 07:46:57 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 19 Jun 2024 16:46:44 +0200
Subject: [PATCH v6 08/16] ASoC: mediatek: mt8365: Add DMIC DAI support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v6-8-f754ec1a7634@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10476;
 i=amergnat@baylibre.com; h=from:subject:message-id;
 bh=fmlf0bc9F41+TvcfaGY0F47V2fRUbpB6vlMcFvgwFUc=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmcu9Qy5vC96/jkOCmbNdgqDcNmDnYxksKOtsrg25X
 9b12cvmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZnLvUAAKCRArRkmdfjHURSsTEA
 C4+t/jE9zQ6aSvV0mja95597cHJfL/FVPw3aZNsFigo5rsetWmq7Rg/eUpEdmX+/57Vdf3ud2Ko47G
 KMtBubWMxgNDyUqgk0Q7rIFjw2G/siZcxHEbQ0pF1uqiMyUE58m4HVp5tk18ZaKLdoET7sh8/lB4Ps
 OXd9xgQGxPYyyd8+iXoo1YqNwkBdVHVbTNzqW/eb4Ks7DVIkE8Pz5ks6yAdm1kBvIwYmew7l61dpKw
 L6t+QscCRApIYiDLHdx64EYAtVgTCaU7yGkthoV+oUrKTlwerGqT+oTOZygdtwjr5gSwxKJM2La8Zq
 C+tx8IbTP1WMGUoRiPP9CrhuApSR33r9eG/CXEASIIDh37Tth+OltlvVv6uFfUmfZTnP40KRMlHCZX
 fhkgUbvDXB8TPjBa7zhMoLQ03KydM6qslkbe7szOIzwAxhpQ1qvcyiA0ldbNoNeo9GHqLL2V+w1W7Q
 XDnn+RK9pT9DNK7TFhjHa6TQWXd8+jDf2mGGSpxG/0gABeE/I3H2vPgGsKoE5FVVm5HuBlROZ1AHz2
 TiaF00/nZRzA0QFdNnaYcWrBG241Fob/O97QDCTTJknyGI1e3K8GPtWf8YjC5jDqoTQZv66djKo8bH
 msMYMvprW0rOuhvkv10uWWRzRgGUFxOaMV/00GPnCF8wBKsCQ2Cofp98boFw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Add Digital Micro Device Audio Interface support for MT8365 SoC.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 sound/soc/mediatek/mt8365/mt8365-dai-dmic.c | 340 ++++++++++++++++++++++++++++
 1 file changed, 340 insertions(+)

diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-dmic.c b/sound/soc/mediatek/mt8365/mt8365-dai-dmic.c
new file mode 100644
index 000000000000..a3bf54751420
--- /dev/null
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-dmic.c
@@ -0,0 +1,340 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * MediaTek 8365 ALSA SoC Audio DAI DMIC Control
+ *
+ * Copyright (c) 2024 MediaTek Inc.
+ * Authors: Jia Zeng <jia.zeng@mediatek.com>
+ *          Alexandre Mergnat <amergnat@baylibre.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/regmap.h>
+#include <sound/pcm_params.h>
+#include "mt8365-afe-clk.h"
+#include "mt8365-afe-common.h"
+
+struct mt8365_dmic_data {
+	bool two_wire_mode;
+	unsigned int clk_phase_sel_ch1;
+	unsigned int clk_phase_sel_ch2;
+	bool iir_on;
+	unsigned int irr_mode;
+	unsigned int dmic_mode;
+	unsigned int dmic_channel;
+};
+
+static int get_chan_reg(unsigned int channel)
+{
+	switch (channel) {
+	case 8:
+		fallthrough;
+	case 7:
+		return AFE_DMIC3_UL_SRC_CON0;
+	case 6:
+		fallthrough;
+	case 5:
+		return AFE_DMIC2_UL_SRC_CON0;
+	case 4:
+		fallthrough;
+	case 3:
+		return AFE_DMIC1_UL_SRC_CON0;
+	case 2:
+		fallthrough;
+	case 1:
+		return AFE_DMIC0_UL_SRC_CON0;
+	default:
+		return -EINVAL;
+	}
+}
+
+/* DAI Drivers */
+
+static void audio_dmic_adda_enable(struct mtk_base_afe *afe)
+{
+	mt8365_dai_enable_adda_on(afe);
+	regmap_update_bits(afe->regmap, AFE_ADDA_UL_DL_CON0,
+			   AFE_ADDA_UL_DL_DMIC_CLKDIV_ON,
+			   AFE_ADDA_UL_DL_DMIC_CLKDIV_ON);
+}
+
+static void audio_dmic_adda_disable(struct mtk_base_afe *afe)
+{
+	regmap_update_bits(afe->regmap, AFE_ADDA_UL_DL_CON0,
+			   AFE_ADDA_UL_DL_DMIC_CLKDIV_ON,
+			   ~AFE_ADDA_UL_DL_DMIC_CLKDIV_ON);
+	mt8365_dai_disable_adda_on(afe);
+}
+
+static void mt8365_dai_enable_dmic(struct mtk_base_afe *afe,
+				   struct snd_pcm_substream *substream,
+				   struct snd_soc_dai *dai)
+{
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	struct mt8365_dmic_data *dmic_data = afe_priv->dai_priv[MT8365_AFE_IO_DMIC];
+	unsigned int val_mask;
+	int reg = get_chan_reg(dmic_data->dmic_channel);
+
+	if (reg < 0)
+		return;
+
+	/* val and mask will be always same to enable */
+	val_mask = DMIC_TOP_CON_CH1_ON |
+		   DMIC_TOP_CON_CH2_ON |
+		   DMIC_TOP_CON_SRC_ON;
+
+	regmap_update_bits(afe->regmap, reg, val_mask, val_mask);
+}
+
+static void mt8365_dai_disable_dmic(struct mtk_base_afe *afe,
+				    struct snd_pcm_substream *substream,
+				    struct snd_soc_dai *dai)
+{
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	struct mt8365_dmic_data *dmic_data = afe_priv->dai_priv[MT8365_AFE_IO_DMIC];
+	unsigned int mask;
+	int reg = get_chan_reg(dmic_data->dmic_channel);
+
+	if (reg < 0)
+		return;
+
+	dev_dbg(afe->dev, "%s dmic_channel %d\n", __func__, dmic_data->dmic_channel);
+
+	mask = DMIC_TOP_CON_CH1_ON |
+	       DMIC_TOP_CON_CH2_ON |
+	       DMIC_TOP_CON_SRC_ON |
+	       DMIC_TOP_CON_SDM3_LEVEL_MODE;
+
+	/* Set all masked values to 0 */
+	regmap_update_bits(afe->regmap, reg, mask, 0);
+}
+
+static const struct reg_sequence mt8365_dmic_iir_coeff[] = {
+	{ AFE_DMIC0_IIR_COEF_02_01, 0x00000000 },
+	{ AFE_DMIC0_IIR_COEF_04_03, 0x00003FB8 },
+	{ AFE_DMIC0_IIR_COEF_06_05, 0x3FB80000 },
+	{ AFE_DMIC0_IIR_COEF_08_07, 0x3FB80000 },
+	{ AFE_DMIC0_IIR_COEF_10_09, 0x0000C048 },
+	{ AFE_DMIC1_IIR_COEF_02_01, 0x00000000 },
+	{ AFE_DMIC1_IIR_COEF_04_03, 0x00003FB8 },
+	{ AFE_DMIC1_IIR_COEF_06_05, 0x3FB80000 },
+	{ AFE_DMIC1_IIR_COEF_08_07, 0x3FB80000 },
+	{ AFE_DMIC1_IIR_COEF_10_09, 0x0000C048 },
+	{ AFE_DMIC2_IIR_COEF_02_01, 0x00000000 },
+	{ AFE_DMIC2_IIR_COEF_04_03, 0x00003FB8 },
+	{ AFE_DMIC2_IIR_COEF_06_05, 0x3FB80000 },
+	{ AFE_DMIC2_IIR_COEF_08_07, 0x3FB80000 },
+	{ AFE_DMIC2_IIR_COEF_10_09, 0x0000C048 },
+	{ AFE_DMIC3_IIR_COEF_02_01, 0x00000000 },
+	{ AFE_DMIC3_IIR_COEF_04_03, 0x00003FB8 },
+	{ AFE_DMIC3_IIR_COEF_06_05, 0x3FB80000 },
+	{ AFE_DMIC3_IIR_COEF_08_07, 0x3FB80000 },
+	{ AFE_DMIC3_IIR_COEF_10_09, 0x0000C048 },
+};
+
+static int mt8365_dai_load_dmic_iir_coeff_table(struct mtk_base_afe *afe)
+{
+	return regmap_multi_reg_write(afe->regmap,
+				      mt8365_dmic_iir_coeff,
+				      ARRAY_SIZE(mt8365_dmic_iir_coeff));
+}
+
+static int mt8365_dai_configure_dmic(struct mtk_base_afe *afe,
+				     struct snd_pcm_substream *substream,
+				     struct snd_soc_dai *dai)
+{
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	struct mt8365_dmic_data *dmic_data = afe_priv->dai_priv[MT8365_AFE_IO_DMIC];
+	bool two_wire_mode = dmic_data->two_wire_mode;
+	unsigned int clk_phase_sel_ch1 = dmic_data->clk_phase_sel_ch1;
+	unsigned int clk_phase_sel_ch2 = dmic_data->clk_phase_sel_ch2;
+	unsigned int val = 0;
+	unsigned int rate = dai->rate;
+	int reg = get_chan_reg(dai->channels);
+
+	if (reg < 0)
+		return -EINVAL;
+
+	dmic_data->dmic_channel = dai->channels;
+
+	val |= DMIC_TOP_CON_SDM3_LEVEL_MODE;
+
+	if (two_wire_mode) {
+		val |= DMIC_TOP_CON_TWO_WIRE_MODE;
+	} else {
+		val |= FIELD_PREP(DMIC_TOP_CON_CK_PHASE_SEL_CH1,
+				  clk_phase_sel_ch1);
+		val |= FIELD_PREP(DMIC_TOP_CON_CK_PHASE_SEL_CH2,
+				  clk_phase_sel_ch2);
+	}
+
+	switch (rate) {
+	case 48000:
+		val |= DMIC_TOP_CON_VOICE_MODE_48K;
+		break;
+	case 32000:
+		val |= DMIC_TOP_CON_VOICE_MODE_32K;
+		break;
+	case 16000:
+		val |= DMIC_TOP_CON_VOICE_MODE_16K;
+		break;
+	case 8000:
+		val |= DMIC_TOP_CON_VOICE_MODE_8K;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	regmap_update_bits(afe->regmap, reg, DMIC_TOP_CON_CONFIG_MASK, val);
+
+	return 0;
+}
+
+static int mt8365_dai_dmic_startup(struct snd_pcm_substream *substream,
+				   struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+
+	mt8365_afe_enable_main_clk(afe);
+
+	mt8365_afe_enable_top_cg(afe, MT8365_TOP_CG_DMIC0_ADC);
+	mt8365_afe_enable_top_cg(afe, MT8365_TOP_CG_DMIC1_ADC);
+	mt8365_afe_enable_top_cg(afe, MT8365_TOP_CG_DMIC2_ADC);
+	mt8365_afe_enable_top_cg(afe, MT8365_TOP_CG_DMIC3_ADC);
+
+	audio_dmic_adda_enable(afe);
+
+	return 0;
+}
+
+static void mt8365_dai_dmic_shutdown(struct snd_pcm_substream *substream,
+				     struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+
+	mt8365_dai_disable_dmic(afe, substream, dai);
+	audio_dmic_adda_disable(afe);
+	/* HW Request delay 125us before CG off */
+	usleep_range(125, 300);
+	mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_DMIC3_ADC);
+	mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_DMIC2_ADC);
+	mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_DMIC1_ADC);
+	mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_DMIC0_ADC);
+
+	mt8365_afe_disable_main_clk(afe);
+}
+
+static int mt8365_dai_dmic_prepare(struct snd_pcm_substream *substream,
+				   struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+
+	mt8365_dai_configure_dmic(afe, substream, dai);
+	mt8365_dai_enable_dmic(afe, substream, dai);
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops mt8365_afe_dmic_ops = {
+	.startup	= mt8365_dai_dmic_startup,
+	.shutdown	= mt8365_dai_dmic_shutdown,
+	.prepare	= mt8365_dai_dmic_prepare,
+};
+
+static struct snd_soc_dai_driver mtk_dai_dmic_driver[] = {
+	{
+		.name = "DMIC",
+		.id = MT8365_AFE_IO_DMIC,
+		.capture = {
+			.stream_name = "DMIC Capture",
+			.channels_min = 1,
+			.channels_max = 8,
+			.rates = SNDRV_PCM_RATE_16000 |
+				 SNDRV_PCM_RATE_32000 |
+				 SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
+		},
+		.ops = &mt8365_afe_dmic_ops,
+	}
+};
+
+/* DAI Controls */
+
+/* Values for 48kHz mode */
+static const char * const iir_mode_src[] = {
+	"SW custom", "5Hz", "10Hz", "25Hz", "50Hz", "65Hz"
+};
+
+static SOC_ENUM_SINGLE_DECL(iir_mode, AFE_DMIC0_UL_SRC_CON0, 7, iir_mode_src);
+
+static const struct snd_kcontrol_new mtk_dai_dmic_controls[] = {
+	SOC_SINGLE("DMIC IIR Switch", AFE_DMIC0_UL_SRC_CON0, DMIC_TOP_CON_IIR_ON, 1, 0),
+	SOC_ENUM("DMIC IIR Mode", iir_mode),
+};
+
+/* DAI widget */
+
+static const struct snd_soc_dapm_widget mtk_dai_dmic_widgets[] = {
+	SND_SOC_DAPM_INPUT("DMIC In"),
+};
+
+/* DAI route */
+
+static const struct snd_soc_dapm_route mtk_dai_dmic_routes[] = {
+	{"I14", NULL, "DMIC Capture"},
+	{"I15", NULL, "DMIC Capture"},
+	{"I16", NULL, "DMIC Capture"},
+	{"I17", NULL, "DMIC Capture"},
+	{"I18", NULL, "DMIC Capture"},
+	{"I19", NULL, "DMIC Capture"},
+	{"I20", NULL, "DMIC Capture"},
+	{"I21", NULL, "DMIC Capture"},
+	{"DMIC Capture", NULL, "DMIC In"},
+};
+
+static int init_dmic_priv_data(struct mtk_base_afe *afe)
+{
+	struct mt8365_afe_private *afe_priv = afe->platform_priv;
+	struct mt8365_dmic_data *dmic_priv;
+	struct device_node *np = afe->dev->of_node;
+	unsigned int temps[4];
+	int ret;
+
+	dmic_priv = devm_kzalloc(afe->dev, sizeof(*dmic_priv), GFP_KERNEL);
+	if (!dmic_priv)
+		return -ENOMEM;
+
+	ret = of_property_read_u32_array(np, "mediatek,dmic-mode",
+					 &temps[0],
+					 1);
+	if (ret == 0)
+		dmic_priv->two_wire_mode = !!temps[0];
+
+	if (!dmic_priv->two_wire_mode) {
+		dmic_priv->clk_phase_sel_ch1 = 0;
+		dmic_priv->clk_phase_sel_ch2 = 4;
+	}
+
+	afe_priv->dai_priv[MT8365_AFE_IO_DMIC] = dmic_priv;
+	return 0;
+}
+
+int mt8365_dai_dmic_register(struct mtk_base_afe *afe)
+{
+	struct mtk_base_afe_dai *dai;
+
+	dai = devm_kzalloc(afe->dev, sizeof(*dai), GFP_KERNEL);
+	if (!dai)
+		return -ENOMEM;
+
+	list_add(&dai->list, &afe->sub_dais);
+	dai->dai_drivers = mtk_dai_dmic_driver;
+	dai->num_dai_drivers = ARRAY_SIZE(mtk_dai_dmic_driver);
+	dai->controls = mtk_dai_dmic_controls;
+	dai->num_controls = ARRAY_SIZE(mtk_dai_dmic_controls);
+	dai->dapm_widgets = mtk_dai_dmic_widgets;
+	dai->num_dapm_widgets = ARRAY_SIZE(mtk_dai_dmic_widgets);
+	dai->dapm_routes = mtk_dai_dmic_routes;
+	dai->num_dapm_routes = ARRAY_SIZE(mtk_dai_dmic_routes);
+	return init_dmic_priv_data(afe);
+}

-- 
2.25.1


