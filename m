Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 119A42003B
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 09:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbfEPH1Q convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 16 May 2019 03:27:16 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:44015 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726374AbfEPH1P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 03:27:15 -0400
Received: by mail-vs1-f68.google.com with SMTP id d128so1643161vsc.10;
        Thu, 16 May 2019 00:27:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9OpkOibxcuUC8ReVyp3/fOxgiTH87FuWtzKvQfGNZec=;
        b=YbjVpalzAh1gJUQOux8ciYRk8oqdA2DTbasYJAk9cmY6icHLq3Og1SI1YGCHQ8Ar1a
         NJdS0a9fDp2wVhWmvfSdvqQsz1/9XEvj+3/+bdQIyCjZ+Xx/5Nhvf8o+SphcpQYsTIxa
         XJjpt+v1RjPz/5uS4f0bUqxCtC71NmjlkzsYvlyAAMc06PvJ4aYPUvCbmS8GWcvKkntE
         iefwOo6oNjCzXbKXRylx8eI0xlYmq30NrDEqJpkhjPmmKHVYOI7cA6+/XUK7y/dVsC2h
         3dXIAWiHlDLYs2fqAw5TIbz/jevRP/q8TFDRt+/xA7Yyqe1FKOIgRdpcM32g6UteLynR
         cWYA==
X-Gm-Message-State: APjAAAUt1ZeN58N+Rp2J9A1JHbhipgOfDOuV7BCXktm8MNv5mjtap861
        TRQofPPUIiLYJdlfvBhWzY0l29WxLl12X3O83dqW6g==
X-Google-Smtp-Source: APXvYqyPBe8baPwp7AFQGQj6lmoBR0FjJx/EhTHHX1Tsyra0T+wmFbXh0KtUKv8B0cN9sviRYwH1NEwWYJzbCa0W680=
X-Received: by 2002:a67:fdd4:: with SMTP id l20mr18226421vsq.63.1557991634833;
 Thu, 16 May 2019 00:27:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190516011417.10590-1-niklas.soderlund+renesas@ragnatech.se> <20190516011417.10590-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20190516011417.10590-3-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 16 May 2019 09:27:03 +0200
Message-ID: <CAMuHMdUv_dVvQP1+zkPMJ--=zOWovbrnUTjZsGez9BFg2zOQ=Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] rcar-vin: Remove unneeded calls to pm_runtime_{enable,disable}
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ulrich Hecht <uli@fpond.eu>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Thu, May 16, 2019 at 3:49 AM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Runtime PM is already enabled unconditionally when the driver is probed
> and disabled when it's removed. There is no point in doing it again for
> Gen2 when opening and closing the video device.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index b821ea01786eb1ff..0841f1a0bfd7ba3a 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -797,8 +797,6 @@ static int rvin_initialize_device(struct file *file)
>         if (ret < 0)
>                 return ret;
>
> -       pm_runtime_enable(&vin->vdev.dev);

Ah, this already (partly) answers my question on patch 1/8.

> -
>         /*
>          * Try to configure with default parameters. Notice: this is the
>          * very first open, so, we cannot race against other calls,

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
