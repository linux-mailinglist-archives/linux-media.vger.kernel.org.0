Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D46CC346C2
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 14:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbfFDMa6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 08:30:58 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47570 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727597AbfFDMa5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 08:30:57 -0400
Received: from pendragon.ideasonboard.com (unknown [IPv6:2a02:2788:668:163:5bb7:9f6c:564c:d55e])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C71785D;
        Tue,  4 Jun 2019 14:30:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559651455;
        bh=riZl41DfG1QZNOepOjUUx076mp+LakAw4unAJMAF22k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jjQzu8Qm1TeGC8eO2n1kGVesn7cLa3l/ebUAuFPSg+52yIyyIMnXwYrFElPmZbbhz
         g/dqiD+BA6scuKF1dx9vUIUsIOt2GSFRYt4ewtyXG+d0vsGNIYYkBTdzVYYQ+xQCeN
         xcnge4BMBJ6via8SzEOZZMqDANbW0Qpa8qPa1zh8=
Date:   Tue, 4 Jun 2019 15:30:42 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: Re: [PATCH 4/7] usb/gadget/f_uvc: set device_caps in struct
 video_device
Message-ID: <20190604123042.GD7812@pendragon.ideasonboard.com>
References: <20190604111958.22331-1-hverkuil-cisco@xs4all.nl>
 <20190604111958.22331-5-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190604111958.22331-5-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Tue, Jun 04, 2019 at 01:19:55PM +0200, Hans Verkuil wrote:
> Instead of filling in the struct v4l2_capability device_caps
> field, fill in the struct video_device device_caps field.
> 
> That way the V4L2 core knows what the capabilities of the
> video device are.
> 
> But this only really works if all drivers use this, so convert
> this UVC gadget driver.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I have no patch for the UVC gadget driver for the next merge window, so
feel free to merge this through the Linux media tree if Felipe is fine
with this.

> ---
>  drivers/usb/gadget/function/f_uvc.c    | 1 +
>  drivers/usb/gadget/function/uvc_v4l2.c | 4 ----
>  2 files changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
> index 8c99392df593..fb0a892687c0 100644
> --- a/drivers/usb/gadget/function/f_uvc.c
> +++ b/drivers/usb/gadget/function/f_uvc.c
> @@ -423,6 +423,7 @@ uvc_register_video(struct uvc_device *uvc)
>  	uvc->vdev.release = video_device_release_empty;
>  	uvc->vdev.vfl_dir = VFL_DIR_TX;
>  	uvc->vdev.lock = &uvc->video.mutex;
> +	uvc->vdev.device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
>  	strlcpy(uvc->vdev.name, cdev->gadget->name, sizeof(uvc->vdev.name));
>  
>  	video_set_drvdata(&uvc->vdev, uvc);
> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> index a1183eccee22..495f0ec663ea 100644
> --- a/drivers/usb/gadget/function/uvc_v4l2.c
> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
> @@ -71,10 +71,6 @@ uvc_v4l2_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
>  	strlcpy(cap->card, cdev->gadget->name, sizeof(cap->card));
>  	strlcpy(cap->bus_info, dev_name(&cdev->gadget->dev),
>  		sizeof(cap->bus_info));
> -
> -	cap->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
> -	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
> -
>  	return 0;
>  }
>  

-- 
Regards,

Laurent Pinchart
