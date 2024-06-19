Return-Path: <linux-media+bounces-13670-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CC690E791
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 11:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 261E01C217BC
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 09:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B59B182866;
	Wed, 19 Jun 2024 09:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JF8R5ZHE"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB98B8248C;
	Wed, 19 Jun 2024 09:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718790975; cv=none; b=SIg6IW79WwZiJeWwBfoHX+P6VSwwddlEU6qBGWw2k6Av9HTFUg+jkkekijEDDaWLGBU6dnsWjRlcdO0OgN/CNHiWDtTSmW9OPo3R1WMXO7a++qsjCJm2IpJlZHJ6h92KI3LDVCXmFArHhyuAXKktRjPYYNl9OOfxYCP2Ya2j6VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718790975; c=relaxed/simple;
	bh=Y7T7l2wiKLsecC0XGOVIJK4YUv24/jXrKqNK1hO4nr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u+oJ1vdckqro+/IqnKrINplbEYSTt28eS+ijKrARxX/QyLzEoNcqxaS80c3DJpYWeATLgZGwlnKbz006+r+zLEW4WqleOSZePmuLBrCg0VnDcAu26+2cBYP2qb51OwxmCdRJ0p3TNr+831kpIMcTTWp88wvmZtR0woqvK2Cf+7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JF8R5ZHE; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718790972;
	bh=Y7T7l2wiKLsecC0XGOVIJK4YUv24/jXrKqNK1hO4nr4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JF8R5ZHE0cX3H6/04BxiQ7Pdcrk2wx2KDP/Ze3hLJFTAZFbNfQX0Rb1hawmRHhpQL
	 piFvcjTZudgEUrlKkBirxpnPZVMrlJDd2DpPE5bNHIgVpi/StY9nNTVJU6owj+/aw7
	 MQw37Kx3g7jlV+4tu3vSZm/Hbxz4HwcHZGt6rIW4XhoKukdtmsRjSF3/ESylXasWSa
	 r2yojhWkdOP50umZnJDyvcxO12s5ShAgHrEYD4VbcGEsOotA3MjS121lbACc/2CTtb
	 Vy4YE0Pb07+W9lh/6yzdWkmAxwfifU3pYl/B/AFM99ZtgTN7999e2cCvc8jxYhXPnm
	 j7XE8hnzb7TMg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9A91B37821C0;
	Wed, 19 Jun 2024 09:56:10 +0000 (UTC)
Message-ID: <40e8fdb8-bec8-4dd0-a0c0-c7409f1a3af8@collabora.com>
Date: Wed, 19 Jun 2024 11:56:10 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 13/16] ASoC: mediatek: Add MT8365 support
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
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
 <20240226-audio-i350-v5-13-54827318b453@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240226-audio-i350-v5-13-54827318b453@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 14/06/24 09:27, Alexandre Mergnat ha scritto:
> - Add specific config to enable:
>    - MT8365 sound support
>    - MT6357 audio codec support
> - Add the mt8365 directory and all drivers under it.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   sound/soc/mediatek/Kconfig         | 20 ++++++++++++++++++++
>   sound/soc/mediatek/Makefile        |  1 +
>   sound/soc/mediatek/mt8365/Makefile | 15 +++++++++++++++
>   3 files changed, 36 insertions(+)
> 
> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> index 5a8476e1ecca..c1c86ecc0601 100644
> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -298,3 +298,23 @@ config SND_SOC_MT8195_MT6359
>   	  boards with the MT6359 and other I2S audio codecs.
>   	  Select Y if you have such device.
>   	  If unsure select "N".
> +
> +config SND_SOC_MT8365
> +	tristate "ASoC support for Mediatek MT8365 chip"
> +	depends on ARCH_MEDIATEK
> +	select SND_SOC_MEDIATEK
> +	help
> +	  This adds ASoC platform driver support for Mediatek MT8365 chip
> +	  that can be used with other codecs.
> +	  Select Y if you have such device.
> +	  If unsure select "N".
> +
> +config SND_SOC_MT8365_MT6357
> +	tristate "ASoC Audio driver for MT8365 with MT6357 codec"
> +	depends on SND_SOC_MT8365 && MTK_PMIC_WRAP
> +	select SND_SOC_MT6357
> +	help
> +	  This adds support for ASoC machine driver for Mediatek MT8365

s/Mediatek/MediaTek/g (here and everywhere else in other commits as well)

> +	  boards with the MT6357 codec.

MT6357 PMIC codec

after which

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

