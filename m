Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB9945B5BD
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 09:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727877AbfGAHbS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 03:31:18 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33043 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727875AbfGAHbS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 03:31:18 -0400
Received: by mail-ot1-f68.google.com with SMTP id q20so12469789otl.0
        for <linux-media@vger.kernel.org>; Mon, 01 Jul 2019 00:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QrR5RNo+ZEIejiGJPE7sz9XfJBJfSDxPrw3B/aPUSgo=;
        b=nSA4QKyjVaYqldB6aflZFgP8f8mkmNXxVYDSqfu8/jEXBy11TtFJIonylT9NNQ9n2k
         sIntTNvMJR3meOWW9nj2Ur8tDWf13xozPW7onn76lWbiClgxmJz2DFtillaUe6XNPHDl
         +hPL6laM/UCI0iF8JtElVGzGqQrZKbIEDdgv1hWmLd4F2tUdClxidG+mdHlXlsizRPT8
         +EhKXaqys0MHplcAPCMAm42Ms1lgn3IyJ3QlX94K3f008X9ASdTNaBvHs9IWNHTz1d2X
         jCam28/WamCOCXN1FKuEhKqbkroiinUJQ/2/CmGDIobCbYYPPuetzsrZVXiDltWelV68
         St6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QrR5RNo+ZEIejiGJPE7sz9XfJBJfSDxPrw3B/aPUSgo=;
        b=tpA7FyVPFOHl8fo9gZ4SCRW+DC0GAxR1dzOrLjHcQHtPwYLCp+GNwt2bC+oOn5HDlF
         E6XVicg/0nSJ5GTDsEXJwYF8/mPe1rUwu7Ec5a+wFAFxyqeLWCh5OWQXsJLRnMnf/UT8
         VfKshYpgMNXBbMVbL6p9Yg6bNdthT+S4rTmexfSFFCklTrmm6Z1GHBp1WLH4qwf/sxIb
         q6oUPLvpS5qwn8VXc/seXH8UEwrcUIfvfBR7LYogwzKdeDkLs6eeWbzCCKqZ0qHOHk/T
         OYTRisQCc8PXT2vXTPwY/NOx8LHLOrBKrqA4T8PZ7amZuJBS+tiQv+pFZAmNfY2Xu1fE
         GbWQ==
X-Gm-Message-State: APjAAAXxBXPfo1+5r2SfOZ/0BbdVfObdkT2BihgndUV2ND4iCBqDgQQf
        QGzkSXn12U1YkjVgNoSILisCm8c16wIfI6ngNpw=
X-Google-Smtp-Source: APXvYqy1IKGPqIwO02aztKoCd7isBQw0Ct35HmGi4uh3jA0nel7rrgYy3hDU4abl3JYjIh3faubmv7m9xyE6WW/7L7o=
X-Received: by 2002:a05:6830:157:: with SMTP id j23mr17600441otp.198.1561966276751;
 Mon, 01 Jul 2019 00:31:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190626074421.38739-1-hverkuil-cisco@xs4all.nl> <20190626074421.38739-2-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20190626074421.38739-2-hverkuil-cisco@xs4all.nl>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 1 Jul 2019 08:30:50 +0100
Message-ID: <CA+V-a8sfbFCF=u6dKt4X75OitQBE5hzQbTOjXjBOGauVNSs=Jw@mail.gmail.com>
Subject: Re: [PATCH 01/16] am437x/davinci: set device_caps in struct video_device
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Wed, Jun 26, 2019 at 8:44 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> Instead of filling in the struct v4l2_capability device_caps
> field, fill in the struct video_device device_caps field.
>
> That way the V4L2 core knows what the capabilities of the
> video device are.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: prabhakar.csengg@gmail.com
> ---
>  drivers/media/platform/am437x/am437x-vpfe.c   | 6 ++----
>  drivers/media/platform/davinci/vpbe_display.c | 3 +--
>  drivers/media/platform/davinci/vpfe_capture.c | 3 +--
>  drivers/media/platform/davinci/vpif_capture.c | 3 +--
>  drivers/media/platform/davinci/vpif_display.c | 3 +--
>  5 files changed, 6 insertions(+), 12 deletions(-)
>

Acked-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
Prabhakar Lad

> diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
> index fe7b937eb5f2..ef635f80d645 100644
> --- a/drivers/media/platform/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/am437x/am437x-vpfe.c
> @@ -1412,10 +1412,6 @@ static int vpfe_querycap(struct file *file, void  *priv,
>         strscpy(cap->card, "TI AM437x VPFE", sizeof(cap->card));
>         snprintf(cap->bus_info, sizeof(cap->bus_info),
>                         "platform:%s", vpfe->v4l2_dev.name);
> -       cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
> -                           V4L2_CAP_READWRITE;
> -       cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
> -
>         return 0;
>  }
>
> @@ -2393,6 +2389,8 @@ static int vpfe_probe_complete(struct vpfe_device *vpfe)
>         vdev->vfl_dir = VFL_DIR_RX;
>         vdev->queue = q;
>         vdev->lock = &vpfe->lock;
> +       vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
> +                           V4L2_CAP_READWRITE;
>         video_set_drvdata(vdev, vpfe);
>         err = video_register_device(&vpfe->video_dev, VFL_TYPE_GRABBER, -1);
>         if (err) {
> diff --git a/drivers/media/platform/davinci/vpbe_display.c b/drivers/media/platform/davinci/vpbe_display.c
> index 000b191c42d8..8d864b4da65e 100644
> --- a/drivers/media/platform/davinci/vpbe_display.c
> +++ b/drivers/media/platform/davinci/vpbe_display.c
> @@ -633,8 +633,6 @@ static int vpbe_display_querycap(struct file *file, void  *priv,
>         struct vpbe_layer *layer = video_drvdata(file);
>         struct vpbe_device *vpbe_dev = layer->disp_dev->vpbe_dev;
>
> -       cap->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
> -       cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
>         snprintf(cap->driver, sizeof(cap->driver), "%s",
>                 dev_name(vpbe_dev->pdev));
>         snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
> @@ -1319,6 +1317,7 @@ static int init_vpbe_layer(int i, struct vpbe_display *disp_dev,
>         vbd->v4l2_dev   = &disp_dev->vpbe_dev->v4l2_dev;
>         vbd->lock       = &vpbe_display_layer->opslock;
>         vbd->vfl_dir    = VFL_DIR_TX;
> +       vbd->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
>
>         if (disp_dev->vpbe_dev->current_timings.timings_type &
>                         VPBE_ENC_STD)
> diff --git a/drivers/media/platform/davinci/vpfe_capture.c b/drivers/media/platform/davinci/vpfe_capture.c
> index 295fbf1a49cf..852fc357e19d 100644
> --- a/drivers/media/platform/davinci/vpfe_capture.c
> +++ b/drivers/media/platform/davinci/vpfe_capture.c
> @@ -877,8 +877,6 @@ static int vpfe_querycap(struct file *file, void  *priv,
>
>         v4l2_dbg(1, debug, &vpfe_dev->v4l2_dev, "vpfe_querycap\n");
>
> -       cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
> -       cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
>         strscpy(cap->driver, CAPTURE_DRV_NAME, sizeof(cap->driver));
>         strscpy(cap->bus_info, "VPFE", sizeof(cap->bus_info));
>         strscpy(cap->card, vpfe_dev->cfg->card_name, sizeof(cap->card));
> @@ -1785,6 +1783,7 @@ static int vpfe_probe(struct platform_device *pdev)
>         vfd->ioctl_ops          = &vpfe_ioctl_ops;
>         vfd->tvnorms            = 0;
>         vfd->v4l2_dev           = &vpfe_dev->v4l2_dev;
> +       vfd->device_caps        = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
>         snprintf(vfd->name, sizeof(vfd->name),
>                  "%s_V%d.%d.%d",
>                  CAPTURE_DRV_NAME,
> diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/media/platform/davinci/vpif_capture.c
> index f0f7ef638c56..af22fc5050c3 100644
> --- a/drivers/media/platform/davinci/vpif_capture.c
> +++ b/drivers/media/platform/davinci/vpif_capture.c
> @@ -1085,8 +1085,6 @@ static int vpif_querycap(struct file *file, void  *priv,
>  {
>         struct vpif_capture_config *config = vpif_dev->platform_data;
>
> -       cap->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
> -       cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
>         strscpy(cap->driver, VPIF_DRIVER_NAME, sizeof(cap->driver));
>         snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
>                  dev_name(vpif_dev));
> @@ -1473,6 +1471,7 @@ static int vpif_probe_complete(void)
>                 vdev->vfl_dir = VFL_DIR_RX;
>                 vdev->queue = q;
>                 vdev->lock = &common->lock;
> +               vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
>                 video_set_drvdata(&ch->video_dev, ch);
>                 err = video_register_device(vdev,
>                                             VFL_TYPE_GRABBER, (j ? 1 : 0));
> diff --git a/drivers/media/platform/davinci/vpif_display.c b/drivers/media/platform/davinci/vpif_display.c
> index a69897c68a50..91592e766368 100644
> --- a/drivers/media/platform/davinci/vpif_display.c
> +++ b/drivers/media/platform/davinci/vpif_display.c
> @@ -584,8 +584,6 @@ static int vpif_querycap(struct file *file, void  *priv,
>  {
>         struct vpif_display_config *config = vpif_dev->platform_data;
>
> -       cap->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
> -       cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
>         strscpy(cap->driver, VPIF_DRIVER_NAME, sizeof(cap->driver));
>         snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
>                  dev_name(vpif_dev));
> @@ -1218,6 +1216,7 @@ static int vpif_probe_complete(void)
>                 vdev->vfl_dir = VFL_DIR_TX;
>                 vdev->queue = q;
>                 vdev->lock = &common->lock;
> +               vdev->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
>                 video_set_drvdata(&ch->video_dev, ch);
>                 err = video_register_device(vdev, VFL_TYPE_GRABBER,
>                                             (j ? 3 : 2));
> --
> 2.20.1
>
