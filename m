Return-Path: <linux-media+bounces-6913-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33488879AED
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 19:03:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57FC41C21E01
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 18:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D92B1386C5;
	Tue, 12 Mar 2024 18:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="byB2xwYL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F64C1386D1
	for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 18:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710266613; cv=none; b=jdPA1MAzWyQnrzetLMe0l8omO00RLHiVGefcH7hA4o9Fk4zRaoHzgRcyu+Vj78ISKRL3gryC79KbtFfJTHnaQtvdaAmPY9zPA7W6paPit0UaptdT4BePWNHC0EGIPAuQBiTEzXzIGKp2K7PF7wvS36zzU5oGQXWlZzzGAq3fO+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710266613; c=relaxed/simple;
	bh=tl6GootnZJCViCd3hZwiY8NFba7wM+1REiO8IHBWDPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EgwswdfhXBEZZjCDoYqp/S1nT58BRihV66UvVS+PRsE5K5fPoiAiTm0wWm2U+2qMoh2ZBkIvcgyn98JBzg52dKEAB9qQKXnG5eXEmKP0n/DwKaXwwQef/cR/QYpV85iXtq2Ysn2X5Apt7ui6YWtZSMBk9WYGEWgzSiFkssqa21M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=byB2xwYL; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-512f3e75391so4561758e87.2
        for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 11:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710266608; x=1710871408; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HREX7H/9qDu7coR15IdnVSKnBY8ogVJjtclSGzuYtSo=;
        b=byB2xwYL2uMXdT+AGWZk1vADQYsd8X/4BQ9dYHL4IhnYxhJzlS40m1SXxBtQby9Znw
         CNcMaL0y+sAfR4TgAGobCc2h2Jh6GxS5huXbUOF+XbEZxfMYk4S/5gvlKUQ6P4E3rT+d
         7LjvNL0fmqtdlJ7t6xquaZOODeA37REKzmWOn+zCrjNLPR2yR/YGJx3B8UMVH7AtWPtA
         60W5ZtFtRD6Tf5ayYHscZZrP8iHkGaBTr8ow0rUjjFHBLKPqRp8uT93xy5cy34iP6U4+
         FHRafyBSNGEYymB3M6GcwR4+SqPuEDWS6GvrU3HD8o5jVfzszd1XRUYKg2kgg7Kww7p7
         h51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710266608; x=1710871408;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HREX7H/9qDu7coR15IdnVSKnBY8ogVJjtclSGzuYtSo=;
        b=V3GuYEmprrEojXeR+8VF8483ljEIagSS3903UDAS6zFDbnnQGqqleCZDA4FA2oFr1D
         fwbQ8hJt2gZgjNLwHh1J6MoSzENDPvTeFtxndd7J8Qwm3e3FlLOCLNrOmuDru2KbBukd
         mvDegwdTv10A/M5Q0qhVQoSEDcsjqa3BS2Wbhuj7UhUkkHadtFGNPGaMz6zaRkPM7L1X
         +BQ+86sAMGpWIqEhGj5WnhZ6D1iz1K8eku5XUC4w4+u9iWGrhieOhPMdP0BKJV6fkO+9
         pHbaQ8XpkzBhII1b+8Ey8G1kRz2bWKLClEA+gjwCLLfMmkAcE4LoNYH3l93nF+jd2T2B
         mnjw==
X-Forwarded-Encrypted: i=1; AJvYcCWxIJncv6Cc3HP3d9DOhQQE+OtFh0B4R4RkkFdrgqDDuflb8N7CCqskWpIhqaFrR7psjstf0SDu1HFoV01hCzGEyAaiDfePBPPdZlM=
X-Gm-Message-State: AOJu0Yy1f2MiN93WymB+Z3i9muP2kpmC6RIksd5/ae/o9fJA+lF5D4U3
	ol36WhcsWAC2zJqNCpk80EXcPNcIR27klZcLuO0mlGqXIGzhwuhleW8E1N4HBHw=
X-Google-Smtp-Source: AGHT+IH4QkVIYDqyhzAKmOcXC+nBQU3/7sOVXezpH3hXulIwAWJtf0fWxm8Rb21sEMqvyOTNR1ZG+Q==
X-Received: by 2002:a05:6512:ba4:b0:513:a72c:de7c with SMTP id b36-20020a0565120ba400b00513a72cde7cmr2898449lfv.46.1710266608394;
        Tue, 12 Mar 2024 11:03:28 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id bq7-20020a5d5a07000000b0033e95794186sm6250688wrb.83.2024.03.12.11.03.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 11:03:27 -0700 (PDT)
Message-ID: <c441a132-b16b-4244-a712-8971c902d4d7@baylibre.com>
Date: Tue, 12 Mar 2024 19:03:25 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/18] ASoC: codecs: mt6357: add MT6357 codec
Content-Language: en-US
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
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nicolas Belin <nbelin@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <20240226-audio-i350-v1-12-4fa1cea1667f@baylibre.com>
 <9891855d-2284-42e4-9d3a-35ba406540e8@sirena.org.uk>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <9891855d-2284-42e4-9d3a-35ba406540e8@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/02/2024 17:09, Mark Brown wrote:
> On Mon, Feb 26, 2024 at 03:01:50PM +0100, amergnat@baylibre.com wrote:
> 
>> index 000000000000..13e95c227114
>> --- /dev/null
>> +++ b/sound/soc/codecs/mt6357.c
>> @@ -0,0 +1,1805 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * MT6357 ALSA SoC audio codec driver
>> + *
> 
> Please use a C++ comment for the whole comment to make it clearer that
> this is intentional.

ok

> 
>> +static void set_playback_gpio(struct mt6357_priv *priv, bool enable)
>> +{
>> +	if (enable) {
>> +		/* set gpio mosi mode */
>> +		regmap_write(priv->regmap, MT6357_GPIO_MODE2_CLR, GPIO_MODE2_CLEAR_ALL);
>> +		regmap_write(priv->regmap, MT6357_GPIO_MODE2_SET, GPIO8_MODE_SET_AUD_CLK_MOSI |
>> +								  GPIO9_MODE_SET_AUD_DAT_MOSI0 |
>> +								  GPIO10_MODE_SET_AUD_DAT_MOSI1 |
>> +								  GPIO11_MODE_SET_AUD_SYNC_MOSI);
> 
> This would be a lot more legible if you worked out the values to set and
> then had a single set of writes, currently the indentation makes it very
> hard to read.  Similarly for other similar functions.

ok

> 
>> +static int mt6357_put_volsw(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
>> +	struct mt6357_priv *priv = snd_soc_component_get_drvdata(component);
>> +	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
>> +	unsigned int reg;
>> +	int ret;
>> +
>> +	ret = snd_soc_put_volsw(kcontrol, ucontrol);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	switch (mc->reg) {
>> +	case MT6357_ZCD_CON2:
>> +		regmap_read(priv->regmap, MT6357_ZCD_CON2, &reg);
>> +		priv->ana_gain[ANALOG_VOLUME_HPOUTL] =
>> +			(reg & AUD_HPL_GAIN_MASK) >> AUD_HPL_GAIN_SFT;
>> +		priv->ana_gain[ANALOG_VOLUME_HPOUTR] =
>> +			(reg & AUD_HPR_GAIN_MASK) >> AUD_HPR_GAIN_SFT;
>> +		break;
> 
> It would probably be less code and would definitely be clearer and
> simpler to just read the values when we need them rather than constatly
> keeping a cache separate to the register cache.

Actually you must save the values because the gain selected by the user 
will be override to do a ramp => volume_ramp(.....):
- When you switch on the HP, you start from gain=-40db to final_gain 
(selected by user).
- When you switch off the HP, you start from final_gain (selected by 
user) to gain=-40db.

Also, the microphone's gain change when it's enabled/disabled.

So, it can implemented differently but currently it's aligned with the 
other MTK codecs and I don't see any resource wasted here.

> 
>> +	/* ul channel swap */
>> +	SOC_SINGLE("UL LR Swap", MT6357_AFE_UL_DL_CON0, AFE_UL_LR_SWAP_SFT, 1, 0),
> 
> On/off controls should end in Switch.

Sorry, I don't understand your comment. Can you reword it please ?

> 
>> +static const char * const hslo_mux_map[] = {
>> +	"Open", "DACR", "Playback", "Test mode"
>> +};
>> +
>> +static int hslo_mux_map_value[] = {
>> +	0x0, 0x1, 0x2, 0x3,
>> +};
> 
> Why not just use a normal mux here, there's no missing values or
> reordering?  Similarly for other muxes.

I've dug into some other codecs and it's done like that, but I've 
probably misunderstood something.

The only bad thing I see is enum is missing currently:

enum {
	PGA_MUX_OPEN = 0,
	PGA_MUX_DACR,
	PGA_MUX_PB,
	PGA_MUX_TM,
	PGA_MUX_MASK = 0x3,
};

static const char * const hslo_mux_map[] = {
	"Open", "DACR", "Playback", "Test mode"
};

static int hslo_mux_map_value[] = {
	PGA_MUX_OPEN, PGA_MUX_DACR, PGA_MUX_PB, PGA_MUX_TM,
};

> 
>> +static unsigned int mt6357_read(struct snd_soc_component *codec, unsigned int reg)
>> +{
>> +	struct mt6357_priv *priv = snd_soc_component_get_drvdata(codec);
>> +	unsigned int val;
>> +
>> +	pr_debug("%s() reg = 0x%x", __func__, reg);
>> +	regmap_read(priv->regmap, reg, &val);
>> +	return val;
>> +}
> 
> Remove these, there are vastly more logging facilities as standard in
> the regmap core.

ok

> 
>> +/* Reg bit defines */
>> +/* MT6357_GPIO_DIR0 */
>> +#define GPIO8_DIR_MASK				BIT(8)
>> +#define GPIO8_DIR_INPUT				0
> 
> Please namespace your defines, these look very generic.

ok

-- 
Regards,
Alexandre

