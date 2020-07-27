Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3097322EA19
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 12:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728100AbgG0Kdt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 06:33:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726701AbgG0Kds (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 06:33:48 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5CA5C061794
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2020 03:33:47 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id a15so14326031wrh.10
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2020 03:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=Bp6uPhq8Td50m/QVbazzycqVQS9Vblt2hLy6wVK8dW8=;
        b=SJHrg99+vGfbab57L7UdmSd/pGK823VctI12nhCPFOr+5GmU//4zl5vEsfn8zfX/vV
         qt3hobr+jgDCAg5MdnBMV0nAEY56XWwKDedpRpFwB14zlcAtbmPiotp1Y4aU4171Ez03
         Qu/PYee0BM6PBk+ezr25LOx1up1ct466XXA1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=Bp6uPhq8Td50m/QVbazzycqVQS9Vblt2hLy6wVK8dW8=;
        b=TWbsUJO6KC8txy+NCW2KjBqaYQTi8Hd8+30mMUIfdJPdu6B47/3G67Lv0vIkXaeaGM
         4nQDp7vH9aD9uP7sFQ1kjWTkXSq/5vehH5qc9zUkuV9BRVVteExVWpcXwG2dRDciHj3U
         tYa273SfGh19FduoXNGo+hSWcTTJ1QPIh94gA1ws3FkC3+4nHbSnUGRyg1QidroWbWA2
         mHS9qS59qlkquSfVBudIZIsQJ2iwov5UilgOTAweqHdwl+lNUf3xgVvFAGz1tfstJFFL
         qfxlK4WeeE26p70+iMsa6lwlKzIVqeBtRqGWkqUGYZ/Aad2haTbKMf9wTIlj8Zu68qcA
         AnUQ==
X-Gm-Message-State: AOAM533NBWmEKlgDuLCcaqx/r9qk95pDGeCV6Z6aCae8lrccY8pvQqxG
        QByXBvqdJkfDd/PxLDUWaizLTw==
X-Google-Smtp-Source: ABdhPJw4ZkhN2VuqVSgEP8hgcS77O8oJSeL3Qre7Wb03kvDLQWqrlaQw6ghc6AiPiTbZD7LpESuyVQ==
X-Received: by 2002:a5d:4ad1:: with SMTP id y17mr21040589wrs.132.1595846026409;
        Mon, 27 Jul 2020 03:33:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id h23sm16668156wmb.3.2020.07.27.03.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 03:33:45 -0700 (PDT)
Date:   Mon, 27 Jul 2020 12:33:43 +0200
From:   daniel@ffwll.ch
Cc:     lkml <linux-kernel@vger.kernel.org>,
        dri-devel@lists.freedesktop.org, Liam Mark <lmark@codeaurora.org>,
        "Andrew F . Davis" <afd@ti.com>, Laura Abbott <labbott@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [RFC][PATCH] dma-heap: Add proper kref handling on dma-buf heaps
Message-ID: <20200727103343.GT6419@phenom.ffwll.local>
Mail-Followup-To: John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        dri-devel@lists.freedesktop.org, Liam Mark <lmark@codeaurora.org>,
        "Andrew F . Davis" <afd@ti.com>, Laura Abbott <labbott@kernel.org>,
        linux-media@vger.kernel.org
References: <20200725032633.125006-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200725032633.125006-1-john.stultz@linaro.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Jul 25, 2020 at 03:26:33AM +0000, John Stultz wrote:
> Add proper refcounting on the dma_heap structure.
> While existing heaps are built-in, we may eventually
> have heaps loaded from modules, and we'll need to be
> able to properly handle the references to the heaps

Uh I kinda want to wait until we cross that bridge ... this entire vendor
heaps thing still sounds very much like vendor trees hacking around
instead of having upstream drivers using upstream infrastructure.
-Daniel

> 
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Andrew F. Davis <afd@ti.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> Cc: Liam Mark <lmark@codeaurora.org>
> Cc: Laura Abbott <labbott@kernel.org>
> Cc: Brian Starkey <Brian.Starkey@arm.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>  drivers/dma-buf/dma-heap.c | 31 +++++++++++++++++++++++++++----
>  include/linux/dma-heap.h   |  6 ++++++
>  2 files changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index afd22c9dbdcf..90c3720acc1c 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -40,6 +40,8 @@ struct dma_heap {
>  	dev_t heap_devt;
>  	struct list_head list;
>  	struct cdev heap_cdev;
> +	int minor;
> +	struct kref refcount;
>  };
>  
>  static LIST_HEAD(heap_list);
> @@ -190,11 +192,31 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
>  	return heap->priv;
>  }
>  
> +static void dma_heap_release(struct kref *ref)
> +{
> +	struct dma_heap *heap = container_of(ref, struct dma_heap, refcount);
> +
> +	/* Remove heap from the list */
> +	mutex_lock(&heap_list_lock);
> +	list_del(&heap->list);
> +	mutex_unlock(&heap_list_lock);
> +
> +	device_destroy(dma_heap_class, heap->heap_devt);
> +	cdev_del(&heap->heap_cdev);
> +	xa_erase(&dma_heap_minors, heap->minor);
> +
> +	kfree(heap);
> +}
> +
> +void dma_heap_put(struct dma_heap *h)
> +{
> +	kref_put(&h->refcount, dma_heap_release);
> +}
> +
>  struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>  {
>  	struct dma_heap *heap, *h, *err_ret;
>  	struct device *dev_ret;
> -	unsigned int minor;
>  	int ret;
>  
>  	if (!exp_info->name || !strcmp(exp_info->name, "")) {
> @@ -223,12 +245,13 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>  	if (!heap)
>  		return ERR_PTR(-ENOMEM);
>  
> +	kref_init(&heap->refcount);
>  	heap->name = exp_info->name;
>  	heap->ops = exp_info->ops;
>  	heap->priv = exp_info->priv;
>  
>  	/* Find unused minor number */
> -	ret = xa_alloc(&dma_heap_minors, &minor, heap,
> +	ret = xa_alloc(&dma_heap_minors, &heap->minor, heap,
>  		       XA_LIMIT(0, NUM_HEAP_MINORS - 1), GFP_KERNEL);
>  	if (ret < 0) {
>  		pr_err("dma_heap: Unable to get minor number for heap\n");
> @@ -237,7 +260,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>  	}
>  
>  	/* Create device */
> -	heap->heap_devt = MKDEV(MAJOR(dma_heap_devt), minor);
> +	heap->heap_devt = MKDEV(MAJOR(dma_heap_devt), heap->minor);
>  
>  	cdev_init(&heap->heap_cdev, &dma_heap_fops);
>  	ret = cdev_add(&heap->heap_cdev, heap->heap_devt, 1);
> @@ -267,7 +290,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>  err2:
>  	cdev_del(&heap->heap_cdev);
>  err1:
> -	xa_erase(&dma_heap_minors, minor);
> +	xa_erase(&dma_heap_minors, heap->minor);
>  err0:
>  	kfree(heap);
>  	return err_ret;
> diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
> index 454e354d1ffb..c1572f29cfac 100644
> --- a/include/linux/dma-heap.h
> +++ b/include/linux/dma-heap.h
> @@ -56,4 +56,10 @@ void *dma_heap_get_drvdata(struct dma_heap *heap);
>   */
>  struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
>  
> +/**
> + * dma_heap_put - drops a reference to a dmabuf heaps, potentially freeing it
> + * @heap:		heap pointer
> + */
> +void dma_heap_put(struct dma_heap *heap);
> +
>  #endif /* _DMA_HEAPS_H */
> -- 
> 2.17.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
