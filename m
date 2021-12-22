Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7AF247D92B
	for <lists+linux-media@lfdr.de>; Wed, 22 Dec 2021 23:11:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236054AbhLVWLE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Dec 2021 17:11:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235945AbhLVWLD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Dec 2021 17:11:03 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C232FC061574
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 14:11:02 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id j21so13894458edt.9
        for <linux-media@vger.kernel.org>; Wed, 22 Dec 2021 14:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=CXXmUNxPkCxymkecbPfwTry1g1NESxMh7D+z/VdxfYM=;
        b=lLDhp0wKuaC0pk+ZWgOndJjJ1vfksBUUmOsvbYXG6ot3ltaiHTdLdwModIOhcX0XgB
         eXThLSvO7jjKN6s4JOXUO/W20CCl0dpGZRBs56wJWZ2aVMgfE2xDB4FezaG2S9142X0Q
         hZgzlOUuQPsrGmSm9csErzgeVApLf0CQX96Tc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=CXXmUNxPkCxymkecbPfwTry1g1NESxMh7D+z/VdxfYM=;
        b=6d4HEvLXhReU60dsKPSprWIzLoC0mvCooYZUmnSJlkQlw9PfMm9aQW8l1u9VxhWAVz
         w7Es26XnNsO8kO4q1xoByFRmdb0ExVoFndK2pH7k6agnn4FwUr4Gknaxhim/7Ess3Wgd
         F2I/kLqMs0Staj1MpQ5Y3R+4ZNvCSOVhHjW2HiDm1Pga9cce5mQoEYLnbjqTrVdUsgHq
         tkNeLYMit0skBx5dJrGcrSlXvL4Qy/6YuEYM0OO79g2C4YnGJw//DHZjjZnDByV3Z4E7
         TqpcUcODVjtWQXMiMraDYpnGHgVcF+jtkIaYrWwj7ikfKJsOzaI1HLhWyoE5334yg/uj
         1gRw==
X-Gm-Message-State: AOAM530n8YkYif9TkH1vNHfH9l43TW1m8xtCWwXv8CLQ9uniZUh2WIGO
        CgXDULj0l3uKCVMfeJhRSGt2iQ==
X-Google-Smtp-Source: ABdhPJyuWQsjblHvDjWOxEzOBMZLQ5tyFeaZsLWJLpnsj7fb46SUk3Yhx/EVMpWBN8NtsJFox7aAhA==
X-Received: by 2002:a17:906:5d0f:: with SMTP id g15mr4154210ejt.295.1640211061287;
        Wed, 22 Dec 2021 14:11:01 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id sd39sm1164322ejc.14.2021.12.22.14.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 14:11:00 -0800 (PST)
Date:   Wed, 22 Dec 2021 23:10:58 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 21/24] dma-buf: add DMA_RESV_USAGE_BOOKKEEP
Message-ID: <YcOicrYTIFJXG/3I@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-22-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211207123411.167006-22-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 07, 2021 at 01:34:08PM +0100, Christian König wrote:
> Add an usage for submissions independent of implicit sync but still
> interesting for memory management.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Focusing on the kerneldoc first to get semantics agreed.

> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 29d799991496..07ae5b00c1fa 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -55,7 +55,7 @@ struct dma_resv_list;
>   * This enum describes the different use cases for a dma_resv object and
>   * controls which fences are returned when queried.
>   *
> - * An important fact is that there is the order KERNEL<WRITE<READ and
> + * An important fact is that there is the order KERNEL<WRITE<READ<BOOKKEEP and
>   * when the dma_resv object is asked for fences for one use case the fences
>   * for the lower use case are returned as well.
>   *
> @@ -93,6 +93,22 @@ enum dma_resv_usage {
>  	 * an implicit read dependency.
>  	 */
>  	DMA_RESV_USAGE_READ,
> +
> +	/**
> +	 * @DMA_RESV_USAGE_BOOKKEEP: No implicit sync.
> +	 *
> +	 * This should be used by submissions which don't want to participate in
> +	 * implicit synchronization.

Uh we might still have a disagreement, because that isn't really what
drivers which added opt-in implicit sync have done thus far. Minimally we
need a note that some drivers also use _READ for this.

> +	 *
> +	 * The most common case are submissions with explicit synchronization,
> +	 * but also things like preemption fences as well as page table updates
> +	 * might use this.
> +	 *
> +	 * The kernel memory management *always* need to wait for those fences
> +	 * before moving or freeing the resource protected by the dma_resv
> +	 * object.

Yeah this is the comment I wanted to see for READ, and which now is in
bookkeeping (where it's correct in the end). I think we still should have
something in the READ comment (and here) explaining that there could very
well be writes hiding behind this, and that the kernel cannot assume
anything about what's going on in general (maybe some drivers enforce
read/write through command parsers).

Also all the text in dma_buf.resv needs to be updated to use the right
constants instead of words.
-Daniel


> +	 */
> +	DMA_RESV_USAGE_BOOKKEEP
>  };
>  
>  /**
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
