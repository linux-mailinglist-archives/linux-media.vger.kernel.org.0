Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 650A1462F31
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 10:03:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235527AbhK3JHB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 04:07:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233648AbhK3JHB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 04:07:01 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80BB7C061574
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 01:03:42 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id n33-20020a05600c502100b0032fb900951eso18920700wmr.4
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 01:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=muzD7wBGzdqNzoTkinsMAk1ZnhCVTb2hy14oh4sGZXs=;
        b=KsOZO+2oOR1bZyCfTbjNitszllo/P6mAAuU1fyIFGEN2IQIt6gBYkeLkFMToefKSSd
         KXAK47tNWFmKXqIr2zqnN4TzMXjb0hu0Z/C/9+rsuKL5EFdbgQ8N2Ulaei987P0d1zk6
         3YeAo3mF6uzga03vx3r+yO0+W175UzZ54INx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=muzD7wBGzdqNzoTkinsMAk1ZnhCVTb2hy14oh4sGZXs=;
        b=OqycPjO+YpZW/Eoew5Mw/JIXL72gOcYq9GnYQx8eXIlMWJ0l+8Ltuq2nrI9pVrgn9K
         u7FOBgeseSs8acjPeoDyC3I1VYJr0mth52fpws2Zk2LwwFIXcMcrTl43+brka1+O/8lg
         eEFz/wetuWmaRH2Z02tJF8k4qmFua/jAwPit1Q1W3yMtVoOYxoy8a1GHBerdkH5FfuEY
         ytLT7icuVGnVWKtV2bgCrxJj0sWU1XNvuvM9O+Z04F2RBAabSXdzyL9jRIGlH2CyegLd
         ls96lt75udE+lXz9lp20yzeo3enNs+fGnaubouuDv+5hiUuY9InjFUwHw6FtqiEzpqCt
         gPcw==
X-Gm-Message-State: AOAM5318XLh4PqS3F0obHATwOGJUAVHyb8hLcFIGJhwyH6nPDmJOzZ3o
        Dn8gnYDv9NbK8jE47GATwymrLw==
X-Google-Smtp-Source: ABdhPJylCtn/FlaJSqiqPVHrC1ZZ68HhySRCjXJmhWHPzzI6fuCM07R78HjQ+BCid992BuANhdaSWg==
X-Received: by 2002:a1c:4d8:: with SMTP id 207mr3442077wme.23.1638263021169;
        Tue, 30 Nov 2021 01:03:41 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id p13sm1802064wmi.0.2021.11.30.01.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 01:03:40 -0800 (PST)
Date:   Tue, 30 Nov 2021 10:03:38 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     daniel@ffwll.ch, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 03/28] dma-buf: make fence mandatory for
 dma_resv_add_excl_fence v2
Message-ID: <YaXo6uvtJJPIU6YP@phenom.ffwll.local>
References: <20211129120659.1815-1-christian.koenig@amd.com>
 <20211129120659.1815-4-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211129120659.1815-4-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 29, 2021 at 01:06:34PM +0100, Christian König wrote:
> Calling dma_resv_add_excl_fence() with the fence as NULL and expecting
> that that this frees up the fences is simply abuse of the internals of
> the dma_resv object.
> 
> v2: drop the fence pruning completely.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Cursory look says you got them all, and it's definitely the right thing to
do.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/dma-buf/dma-resv.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index ff3c0558b3b8..4deea75c0b9c 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -305,8 +305,7 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
>  	if (old)
>  		i = old->shared_count;
>  
> -	if (fence)
> -		dma_fence_get(fence);
> +	dma_fence_get(fence);
>  
>  	write_seqcount_begin(&obj->seq);
>  	/* write_seqcount_begin provides the necessary memory barrier */
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
