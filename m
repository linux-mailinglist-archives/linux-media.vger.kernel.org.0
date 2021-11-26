Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F62745F299
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 18:04:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239057AbhKZRHy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 12:07:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235046AbhKZRFy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 12:05:54 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48F6CC08E79C;
        Fri, 26 Nov 2021 08:37:49 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id gf14-20020a17090ac7ce00b001a7a2a0b5c3so10212825pjb.5;
        Fri, 26 Nov 2021 08:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/vKm1CxYbts6nABVaLd/zRVQVpVAmzYXaTKpsj2nLiw=;
        b=p05gzud1UMKEAdOxXOsjxZKAFExt+JKxnUHEQ7tmby/UC7yjvGPE+4izpCTwrly+Mg
         K+r0O1GaWS31oNNwSa6o9xWxx9Z5DbO7LtuGN96GIV/eYFQ5RlVI5m87eUpRVVLDUnO5
         Ao9neVeb+/uMXkuW54LJdXQ15fJg/IxHHWmC4u0s27UoN5emAnTIQAYzy9PRO9pqNv2y
         PgnQbZRRMCtJV1A/kMYx2NAUqpeDA3g1fA2MAf4l/gMsXly0+26R/ZBRKb2ZYc5mKYgl
         t6AOBfuA3DrywIpryXct3xnPGsqelWDwb23mHkuyH2HW2BmAI1E6DqCYdxhIwoBQnKXa
         rNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/vKm1CxYbts6nABVaLd/zRVQVpVAmzYXaTKpsj2nLiw=;
        b=glhujR8Emaf0qzuCkVJCNZS/vioQXUp6YaGXsiEIh2cqUbdGtwxox1RleNbQBPA6AU
         VwnuwLIvkbQ90DIFV1dBu4iPV5XtXCwI4MCmZK8dnhkcgBzJPEdmroFOcPbGPE0MQStp
         0aroBmtPDd48uh6nO8036nLBAg+ht+JFkw8DNlTJrKzGzIeCdgvPDMqGAR3K2jjLYN3X
         8asBEf5OW22PG98yJLDqcGNcLbNMYrjNze1s9K4Ho2CkDBghMDs0lx+q1RrYK3PIRl9y
         BOlmnvNZix+0NBDBGP8w8Jx+Fz7xYkPu6OUeOFAF4w548QNkklJbLqsWkBFk6ctHb2VW
         HY1Q==
X-Gm-Message-State: AOAM533J0pfGtQzdmuRoGcIuQHTQ+TP+vud0nxhL7NDJcHIsrD3lt9W3
        SfPx7HWE5XusDTiVU21wpSzj92sRzyxKzkpW8iE=
X-Google-Smtp-Source: ABdhPJwtjIGX7rHmiHThe17Pj6usa4LD/lXxNnvz9UPg24qx6ivfFcHhVyA46l3lxLL3Xi6CtNIc3kdbB/BhN0CyM2g=
X-Received: by 2002:a17:90b:4a50:: with SMTP id lb16mr16828957pjb.37.1637944668788;
 Fri, 26 Nov 2021 08:37:48 -0800 (PST)
MIME-Version: 1.0
References: <20210903045456.83301-1-kyeongdon.kim@lge.com>
In-Reply-To: <20210903045456.83301-1-kyeongdon.kim@lge.com>
From:   Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:   Fri, 26 Nov 2021 17:37:32 +0100
Message-ID: <CAPybu_10kUFE02QewKd7Lf3CVrJa5y4ogPfptViUfWzTh0W_qg@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: use dynamic allocation for uvc_copy_op
To:     Kyeongdon Kim <kyeongdon.kim@lge.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Ricardo Ribalda <ribalda@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kyeongdon

I fail to understand why your approach is faster than the original one.

Is it because of the alignment of struct uvc_copy_op copy_operations ?

Thanks!

On Fri, Sep 3, 2021 at 6:56 AM Kyeongdon Kim <kyeongdon.kim@lge.com> wrote:
>
> There are some issues to handle frame throughput with camera devices
>
> Using devices:
> - Logitech Webcam
> - Intel(R) RealSense(TM) Depth Camera
>
> To improve efficiency, and maximise throughput,
> use dynamic allocation for uvc_copy_op.
>
> Change from struct uvc_copy_op copy_operations[UVC_MAX_PACKETS];
> to struct uvc_copy_op *copy_operations;
>
> Now, only tested bulk video options.
>
> On test device & own debug log to check frame duration(us),
> refer to test result the below:
>
> Use copy_operations[UVC_MAX_PACKETS]
> [UVC] Check time duration(us) : 54732 / 66000
> [UVC] Check time duration(us) : 57452 / 66000
> [UVC] Check time duration(us) : 57413 / 66000
> [UVC] Check time duration(us) : 56713 / 66000
> [UVC] Check time duration(us) : 57967 / 66000
>
> Use *copy_operations
> [UVC] Check time duration(us) : 30804 / 66000
> [UVC] Check time duration(us) : 38642 / 66000
> [UVC] Check time duration(us) : 26011 / 66000
> [UVC] Check time duration(us) : 30116 / 66000
> [UVC] Check time duration(us) : 29265 / 66000
>
> Signed-off-by: Kyeongdon Kim <kyeongdon.kim@lge.com>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 55 ++++++++++++++++++++++++++++++++++++---
>  drivers/media/usb/uvc/uvcvideo.h  |  3 ++-
>  2 files changed, 54 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index e164646..3a7c131 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1614,6 +1614,36 @@ static void uvc_video_complete(struct urb *urb)
>         queue_work(stream->async_wq, &uvc_urb->work);
>  }
>
> +static void uvc_free_urb_cop(struct uvc_streaming *stream)
> +{
> +       struct uvc_urb *uvc_urb;
> +
> +       for_each_uvc_urb(uvc_urb, stream) {
> +               if (uvc_urb->copy_operations) {
> +                       kfree(uvc_urb->copy_operations);
> +                       uvc_urb->copy_operations = NULL;
> +               }
> +       }
> +}
> +
> +static int uvc_alloc_urb_cop(struct uvc_streaming *stream, gfp_t gfp_flags)
> +{
> +       int max_packet = stream->urb_max_packets;
> +       struct uvc_urb *uvc_urb;
> +
> +       for_each_uvc_urb(uvc_urb, stream) {
> +               uvc_urb->copy_operations
> +                               = kcalloc(max_packet, sizeof(struct uvc_copy_op), gfp_flags);
> +               if (uvc_urb->copy_operations == NULL)
> +                       goto error;
> +       }
> +       return 0;
> +error:
> +       uvc_free_urb_cop(stream);
> +
> +       return -ENOMEM;
> +}
> +
>  /*
>   * Free transfer buffers.
>   */
> @@ -1687,8 +1717,8 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
>          * payloads across multiple URBs.
>          */
>         npackets = DIV_ROUND_UP(size, psize);
> -       if (npackets > UVC_MAX_PACKETS)
> -               npackets = UVC_MAX_PACKETS;
> +       if (npackets > stream->urb_max_packets)
> +               npackets = stream->urb_max_packets;
>
>         /* Retry allocations until one succeed. */
>         for (; npackets > 1; npackets /= 2) {
> @@ -1744,8 +1774,10 @@ static void uvc_video_stop_transfer(struct uvc_streaming *stream,
>                 uvc_urb->urb = NULL;
>         }
>
> -       if (free_buffers)
> +       if (free_buffers) {
>                 uvc_free_urb_buffers(stream);
> +               uvc_free_urb_cop(stream);
> +       }
>  }
>
>  /*
> @@ -1790,10 +1822,18 @@ static int uvc_init_video_isoc(struct uvc_streaming *stream,
>         psize = uvc_endpoint_max_bpi(stream->dev->udev, ep);
>         size = stream->ctrl.dwMaxVideoFrameSize;
>
> +       stream->urb_max_packets = UVC_MAX_PACKETS;
> +
>         npackets = uvc_alloc_urb_buffers(stream, size, psize, gfp_flags);
>         if (npackets == 0)
>                 return -ENOMEM;
>
> +       if (uvc_alloc_urb_cop(stream, gfp_flags) != 0) {
> +               uvc_dbg(stream->dev, VIDEO,
> +                               "Failed to init URBs copy operations.\n");
> +               return -ENOMEM;
> +       }
> +
>         size = npackets * psize;
>
>         for_each_uvc_urb(uvc_urb, stream) {
> @@ -1842,11 +1882,18 @@ static int uvc_init_video_bulk(struct uvc_streaming *stream,
>         psize = usb_endpoint_maxp(&ep->desc);
>         size = stream->ctrl.dwMaxPayloadTransferSize;
>         stream->bulk.max_payload_size = size;
> +       stream->urb_max_packets = DIV_ROUND_UP(size, psize);
>
>         npackets = uvc_alloc_urb_buffers(stream, size, psize, gfp_flags);
>         if (npackets == 0)
>                 return -ENOMEM;
>
> +       if (uvc_alloc_urb_cop(stream, gfp_flags) != 0) {
> +               uvc_dbg(stream->dev, VIDEO,
> +                               "Failed to init URBs copy operations.\n");
> +               return -ENOMEM;
> +       }
> +
>         size = npackets * psize;
>
>         if (usb_endpoint_dir_in(&ep->desc))
> @@ -2147,6 +2194,8 @@ int uvc_video_init(struct uvc_streaming *stream)
>                 }
>         }
>
> +       stream->urb_max_packets = UVC_MAX_PACKETS;
> +
>         /* Prepare asynchronous work items. */
>         for_each_uvc_urb(uvc_urb, stream)
>                 INIT_WORK(&uvc_urb->work, uvc_video_copy_data_work);
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index cce5e38..00cf6c9 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -561,7 +561,7 @@ struct uvc_urb {
>         struct sg_table *sgt;
>
>         unsigned int async_operations;
> -       struct uvc_copy_op copy_operations[UVC_MAX_PACKETS];
> +       struct uvc_copy_op *copy_operations;
>         struct work_struct work;
>  };
>
> @@ -616,6 +616,7 @@ struct uvc_streaming {
>
>         struct uvc_urb uvc_urb[UVC_URBS];
>         unsigned int urb_size;
> +       unsigned int urb_max_packets;
>
>         u32 sequence;
>         u8 last_fid;
> --
> 2.10.2
>


-- 
Ricardo Ribalda
