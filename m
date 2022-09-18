Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7877D5BBDF1
	for <lists+linux-media@lfdr.de>; Sun, 18 Sep 2022 15:17:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbiIRNRS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Sep 2022 09:17:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiIRNRR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Sep 2022 09:17:17 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60C271DA5D
        for <linux-media@vger.kernel.org>; Sun, 18 Sep 2022 06:17:16 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id q21so37641367edc.9
        for <linux-media@vger.kernel.org>; Sun, 18 Sep 2022 06:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=8+qs4386X43FVfeXZCSBca3w4VSSVj/phSWUTpkmw6A=;
        b=bGKZK7zsZOC9iD90oYZdsAeOqRY5nk3q57ZASJ6Otr0J9w+uWOaFVCubO6HwFITq21
         i7cy1WxAMJRcRD/wuGNkVxUF5JO/l+dDT4TPz3buekwGbj2S9HBIR6FPamqI9FTJE9oJ
         MuvwwHTyisZS/awjrQVZ9vCSZkQu2fotufDgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=8+qs4386X43FVfeXZCSBca3w4VSSVj/phSWUTpkmw6A=;
        b=e5O7ue7PEMlsxGl6N7KVzbFmKd91PxYHNEIebWEg7upwJjO5LQlFU+s9sj1x+ey+aN
         3/E6af9YlUjBLTYPgIMubSKE8e2XjiqlCwbe0F5e+dky+WZEFsw21Qfk/51B6nRFuPGB
         E0EgegqJpErB3Iw7C/hFhrjlr9NL2/p8CZpxjOniGzwO5KiWNdUAB7Xm37apAsKnUESS
         efFAEU4/GCqlSq0icSj9BqolOxzehkCWeLWjXnIkw/lNcEM8/5kip5GNSL1AohhIfq2m
         0dUJFau2EPZ0c4T+F5Y1PA2VWx6gl62wHN/fTcEFzJiS4MQiET93MSjXVH1esmyumNU0
         iDkw==
X-Gm-Message-State: ACrzQf1t6dCOLkfFVlylyzmVm7zE4la2FIXVp8DHMJCU9oo0c95AUzzd
        HjWuoQ6I7bwHC64QJZzQ1ZhU2+yGJ82VGQ==
X-Google-Smtp-Source: AMsMyM4R5MSd8l8TYxkiZ15/SolW3+nQZOsFC8+fDJ1ugTWPr7UEoaFGbqTQeYxURpOWm+wocyxk5g==
X-Received: by 2002:aa7:dc13:0:b0:443:3f15:8440 with SMTP id b19-20020aa7dc13000000b004433f158440mr11387794edu.274.1663507034927;
        Sun, 18 Sep 2022 06:17:14 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id l3-20020a056402344300b0044604ad8b41sm17950295edc.23.2022.09.18.06.17.12
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Sep 2022 06:17:13 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id dv25so58792605ejb.12
        for <linux-media@vger.kernel.org>; Sun, 18 Sep 2022 06:17:12 -0700 (PDT)
X-Received: by 2002:a17:907:3f93:b0:780:1b17:1160 with SMTP id
 hr19-20020a1709073f9300b007801b171160mr9652663ejc.196.1663507032137; Sun, 18
 Sep 2022 06:17:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220915150324.688062-1-yangyingliang@huawei.com> <20220915150324.688062-14-yangyingliang@huawei.com>
In-Reply-To: <20220915150324.688062-14-yangyingliang@huawei.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Sun, 18 Sep 2022 14:16:58 +0100
X-Gmail-Original-Message-ID: <CANiDSCsC4Vtwq3NxXazoef7CvnOVG_=nVJtZn3TYT05RvY43Ow@mail.gmail.com>
Message-ID: <CANiDSCsC4Vtwq3NxXazoef7CvnOVG_=nVJtZn3TYT05RvY43Ow@mail.gmail.com>
Subject: Re: [PATCH -next 13/13] media: uvcvideo: Switch to use
 dev_err_probe() helper
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, pavel@ucw.cz,
        sakari.ailus@linux.intel.com, sean@mess.org,
        laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 15 Sept 2022 at 16:05, Yang Yingliang <yangyingliang@huawei.com> wrote:
>
> In the probe path, dev_err() can be replace with dev_err_probe()
> which will check if error code is -EPROBE_DEFER.
>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 744051b52e12..94f84c3c4712 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1554,12 +1554,9 @@ static int uvc_gpio_parse(struct uvc_device *dev)
>                 return PTR_ERR_OR_ZERO(gpio_privacy);
>
>         irq = gpiod_to_irq(gpio_privacy);
> -       if (irq < 0) {
> -               if (irq != EPROBE_DEFER)
> -                       dev_err(&dev->udev->dev,
> -                               "No IRQ for privacy GPIO (%d)\n", irq);
> -               return irq;
> -       }
> +       if (irq < 0)
> +               return dev_err_probe(&dev->udev->dev, irq,
> +                                    "No IRQ for privacy GPIO\n");
>
>         unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
>         if (!unit)
> --
> 2.25.1
>


-- 
Ricardo Ribalda
