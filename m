Return-Path: <linux-media+bounces-11642-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A15E8C9B35
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 12:27:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80188B21D8B
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 10:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8517E502B1;
	Mon, 20 May 2024 10:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AlA5RiJn"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F67314285;
	Mon, 20 May 2024 10:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716200840; cv=none; b=owYiOtaJLMdw2IkCNEAN5WtOjMNsSzanXL8YH60bF244FN/ia5XglGlop11QYALmId7fvztbo7TF8AS6BLOaG1Q0RQdqOdZOBLY7xln/T9mkojis1suBXAxwgtCN60fYQTaoflLyGMOE9aJJmGa+7GtKtLF5w5QnxRBN+Odajl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716200840; c=relaxed/simple;
	bh=wmnfc+1VyjwEV+Y5ZWHDoFiNi3DSn040I+BAWu0tAtI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XQeTuF2CuD1I5yLI3fHZKXqHhYnN0QvApYCc5U59aBROGId4AD7MPvo8Z5+TiPguxAzt/tAX89wGWDi3RGrSHjOOvmfrSDbWPySX/pKrKAEN7sz6ddlM+KCIQYhPf7BUmPkEHZ1/fw4Dbh/SQQfFzaUwA8SVXOGEvd7iiCQ4r1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AlA5RiJn; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716200836;
	bh=wmnfc+1VyjwEV+Y5ZWHDoFiNi3DSn040I+BAWu0tAtI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AlA5RiJnACx720/T1gT86qVZpBu+DU5Bh2xy0RouoAhu2pYa0/St0djDS9kRNGxc/
	 WqjqQ3uKyETFkawFVn8eilyHRaGJaUFSUUCskdBJQq/5h/m/l9bIoJt9lYjdAwDKRF
	 M9Qi8mwcCqORxKkXSVvNzCtvVs4OMM/sbycCpMiKYoMhDqx5sghn+wDD5upiWNPoFx
	 6bPv76pDmU0tbM6W6ws0sFOvxZqK7GW7ZIkvekUrQ+9SbjgiFoiqDHAtZnDOpqWsol
	 cmi1DNxt8aB0UztJR4Aqx2LUg1uFXHHeQ0+aQmjM0IDtUyV3ztrdClgmP+/f6TItna
	 JbvYTEl48AOVQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DD7333782191;
	Mon, 20 May 2024 10:27:14 +0000 (UTC)
Message-ID: <76814cba-3613-4c3e-afb5-aacf5f5db06c@collabora.com>
Date: Mon, 20 May 2024 12:27:14 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/16] ASoC: mediatek: mt8365: Add DMIC DAI support
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v4-0-082b22186d4c@baylibre.com>
 <20240226-audio-i350-v4-8-082b22186d4c@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240226-audio-i350-v4-8-082b22186d4c@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 26/04/24 19:22, Alexandre Mergnat ha scritto:
> Add Digital Micro Device Audio Interface support for MT8365 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   sound/soc/mediatek/mt8365/mt8365-dai-dmic.c | 347 ++++++++++++++++++++++++++++
>   1 file changed, 347 insertions(+)
> 
> diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-dmic.c b/sound/soc/mediatek/mt8365/mt8365-dai-dmic.c
> new file mode 100644
> index 000000000000..0dd606274d8e
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8365/mt8365-dai-dmic.c
> @@ -0,0 +1,347 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Mediatek 8365 ALSA SoC Audio DAI DMIC Control
> + *
> + * Copyright (c) 2024 MediaTek Inc.
> + * Authors: Jia Zeng <jia.zeng@mediatek.com>
> + *          Alexandre Mergnat <amergnat@baylibre.com>
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/regmap.h>
> +#include <sound/pcm_params.h>
> +#include "mt8365-afe-clk.h"
> +#include "mt8365-afe-common.h"
> +
> +struct mt8365_dmic_data {
> +	bool two_wire_mode;
> +	unsigned int clk_phase_sel_ch1;
> +	unsigned int clk_phase_sel_ch2;
> +	bool iir_on;
> +	unsigned int irr_mode;
> +	unsigned int dmic_mode;
> +	unsigned int dmic_channel;
> +};
> +
> +static int get_chan_reg(unsigned int channel)
> +{
> +	switch (channel) {
> +	case 8:
> +		fallthrough;
> +	case 7:
> +		return AFE_DMIC3_UL_SRC_CON0;
> +	case 6:
> +		fallthrough;
> +	case 5:
> +		return AFE_DMIC2_UL_SRC_CON0;
> +	case 4:
> +		fallthrough;
> +	case 3:
> +		return AFE_DMIC1_UL_SRC_CON0;
> +	case 2:
> +		fallthrough;
> +	case 1:
> +		return AFE_DMIC0_UL_SRC_CON0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +/* DAI Drivers */
> +
> +static void audio_dmic_adda_enable(struct mtk_base_afe *afe)
> +{
> +	mt8365_dai_enable_adda_on(afe);
> +	regmap_update_bits(afe->regmap, AFE_ADDA_UL_DL_CON0,
> +			   AFE_ADDA_UL_DL_DMIC_CLKDIV_ON,
> +			   AFE_ADDA_UL_DL_DMIC_CLKDIV_ON);
> +}
> +
> +static void audio_dmic_adda_disable(struct mtk_base_afe *afe)
> +{
> +	regmap_update_bits(afe->regmap, AFE_ADDA_UL_DL_CON0,
> +			   AFE_ADDA_UL_DL_DMIC_CLKDIV_ON,
> +			   ~AFE_ADDA_UL_DL_DMIC_CLKDIV_ON);
> +	mt8365_dai_disable_adda_on(afe);
> +}
> +
> +static void mt8365_dai_enable_dmic(struct mtk_base_afe *afe,
> +				   struct snd_pcm_substream *substream,
> +				   struct snd_soc_dai *dai)
> +{
> +	struct mt8365_afe_private *afe_priv = afe->platform_priv;
> +	struct mt8365_dmic_data *dmic_data = afe_priv->dai_priv[MT8365_AFE_IO_DMIC];
> +	unsigned int val_mask;
> +	int reg = get_chan_reg(dmic_data->dmic_channel);
> +
> +	if (reg < 0)
> +		return;
> +
> +	/* val and mask will be always same to enable */
> +	val_mask = DMIC_TOP_CON_CH1_ON |
> +		   DMIC_TOP_CON_CH2_ON |
> +		   DMIC_TOP_CON_SRC_ON;
> +
> +	regmap_update_bits(afe->regmap, reg, val_mask, val_mask);
> +}
> +
> +static void mt8365_dai_disable_dmic(struct mtk_base_afe *afe,
> +				    struct snd_pcm_substream *substream,
> +				    struct snd_soc_dai *dai)
> +{
> +	struct mt8365_afe_private *afe_priv = afe->platform_priv;
> +	struct mt8365_dmic_data *dmic_data = afe_priv->dai_priv[MT8365_AFE_IO_DMIC];
> +	unsigned int mask;
> +	int reg = get_chan_reg(dmic_data->dmic_channel);
> +
> +	if (reg < 0)
> +		return;
> +
> +	dev_info(afe->dev, "%s dmic_channel %d\n",
> +		 __func__, dmic_data->dmic_channel);

Please, either remove this print, or use dev_dbg().
In case you're not removing it, fits in one line.

> +
> +	mask = DMIC_TOP_CON_CH1_ON |
> +	       DMIC_TOP_CON_CH2_ON |
> +	       DMIC_TOP_CON_SRC_ON |
> +	       DMIC_TOP_CON_SDM3_LEVEL_MODE;
> +
> +	/* Set all masked values to 0 */
> +	regmap_update_bits(afe->regmap, reg, mask, 0);
> +}
> +
> +static const struct reg_sequence mt8365_dmic_iir_coeff[] = {
> +	{ AFE_DMIC0_IIR_COEF_02_01, 0x00000000 },
> +	{ AFE_DMIC0_IIR_COEF_04_03, 0x00003FB8 },
> +	{ AFE_DMIC0_IIR_COEF_06_05, 0x3FB80000 },
> +	{ AFE_DMIC0_IIR_COEF_08_07, 0x3FB80000 },
> +	{ AFE_DMIC0_IIR_COEF_10_09, 0x0000C048 },
> +	{ AFE_DMIC1_IIR_COEF_02_01, 0x00000000 },
> +	{ AFE_DMIC1_IIR_COEF_04_03, 0x00003FB8 },
> +	{ AFE_DMIC1_IIR_COEF_06_05, 0x3FB80000 },
> +	{ AFE_DMIC1_IIR_COEF_08_07, 0x3FB80000 },
> +	{ AFE_DMIC1_IIR_COEF_10_09, 0x0000C048 },
> +	{ AFE_DMIC2_IIR_COEF_02_01, 0x00000000 },
> +	{ AFE_DMIC2_IIR_COEF_04_03, 0x00003FB8 },
> +	{ AFE_DMIC2_IIR_COEF_06_05, 0x3FB80000 },
> +	{ AFE_DMIC2_IIR_COEF_08_07, 0x3FB80000 },
> +	{ AFE_DMIC2_IIR_COEF_10_09, 0x0000C048 },
> +	{ AFE_DMIC3_IIR_COEF_02_01, 0x00000000 },
> +	{ AFE_DMIC3_IIR_COEF_04_03, 0x00003FB8 },
> +	{ AFE_DMIC3_IIR_COEF_06_05, 0x3FB80000 },
> +	{ AFE_DMIC3_IIR_COEF_08_07, 0x3FB80000 },
> +	{ AFE_DMIC3_IIR_COEF_10_09, 0x0000C048 },
> +};
> +
> +static int mt8365_dai_load_dmic_iir_coeff_table(struct mtk_base_afe *afe)
> +{
> +	return regmap_multi_reg_write(afe->regmap,
> +				      mt8365_dmic_iir_coeff,
> +				      ARRAY_SIZE(mt8365_dmic_iir_coeff));
> +}
> +
> +static int mt8365_dai_configure_dmic(struct mtk_base_afe *afe,
> +				     struct snd_pcm_substream *substream,
> +				     struct snd_soc_dai *dai)
> +{
> +	struct mt8365_afe_private *afe_priv = afe->platform_priv;
> +	struct mt8365_dmic_data *dmic_data = afe_priv->dai_priv[MT8365_AFE_IO_DMIC];
> +	bool two_wire_mode = dmic_data->two_wire_mode;
> +	unsigned int clk_phase_sel_ch1 = dmic_data->clk_phase_sel_ch1;
> +	unsigned int clk_phase_sel_ch2 = dmic_data->clk_phase_sel_ch2;
> +	unsigned int val = 0;
> +	unsigned int mask = 0;
> +	unsigned int rate = dai->rate;
> +	int reg = get_chan_reg(dai->channels);
> +
> +	if (reg < 0)
> +		return -EINVAL;
> +
> +	dmic_data->dmic_channel = dai->channels;
> +
> +	val |= DMIC_TOP_CON_SDM3_LEVEL_MODE;
> +	mask |= DMIC_TOP_CON_SDM3_LEVEL_MODE;
> +
> +	if (two_wire_mode) {
> +		val |= DMIC_TOP_CON_TWO_WIRE_MODE;
> +		mask |= DMIC_TOP_CON_TWO_WIRE_MODE;
> +	} else {
> +		val |= FIELD_PREP(DMIC_TOP_CON_CK_PHASE_SEL_CH1,
> +				  clk_phase_sel_ch1);
> +		val |= FIELD_PREP(DMIC_TOP_CON_CK_PHASE_SEL_CH2,
> +				  clk_phase_sel_ch2);
> +		mask |= DMIC_TOP_CON_CK_PHASE_SEL_CH1;
> +		mask |= DMIC_TOP_CON_CK_PHASE_SEL_CH2;
> +	}
> +
> +	switch (rate) {
> +	case 48000:
> +		val |= DMIC_TOP_CON_VOICE_MODE_48K;
> +		break;
> +	case 32000:
> +		val |= DMIC_TOP_CON_VOICE_MODE_32K;
> +		break;
> +	case 16000:
> +		val |= DMIC_TOP_CON_VOICE_MODE_16K;
> +		break;
> +	case 8000:
> +		val |= DMIC_TOP_CON_VOICE_MODE_8K;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	mask |= DMIC_TOP_CON_VOICE_MODE_MASK;

You initialize the mask...

> +
> +	regmap_update_bits(afe->regmap, reg, DMIC_TOP_CON_CONFIG_MASK, val);

...but then you don't use it? :-)

> +
> +	return 0;
> +}


Cheers,
Angelo


