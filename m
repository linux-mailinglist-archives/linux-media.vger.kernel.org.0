Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 807404EA99A
	for <lists+linux-media@lfdr.de>; Tue, 29 Mar 2022 10:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234040AbiC2IuC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Mar 2022 04:50:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233105AbiC2IuB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Mar 2022 04:50:01 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABF308CDB5
        for <linux-media@vger.kernel.org>; Tue, 29 Mar 2022 01:48:13 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id u16so23737400wru.4
        for <linux-media@vger.kernel.org>; Tue, 29 Mar 2022 01:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=wV/zkilnqdFrqQKJ4JOwa7kKyc//0tE3STDLU5WF3qc=;
        b=OuYZ6vtK2M4DG2+DY+jnQFbxcz0dEGjyJBrIsInABVbuKV6BbWRnxDKLkJhGe5zpXH
         pKheIMnEHKkyxXVBQqelEiZ84T+5Ca3CBm79FPwSqf+PZS/RGXSCcWAQEku77RIduFES
         oiqkvSp4a8hIY02oPqa0uAhYyFvXdWttnvMdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wV/zkilnqdFrqQKJ4JOwa7kKyc//0tE3STDLU5WF3qc=;
        b=5Ev/5U1In8rGssUfvzdLlIGbJklCZhk5dbZ+xAB8aPY2WBuYR3iEk61CZJtsS6kCJd
         4Ii9SgSRhpoK6euKUEo+lWoH+AYEnM7Zl4Td9+9vib0zctDfPTs0nT2mN3wS5h/VcAac
         d+SR7nteUnUiyG7Wj7QoTUDg4Li7eOdRtgSOQ0+P8tKvc5LX0FusGuGPm7L6sN2VUr9R
         OkY8T0NtbpV+uvOVM4TFA81p1kS2XkkSKUCF0INtJ9dHjEpl/357yPgnyBOgW0/mQnF6
         nb4r7uHqTHEALQso9SpTnwOUyDjJGq+7EMT7PcWEtd0z9ILi+DjNwbHdfy0kYdTfj68b
         1/5Q==
X-Gm-Message-State: AOAM5334gj32+UkYa4sJQ7rDq8aSq3GIh82BsxB0XMagCBmMnCPwGkzO
        I6AnTUFuUUtXZEVQ/wNmVTZH+A==
X-Google-Smtp-Source: ABdhPJzsef3n0+iH0vZE1Z/Q44owreRxus91uDLsKNCtdrlcsyprP/STCZVm2Q3lBDi6MKJ5/4vGyA==
X-Received: by 2002:a5d:59a2:0:b0:204:20d9:a5b9 with SMTP id p2-20020a5d59a2000000b0020420d9a5b9mr28725261wrr.560.1648543692293;
        Tue, 29 Mar 2022 01:48:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id b15-20020a05600018af00b002057c72d45fsm17762974wri.77.2022.03.29.01.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 01:48:11 -0700 (PDT)
Date:   Tue, 29 Mar 2022 10:48:10 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        ville.syrjala@linux.intel.com, daniel@ffwll.ch,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 2/2] dma-buf: handle empty dma_fence_arrays gracefully
Message-ID: <YkLHypwNnLd+qA4H@phenom.ffwll.local>
References: <20220329070001.134180-1-christian.koenig@amd.com>
 <20220329070001.134180-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220329070001.134180-2-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 29, 2022 at 09:00:01AM +0200, Christian König wrote:
> A bug inside the new sync-file merge code created empty dma_fence_array instances.
> 
> Warn about that and handle those without crashing.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/dma-buf/dma-fence-array.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> index 52b85d292383..5c8a7084577b 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -159,6 +159,8 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
>  	struct dma_fence_array *array;
>  	size_t size = sizeof(*array);
>  
> +	WARN_ON(!num_fences || !fences);

WARN_ON and then dying randomly is kinda not nice, I'd wrap this in an

if (WARN_ON)
	return NULL;

with that: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +
>  	/* Allocate the callback structures behind the array. */
>  	size += num_fences * sizeof(struct dma_fence_array_cb);
>  	array = kzalloc(size, GFP_KERNEL);
> @@ -231,6 +233,9 @@ struct dma_fence *dma_fence_array_first(struct dma_fence *head)
>  	if (!array)
>  		return head;
>  
> +	if (!array->num_fences)
> +		return NULL;
> +
>  	return array->fences[0];
>  }
>  EXPORT_SYMBOL(dma_fence_array_first);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
