Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 996BE3F7260
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 11:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239749AbhHYJ4s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 05:56:48 -0400
Received: from mga07.intel.com ([134.134.136.100]:17563 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234372AbhHYJ4s (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 05:56:48 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="281207662"
X-IronPort-AV: E=Sophos;i="5.84,350,1620716400"; 
   d="scan'208";a="281207662"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2021 02:56:02 -0700
X-IronPort-AV: E=Sophos;i="5.84,350,1620716400"; 
   d="scan'208";a="507952381"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2021 02:55:59 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mIpdS-00DWAR-0Q; Wed, 25 Aug 2021 12:55:54 +0300
Date:   Wed, 25 Aug 2021 12:55:53 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 2/3] lib/sort: Introduce rotate() to circular shift an
 array of elements
Message-ID: <YSYTqU6jVA4bPgSp@smile.fi.intel.com>
References: <20210824133351.88179-1-andriy.shevchenko@linux.intel.com>
 <20210824133351.88179-2-andriy.shevchenko@linux.intel.com>
 <4078b7a3-2ec2-ba87-d23c-b8daed7386fe@rasmusvillemoes.dk>
 <20210825080832.GN3@paasikivi.fi.intel.com>
 <8bc8d977-5204-6f5b-8a1c-f2338c141993@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bc8d977-5204-6f5b-8a1c-f2338c141993@rasmusvillemoes.dk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 25, 2021 at 11:29:12AM +0200, Rasmus Villemoes wrote:
> On 25/08/2021 10.08, Sakari Ailus wrote:

...

> Well, Andy hasn't actually shown that it would be useful anywhere else.
> I think I'd like to see another user.

I have found another potential user, but in their case (it's networking)
the simple for-loop with swap() in use seems efficient enough (the element size
is 8 bytes there).

I haven't check for really custom implementations of entire rotate (where no
swap() macro is in use), it might be another user lurking around.

> Just doing "move this helper to
> lib/ because we can reuse choose-a-proper-swap-func and thus implement
> this perhaps a tiny bit faster" without considering whether it's even
> performance-critical in the sole user is not a good idea IMO.

I agree with you.

> Especially since it can affect code generation of the much more
> important (at least, has many more users) sort() function - the
> do_swap() function grows another user, so could make the compiler end up
> choosing not to inline it anymore.

This can be fixed by always inlining?

> There's another slightly simpler way to implement rotate(), which might
> end up having more users (though I can't find any currently): Add a
> reverse() helper, then rotate() can be done as reverse(a, 0, n);
> reverse(a, 0, k); reverse(a, k, n-k);. If my math is right, the current
> suggested rotate() ends up doing n-gcd(n,k) swaps, while the
> implementation in terms of a reverse() would do n-1 if either n or k is
> odd, otherwise n, calls to swap().

Interesting idea. And this, btw, may have more users per se.

-- 
With Best Regards,
Andy Shevchenko


