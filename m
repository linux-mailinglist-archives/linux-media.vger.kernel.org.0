Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35F8B75BDB
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2019 02:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbfGZAFu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 20:05:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:42592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726910AbfGZAFu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 20:05:50 -0400
Received: from localhost.localdomain (c-73-223-200-170.hsd1.ca.comcast.net [73.223.200.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0D555229F9;
        Fri, 26 Jul 2019 00:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564099548;
        bh=ivU+Nk6TC3cNZvfii511FAGTl7zmUHp39Fzg2bYfiZA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=p6kbI70FMfgTxXFJgRVShi5NbBfi+cvshWuJOFbw9ZX9vSBNoCraf+HR3yuja0sPf
         up4aZ+bLi6Ewqt8pvll/XnShfDC0H4lmA4NWoFZG9lXmCRGaLnZJd/WU5sLbxIKv5s
         6oCC+w8bS9W9p060MQxWJg+ss7wrmpzBoDXCMH+Y=
Date:   Thu, 25 Jul 2019 17:05:47 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Boris Brezillon <boris.brezillon@collabora.com>
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
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 1/9] lib/sort.c: implement sort() variant taking context
 argument
Message-Id: <20190725170547.a8a357dd76cc586f475b782d@linux-foundation.org>
In-Reply-To: <20190619121540.29320-2-boris.brezillon@collabora.com>
References: <20190619121540.29320-1-boris.brezillon@collabora.com>
        <20190619121540.29320-2-boris.brezillon@collabora.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 19 Jun 2019 14:15:32 +0200 Boris Brezillon <boris.brezillon@collabora.com> wrote:

> From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> 
> Our list_sort() utility has always supported a context argument that
> is passed through to the comparison routine. Now there's a use case
> for the similar thing for sort().
> 
> This implements sort_r by simply extending the existing sort function
> in the obvious way. To avoid code duplication, we want to implement
> sort() in terms of sort_r(). The naive way to do that is
> 
> static int cmp_wrapper(const void *a, const void *b, const void *ctx)
> {
>   int (*real_cmp)(const void*, const void*) = ctx;
>   return real_cmp(a, b);
> }
> 
> sort(..., cmp) { sort_r(..., cmp_wrapper, cmp) }
> 
> but this would do two indirect calls for each comparison. Instead, do
> as is done for the default swap functions - that only adds a cost of a
> single easily predicted branch to each comparison call.
> 
> Aside from introducing support for the context argument, this also
> serves as preparation for patches that will eliminate the indirect
> comparison calls in common cases.

Acked-by: Andrew Morton <akpm@linux-foundation.org>

> --- a/lib/sort.c
> +++ b/lib/sort.c
> @@ -144,6 +144,18 @@ static void do_swap(void *a, void *b, size_t size, swap_func_t swap_func)
>  		swap_func(a, b, (int)size);
>  }
>  
> +typedef int (*cmp_func_t)(const void *, const void *);
> +typedef int (*cmp_r_func_t)(const void *, const void *, const void *);
> +#define _CMP_WRAPPER ((cmp_r_func_t)0L)

Although I can't say I'm a fan of _CMP_WRAPPER.  I don't understand
what the name means.  Why not simply open-code NULL in the two sites?

> +static int do_cmp(const void *a, const void *b,
> +		  cmp_r_func_t cmp, const void *priv)
> +{
> +	if (cmp == _CMP_WRAPPER)
> +		return ((cmp_func_t)(priv))(a, b);
> +	return cmp(a, b, priv);
> +}
> +
>  /**
>   * parent - given the offset of the child, find the offset of the parent.
>   * @i: the offset of the heap element whose parent is sought.  Non-zero.
> @@ -171,12 +183,13 @@ static size_t parent(size_t i, unsigned int lsbit, size_t size)
>  }
>  
>  /**
> - * sort - sort an array of elements
> + * sort_r - sort an array of elements
>   * @base: pointer to data to sort
>   * @num: number of elements
>   * @size: size of each element
>   * @cmp_func: pointer to comparison function
>   * @swap_func: pointer to swap function or NULL
> + * @priv: third argument passed to comparison function

Passing priv==NULLis part of the interface and should be documented?

>   *
>   * This function does a heapsort on the given array.  You may provide
>   * a swap_func function if you need to do something more than a memory
> @@ -188,9 +201,10 @@ static size_t parent(size_t i, unsigned int lsbit, size_t size)
>   * O(n*n) worst-case behavior and extra memory requirements that make
>   * it less suitable for kernel use.
>   */
> -void sort(void *base, size_t num, size_t size,
> -	  int (*cmp_func)(const void *, const void *),
> -	  void (*swap_func)(void *, void *, int size))
> +void sort_r(void *base, size_t num, size_t size,
> +	    int (*cmp_func)(const void *, const void *, const void *),
> +	    void (*swap_func)(void *, void *, int size),
> +	    const void *priv)
>  {
>  	/* pre-scale counters for performance */
>  	size_t n = num * size, a = (num/2) * size;
> @@ -238,12 +252,12 @@ void sort(void *base, size_t num, size_t size,
>  		 * average, 3/4 worst-case.)
>  		 */
>  		for (b = a; c = 2*b + size, (d = c + size) < n;)
> -			b = cmp_func(base + c, base + d) >= 0 ? c : d;
> +			b = do_cmp(base + c, base + d, cmp_func, priv) >= 0 ? c : d;
>  		if (d == n)	/* Special case last leaf with no sibling */
>  			b = c;
>  
>  		/* Now backtrack from "b" to the correct location for "a" */
> -		while (b != a && cmp_func(base + a, base + b) >= 0)
> +		while (b != a && do_cmp(base + a, base + b, cmp_func, priv) >= 0)
>  			b = parent(b, lsbit, size);
>  		c = b;			/* Where "a" belongs */
>  		while (b != a) {	/* Shift it into place */
> @@ -252,4 +266,12 @@ void sort(void *base, size_t num, size_t size,
>  		}
>  	}
>  }
> +EXPORT_SYMBOL(sort_r);
> +
> +void sort(void *base, size_t num, size_t size,
> +	  int (*cmp_func)(const void *, const void *),
> +	  void (*swap_func)(void *, void *, int size))
> +{
> +	return sort_r(base, num, size, _CMP_WRAPPER, swap_func, cmp_func);
> +}
>  EXPORT_SYMBOL(sort);

