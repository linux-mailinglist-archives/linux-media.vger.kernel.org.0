Return-Path: <linux-media+bounces-11644-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF538C9B3D
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 12:27:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64863281324
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 10:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7571A535B8;
	Mon, 20 May 2024 10:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iRPzVxMa"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D8C51009;
	Mon, 20 May 2024 10:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716200842; cv=none; b=q71xgJ4J2fwQoOnW3FdDGc3n3P2hhDtweusiKBF1gyqH4v+i7+joFc41SrlBoz9otbjLt1/eZc3oG9JJDSaYGwWO0alG+Bv6cTLLwnmLj7kQ+ZKPti8oAdwTzkyCw5ftNN0FyITwsmtZWDJlPAw8m2pxMzwDz1bLOnTYtMDBheI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716200842; c=relaxed/simple;
	bh=KA9MSaTYmZsz++15EAhjV8/xPkgMj2Iybkg4SfBI2OI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jmk4d7Vn2SjaXA0cwtdL3AVnroWhl+MqzrgUtuIPK6NiAVwiidnCFW+PMIlaC+w6sK1OteJVZALgxcsXaj7I8A/1OtpKAXI9i2lq4gTU9cWygLMOduSUNjiYiPNp3EUf+6AJQZ3HIAxeFNwF/Q0VHimW1q7vwUtqZlCXis5W4CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=iRPzVxMa; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716200840;
	bh=KA9MSaTYmZsz++15EAhjV8/xPkgMj2Iybkg4SfBI2OI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iRPzVxMaplz58k8R5qeUrwqpiMOCYFtZ+rIBE+qrf+71XXrIdgQFz8iCGixC9A03W
	 YEG0gDcgHYEe1QcQE+7wCD+c6uAgi//eMq1UQroeGUj5Xnb+Jf2JjLSgnxRY9kZd2U
	 Ws3UwbiC4mD6gMxroFxY1WGRdoKWsOJBbjvSLh0hckBy+Jvz8S+msrfiOR1JjIi2Q2
	 /x7EHXPLS28yY89kkwK/hJhoBnnoKUG/ELRxL759reaCnfL4eRkcWr4aXqHMmuT5Mh
	 vA0Jv+fkw8WvKdXrEp9iHZgKKjkZgOiVgOZCth1e0Qjw53jHR9qyHlZIaTvn9gmPzv
	 pZXBuAk6Yz29g==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9C94D378219E;
	Mon, 20 May 2024 10:27:18 +0000 (UTC)
Message-ID: <a693b696-92cf-48cf-8c9d-17aa7f182d98@collabora.com>
Date: Mon, 20 May 2024 12:27:18 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/16] ASoC: mediatek: mt8365: Add ADDA DAI support
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
 <20240226-audio-i350-v4-7-082b22186d4c@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240226-audio-i350-v4-7-082b22186d4c@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 26/04/24 19:22, Alexandre Mergnat ha scritto:
> Add ADDA Device Audio Interface support for MT8365 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   sound/soc/mediatek/mt8365/mt8365-dai-adda.c | 315 ++++++++++++++++++++++++++++
>   1 file changed, 315 insertions(+)
> 
> diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-adda.c b/sound/soc/mediatek/mt8365/mt8365-dai-adda.c
> new file mode 100644
> index 000000000000..65d45010ac90
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8365/mt8365-dai-adda.c
> @@ -0,0 +1,315 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Mediatek 8365 ALSA SoC Audio DAI ADDA Control
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
> +#include "../common/mtk-dai-adda-common.h"
> +
> +static int adda_afe_on_ref_cnt;
> +
> +/* DAI Drivers */
> +
> +static int mt8365_dai_set_adda_out(struct mtk_base_afe *afe, unsigned int rate)
> +{
> +	unsigned int val;
> +

if (rate == 8000 || rate == 16000)
	val = AFE_ADDA_DL_VOICE_DATA;
else
	val = 0;

> +	switch (rate) {
> +	case 8000:
> +		val = AFE_ADDA_DL_VOICE_DATA;
> +		break;
> +	case 16000:
> +		val = AFE_ADDA_DL_VOICE_DATA;
> +		break;
> +	default:
> +		val = 0;
> +	}
> +
> +	val |= FIELD_PREP(AFE_ADDA_DL_SAMPLING_RATE,
> +		mtk_adda_dl_rate_transform(afe, rate));
> +	val |= AFE_ADDA_DL_8X_UPSAMPLE |
> +	       AFE_ADDA_DL_MUTE_OFF_CH1 |
> +	       AFE_ADDA_DL_MUTE_OFF_CH2 |
> +	       AFE_ADDA_DL_DEGRADE_GAIN;
> +
> +	regmap_update_bits(afe->regmap, AFE_ADDA_PREDIS_CON0, 0xffffffff, 0);
> +	regmap_update_bits(afe->regmap, AFE_ADDA_PREDIS_CON1, 0xffffffff, 0);
> +	regmap_update_bits(afe->regmap, AFE_ADDA_DL_SRC2_CON0, 0xffffffff, val);
> +	/* SA suggest apply -0.3db to audio/speech path */
> +	regmap_update_bits(afe->regmap, AFE_ADDA_DL_SRC2_CON1,
> +			   0xffffffff, 0xf74f0000);
> +	/* SA suggest use default value for sdm */
> +	regmap_update_bits(afe->regmap, AFE_ADDA_DL_SDM_DCCOMP_CON,
> +			   0xffffffff, 0x0700701e);
> +
> +	return 0;
> +}
> +
> +static int mt8365_dai_set_adda_in(struct mtk_base_afe *afe, unsigned int rate)
> +{
> +	unsigned int val;
> +
> +	val = FIELD_PREP(AFE_ADDA_UL_SAMPLING_RATE,
> +			 mtk_adda_ul_rate_transform(afe, rate));
> +	regmap_update_bits(afe->regmap, AFE_ADDA_UL_SRC_CON0,
> +			   AFE_ADDA_UL_SAMPLING_RATE, val);
> +	/* Using Internal ADC */
> +	regmap_update_bits(afe->regmap, AFE_ADDA_TOP_CON0, 0x1, 0x0);
> +
> +	return 0;
> +}
> +
> +int mt8365_dai_enable_adda_on(struct mtk_base_afe *afe)
> +{
> +	unsigned long flags;
> +	struct mt8365_afe_private *afe_priv = afe->platform_priv;
> +
> +	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
> +
> +	adda_afe_on_ref_cnt++;
> +	if (adda_afe_on_ref_cnt == 1)
> +		regmap_update_bits(afe->regmap, AFE_ADDA_UL_DL_CON0,
> +				   AFE_ADDA_UL_DL_ADDA_AFE_ON,
> +				   AFE_ADDA_UL_DL_ADDA_AFE_ON);
> +
> +	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
> +
> +	return 0;
> +}
> +
> +int mt8365_dai_disable_adda_on(struct mtk_base_afe *afe)
> +{
> +	unsigned long flags;
> +	struct mt8365_afe_private *afe_priv = afe->platform_priv;
> +
> +	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
> +
> +	adda_afe_on_ref_cnt--;
> +	if (adda_afe_on_ref_cnt == 0)
> +		regmap_update_bits(afe->regmap, AFE_ADDA_UL_DL_CON0,
> +				   AFE_ADDA_UL_DL_ADDA_AFE_ON,
> +				   ~AFE_ADDA_UL_DL_ADDA_AFE_ON);
> +	else if (adda_afe_on_ref_cnt < 0)
> +		adda_afe_on_ref_cnt = 0;

Should we dev_warn() here? The refcount should never be less than zero - if it is,
then there's some issue somewhere that must be solved.

> +
> +	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
> +
> +	return 0;
> +}
> +

Cheers,
Angelo


