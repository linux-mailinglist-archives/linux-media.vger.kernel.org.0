Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 811B0462F3D
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 10:06:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239942AbhK3JJu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 04:09:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235401AbhK3JJu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 04:09:50 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57B3DC061574
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 01:06:30 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id p27-20020a05600c1d9b00b0033bf8532855so14233032wms.3
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 01:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=1dBZLbZF5dWyM/EMU1vFF6wg/o7BNOVLFgZ+CDZNwEw=;
        b=aU52l4grnl9Q6gd5C2o3kKic3WMh2p6CdW3kAm0pct7ZVvj7zU0BBh45fQmrmHOztg
         OxdsB7YWiGeA0lvH/JfF7DQhVOLZIlW2u8W7aZXa+iVfVwo8JwUx+3bfN76SZPeiCN+5
         9X8sJnE+ZtPAD1r6WM9Rh6r6UfwKe5jIiRFwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=1dBZLbZF5dWyM/EMU1vFF6wg/o7BNOVLFgZ+CDZNwEw=;
        b=4VpmPguGnepVGPtMLKwDkDrKJAVr/7ymsrKJpy5GeruUSoC8OKysHzBpg0JUdMY1uq
         JW/JKHgFyDPzc5e8CL0dQ7UATe9QcW7uW0RVvOmgvBsw624svZvPnqpt5ASoEAeI/oBP
         iryZTzhERcDPae3afgqDkx5AJAJPb/JMpqJza5YhjXmeoMhcFEZkUGlQYAiV8eXoRcjY
         BpiE49NviSRZh6eN4HplLQ+VCBrUqoF+JQS/mkYzMJH5RGq2LV25+vH+DFcGTr3E4k1m
         h9d9sLB/UNtCH5rPCU8OnOXKR5P41YxzEyi/VB6EALFjV/hm35/LZUUZvBmLO9FUh9ur
         R/EQ==
X-Gm-Message-State: AOAM530RTl9090TifL4c7AV2uBlYb6K+DPFiTT5hr/gWRz9d10B6BkEc
        4Kvl8OLj1BFAl7IU+io78mP1RA==
X-Google-Smtp-Source: ABdhPJy27LOCVKczkaSg04kB6HvggkkLk506KKcdLUlwLC6sXlmw18xgS6ZOaIR73lti2D6YyLmTBA==
X-Received: by 2002:a05:600c:4104:: with SMTP id j4mr3423937wmi.178.1638263188907;
        Tue, 30 Nov 2021 01:06:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q123sm1689665wma.30.2021.11.30.01.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 01:06:28 -0800 (PST)
Date:   Tue, 30 Nov 2021 10:06:26 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     daniel@ffwll.ch, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 04/28] drm/qxl: use iterator instead of
 dma_resv_shared_list
Message-ID: <YaXpkoY1AUfYp6nn@phenom.ffwll.local>
References: <20211129120659.1815-1-christian.koenig@amd.com>
 <20211129120659.1815-5-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211129120659.1815-5-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 29, 2021 at 01:06:35PM +0100, Christian König wrote:
> I'm not sure why it is useful to know the number of fences
> in the reservation object, but we try to avoid exposing the
> dma_resv_shared_list() function.
> 
> So use the iterator instead. If more information is desired
> we could use dma_resv_describe() as well.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/qxl/qxl_debugfs.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/qxl/qxl_debugfs.c b/drivers/gpu/drm/qxl/qxl_debugfs.c
> index 1f9a59601bb1..6a36b0fd845c 100644
> --- a/drivers/gpu/drm/qxl/qxl_debugfs.c
> +++ b/drivers/gpu/drm/qxl/qxl_debugfs.c
> @@ -57,13 +57,16 @@ qxl_debugfs_buffers_info(struct seq_file *m, void *data)
>  	struct qxl_bo *bo;
>  
>  	list_for_each_entry(bo, &qdev->gem.objects, list) {
> -		struct dma_resv_list *fobj;
> -		int rel;
> -
> -		rcu_read_lock();
> -		fobj = dma_resv_shared_list(bo->tbo.base.resv);
> -		rel = fobj ? fobj->shared_count : 0;
> -		rcu_read_unlock();
> +		struct dma_resv_iter cursor;
> +		struct dma_fence *fence;
> +		int rel = 0;
> +
> +		dma_resv_iter_begin(&cursor, bo->tbo.base.resv, true);
> +		dma_resv_for_each_fence_unlocked(&cursor, fence) {
> +			if (dma_resv_iter_is_restarted(&cursor))

I think a kerneldoc patch for struct dma_resv_iter to highlight that
iterators can be restarted and users need to take that into account if
they accumulate statistics with dma_resv_iter_is_restarted() would be
good. I guess I'll go type that.

On this patch:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> +				rel = 0;
> +			++rel;
> +		}
>  
>  		seq_printf(m, "size %ld, pc %d, num releases %d\n",
>  			   (unsigned long)bo->tbo.base.size,
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
