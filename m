Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24A1E3FC78B
	for <lists+linux-media@lfdr.de>; Tue, 31 Aug 2021 14:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231949AbhHaMsD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Aug 2021 08:48:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230154AbhHaMsC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Aug 2021 08:48:02 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BA77C06175F
        for <linux-media@vger.kernel.org>; Tue, 31 Aug 2021 05:47:07 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id q14so27507552wrp.3
        for <linux-media@vger.kernel.org>; Tue, 31 Aug 2021 05:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=lqW6r2QxBjf3naPSK7ElejDN0miJGNk4JeUrWNu5dFo=;
        b=P7GUI4rzpcJORZdrR45U9tZBVNt+YutkUgaZAyUSoo0hNOv5YFYj2LVa3BDKBVLlEZ
         8P09RZ77gdJ/9bmvIGELMImn15ss9sRZV4C/seGIidibDM6yqDjkjA6TuRj46kpJciNn
         Jh7pnUHhLdusLFGeigWIF2NedtczE/Aou9GJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=lqW6r2QxBjf3naPSK7ElejDN0miJGNk4JeUrWNu5dFo=;
        b=sWvcZN/MKrg23zipyKEjmuILrMuQRvXy6XF43Nv3ci5dLyxH3ExLsn/YR2hBYHGENe
         oZdhAqWFmCbXETUd8W88Cs/zpPad97Gn9k/RqXXtHoQAO0U/dWtmiDgpcGRxFb9ENVKQ
         Rd+xKd7Agx+yj5+3yR1rF6icyD/Pgqi2XYp97DsBm3hwl/xjGfUk22qDiqguFTZOjgey
         zVZz9AAok3GwJ7mORiwtp6zswWotwb+3KDI80twPsZqOvbN9wSMyebAUxKzx7hI6yA+7
         Dqxqwlh9DBT3G8czfcg5LaL/1lEGA16TZkBevxu7rLMcFJz7yQK5fBV4+jurm49aDSEu
         HVQg==
X-Gm-Message-State: AOAM531nIrcPvWDpTGruEYwSLdRfa6O7QINKxTUdf9oxwXOt/zcW+jNL
        LZHm+L+4/7Shmo4Daf8rM+NNrQ==
X-Google-Smtp-Source: ABdhPJxwoD0EiQFf+7rgqTumGOUaiOiYizQOADtUbwoy+P/jmw6DFg/J4Q4QffVcbtqcMVqvU1avQw==
X-Received: by 2002:adf:c40d:: with SMTP id v13mr29016331wrf.388.1630414026094;
        Tue, 31 Aug 2021 05:47:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q14sm11701297wrc.31.2021.08.31.05.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 05:47:05 -0700 (PDT)
Date:   Tue, 31 Aug 2021 14:47:03 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     guangming.cao@mediatek.com
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "open list:DMA-BUF HEAPS FRAMEWORK" <linux-media@vger.kernel.org>,
        "open list:DMA-BUF HEAPS FRAMEWORK" <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA-BUF HEAPS FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, wsd_upstream@mediatek.com,
        isaacm@codeaurora.org, sspatil@google.com, hridya@google.com
Subject: Re: [PATCH] dma-buf: Add support for mapping buffers with DMA
 attributes
Message-ID: <YS4kx3thdJOu3uHX@phenom.ffwll.local>
Mail-Followup-To: guangming.cao@mediatek.com,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "open list:DMA-BUF HEAPS FRAMEWORK" <linux-media@vger.kernel.org>,
        "open list:DMA-BUF HEAPS FRAMEWORK" <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA-BUF HEAPS FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
        wsd_upstream@mediatek.com, isaacm@codeaurora.org,
        sspatil@google.com, hridya@google.com
References: <20210830023911.4410-1-guangming.cao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210830023911.4410-1-guangming.cao@mediatek.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 30, 2021 at 10:39:11AM +0800, guangming.cao@mediatek.com wrote:
> From: Guangming Cao <Guangming.Cao@mediatek.com>
> 
> When mapping the memory represented by a dma-buf into a device's
> address space, it might be desireable to map the memory with
> certain DMA attributes. Thus, introduce the dma_mapping_attrs
> field in the dma_buf_attachment structure so that when
> the memory is mapped with dma_buf_map_attachment, it is mapped
> with the desired DMA attributes.
> 
> Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
> Signed-off-by: Sandeep Patil <sspatil@google.com>
> Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>

Can you pls include the code that's going to use this here too?

At a glance all the attributes you might want to set are supposed to be
under the control of the exporter, not the importer.
-Daniel

> ---
>  drivers/dma-buf/heaps/cma_heap.c    | 6 ++++--
>  drivers/dma-buf/heaps/system_heap.c | 6 ++++--
>  include/linux/dma-buf.h             | 3 +++
>  3 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> index 0c05b79870f9..2c9feb3bfc3e 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -99,9 +99,10 @@ static struct sg_table *cma_heap_map_dma_buf(struct dma_buf_attachment *attachme
>  {
>  	struct dma_heap_attachment *a = attachment->priv;
>  	struct sg_table *table = &a->table;
> +	int attrs = attachment->dma_map_attrs;
>  	int ret;
>  
> -	ret = dma_map_sgtable(attachment->dev, table, direction, 0);
> +	ret = dma_map_sgtable(attachment->dev, table, direction, attrs);
>  	if (ret)
>  		return ERR_PTR(-ENOMEM);
>  	a->mapped = true;
> @@ -113,9 +114,10 @@ static void cma_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
>  				   enum dma_data_direction direction)
>  {
>  	struct dma_heap_attachment *a = attachment->priv;
> +	int attrs = attachment->dma_map_attrs;
>  
>  	a->mapped = false;
> -	dma_unmap_sgtable(attachment->dev, table, direction, 0);
> +	dma_unmap_sgtable(attachment->dev, table, direction, attrs);
>  }
>  
>  static int cma_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index 23a7e74ef966..fc7b1e02988e 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -130,9 +130,10 @@ static struct sg_table *system_heap_map_dma_buf(struct dma_buf_attachment *attac
>  {
>  	struct dma_heap_attachment *a = attachment->priv;
>  	struct sg_table *table = a->table;
> +	int attrs = attachment->dma_map_attrs;
>  	int ret;
>  
> -	ret = dma_map_sgtable(attachment->dev, table, direction, 0);
> +	ret = dma_map_sgtable(attachment->dev, table, direction, attrs);
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> @@ -145,9 +146,10 @@ static void system_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
>  				      enum dma_data_direction direction)
>  {
>  	struct dma_heap_attachment *a = attachment->priv;
> +	int attrs = attachment->dma_map_attrs;
>  
>  	a->mapped = false;
> -	dma_unmap_sgtable(attachment->dev, table, direction, 0);
> +	dma_unmap_sgtable(attachment->dev, table, direction, attrs);
>  }
>  
>  static int system_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index efdc56b9d95f..4d650731766e 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -379,6 +379,8 @@ struct dma_buf_attach_ops {
>   * @importer_ops: importer operations for this attachment, if provided
>   * dma_buf_map/unmap_attachment() must be called with the dma_resv lock held.
>   * @importer_priv: importer specific attachment data.
> + * @dma_map_attrs: DMA attributes to be used when the exporter maps the buffer
> + * through dma_buf_map_attachment.
>   *
>   * This structure holds the attachment information between the dma_buf buffer
>   * and its user device(s). The list contains one attachment struct per device
> @@ -399,6 +401,7 @@ struct dma_buf_attachment {
>  	const struct dma_buf_attach_ops *importer_ops;
>  	void *importer_priv;
>  	void *priv;
> +	unsigned long dma_map_attrs;
>  };
>  
>  /**
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
