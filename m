Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A1644AC342
	for <lists+linux-media@lfdr.de>; Mon,  7 Feb 2022 16:29:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239883AbiBGP1p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Feb 2022 10:27:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442931AbiBGPKN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Feb 2022 10:10:13 -0500
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61EA8C03FEE9
        for <linux-media@vger.kernel.org>; Mon,  7 Feb 2022 07:08:33 -0800 (PST)
Received: by mail-oo1-xc30.google.com with SMTP id c7-20020a4ad207000000b002e7ab4185d2so13948946oos.6
        for <linux-media@vger.kernel.org>; Mon, 07 Feb 2022 07:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tCArxGDpfxI9/hlaMTaUr21Axh/VwQvsaOyRNbh5pQc=;
        b=fsUPbywbfs99Ofi1ESo+mLySeSFCa237muJdCVlUMqkV7VPcIKKiBqNdV1AW0leqF6
         qAuliJUfBoYnSoR/B0Ld7sNWKxyShRZ7pMTW6aV9/U++XZkqwp9KADC89SjVD8kssF4R
         706nsdINZCPzdSsQvBVngI4sAICzGrycyXHeXsSn7sWd3F0Wz1+S8zGRlOnaymKg/7eN
         k9M79SF2Uxt+xiMBh6vXEvSnqD13icdsh1ybIvwGuSGa0ayuYFX2GP3aNyCl8/llCyAg
         c1j1m3ARCJ4Ncqchnu4s5Zz2Eb+g/uJ9v/XZRXPrq8L9aUjI3aknfhiiF8BYfI25cErS
         k/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tCArxGDpfxI9/hlaMTaUr21Axh/VwQvsaOyRNbh5pQc=;
        b=1Czr0pCW9WNzgGxa5RaPzbejLkDASH44/WXsYPby7V/ZH1TuuS3pqMugtUevnNxiWx
         DbOlYChuD5mGsQEYbyb2uw6GWY2MdDj5y3cpC+/XUxrf9ZrFjhjSndGemIJ8MuZ9kQkb
         awJ17QYg373hkWMXWDUfX7S/dqJzp95ypPxSUFjEs0lAWzDnT35lXCtcnYcbZsaUywxS
         dS73P4tFUOYUFqSrZ1Mebc9eZPm/B6wFdggO9f/LUMbq4bs2a4I+AI3gMcBlZ71gQ0Xj
         9w+7YUb7s0W2lukp5vhppv89r9PDLYLklk34ji9G7SiB4zeuX3LULGqcE7FGSUBhxbBB
         SwSA==
X-Gm-Message-State: AOAM531jFtor05wpmSOxW1zGks0EqkySGBiTOZP/uwjoocXEHfu+dRj3
        lS+HrciCrP8ni8RPCgDi2lAMdw==
X-Google-Smtp-Source: ABdhPJxwX0PwUscrFKyYSGLBI4oRN4IP8494tBmckUO25huv/2ejFmzO/YQDiA99re1e0k/J6WQ6/Q==
X-Received: by 2002:a05:6870:a581:: with SMTP id c1mr2667662oam.233.1644246512333;
        Mon, 07 Feb 2022 07:08:32 -0800 (PST)
Received: from eze-laptop ([190.194.87.200])
        by smtp.gmail.com with ESMTPSA id t31sm4393968oaa.9.2022.02.07.07.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 07:08:31 -0800 (PST)
Date:   Mon, 7 Feb 2022 12:08:26 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     kernel@collabora.com, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
        ribalda@chromium.org, tfiga@chromium.org, senozhatsky@google.com,
        hch@lst.de, dafna3@gmail.com
Subject: Re: [PATCH v2 3/4] media: stk1160: move transfer_buffer and urb to
 same struct 'stk1160_urb'
Message-ID: <YgE16tXV+TPZSuyI@eze-laptop>
References: <20220125080213.30090-1-dafna.hirschfeld@collabora.com>
 <20220125080213.30090-4-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220125080213.30090-4-dafna.hirschfeld@collabora.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Tue, Jan 25, 2022 at 10:02:12AM +0200, Dafna Hirschfeld wrote:
> Instead of having two separated arrays, one for the urbs and
> one for their buffers, have one array of a struct containing both.
> In addition, the array is just 16 pointers, no need to dynamically
> allocate it.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks,
Ezequiel

> ---
>  drivers/media/usb/stk1160/stk1160-v4l.c   |  2 +-
>  drivers/media/usb/stk1160/stk1160-video.c | 52 ++++++++---------------
>  drivers/media/usb/stk1160/stk1160.h       | 11 ++---
>  3 files changed, 25 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/media/usb/stk1160/stk1160-v4l.c b/drivers/media/usb/stk1160/stk1160-v4l.c
> index 1aa953469402..ebf245d44005 100644
> --- a/drivers/media/usb/stk1160/stk1160-v4l.c
> +++ b/drivers/media/usb/stk1160/stk1160-v4l.c
> @@ -232,7 +232,7 @@ static int stk1160_start_streaming(struct stk1160 *dev)
>  
>  	/* submit urbs and enables IRQ */
>  	for (i = 0; i < dev->isoc_ctl.num_bufs; i++) {
> -		rc = usb_submit_urb(dev->isoc_ctl.urb[i], GFP_KERNEL);
> +		rc = usb_submit_urb(dev->isoc_ctl.urb_ctl[i].urb, GFP_KERNEL);
>  		if (rc) {
>  			stk1160_err("cannot submit urb[%d] (%d)\n", i, rc);
>  			goto out_uninit;
> diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
> index 92c8b1fba2b0..f3c0497a8539 100644
> --- a/drivers/media/usb/stk1160/stk1160-video.c
> +++ b/drivers/media/usb/stk1160/stk1160-video.c
> @@ -347,7 +347,7 @@ void stk1160_cancel_isoc(struct stk1160 *dev)
>  		 * We don't care for NULL pointer since
>  		 * usb_kill_urb allows it.
>  		 */
> -		usb_kill_urb(dev->isoc_ctl.urb[i]);
> +		usb_kill_urb(dev->isoc_ctl.urb_ctl[i].urb);
>  	}
>  
>  	stk1160_dbg("all urbs killed\n");
> @@ -366,30 +366,25 @@ void stk1160_free_isoc(struct stk1160 *dev)
>  
>  	for (i = 0; i < num_bufs; i++) {
>  
> -		urb = dev->isoc_ctl.urb[i];
> +		urb = dev->isoc_ctl.urb_ctl[i].urb;
>  		if (urb) {
>  
> -			if (dev->isoc_ctl.transfer_buffer[i]) {
> +			if (dev->isoc_ctl.urb_ctl[i].transfer_buffer) {
>  #ifndef CONFIG_DMA_NONCOHERENT
>  				usb_free_coherent(dev->udev,
>  					urb->transfer_buffer_length,
> -					dev->isoc_ctl.transfer_buffer[i],
> +					dev->isoc_ctl.urb_ctl[i].transfer_buffer,
>  					urb->transfer_dma);
>  #else
> -				kfree(dev->isoc_ctl.transfer_buffer[i]);
> +				kfree(dev->isoc_ctl.urb_ctl[i].transfer_buffer);
>  #endif
>  			}
>  			usb_free_urb(urb);
> -			dev->isoc_ctl.urb[i] = NULL;
> +			dev->isoc_ctl.urb_ctl[i].urb = NULL;
>  		}
> -		dev->isoc_ctl.transfer_buffer[i] = NULL;
> +		dev->isoc_ctl.urb_ctl[i].transfer_buffer = NULL;
>  	}
>  
> -	kfree(dev->isoc_ctl.urb);
> -	kfree(dev->isoc_ctl.transfer_buffer);
> -
> -	dev->isoc_ctl.urb = NULL;
> -	dev->isoc_ctl.transfer_buffer = NULL;
>  	dev->isoc_ctl.num_bufs = 0;
>  
>  	stk1160_dbg("all urb buffers freed\n");
> @@ -429,19 +424,6 @@ int stk1160_alloc_isoc(struct stk1160 *dev)
>  
>  	dev->isoc_ctl.buf = NULL;
>  	dev->isoc_ctl.max_pkt_size = dev->max_pkt_size;
> -	dev->isoc_ctl.urb = kcalloc(num_bufs, sizeof(void *), GFP_KERNEL);
> -	if (!dev->isoc_ctl.urb) {
> -		stk1160_err("out of memory for urb array\n");
> -		return -ENOMEM;
> -	}
> -
> -	dev->isoc_ctl.transfer_buffer = kcalloc(num_bufs, sizeof(void *),
> -						GFP_KERNEL);
> -	if (!dev->isoc_ctl.transfer_buffer) {
> -		stk1160_err("out of memory for usb transfers\n");
> -		kfree(dev->isoc_ctl.urb);
> -		return -ENOMEM;
> -	}
>  
>  	/* allocate urbs and transfer buffers */
>  	for (i = 0; i < num_bufs; i++) {
> @@ -449,15 +431,17 @@ int stk1160_alloc_isoc(struct stk1160 *dev)
>  		urb = usb_alloc_urb(max_packets, GFP_KERNEL);
>  		if (!urb)
>  			goto free_i_bufs;
> -		dev->isoc_ctl.urb[i] = urb;
> +		dev->isoc_ctl.urb_ctl[i].urb = urb;
>  
>  #ifndef CONFIG_DMA_NONCOHERENT
> -		dev->isoc_ctl.transfer_buffer[i] = usb_alloc_coherent(dev->udev,
> -			sb_size, GFP_KERNEL, &urb->transfer_dma);
> +		dev->isoc_ctl.urb_ctl[i].transfer_buffer =
> +			usb_alloc_coherent(dev->udev, sb_size, GFP_KERNEL,
> +					   &urb->transfer_dma);
>  #else
> -		dev->isoc_ctl.transfer_buffer[i] = kmalloc(sb_size, GFP_KERNEL);
> +		dev->isoc_ctl.urb_ctl[i].transfer_buffer =
> +			kmalloc(sb_size, GFP_KERNEL);
>  #endif
> -		if (!dev->isoc_ctl.transfer_buffer[i]) {
> +		if (!dev->isoc_ctl.urb_ctl[i].transfer_buffer) {
>  			stk1160_err("cannot alloc %d bytes for tx[%d] buffer\n",
>  				sb_size, i);
>  
> @@ -466,14 +450,14 @@ int stk1160_alloc_isoc(struct stk1160 *dev)
>  				goto free_i_bufs;
>  			goto nomore_tx_bufs;
>  		}
> -		memset(dev->isoc_ctl.transfer_buffer[i], 0, sb_size);
> +		memset(dev->isoc_ctl.urb_ctl[i].transfer_buffer, 0, sb_size);
>  
>  		/*
>  		 * FIXME: Where can I get the endpoint?
>  		 */
>  		urb->dev = dev->udev;
>  		urb->pipe = usb_rcvisocpipe(dev->udev, STK1160_EP_VIDEO);
> -		urb->transfer_buffer = dev->isoc_ctl.transfer_buffer[i];
> +		urb->transfer_buffer = dev->isoc_ctl.urb_ctl[i].transfer_buffer;
>  		urb->transfer_buffer_length = sb_size;
>  		urb->complete = stk1160_isoc_irq;
>  		urb->context = dev;
> @@ -508,8 +492,8 @@ int stk1160_alloc_isoc(struct stk1160 *dev)
>  	 * enough to work fine, so we just free the extra urb,
>  	 * store the allocated count and keep going, fingers crossed!
>  	 */
> -	usb_free_urb(dev->isoc_ctl.urb[i]);
> -	dev->isoc_ctl.urb[i] = NULL;
> +	usb_free_urb(dev->isoc_ctl.urb_ctl[i].urb);
> +	dev->isoc_ctl.urb_ctl[i].urb = NULL;
>  
>  	stk1160_warn("%d urbs allocated. Trying to continue...\n", i);
>  
> diff --git a/drivers/media/usb/stk1160/stk1160.h b/drivers/media/usb/stk1160/stk1160.h
> index a70963ce8753..0c355bb078c1 100644
> --- a/drivers/media/usb/stk1160/stk1160.h
> +++ b/drivers/media/usb/stk1160/stk1160.h
> @@ -84,6 +84,11 @@ struct stk1160_buffer {
>  	unsigned int pos;		/* current pos inside buffer */
>  };
>  
> +struct stk1160_urb {
> +	struct urb *urb;
> +	char *transfer_buffer;
> +};
> +
>  struct stk1160_isoc_ctl {
>  	/* max packet size of isoc transaction */
>  	int max_pkt_size;
> @@ -91,11 +96,7 @@ struct stk1160_isoc_ctl {
>  	/* number of allocated urbs */
>  	int num_bufs;
>  
> -	/* urb for isoc transfers */
> -	struct urb **urb;
> -
> -	/* transfer buffers for isoc transfer */
> -	char **transfer_buffer;
> +	struct stk1160_urb urb_ctl[STK1160_NUM_BUFS];
>  
>  	/* current buffer */
>  	struct stk1160_buffer *buf;
> -- 
> 2.17.1
> 
