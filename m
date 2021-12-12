Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D81C74719FD
	for <lists+linux-media@lfdr.de>; Sun, 12 Dec 2021 13:25:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbhLLMZh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Dec 2021 07:25:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbhLLMZg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Dec 2021 07:25:36 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96AA1C061714
        for <linux-media@vger.kernel.org>; Sun, 12 Dec 2021 04:25:36 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id h19-20020a9d3e53000000b0056547b797b2so14562354otg.4
        for <linux-media@vger.kernel.org>; Sun, 12 Dec 2021 04:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Pqm3MEzw/SRtYgeO+FRlV/4S62E3FDVXFyeRzA9lmc0=;
        b=ay8OnbLKKlHJYs8GFlVyYWdZMg1+g46qwd44EkxjDzKYWI7sTfIK7ctd4Bta2WjGC5
         GRNICdkvZIraY1uO9vdZn0zALqODSCiZonjbB/hhgdda7ZwCD0Gu8DyqPyi/jZLvETDs
         dgYV2Af83mrZGrxKaTRdgglmpTOY0o9CZ4KaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Pqm3MEzw/SRtYgeO+FRlV/4S62E3FDVXFyeRzA9lmc0=;
        b=ljdvzJG2UhPMDMAW9saz0cJvKcx4Pj32eoNr2ExvavrBXbfqzpthu/0CSUIGbUpIp9
         ZKT5JZsYyhz8cNJSN64OgDNI36CUuoDnTfjNmlfwhvfgGdTpLKzeYyX/F66tP0ozJhht
         dQHEqlc6ePQCLmgzEtRWujofJ+lx3za5fLdyLZlwciLbl01z52Yp9PXtZ6/xVgEZMCMJ
         AqvtZH5vJqi33Oc06Nv1YCKxYLMn4paOwJQN22XFh1CYoHuXK6WR58+GK9i8wUx/KKY5
         KWbZKjTz6FaDknvrFD1jR+LRgcf8dOYYN1SF+tqu15UzBoo62s+jWfecWBsHUXqqx7iZ
         VbUw==
X-Gm-Message-State: AOAM533QF9JVEaLlcyegmOu4T/CKktvDYAhZbVWGZsfmSUFUOHICD0Ex
        Odis28Ymx/JlNLiJyHW8wxRgnJonLiBt4g==
X-Google-Smtp-Source: ABdhPJwFybHUSMwBCXjvrV8mpskx18pkUaVssMqRj4J+D/1iXXkMwiCUcaOie88XCELKqdb3GlBrfg==
X-Received: by 2002:a9d:7d04:: with SMTP id v4mr20827381otn.180.1639311935590;
        Sun, 12 Dec 2021 04:25:35 -0800 (PST)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com. [209.85.167.176])
        by smtp.gmail.com with ESMTPSA id m6sm1618739ooe.24.2021.12.12.04.25.34
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Dec 2021 04:25:35 -0800 (PST)
Received: by mail-oi1-f176.google.com with SMTP id n66so19671327oia.9
        for <linux-media@vger.kernel.org>; Sun, 12 Dec 2021 04:25:34 -0800 (PST)
X-Received: by 2002:a05:6808:12:: with SMTP id u18mr22413735oic.174.1639311934148;
 Sun, 12 Dec 2021 04:25:34 -0800 (PST)
MIME-Version: 1.0
References: <20211212114929.264905-1-jose.exposito89@gmail.com>
In-Reply-To: <20211212114929.264905-1-jose.exposito89@gmail.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Sun, 12 Dec 2021 13:25:23 +0100
X-Gmail-Original-Message-ID: <CANiDSCu==Z6xaFD0hM_gYj5fv+55FPe=rRvW1a7aQZO7p-wt9Q@mail.gmail.com>
Message-ID: <CANiDSCu==Z6xaFD0hM_gYj5fv+55FPe=rRvW1a7aQZO7p-wt9Q@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix memory leak in uvc_gpio_parse
To:     =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jos=C3=A9

Thanks for your patch

On Sun, 12 Dec 2021 at 12:49, Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmai=
l.com> wrote:
>
> Previously the unit buffer was allocated before checking the IRQ for
> privacy GPIO.
> In case of error, the unit buffer was leaked.
>
> Allocate the unit buffer after the IRQ to avoid it.
>
> Addresses-Coverity-ID: 1474639 ("Resource leak")
> Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
Fixes: 2886477ff987 ("media: uvcvideo: Implement UVC_EXT_GPIO_UNIT")
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/u=
vc_driver.c
> index 7c007426e082..9e83e2002710 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1533,10 +1533,6 @@ static int uvc_gpio_parse(struct uvc_device *dev)
>         if (IS_ERR_OR_NULL(gpio_privacy))
>                 return PTR_ERR_OR_ZERO(gpio_privacy);
>
> -       unit =3D uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID=
, 0, 1);
> -       if (!unit)
> -               return -ENOMEM;
> -
>         irq =3D gpiod_to_irq(gpio_privacy);
>         if (irq < 0) {
>                 if (irq !=3D EPROBE_DEFER)
> @@ -1545,6 +1541,10 @@ static int uvc_gpio_parse(struct uvc_device *dev)
>                 return irq;
>         }
>
> +       unit =3D uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID=
, 0, 1);
> +       if (!unit)
> +               return -ENOMEM;
> +
>         unit->gpio.gpio_privacy =3D gpio_privacy;
>         unit->gpio.irq =3D irq;
>         unit->gpio.bControlSize =3D 1;
> --
> 2.25.1
>


--=20
Ricardo Ribalda
