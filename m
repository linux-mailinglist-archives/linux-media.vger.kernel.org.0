Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39AA83FEF97
	for <lists+linux-media@lfdr.de>; Thu,  2 Sep 2021 16:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345402AbhIBOn7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 10:43:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345374AbhIBOn6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Sep 2021 10:43:58 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FC9CC061575
        for <linux-media@vger.kernel.org>; Thu,  2 Sep 2021 07:43:00 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id l7-20020a1c2507000000b002e6be5d86b3so1539623wml.3
        for <linux-media@vger.kernel.org>; Thu, 02 Sep 2021 07:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=3GYw4VqZJwFbN7M1V+7uxZEpfGH+re55UYwuc0UfZW4=;
        b=UlizNpztkm4p+pWlclD5c2BKS3cZxIzvJpqfIyd8KvZynLcyZoIlyw2l/D7C2jDbcs
         9o6EoEERzph5Y1xjmSqUhBQX2t7vHnIzDtzHnlx0xqX3wNBL04zBSPAFXAyPQVfdDDB/
         W+S31AQdBz5SVyjOA8y2aX9BJLKr5Qp9s1oB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=3GYw4VqZJwFbN7M1V+7uxZEpfGH+re55UYwuc0UfZW4=;
        b=HCQqXOTVA/PqKcxNBG66x/stZnvT9GUBl8Vzb7rTQjQ29Yt04U9JXRmg0o5qKbEfZE
         T1C9DXe4obxoYiJyD+AK8IbGpZvVI06KLrH+Lp6YMhhjOG99g09qwkaMap2EYYdaN8Qs
         sNUyMkwQzguP4kuVMyqwDJqMPILONBZnSTUrqopRZybM2DsWQj+VbiwZ8Iqfyxb4utFw
         BsZ96yXBArcOKaAbVC6tG05OZzHqsuPN+Nzh/cNOj7xQF5RiDDzH9KXYjLhyKFRGinwF
         U1am6J8D0M/EzqNMMIMSFz5u/kasER2nSfwXO+Jo1FTDnjBQ7au4xCB2oJx5duMME9rc
         H2dw==
X-Gm-Message-State: AOAM531/k+ze5by/k6dRbNSq+KmkI6HdxkuEHk9ZFFb2ZaFaL33BS97s
        m0lS0TZRYguhs5uixt2po55yUA==
X-Google-Smtp-Source: ABdhPJyZcl/ZQXO0rzpkYxiXrq7qIAF+5K0riWJ2qNh/8exAgaKJsVxQFYTRVgybEU4ihhul4mAKyQ==
X-Received: by 2002:a7b:c751:: with SMTP id w17mr3599808wmk.162.1630593778688;
        Thu, 02 Sep 2021 07:42:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id a6sm1922618wmb.7.2021.09.02.07.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 07:42:58 -0700 (PDT)
Date:   Thu, 2 Sep 2021 16:42:56 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 2/2] dma-buf: clarify dma_fence_add_callback documentation
Message-ID: <YTDi8BNRXcEkf8a4@phenom.ffwll.local>
References: <20210901120240.7339-1-christian.koenig@amd.com>
 <20210901120240.7339-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210901120240.7339-3-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 01, 2021 at 02:02:40PM +0200, Christian König wrote:
> That the caller doesn't need to keep a reference is rather
> risky and not defensive at all.
> 
> Especially dma_buf_poll got that horrible wrong, so better
> remove that sentence and also clarify that the callback
> might be called in atomic or interrupt context.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Still on the fence between documenting the precise rules and documenting
the safe rules, but this is tricky enough that you got me convinced. Plus
shorter, simpler, clearer kerneldoc has much better chances of being read,
understood and followed.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/dma-buf/dma-fence.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index ce0f5eff575d..1e82ecd443fa 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -616,20 +616,17 @@ EXPORT_SYMBOL(dma_fence_enable_sw_signaling);
>   * @cb: the callback to register
>   * @func: the function to call
>   *
> + * Add a software callback to the fence. The caller should keep a reference to
> + * the fence.
> + *
>   * @cb will be initialized by dma_fence_add_callback(), no initialization
>   * by the caller is required. Any number of callbacks can be registered
>   * to a fence, but a callback can only be registered to one fence at a time.
>   *
> - * Note that the callback can be called from an atomic context.  If
> - * fence is already signaled, this function will return -ENOENT (and
> + * If fence is already signaled, this function will return -ENOENT (and
>   * *not* call the callback).
>   *
> - * Add a software callback to the fence. Same restrictions apply to
> - * refcount as it does to dma_fence_wait(), however the caller doesn't need to
> - * keep a refcount to fence afterward dma_fence_add_callback() has returned:
> - * when software access is enabled, the creator of the fence is required to keep
> - * the fence alive until after it signals with dma_fence_signal(). The callback
> - * itself can be called from irq context.
> + * Note that the callback can be called from an atomic context or irq context.
>   *
>   * Returns 0 in case of success, -ENOENT if the fence is already signaled
>   * and -EINVAL in case of error.
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
