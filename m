Return-Path: <linux-media+bounces-5901-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 660E0866F07
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 10:45:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E77481F276BF
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 09:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA8EA7E59B;
	Mon, 26 Feb 2024 09:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OFQdd5zW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F297E57F
	for <linux-media@vger.kernel.org>; Mon, 26 Feb 2024 09:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708938615; cv=none; b=RrnnQwHWgH4DiJBFz6S+IjRl7fKRRFPrTkqpqKdtpXcuKf/LbrgWO/hxNpz8UTqF1QpfI6cgh14y6laFh41yLF0JrRvKRfvYIE0yl5iuReUlgOD2kkmNUc5akHuIZ08Mx6tB3bfPuqEHfKAwwQIXUoYY/5DPdcZGNvM3Ca1MrDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708938615; c=relaxed/simple;
	bh=xwEHMtkTa8XWTX4pV8jEMz1Xm1U0xJMw+gbcmQzUJ2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QzL5javX3k/bNtVtMq8bLsfSPOBzZmlGO7mU6zetQNgJhnCHSaZNxem8o2KStwvo/7CbWVPHK4d0ZUOojxAjoxoR+lJgJKL6AX9g9ZqSHwBb/DI3rLnix8C2qG91D/+YimqiwLPdAsaJdyWxcOel4ha1pvtMVoxWaeTzDEov5cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OFQdd5zW; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-56454c695e6so4968814a12.0
        for <linux-media@vger.kernel.org>; Mon, 26 Feb 2024 01:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708938612; x=1709543412; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=beOjLKsLMUDO9SIyhAfuWkQxFZBDoPL260ZfGfU7EQE=;
        b=OFQdd5zWT8IY+kSXo88Tfr0N9Cf53zuM8s56XHHdJCELQKvvbZ6x1KmLONDwzo9tSs
         Y/5f3t+Joe2y8jJLmq7VwkrJ9l6OAUb8VWV+1Spi6inaKIX536tTKrTvIeZy8mwVtqjV
         87DB+6GUzVYylC0mDBhxlXoe6Qc6hlPWbUoLp0td7v0LzgRpN1l5AwUKyv/x3gSUO5Yj
         JqDfj7t6uoWcyoqxHXh+MdYTx2MOTyc3yQ+sil9pNrZ94qHPK8YoYe8Ty9JU9YbJctJ5
         IHkAHxUydIInBHdm/mum0kAnM1xPX75YnF/cbYiMVHSKjbwkLg4PwFeXzQvzpf9Kd5Jq
         fgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708938612; x=1709543412;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=beOjLKsLMUDO9SIyhAfuWkQxFZBDoPL260ZfGfU7EQE=;
        b=VrWa10VTEUNo0VOhdS1BCvrYWMr1fggvftWPgRd1Z65zEmmUzqcgCdHctEZy3q7VCs
         sIHQ9fKOzAAKGKs+CVkDQgh8jkK4GLT9sKlWX0GCWun98X3oXqYM9KgkTCQVA1aHtTvE
         GYXQ4gkBLFsVm6gr1m+6j3P0kCv0yfu3FLMWpvPgIGhKWkAW3iq4Qsxm+F7JDEbNQN/C
         7nwpb7Xf4rgRYHfY3PrmzRM8pGVvP8d2jvbkDwR1umZ7Iy4Yq4pQ4cExDRCMlxGWMgmA
         LBWO+v2Y6wZzgoUzLRE+wg9Sb6pGnBmGXfw0mN13mJVNsfccxmhidde5krkmkbaXd0YY
         7/2w==
X-Forwarded-Encrypted: i=1; AJvYcCVbP/AhPKy2/qQOrChTY7XIQg6mOhM8IsP17P1IuVo/U1itlPOpkRP5OLWRvzWCGk/Br+uWgSvgJs5vwprWld+fjW7q5yYGRfGGecc=
X-Gm-Message-State: AOJu0YxZbju84zadaVmb5ZE47BMIlQ/bxfEAogbxSRBe2hsWe5g+bmMm
	DzjG8YQ2a2qC94PLpi5tt7yT0c3yOLJEK+YNHBE5uTM5yqhFlrmb2T1ijeKIu4c=
X-Google-Smtp-Source: AGHT+IEtGIKdmTP06PS0Y5aOlgac0kRK+GS31d413j+33+MRpAEYk6uWkiYtlVAt6Zo+j7tnyFB6pg==
X-Received: by 2002:a05:6402:2297:b0:566:1715:4019 with SMTP id cw23-20020a056402229700b0056617154019mr289870edb.8.1708938611786;
        Mon, 26 Feb 2024 01:10:11 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id g15-20020aa7c84f000000b00565b7672ce6sm1843718edt.30.2024.02.26.01.10.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 01:10:11 -0800 (PST)
Message-ID: <09579b62-77fe-4ba4-b3a1-e3b17dff0188@linaro.org>
Date: Mon, 26 Feb 2024 10:10:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] media: dt-bindings: Add Chameleon v3 framebuffer
Content-Language: en-US
To: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>, airlied@gmail.com,
 akpm@linux-foundation.org, conor+dt@kernel.org, daniel@ffwll.ch,
 dinguyen@kernel.org, hverkuil-cisco@xs4all.nl,
 krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com,
 mchehab@kernel.org, mripard@kernel.org, robh+dt@kernel.org,
 tzimmermann@suse.de
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 chromeos-krk-upstreaming@google.com, ribalda@chromium.org
References: <20240221160215.484151-1-panikiel@google.com>
 <20240221160215.484151-8-panikiel@google.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240221160215.484151-8-panikiel@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/02/2024 17:02, Paweł Anikiel wrote:
> The Chameleon v3 uses the framebuffer IP core to take the video signal
> from different sources and directly write frames into memory.
> 
> Signed-off-by: Paweł Anikiel <panikiel@google.com>

...

> +
> +  reg:
> +    items:
> +      - description: core registers
> +      - description: irq registers
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  google,legacy-format:
> +    type: boolean
> +    description: The incoming video stream is in 32-bit padded mode.

Why is this a property of board DTS? Can't the input streams change
depending on the usage? Who defines the incoming stream format?

> +

Best regards,
Krzysztof


