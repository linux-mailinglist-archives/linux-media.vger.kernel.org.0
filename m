Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2939E33EEEE
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 11:58:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbhCQK5x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 06:57:53 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:49397 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230411AbhCQK5X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 06:57:23 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id MTralAGdaGEYcMTrdlNCbv; Wed, 17 Mar 2021 11:57:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615978641; bh=UvDAjvG7egaDhgEbE6Jme2F25ZNSrc7Zyu34EFaT/Mo=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=cC2fy0RwOWULUTFsGNd+oZz4GIpLpTa1lbB+OcLfmEzF2bdrOeGX6P6IG0UVvf7j9
         ewxZLfVCKliBeYWUOBj1lz5tCkpLk88g2vxRigAoswaaBR9C/UEASbLyzCiNz0dubE
         FsOk3U0umVtW0JxY1hZGgjE1a8K+9xolOM/gWycGJrWP4lLa1hF8QVrwhm7mYhIYel
         slfqdmydjdubsum4lGnvQwJakaGHVbA8nQuNyGlPvk5pkOUfTF8enGdZgdfWqIQyc2
         SymPz8tCpBFOHLB8AsXWMb2ECfQWYF1Iwq6rphZxd6HMxmd5wDdgQkZ0NoRHDE0XS0
         f3AvVQLxlMTfw==
Subject: Re: [PATCH v5 07/13] media: uvcvideo: Use dev->name for querycap()
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
References: <20210316180004.1605727-1-ribalda@chromium.org>
 <20210316180004.1605727-8-ribalda@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <9ea35f06-fd05-20e9-d29a-eb1ac56d7936@xs4all.nl>
Date:   Wed, 17 Mar 2021 11:57:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210316180004.1605727-8-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKBMoIo3J6+wZ8EyqEwcSr+ai1Nt+R9sVvI+0ppS1hwSDLiYaDNX16T95rvC07ApU1IahHBAe0PDtffIl+TIHjVBQK0Q3PMJD74pmqCEL9eyoci7X2gW
 dY0Z2EYGA3IE3mOX/uco8eXdWn/NzfFzLnjUUJGCH2NRUrrhPXkBVEZ3HKIQEEkuYuzfwJ5T0tU/5sQa+YH2zGYnAf47ltureNH/D8xCY4+CVt8ac7QpNDy4
 lLUf/qoS0/4JbRSIvMOY5T6ZuJBvpT/d2MNIxC6qN6Xkj5gvqeSCeiInOZTGxGakiYJXdYmeaFm24DIhRayb3Y0RW1PNATnAAr6nu4G6y3Fmzh5z/9q6oLaG
 akrBuGSaXRhtlW+QZqx+iRGHWxrL8Zif2FbgWHPTq8Qixr+jKFM7O0lBnanitutsjCch8sYM
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/03/2021 18:59, Ricardo Ribalda wrote:
> Use the device name for the card name instead of cap->card.

You mean: 'instead of vdev->name.' ?

> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index e956d833ed84..d780065f3716 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -617,13 +617,12 @@ static int uvc_v4l2_release(struct file *file)
>  static int uvc_ioctl_querycap(struct file *file, void *fh,
>  			      struct v4l2_capability *cap)
>  {
> -	struct video_device *vdev = video_devdata(file);
>  	struct uvc_fh *handle = file->private_data;
>  	struct uvc_video_chain *chain = handle->chain;
>  	struct uvc_streaming *stream = handle->stream;
>  
>  	strscpy(cap->driver, "uvcvideo", sizeof(cap->driver));
> -	strscpy(cap->card, vdev->name, sizeof(cap->card));
> +	strscpy(cap->card, handle->stream->dev->name, sizeof(cap->card));

I don't think this is right. I get this for the video node:

Card type        : Integrated IR Camera: Integrate

and this for the corresponding metadata node:

Card type        : Metadata 7

But they are the same device, so I expect the same text here.

Regards,

	Hans

>  	usb_make_path(stream->dev->udev, cap->bus_info, sizeof(cap->bus_info));
>  	cap->capabilities = V4L2_CAP_DEVICE_CAPS | V4L2_CAP_STREAMING
>  			  | chain->caps;
> 

