Return-Path: <linux-media+bounces-41255-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90478B3A112
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 16:19:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B13CD1C84D48
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 14:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D25314B6A;
	Thu, 28 Aug 2025 14:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rr/qeR5j"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CEE313E0A
	for <linux-media@vger.kernel.org>; Thu, 28 Aug 2025 14:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756390133; cv=none; b=OkZttNv7s6DhOk9v8RjhVjeMQPPpb8+xer9jZu2ufCyiSZF1EGEH8rzvwdSaShEdxXauTpFcI4gh4I3P+c1cUz2lCfTLCBqnytxD9zT3XTg0tFfCSJOJDRJtghM4X2YtAupuzxTKUYZtWFtyJ2QfqGQj0SrE0IZ6ZiyQQqfbUcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756390133; c=relaxed/simple;
	bh=C7zRn/VrsJaJr88AosGaBzTL5/NEtxOqaD+YET6/KOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b0W7cf1O9b0VxCWXo6Uuuy2o8JjCf07mKebhYedNhgzVOMmCK0LXH6wA6eMLnMz7BjHPXuHQ8ydT/cT+k2gh9gDbkA+F27vAUCEprCmsCj4kQpP/M2E4WrFF1bYywDyKjjaYm7FgUV+rDbSa/9fbKesSu5m9vnKzLITtBf90Mfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rr/qeR5j; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb78ead12so157687466b.1
        for <linux-media@vger.kernel.org>; Thu, 28 Aug 2025 07:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756390130; x=1756994930; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y/I5abWNDNo4EBfij41U+MSxFH8HWMmL5CHi8kMoycQ=;
        b=rr/qeR5jZgWS/rbCoTh0nMiXtp9xj/DKlSLT19ZaWuM0lgjXeJACVu1pdaZP3WRis1
         rNxT6HCkvXHzAR+S2970oCX+c0SIpohhAevMvZFnRYCvXOTs8PCV60ItXCkXp5teDLU5
         eXEdUCNsFIqJPkNrLwVSjoJKvQegXmXbsHOj85GPhOxkw6eV0PHJJFQK9FKoAocQiZx4
         uMWyGZ3gJob6qxoLq0ebHqR2KRmx3qCwe5gxqMOA3ab9MOmnxiAHia261J/7FI8Q9BWq
         yts0V4X2VHCCIdXjGZROSCdOyn28TSnmH9/xgxEzi0zsMXzrYuKgHWmxDg0ZwaMlWR2p
         RaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756390130; x=1756994930;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/I5abWNDNo4EBfij41U+MSxFH8HWMmL5CHi8kMoycQ=;
        b=dYgFJCPcYnpFC8TnEDlXu3NHEzrrJw1xLAJXLl5y4M03Ru544v2C+dnfiwufHfczmW
         0WmkZbf0d09RWLoaIocsjptNLcfJiYi8G8PlHdG9ZPjiezUFz9vk7nj8mbMO6OZBdVFU
         kg9Zg4ICfrkqZbzUuO2WxAvtNG3LUEcJj5KtikfYcCPsIkAg/PZeva840F09KsIrKgpn
         h1uOtOFVXIvVkot9Vt20VMoZnEx+owRIM+T6JApVaPkUpOwUJ7At6MEeRbjUsUwHv+zx
         uSI4kRh2qy4tTEnbaCDApcVEkU8JTiglJJmu30Yq8HP8MmaQXtY9hoXTCzFYE3YjnFcO
         xWAg==
X-Gm-Message-State: AOJu0Ywse7OEJuojPi4pk1mSvHjNF6Vm8w1vsu60/pR9vW9PylHZEaSV
	d6oNdrkoHi+qqU7adXJ8dU2hAPQeru5ExDQTFkKVcCc10NyCNxyhYHsx+IVe1CuPARs=
X-Gm-Gg: ASbGncvmMYvadE2umTojeuqkIZV/SLsk3PdA7/L9Brj/kcZf5GQGYmH0SmjLSahybLL
	PXu0eQQkzk5wnj4TF/wouIFel+p8vA9QG2C/Doz6BPCHfq7lu4yTGTo/n9vhLtDtm9ZHkrQoABT
	JGfnH3ybNar17nEt+zgf3VLsNNk57DfYe85fKcba9c4R9rtDncz8Pfsj1SiFB8GDLMtZuEhrBAY
	SM/UGh0Oovzjvj2W68RdvoPD70mMMdqN9H25xUfDp0Sy80PqRYahrEx8p5ygUCSEKhdkN05/Psk
	cxWSynl0ZyvTEfJqdyzJfA+EW6OG3fubAT7kOZJ1JGwRJz28MQ2vfJPHSJRVJqDgBACZ7+bXuPF
	3zpTwu0p5Fkj1lEIL/qq7L9UlMtseRVTlwpl95gtfWk2esULfJdADpErFq5a6xfnJyllAE4WW5L
	r/TiQ=
X-Google-Smtp-Source: AGHT+IHN82XFu68/fEKA3udTLRRIIvxajvSPhjBeGGRAN6IcAlWeL50Yku5UnjGbIWRGKBGVvUPHpQ==
X-Received: by 2002:a17:907:97c7:b0:afe:97eb:4327 with SMTP id a640c23a62f3a-afe97eb470emr1149862766b.20.1756390129962;
        Thu, 28 Aug 2025 07:08:49 -0700 (PDT)
Received: from [10.41.150.230] ([77.241.232.17])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cf65b3d7asm207720a12.41.2025.08.28.07.08.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 07:08:49 -0700 (PDT)
Message-ID: <82f447d1-89ae-450f-813e-02c3d8228895@linaro.org>
Date: Thu, 28 Aug 2025 16:08:48 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 06/13] media: rockchip: add a driver for the rockchip
 camera interface
To: Michael Riesch <michael.riesch@collabora.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Mehdi Djait <mehdi.djait@bootlin.com>
References: <20240220-rk3568-vicap-v10-0-62d8a7b209b4@collabora.com>
 <20240220-rk3568-vicap-v10-6-62d8a7b209b4@collabora.com>
 <3b4173cb-655d-48ea-b86a-a036f666cf40@linaro.org>
 <23ccc744-745d-4a31-a79c-2d64bf1ed43d@collabora.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <23ccc744-745d-4a31-a79c-2d64bf1ed43d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/08/2025 12:03, Michael Riesch wrote:
> Hi Bryan,
> 
> Thanks for your comments :-)
> 
> On 8/26/25 08:21, Bryan O'Donoghue wrote:
>> On 19/08/2025 00:25, Michael Riesch via B4 Relay wrote:
> 
> [...]
> 
>>> +
>>> +static void rkcif_dvp_stop_streaming(struct rkcif_stream *stream)
>>> +{
>>> +    struct rkcif_device *rkcif = stream->rkcif;
>>> +    u32 val;
>>> +
>>> +    val = rkcif_dvp_read(rkcif, RKCIF_DVP_CTRL);
>>
>> This dvp_read stuff looks a bit funny to me, you have a lookup which can
>> return 0 for unknown registers.
>>
>> Probably not the case with a control register like this one but, for
>> argument sake if RKCIF_DVP_CTRL was not a valid register i.e.
>> rkcif_dvp_read() would return 0 and you'd still act on that data to
>> write back to an unkown register.
> 
> ...which would then hit the same check in rkcif_dvp_write and simply
> return without writing anything. Also, the WARN_ON_ONCE in the lookup
> would complain and indicate that the driver developer made some mistake.
> I hope that the driver developer is thus nudged towards fixing the code
> they wrote.
> 
>> Would you not be better off having say callbacks to contain cases where
>> registers are potentially not present
>>
>> ops->update_maybe_not_present_reg();
>>
>> followed by writes to registers that would alawys be there ?
> 
> I'll think about that in more detail, but right now my thoughts are that
> if any of the registers below are not valid, this piece of hardware is
> pretty useless and there is something rotten in the driver. Thus, we
> complain loudly to the developer.
The developer is you though :)

Anyway seems a bit weird to me to return invalid registers, you trust 
yourself right ?

>>> +    rkcif_dvp_write(rkcif, RKCIF_DVP_CTRL,
>>> +            val & (~RKCIF_CTRL_ENABLE_CAPTURE));
>>> +    rkcif_dvp_write(rkcif, RKCIF_DVP_INTEN, 0x0);
>>> +    rkcif_dvp_write(rkcif, RKCIF_DVP_INTSTAT, 0x3ff);
>>> +    rkcif_dvp_write(rkcif, RKCIF_DVP_FRAME_STATUS, 0x0);
>>> +
>>> +    stream->stopping = false;
>>> +}
>>> +
>>> +static void rkcif_dvp_reset_stream(struct rkcif_device *rkcif)
>>> +{
>>> +    u32 ctl = rkcif_dvp_read(rkcif, RKCIF_DVP_CTRL);
>>> +
>>> +    rkcif_dvp_write(rkcif, RKCIF_DVP_CTRL,
>>> +            ctl & (~RKCIF_CTRL_ENABLE_CAPTURE));
>>> +    rkcif_dvp_write(rkcif, RKCIF_DVP_CTRL, ctl |
>>> RKCIF_CTRL_ENABLE_CAPTURE);
>>> +}
>>> +
>>> +static void rkcif_dvp_set_crop(struct rkcif_stream *stream, u16 left,
>>> u16 top)
>>> +{
>>> +    struct rkcif_device *rkcif = stream->rkcif;
>>> +    u32 val;
>>> +
>>> +    val = RKCIF_XY_COORD(left, top);
>>> +    rkcif_dvp_write(rkcif, RKCIF_DVP_CROP, val);
>>> +}
>>> +
>>> +irqreturn_t rkcif_dvp_isr(int irq, void *ctx)
>>> +{
>>> +    struct device *dev = ctx;
>>> +    struct rkcif_device *rkcif = dev_get_drvdata(dev);
>>> +    struct rkcif_stream *stream;
>>> +    u32 intstat, lastline, lastpix, cif_frmst;
>>> +    irqreturn_t ret = IRQ_NONE;
>>> +
>>> +    if (!rkcif->match_data->dvp)
>>> +        return ret;
>>
>> Wouldn't you be better off conditionally registering your ISR if
>> match_data->dvp is true instead ?
> 
> As you have surely seen, the ISR is shared between all interfaces, i.e.,
> DVP and MIPI. Now the currently supported models all have a DVP and your
> suggestion would work. However, I think the RK3562 VICAP can be easily
> supported by this driver but does not feature a DVP (several MIPI
> interfaces, though). In this case match_data->dvp evaluates to false but
> still there is the need to register the ISR.

Why not have separate ISRs then with shared code calling into a function ?

An ISR in my mind should fire for hardware we have a clear idea about 
and only do so in exceptional (pun intended) circumstances.

So I'd suggest two ISRs calling into whatever shared code you deem 
necessary as opposed to NULL checking in your ISR.
> 
>>
>>> +
>>> +    intstat = rkcif_dvp_read(rkcif, RKCIF_DVP_INTSTAT);
>>> +    cif_frmst = rkcif_dvp_read(rkcif, RKCIF_DVP_FRAME_STATUS);
>>> +    lastline = RKCIF_FETCH_Y(rkcif_dvp_read(rkcif,
>>> RKCIF_DVP_LAST_LINE));
>>> +    lastpix = RKCIF_FETCH_Y(rkcif_dvp_read(rkcif, RKCIF_DVP_LAST_PIX));
>>> +
>>> +    if (intstat & RKCIF_INTSTAT_FRAME_END) {
>>> +        rkcif_dvp_write(rkcif, RKCIF_DVP_INTSTAT,
>>> +                RKCIF_INTSTAT_FRAME_END_CLR |
>>> +                RKCIF_INTSTAT_LINE_END_CLR);
>>> +
>>> +        stream = &rkcif->interfaces[RKCIF_DVP].streams[RKCIF_ID0];
>>> +
>>> +        if (stream->stopping) {
>>> +            rkcif_dvp_stop_streaming(stream);
>>> +            wake_up(&stream->wq_stopped);
>>> +            ret = IRQ_HANDLED;
>>> +            goto out;
>>> +        }
>>> +
>>> +        if (lastline != stream->pix.height) {
>>> +            v4l2_err(&rkcif->v4l2_dev,
>>> +                 "bad frame, irq:%#x frmst:%#x size:%dx%d\n",
>>> +                 intstat, cif_frmst, lastpix, lastline);
>>> +
>>> +            rkcif_dvp_reset_stream(rkcif);
>>> +        }
>>> +
>>> +        rkcif_stream_pingpong(stream);
>>> +
>>> +        ret = IRQ_HANDLED;
>>> +    }
>>> +out:
>>> +    return ret;
>>> +}
>>> +
>>> +int rkcif_dvp_register(struct rkcif_device *rkcif)
>>> +{
>>> +    struct rkcif_interface *interface;
>>> +    unsigned int streams_num;
>>> +    int ret;
>>> +
>>> +    if (!rkcif->match_data->dvp)
>>> +        return 0;
>>
>> If you don't register the device when match_data->dvp is false, then I
>> think you can relax the carry-on checks elsewhere on match_data->dvp,
>> not including dvp_unregister
> 
> +1 I'll review all instances of this check.
> 
>> The rest of the file as I breifly skim it looks OK to me, its a bit big
>> though.
>>
>> Would it be possible to break this patch up a little bit ? Might make it
>> easier for other reviewers to give an SoB for smaller chunks.
> 
> I suppose what I could do is split this up into five patches, as the
> commit message already outlines:
> 
> 1) add a basic driver (no-op skeleton only)
> 2) abstraction for the ping-pong scheme to allow for future extensions
> 3) abstraction for the INTERFACE and CROP parts to allow for future
>     extensions
> 4) support for the PX30 VIP
> 5) support for the RK3568 VICAP DVP
> 
> Please note that in this case I would rework the patch for a final
> (this-time-really-final) time and drop this elaborate co-developed-by
> list, as the patch in question will then have nothing to do it all with
> anything what was before v2 of this series.

I'll leave that up to you, I'll still review your v11 but, a slightly 
smaller single patch to digest would be appreciated.

---
bod

