Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EF63427763
	for <lists+linux-media@lfdr.de>; Sat,  9 Oct 2021 06:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231773AbhJIEnE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Oct 2021 00:43:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbhJIEnC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Oct 2021 00:43:02 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D055C061570;
        Fri,  8 Oct 2021 21:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=dWH4qjA33whTZ4Wx/aYp4ATOSdmZkILXTl4W7Gnaxqs=; b=ODVrCEaLmds1oXMb8Y0/8CUvJB
        DP1ABypOnb7u12aFdm96y7XFc9PVP1ZLhOr69VgJSgrX6DdNI7YyZlsIDz+9kg1w8dkGeGoYPZvB6
        fBq72ccby3bMY0gjr7jYzszuoZyQfMMtQbhbmVZ6Gd/jcfl6C+HQOfQEBgSg0/DL3dAHThzNjaZd0
        l5KgXLL8jmu3WZzHWjqUIFvRhdySKOgzBvcwfb+dcYnElOYLJPvMDn2gNuUvve3TkGe3N7ggw8tHX
        t/oqyrZbtYmZuJ0JkLmn026RJaovZa7zkPGbUcO9nI15SzLyibKrVOYucTO1qFf9fWOTZNSgnPh+z
        E/sc/cEw==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mZ4AT-0058DR-3k; Sat, 09 Oct 2021 04:41:05 +0000
Subject: Re: [PATCH] dma-buf: remove restriction of IOCTL:DMA_BUF_SET_NAME
To:     guangming.cao@mediatek.com, Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Cc:     wsd_upstream@mediatek.com
References: <20211009024733.65676-1-guangming.cao@mediatek.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c23181a5-b75b-c04b-7cc4-020f2b2b44c1@infradead.org>
Date:   Fri, 8 Oct 2021 21:41:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211009024733.65676-1-guangming.cao@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/8/21 7:47 PM, guangming.cao@mediatek.com wrote:
> From: Guangming Cao <Guangming.Cao@mediatek.com>
> 
> If dma-buf don't want userspace users to touch the dmabuf buffer,
> it seems we should add this restriction into dma_buf_ops.mmap,
> not in this IOCTL:DMA_BUF_SET_NAME.
> 
> With this restriction, we can only know the kernel users of the dmabuf
> by attachments.
> However, for many userspace users, such as userpsace users of dma_heap,
> they also need to mark the usage of dma-buf, and they don't care about
> who attached to this dmabuf, and seems it's no meaning to waitting for

                                                          to be waiting for

> IOCTL:DMA_BUF_SET_NAME rather than mmap.
> 
> Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
> ---
>   drivers/dma-buf/dma-buf.c | 14 ++------------
>   1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 511fe0d217a0..afbd0a226639 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -325,10 +325,8 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>   
>   /**
>    * dma_buf_set_name - Set a name to a specific dma_buf to track the usage.
> - * The name of the dma-buf buffer can only be set when the dma-buf is not
> - * attached to any devices. It could theoritically support changing the
> - * name of the dma-buf if the same piece of memory is used for multiple
> - * purpose between different devices.
> + * It could theoritically support changing the name of the dma-buf if the same

                theoretically

(yes, it was incorrect before this change.)

> + * piece of memory is used for multiple purpose between different devices.
>    *
>    * @dmabuf: [in]     dmabuf buffer that will be renamed.
>    * @buf:    [in]     A piece of userspace memory that contains the name of
> @@ -346,19 +344,11 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
>   	if (IS_ERR(name))
>   		return PTR_ERR(name);
>   
> -	dma_resv_lock(dmabuf->resv, NULL);
> -	if (!list_empty(&dmabuf->attachments)) {
> -		ret = -EBUSY;
> -		kfree(name);
> -		goto out_unlock;
> -	}
>   	spin_lock(&dmabuf->name_lock);
>   	kfree(dmabuf->name);
>   	dmabuf->name = name;
>   	spin_unlock(&dmabuf->name_lock);
>   
> -out_unlock:
> -	dma_resv_unlock(dmabuf->resv);
>   	return ret;
>   }
>   
> 


-- 
~Randy
