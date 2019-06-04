Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0903134188
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 10:16:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727307AbfFDIPx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 04:15:53 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:42840 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727184AbfFDIPw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 04:15:52 -0400
Received: by mail-oi1-f195.google.com with SMTP id s184so3889488oie.9;
        Tue, 04 Jun 2019 01:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0P8XfByoZm6wKL9UI7hjVSwllit04FWD2v61aqDNCsk=;
        b=QYYfbrVDHfyi4+hEVQ1HJudI8csHpDdfwoBUhZn+mkEtYtDFRbnTMN41mguZKHRST4
         lIAZ0wCvOXIp4tyw8iqrB5scRQxvrl82Iu64YPGEEYTgEVrNxWUZdpwZnxugqlysi5nL
         djZv9bZKtJf1PxjQqNKmBHT+7J8ZIlyFxzx7zt/6dkFJCN3NtU5zTQ2BgZYCoU2pTWNT
         dbIJSBST3vVA8GBgXFr0XJPhnbC58lFsn7hhpRn3d30t+PtXRDpiRYgdvBhYz3ZhxnJB
         q01kj33P4n7A1/7oXHJL18v9AiUT0KNx8tcYH3JPYhfxciR0p2T4X2f+D4WxjQuyeIRn
         L5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0P8XfByoZm6wKL9UI7hjVSwllit04FWD2v61aqDNCsk=;
        b=KwchwimQ0oh1sjuUoCQfaRtiu7xx1Y+Jqu6CKOgyAsJcNnFERUI2F0IZHOcOCqtiuP
         EbpV6cfztzgSfYsZj3HmHs/zazpJtSmZ7IabRk/P+zUvyovymtGYdJUQ0MY0s7UhKrlR
         H67RMO4zOq5ZFSS5ySdCR0QL24i25b9SC2cFZ8emWfL+z9DD2xOh3ysCR2fwTuUJr8+A
         jcrvyjV+PcORLdToHK6QhSlMPeKGjj/zBPl53gjEPZgF6i6ZyK+ncWBvuZhDzilTIPr3
         YudZEGD8IMSUMLJxLS3JdjZyxGWKqF68rUngXRCcTaEtEips2r2o4jmSoEe5Tm1TapgG
         aZPQ==
X-Gm-Message-State: APjAAAUj+g7Nhi1yztBG3jsWbmS9d6XN01MYuXMugNQKRoL/jdxrihKM
        NF9c83tWoYDNTMpofh7JU6fa8nzINyxKrUnQTFQ=
X-Google-Smtp-Source: APXvYqya//7vchAjhVldZPFjCL0IlI3+tfkaf79Di3+SNlnlqeW8B5hzF24LDj31owGDdRMnM7Tlb29sy7d3yadqxnA=
X-Received: by 2002:aca:b606:: with SMTP id g6mr1605787oif.101.1559636151980;
 Tue, 04 Jun 2019 01:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <1559634617-16264-1-git-send-email-92siuyang@gmail.com>
In-Reply-To: <1559634617-16264-1-git-send-email-92siuyang@gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 4 Jun 2019 09:15:25 +0100
Message-ID: <CA+V-a8sBe53iZASaT+uJH0kMvJKNJOHYJLbTfEF+9FOVz3H=Rg@mail.gmail.com>
Subject: Re: [PATCH] media: davinci: vpif_capture: fix memory leak in vpif_probe()
To:     Young Xiao <92siuyang@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Young,

Thanks for the patch.

On Tue, Jun 4, 2019 at 8:49 AM Young Xiao <92siuyang@gmail.com> wrote:
>
> If vpif_probe() fails on v4l2_device_register() and vpif_probe_complete(),
> then memory allocated at initialize_vpif() for global vpif_obj.dev[i]
> become unreleased.
>
> The patch adds deallocation of vpif_obj.dev[i] on the error path.
>
> Signed-off-by: Young Xiao <92siuyang@gmail.com>
> ---
>  drivers/media/platform/davinci/vpif_capture.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/media/platform/davinci/vpif_capture.c
> index b5aacb0..277d500 100644
> --- a/drivers/media/platform/davinci/vpif_capture.c
> +++ b/drivers/media/platform/davinci/vpif_capture.c
> @@ -1385,6 +1385,14 @@ static int initialize_vpif(void)
>         return err;
>  }
>
> +static void free_vpif_objs(void)
> +{
function could be made inline.

> +       int i;
> +
> +       for (i = 0; i < VPIF_DISPLAY_MAX_DEVICES; i++)

VPIF_DISPLAY_MAX_DEVICES ? this should be  VPIF_CAPTURE_MAX_DEVICES

> +               kfree(vpif_obj.dev[i]);
> +}
> +
>  static int vpif_async_bound(struct v4l2_async_notifier *notifier,
>                             struct v4l2_subdev *subdev,
>                             struct v4l2_async_subdev *asd)
> @@ -1654,7 +1662,7 @@ static __init int vpif_probe(struct platform_device *pdev)
>         err = v4l2_device_register(vpif_dev, &vpif_obj.v4l2_dev);
>         if (err) {
>                 v4l2_err(vpif_dev->driver, "Error registering v4l2 device\n");
> -               goto cleanup;
> +               goto vpif_free;
>         }
>
>         while ((res = platform_get_resource(pdev, IORESOURCE_IRQ, res_idx))) {
> @@ -1701,7 +1709,10 @@ static __init int vpif_probe(struct platform_device *pdev)
>                                   "registered sub device %s\n",
>                                    subdevdata->name);
>                 }
> -               vpif_probe_complete();
> +               err = vpif_probe_complete();
> +               if (err) {
> +                       goto probe_subdev_out;
> +               }

No need for { and } as per kernel coding style.

>         } else {
>                 vpif_obj.notifier.ops = &vpif_async_ops;
>                 err = v4l2_async_notifier_register(&vpif_obj.v4l2_dev,
> @@ -1720,6 +1731,8 @@ static __init int vpif_probe(struct platform_device *pdev)
>         kfree(vpif_obj.sd);
>  vpif_unregister:
>         v4l2_device_unregister(&vpif_obj.v4l2_dev);
> +vpif_free:
> +       free_vpif_objs();
>  cleanup:
>         v4l2_async_notifier_cleanup(&vpif_obj.notifier);
>
> @@ -1748,8 +1761,8 @@ static int vpif_remove(struct platform_device *device)
>                 ch = vpif_obj.dev[i];
>                 /* Unregister video device */
>                 video_unregister_device(&ch->video_dev);
> -               kfree(vpif_obj.dev[i]);
>         }
> +       free_vpif_objs();

no need for this change, leave it as it is.

Cheers,
Prabhakar Lad
