Return-Path: <linux-media+bounces-15136-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8273F9374AA
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 10:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A63091C20ED8
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 08:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CDCF6214D;
	Fri, 19 Jul 2024 08:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mYzcr/4u"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96063482ED
	for <linux-media@vger.kernel.org>; Fri, 19 Jul 2024 08:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721376193; cv=none; b=VoTYX8bwDE7siV62mcnB5dYuuD8F5qAmFResgLbFYfxyrG7tqr6Hy1J+DWzRFvl1z783rOtC0i7MWw9L0DpHPnAsPAiN0yovm+uJlVhYn1XMcF1d2dSRiZTSLpuj03cKGBe4sjC8BL3fI6tJD1MghyBS4ldFW1lHO1AYQsjzSYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721376193; c=relaxed/simple;
	bh=+6VT0XzZoxj9XDWHzC2JD7Qd5AsazCLCzcu5O/Uqc3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aR3KlIp+k5B0autqp9dQCysiSC3nh202/3bjM+n+zbQ1jVAuFXzJHfUalYaK7YQVpJi5yc6g5EFi4600SX+5B4YQ0VdGzkMMrxWkiConEg585ZsgWbl5KBClO0RzP2Pdsl3gNWYwFp2LZkNex4jnsqeL4fRiDoBqGbbdbvTaV+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mYzcr/4u; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a77baa87743so186582966b.3
        for <linux-media@vger.kernel.org>; Fri, 19 Jul 2024 01:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721376190; x=1721980990; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z+V9iTvENoLkDMcxv1MaALvsWBKCPdjEAwX/SNQRJv8=;
        b=mYzcr/4umhHQnw06RhXwkMj2eIgquKDkQMP23g+IdcNP2chbhfZ40F2QszMnxhl92Q
         l43Q2WuXuAJiQt5ozZRleQ6dqLYchVz1tdSqs24E3t8v17EGHvuF7fXntsrbxzmUie33
         j2H/SGk3RTeTcvoVNJhuXT3DlGq0fZ0A8SSTHUsHEuwuViMkfS9rAb0MlLOOVJ4TXP2J
         ct96bQMGBQ8jVQWJa4hm6Vb7pHghoAlibmDR0pJK3b/UE8bq1OcZUm35qrkna3oCiVIc
         f744OB2Ka/+/Y4CAFtBgUixkW/pDlU0+mLCHMtl7FzUf0wuIS1JcjMxhIZZIg7GdibKQ
         y/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721376190; x=1721980990;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z+V9iTvENoLkDMcxv1MaALvsWBKCPdjEAwX/SNQRJv8=;
        b=Bvl4KGeZFhv2VLt+RgFix58SnZF6hnrnMyZWM6yMSC3/2AI95Fd+JSeOpC6hCyMIe4
         spUzPd52E4DgJ3ivM1fefzupsDxqwlys9tALmkkCIzAybZdYnG81MN0If8gGvnLHPBUq
         YSKt1i8DgmNtlfFE/7h/NfzMxyIU7pdqjwM1aj0I7++aKlLUQqoq/JR2uLwM4NCC/eku
         B9L/kWAL414eRfu88kServ0sAKZFCzMpqDHvLe4IS/NwhJoZA1aJhReVzveknSaeffo7
         U3jQZiLeZ6CXIxr431K0WtbE2H8zVUoC0bnYN8na63qefcrAZdAHFp8e4+08cyRV9sod
         JmQA==
X-Forwarded-Encrypted: i=1; AJvYcCXMMhH5K1B7pai8Sj48k5fhCrUkEkWW/Q7sTvTNCRtDoTwFsd8ekc+3E9GMeQXkitWTRXpnDDt0gc+wgO1dv2XFt+wXcvjy2j2oigQ=
X-Gm-Message-State: AOJu0Yz9UnTlYmNGpe9seTBdO6ijeE+EZ8eC50QR9ij7pTl5ndgHZobS
	72eaMowvuBi0FJYaFQ1522jHJ8TeiNsVqXINX6e2hjg2b2Iin9DSEH0EbQDXWzo=
X-Google-Smtp-Source: AGHT+IFSI/urq3kgCZ03qW/7Cfy3KmDoz5hvQStjC02N5fU8bds0AoRqbPquZ19VCIFBWcFmrd5RIA==
X-Received: by 2002:a17:906:ae84:b0:a75:2495:a6a3 with SMTP id a640c23a62f3a-a7a013c0f56mr554702166b.67.1721376189891;
        Fri, 19 Jul 2024 01:03:09 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7a33ad4bfdsm72480666b.85.2024.07.19.01.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jul 2024 01:03:09 -0700 (PDT)
Message-ID: <45b4a493-875a-4c9c-aa45-a6f32f74b865@baylibre.com>
Date: Fri, 19 Jul 2024 10:03:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/16] ASoC: codecs: add MT6357 support
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nicolas Belin <nbelin@baylibre.com>
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
 <20240226-audio-i350-v6-12-f754ec1a7634@baylibre.com>
 <1ca27c79-a83a-42a7-9e9b-766da0064c73@sirena.org.uk>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <1ca27c79-a83a-42a7-9e9b-766da0064c73@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/06/2024 14:44, Mark Brown wrote:
> On Wed, Jun 19, 2024 at 04:46:48PM +0200, amergnat@baylibre.com wrote:
> 
>> +	/* gain default values*/
>> +	regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON0, MT6357_AUDPREAMPLGAIN_MASK,
>> +			   UL_GAIN_0DB << MT6357_AUDPREAMPLGAIN_SFT);
>> +	regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON1, MT6357_AUDPREAMPRGAIN_MASK,
>> +			   UL_GAIN_0DB << MT6357_AUDPREAMPRGAIN_SFT);
>> +
>> +	regmap_update_bits(priv->regmap, MT6357_ZCD_CON1,
>> +			   MT6357_AUD_LOL_GAIN_MASK |
>> +			   MT6357_AUD_LOR_GAIN_MASK,
>> +			   DL_GAIN_0DB << MT6357_AUD_LOL_GAIN_SFT |
>> +			   DL_GAIN_0DB << MT6357_AUD_LOR_GAIN_SFT);
>> +
>> +	regmap_update_bits(priv->regmap, MT6357_ZCD_CON2,
>> +			   MT6357_AUD_HPL_GAIN_MASK |
>> +			   MT6357_AUD_HPR_GAIN_MASK,
>> +			   DL_GAIN_0DB << MT6357_AUD_HPL_GAIN_SFT |
>> +			   DL_GAIN_0DB << MT6357_AUD_HPR_GAIN_SFT);
>> +
>> +	regmap_update_bits(priv->regmap, MT6357_ZCD_CON3,
>> +			   MT6357_AUD_HS_GAIN_MASK, DL_GAIN_0DB);
> 
> We generally leave everything at chip defaults, why is this different?

Ok, after test, it isn't a problem to leave at chip defaults.

> 
>> +static int mt6357_codec_probe(struct snd_soc_component *codec)
>> +{
>> +	struct mt6357_priv *priv = snd_soc_component_get_drvdata(codec);
>> +
>> +	mt6357_codec_init(priv);
>> +	return 0;
>> +}
> 
> Why not just inline mt6357_codec_init() into the one user?

You're right.

> 
>> +static unsigned int mt6357_read(struct snd_soc_component *codec, unsigned int reg)
>> +{
>> +	struct mt6357_priv *priv = snd_soc_component_get_drvdata(codec);
>> +	unsigned int val;
>> +
>> +	regmap_read(priv->regmap, reg, &val);
>> +	return val;
>> +}
>> +
>> +static int mt6357_write(struct snd_soc_component *codec, unsigned int reg, unsigned int value)
>> +{
>> +	struct mt6357_priv *priv = snd_soc_component_get_drvdata(codec);
>> +
>> +	return regmap_update_bits(priv->regmap, reg, 0xffff, value);
>> +}
> 
> Why open code these, the core has standard adaptors for regmap?

You're right. snd_soc_component_write/read should be used instead

> 
>> +static const u32 micbias_values[MT6357_MICBIAS_ARRAY_SIZE] = {
>> +	1700000, 1800000, 1900000, 2000000,
>> +	2100000, 2500000, 2600000, 2700000
>> +};
> 
> Just use ARRAY_SIZE() for the size then the number can't be out of sync.
>
You're right.

-- 
Regards,
Alexandre

