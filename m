Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74DD93654C
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 22:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726606AbfFEUVM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 16:21:12 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:40269 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726528AbfFEUVM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 16:21:12 -0400
Received: by mail-oi1-f195.google.com with SMTP id w196so9665315oie.7;
        Wed, 05 Jun 2019 13:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a23dw9qztWcz3b3QKk1MGLNahxdaBieL3lGWGrnStH4=;
        b=O62AVfLHOS2mSvjtvIx7Q1hdgKyXLEvw3ETdEANYPaOrgtPSQPMLEsaKJGErVwCIX2
         ZokHJq1KIlKkjcdPIEwNowN8ba0I6OaI+pmHdWyq2lktEUrwtnVZakBdkfTCu+lvzT44
         kzVmGGHZcXidy2twnCQc+hSuXndr4t+OWZZuJI06uYY7FfkdN/wMBPwzdD8SQyaoK5AA
         e0MSa89ZDcHb8hf6/Und8ReEj8VqkuIEo3OhGJztilw9FJg5FEAgkLYTCE7siSBTHGPg
         xm8V8dMd6AerUe9Le+xFuv66Dsj7W9uy+Z4GQ1I5j0FtWCZSVPZdmTIBlZdeTJGt1AQv
         i6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a23dw9qztWcz3b3QKk1MGLNahxdaBieL3lGWGrnStH4=;
        b=nLqT18A521690BjlVY5MI4oyKH6o17oD93q3IUfSDeurlv7J3bdu0TR5zXCHkfRj9M
         tMm2PKtyof2f3XEIv07T3Z0DPcAL+SfAd9/818WaEm837MRV4+/jMRkZc/XW1EjXe/jN
         ZrGnUIkh7FMsS0X8QOQP6e+FDSVwg0UyE0My8ZKXVmjiFpesVcW+fO73MhNnrPNr6tXJ
         Hc5i3ibfoB+i1ROb81oaZOYdC4TpoQGJcCARXXhtrnSkpViWqO0xF+p6MfI9+DukkJ90
         vTuNKQvCwhDbwBfdxEg59Iczujbg+q+nuy8BrnxjslO+SpY43dZ0b1I9gbsv30/Oogg7
         wKKw==
X-Gm-Message-State: APjAAAVpJTL1XtQYQRZILyzd3WhCAJAZkZzWfLfZ6iDyjC+UqMcyF3is
        CFNL1tZzXFTxIOJHyCqoo11U4a9BZygPCTRtYQE=
X-Google-Smtp-Source: APXvYqwz/vpDEKWiBZZxHm3dppc8ShywxqzL23EOiT7aMcvE0JWZYkrpvPhwUBqwNgKbyufbaXiB1V39nFNujcn05ss=
X-Received: by 2002:aca:b606:: with SMTP id g6mr7507212oif.101.1559766071541;
 Wed, 05 Jun 2019 13:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <1559651193-17982-1-git-send-email-92siuyang@gmail.com>
In-Reply-To: <1559651193-17982-1-git-send-email-92siuyang@gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 5 Jun 2019 21:20:45 +0100
Message-ID: <CA+V-a8t1cu1HVp5GMT1k2q9RaJfVcQij=ATHRFKAVGdyiiXTcw@mail.gmail.com>
Subject: Re: [PATCH] media: davinci: vpif_capture: fix memory leak in vpif_probe()
To:     Young Xiao <92siuyang@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 4, 2019 at 1:25 PM Young Xiao <92siuyang@gmail.com> wrote:
>
> If vpif_probe() fails on v4l2_device_register() and vpif_probe_complete(),
> then memory allocated at initialize_vpif() for global vpif_obj.dev[i]
> become unreleased.
>
> The patch adds deallocation of vpif_obj.dev[i] on the error path.
>
> Signed-off-by: Young Xiao <92siuyang@gmail.com>
> ---
>  drivers/media/platform/davinci/vpif_capture.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
Acked-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
--Prabhakar Lad

> diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/media/platform/davinci/vpif_capture.c
> index b5aacb0..75c2c10 100644
> --- a/drivers/media/platform/davinci/vpif_capture.c
> +++ b/drivers/media/platform/davinci/vpif_capture.c
> @@ -1385,6 +1385,14 @@ static int initialize_vpif(void)
>         return err;
>  }
>
> +static inline void free_vpif_objs(void)
> +{
> +       int i;
> +
> +       for (i = 0; i < VPIF_CAPTURE_MAX_DEVICES; i++)
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
> @@ -1701,7 +1709,9 @@ static __init int vpif_probe(struct platform_device *pdev)
>                                   "registered sub device %s\n",
>                                    subdevdata->name);
>                 }
> -               vpif_probe_complete();
> +               err = vpif_probe_complete();
> +               if (err)
> +                       goto probe_subdev_out;
>         } else {
>                 vpif_obj.notifier.ops = &vpif_async_ops;
>                 err = v4l2_async_notifier_register(&vpif_obj.v4l2_dev,
> @@ -1720,6 +1730,8 @@ static __init int vpif_probe(struct platform_device *pdev)
>         kfree(vpif_obj.sd);
>  vpif_unregister:
>         v4l2_device_unregister(&vpif_obj.v4l2_dev);
> +vpif_free:
> +       free_vpif_objs();
>  cleanup:
>         v4l2_async_notifier_cleanup(&vpif_obj.notifier);
>
> --
> 2.7.4
>
