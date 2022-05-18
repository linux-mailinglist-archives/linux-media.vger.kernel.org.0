Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA14B52B5FA
	for <lists+linux-media@lfdr.de>; Wed, 18 May 2022 11:29:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233761AbiERJGb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 May 2022 05:06:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233672AbiERJGb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 May 2022 05:06:31 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BC9ECF9
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 02:06:28 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-f189b07f57so1868723fac.1
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 02:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/YHaE8sxvTLn0LLpthl5UH9EngWXU8I+H2tE2vRvC64=;
        b=NmG1+lk/jZ8C6owjO4ka/3V1tGbId7LQ5eNKThBfD1nfNaUr5vDwxrCCOraTrjxaCR
         vZKT4NVVj2eYOqwCgW89B4FfTZivn9IewNqqUzuxsgusLv/Nhm8DmT4g0q9RIXgF1QXn
         LV1fMQ5KWP7mko3PyETXyFaRufuR8vdcwDS9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/YHaE8sxvTLn0LLpthl5UH9EngWXU8I+H2tE2vRvC64=;
        b=09jGOB1diUAUwwmwG7IvcHDLxAuam/ajhDi9EeZPhDSgb53E8U/a2zUrYRLWVItAFW
         LhZoF32gRx329aC2Wp8ad7GxpifiRkUkZVisjmVXYq6vRsCE6j/4JaReAcBOBU9Czd/C
         T9kNSYOJRPp8Xuy1cVysVG/wj07eYLUXMrVSMoZNiuXB1Nau59/UNcTtmOLoBoNVWdLp
         G+LVt2aZuFz396iijuQOTyvML6gtLfuR53QCwqhfuRkjjd6/fjOwzd63o/D0o64P80Jg
         VPv9a/JUV0O+vGG0lli33mkmPjDJsy7cpIVS6xmGTfy5r5/aksZHJiFzvqOYDuzJ+h5K
         2WTg==
X-Gm-Message-State: AOAM530Jn3jnAyIpxaxfKuq7vxTcyyqVKBI327KDi7jzJBo1lzaYgmRQ
        iRzKDmRSVarxFtZA502d/Qf13JctibJMYQ==
X-Google-Smtp-Source: ABdhPJzdYC66DI/8bYl0hc66yM1GFHjOtXGA/J81eGckRLFAI1sjA0DIym0muGASEynKv+FSv9hkVw==
X-Received: by 2002:a05:6870:c683:b0:ed:efb9:ffe9 with SMTP id cv3-20020a056870c68300b000edefb9ffe9mr14858775oab.241.1652864787084;
        Wed, 18 May 2022 02:06:27 -0700 (PDT)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com. [209.85.160.46])
        by smtp.gmail.com with ESMTPSA id x3-20020a056870740300b000e686d1389csm666081oam.54.2022.05.18.02.06.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 May 2022 02:06:26 -0700 (PDT)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-e656032735so1907606fac.0
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 02:06:26 -0700 (PDT)
X-Received: by 2002:a05:6870:6588:b0:f1:bd94:d3a3 with SMTP id
 fp8-20020a056870658800b000f1bd94d3a3mr4464345oab.66.1652864785572; Wed, 18
 May 2022 02:06:25 -0700 (PDT)
MIME-Version: 1.0
References: <e0227850-f54d-3ee9-78f2-1af7cccb0f8c@xs4all.nl>
In-Reply-To: <e0227850-f54d-3ee9-78f2-1af7cccb0f8c@xs4all.nl>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 18 May 2022 11:06:14 +0200
X-Gmail-Original-Message-ID: <CANiDSCto5pLGzcgBqg0hkUS5GETGE-HG+6_GqGfV8Or-VULaDw@mail.gmail.com>
Message-ID: <CANiDSCto5pLGzcgBqg0hkUS5GETGE-HG+6_GqGfV8Or-VULaDw@mail.gmail.com>
Subject: Re: [PATCH] media: stkwebcam: deprecate driver, move to staging
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

Hi Hans

On Wed, 18 May 2022 at 10:00, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> This is a very old driver for very old hardware and it is one of
> the very few remaining that does not use the vb2 framework (or
> even the older videobuf framework), so deprecate this driver
> and move it to staging with the intent to removing it altogether
> by the end of 2022.
>
> If someone wants to keep this driver, then it has to be converted
> to use vb2.

Would it make sense to change the name of the Kconfig name?

That way the users would have to actively do something to keep using
the driver during the depreciation process.

Otherwise there is the risk that the deprecation is unnoticed, and
when we remove the driver it would be too late?




>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/usb/Kconfig                            |  1 -
>  drivers/media/usb/Makefile                           |  1 -
>  drivers/staging/media/Kconfig                        | 12 +++++++-----
>  drivers/staging/media/Makefile                       |  1 +
>  .../{media/usb => staging/media}/stkwebcam/Kconfig   |  0
>  .../{media/usb => staging/media}/stkwebcam/Makefile  |  0
>  drivers/staging/media/stkwebcam/TODO                 | 12 ++++++++++++
>  .../usb => staging/media}/stkwebcam/stk-sensor.c     |  0
>  .../usb => staging/media}/stkwebcam/stk-webcam.c     |  0
>  .../usb => staging/media}/stkwebcam/stk-webcam.h     |  0
>  10 files changed, 20 insertions(+), 7 deletions(-)
>  rename drivers/{media/usb => staging/media}/stkwebcam/Kconfig (100%)
>  rename drivers/{media/usb => staging/media}/stkwebcam/Makefile (100%)
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
> index 66d6f6d51c86..59eddc857184 100644
> --- a/drivers/staging/media/Makefile
> +++ b/drivers/staging/media/Makefile
> @@ -5,6 +5,7 @@ obj-$(CONFIG_VIDEO_MAX96712)    += max96712/
>  obj-$(CONFIG_VIDEO_MESON_VDEC) += meson/vdec/
>  obj-$(CONFIG_VIDEO_OMAP4)      += omap4iss/
>  obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC)      += rkvdec/
> +obj-$(CONFIG_USB_STKWEBCAM)    += stkwebcam/
>  obj-$(CONFIG_VIDEO_SUNXI)      += sunxi/
>  obj-$(CONFIG_VIDEO_TEGRA)      += tegra-video/
>  obj-$(CONFIG_VIDEO_HANTRO)     += hantro/
> diff --git a/drivers/media/usb/stkwebcam/Kconfig b/drivers/staging/media/stkwebcam/Kconfig
> similarity index 100%
> rename from drivers/media/usb/stkwebcam/Kconfig
> rename to drivers/staging/media/stkwebcam/Kconfig
> diff --git a/drivers/media/usb/stkwebcam/Makefile b/drivers/staging/media/stkwebcam/Makefile
> similarity index 100%
> rename from drivers/media/usb/stkwebcam/Makefile
> rename to drivers/staging/media/stkwebcam/Makefile
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
