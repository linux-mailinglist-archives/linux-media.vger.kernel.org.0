Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59C1F677D5C
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 15:01:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232088AbjAWOA4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 09:00:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232071AbjAWOAx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 09:00:53 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84D742685F
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 06:00:47 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C3F002D9;
        Mon, 23 Jan 2023 15:00:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674482445;
        bh=U4yb+8cDXDgj8BhmM9epd1Tu+axcS8mTstrARnltOj8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NKgYiAT1ADsuvzALI1LW26Rc8OpRcKiQnn41FmbNAizL6FiDNEFXrSlymvbo3qeSD
         KdPnm6Qq2UjcqlNuqHp2tO8JVOpWcfQdXbq0c8+PGeM6pdY+sntRh6PfydqLo62/FC
         v9MxTa33ZrTQtYw6WrUIyFLie/vqqDAqjMlaYGB0=
Date:   Mon, 23 Jan 2023 16:00:40 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Cc:     l.stach@pengutronix.de, nicolas@ndufresne.ca, ppaalanen@gmail.com,
        sumit.semwal@linaro.org, daniel@ffwll.ch, robdclark@gmail.com,
        tfiga@chromium.org, sebastian.wick@redhat.com, hverkuil@xs4all.nl,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, benjamin.gaignard@collabora.com,
        lmark@codeaurora.org, labbott@redhat.com, Brian.Starkey@arm.com,
        jstultz@google.com, mchehab@kernel.org
Subject: Re: [PATCH 2/2] media: uvcvideo: expose dma-heap hint to userspace
Message-ID: <Y86TCFUYsWdDNDPP@pendragon.ideasonboard.com>
References: <20230123123756.401692-1-christian.koenig@amd.com>
 <20230123123756.401692-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230123123756.401692-3-christian.koenig@amd.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Christian,

Thank you for the patch.

On Mon, Jan 23, 2023 at 01:37:56PM +0100, Christian König wrote:
> Expose an indicator to let userspace know from which dma_heap
> to allocate for buffers of this device.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index e4bcb5011360..b247026b68c5 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -7,6 +7,7 @@
>   */
>  
>  #include <linux/atomic.h>
> +#include <linux/dma-heap.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/kernel.h>
>  #include <linux/list.h>
> @@ -1909,6 +1910,8 @@ static void uvc_unregister_video(struct uvc_device *dev)
>  
>  	if (dev->vdev.dev)
>  		v4l2_device_unregister(&dev->vdev);
> +	dma_heap_remove_device_link(&dev->udev->dev);
> +

Could we avoid having to call this explicitly in drivers, possibly using
devres in dma_heap_create_device_link() ?

>  #ifdef CONFIG_MEDIA_CONTROLLER
>  	if (media_devnode_is_registered(dev->mdev.devnode))
>  		media_device_unregister(&dev->mdev);
> @@ -2181,6 +2184,14 @@ static int uvc_probe(struct usb_interface *intf,
>  			 dev->uvc_version >> 8, dev->uvc_version & 0xff);
>  	}
>  
> +	/*
> +	 * UVC exports DMA-buf buffers with dirty CPU caches. For compatibility
> +	 * with device which can't snoop the CPU cache it's best practice to
> +	 * allocate DMA-bufs from the system DMA-heap.
> +	 */
> +	if (dma_heap_create_device_link(&dev->udev->dev, "system"))

I don't think this is the right device. A UVC device is usually a
composite USB device with an audio (UAC) function in addition to UVC,
and that may require a different heap (at least conceptually). Wouldn't
the video_device be a better candidate to expose the link ? This would
create a race condition though, as the link will be created after
userspace gets notified of the device being available.

> +		goto error;
> +
>  	/* Register the V4L2 device. */
>  	if (v4l2_device_register(&intf->dev, &dev->vdev) < 0)
>  		goto error;

-- 
Regards,

Laurent Pinchart
