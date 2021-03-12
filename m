Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB9F338F4A
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 15:00:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230521AbhCLN7a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 08:59:30 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:45235 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231738AbhCLN7O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 08:59:14 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id KiJplwSg9jVXQKiJslycKL; Fri, 12 Mar 2021 14:59:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615557552; bh=evftEAORKLU6njwkfJ+NtblrUFpiNKSw5fqd68uPSt4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=mTAkBIK/r0ACJvJAi393bS3Kw/tWmJUQsu7sWDKPx5HL+An+mB5ibj/J0efok0JhQ
         0ynofP98pLOc3pYtVpqKPywNsKuHjQnAgC9dWgNX9UsKi6me7HJiA0UGsHcvIWyoNs
         QIlwT8fxwFKSeVh2s/qX8/qK6P4vS4mMeAhM9LhTSKLVePsT+h+OirKxPZfCwpr7tG
         iuWw4n0OhFdNpsvD6gIEgOazLsItjsFvJ9kY1+ldVP2RC4nM+kRsvQ3Sb2G9ilyfGW
         gXRieYjpGDlDtW5mZZWBTCCpRdfpY+RcimBegbSznAns0oh6rgq18rAg+gpdXiUlUi
         sdxcW6wC5cLdQ==
Subject: Re: [PATCH v3 8/8] uvc: use vb2 ioctl and fop helpers
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20210312124830.1344255-1-ribalda@chromium.org>
 <20210312124830.1344255-9-ribalda@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <8384a3c0-2196-7054-207c-2a01cc4d7597@xs4all.nl>
Date:   Fri, 12 Mar 2021 14:59:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210312124830.1344255-9-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfApC6OY4xad+tSEBgfUMKfgrX59AdG6NqODsQJ9oQRwNhHwRLhlfVaouFu+1reW7UXMBaq2vnyQAOJuJEEGufw9YObIgNmRHCr2deB9/5TTqeMqUBduV
 rfLDZp/fYkntjUbfLGtY+VfIFU6fW1xjcqZ7ZuzV0kzgBNl9XaJFw7HmLEdV3M2NAcQkWukRR0KW95+d+4sYyBUsqPIQ8g3ILMvG4QYMs2mpI51IXK1m7CER
 DvxfBhY1gQ7HrzQHEUI83cuhUXvYCOQ65WRmJTISJmE1dwBKQDLX6l7YP69nHP/rsiyn+s2ow1UsLogm1uTnP7UmqqLswE4QihotBiwkMHu+Y6ddydoRW+0Y
 CP8qimBvseMbMZREry6Mg9fWZlct6OeWgqVCrvjPOhAQR+hh0d/FNfqbZJ2RKc4I10mAEsAnNrKEMzRLd2EY9xXV4cNB6L5Z/whv3SawNFCWYrgAjNQ=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/03/2021 13:48, Ricardo Ribalda wrote:
> From: Hans Verkuil <hverkuil@xs4all.nl>
> 
> When uvc was written the vb2 ioctl and file operation helpers didn't exist.
> 
> This patch switches uvc over to those helpers, which removes a lot of boilerplate
> code and simplifies VIDIOC_G/S_PRIORITY handling and allows us to drop the
> 'privileges' scheme, since that's now handled inside the vb2 helpers.
> 
> This makes it possible for uvc to pass the v4l2-compliance streaming tests.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/usb/uvc/uvc_driver.c   |   7 +-
>  drivers/media/usb/uvc/uvc_metadata.c |   8 +-
>  drivers/media/usb/uvc/uvc_queue.c    | 131 -------------
>  drivers/media/usb/uvc/uvc_v4l2.c     | 272 ++-------------------------
>  drivers/media/usb/uvc/uvcvideo.h     |  28 ---
>  5 files changed, 24 insertions(+), 422 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 6c928e708615..b9f3984e9f80 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1911,7 +1911,6 @@ static struct uvc_video_chain *uvc_alloc_chain(struct uvc_device *dev)
>  	INIT_LIST_HEAD(&chain->entities);
>  	mutex_init(&chain->ctrl_mutex);
>  	chain->dev = dev;
> -	v4l2_prio_init(&chain->prio);
>  
>  	return chain;
>  }
> @@ -2194,7 +2193,7 @@ int uvc_register_video_device(struct uvc_device *dev,
>  	vdev->fops = fops;
>  	vdev->ioctl_ops = ioctl_ops;
>  	vdev->release = uvc_release;
> -	vdev->prio = &stream->chain->prio;
> +	vdev->queue = &queue->queue;
>  	if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
>  		vdev->vfl_dir = VFL_DIR_TX;
>  	else
> @@ -2560,8 +2559,8 @@ static int __uvc_resume(struct usb_interface *intf, int reset)
>  		if (stream->intf == intf) {
>  			ret = uvc_video_resume(stream, reset);
>  			if (ret < 0)
> -				uvc_queue_streamoff(&stream->queue,
> -						    stream->queue.queue.type);
> +				vb2_streamoff(&stream->queue.queue,
> +					      stream->queue.queue.type);
>  			return ret;
>  		}
>  	}
> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> index b6279ad7ac84..2f52cdc62929 100644
> --- a/drivers/media/usb/uvc/uvc_metadata.c
> +++ b/drivers/media/usb/uvc/uvc_metadata.c
> @@ -96,7 +96,7 @@ static int uvc_meta_v4l2_set_format(struct file *file, void *fh,
>  	 */
>  	mutex_lock(&stream->mutex);
>  
> -	if (uvc_queue_allocated(&stream->queue))
> +	if (vb2_is_busy(&stream->queue.queue))

This should be &stream->meta.queue.queue. That explains this failure that I get
with v4l2-compliance -d1 when streaming with v4l2-ctl --stream-mmap:

fail: v4l2-test-formats.cpp(452): expected EINVAL, but got 16 when getting format for buftype 13
        test VIDIOC_S_FMT: FAIL

Regards,

	Hans
