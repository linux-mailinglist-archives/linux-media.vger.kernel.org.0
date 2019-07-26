Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C975875F63
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2019 08:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725983AbfGZG7R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jul 2019 02:59:17 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40096 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbfGZG7R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jul 2019 02:59:17 -0400
Received: by mail-lj1-f194.google.com with SMTP id m8so16820665lji.7
        for <linux-media@vger.kernel.org>; Thu, 25 Jul 2019 23:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WCNBl+Ug67OirRYmmdId1xroOSBlthiYyyJdmUhZr+E=;
        b=bphLnQl4h6MxwvA8ZiJF1bGWqs65QUNNA0He6fWmoAZ4BWChP8rGV7l5acGIJ8ofPv
         AvQzxTq/gGVePK5mDfqidXpaA6mgbx+XskXZE8+etrXCdXKGNtrMzouzpgX8lhetn4d7
         oSfRAFozndPLHn08KxWFRmhVr5fyfLR1zd6Ik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WCNBl+Ug67OirRYmmdId1xroOSBlthiYyyJdmUhZr+E=;
        b=fd9pZcU2suwIyZBdUahuH5v7YEq4pcAyAxE6dsW/f/9EmmwaHIbQ070anwHmSpYavA
         0CN4tkn//twuCufTsUPXWtzvKvhdZj27HsoO8rbNpuMCu/fyv9s1bTT9XMlxd7ZDk5T/
         AK79tJLrPzNURZYw/wIF5fOPDoOKFzX4xmxKg90Yn+9lq6Go8l+WAHiPoEU+oBOacAbf
         vh0PQdXJ9aPd415OjgqDE3yOO6K7APWMJdCsrGjTSKtWGHK5H+4FSM1s3JqSGQ4m+RQx
         s9u+jOrKn+/m2NYp+OkxJyBCHaOoZJ4G+gc4Se//EzUZB3MkvrTkuAy7yDjoBpdGq/MW
         iLtQ==
X-Gm-Message-State: APjAAAUc2EdLjpSq3fuS9pu2W4aRcGqGC/t0sCMJldb4dsW7x91Bt2GJ
        13hEhUil8AZK9lor+NYdoBE=
X-Google-Smtp-Source: APXvYqzO6G4Vsb2mfV6DZrmgtEEhQdPflr3TLxLyonDnJUm8SF3mdvsPwlBeWMhNCVFyNb/inIoOvw==
X-Received: by 2002:a2e:834e:: with SMTP id l14mr2719876ljh.158.1564124354332;
        Thu, 25 Jul 2019 23:59:14 -0700 (PDT)
Received: from [172.16.11.28] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id z22sm9835284ljz.20.2019.07.25.23.59.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jul 2019 23:59:13 -0700 (PDT)
Subject: Re: [PATCH 1/9] lib/sort.c: implement sort() variant taking context
 argument
To:     Andrew Morton <akpm@linux-foundation.org>,
        Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20190619121540.29320-1-boris.brezillon@collabora.com>
 <20190619121540.29320-2-boris.brezillon@collabora.com>
 <20190725170547.a8a357dd76cc586f475b782d@linux-foundation.org>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <66755c09-53f1-24e9-0160-6bcc78c4d2e1@rasmusvillemoes.dk>
Date:   Fri, 26 Jul 2019 08:59:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190725170547.a8a357dd76cc586f475b782d@linux-foundation.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/07/2019 02.05, Andrew Morton wrote:
> On Wed, 19 Jun 2019 14:15:32 +0200 Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
>> From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
>>
>> Our list_sort() utility has always supported a context argument that
>> is passed through to the comparison routine. Now there's a use case
>> for the similar thing for sort().
>>
>> This implements sort_r by simply extending the existing sort function
>> in the obvious way. To avoid code duplication, we want to implement
>> sort() in terms of sort_r(). The naive way to do that is
>>
>> static int cmp_wrapper(const void *a, const void *b, const void *ctx)
>> {
>>   int (*real_cmp)(const void*, const void*) = ctx;
>>   return real_cmp(a, b);
>> }
>>
>> sort(..., cmp) { sort_r(..., cmp_wrapper, cmp) }
>>
>> but this would do two indirect calls for each comparison. Instead, do
>> as is done for the default swap functions - that only adds a cost of a
>> single easily predicted branch to each comparison call.
>>
>> Aside from introducing support for the context argument, this also
>> serves as preparation for patches that will eliminate the indirect
>> comparison calls in common cases.
> 
> Acked-by: Andrew Morton <akpm@linux-foundation.org>
> 
>> --- a/lib/sort.c
>> +++ b/lib/sort.c
>> @@ -144,6 +144,18 @@ static void do_swap(void *a, void *b, size_t size, swap_func_t swap_func)
>>  		swap_func(a, b, (int)size);
>>  }
>>  
>> +typedef int (*cmp_func_t)(const void *, const void *);
>> +typedef int (*cmp_r_func_t)(const void *, const void *, const void *);
>> +#define _CMP_WRAPPER ((cmp_r_func_t)0L)
> 
> Although I can't say I'm a fan of _CMP_WRAPPER.  I don't understand
> what the name means.  Why not simply open-code NULL in the two sites?

That's the preparation part. Once I find time to tie up the loose ends,
there'll be a

  sort_by_key(base, num, swap, key)

where base must be a pointer to (array of) struct foobar, and key is the
name of an u32 or u64 (more can be added) member. Internally, that will
work by calling sort_r with a sentinel _CMP_SORT_U32 (or _CMP_SORT_U64,
...) as cmp function and offsetof(typeof(*base), key) as the priv argument.

In do_cmp, we then check whether the cmp function is a small
non-negative integer and then do the appropriate comparison directly
instead of doing an indirect call.

And this infrastructure will be shared with list_sort which will grow a
similar list_sort_by_key(). I think the actual value of _CMP_WRAPPER
will change to simplify that part, so for that reason alone I won't
hard-code NULL.


>> +static int do_cmp(const void *a, const void *b,
>> +		  cmp_r_func_t cmp, const void *priv)
>> +{
>> +	if (cmp == _CMP_WRAPPER)
>> +		return ((cmp_func_t)(priv))(a, b);
>> +	return cmp(a, b, priv);
>> +}
>> +

i.e., this becomes something like

if ((unsigned long)cmp <= ...) {
  if (cmp == CMP_WRAPPER)
     // called from sort(), priv is the original cmp_func pointer
     return ((cmp_func_t)(priv))(a, b);
  // must be called from sort_by_key, priv is the offset in each struct
  long offset = (long)priv;
  a += offset;
  b += offset;
  if (cmp == CMP_U32)
    return *(u32*)a > *(u32*)b;
  if (cmp == CMP_u64)
    return *(u64*)a > *(u64*)b;
  WARN_ONCE() // should be eliminated by smart enough compiler
  return 0;
}
return cmp(a, b, priv);

>>  /**
>>   * parent - given the offset of the child, find the offset of the parent.
>>   * @i: the offset of the heap element whose parent is sought.  Non-zero.
>> @@ -171,12 +183,13 @@ static size_t parent(size_t i, unsigned int lsbit, size_t size)
>>  }
>>  
>>  /**
>> - * sort - sort an array of elements
>> + * sort_r - sort an array of elements
>>   * @base: pointer to data to sort
>>   * @num: number of elements
>>   * @size: size of each element
>>   * @cmp_func: pointer to comparison function
>>   * @swap_func: pointer to swap function or NULL
>> + * @priv: third argument passed to comparison function
> 
> Passing priv==NULLis part of the interface and should be documented?

No, to sort_r() as a public function @priv is completely opaque, and the
user can pass anything he likes. Only when sort_r() is called
"internally" with a sentinel value of cmp_func (e.g. from sort() or
sort_by_key()) does the priv argument have any meaning, but that's
implementation details that should absolutely not be documented.

Rasmus
