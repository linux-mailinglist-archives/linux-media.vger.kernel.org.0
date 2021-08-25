Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D282A3F7017
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 09:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238577AbhHYHGJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 03:06:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238342AbhHYHGI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 03:06:08 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49308C0613C1
        for <linux-media@vger.kernel.org>; Wed, 25 Aug 2021 00:05:23 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id bq28so2377892lfb.7
        for <linux-media@vger.kernel.org>; Wed, 25 Aug 2021 00:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=f86vSlR0HZBwJ5uNol8AYek8un6SmRQ/aA/u93m5SF4=;
        b=OD++ZxlOA6qFnEjvx3fiHE7yGKsJpc2jMtGSjxuErnAThPWZs0JHuAHNjJfr6CaKBR
         bhwnji7i1q76GWFU49oNMbpbG7TJZlNzL3DYLnE4J6MHG9DfwC480QRkmUUaNZb30vg9
         ge9w0C2f9UXv6arlqSXuoyVeBaTN2LSgMr3RQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=f86vSlR0HZBwJ5uNol8AYek8un6SmRQ/aA/u93m5SF4=;
        b=bP3hKR7UOs1wkB7PA9hp09NMdzgxUn/qsWdS43FpKb3qpuTqCgwEDxB/PwOxDWqnAK
         i+MJZhfEeaGSQyy7cwCLcmgUezPCNU/ttjHQRnycwX6uH0xIB9Kba5SEIc7wRu7ueDsi
         JdECbjJ8p6W4NOM4aL8xGMQJAIbOfjhGx9NF3tOuiIpxpWyLWO+GkwHQQuw0+tSJVpog
         qB2o1UyEXn+eEcIp39bWyrwWUYct1U+UU34slC6W6eAq35WA239oVuc8ESxg9Ex0u2gM
         2lV29Nb53s/PtObQlRFdqnNHtvR+msTEXbXtJLCuiznw+iKQDGAnx2+ghCrxwNMrHvOm
         xQ3w==
X-Gm-Message-State: AOAM5325RHbqbZzl8iqjjZ7JWDm8FLkRnA8qdI0eL7n1+EGX+xV9wJ5A
        vcw4zArwgvYj5BcZ4YYc2sc/zQ==
X-Google-Smtp-Source: ABdhPJwBXL975V1sNeyA/63o0iwcSaMRAj2hesFnpLYv/vE2NeyIR1QxsC8gtkh9fN+rAwAYBK/3yQ==
X-Received: by 2002:ac2:508d:: with SMTP id f13mr27866203lfm.576.1629875121527;
        Wed, 25 Aug 2021 00:05:21 -0700 (PDT)
Received: from [172.16.11.1] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id l11sm1966960lfg.39.2021.08.25.00.05.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Aug 2021 00:05:20 -0700 (PDT)
Subject: Re: [PATCH v1 2/3] lib/sort: Introduce rotate() to circular shift an
 array of elements
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20210824133351.88179-1-andriy.shevchenko@linux.intel.com>
 <20210824133351.88179-2-andriy.shevchenko@linux.intel.com>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <4078b7a3-2ec2-ba87-d23c-b8daed7386fe@rasmusvillemoes.dk>
Date:   Wed, 25 Aug 2021 09:05:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824133351.88179-2-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/08/2021 15.33, Andy Shevchenko wrote:
> In some cases we want to circular shift an array of elements.
> Introduce rotate() helper for that.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  include/linux/sort.h |  3 +++
>  lib/sort.c           | 61 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 64 insertions(+)
> 
> diff --git a/include/linux/sort.h b/include/linux/sort.h
> index b5898725fe9d..c881acb12ffc 100644
> --- a/include/linux/sort.h
> +++ b/include/linux/sort.h
> @@ -13,4 +13,7 @@ void sort(void *base, size_t num, size_t size,
>  	  cmp_func_t cmp_func,
>  	  swap_func_t swap_func);
>  
> +void rotate(void *base, size_t num, size_t size, size_t by,
> +	    swap_func_t swap_func);
> +
>  #endif
> diff --git a/lib/sort.c b/lib/sort.c
> index d9b2f5b73620..b9243f8db34b 100644
> --- a/lib/sort.c
> +++ b/lib/sort.c
> @@ -14,6 +14,7 @@
>  
>  #include <linux/types.h>
>  #include <linux/export.h>
> +#include <linux/minmax.h>
>  #include <linux/sort.h>
>  
>  /**
> @@ -275,3 +276,63 @@ void sort(void *base, size_t num, size_t size,
>  	return sort_r(base, num, size, _CMP_WRAPPER, swap_func, cmp_func);
>  }
>  EXPORT_SYMBOL(sort);
> +
> +/**
> + * rotate - rotate an array of elements by a number of elements
> + * @base: pointer to data to sort

sort?

> + * @num: number of elements
> + * @size: size of each element
> + * @by: number of elements to rotate by

Perhaps add (0 <= @by < @num) or something like that, and/or start the
implementation with "if (num <= 1) return; if (by >= num) by %= num;"

> + * @swap_func: pointer to swap function or NULL
> + *
> + * Helper function to advance all the elements of a circular buffer by
> + * @by positions.
> + */
> +void rotate(void *base, size_t num, size_t size, size_t by,
> +	    swap_func_t swap_func)
> +{
> +	struct {
> +		size_t begin, end;
> +	} arr[2] = {
> +		{ .begin = 0, .end = by - 1 },
> +		{ .begin = by, .end = num - 1 },
> +	};

I see you just copied-and-adapted, but I think the code would be much
easier to read without all those plus/minus ones all over.

> +	swap_func = choose_swap_func(swap_func, base, size);
> +
> +#define CHUNK_SIZE(a) ((a)->end - (a)->begin + 1)
> +
> +	/* Loop as long as we have out-of-place entries */
> +	while (CHUNK_SIZE(&arr[0]) && CHUNK_SIZE(&arr[1])) {
> +		size_t size0, i;
> +
> +		/*
> +		 * Find the number of entries that can be arranged on this
> +		 * iteration.
> +		 */
> +		size0 = min(CHUNK_SIZE(&arr[0]), CHUNK_SIZE(&arr[1]));
> +
> +		/* Swap the entries in two parts of the array */
> +		for (i = 0; i < size0; i++) {
> +			void *a = base + size * (arr[0].begin + i);
> +			void *b = base + size * (arr[1].begin + i);
> +
> +			do_swap(a, b, size, swap_func);
> +		}
> +
> +		if (CHUNK_SIZE(&arr[0]) > CHUNK_SIZE(&arr[1])) {
> +			/* The end of the first array remains unarranged */
> +			arr[0].begin += size0;
> +		} else {
> +			/*
> +			 * The first array is fully arranged so we proceed
> +			 * handling the next one.
> +			 */
> +			arr[0].begin = arr[1].begin;
> +			arr[0].end = arr[1].begin + size0 - 1;
> +			arr[1].begin += size0;
> +		}
> +	}

Perhaps add a small self-test, it's not at all obvious how this works
(perhaps it's some standard CS101 algorithm for rotating in-place, I
don't know, but even then an implementation can have off-by-ones and
corner cases).

for (len = 1; len < 15; ++len) {
  for (by = 0; by <= len; ++by) {
    for (i = 0; i < len; ++i)
      arr[i] = i;
    rotate(arr, len, sizeof(int), by);
    for (i = 0; i < len; ++i)
      if (arr[i] != (i + by) % len)
        error();
  }
}

Rasmus
