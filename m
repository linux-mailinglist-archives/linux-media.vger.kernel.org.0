Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 804A5364F2
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 21:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbfFETro (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 15:47:44 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:42648 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbfFETro (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 15:47:44 -0400
Received: by mail-oi1-f196.google.com with SMTP id s184so8071478oie.9
        for <linux-media@vger.kernel.org>; Wed, 05 Jun 2019 12:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yC6edW49A9SF7YaZ5YMj1/I45rWSos0znU784v+zphU=;
        b=tsH+IrG138XsbmX1VANzVd6v4nvGXN/52S6uavDFom1wyYGA+LaKXyGo0kD5LlzFnI
         GCKzamCxDK51b4POmz9Lo3ymDXUYbWREygtu+YFrN6RfTo1gH9NQXSYyk+0s7v2CN8Qo
         p0/rQ7ifst+CWnBhFhNQKnhdnNMcrpo4bCFa/FepfZ0N0J2vnGw83nh4T2VUFsDUYCA/
         qtiSn6iCeq+qRox3SwLwt0qmvfFyYHxg3RRP87y0HDElGB3HGK9ILveccVcmN9zNgUzI
         paSJtI37r9rruQjXXSsrhrQqWwhVxxi9cDRuqhc1nWM0oIE0biC9sMcbf4TFzwxY/ruY
         S0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yC6edW49A9SF7YaZ5YMj1/I45rWSos0znU784v+zphU=;
        b=UhebzoQZAGBTnz8l9Ed2HRp0ZN0pLaKJIcFCTZTEmWoM4h3/b4ASoNlrKRCSzAvP/U
         p9/7gGEKa/X9PCTVX2QOn4pvRqzNAbkVGVRUbelkX97V5eD+TvLZka4jbSqh82XAyrXx
         hpLgxZ+YI1Ak0hJb9jH5f1XXVKNZyH/CWnaAtAdY5M+wLaWGLwjyQwQwyMrdInpHGdyt
         qM5hBjEmEEw6B49pB/+offTgvXp64U2Tn+P+oRLiLjLp2WGaEQxclkUobRdzevu7rOjq
         MN6mP6MCP1J4esWU21f4KW9YvdpeOt9dfkOmGkAOR2bQJIbhzoHHTOZS3JAiA5xemDwG
         gm8w==
X-Gm-Message-State: APjAAAVc6QCBYF3GJ0QVfUmlytovXmVYpuS4YkMeY3DxebKNBuq33qU6
        swdhpMBRgSYrj+ynjNGGqk4QL1GEvmOhywph+Ck=
X-Google-Smtp-Source: APXvYqz1ALbDRbUthss1BL6PsJLtM3MwhktE+T3VJCh/B+9WJVtnYjrOnMEGhv923PZvUSwCsXTm0U7vmm0ilhSIa1U=
X-Received: by 2002:aca:ba56:: with SMTP id k83mr4577285oif.7.1559764063712;
 Wed, 05 Jun 2019 12:47:43 -0700 (PDT)
MIME-Version: 1.0
References: <d6832f03-915a-91fc-b678-b2daf68d66d9@xs4all.nl>
In-Reply-To: <d6832f03-915a-91fc-b678-b2daf68d66d9@xs4all.nl>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 5 Jun 2019 20:47:17 +0100
Message-ID: <CA+V-a8vwKhf_KzbR1tBRPcZHcici9nxeA=Q4T6PzHE2ty496Ng@mail.gmail.com>
Subject: Re: [PATCH 7/7] staging/media: set device_caps in struct video_device
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for the patch.

On Tue, Jun 4, 2019 at 12:22 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> From 5e271dce24e2a0e3bad026fff4f8d7485d97aa71 Mon Sep 17 00:00:00 2001
> From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Date: Tue, 4 Jun 2019 11:39:41 +0200
> Subject: [PATCH 7/7] staging/media: set device_caps in struct video_device
>
> Instead of filling in the struct v4l2_capability device_caps
> field, fill in the struct video_device device_caps field.
>
> That way the V4L2 core knows what the capabilities of the
> video device are.
>
> But this only really works if all drivers use this, so convert
> all staging/media drivers in this patch.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Prabhakar Lad <prabhakar.csengg@gmail.com>
> ---
>  drivers/staging/media/bcm2048/radio-bcm2048.c   |  7 ++-----
>  drivers/staging/media/davinci_vpfe/vpfe_video.c |  9 +++++----

For davinci changes,

Acked-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
--Prabhakar Lad

>  drivers/staging/media/omap4iss/iss_video.c      | 11 +++++------
>  3 files changed, 12 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/staging/media/bcm2048/radio-bcm2048.c b/drivers/staging/media/bcm2048/radio-bcm2048.c
> index 09903ffb13ba..2c60a1fb6350 100644
> --- a/drivers/staging/media/bcm2048/radio-bcm2048.c
> +++ b/drivers/staging/media/bcm2048/radio-bcm2048.c
> @@ -2310,11 +2310,6 @@ static int bcm2048_vidioc_querycap(struct file *file, void *priv,
>         strscpy(capability->card, BCM2048_DRIVER_CARD,
>                 sizeof(capability->card));
>         snprintf(capability->bus_info, 32, "I2C: 0x%X", bdev->client->addr);
> -       capability->device_caps = V4L2_CAP_TUNER | V4L2_CAP_RADIO |
> -                                       V4L2_CAP_HW_FREQ_SEEK;
> -       capability->capabilities = capability->device_caps |
> -               V4L2_CAP_DEVICE_CAPS;
> -
>         return 0;
>  }
>
> @@ -2570,6 +2565,8 @@ static const struct video_device bcm2048_viddev_template = {
>         .name                   = BCM2048_DRIVER_NAME,
>         .release                = video_device_release_empty,
>         .ioctl_ops              = &bcm2048_ioctl_ops,
> +       .device_caps            = V4L2_CAP_TUNER | V4L2_CAP_RADIO |
> +                                 V4L2_CAP_HW_FREQ_SEEK,
>  };
>
>  /*
> diff --git a/drivers/staging/media/davinci_vpfe/vpfe_video.c b/drivers/staging/media/davinci_vpfe/vpfe_video.c
> index 84cca18e3e9d..ab6bc452d9f6 100644
> --- a/drivers/staging/media/davinci_vpfe/vpfe_video.c
> +++ b/drivers/staging/media/davinci_vpfe/vpfe_video.c
> @@ -612,10 +612,6 @@ static int vpfe_querycap(struct file *file, void  *priv,
>
>         v4l2_dbg(1, debug, &vpfe_dev->v4l2_dev, "vpfe_querycap\n");
>
> -       if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
> -               cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
> -       else
> -               cap->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
>         cap->capabilities = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VIDEO_OUTPUT |
>                             V4L2_CAP_STREAMING | V4L2_CAP_DEVICE_CAPS;
>         strscpy(cap->driver, CAPTURE_DRV_NAME, sizeof(cap->driver));
> @@ -1628,6 +1624,11 @@ int vpfe_video_register(struct vpfe_video_device *video,
>
>         video->video_dev.v4l2_dev = vdev;
>
> +       if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +               video->video_dev.device_caps = V4L2_CAP_VIDEO_CAPTURE;
> +       else
> +               video->video_dev.device_caps = V4L2_CAP_VIDEO_OUTPUT;
> +       video->video_dev.device_caps |= V4L2_CAP_STREAMING;
>         ret = video_register_device(&video->video_dev, VFL_TYPE_GRABBER, -1);
>         if (ret < 0)
>                 pr_err("%s: could not register video device (%d)\n",
> diff --git a/drivers/staging/media/omap4iss/iss_video.c b/drivers/staging/media/omap4iss/iss_video.c
> index c2c5a9cd8642..c307707480f7 100644
> --- a/drivers/staging/media/omap4iss/iss_video.c
> +++ b/drivers/staging/media/omap4iss/iss_video.c
> @@ -533,12 +533,6 @@ iss_video_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
>         strscpy(cap->driver, ISS_VIDEO_DRIVER_NAME, sizeof(cap->driver));
>         strscpy(cap->card, video->video.name, sizeof(cap->card));
>         strscpy(cap->bus_info, "media", sizeof(cap->bus_info));
> -
> -       if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
> -               cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
> -       else
> -               cap->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
> -
>         cap->capabilities = V4L2_CAP_DEVICE_CAPS | V4L2_CAP_STREAMING
>                           | V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VIDEO_OUTPUT;
>
> @@ -1272,6 +1266,11 @@ int omap4iss_video_register(struct iss_video *video, struct v4l2_device *vdev)
>         int ret;
>
>         video->video.v4l2_dev = vdev;
> +       if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +               video->video.device_caps = V4L2_CAP_VIDEO_CAPTURE;
> +       else
> +               video->video.device_caps = V4L2_CAP_VIDEO_OUTPUT;
> +       video->video.device_caps |= V4L2_CAP_STREAMING;
>
>         ret = video_register_device(&video->video, VFL_TYPE_GRABBER, -1);
>         if (ret < 0)
> --
> 2.20.1
>
