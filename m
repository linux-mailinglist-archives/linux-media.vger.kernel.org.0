Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D4273A3134
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 18:45:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231287AbhFJQq5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 12:46:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230396AbhFJQq4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 12:46:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A2EEC061574;
        Thu, 10 Jun 2021 09:45:00 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA40D8D4;
        Thu, 10 Jun 2021 18:44:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623343499;
        bh=wR9rgS0wJPfpshTam9JQSlToh4InHCD6v4gDFDG33VU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AW1xjY00YC7O7qH/nnvJErH7PuTn4amz9bEPRzlsK1rRLbfcW5t6rrMZWmmNLsR5y
         nPzTb9M+5h7HjMA9vrOzoyIwPLQkxJE3P5yqaUXnwcsKpqp4UuEULEnAGfUkWk5COH
         8dfI+wrqdDiElqJb2HVTXnY55mfwayb52q6DlYqg=
Date:   Thu, 10 Jun 2021 19:44:40 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Subject: Re: [PATCH v9 10/22] media: uvcvideo: Use dev->name for querycap()
Message-ID: <YMJBeNCDdH+MApbd@pendragon.ideasonboard.com>
References: <20210326095840.364424-1-ribalda@chromium.org>
 <20210326095840.364424-11-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210326095840.364424-11-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Fri, Mar 26, 2021 at 10:58:28AM +0100, Ricardo Ribalda wrote:
> Use the device name for the card name instead of vdev->name.

The commit message should explain at least briefly why this is desired.

> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_metadata.c | 2 +-
>  drivers/media/usb/uvc/uvc_v4l2.c     | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> index b6279ad7ac84..82de7781f5b6 100644
> --- a/drivers/media/usb/uvc/uvc_metadata.c
> +++ b/drivers/media/usb/uvc/uvc_metadata.c
> @@ -30,7 +30,7 @@ static int uvc_meta_v4l2_querycap(struct file *file, void *fh,
>  	struct uvc_video_chain *chain = stream->chain;
>  
>  	strscpy(cap->driver, "uvcvideo", sizeof(cap->driver));
> -	strscpy(cap->card, vfh->vdev->name, sizeof(cap->card));
> +	strscpy(cap->card, stream->dev->name, sizeof(cap->card));
>  	usb_make_path(stream->dev->udev, cap->bus_info, sizeof(cap->bus_info));
>  	cap->capabilities = V4L2_CAP_DEVICE_CAPS | V4L2_CAP_STREAMING
>  			  | chain->caps;
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 1eeeb00280e4..9cdd30eff495 100644
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
>  	usb_make_path(stream->dev->udev, cap->bus_info, sizeof(cap->bus_info));
>  	cap->capabilities = V4L2_CAP_DEVICE_CAPS | V4L2_CAP_STREAMING
>  			  | chain->caps;

-- 
Regards,

Laurent Pinchart
