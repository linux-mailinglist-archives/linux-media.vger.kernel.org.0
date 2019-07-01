Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BFF55B6C2
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 10:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727883AbfGAIZj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 04:25:39 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:43603 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727124AbfGAIZi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 04:25:38 -0400
Received: by mail-oi1-f194.google.com with SMTP id w79so9275865oif.10;
        Mon, 01 Jul 2019 01:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ym5J0gHrzU1eWCK3FfxSZBqLOjejvpidzKKQjL50u94=;
        b=lrFMLxnOPq9Gb4mDjYntgsL52S+LiOMwxA+1CiKwpqm4bkAWQubeuEmTZpgocpqb1O
         RAcp9m/7a0j4QRvd0YAw38RKxvt/1oTVBpg1e4CJhVXm8HQaub6o2PBzn/ulBOMj22Rx
         CkzVm+UvtSCDVNLF7ZzqHa9sNj0fafonaOsqFucDJPC6m3a42lqKMfIC1vWzEFOE59VS
         CeyNiVYUsDAlSknBKDNFEfihY3tvpvide7MUlvcLOdZXw7uygqo0Taos7eVX0O2+ZmpK
         Q50V+aszXieivGJH8paa5nh8T95E+br14g5T+ucz4JGmUF23vUMJXugn/SVcmxeiqDfw
         afDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ym5J0gHrzU1eWCK3FfxSZBqLOjejvpidzKKQjL50u94=;
        b=bP0VWhGFUMDGMk3ss/EiWbwJq80PASMSdhLrPmg/1SDVgNKuELqT5m0d6JATUDMXbW
         6nyxRJ9w5aDKN2SztCS8SQGZ/ssIhwj52lGwvDQyz7zR+389rpb7UbRh17odo9s7RZkx
         RixJ1t3bLyL03Z8WCYG3nHAYN+MVGcTzgB2hRE/+ttgztILEjFHMcSejS6goSlj5Ws7a
         0ttuFi/3hePaWLNr6MI+XXmnyL8XfQaJKBG16ipLVcDZ0jhU6D+onL4RCxbPmczZcx0/
         6bYrXHEMfzebePJn0Gb0c28r6mXYflnft48J4mL+famiF4c6RfjLl7EHaP9tOx5SQNop
         Fl1g==
X-Gm-Message-State: APjAAAUhTYGKznqaXYfXBpCPB6T5zb5+CHbcBj7AVaj11zTKiVvwN/fZ
        sx7WmiyHezXjVTRt3YxS245bc1B6+y9omjrpzE0=
X-Google-Smtp-Source: APXvYqxeodXSxesbEQ96QbUQET7l2bQnzyKbxYSjLJV6c1xtLUMOy0COHZ8cHF5Dpw+SxIReWGDUZpFyqCz5TXzs5Ss=
X-Received: by 2002:aca:f08a:: with SMTP id o132mr5877714oih.101.1561969537943;
 Mon, 01 Jul 2019 01:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190628105131.3130257-1-arnd@arndb.de>
In-Reply-To: <20190628105131.3130257-1-arnd@arndb.de>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 1 Jul 2019 09:25:11 +0100
Message-ID: <CA+V-a8s5FtLik_BKhWPuG=JywN64kN7cM1vbyx+-EbrrVdjmsA@mail.gmail.com>
Subject: Re: [PATCH] media: davinci-vpbe: remove obsolete includes
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        LAK <linux-arm-kernel@lists.infradead.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arnd,

Thank you for the patch.

On Fri, Jun 28, 2019 at 11:51 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> The driver builds fine without these, and they cause build
> problems once davinci multiplatform support is enabled.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/media/platform/davinci/vpbe_display.c | 4 ----
>  drivers/media/platform/davinci/vpbe_osd.c     | 5 -----
>  drivers/media/platform/davinci/vpbe_venc.c    | 5 -----
>  3 files changed, 14 deletions(-)
>

Acked-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
--Prabhakar Lad

> diff --git a/drivers/media/platform/davinci/vpbe_display.c b/drivers/media/platform/davinci/vpbe_display.c
> index 000b191c42d8..18f9408013d1 100644
> --- a/drivers/media/platform/davinci/vpbe_display.c
> +++ b/drivers/media/platform/davinci/vpbe_display.c
> @@ -19,10 +19,6 @@
>
>  #include <asm/pgtable.h>
>
> -#ifdef CONFIG_ARCH_DAVINCI
> -#include <mach/cputype.h>
> -#endif
> -
>  #include <media/v4l2-dev.h>
>  #include <media/v4l2-common.h>
>  #include <media/v4l2-ioctl.h>
> diff --git a/drivers/media/platform/davinci/vpbe_osd.c b/drivers/media/platform/davinci/vpbe_osd.c
> index 491842ef33c5..91b571a0ac2c 100644
> --- a/drivers/media/platform/davinci/vpbe_osd.c
> +++ b/drivers/media/platform/davinci/vpbe_osd.c
> @@ -16,11 +16,6 @@
>  #include <linux/clk.h>
>  #include <linux/slab.h>
>
> -#ifdef CONFIG_ARCH_DAVINCI
> -#include <mach/cputype.h>
> -#include <mach/hardware.h>
> -#endif
> -
>  #include <media/davinci/vpss.h>
>  #include <media/v4l2-device.h>
>  #include <media/davinci/vpbe_types.h>
> diff --git a/drivers/media/platform/davinci/vpbe_venc.c b/drivers/media/platform/davinci/vpbe_venc.c
> index 425f91f07165..8caa084e5704 100644
> --- a/drivers/media/platform/davinci/vpbe_venc.c
> +++ b/drivers/media/platform/davinci/vpbe_venc.c
> @@ -14,11 +14,6 @@
>  #include <linux/videodev2.h>
>  #include <linux/slab.h>
>
> -#ifdef CONFIG_ARCH_DAVINCI
> -#include <mach/hardware.h>
> -#include <mach/mux.h>
> -#endif
> -
>  #include <linux/platform_data/i2c-davinci.h>
>
>  #include <linux/io.h>
> --
> 2.20.0
>
