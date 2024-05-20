Return-Path: <linux-media+bounces-11646-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA30D8C9B50
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 12:30:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A8CB1F22E5C
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 10:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF59453384;
	Mon, 20 May 2024 10:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MSaBSEkV"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF0741A8F;
	Mon, 20 May 2024 10:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716201019; cv=none; b=DeiMIihWw6i9heGXAS7tKuAhE7dt5MA2my4bQRkTw6bhPnErU0p5uK8glFavmoQjoR/oGhVMNzI6JbrMEPpSfwKaIv3Ni6dgSVCLDcVkiJ6Rx9YB65h1WUxH/jlFK94Oa5DDu79JlHPns/I248VOfxpntvlEzWhx8uSor1ttrs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716201019; c=relaxed/simple;
	bh=4aFYaGvqOiJ+8i1j+s6ErI95fgrhOe7P9QJgg8TqH9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hCF4JJhU4Kzq2yPdoinXX28gVYP9HQSj1Hvmmzsj5gKaejiIeelKVOgyI4XS8H/nF7MqDbrxRR81UGFYCkXRqFLU+9LYV63BF/xR7FESkf9kn3xg1ga4zSr9Ho0vRYjmnaJHfbcOFHmj89BMamFwTDhndirg2Jj2BN/wgQg5lS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MSaBSEkV; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716201016;
	bh=4aFYaGvqOiJ+8i1j+s6ErI95fgrhOe7P9QJgg8TqH9A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MSaBSEkVvttyh3zC6ZrNwFY+aBzRc9cFbbcgiHlUiepPokaejOwLmNuGgEqycHlqx
	 AEoQBlbur8mu86CMP526zqViSmJNtihuvl6Gda6Oh7Q22+sa9wjF+WM/3eey6DKvBG
	 SJAJ/4AqSqPAzoajY1o8Tv10n7oCmny+XX0tygTD/U7Z+zfnRjHVZJf2ris6EKKSUE
	 9azsQpRI1ojbzbwCwPA6MVOtM9NmktAS7zgL8CdDFztavEOnJZo8PKnvgATlGxcNfD
	 fWdDPxb0FgDZtOyP8HztJe0ADF4Ruo0VWKGXVOxwQ5XMztZoPS9PXNwRHPCFeQbwPU
	 +hbDuok8X+gGw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5FF4F3782191;
	Mon, 20 May 2024 10:30:14 +0000 (UTC)
Message-ID: <e53833a2-42a9-409c-9f98-306e0a0292a1@collabora.com>
Date: Mon, 20 May 2024 12:30:13 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/16] ASoc: mediatek: mt8365: Add a specific soundcard
 for EVK
To: amergnat@baylibre.com, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
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
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nicolas Belin <nbelin@baylibre.com>
References: <20240226-audio-i350-v4-0-082b22186d4c@baylibre.com>
 <20240226-audio-i350-v4-10-082b22186d4c@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240226-audio-i350-v4-10-082b22186d4c@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 26/04/24 19:22, amergnat@baylibre.com ha scritto:
> From: Nicolas Belin <nbelin@baylibre.com>
> 
> Add a specific soundcard for mt8365-evk. It supports audio jack
> in/out, dmics, the amic and lineout.
> 
> Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   sound/soc/mediatek/mt8365/mt8365-mt6357.c | 348 ++++++++++++++++++++++++++++++
>   1 file changed, 348 insertions(+)
> 
> diff --git a/sound/soc/mediatek/mt8365/mt8365-mt6357.c b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
> new file mode 100644
> index 000000000000..a65f668103da
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
> @@ -0,0 +1,348 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Mediatek MT8365 Sound Card driver
> + *
> + * Copyright (c) 2024 MediaTek Inc.
> + * Authors: Nicolas Belin <nbelin@baylibre.com>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/of_gpio.h>
> +#include <sound/soc.h>
> +#include <sound/pcm_params.h>
> +#include "mt8365-afe-common.h"
> +#include <linux/pinctrl/consumer.h>
> +#include "../common/mtk-soc-card.h"
> +#include "../common/mtk-soundcard-driver.h"
> +

..snip..

> +
> +static const struct mtk_soundcard_pdata mt8365_mt6357_card = {
> +	.card_name = "mt8365-mt6357",
> +	.card_data = &(struct mtk_platform_card_data) {
> +		.card = &mt8365_mt6357_soc_card,
> +	},
> +	.soc_probe = mt8365_mt6357_dev_probe
> +};
> +
> +static const struct of_device_id mt8365_mt6357_dt_match[] = {
> +	{
> +		.compatible = "mediatek,mt8365-mt6357",
> +		.data = &mt8365_mt6357_card,
> +	},
> +	{ }

Please, compress and add sentinel

{ .compatible = "mediatek,mt8365-mt6357", .data = &mt8365_mt6357_card },
{ /* sentinel */ }

after which

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



