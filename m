Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1B4D39B8B2
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 14:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbhFDMHT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 08:07:19 -0400
Received: from mail-pl1-f179.google.com ([209.85.214.179]:34480 "EHLO
        mail-pl1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229740AbhFDMHT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 08:07:19 -0400
Received: by mail-pl1-f179.google.com with SMTP id u9so4456069plr.1
        for <linux-media@vger.kernel.org>; Fri, 04 Jun 2021 05:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QoSl/BIvVPZGOeDCr86CVcF0x26xO1jLabInCM7wFNY=;
        b=KZTdfWqRcq02+8YDMhNT+EBDtYiqt16K26DYvoLBoxkw9kCC5CaTuMkZlPlBxmTtfb
         CjPcp6JI7zHcoAa0yAVfCZG+9gZkhpr3Vnqbrt3DR0EHz8ixR6cOFCTYL47b8gu37EiU
         24gUF3sEIxF24mKW1vxb2CzMzQ+vlwraPqwO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QoSl/BIvVPZGOeDCr86CVcF0x26xO1jLabInCM7wFNY=;
        b=pDg54RFJs9QM21EgBvpchQMQEj990uOuwyog/2krmZTW31brasT0gi+Zf3vZQVMFMm
         EAhB0aefuZcyh+zisfLbB2H9VPj8mFmhe/yXlhn6dOV0bh5G/KawLOBDKdBsVzNNcCTH
         qbnCFUBxQuTJPxGP23HUMkmIQm6j+7clnpvgP8qCaTNSHbbOuCNf/GMz+e7HDjszAOS7
         /H97xUeEg+QXlmG0UFGUqrddyDvP120pDwLxfwtSa9gLJ2CkxxY/C+wZ0/z/vQuJagR3
         yO2wgdQTxsAZY5tvpLSaXvj5UATrspaoWnbZQq0NUWHjrEDyqcGpv9xUQX63SGm0klvn
         VabA==
X-Gm-Message-State: AOAM5324wgfZX90J3EwjYgQf3B52wV2vmro9YR2UJ8QL8wrpyBUwfaI5
        EsKel0ZmIVAE0lN0OpGCFlhoOQ==
X-Google-Smtp-Source: ABdhPJyBKO7O1F8BltlLBKOlcpGIAVp/cs5n8v5/9T+KWJGwahqAUNPav1NdIa0924lF+32mpDVtWQ==
X-Received: by 2002:a17:90b:2250:: with SMTP id hk16mr16079413pjb.95.1622808272875;
        Fri, 04 Jun 2021 05:04:32 -0700 (PDT)
Received: from chromium.org ([2401:fa00:8f:203:dbd1:4208:a05f:3593])
        by smtp.gmail.com with ESMTPSA id u24sm1681564pfn.31.2021.06.04.05.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 05:04:32 -0700 (PDT)
Date:   Fri, 4 Jun 2021 21:04:29 +0900
From:   Tomasz Figa <tfiga@chromium.org>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiri Slaby <jslaby@suse.cz>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        stable@vger.kernel.org
Subject: Re: [PATCH v2] media: videobuf2: Fix integer overrun in vb2_mmap
Message-ID: <YLoWzSoSUQ6HYsyO@chromium.org>
References: <20210310075127.1045556-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210310075127.1045556-1-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 10, 2021 at 08:51:27AM +0100, Ricardo Ribalda wrote:
> The plane_length is an unsigned integer. So, if we have a size of
> 0xffffffff bytes we incorrectly allocate 0 bytes instead of 1 << 32.
> 
> Suggested-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Cc: stable@vger.kernel.org
> Fixes: 7f8414594e47 ("[media] media: videobuf2: fix the length check for mmap")
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/common/videobuf2/videobuf2-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 543da515c761..89c8bacb94a7 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -2256,7 +2256,7 @@ int vb2_mmap(struct vb2_queue *q, struct vm_area_struct *vma)
>  	 * The buffer length was page_aligned at __vb2_buf_mem_alloc(),
>  	 * so, we need to do the same here.
>  	 */
> -	length = PAGE_ALIGN(vb->planes[plane].length);
> +	length = PAGE_ALIGN((unsigned long)vb->planes[plane].length);
>  	if (length < (vma->vm_end - vma->vm_start)) {
>  		dprintk(q, 1,
>  			"MMAP invalid, as it would overflow buffer length\n");
> -- 
> 2.30.1.766.gb4fecdf3b7-goog
> 

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
