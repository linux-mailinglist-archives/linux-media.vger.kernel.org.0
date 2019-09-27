Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4922CC0CAA
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 22:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728191AbfI0UfU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 16:35:20 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37502 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbfI0UfU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 16:35:20 -0400
Received: by mail-ot1-f68.google.com with SMTP id k32so3390954otc.4;
        Fri, 27 Sep 2019 13:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QziTQktb66l852b9OZtJUR7XYtUoQr3L9V1FftInsdM=;
        b=LBbtJYUEs9gbsbqMB0RI78yVbqw3HIplSYdtzsiezZrb47H4CSaPwAITgoHJDx8sR1
         a+GKsP3bmdfc1imbm7gEm/kt/XYQYffI1MJmkfUf7zdEisLF5B2IctYAAdvFbmcWfFrm
         70pk1IcTWw9iyNfNJrx1UMQs/ysQSLeLUxnkwo561z3hJUerEMeo6iDCI9pfhuO7gB9L
         xJdtMtCBledhXBijDtpYEwxJRtivmgS0QlbuM7sQtLud4QWi6euStQlN2SGiPu7AfUNX
         HjxphWPsYI3Rk0Z86U0h3Kr5+jXw8QMei+WYsFh5AgWKPbjrzunOr0BtcXu25P5+o1zc
         UMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QziTQktb66l852b9OZtJUR7XYtUoQr3L9V1FftInsdM=;
        b=Wc4rvrmrl4WbT9qDJ2rUe7m++fIrK0hBIU0zzinKcbF9iBd+t7Hp/ZDAez+bOiztoO
         WN4W4uid4Ws9T86Boq4JlEn9/cGRmXUHgQp2VW6JjfX0JPKEP9jKH2ghWBOQGQInOuxF
         mVG2HUKXrLN9ROFyj1EmPMxRKJWLaaVRjE126GvjxMFoMzZsXZ0sDLlu6DIpteKz/GRt
         g9Aa/C6qAOofeObvM/cSzr6wgQFPrKV2RrObqHQ05DuY7mhif0jhMdUV1Vpvzf2+nEZs
         fbkf/G1E/KhASCKSsWxZEQka3NiaUV1klAGERPfiMKG5ZWbaPHHZkv9aci1N2pXXAYdQ
         DsAw==
X-Gm-Message-State: APjAAAXApfEiRloNmEYxcvKcJ3GPBTcYJ39+89Nww8TR4ctLuWp55k2h
        ggh92Cj937gw+vE9Pq6A40l55dLl5fHO9zFNwQk=
X-Google-Smtp-Source: APXvYqzVFmmxmyONnN0Rvqk+/g/H10y0wRWoTMhegr0XWEk0V1GcxxThRGLw1O2pZPQiUkGeETpOtNKEunkbo4ww5Ig=
X-Received: by 2002:a05:6830:1c5:: with SMTP id r5mr4741560ota.325.1569616519805;
 Fri, 27 Sep 2019 13:35:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190927184722.31989-1-bparrot@ti.com> <20190927184722.31989-2-bparrot@ti.com>
In-Reply-To: <20190927184722.31989-2-bparrot@ti.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 27 Sep 2019 21:34:53 +0100
Message-ID: <CA+V-a8t37+xac0aDLDmnQ3FO1q29RHrtq-bJ1GdpWv0_tnp8KA@mail.gmail.com>
Subject: Re: [Patch v4 1/8] media: i2c: ov2659: Fix for image wrap-around in
 lower resolution
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 27, 2019 at 7:47 PM Benoit Parrot <bparrot@ti.com> wrote:
>
> Based on recently found sensor configuration examples, it was
> discovered that when scaling and binning are used for the lower
> resolutions (i.e. 640x480, 320x240) the read offset has to be
> increased otherwise the image appears to be wrapped around.
>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> ---
>  drivers/media/i2c/ov2659.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Acked-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
--Prabhakar Lad

> diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
> index f4ded0669ff9..17573257097d 100644
> --- a/drivers/media/i2c/ov2659.c
> +++ b/drivers/media/i2c/ov2659.c
> @@ -661,7 +661,7 @@ static struct sensor_register ov2659_vga[] = {
>         { REG_TIMING_HORIZ_FORMAT, 0x01 },
>         { 0x370a, 0x52 },
>         { REG_VFIFO_READ_START_H, 0x00 },
> -       { REG_VFIFO_READ_START_L, 0x80 },
> +       { REG_VFIFO_READ_START_L, 0xa0 },
>         { REG_ISP_CTRL02, 0x10 },
>         { REG_NULL, 0x00 },
>  };
> @@ -709,7 +709,7 @@ static  struct sensor_register ov2659_qvga[] = {
>         { REG_TIMING_HORIZ_FORMAT, 0x01 },
>         { 0x370a, 0x52 },
>         { REG_VFIFO_READ_START_H, 0x00 },
> -       { REG_VFIFO_READ_START_L, 0x80 },
> +       { REG_VFIFO_READ_START_L, 0xa0 },
>         { REG_ISP_CTRL02, 0x10 },
>         { REG_NULL, 0x00 },
>  };
> --
> 2.17.1
>
