Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21B1E493EE9
	for <lists+linux-media@lfdr.de>; Wed, 19 Jan 2022 18:19:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354769AbiASRTC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jan 2022 12:19:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345023AbiASRTB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jan 2022 12:19:01 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5679AC061574
        for <linux-media@vger.kernel.org>; Wed, 19 Jan 2022 09:19:01 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id w26so6584297wmi.0
        for <linux-media@vger.kernel.org>; Wed, 19 Jan 2022 09:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=weDoiXWIlqsW0bwSabnqiWkOc5jo1BbeEdm7AfzIltI=;
        b=ZwijlQyT9ACfMKxTUvh3s7J6qo0qJbtEnyFJc45VVsm9b1nveMbpVe5TTxIPfYgZPr
         uf/XXWvVtIq6o5V/0mTPAvs45HG6iGmeSsfDJYAv5FQv5a+Idjeyuw44wSq0V1q5i9iG
         +fWqi9Uym2lrOa5qsnATZ2eZab7Q0m9P0KYMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=weDoiXWIlqsW0bwSabnqiWkOc5jo1BbeEdm7AfzIltI=;
        b=UhaejVA0kwFQE9DItuI5Jl1ecc9NvaEiUVRKZQILHhN6FelPsIEDVX9nYkKFTbp+mV
         3jfVDVu6C/APUQw03bDsCB047IdI3fXXaPQDcVI2pPhMSmD/KPlMPFodM/xO0MqL1wYy
         DZQsEizhRKbUePWqo2GAIJO9qsLD+to/n6qMeFvPtDsRx6bYkd1qjMrgnrxQoBh9BBs2
         WLT2SxsQ2GLddBR6q7irqg7nrBUpkGFobS43N/qx+kMTNlDGhTY3X3zv7RKqg6OpZnZo
         oniTPeQI1NbcqpQXeo9fa8f0FwXl59ydPn2bZ14f9KB12fVsBzbAXs0FMvOPSKWDaXBK
         pBbQ==
X-Gm-Message-State: AOAM530SJ2FCMIFQmOfxuNugMBhpChP94YCm0X3v922mJFNU2h8xDvcc
        zZkf1qgLHZ/+GjcgPXIW62H6Gw==
X-Google-Smtp-Source: ABdhPJyAGgep8QOseVVDvL9cILUQyoL5tC8CLK3q904SVKTC2KYBUvucJ90kjGYENpFq5sfzsLyebA==
X-Received: by 2002:a05:600c:2994:: with SMTP id r20mr1407383wmd.158.1642612739974;
        Wed, 19 Jan 2022 09:18:59 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id c13sm410043wrv.24.2022.01.19.09.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 09:18:59 -0800 (PST)
Date:   Wed, 19 Jan 2022 18:18:57 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     sumit.semwal@linaro.org, gustavo@padovan.org,
        daniel.vetter@ffwll.ch, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 3/4] dma-buf: Warn about dma_fence_chain container rules
Message-ID: <YehIAaPI53wNes+1@phenom.ffwll.local>
References: <20220119134339.3102-1-christian.koenig@amd.com>
 <20220119134339.3102-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220119134339.3102-3-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 19, 2022 at 02:43:38PM +0100, Christian König wrote:
> Chaining of dma_fence_chain objects is only allowed through the prev
> fence and not through the contained fence.
> 
> Warn about that when we create a dma_fence_chain.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-fence-chain.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
> index 1b4cb3e5cec9..fa33f6b7f77b 100644
> --- a/drivers/dma-buf/dma-fence-chain.c
> +++ b/drivers/dma-buf/dma-fence-chain.c
> @@ -254,5 +254,13 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
>  
>  	dma_fence_init(&chain->base, &dma_fence_chain_ops,
>  		       &chain->lock, context, seqno);
> +
> +	/* Chaining dma_fence_chain container together is only allowed through
> +	 * the prev fence and not through the contained fence.
> +	 *
> +	 * The correct way of handling this is to flatten out the fence
> +	 * structure into a dma_fence_array by the caller instead.
> +	 */
> +	WARN_ON(dma_fence_is_chain(fence));

At first I was worried that you'd leave a chain fence in the array fence
as an option, but we exclude that with the previous patch.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  }
>  EXPORT_SYMBOL(dma_fence_chain_init);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
