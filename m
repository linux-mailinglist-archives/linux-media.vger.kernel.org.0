Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3056052B6A4
	for <lists+linux-media@lfdr.de>; Wed, 18 May 2022 12:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234248AbiERJdD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 May 2022 05:33:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234170AbiERJdC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 May 2022 05:33:02 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E102AE252
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 02:33:00 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-e93bbb54f9so1863291fac.12
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 02:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=krPY8N65wwY6pryVL6r2n7Mfx5FGZbEhzjsbC8EIkc8=;
        b=FN1lvIRSK/HazZcWkoPI0skfvR3zYzUx0Fzg+rq0ETRLMjb8mciuKJntK4JBo3SqOE
         Qu30xhD2aPhjYg72Mdv0Gg86wTtPzI9uAXbZ+G1rKhdcen//J317uNv358Nv+CBws9bm
         I8uFas/qgyfXrVLomrjCexkeP9Yrotebb/da4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=krPY8N65wwY6pryVL6r2n7Mfx5FGZbEhzjsbC8EIkc8=;
        b=uzTHEUG8gt+VCf/dgmWd+JJ6/RV5mkfEbJoZGGqI8GJNAWmLoS2PDrqNO2k5MOfwk5
         NojMs07XMk5+A8X4LH0F05acUN4axaqBPGQtj1vspukjieG4Rt3HxMoaUVBG5ADL6vW0
         qgdq0IagbHbxZLKrtJBOX1W/VZ2P1Fl47lL5bt7QTv8OBFd+xUeIt9QccrSCqzsJv+sZ
         dOi5Ivl0gcp94HolsOqDaU40TF+t1do/o62TV5UQR49/sTuvKlR/F8I7j+62xKh/fweD
         E7wAZf/21aePCnk5JH8jW1lx9vdECkShKXeuOVs1kt/OBvV9nZAv4ex8BRVu5RCAfETD
         lVQA==
X-Gm-Message-State: AOAM533xAgqjBZsVfPW4v1V0pDEHGVL2MfJEL6yqMkbNkNPfYitB2BB/
        SCUuLmGfw3AR3ZYMI+9bzo8Csaabjp1Dzg==
X-Google-Smtp-Source: ABdhPJzF5x78N/1/ClXC/eUy097jeaUHl3zoBwVGH4CgXmzVjxwqahx1EOfWu7UxZR4+nXzvYljn4g==
X-Received: by 2002:a05:6870:6087:b0:e1:dc8b:56ba with SMTP id t7-20020a056870608700b000e1dc8b56bamr14491575oae.22.1652866378473;
        Wed, 18 May 2022 02:32:58 -0700 (PDT)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com. [209.85.160.53])
        by smtp.gmail.com with ESMTPSA id f2-20020aca3802000000b00324f24e623fsm658349oia.3.2022.05.18.02.32.57
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 May 2022 02:32:58 -0700 (PDT)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-f17f1acffeso1911480fac.4
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 02:32:57 -0700 (PDT)
X-Received: by 2002:a05:6870:6588:b0:f1:bd94:d3a3 with SMTP id
 fp8-20020a056870658800b000f1bd94d3a3mr4524929oab.66.1652866376915; Wed, 18
 May 2022 02:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <5911870d-e73c-92fc-d89b-fc4da07d0fa8@xs4all.nl>
In-Reply-To: <5911870d-e73c-92fc-d89b-fc4da07d0fa8@xs4all.nl>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 18 May 2022 11:32:46 +0200
X-Gmail-Original-Message-ID: <CANiDSCuM14K-jSdMgG3nd0sqS8VK1i+c4aSk5WS8Q0FooohBUw@mail.gmail.com>
Message-ID: <CANiDSCuM14K-jSdMgG3nd0sqS8VK1i+c4aSk5WS8Q0FooohBUw@mail.gmail.com>
Subject: Re: [PATCHv2] media: stkwebcam: deprecate driver, move to staging
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks!
On Wed, 18 May 2022 at 11:29, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> This is a very old driver for very old hardware and it is one of
> the very few remaining that does not use the vb2 framework (or
> even the older videobuf framework), so deprecate this driver
> and move it to staging with the intent to removing it altogether
> by the end of 2022.
>
> If someone wants to keep this driver, then it has to be converted
> to use vb2.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

> ---
> Changes since v1:
> - Change config name to VIDEO_STKWEBCAM as suggested by Ricardo
> - Mention in the Kconfig that the driver is deprecated.
> ---
>  drivers/media/usb/Kconfig                            |  1 -
>  drivers/media/usb/Makefile                           |  1 -
>  drivers/staging/media/Kconfig                        | 12 +++++++-----
>  drivers/staging/media/Makefile                       |  1 +
>  .../{media/usb => staging/media}/stkwebcam/Kconfig   |  7 +++++--
>  .../{media/usb => staging/media}/stkwebcam/Makefile  |  2 +-
>  drivers/staging/media/stkwebcam/TODO                 | 12 ++++++++++++
>  .../usb => staging/media}/stkwebcam/stk-sensor.c     |  0
>  .../usb => staging/media}/stkwebcam/stk-webcam.c     |  0
>  .../usb => staging/media}/stkwebcam/stk-webcam.h     |  0
>  10 files changed, 26 insertions(+), 10 deletions(-)
>  rename drivers/{media/usb => staging/media}/stkwebcam/Kconfig (69%)
>  rename drivers/{media/usb => staging/media}/stkwebcam/Makefile (63%)
>  create mode 100644 drivers/staging/media/stkwebcam/TODO
>  rename drivers/{media/usb => staging/media}/stkwebcam/stk-sensor.c (100%)
>  rename drivers/{media/usb => staging/media}/stkwebcam/stk-webcam.c (100%)
>  rename drivers/{media/usb => staging/media}/stkwebcam/stk-webcam.h (100%)
>
> diff --git a/drivers/media/usb/Kconfig b/drivers/media/usb/Kconfig
> index 8de08704f8e4..af88e0766388 100644
> --- a/drivers/media/usb/Kconfig
> +++ b/drivers/media/usb/Kconfig
> @@ -17,7 +17,6 @@ source "drivers/media/usb/cpia2/Kconfig"
>  source "drivers/media/usb/gspca/Kconfig"
>  source "drivers/media/usb/pwc/Kconfig"
>  source "drivers/media/usb/s2255/Kconfig"
> -source "drivers/media/usb/stkwebcam/Kconfig"
>  source "drivers/media/usb/usbtv/Kconfig"
>  source "drivers/media/usb/uvc/Kconfig"
>  source "drivers/media/usb/zr364xx/Kconfig"
> diff --git a/drivers/media/usb/Makefile b/drivers/media/usb/Makefile
> index 044bd46c799c..25fa2015b179 100644
> --- a/drivers/media/usb/Makefile
> +++ b/drivers/media/usb/Makefile
> @@ -10,7 +10,6 @@ obj-y += dvb-usb/
>  obj-y += dvb-usb-v2/
>  obj-y += s2255/
>  obj-y += siano/
> -obj-y += stkwebcam/
>  obj-y += ttusb-budget/
>  obj-y += ttusb-dec/
>  obj-y += zr364xx/
> diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
> index 1fd6a0c6e1d8..421ce9dbf44c 100644
> --- a/drivers/staging/media/Kconfig
> +++ b/drivers/staging/media/Kconfig
> @@ -22,10 +22,14 @@ if STAGING_MEDIA && MEDIA_SUPPORT
>  # Please keep them in alphabetic order
>  source "drivers/staging/media/atomisp/Kconfig"
>
> +source "drivers/staging/media/av7110/Kconfig"
> +
>  source "drivers/staging/media/hantro/Kconfig"
>
>  source "drivers/staging/media/imx/Kconfig"
>
> +source "drivers/staging/media/ipu3/Kconfig"
> +
>  source "drivers/staging/media/max96712/Kconfig"
>
>  source "drivers/staging/media/meson/vdec/Kconfig"
> @@ -34,14 +38,12 @@ source "drivers/staging/media/omap4iss/Kconfig"
>
>  source "drivers/staging/media/rkvdec/Kconfig"
>
> -source "drivers/staging/media/sunxi/Kconfig"
> +source "drivers/staging/media/stkwebcam/Kconfig"
>
> -source "drivers/staging/media/zoran/Kconfig"
> +source "drivers/staging/media/sunxi/Kconfig"
>
>  source "drivers/staging/media/tegra-video/Kconfig"
>
> -source "drivers/staging/media/ipu3/Kconfig"
> -
> -source "drivers/staging/media/av7110/Kconfig"
> +source "drivers/staging/media/zoran/Kconfig"
>
>  endif
> diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
> index 66d6f6d51c86..950e96f10aad 100644
> --- a/drivers/staging/media/Makefile
> +++ b/drivers/staging/media/Makefile
> @@ -5,6 +5,7 @@ obj-$(CONFIG_VIDEO_MAX96712)    += max96712/
>  obj-$(CONFIG_VIDEO_MESON_VDEC) += meson/vdec/
>  obj-$(CONFIG_VIDEO_OMAP4)      += omap4iss/
>  obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC)      += rkvdec/
> +obj-$(CONFIG_VIDEO_STKWEBCAM)  += stkwebcam/
>  obj-$(CONFIG_VIDEO_SUNXI)      += sunxi/
>  obj-$(CONFIG_VIDEO_TEGRA)      += tegra-video/
>  obj-$(CONFIG_VIDEO_HANTRO)     += hantro/
> diff --git a/drivers/media/usb/stkwebcam/Kconfig b/drivers/staging/media/stkwebcam/Kconfig
> similarity index 69%
> rename from drivers/media/usb/stkwebcam/Kconfig
> rename to drivers/staging/media/stkwebcam/Kconfig
> index d94d023f1aa0..e0d7e1227bb4 100644
> --- a/drivers/media/usb/stkwebcam/Kconfig
> +++ b/drivers/staging/media/stkwebcam/Kconfig
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -config USB_STKWEBCAM
> -       tristate "USB Syntek DC1125 Camera support"
> +config VIDEO_STKWEBCAM
> +       tristate "USB Syntek DC1125 Camera support (DEPRECATED)"
>         depends on VIDEO_DEV
>         help
>           Say Y here if you want to use this type of camera.
> @@ -9,6 +9,9 @@ config USB_STKWEBCAM
>           may be supported by the stk11xx driver, from which this is
>           derived, see <http://sourceforge.net/projects/syntekdriver/>
>
> +         This driver is deprecated and is scheduled for removal by
> +         the end of 2022. See the TODO file for more information.
> +
>           To compile this driver as a module, choose M here: the
>           module will be called stkwebcam.
>
> diff --git a/drivers/media/usb/stkwebcam/Makefile b/drivers/staging/media/stkwebcam/Makefile
> similarity index 63%
> rename from drivers/media/usb/stkwebcam/Makefile
> rename to drivers/staging/media/stkwebcam/Makefile
> index daa9ae6d48c2..17ad7b6f43d0 100644
> --- a/drivers/media/usb/stkwebcam/Makefile
> +++ b/drivers/staging/media/stkwebcam/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  stkwebcam-objs :=      stk-webcam.o stk-sensor.o
>
> -obj-$(CONFIG_USB_STKWEBCAM)     += stkwebcam.o
> +obj-$(CONFIG_VIDEO_STKWEBCAM)     += stkwebcam.o
>
> diff --git a/drivers/staging/media/stkwebcam/TODO b/drivers/staging/media/stkwebcam/TODO
> new file mode 100644
> index 000000000000..735304a72729
> --- /dev/null
> +++ b/drivers/staging/media/stkwebcam/TODO
> @@ -0,0 +1,12 @@
> +This is a very old driver for very old hardware (specifically
> +laptops that use this sensor). In addition according to reports
> +the picture quality is quite bad.
> +
> +This is also one of the few drivers still not using the vb2
> +framework (or even the old videobuf framework!), so this driver
> +is now deprecated with the intent of removing it altogether by
> +the end of 2022.
> +
> +In order to keep this driver it has to be converted to vb2.
> +If someone is interested in doing this work, then contact the
> +linux-media mailinglist (https://linuxtv.org/lists.php).
> diff --git a/drivers/media/usb/stkwebcam/stk-sensor.c b/drivers/staging/media/stkwebcam/stk-sensor.c
> similarity index 100%
> rename from drivers/media/usb/stkwebcam/stk-sensor.c
> rename to drivers/staging/media/stkwebcam/stk-sensor.c
> diff --git a/drivers/media/usb/stkwebcam/stk-webcam.c b/drivers/staging/media/stkwebcam/stk-webcam.c
> similarity index 100%
> rename from drivers/media/usb/stkwebcam/stk-webcam.c
> rename to drivers/staging/media/stkwebcam/stk-webcam.c
> diff --git a/drivers/media/usb/stkwebcam/stk-webcam.h b/drivers/staging/media/stkwebcam/stk-webcam.h
> similarity index 100%
> rename from drivers/media/usb/stkwebcam/stk-webcam.h
> rename to drivers/staging/media/stkwebcam/stk-webcam.h
> --
> 2.34.1
>


-- 
Ricardo Ribalda
