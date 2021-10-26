Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 667F543B390
	for <lists+linux-media@lfdr.de>; Tue, 26 Oct 2021 16:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236355AbhJZOG3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Oct 2021 10:06:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:39290 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234584AbhJZOG3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Oct 2021 10:06:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C86960C41;
        Tue, 26 Oct 2021 14:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635257045;
        bh=fYdFs1PisYcKFzN6nRtvkLmTckm/NDSJLCk+ti392Ww=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mXG8+T/cQMFHz2x09oPHlhLJhgracMsXllil7jpAGNm37jTEggSQ0Ztv1l/lYpVOD
         4yaJbCSkRmUoIkugi192f74I93XiT8A4H0TeeaG6H8kCYjjvDPPlFZNCRN4aP4xROs
         rVpGprOeNASv0hwRb/TVSFctLrvbJn46AF/iVjWlurWhbbc5k7Cn+8IEkJRPlexUyR
         muwhqoPHSIKRKQ3wZz3UFmvtgQyjeXYVbd4uVFvAQfxhkx42FKMQmeMGmcPd9KxvdL
         H0EsnWhxRZJpCcktWb7uSPjIOubg+aBYUIRosyBBEuOE0923IODBggoWuHcwx1rGA8
         7VLJb4DOloeOw==
Date:   Tue, 26 Oct 2021 07:04:00 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] dma-buf: st: fix error handling in test_get_fences()
Message-ID: <YXgK0HAe1+dEPvL1@archlinux-ax161>
References: <20211026083448.3471055-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211026083448.3471055-1-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 26, 2021 at 10:34:37AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The new driver incorrectly unwinds after errors, as clang points out:
> 
> drivers/dma-buf/st-dma-resv.c:295:7: error: variable 'i' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
>                 if (r) {
>                     ^
> drivers/dma-buf/st-dma-resv.c:336:9: note: uninitialized use occurs here
>         while (i--)
>                ^
> drivers/dma-buf/st-dma-resv.c:295:3: note: remove the 'if' if its condition is always false
>                 if (r) {
>                 ^~~~~~~~
> drivers/dma-buf/st-dma-resv.c:288:6: error: variable 'i' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
>         if (r) {
>             ^
> drivers/dma-buf/st-dma-resv.c:336:9: note: uninitialized use occurs here
>         while (i--)
>                ^
> drivers/dma-buf/st-dma-resv.c:288:2: note: remove the 'if' if its condition is always false
>         if (r) {
>         ^~~~~~~~
> drivers/dma-buf/st-dma-resv.c:280:10: note: initialize the variable 'i' to silence this warning
>         int r, i;
>                 ^
>                  = 0
> 
> Skip cleaning up the bits that have not been allocated at this point.
> 
> Fixes: 1d51775cd3f5 ("dma-buf: add dma_resv selftest v4")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> I'm not familiar with these interfaces, so I'm just guessing where
> we should jump after an error, please double-check and fix if necessary.
> ---
>  drivers/dma-buf/st-dma-resv.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
> index 6f3ba756da3e..bc32b3eedcb6 100644
> --- a/drivers/dma-buf/st-dma-resv.c
> +++ b/drivers/dma-buf/st-dma-resv.c
> @@ -287,7 +287,7 @@ static int test_get_fences(void *arg, bool shared)
>  	r = dma_resv_lock(&resv, NULL);
>  	if (r) {
>  		pr_err("Resv locking failed\n");
> -		goto err_free;
> +		goto err_resv;
>  	}
>  
>  	if (shared) {
> @@ -295,7 +295,7 @@ static int test_get_fences(void *arg, bool shared)
>  		if (r) {
>  			pr_err("Resv shared slot allocation failed\n");
>  			dma_resv_unlock(&resv);
> -			goto err_free;
> +			goto err_resv;
>  		}
>  
>  		dma_resv_add_shared_fence(&resv, f);
> @@ -336,6 +336,7 @@ static int test_get_fences(void *arg, bool shared)
>  	while (i--)
>  		dma_fence_put(fences[i]);
>  	kfree(fences);
> +err_resv:
>  	dma_resv_fini(&resv);
>  	dma_fence_put(f);
>  	return r;
> -- 
> 2.29.2
> 
