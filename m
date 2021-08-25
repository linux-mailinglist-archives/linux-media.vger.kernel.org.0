Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2537D3F70D3
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 10:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235663AbhHYIBi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 04:01:38 -0400
Received: from mga12.intel.com ([192.55.52.136]:18239 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229503AbhHYIBi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 04:01:38 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="197045274"
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; 
   d="scan'208";a="197045274"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2021 01:00:34 -0700
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; 
   d="scan'208";a="527121596"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2021 01:00:28 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 34CF1201ED;
        Wed, 25 Aug 2021 11:00:26 +0300 (EEST)
Date:   Wed, 25 Aug 2021 11:00:26 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 1/3] lib/sort: Split out choose_swap_func() local
 helper
Message-ID: <20210825080026.GM3@paasikivi.fi.intel.com>
References: <20210824133351.88179-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210824133351.88179-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

Thanks for the set.

On Tue, Aug 24, 2021 at 04:33:49PM +0300, Andy Shevchenko wrote:
> In some new code we may need the same functionality as provided by
> newly introduced choose_swap_func() helper.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  lib/sort.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/sort.c b/lib/sort.c
> index aa18153864d2..d9b2f5b73620 100644
> --- a/lib/sort.c
> +++ b/lib/sort.c
> @@ -151,6 +151,18 @@ static int do_cmp(const void *a, const void *b, cmp_r_func_t cmp, const void *pr
>  	return cmp(a, b, priv);
>  }
>  
> +static swap_func_t choose_swap_func(swap_func_t swap_func, void *base, size_t size)

Over 80, please wrap.

> +{
> +	if (swap_func)
> +		return swap_func;
> +
> +	if (is_aligned(base, size, 8))
> +		return SWAP_WORDS_64;
> +	if (is_aligned(base, size, 4))
> +		return SWAP_WORDS_32;

A newline here would be nice.

> +	return SWAP_BYTES;
> +}
> +
>  /**
>   * parent - given the offset of the child, find the offset of the parent.
>   * @i: the offset of the heap element whose parent is sought.  Non-zero.
> @@ -208,14 +220,7 @@ void sort_r(void *base, size_t num, size_t size,
>  	if (!a)		/* num < 2 || size == 0 */
>  		return;
>  
> -	if (!swap_func) {
> -		if (is_aligned(base, size, 8))
> -			swap_func = SWAP_WORDS_64;
> -		else if (is_aligned(base, size, 4))
> -			swap_func = SWAP_WORDS_32;
> -		else
> -			swap_func = SWAP_BYTES;
> -	}
> +	swap_func = choose_swap_func(swap_func, base, size);
>  
>  	/*
>  	 * Loop invariants:

-- 
Kind regards,

Sakari Ailus
