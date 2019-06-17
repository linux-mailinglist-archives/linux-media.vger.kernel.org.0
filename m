Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95140482B7
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 14:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbfFQMlE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 08:41:04 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43097 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbfFQMlE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 08:41:04 -0400
Received: by mail-wr1-f68.google.com with SMTP id p13so9757359wru.10
        for <linux-media@vger.kernel.org>; Mon, 17 Jun 2019 05:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WOOxpm7ozZave7X/hBH3gYwbNXHHvhxtj5pINcFfpmM=;
        b=gzjXdC3SyBjROxKdZINhmdO+YOBW7w31ZU3bhz19+zQh6bKN9So0wH9jBV6ITP3QUn
         ++GtUH3piNFnSVVsYe0do04ZpfDbpYv26fFZeVjgXw4FxfZMuesrcH65TQFpGFp8T2Mp
         WjsMvhOjYwEJgwznc9B2blDBrgh5Im/R0KZukg1QIvyOQ6bKIAIomK2vt2EHNT694ecI
         Ki1oy53r5lVNwvL9uYiGc8r3yraGmX7LD06ibLUeaFxuzIjDYoAPXMzGUibsgvm4o1gH
         I+5Fztidy7Qtl2+7beYTnPuFR0ckvioG+IkKs0zm660+0nvPLoG7vkjcvr9q3kD4cMfL
         tFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WOOxpm7ozZave7X/hBH3gYwbNXHHvhxtj5pINcFfpmM=;
        b=ps8cavANpGlFigET2QPVxFkH6TbkN1e/G1qDeI2hgEcUAtX4sxhZzsBw0OYsYi+E6s
         LeSYfifpIDeG749gJ8mk0qYogMnKGcKq8Rjt25hf0Uohn1j5hAGmGs8X0n9dJ1m7GhYj
         KeV/OppNL6T9qFOfY3pFGdEBO9wuoNma/D8Q+0Nt36hhdFNmZrf364YYQ3q4p56XQep4
         OW7dtdi37WBw2tS3fLiw2Tz8QGys9WjKM6rEk7pUSPT47KWR+iTGbDs8O2LQY9uvT/wW
         MqSdm0cncsjdIeZqIbxWLmkMJovgakWDXAixFlFASsTA9qwLhd3oxnxKbHU71a8DnfHS
         BsKQ==
X-Gm-Message-State: APjAAAXyuuS+Qu7JbcgsYUcPNUV7Yyg9sDmP/y5/Gt7Zf1jKRTkZns51
        ZFC61f7IYebzvYhca97qCFR36WhknMYQPAyktFbIjw==
X-Google-Smtp-Source: APXvYqzpuPnI+gsxO4zp+HzWS3tA15wt/2tfOqTOkMZ8lgfnUBjUyQc5aSZTXucpdJWE7KyO86xEbW+pmWZ5wCwQiQ0=
X-Received: by 2002:a5d:4ec1:: with SMTP id s1mr23708512wrv.19.1560775262236;
 Mon, 17 Jun 2019 05:41:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190617111718.2277220-1-arnd@arndb.de>
In-Reply-To: <20190617111718.2277220-1-arnd@arndb.de>
From:   Maxime Jourdan <mjourdan@baylibre.com>
Date:   Mon, 17 Jun 2019 14:40:51 +0200
Message-ID: <CAMO6nazK5uo3deCqKEAGqB4TfEp9W1u2bkWaMNg_DMtSw=E2YQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: meson: include linux/kthread.h
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@lists.freedesktop.org,
        linux-amlogic@lists.infradead.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Arnd,
On Mon, Jun 17, 2019 at 1:17 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> Without this header, we get a compilation error in some configurations:
>
> drivers/staging/media/meson/vdec/vdec.c: In function 'vdec_recycle_thread':
> drivers/staging/media/meson/vdec/vdec.c:59:10: error: implicit declaration of function 'kthread_should_stop' [-Werror=implicit-function-declaration]
>
> Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/staging/media/meson/vdec/vdec.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
> index 0a1a04fd5d13..eb335a0f2bdd 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -8,6 +8,7 @@
>  #include <linux/clk.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> +#include <linux/kthread.h>
>  #include <linux/platform_device.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/slab.h>
> --
> 2.20.0
>

Thanks for the patch, a similar one has already been sent by Yue
Haibing and is sitting in media/master at the moment [0]. My apologies
for this oversight.

Regards,
Maxime

[0] https://git.linuxtv.org/media_tree.git/commit/?id=3510c68d32bf3a188c077b5fb87339379f4e6b43
