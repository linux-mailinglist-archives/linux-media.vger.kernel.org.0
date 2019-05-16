Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57F972002E
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 09:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbfEPHXy convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 16 May 2019 03:23:54 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:42565 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726374AbfEPHXy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 03:23:54 -0400
Received: by mail-vs1-f68.google.com with SMTP id z11so1641008vsq.9;
        Thu, 16 May 2019 00:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tgfau7boWrWh6F3Fa9WuK4GpRReaYJg5HNoV5hTdOBo=;
        b=gu7aMvJfTEcC94VUyzuiotm/xiKv/Aim8bT3fZDrOtT0OJlSRF1cnHPi1exkpO98YV
         S68aX7G6hDTB3c1P1zFV+Ka4B9EzGhEyESCfL7dYG2S2Oa8UWoiuCQ5wT7Ae7hHwmiTk
         i+P3Gb/HU8jJ5MU69jXJ+iEiDEt1ijQGUVDaPgH7SAuU6p/fceMqnZ9vd/jDgyFnUgW6
         jOmAzhRR4BRlrkPjxlwIg2HZJzdeZ/eskSsnGVJUymwr7XM9WkSOWojZo6nDAompREOg
         bOSKhWgWsB2VUUxkoALluDVErMJ3YPxmakxHUIRsuvO6iAH7p5GxBG3ZJPg321Xqgz0p
         KHiQ==
X-Gm-Message-State: APjAAAXkE9KQ0i2jZSxuBdOaAjpv/NUX0xol1SVnDmRH3+qyDl4GPd5Q
        3/CBluaANUhNhkqnyFmOvhCldIUEPlL5synKPoQ=
X-Google-Smtp-Source: APXvYqzWxSQY3dY6GUjsZ1P1q09AZKaieGK8Rl0D0Ox+5areEV5HUfnEFYBx5FyuhBkuR+yXaYjJrAAfDOGlQq0D+b4=
X-Received: by 2002:a67:770f:: with SMTP id s15mr14318843vsc.11.1557991433239;
 Thu, 16 May 2019 00:23:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190516011417.10590-1-niklas.soderlund+renesas@ragnatech.se> <20190516011417.10590-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20190516011417.10590-2-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 16 May 2019 09:23:41 +0200
Message-ID: <CAMuHMdWqw-PAUbm9WLJwYecrQxoJ-vN6iOHEL7Jwx_H9d_LdBg@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] rcar-vin: Do not call pm_runtime_{resume,suspend}()
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

On Thu, May 16, 2019 at 3:46 AM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The driver does not implement runtime resume and suspend function so
> there is little point in trying to call them. This is a leftover from
> the drivers soc_camera beginnings.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index 7cbdcbf9b090c638..b821ea01786eb1ff 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -798,9 +798,6 @@ static int rvin_initialize_device(struct file *file)
>                 return ret;
>
>         pm_runtime_enable(&vin->vdev.dev);
> -       ret = pm_runtime_resume(&vin->vdev.dev);

Please pardon my ignorance, but which device is vin->vdev.dev?
Who calls pm_runtime_get_sync() on it, and where?

I see this function calls rvin_power_on(vin->v4l2_dev.dev) (before the
call to pm_runtime_enable()), but presumably that's a different device?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
