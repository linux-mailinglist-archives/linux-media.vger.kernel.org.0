Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B3BC670A7B
	for <lists+linux-media@lfdr.de>; Tue, 17 Jan 2023 23:01:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjAQWA6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Jan 2023 17:00:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbjAQV7h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Jan 2023 16:59:37 -0500
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32A0639BB4
        for <linux-media@vger.kernel.org>; Tue, 17 Jan 2023 12:32:43 -0800 (PST)
Received: by mail-qt1-f173.google.com with SMTP id d16so15264634qtw.8
        for <linux-media@vger.kernel.org>; Tue, 17 Jan 2023 12:32:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=80XVCGq03uPtsV/B6FIva6jAl8T2rvyiR6KKpMSI6gk=;
        b=lXnknCiDJDeImOg2ynrceci+wBn7VRWiTKtZ5zry3n3LxaXYEe7+//Oe1fD83/RQIn
         HS+YNchNRWtOSLBI/8cVelwy+KekCKssBnZuyJ1t2D6R4TOsF982SgvrPXiLvmNQBnt6
         PTPJAXdghn4sWZ57lkIbcnTFPDgFdx1gXx7227dXgq6kn0RSz5qA6w7oAObJmf+hwjir
         lITX3ljs2KEsk8IW68xM4EHbwvVNXxJC63IVBzUXuJEc7ZoYjnFxHSdj3BbZu45K+bAG
         /G+GpOqikOavNHZ5Pi9c8Pwpg7uUrEj35TvB+fGzkH4/I/nqjtMs8KDAdgJqukZcBxAN
         zLaQ==
X-Gm-Message-State: AFqh2koSoVSpotP0Kc96Tzj8i3mU5AcnwaAJ564+W7SNznovirefyRrc
        +qqf/DktYlm69XIFIPMZ18rfvjNabklpOw==
X-Google-Smtp-Source: AMrXdXtZi2WSBt9Y8EcjsSxfooanhk3hBjMaLlhjN2fNtR4WlSKzRFRQNmUeGMH0hA/Og0hXWUOO+Q==
X-Received: by 2002:a05:622a:4d0e:b0:3b6:32f6:c14d with SMTP id fd14-20020a05622a4d0e00b003b632f6c14dmr10574392qtb.29.1673987562124;
        Tue, 17 Jan 2023 12:32:42 -0800 (PST)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id j25-20020ac874d9000000b003b0b903720esm9572257qtr.13.2023.01.17.12.32.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 12:32:41 -0800 (PST)
Received: by mail-yb1-f176.google.com with SMTP id p188so35617372yba.5
        for <linux-media@vger.kernel.org>; Tue, 17 Jan 2023 12:32:41 -0800 (PST)
X-Received: by 2002:a25:9801:0:b0:7d5:b884:3617 with SMTP id
 a1-20020a259801000000b007d5b8843617mr449162ybo.380.1673987561135; Tue, 17 Jan
 2023 12:32:41 -0800 (PST)
MIME-Version: 1.0
References: <20221226094820.1157244-1-cuigaosheng1@huawei.com>
In-Reply-To: <20221226094820.1157244-1-cuigaosheng1@huawei.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Jan 2023 21:32:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVT1d1V78o5fTiEP5RmbYCNqpKJR_1A7e_RJABA1STpYQ@mail.gmail.com>
Message-ID: <CAMuHMdVT1d1V78o5fTiEP5RmbYCNqpKJR_1A7e_RJABA1STpYQ@mail.gmail.com>
Subject: Re: [PATCH -next] media: staging: stkwebcam: Fix the build error with stkwebcam
To:     Gaosheng Cui <cuigaosheng1@huawei.com>
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        hverkuil-cisco@xs4all.nl, ribalda@chromium.org,
        neil.armstrong@linaro.org, geert+renesas@glider.be,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Gaosheng,

On Mon, Dec 26, 2022 at 10:48 AM Gaosheng Cui <cuigaosheng1@huawei.com> wrote:
> When I am building the kernel on arm64, set config CONFIG_USB=m &&
> CONFIG_VIDEO_STKWEBCAM=y, I get some error reports as follows:
>   drivers/staging/media/deprecated/stkwebcam/stk-webcam.o: In
>     function `stk_v4l_dev_release':
>   stk-webcam.c:(.text+0x3e0): undefined reference to `usb_put_intf'
>   stk-webcam.c:(.text+0x3e8): undefined reference to `usb_put_dev'
>   drivers/staging/media/deprecated/stkwebcam/stk-webcam.o: In
>   function `stk_clean_iso':
>   stk-webcam.c:(.text+0xb0c): undefined reference to `usb_kill_urb'
>   stk-webcam.c:(.text+0xb14): undefined reference to `usb_free_urb'
>
> Fix it by add dependency option on USB for VIDEO_STKWEBCAM.
>
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>

Thanks for your patch!

> --- a/drivers/staging/media/deprecated/stkwebcam/Kconfig
> +++ b/drivers/staging/media/deprecated/stkwebcam/Kconfig
> @@ -2,7 +2,7 @@
>  config VIDEO_STKWEBCAM
>         tristate "USB Syntek DC1125 Camera support (DEPRECATED)"
>         depends on VIDEO_DEV
> -       depends on MEDIA_USB_SUPPORT && MEDIA_CAMERA_SUPPORT
> +       depends on USB && MEDIA_USB_SUPPORT && MEDIA_CAMERA_SUPPORT
>         help
>           Say Y here if you want to use this type of camera.
>           Supported devices are typically found in some Asus laptops,

I think Arnd's patch[1] is better, as it also fixes the modular
MEDIA_SUPPORT case.

[1] "[PATCH] staging: media: stkwebcam: add USB dependency"
    https://lore.kernel.org/all/20230117165851.2300111-1-arnd@kernel.org
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
