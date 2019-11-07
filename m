Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59A28F2830
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 08:41:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726943AbfKGHlX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 7 Nov 2019 02:41:23 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44316 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726498AbfKGHlX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Nov 2019 02:41:23 -0500
Received: by mail-ot1-f68.google.com with SMTP id c19so1168273otr.11;
        Wed, 06 Nov 2019 23:41:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=G+3+98fQW0X7itXW9x+mGVW8GM+JEYa5vvhszpylUYQ=;
        b=IUuBPTHpiHMqtMqikeB7HrkTwiIlaVTHXAZAuOLK0Ub1xAaxrCLSnNZKHmOPF+q4Ko
         jRHyOJ2reTKCaaIbPk8J2fYftAGBrEOIRGvoaKlsC369J2QmIE8Zr4XufoEDSK8SVnIX
         R0EPyl8iZFIEn2aKydTsVd0W8xhdLNu50KuOcschighCOTEEiluAF0PJfBjFb+a0WA0l
         t8DcCOGTIs//GWSe4ZVeXZzUcYThyDVYfWP74BewyQTwFbXjcxKF2fT7sZpAz62PjCuq
         U1m1EBhLHSoAZ0cbXSasuVr6wRyRQhyVpxCDFYHmiEs0OLOkNvwpYozK2uyIBBZIkKPE
         9R0Q==
X-Gm-Message-State: APjAAAV1T5ZZ6BDuiNoWm52QLURI9dcYcihqJhjnwBkjQqEIdEgEmtIR
        cho8KVLr5yWwHwWV9krmeTwuMjzS0//pCyNGiXuNPnwf
X-Google-Smtp-Source: APXvYqzHFrFnPx4rhCrsdfkWBHwbEZ4USJaePYP70BnpPsPGn1/uk7IK8JJrQ1uLmm3kgnc7O+fvnJpjcdOWt7T4b/o=
X-Received: by 2002:a9d:73cd:: with SMTP id m13mr1739756otk.145.1573112482519;
 Wed, 06 Nov 2019 23:41:22 -0800 (PST)
MIME-Version: 1.0
References: <20191106232304.2332121-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20191106232304.2332121-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 7 Nov 2019 08:41:11 +0100
Message-ID: <CAMuHMdW-i+L0pQx1WRWUZ6_BWF0ujQ-4s9TXNfAM9w5OHcgR+g@mail.gmail.com>
Subject: Re: [PATCH] rcar-vin: Limit NV12 availability to supported VIN
 channels only
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Thu, Nov 7, 2019 at 12:25 AM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> When adding support for NV12 it was overlooked that the pixel format is
> only supported on some VIN channels. Fix this by adding a check to only
> accept NV12 on the supported channels (0, 1, 4, 5, 8, 9, 12 and 13).
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks for your patch!

> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -76,7 +76,12 @@ const struct rvin_video_format *rvin_format_from_pixel(struct rvin_dev *vin,
>         if (vin->info->model == RCAR_M1 && pixelformat == V4L2_PIX_FMT_XBGR32)
>                 return NULL;
>
> -       if (pixelformat == V4L2_PIX_FMT_NV12 && !vin->info->nv12)
> +       /*
> +        * If NV12 is supported it's only supported on some channels (0, 1, 4,
> +        * 5, 8, 9, 12 and 13).

Is this true for all SoCs, or do you need a vin->info->model == RCAR_GEN3
check?

> +        */
> +       if (pixelformat == V4L2_PIX_FMT_NV12 &&
> +           (!vin->info->nv12 || BIT(vin->id) & 0xcccc))
>                 return NULL;

So 0xcccc = ~(BIT(0) | BIT(1) | BIT(4) | ...)?
What if you ever have an id larger than 15?
Wouldn't it be safer to check for !(BIT(vin->id) & 0x3333)?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
