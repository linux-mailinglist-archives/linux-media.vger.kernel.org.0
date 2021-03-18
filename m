Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4E5D3400A0
	for <lists+linux-media@lfdr.de>; Thu, 18 Mar 2021 09:06:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbhCRIGT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 04:06:19 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:41447 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229598AbhCRIGA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 04:06:00 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id MnfHlHy7PDUxpMnfLli4dg; Thu, 18 Mar 2021 09:05:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616054759; bh=RdJYgGZb1ss8zpa9ZBuyTNyrQQbIE+vh1EGEmNI/ULI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=l1xwR68vdeY5DrASZ5I80IgXiL82V6Pf++H6F8e7Nhsb0OCHdYE+LKK+s+6h5dPFI
         hE97P6+AcfKYPZDMMymb7FtCb0mR7hQoMtHZ3zgSrPQJamiGHUlg0L0Av7CA6rX7oM
         bMXVH/6DpNTigv6BGAiyxLQ00dhIUcznehzFLpwEJ8vFC/pQVYHuPeBucIIu36yPTn
         ACJbwycnZlZycNvGP+X6Yu/8MHW9HDZvSnmm+IKo/melHnjzoAbpM02HcIYqKpIhfV
         d6kae1lw6g35FZoyTzRFIZT19UiyE5G4q7kouaS0WoZzDUQhaD9CvhmsFutGxwLFWF
         WJ9m6SaefBYlw==
Subject: Re: [PATCH v6 11/17] media: uvcvideo: Use dev->name for querycap()
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
References: <20210317164511.39967-1-ribalda@chromium.org>
 <20210317164511.39967-12-ribalda@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <a82e7b52-73fb-a439-902d-55b2edcc9b68@xs4all.nl>
Date:   Thu, 18 Mar 2021 09:05:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210317164511.39967-12-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfIw/p+7eUtm/AqnpJWS3jH97NdjmjfPMhi2heJcWXYXU6QWHOL/SfU8Qm2hZqzZ0rXS+LPDu+e75YzEr77CTpYZX3pQtIa4rURRhYoLINLsFkli05dP/
 DQfGFOuPbU2CHVFBzkKA5y9ZRV3+Cu9ywEdRwNRL3N8MZj9EqtynVIz55pfxZBEwtAKb+J7k2uPdpgRfHgbtYbbP0qQ2IXz7l9KKD1HVxWfEcw23098Q5tey
 Zzhyacyuq5vjzmmrIEw6K529T71pSEPDXqhyaV3xVYdR5fczbYe/3IUphbdL50BkjmYP/c+o2fyfA1Fe7e5bWmlvHPM1hfFV8p2/x1mnz4oQcc3YV74Umkle
 Ag7X2TEx61vG5IHcfU3P8idPHG4ErFYlcWOxKLWcIa6kRlo46CiM81/dJYoiT69/NOkN9nIi
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/03/2021 17:45, Ricardo Ribalda wrote:
> Use the device name for the card name instead of vdev->name.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 397217171bbb..dd10cb9361fa 100644
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
> 

You forgot to update querycap in uvc_metadata.c as well:

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index 849d8e5ab75d..d3aab22f91ce 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -30,7 +30,7 @@ static int uvc_meta_v4l2_querycap(struct file *file, void *fh,
 	struct uvc_video_chain *chain = stream->chain;

 	strscpy(cap->driver, "uvcvideo", sizeof(cap->driver));
-	strscpy(cap->card, vfh->vdev->name, sizeof(cap->card));
+	strscpy(cap->card, stream->dev->name, sizeof(cap->card));
 	usb_make_path(stream->dev->udev, cap->bus_info, sizeof(cap->bus_info));
 	cap->capabilities = V4L2_CAP_DEVICE_CAPS | V4L2_CAP_STREAMING
 			  | chain->caps;

With this change both video and metadata card names are the same, as you would
expect.

Regards,

	Hans
