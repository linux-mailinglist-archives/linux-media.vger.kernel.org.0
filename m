Return-Path: <linux-media+bounces-7118-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A6787CBCE
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 12:01:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B79F28389E
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 11:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E86A51A58E;
	Fri, 15 Mar 2024 11:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0KrHfQjm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6638D18035
	for <linux-media@vger.kernel.org>; Fri, 15 Mar 2024 11:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710500481; cv=none; b=cnTSZ3LOeeNkoBgp3MNABAZwu2zQWgJ1tgWLLf4YdbtSPEVwiC8Z+9qICJqxATqIZNnVwAtdC4SZTWTGgMXe98YrnchOfAlqY0Du1nsCInKACzF3pDNQm1AjxquX7j1lNvcp5+bOa185kKJ6DF95XqPFPlQGiz2D9fIpmznm9hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710500481; c=relaxed/simple;
	bh=1bp9ya6mUTdhU/FzzsHERh5njunu+iph5TE1N9ar6zQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MkbapEP2ax+ZfFVrWRMlyq4Nbdu5H1EIguKuWlxLOL23F+05tk0v1fyusmDfU2gOx7HSDgCCuhEHQKcFXI2e+Z/31tSnHC3uqZXPtENd0dL8z4ymAbRM2+J/bT6d6vlrWBpYLP3dLUO5tY/8czUSZyugF48wHP69kZ+a1TzUjI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0KrHfQjm; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-430a65e973bso7787631cf.3
        for <linux-media@vger.kernel.org>; Fri, 15 Mar 2024 04:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710500478; x=1711105278; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5DsyBbYAZw/09Nakq0pDw/8yd9OC3IgRs2xlCXHLsrE=;
        b=0KrHfQjmpkRwbZCaWB6aajlxkeTQyJaR8SGhkW4gyLoWycW5Qew46jI8Be9qx5IYtK
         23SNd5WFJKrFAXslqZOFC4QiP1I9S1IaEaJebnLvO2BYpYV4UTKGly2/tbIPdQK1DUq9
         0JO49ZAaGVTigrafNhSQ1Hj7Los5xAvfpL6Dbxg17oJjGybV30eChz5hbJhfC1ZfllMk
         CuLEuA/gpmhPK9G9kVbyiGQGuT815tuj8oO6P9tPp0boSOxptEZJipuvOlKlP9ZXSpZC
         40Z5M9Xui3/tpBwEMpfRG4p3DKmlVtJvsjTpNZgqsaehUv2yaf1sEITHqWV1evE81874
         shPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710500478; x=1711105278;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5DsyBbYAZw/09Nakq0pDw/8yd9OC3IgRs2xlCXHLsrE=;
        b=Dta4MfRvqg70vn6eTdu/fHK4oCrsEZ/lijzoT9yY2Rg/VkgrYyGpneOTomHUzhCNsq
         x44jS7Tkv5q+dwNGRDOY4X+G1sFik0+Zk5HwXWFdtrWJwDu5vrUo7mI531VUxypw26vE
         I/spUKPrAfZJXqteV2iziW3xdwgG6WBaZgH83OpYJgl/DFDVLVSTcH1Uzi6hNe6dgE4Y
         a7jKbIu5wrF/0ZqsKwKoJbQpe0+dmb/cf1D2UD2XYv1/MpvBWtJCC5AlWL8waV2U18Wa
         lGvQqtebi2seALnshRUYIMDgVSyxSzUMmThBu/o3F0BtnjBzlKRyd2m12K6SQPk2rWtb
         Yxww==
X-Forwarded-Encrypted: i=1; AJvYcCVdA8Q9ENLEpRjjthQABLkDq63+HUbkqkmEaQwzq0QkyYTZe/Ctsy/JikI3kPbSeZA5wxCdrl9Rwh0MTg0GjNkutYuMxBfZZ4p6aNU=
X-Gm-Message-State: AOJu0YwBiodqj74Fn59+bOyUskYbmUJK3N3vrkXAUgoVRjJ6EQP6NIqY
	sIdU0w4Q1PcOKXM8QBRLaZnHaGC0wlAS4bANTjUiN046rPN90dZqorKOpoZHorg=
X-Google-Smtp-Source: AGHT+IEVOOgZFoxsLMo3B/9DgMlPg+8mCIQzmFSjWr5NC1POGFlHlr6r0UtoZZxyVjffb0W7416VFg==
X-Received: by 2002:ac8:5783:0:b0:42e:b90c:c5a9 with SMTP id v3-20020ac85783000000b0042eb90cc5a9mr5156478qta.51.1710500478406;
        Fri, 15 Mar 2024 04:01:18 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id p3-20020a05622a00c300b0042ef88b7daesm1838670qtw.19.2024.03.15.04.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 04:01:17 -0700 (PDT)
Message-ID: <dda0e6ba-4538-47a0-95e9-6adcfd4169a7@baylibre.com>
Date: Fri, 15 Mar 2024 12:01:12 +0100
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
 <c441a132-b16b-4244-a712-8971c902d4d7@baylibre.com>
 <ff3d2db1-697b-42c6-a0f2-74276e9fc098@sirena.org.uk>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <ff3d2db1-697b-42c6-a0f2-74276e9fc098@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/03/2024 18:23, Mark Brown wrote:
> On Tue, Mar 12, 2024 at 07:03:25PM +0100, Alexandre Mergnat wrote:
>> On 26/02/2024 17:09, Mark Brown wrote:
> 
>>>> +	case MT6357_ZCD_CON2:
>>>> +		regmap_read(priv->regmap, MT6357_ZCD_CON2, &reg);
>>>> +		priv->ana_gain[ANALOG_VOLUME_HPOUTL] =
>>>> +			(reg & AUD_HPL_GAIN_MASK) >> AUD_HPL_GAIN_SFT;
>>>> +		priv->ana_gain[ANALOG_VOLUME_HPOUTR] =
>>>> +			(reg & AUD_HPR_GAIN_MASK) >> AUD_HPR_GAIN_SFT;
>>>> +		break;
> 
>>> It would probably be less code and would definitely be clearer and
>>> simpler to just read the values when we need them rather than constatly
>>> keeping a cache separate to the register cache.
> 
>> Actually you must save the values because the gain selected by the user will
>> be override to do a ramp => volume_ramp(.....):
>> - When you switch on the HP, you start from gain=-40db to final_gain
>> (selected by user).
>> - When you switch off the HP, you start from final_gain (selected by user)
>> to gain=-40db.
> 
> You can just read the value back when you need to do a ramp?

You can't. Because you will read -40db when HP isn't playing sound. That 
is why the gain is saved into the struct.

Let me know, when you change de gain to do a ramp down (start from user 
gain to gain=-40db), next time for the ramp up, how/where do you find 
the user gain ?


> 
>> Also, the microphone's gain change when it's enabled/disabled.
> 
> I don't understand what this means?

When microphone isn't capturing, the gain read back from the register is 
0dB. I've put some logs in my code and do capture to show how it works:

root@i350-evk:~# arecord -D hw:mt8365evk,2,0 -r 48000 -c2 -f s32_le -d 
10 recorded_file.wav
[Mar15 09:31] mt8365-afe-pcm 11220000.audio-controller: 
mt8365_afe_fe_hw_params AWB period = 6000 rate = 48000 channels = 2
[  +0.000126] mt8365-afe-pcm 11220000.audio-controller: 
mt8365_dai_int_adda_prepare 'Capture' rate = 48000
[  +0.107688] mt6357-sound mt6357-sound: TOTO set mic to stored value
[ +10.072648] mt6357-sound mt6357-sound: TOTO set mic to 0dB

root@i350-evk:~# arecord -D hw:mt8365evk,2,0 -r 48000 -c2 -f s32_le -d 
10 recorded_file.wav
[Mar15 09:32] mt8365-afe-pcm 11220000.audio-controller: 
mt8365_afe_fe_hw_params AWB period = 6000 rate = 48000 channels = 2
[  +0.000133] mt8365-afe-pcm 11220000.audio-controller: 
mt8365_dai_int_adda_prepare 'Capture' rate = 48000
[  +0.109418] mt6357-sound mt6357-sound: TOTO set mic to stored value
[ +10.164197] mt6357-sound mt6357-sound: TOTO set mic to 0dB


> 
>>>> +	/* ul channel swap */
>>>> +	SOC_SINGLE("UL LR Swap", MT6357_AFE_UL_DL_CON0, AFE_UL_LR_SWAP_SFT, 1, 0),
> 
>>> On/off controls should end in Switch.
> 
>> Sorry, I don't understand your comment. Can you reword it please ?
> 
> See control-names.rst.  Run mixer-test on a card with this driver and
> fix all the issues it reports.

Ok the name is the issue for you AFAII.
This control isn't for on/off but swap Left and Right.
 From the codec documentation:
"Swaps audio UL L/R channel before UL SRC"
This control is overkill, I will remove it

I'm stuck to run mixer-test, please check the following message: 
https://lore.kernel.org/all/7ddad394-e880-4ef8-8591-cb803a2086ae@baylibre.com/


-- 
Regards,
Alexandre

