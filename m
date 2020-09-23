Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A130275263
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 09:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbgIWHmg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Sep 2020 03:42:36 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:42590 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726557AbgIWHmg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Sep 2020 03:42:36 -0400
Received: by mail-oi1-f193.google.com with SMTP id x14so24062472oic.9;
        Wed, 23 Sep 2020 00:42:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mKWSWgxWlRUy1lzOGZ7jsSiyToKIhdB15CbpQx1G0OU=;
        b=TGb7l7md8Wf4Z7KRf+UATbFMf4efuegbwy/IfLW5FDCpxRqWK5euJcKtK4tE41iYHl
         vQi3kEUsCRn9TDS53VWuCM7kVzFBInHW8/ewdPF0aE7WE9bsqpNo9WpVwM4dPVG2TwO+
         D//PVrvWVHKbbfGn5SjEaXHrilOvKTw1brX0YGsniigEVHWFV5FRXko/U6mNBP6zNAkm
         KSqEylnfYEvp+X2fm5QCLh4wVywll6W4esSy2Nb2y631Cmj0/asQbkLI9n2i97AgkpjJ
         2Ddfvyx379JG/DMP2seirkfj5k5mWXY8Y3rqlbx6yXjEbjRaMcKqIRXxrVMb81I5J8gF
         JZBw==
X-Gm-Message-State: AOAM532mNaL/jUp3h3C9dIfM8kCc9O0Qng8Aze8FE+/rTzmndx0jZ/SD
        MsSjXKr+05fQORT+HF8GAz36FOClOVFmfrwKPvw=
X-Google-Smtp-Source: ABdhPJxzDqaC0Fh9HsqJNLdOYO26v9/SPH6bb4HyjeJgfB0ahqHcBzuH8cthRHeNZKpUX/IppXpk+IaFN3qACzUnuWA=
X-Received: by 2002:aca:4441:: with SMTP id r62mr4701385oia.153.1600846955359;
 Wed, 23 Sep 2020 00:42:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200922155210.242536-1-kieran.bingham+renesas@ideasonboard.com> <20200922155210.242536-2-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20200922155210.242536-2-kieran.bingham+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Sep 2020 09:42:24 +0200
Message-ID: <CAMuHMdXv1JRoBTT=XL+q=jwOPnTPYRZMp8pk+_M0WOGofFf0dg@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: i2c: max9286: Use unsigned constants
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Tue, Sep 22, 2020 at 5:52 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> Convert the bitfield definitions to use unsigned integers.
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -31,85 +31,85 @@
>  #include <media/v4l2-subdev.h>
>
>  /* Register 0x00 */
> -#define MAX9286_MSTLINKSEL_AUTO                (7 << 5)
> +#define MAX9286_MSTLINKSEL_AUTO                (7U << 5)

While using this format for multi-bit fields makes sense...

>  #define MAX9286_MSTLINKSEL(n)          ((n) << 5)
>  #define MAX9286_EN_VS_GEN              BIT(4)
> -#define MAX9286_LINKEN(n)              (1 << (n))
> +#define MAX9286_LINKEN(n)              (1U << (n))

... I think single-bit fields (more below) make better use of the BIT() macro.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
