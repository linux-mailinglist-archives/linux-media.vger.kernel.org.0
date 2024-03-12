Return-Path: <linux-media+bounces-6908-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9568796D6
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 15:50:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6091E1C21547
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 14:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 199B57B3F8;
	Tue, 12 Mar 2024 14:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jeYtFwEV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698621DFD8
	for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 14:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710255023; cv=none; b=CnEELIl/8liofU6HKW0xnNBFNU3qIBnawjInX2KcZQLNuso6GCCgfzeJEHMyNX+5R4YIyTDCmnAj2yqH1av0UbyqVr3Yx5FE+LyxDh4ORVM7ZY2nIsROa7itPCx66ximgAMuSbLUg7Z3+khnrBLfMAztLTcbClyqKsVu2cZR/6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710255023; c=relaxed/simple;
	bh=HRKqHTo2coRukof51yfticbZ5DFq9gs/6ILyHCTY6is=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JD1fg7ynHGUEajOWgrQjvhW50f0HCHKDmejEZAvYvZnC80SisuEv0U2MPoLEuEIFCOaFg4fETeMJ5kAix6gaytnwi9eqqrZwJ59LSq2V3CtEFf+xKCHClaVhM/4nQ9VcV7owWqn7u796TOmvr/lOmVUB1f+GKpcDkfrE2q7LKhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jeYtFwEV; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51320ca689aso4830805e87.2
        for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 07:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710255020; x=1710859820; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cdxOToZtr3MgG8M5yCGfJbtM/oXC1jGaY0CYXkO7JjE=;
        b=jeYtFwEVtAOM2nWoEXkkyKq/6O3SPEL1U5DfyvJEJhsSYNHy1fhgGoGUVXndADKtDM
         TiyUyJx9H8s7ZxcyGIfjxuo+F1CFn8Ig1tU21ogfubtuvbUtiOVCz3VUO0h/xxk4ShyM
         EdSZisVPU3BE47YiIzff0Xae4W6zWZFdbjVE66zruczCP3zIp92M2cjEdUfnwchCU2hF
         WvdLIh5n+/SvCFFilqTcz9MQbge/jKf3/8dBcQnTA54R73/NhBs3gxz0CPSwF1ktc1jF
         02VX8pXripZGXmlGFeL2WeIAuX6sgpG74h3vnnb5+fZrtsz6KiiEyoOumXW5j+sh6P6X
         SL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710255020; x=1710859820;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cdxOToZtr3MgG8M5yCGfJbtM/oXC1jGaY0CYXkO7JjE=;
        b=IVuorAb2D5DKIRN5sMgGJvJTK702JkdbOquI+jO6zCtp9pENxK3wnHLERVSyTxyroB
         8BBoZbQZw1c3ufXaWU/JCQt9VBDkD6N2VEeGpUmHLgemN5oVYdwUzVvWC5HfUzYN/IEY
         xS3YpX2ugVllhV/LtC4iYukIUPbCzHVZsfyuXbtCgB6AMkNPaELmSC9Fcozdlbiabzok
         ++bZyK5JuNZ0tJVZfHmp/5dKomflrl+1GkwLEWxR5a5UDTrdqZWrgfP5UP1e8A0yeLN9
         goHPYGfjGzxB3ESueSpgPRJjujodzOJFssURoJ03ypXxGRotB+yZ3og6TVnXc7qlXECt
         cQ+A==
X-Forwarded-Encrypted: i=1; AJvYcCWr2kQfPXDY1LfiCEOGC8hRFP3bZMU4Ninzso79S1D6lbUv60DhbtPw67OKGtOgEUROvPK9tt4TFRDuAso8gGbCCwAA8gW1VNSV3Gc=
X-Gm-Message-State: AOJu0YzK9fa1MK5LgAHWGkIfzo+5wESo1ct3RSlDf1prxpup+hN9RgY2
	IX/WiZ7Sy6wbgY+SK+zTJ624YwA6TCsYOblDhnx9RxhMCsAct3ACjKUwQWQk3tE=
X-Google-Smtp-Source: AGHT+IF4U7++EP6lI1eUA5YZ5DAJajTZAe48hL6g0In91UMupEHYzfMoae2xpi5b5/CBMmyo7KWbtw==
X-Received: by 2002:ac2:51a5:0:b0:512:bf99:7d80 with SMTP id f5-20020ac251a5000000b00512bf997d80mr6373397lfk.1.1710255019673;
        Tue, 12 Mar 2024 07:50:19 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id u18-20020a05600c19d200b0041316e91c99sm12715808wmq.1.2024.03.12.07.50.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 07:50:19 -0700 (PDT)
Message-ID: <253b4b6c-d8ba-40a3-adbb-4455af57d780@baylibre.com>
Date: Tue, 12 Mar 2024 15:50:17 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/18] ASoC: codecs: mt6357: add MT6357 codec
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Flora Fu <flora.fu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Will Deacon <will@kernel.org>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nicolas Belin <nbelin@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <20240226-audio-i350-v1-12-4fa1cea1667f@baylibre.com>
 <1641a853-88cb-43a8-bb95-653f5329a682@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <1641a853-88cb-43a8-bb95-653f5329a682@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 26/02/2024 16:25, AngeloGioacchino Del Regno wrote:
>> +    if (enable) {
>> +        /* set gpio mosi mode */
>> +        regmap_write(priv->regmap, MT6357_GPIO_MODE2_CLR, 
>> GPIO_MODE2_CLEAR_ALL);
>> +        regmap_write(priv->regmap, MT6357_GPIO_MODE2_SET, 
>> GPIO8_MODE_SET_AUD_CLK_MOSI |
>> +                                  GPIO9_MODE_SET_AUD_DAT_MOSI0 |
>> +                                  GPIO10_MODE_SET_AUD_DAT_MOSI1 |
>> +                                  GPIO11_MODE_SET_AUD_SYNC_MOSI);
> 
> Are you sure that you need to write to MODE2_SET *and* to MODE2?!

This is downstream code and these registers aren't in my documentation.
I've removed the MODE2_SET write and test the audio: it's still working.

So I will keep the spurious write removed for v2. :)

-- 
Regards,
Alexandre

