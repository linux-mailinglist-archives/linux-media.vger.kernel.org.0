Return-Path: <linux-media+bounces-14724-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B5F92AFA5
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 07:59:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E43F428181B
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 05:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4156812DD90;
	Tue,  9 Jul 2024 05:59:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2741C1304A3;
	Tue,  9 Jul 2024 05:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720504785; cv=none; b=f0FrumRoNiJzOMS5KZ0Y3zZi6WOvtDBVMO8EoSYSFi3K5ayg1kK6ebRBAq0SAvLBzqrv/SsynWuPWEkmIRhT5hTH266bdTJkeg09WGYgzkeu+9abTe+YoH1CSOXK3KRUXbgVymWR4J7Tzs3++/fOiThYuZjQMpgJUzG04zKYlmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720504785; c=relaxed/simple;
	bh=rV+4oAZg91tmW2GlW2fUqugFTjYvSHme2pjvx/QymmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mry/lCaSMxS8Vz0uXtX3XWNk+CblzyVy7C47O9LpeICG8Udv15Vgc0LRsMh5WUHS9mgyqObQ2WSytbTJyRsfXe5H9AoEsgBiGx21/x17/WRJOCUMMlTiC6wuFqUGDJvJNuAffZ+LFCgcGB/gpff1k0eN3OPTEtbO7th5OUVnG5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42561c16ffeso33708545e9.3;
        Mon, 08 Jul 2024 22:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720504782; x=1721109582;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PDntGN+T80+6QoF3T0bYQHIMVziDiAyD/iDwnXqy4eM=;
        b=tcEmvEs2i/XrRIJy6oEjQNJ118WG3DnhuQaef1bT2du63Cj+lcFr3d+69Whu/hCwTk
         JJPo3rWcmXrP1+78s2PsCeozCF7cpF1P9TLBdiXcW8sg2dKYfJG4ccZG0QKwTIQ9uxQo
         0m/LS9c/RQyQ1gVOSQQhvXZBcPrMKimBmhNq2OQYzfY2m7OQo7rG+X7xdYOC7bN2eXBY
         fQFtc0Q5IbxhKLPoj9BSo+sCD4ZswBH9e1aipTfTOmGXuABDEq05Rek4scgGdDu3nGBB
         c8DLUsXwc3gY9phPexIyyqgay9MpWcIMLqJFoOzPVZLWM4qvfE4HCFQ2mTXWYsbwkCnd
         8cDw==
X-Forwarded-Encrypted: i=1; AJvYcCUUtpAjljwGcEHNaSS7gjBHhGhf6Olpm6xWS0xn29aINiPAfbI9hAsBM9tFZXD4gGrYBJvrX+6NxLKvSkXERKCENWabhYEr4K9KAUv+UbH2OH9jxePdLJykCquwx+xUx4CUrbD4yOK4zRwKquf57y0p+ON92mGl1/f4L27Uan/oyxcdRPA=
X-Gm-Message-State: AOJu0Yw3ZwjdinMo+r1VrhWEx7ZQfSmdqY4Mb5m7uFu88Jpbnm3AU6kX
	UK1o3VlH2ud5paQIHZtFBKyQ4ft740sughD78gt7r26XhuIxLx1Crf/6+ktScIQ=
X-Google-Smtp-Source: AGHT+IHsfKqHKPgYYtKpHDE7FgVPSfYsXo90trFZ+VNdJQeq4PDmhDtmSLLmEcIKoXsDSwZq9AhSvA==
X-Received: by 2002:a05:600c:1c9f:b0:426:591d:adb6 with SMTP id 5b1f17b1804b1-426708fa8efmr9375595e9.35.1720504782352;
        Mon, 08 Jul 2024 22:59:42 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:69? ([2a0b:e7c0:0:107::aaaa:69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4265e90aa1dsm122404375e9.13.2024.07.08.22.59.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 22:59:41 -0700 (PDT)
Message-ID: <a0e31542-e77b-4efa-959d-f7f5a8719616@kernel.org>
Date: Tue, 9 Jul 2024 07:59:40 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] math.h: Add macros for rounding to closest value
To: Devarsh Thakkar <devarsht@ti.com>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, sebastian.fricke@collabora.com,
 andriy.shevchenko@linux.intel.com, jani.nikula@intel.com, corbet@lwn.net,
 broonie@kernel.org, rdunlap@infradead.org, linux-doc@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, praneeth@ti.com, nm@ti.com,
 vigneshr@ti.com, a-bhatia1@ti.com, j-luthra@ti.com, b-brnich@ti.com,
 detheridge@ti.com, p-mantena@ti.com, vijayp@ti.com,
 andi.shyti@linux.intel.com, nicolas@ndufresne.ca, davidgow@google.com,
 dlatypov@google.com
References: <20240708155943.2314427-1-devarsht@ti.com>
 <20240708155943.2314427-2-devarsht@ti.com>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <20240708155943.2314427-2-devarsht@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08. 07. 24, 17:59, Devarsh Thakkar wrote:
> Add below rounding related macros:
> 
> round_closest_up(x, y) : Rounds x to closest multiple of y where y is a
> power of 2, with a preference to round up in case two nearest values are
> possible.
> 
> round_closest_down(x, y) : Rounds x to closest multiple of y where y is a
> power of 2, with a preference to round down in case two nearest values are
> possible.
> 
> roundclosest(x, y) : Rounds x to closest multiple of y, this macro should
> generally be used only when y is not multiple of 2 as otherwise
> round_closest* macros should be used which are much faster.
> 
> Examples:
>   * round_closest_up(17, 4) = 16
>   * round_closest_up(15, 4) = 16
>   * round_closest_up(14, 4) = 16
>   * round_closest_down(17, 4) = 16
>   * round_closest_down(15, 4) = 16
>   * round_closest_down(14, 4) = 12
>   * roundclosest(21, 5) = 20

With consistency in mind, why is there no underscore?

>   * roundclosest(19, 5) = 20
>   * roundclosest(17, 5) = 15
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> NOTE: This patch is inspired from the Mentor Graphics IPU driver [1]
> which uses similar macro locally and which is updated in further patch
> in the series to use this generic macro instead along with other drivers
> having similar requirements.
> 
> Link: https://elixir.bootlin.com/linux/v6.8.9/source/drivers/gpu/ipu-v3/ipu-image-convert.c#L480 [1]
> ---
>   include/linux/math.h | 63 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 63 insertions(+)
> 
> diff --git a/include/linux/math.h b/include/linux/math.h
> index dd4152711de7..79e3dfda77fc 100644
> --- a/include/linux/math.h
> +++ b/include/linux/math.h
> @@ -34,6 +34,52 @@
>    */
>   #define round_down(x, y) ((x) & ~__round_mask(x, y))
>   
> +/**
> + * round_closest_up - round closest to be multiple of specified value (which is
> + *                    power of 2) with preference to rounding up
> + * @x: the value to round
> + * @y: multiple to round closest to (must be a power of 2)
> + *
> + * Rounds @x to closest multiple of @y (which must be a power of 2).
> + * The value can be either rounded up or rounded down depending upon rounded
> + * value's closeness to the specified value. If there are two closest possible
> + * values, i.e. the difference between the specified value and it's rounded up
> + * and rounded down values is same then preference is given to rounded up
> + * value.
> + *
> + * To perform arbitrary rounding to closest value (not multiple of 2), use
> + * roundclosest().
> + *
> + * Examples:
> + * * round_closest_up(17, 4) = 16
> + * * round_closest_up(15, 4) = 16
> + * * round_closest_up(14, 4) = 16
> + */
> +#define round_closest_up(x, y) round_down((x) + (y) / 2, (y))
> +
> +/**
> + * round_closest_down - round closest to be multiple of specified value (which
> + *			is power of 2) with preference to rounding down
> + * @x: the value to round
> + * @y: multiple to round closest to (must be a power of 2)
> + *
> + * Rounds @x to closest multiple of @y (which must be a power of 2).
> + * The value can be either rounded up or rounded down depending upon rounded
> + * value's closeness to the specified value. If there are two closest possible
> + * values, i.e. the difference between the specified value and it's rounded up
> + * and rounded down values is same then preference is given to rounded up
> + * value.

Too heavy sentence. Did you mean "its" not "it's"?

What about:
There can be two closest values. I.e. the difference between the 
specified value and its rounded up and down values is the same. In that 
case, the rounded up value is preferred.
?

The same for round_closest_up().

> + *
> + * To perform arbitrary rounding to closest value (not multiple of 2), use
> + * roundclosest().
> + *
> + * Examples:
> + * * round_closest_down(17, 4) = 16
> + * * round_closest_down(15, 4) = 16
> + * * round_closest_down(14, 4) = 12
> + */
> +#define round_closest_down(x, y) round_up((x) - (y) / 2, (y))
> +
>   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
>   
>   #define DIV_ROUND_DOWN_ULL(ll, d) \
> @@ -77,6 +123,23 @@
>   }							\
>   )
>   
> +/**
> + * roundclosest - round to nearest multiple
> + * @x: the value to round
> + * @y: multiple to round nearest to
> + *
> + * Rounds @x to nearest multiple of @y.
> + * The rounded value can be greater than or less than @x depending

greater or less than

> + * upon it's nearness to @x.

"its"

> If @y will always be a power of 2, consider

If @y is always a power...

> + * using the faster round_closest_up() or round_closest_down().
> + *
> + * Examples:
> + * * roundclosest(21, 5) = 20
> + * * roundclosest(19, 5) = 20
> + * * roundclosest(17, 5) = 15
> + */
> +#define roundclosest(x, y) rounddown((x) + (y) / 2, (y))
> +
>   /*
>    * Divide positive or negative dividend by positive or negative divisor
>    * and round to closest integer. Result is undefined for negative

-- 
js


