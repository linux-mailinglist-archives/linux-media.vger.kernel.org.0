Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B50F573312
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 17:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728339AbfGXPvU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 11:51:20 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:34407 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726621AbfGXPvU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 11:51:20 -0400
Received: by mail-ua1-f68.google.com with SMTP id c4so18628304uad.1
        for <linux-media@vger.kernel.org>; Wed, 24 Jul 2019 08:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0syX1wQdoHhNnv4cq/OJXk3DTgq3xd7sV+Jn+M468mc=;
        b=eAjDloOWWJ9JWgjmFeGbkk4jB6fhNdVNPSzup8y25PXgsYVhqbUJI6f70n1FOnTXRg
         tWNyl7DMojOeCMtnb4pOndUu2GU7fEQtqLLz1+rr0eDDT/dlyfonSubS4xcvXwYB+Qnw
         ZcxB6dVk2baaIJghEEKVsHLmrzaKUqHy3ga7WxIpGfxej8bUyd06T21BF9cce97Nc0rs
         cqCM6fIIty9agrV5SPtnAhl2O+qPkuY2buI36zR0xZh0rzEVxERGNKKNmobow3KpXjsK
         lOSACbLxqiDWkrFHtW24zaosJ5CcPG+tYr2fOP/n2L1Z1Ck39ydkJ3aByEDuNLVWkTd9
         XsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0syX1wQdoHhNnv4cq/OJXk3DTgq3xd7sV+Jn+M468mc=;
        b=HJ4GqF2vRTfeYc5aI1fyVUmTylj/brNWpzhcvRDWxYVvdlsIuZ1ypcSV8UcQocxq71
         K4X9jW4+KKvPGF+voHQzenky2JYRd+PErzl/Q+kkXTTqR/n47dP7AfrIIqVALKag9onI
         IpXBc4H+4+CyALOUe8GVaanRrOrPObVzViIssVfFQmFzavckxSYLFZOWrkJo88Jv8Nyp
         rd0z34PdGBoPMhq5dp4x5QjFkKV5rX4PBmoi5MLJQqyWYU8NyoCgEzGyaDZE+sc/XntR
         rehpmVOnPJDBqR1XZHlrEVM98dobrKWqjsY39+mL5JYp700tf7NAMth/u9Pl9mOBZiuR
         6m+Q==
X-Gm-Message-State: APjAAAWdpNf0FCLcHvcHfLnaRc3/T31tF/4zOOgdhTlfOx3htV3jOLyc
        r5mavezwBUU5hPGwz6vzJgKVvMQ48bp/6DY52GM=
X-Google-Smtp-Source: APXvYqz6OukfzhfI7SGedygppgfymdQuau/2JG7cGlLPnn0roLbai7Gzr2OtkcWsiQsEtr/T+wqtJmLKdYql4NwTkHA=
X-Received: by 2002:ab0:6619:: with SMTP id r25mr4966079uam.33.1563983479473;
 Wed, 24 Jul 2019 08:51:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190724151036.26868-1-mbalant3@gmail.com>
In-Reply-To: <20190724151036.26868-1-mbalant3@gmail.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Wed, 24 Jul 2019 12:51:08 -0300
Message-ID: <CAAEAJfAHLPqx41H_pQY=wG+xdQJv-HFvFu9zTYR5GNP=wmckcQ@mail.gmail.com>
Subject: Re: [PATCH] media input infrastructure:tw686x: Added Added custom
 function to set vdev->release in tw686x driver
To:     Mark Balantzyan <mbalant3@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mark,

On Wed, 24 Jul 2019 at 12:10, Mark Balantzyan <mbalant3@gmail.com> wrote:
>

This commit needs to be thoroughly explained in order to make sense.

> Signed-off-by: Mark Balantzyan <mbalant3@gmail.com>
> ---
> This patch adds a custom function to release video device in assignment to vdev->release member in tw686x driver.
>
>  drivers/media/pci/tw686x/tw686x-video.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/pci/tw686x/tw686x-video.c b/drivers/media/pci/tw686x/tw686x-video.c
> index 3a06c000..3631d0f5 100644
> --- a/drivers/media/pci/tw686x/tw686x-video.c
> +++ b/drivers/media/pci/tw686x/tw686x-video.c
> @@ -1151,6 +1151,21 @@ void tw686x_video_irq(struct tw686x_dev *dev, unsigned long requests,
>         }
>  }
>
> +
> +
> +void tw686x_video_device_release(struct tw686x_video_channel *vc) {
> +       struct tw686x_dev *dev = vc->dev;
> +       unsigned int ch, pb;
> +
> +       for (ch = 0; ch < max_channels(dev); ch++) {
> +               struct tw686x_video_channel *vc = &dev->video_channels[ch];
> +
> +       dev->dma_ops->free;
> +

While I certainly appreciate your intention, you should at least test build
your patch.

You might want to read Documentation/process/ and get some insight on
upstreaming good practices.

Thanks,
Eze

> +       video_device_release((struct video_device*)dev);
> +
> +}
> +
>  void tw686x_video_free(struct tw686x_dev *dev)
>  {
>         unsigned int ch, pb;
> @@ -1160,9 +1175,6 @@ void tw686x_video_free(struct tw686x_dev *dev)
>
>                 video_unregister_device(vc->device);
>
> -               if (dev->dma_ops->free)
> -                       for (pb = 0; pb < 2; pb++)
> -                               dev->dma_ops->free(vc, pb);
>         }
>  }
>
> @@ -1277,7 +1289,7 @@ int tw686x_video_init(struct tw686x_dev *dev)
>                 snprintf(vdev->name, sizeof(vdev->name), "%s video", dev->name);
>                 vdev->fops = &tw686x_video_fops;
>                 vdev->ioctl_ops = &tw686x_video_ioctl_ops;
> -               vdev->release = video_device_release;
> +               vdev->release = tw686x_video_device_release;
>                 vdev->v4l2_dev = &dev->v4l2_dev;
>                 vdev->queue = &vc->vidq;
>                 vdev->tvnorms = V4L2_STD_525_60 | V4L2_STD_625_50;
> --
> 2.17.1
>
