Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53CDD6735B5
	for <lists+linux-media@lfdr.de>; Thu, 19 Jan 2023 11:38:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbjASKi3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Jan 2023 05:38:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230418AbjASKhy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Jan 2023 05:37:54 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BEC14DCEB
        for <linux-media@vger.kernel.org>; Thu, 19 Jan 2023 02:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674124663; x=1705660663;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=J5MPgwEs3lIfr7Upgs0rKZj7LGn9KkkH1rEr12A21NE=;
  b=eSe5Qm7laKLHirIKIo4nq5xx7abDS6hhAkTnAZjH0Sb69EVRtuFG5ZzR
   wEA3xMdJpIakcWDvMMYX3hnWyM8Izlu1JV3R8x4xvJX4Gp85ZsncgKCR9
   uo5rLXXq9J5UPAUvdJ3Y3gMJU+TjJD+mK4RBbdj2Ehs33CX3PvPWyBLxr
   eMsfG29tvRpIQBb5jS400ojnl5S2BjupQfUQ7L0uqUdZN48YKUgG69tkj
   yVrZ4TRZg62lBsFmsMPVzZD3dB9E6lrmtqlP/+QtPA+KOJ0OuGTpXXYVJ
   vC1sKPXHovJ9n/9qTZvGzk4JqYnAQOfewLwbOcqTfD4orcY34a6sM8jqz
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="327325820"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="327325820"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 02:37:43 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="610018477"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="610018477"
Received: from malejime-mobl.ger.corp.intel.com (HELO [10.249.47.26]) ([10.249.47.26])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 02:37:41 -0800
Message-ID: <33c2d360-31f9-da8b-127a-d473029192e6@linux.intel.com>
Date:   Thu, 19 Jan 2023 11:37:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: RFC: dma_resv_unlock() and ww_acquire_ctx scope
Content-Language: en-US
To:     Paul Cercueil <paul@crapouillou.net>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian Koenig <christian.koenig@amd.com>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
References: <730e5a40874c0e5bf66ddcb9fe7b2e4f28e09b1a.camel@crapouillou.net>
From:   Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <730e5a40874c0e5bf66ddcb9fe7b2e4f28e09b1a.camel@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 2023-01-19 11:24, Paul Cercueil wrote:
> Hi,
>
> Just a reflexion I have after an intensive (and intense) debugging
> session.
>
> I had the following code:
>
>
> int my_dma_resv_lock(struct dma_buf *dmabuf)
> {
> 	struct ww_acquire_ctx ctx;
> 	int ret;
>
> 	ww_acquire_init(&ctx, &reservation_ww_class);
>
> 	ret = dma_resv_lock_interruptible(dmabuf->resv, &ctx);
> 	if (ret) {
> 		if (ret != -EDEADLK)
> 			return ret;
>
> 		ret = dma_resv_lock_slow_interruptible(dmabuf->resv,
> 						       &ctx);
> 	}
>
> 	return ret;
> }
>
>
> Then I would eventually unlock the dma_resv object in the caller
> function. What made me think this was okay, was that the API itself
> suggests it's okay - as dma_resv_unlock() does not take the
> "ww_acquire_ctx" object as argument, my assumption was that after the
> dma_resv was locked, the variable could go out of scope.
>
> I wonder if it would be possible to change the API a little bit, so
> that it is less prone to errors like this. Maybe by doing a struct copy
> of the initialized ctx into the dma_resv object (if at all possible),
> so that the original can actually go out of scope, or maybe having
> dma_resv_unlock() take the ww_acquire_ctx as argument, even if it is
> not actually used in the function body - just to make it obvious that
> it is needed all the way to the point where the dma_resv is unlocked.
>
> This email doesn't have to result in anything, I just thought I'd share
> one point where I feel the API could be made less error-prone.

Hey,

This example code will fail eventually. If you have DEBUG_LOCK_ALLOC 
enabled, a fake lock is inited in ww_acquire_init. If you don't free it 
using ww_acquire_fini(), lockdep will see that you free a live lock that 
was never released. PROVE_LOCKING will also complain that you never 
unlocked the ctx fake lock.

If you do call ww_acquire_fini, you will get a loud complain if you 
never released all locks, because ctx->acquired is non-zero.

Try with PROVE_LOCKING, your example will receive a lockdep splat. :)

~Maarten

