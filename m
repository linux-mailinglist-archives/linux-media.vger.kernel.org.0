Return-Path: <linux-media+bounces-13977-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6CA913948
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 11:34:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2E531C215A7
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 09:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D96D081AC7;
	Sun, 23 Jun 2024 09:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nvlk/TgM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9BF7D405;
	Sun, 23 Jun 2024 09:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719135214; cv=none; b=rs9Crf7jcv0xhcZbozwRxkautisktSq024zPmyyqXq+DsUciarqiPd56OFlTHIwg4Olo+1j5UYXTFNQINtiPfiCHVat4kT38ZvBt+loQjr9zAmItmnE+fgP/ePoM1a1hj+GtpXk7LQFK68feuuMh2s6YORK+lqUYj/Jmozr3rX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719135214; c=relaxed/simple;
	bh=JdGQjQ8ugHuD7lfotcDPVss8wiDxrM/eB79Z6QArE3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kvtGPI4lQ/sMbTpmoEe5DB+lCw2eLSTDZHdpgEoHWXmqWoTskIlSKmtLoYI7g0aSCg/HQI8Kf+ITUWXLEQNvLyRStCn+qKfZn0a9si2tuOW7hYYYcv0XoMH3Pc5I+kgZU5esrFM9YppKTN5HrfaiUAd0/S2Dyc69GSiPhbBSHRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nvlk/TgM; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2eaea28868dso43641301fa.3;
        Sun, 23 Jun 2024 02:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719135210; x=1719740010; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AjZoaS2Am0A8j/9rhUaTOpBI3VQYzkae19fmYTVfhu4=;
        b=Nvlk/TgMN120L24fIVIN2JwVg9B+QlbCMHJyaSJ2laoxL0gHKEpYW4zac1TJeCASmK
         UoOBq0iTS845aeQRYf2NuSSo1Hb8+OjOAtdAmuZ+l1+7pw5ld2tTgqkGcE/F9LUW+tZC
         cBUm6hldqlhC7KNUZb+RK7ZsaxDeHqiGG9t7SDqZHEDJvVFMYK5raMufJgoa2221tPQw
         DtgMDILZO7uiS9dBqmJwY10Bxe7qdTUVMQCIR+Ta5Rv+Q49jykOxsyP//Bc80HP5w30h
         Cl1hIrTNOM9wNZhlRkP1v6IqHOyxY//hlzqOCjh59IjBBA7llu2rhRFEsxACIdlHO5Yz
         gc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719135210; x=1719740010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AjZoaS2Am0A8j/9rhUaTOpBI3VQYzkae19fmYTVfhu4=;
        b=iwprEZyBAJ2xHZFsAVEzTDrK4KPAERH+VE5yA3UbF75e9DbpmzUnJkQY6roJYON3Io
         +skYNmxRTL/46veNl8a/OfRsif1uOylEtvY6HSqBBljiZ9q8ASw8sX+Bscq5HRLSV63+
         BsUObzfl9nH5CrKSGRdDfXql0T04DXBw9qyNu4hujuX00dMhK0LHAtd5oswqfPc3MwTh
         X6CmATq3ln75sLbEkSl7kU3FZ2Ch7glQoAWjhASCfryNlQk5bf8vctc36rQxT5WiSmlO
         BKaZZo+SOnp+Whbm2ZBVamsD/vEeBNXtV5K/8Z4T659QzQgLh9anqFuQ/aG6os0Ew0eL
         eRrg==
X-Forwarded-Encrypted: i=1; AJvYcCXMK1/eMmKlmMR2yHOpfjjhNdbxMpj3fLmXHt27e0n7hN0fci2cYOVlB5NaNeS19RADai4lDsHW++Xigyox0eGM+ep3oaEHgeB/mJ8qcGGViMLdTQCe3EVgBw6OtEdM/k2CCaMzRCSWFJ/EPO6446JWCOMvJRvWZtCdKP/MG00301ZaTqhn
X-Gm-Message-State: AOJu0YyPG3Bt+FiZRlvscPX09veJLyifjK52oCi46AhSxO1NSNxo2+Wl
	pAKIcF2GeXs5GmIYnu/mIOjPhG3BAYRvlFd0Xx3jk19eVghcYbI=
X-Google-Smtp-Source: AGHT+IH6KUI2bioFkoMZdiCXVbMS6OWNo1xhcCBiJkbNjUI36kuWQR3a8SDuPSHNgleWUhg85nvxmA==
X-Received: by 2002:a2e:3518:0:b0:2ec:57b4:1c6f with SMTP id 38308e7fff4ca-2ec5b31d1a2mr12159971fa.34.1719135210188;
        Sun, 23 Jun 2024 02:33:30 -0700 (PDT)
Received: from ?IPV6:2a02:810b:f40:4600:ffa8:3dda:1e1c:17ff? ([2a02:810b:f40:4600:ffa8:3dda:1e1c:17ff])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a724adc5dd4sm48127666b.129.2024.06.23.02.33.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jun 2024 02:33:29 -0700 (PDT)
Message-ID: <c7882f94-e2cb-4023-a53e-87ebc8fa3460@gmail.com>
Date: Sun, 23 Jun 2024 11:33:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] media: rockchip: Introduce the rkvdec2 driver
To: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Diederik de Haas <didi.debian@cknow.org>,
 Andy Yan <andy.yan@rock-chips.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev
References: <20240620142532.406564-1-detlev.casanova@collabora.com>
 <20240620142532.406564-3-detlev.casanova@collabora.com>
Content-Language: en-US
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <20240620142532.406564-3-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Detlev,

Am 20.06.24 um 16:19 schrieb Detlev Casanova:
> This driver supports the second generation of the Rockchip Video
> decoder, also known as vdpu34x.
> It is currently only used on the RK3588(s) SoC.
>
> There are 2 decoders on the RK3588 SoC that can work in pair to decode
> 8K video at 30 FPS but currently, only using one core at a time is
> supported.
>
> Scheduling requests between the two cores will be implemented later.
>
> The core supports H264, HEVC, VP9 and AVS2 decoding but this driver
> currently only supports H264.
>
> The driver is based on rkvdec and they may share some code in the
> future.
> The decision to make a different driver is mainly because rkvdec2 has
> more features and can work with multiple cores.
>
> The registers are mapped in a struct in RAM using bitfields. It is IO
> copied to the HW when all values are configured.
> The decision to use such a struct instead of writing buffers one by one
> is based on the following reasons:
>   - Rockchip cores are known to misbehave when registers are not written
>     in address order,
>   - Those cores also need the software to write all registers, even if
>     they are written their default values or are not related to the task
>     (this core will not start decoding some H264 frames if some VP9
>     registers are not written to 0)
>   - In the future, to support multiple cores, the scheduler could be
>     optimized by storing the precomputed registers values and copy them
>     to the HW as soos as a core becomes available.
>
> This makes the code more readable and may bring performance improvements
> in future features.
>
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>   drivers/staging/media/Kconfig                |    1 +
>   drivers/staging/media/Makefile               |    1 +
>   drivers/staging/media/rkvdec2/Kconfig        |   15 +
>   drivers/staging/media/rkvdec2/Makefile       |    3 +
>   drivers/staging/media/rkvdec2/TODO           |    9 +
>   drivers/staging/media/rkvdec2/rkvdec2-h264.c |  739 +++++++++++
>   drivers/staging/media/rkvdec2/rkvdec2-regs.h |  345 +++++
>   drivers/staging/media/rkvdec2/rkvdec2.c      | 1253 ++++++++++++++++++
>   drivers/staging/media/rkvdec2/rkvdec2.h      |  130 ++
>   9 files changed, 2496 insertions(+)
>   create mode 100644 drivers/staging/media/rkvdec2/Kconfig
>   create mode 100644 drivers/staging/media/rkvdec2/Makefile
>   create mode 100644 drivers/staging/media/rkvdec2/TODO
>   create mode 100644 drivers/staging/media/rkvdec2/rkvdec2-h264.c
>   create mode 100644 drivers/staging/media/rkvdec2/rkvdec2-regs.h
>   create mode 100644 drivers/staging/media/rkvdec2/rkvdec2.c
>   create mode 100644 drivers/staging/media/rkvdec2/rkvdec2.h
...
> +static inline void rkvdec2_memcpy_toio(void __iomem *dst, void *src, size_t len)
> +{
> +#ifdef CONFIG_ARM64
> +	__iowrite32_copy(dst, src, len);
> +#elif defined(CONFIG_ARM)
I guess that can get an "#else" since memcpy_toio exists for all archs.
> +	memcpy_toio(dst, src, len);
> +#endif
> +}
> +
...
> +	/* Set timeout threshold */
> +	if (pixels < RKVDEC2_1080P_PIXELS)
> +		regs->common.timeout_threshold = RKVDEC2_TIMEOUT_1080p;
> +	else if (pixels < RKVDEC2_4K_PIXELS)
> +		regs->common.timeout_threshold = RKVDEC2_TIMEOUT_4K;
> +	else if (pixels < RKVDEC2_8K_PIXELS)
> +		regs->common.timeout_threshold = RKVDEC2_TIMEOUT_8K;
> +

Did you test if it works with anything > 8K? If so, you propably want to 
make the check above

+	else
+		regs->common.timeout_threshold = RKVDEC2_TIMEOUT_8K;

Otherwise the timeout may not be set/contain invalid values from any former stream.

...

> +
> +static const struct rkvdec2_coded_fmt_desc rkvdec2_coded_fmts[] = {
> +	{
> +		.fourcc = V4L2_PIX_FMT_H264_SLICE,
> +		.frmsize = {
> +			.min_width = 16,
> +			.max_width =  65520,
> +			.step_width = 16,
> +			.min_height = 16,
> +			.max_height =  65520,
> +			.step_height = 16,
> +		},
> +		.ctrls = &rkvdec2_h264_ctrls,
> +		.ops = &rkvdec2_h264_fmt_ops,
> +		.num_decoded_fmts = ARRAY_SIZE(rkvdec2_h264_decoded_fmts),
> +		.decoded_fmts = rkvdec2_h264_decoded_fmts,
> +		.subsystem_flags = VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
> +	},
> +};
> +
Note, that this is also given to userspace (VIDIOC_ENUM_FRAMESIZES) and 
this is already incorrect in the old rkvdec driver (and hantro): From 
userspace perspective we do not have a restriction in 
step_width/step_width, as we are aligning any given width/height to HW 
requirements in the driver - what we should give to userspace is 
fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS; fsize->stepwise.min_height = 
1; fsize->stepwise.min_width = 1; fsize->stepwise.max_height = 65520; 
fsize->stepwise.max_width = 65520; I guess this new driver should be an 
opportunity to fix that and distinguish between internal and external 
frame size requirements and the .vidioc_enum_framesizes callback should 
adapted accordingly. Regards, Alex


