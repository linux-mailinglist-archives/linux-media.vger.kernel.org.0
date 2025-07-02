Return-Path: <linux-media+bounces-36563-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C711EAF15AE
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 14:31:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFAD648347F
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 12:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC18B2749F4;
	Wed,  2 Jul 2025 12:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ebomNcYL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5267D274651
	for <linux-media@vger.kernel.org>; Wed,  2 Jul 2025 12:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751459466; cv=none; b=qkDcrhDOEu5ienBL2FCp21ra2S3AMDi6LunHY/SA6cTgqiz+Z9UL3WVMfo8EBxps94q3PzabHFFdPRLGxdnljNGwa3ZBpG521kh4E8KLOngstAQigygUEoAicyWfv7P3qXDSH1VvDrR2Mh9eZI2OkcMAZ8FrndKgORfVPB3kKlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751459466; c=relaxed/simple;
	bh=3jVBuetEQaE9y3rWF5YWJVyzPa0BCvXjKpAA4Ev7OUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EEDMI+FSO2S8zDfjm/ABtAIYZpv6A+ZcmIG99VppVfw+PGZbYJ5VMdOOLmTCmJua/KTKNyntTgJI8sDD2cEv7jWzQimlhLemTgso6eFXizkzhQw1l0JY4TQFDOlQStkpW/rO3N4zEPUJ8nQZ1hcoPKlxBWEgcd9q5CINO6FfhH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ebomNcYL; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32b78b5aa39so42500351fa.1
        for <linux-media@vger.kernel.org>; Wed, 02 Jul 2025 05:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751459462; x=1752064262; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5PT9is2pvFA0KpCrDjVS0+5mGqE0uBCeYvu5bKfsZsk=;
        b=ebomNcYL1X+3f77j8kev0MQOmDgY4mbABxH5nahoTIT7Cu9yInZl0iXpanyaWyGkWv
         m+Ubj2jF3n81Fw+R3asnBH4C+Vp28pzM6VOiVTX3ZTKRQN4s/p6afrNNGSmA2Q3WbImt
         ZwF8H3Qn3ffsQIGFbL37QN/QCOooQMqVVhOzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751459462; x=1752064262;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5PT9is2pvFA0KpCrDjVS0+5mGqE0uBCeYvu5bKfsZsk=;
        b=Y5NU0ZOhXA/UGHwCE1TPzQvGpjZK8lUwimvBE5APXUx+lcdWU4YrZtIEW1R1RqEwws
         sK1olcdjLzEHLcnUB7gzcVTBD09+gMGJkli/HH6Pg9nOu6UXn21+GNoTF1JnNnVgyCdb
         jgcsovr+ztiLSAnoiFh2RgsFM5JG6fbDm0zbJYnJheGqOUiRuDy/AAwiGg5LEZIfvtDj
         u44YB2E4WtvylOQG+XhMWsFeG/wDqHkI2yTqp+MDZV3TB7xkgpT6R1J61BIWI7fvr00W
         7Od6ksmaUe/ZnELYLZ4HEq3mmWyk/BLGiBRvrnwUc/lfgJKeDqFxpngshfDfjB7iuLGY
         4Isg==
X-Forwarded-Encrypted: i=1; AJvYcCVYPCKrwwmA4UhaMhC+spdgoUXNearBllovir95+znhnPt3fanmAKbTUvGi6NERb6+13un51fFK2uo7+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUdMZy2BwGoY8yCSlFpfuscMjstkhhz85Ir2Lv93xh6xwUwk1z
	449jJ53avh4qN8UqT25szmn0OwLLK5QX/CKDlcnoa9o8FjGMgXM/u+CfjUHyWUE1Lb3m9s8LvuL
	bgho=
X-Gm-Gg: ASbGnct0BMyjQ1dbvgj4Tr8eJeb5YRbHhYTBnNfpK6Y7lC3hNYD3YHJT75+QOE+TOYC
	ObABbrufbB8WtZlgu2kdxPw+liVapEQ5Oh/acb483d2EZjbG4yn1ZrP0/FVWGTUqqu+WlMYdiJM
	jQrxMkfmkp1rwLxjq2k3xZbA+TQcy1uZFfhASIyiMNu7C6D9xdhcLwY+CUbIFXO3YUZ+EgwCBJh
	unWsCBRv4APSJ9iiIhUldJPcl7v0pfRKwDIlFb6U110dJJpax+qqHKD96annLb3N6SfpWIDVUiX
	V7K99jkpD5IQu1vmJzMc7Z6WbWYAaefK5i364EAMZYlntetQ7IDCPPbNSEn5EsqQkW0l9WkQLKO
	d7GnI5Dau6PsDxx/u5lIUqDCuxUw9
X-Google-Smtp-Source: AGHT+IFbNUYT6Ihp/TKwnvuMz0bIdjOAztpVVl8RKp5NdUUfgFYChmkRb9Sw2AJCezdJUAa4ygHf6g==
X-Received: by 2002:a05:651c:41d4:b0:32b:3c94:992d with SMTP id 38308e7fff4ca-32e0007e323mr12909381fa.28.1751459462293;
        Wed, 02 Jul 2025 05:31:02 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2e0c83bsm19260231fa.25.2025.07.02.05.30.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 05:31:00 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32b553e33e6so38035161fa.2
        for <linux-media@vger.kernel.org>; Wed, 02 Jul 2025 05:30:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVBaBkt4xtL0hKytPtiveSTjVwN45tW2Xpe6j91z3f/dWPicxujkusj3QVzbP9+X/QlQyumEvkEcnhtPA==@vger.kernel.org
X-Received: by 2002:a05:6512:3990:b0:553:2ff8:5e0b with SMTP id
 2adb3069b0e04-556283700e9mr1016619e87.42.1751459458668; Wed, 02 Jul 2025
 05:30:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702110222.3926355-1-xu.yang_2@nxp.com> <20250702110222.3926355-3-xu.yang_2@nxp.com>
In-Reply-To: <20250702110222.3926355-3-xu.yang_2@nxp.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 2 Jul 2025 14:30:45 +0200
X-Gmail-Original-Message-ID: <CANiDSCum3xkgr1QgdvsuZ3ySNJyoLUe_RWyeSDiM0S87YJ-uTw@mail.gmail.com>
X-Gm-Features: Ac12FXwZ_BR0qOSlJcIB1oB_o-14xQ1JZQnu8mI8P7iUMcywnlv20QQJ74Gt2Y0
Message-ID: <CANiDSCum3xkgr1QgdvsuZ3ySNJyoLUe_RWyeSDiM0S87YJ-uTw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] media: uvcvideo: use usb_alloc_noncoherent/usb_free_noncoherent()
To: Xu Yang <xu.yang_2@nxp.com>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org, 
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com, 
	gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de, 
	andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk, 
	thomas.weissschuh@linutronix.de, dafna.hirschfeld@collabora.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"

Hi Xu

The code looks much cleaner :)

It seems that the hcd.c uses the urb transfer_flags to know the
direction of the transfer.
But the uvc driver is not setting it, you probably want to set it.

On Wed, 2 Jul 2025 at 13:01, Xu Yang <xu.yang_2@nxp.com> wrote:
>
> This will use USB noncoherent API to alloc/free urb buffers, then
> uvc driver needn't to do dma sync operations by itself.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>
> ---
> Changes in v3:
>  - no changes
> ---
>  drivers/media/usb/uvc/uvc_video.c | 56 ++++++++-----------------------
>  1 file changed, 14 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index e3567aeb0007..614cf4781221 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1280,15 +1280,6 @@ static inline struct device *uvc_stream_to_dmadev(struct uvc_streaming *stream)
>         return bus_to_hcd(stream->dev->udev->bus)->self.sysdev;
>  }

The uvc_stream_to_dmadev() function is not used anymore, please drop it.



>
> -static int uvc_submit_urb(struct uvc_urb *uvc_urb, gfp_t mem_flags)
> -{
> -       /* Sync DMA. */
> -       dma_sync_sgtable_for_device(uvc_stream_to_dmadev(uvc_urb->stream),
> -                                   uvc_urb->sgt,
> -                                   uvc_stream_dir(uvc_urb->stream));
> -       return usb_submit_urb(uvc_urb->urb, mem_flags);
> -}
> -
>  /*
>   * uvc_video_decode_data_work: Asynchronous memcpy processing
>   *
> @@ -1310,7 +1301,7 @@ static void uvc_video_copy_data_work(struct work_struct *work)
>                 uvc_queue_buffer_release(op->buf);
>         }
>
> -       ret = uvc_submit_urb(uvc_urb, GFP_KERNEL);
> +       ret = usb_submit_urb(uvc_urb->urb, GFP_KERNEL);
>         if (ret < 0)
>                 dev_err(&uvc_urb->stream->intf->dev,
>                         "Failed to resubmit video URB (%d).\n", ret);
> @@ -1736,12 +1727,6 @@ static void uvc_video_complete(struct urb *urb)
>         /* Re-initialise the URB async work. */
>         uvc_urb->async_operations = 0;
>
> -       /* Sync DMA and invalidate vmap range. */
> -       dma_sync_sgtable_for_cpu(uvc_stream_to_dmadev(uvc_urb->stream),
> -                                uvc_urb->sgt, uvc_stream_dir(stream));
> -       invalidate_kernel_vmap_range(uvc_urb->buffer,
> -                                    uvc_urb->stream->urb_size);
> -
>         /*
>          * Process the URB headers, and optionally queue expensive memcpy tasks
>          * to be deferred to a work queue.
> @@ -1750,7 +1735,7 @@ static void uvc_video_complete(struct urb *urb)
>
>         /* If no async work is needed, resubmit the URB immediately. */
>         if (!uvc_urb->async_operations) {
> -               ret = uvc_submit_urb(uvc_urb, GFP_ATOMIC);
> +               ret = usb_submit_urb(uvc_urb->urb, GFP_ATOMIC);
>                 if (ret < 0)
>                         dev_err(&stream->intf->dev,
>                                 "Failed to resubmit video URB (%d).\n", ret);
> @@ -1765,17 +1750,15 @@ static void uvc_video_complete(struct urb *urb)
>   */
>  static void uvc_free_urb_buffers(struct uvc_streaming *stream)
>  {
> -       struct device *dma_dev = uvc_stream_to_dmadev(stream);
> +       struct usb_device *udev = stream->dev->udev;
>         struct uvc_urb *uvc_urb;
>
>         for_each_uvc_urb(uvc_urb, stream) {
>                 if (!uvc_urb->buffer)
>                         continue;
>
> -               dma_vunmap_noncontiguous(dma_dev, uvc_urb->buffer);
> -               dma_free_noncontiguous(dma_dev, stream->urb_size, uvc_urb->sgt,
> -                                      uvc_stream_dir(stream));
> -
> +               usb_free_noncoherent(udev, stream->urb_size, uvc_urb->buffer,
> +                                    uvc_stream_dir(stream), uvc_urb->sgt);
>                 uvc_urb->buffer = NULL;
>                 uvc_urb->sgt = NULL;
>         }
> @@ -1786,26 +1769,13 @@ static void uvc_free_urb_buffers(struct uvc_streaming *stream)
>  static bool uvc_alloc_urb_buffer(struct uvc_streaming *stream,
>                                  struct uvc_urb *uvc_urb, gfp_t gfp_flags)
>  {
> -       struct device *dma_dev = uvc_stream_to_dmadev(stream);
> -
> -       uvc_urb->sgt = dma_alloc_noncontiguous(dma_dev, stream->urb_size,
> -                                              uvc_stream_dir(stream),
> -                                              gfp_flags, 0);
> -       if (!uvc_urb->sgt)
> -               return false;
> -       uvc_urb->dma = uvc_urb->sgt->sgl->dma_address;
> -
> -       uvc_urb->buffer = dma_vmap_noncontiguous(dma_dev, stream->urb_size,
> -                                                uvc_urb->sgt);
> -       if (!uvc_urb->buffer) {
> -               dma_free_noncontiguous(dma_dev, stream->urb_size,
> -                                      uvc_urb->sgt,
> -                                      uvc_stream_dir(stream));
> -               uvc_urb->sgt = NULL;
> -               return false;
> -       }
> +       struct usb_device *udev = stream->dev->udev;
>
> -       return true;
> +       uvc_urb->buffer = usb_alloc_noncoherent(udev, stream->urb_size,
> +                                               gfp_flags, &uvc_urb->dma,
> +                                               uvc_stream_dir(stream),
> +                                               &uvc_urb->sgt);
> +       return !!uvc_urb->buffer;
>  }
>
>  /*
> @@ -1953,6 +1923,7 @@ static int uvc_init_video_isoc(struct uvc_streaming *stream,
>                 urb->complete = uvc_video_complete;
>                 urb->number_of_packets = npackets;
>                 urb->transfer_buffer_length = size;
> +               urb->sgt = uvc_urb->sgt;
>
>                 for (i = 0; i < npackets; ++i) {
>                         urb->iso_frame_desc[i].offset = i * psize;
> @@ -2009,6 +1980,7 @@ static int uvc_init_video_bulk(struct uvc_streaming *stream,
>                                   size, uvc_video_complete, uvc_urb);
>                 urb->transfer_flags = URB_NO_TRANSFER_DMA_MAP;
>                 urb->transfer_dma = uvc_urb->dma;
> +               urb->sgt = uvc_urb->sgt;
>
>                 uvc_urb->urb = urb;
>         }
> @@ -2120,7 +2092,7 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
>
>         /* Submit the URBs. */
>         for_each_uvc_urb(uvc_urb, stream) {
> -               ret = uvc_submit_urb(uvc_urb, gfp_flags);
> +               ret = usb_submit_urb(uvc_urb->urb, gfp_flags);
>                 if (ret < 0) {
>                         dev_err(&stream->intf->dev,
>                                 "Failed to submit URB %u (%d).\n",
> --
> 2.34.1
>
>


--
Ricardo Ribalda

