Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F1DC3F70E3
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 10:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235922AbhHYIJf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 04:09:35 -0400
Received: from mga01.intel.com ([192.55.52.88]:60512 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229542AbhHYIJb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 04:09:31 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="239654055"
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; 
   d="scan'208";a="239654055"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2021 01:08:36 -0700
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; 
   d="scan'208";a="684440179"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2021 01:08:34 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 83959201ED;
        Wed, 25 Aug 2021 11:08:32 +0300 (EEST)
Date:   Wed, 25 Aug 2021 11:08:32 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 2/3] lib/sort: Introduce rotate() to circular shift an
 array of elements
Message-ID: <20210825080832.GN3@paasikivi.fi.intel.com>
References: <20210824133351.88179-1-andriy.shevchenko@linux.intel.com>
 <20210824133351.88179-2-andriy.shevchenko@linux.intel.com>
 <4078b7a3-2ec2-ba87-d23c-b8daed7386fe@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4078b7a3-2ec2-ba87-d23c-b8daed7386fe@rasmusvillemoes.dk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rasmus, Andy,

On Wed, Aug 25, 2021 at 09:05:19AM +0200, Rasmus Villemoes wrote:
> On 24/08/2021 15.33, Andy Shevchenko wrote:
> > In some cases we want to circular shift an array of elements.
> > Introduce rotate() helper for that.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  include/linux/sort.h |  3 +++
> >  lib/sort.c           | 61 ++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 64 insertions(+)
> > 
> > diff --git a/include/linux/sort.h b/include/linux/sort.h
> > index b5898725fe9d..c881acb12ffc 100644
> > --- a/include/linux/sort.h
> > +++ b/include/linux/sort.h
> > @@ -13,4 +13,7 @@ void sort(void *base, size_t num, size_t size,
> >  	  cmp_func_t cmp_func,
> >  	  swap_func_t swap_func);
> >  
> > +void rotate(void *base, size_t num, size_t size, size_t by,
> > +	    swap_func_t swap_func);
> > +
> >  #endif
> > diff --git a/lib/sort.c b/lib/sort.c
> > index d9b2f5b73620..b9243f8db34b 100644
> > --- a/lib/sort.c
> > +++ b/lib/sort.c
> > @@ -14,6 +14,7 @@
> >  
> >  #include <linux/types.h>
> >  #include <linux/export.h>
> > +#include <linux/minmax.h>
> >  #include <linux/sort.h>
> >  
> >  /**
> > @@ -275,3 +276,63 @@ void sort(void *base, size_t num, size_t size,
> >  	return sort_r(base, num, size, _CMP_WRAPPER, swap_func, cmp_func);
> >  }
> >  EXPORT_SYMBOL(sort);
> > +
> > +/**
> > + * rotate - rotate an array of elements by a number of elements
> > + * @base: pointer to data to sort
> 
> sort?
> 
> > + * @num: number of elements
> > + * @size: size of each element
> > + * @by: number of elements to rotate by
> 
> Perhaps add (0 <= @by < @num) or something like that, and/or start the
> implementation with "if (num <= 1) return; if (by >= num) by %= num;"

The latter could be done unconditionally.

> 
> > + * @swap_func: pointer to swap function or NULL
> > + *
> > + * Helper function to advance all the elements of a circular buffer by
> > + * @by positions.
> > + */
> > +void rotate(void *base, size_t num, size_t size, size_t by,
> > +	    swap_func_t swap_func)
> > +{
> > +	struct {
> > +		size_t begin, end;
> > +	} arr[2] = {
> > +		{ .begin = 0, .end = by - 1 },
> > +		{ .begin = by, .end = num - 1 },
> > +	};
> 
> I see you just copied-and-adapted, but I think the code would be much
> easier to read without all those plus/minus ones all over.

Now that I think about it, they can be just removed. In that case end
refers to the element following end, rather than the last element.

> 
> > +	swap_func = choose_swap_func(swap_func, base, size);
> > +
> > +#define CHUNK_SIZE(a) ((a)->end - (a)->begin + 1)
> > +
> > +	/* Loop as long as we have out-of-place entries */
> > +	while (CHUNK_SIZE(&arr[0]) && CHUNK_SIZE(&arr[1])) {
> > +		size_t size0, i;
> > +
> > +		/*
> > +		 * Find the number of entries that can be arranged on this
> > +		 * iteration.
> > +		 */
> > +		size0 = min(CHUNK_SIZE(&arr[0]), CHUNK_SIZE(&arr[1]));
> > +
> > +		/* Swap the entries in two parts of the array */
> > +		for (i = 0; i < size0; i++) {
> > +			void *a = base + size * (arr[0].begin + i);
> > +			void *b = base + size * (arr[1].begin + i);
> > +
> > +			do_swap(a, b, size, swap_func);
> > +		}
> > +
> > +		if (CHUNK_SIZE(&arr[0]) > CHUNK_SIZE(&arr[1])) {
> > +			/* The end of the first array remains unarranged */
> > +			arr[0].begin += size0;
> > +		} else {
> > +			/*
> > +			 * The first array is fully arranged so we proceed
> > +			 * handling the next one.
> > +			 */
> > +			arr[0].begin = arr[1].begin;
> > +			arr[0].end = arr[1].begin + size0 - 1;
> > +			arr[1].begin += size0;
> > +		}
> > +	}
> 
> Perhaps add a small self-test, it's not at all obvious how this works
> (perhaps it's some standard CS101 algorithm for rotating in-place, I
> don't know, but even then an implementation can have off-by-ones and
> corner cases).

I don't know, I wrote this to fix a bug in the ipu3-cio2 driver. ;-) The
hardware, and so the arguments, were static. Nice to see it would be useful
elsewhere almost as-is.

> 
> for (len = 1; len < 15; ++len) {
>   for (by = 0; by <= len; ++by) {
>     for (i = 0; i < len; ++i)
>       arr[i] = i;
>     rotate(arr, len, sizeof(int), by);
>     for (i = 0; i < len; ++i)
>       if (arr[i] != (i + by) % len)
>         error();
>   }
> }

Makes sense to add something like that.

After addressing the comments, for patches from 1 to 3:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Kind regards,

Sakari Ailus
