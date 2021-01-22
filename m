Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3FF33000DC
	for <lists+linux-media@lfdr.de>; Fri, 22 Jan 2021 11:57:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbhAVJ1M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 04:27:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727153AbhAVJZj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 04:25:39 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61749C061794
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 01:24:59 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id q20so3305345pfu.8
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 01:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=24qYr+2bWI8aLnsdvbATgckogrncguwhYuFu+3hLpIY=;
        b=CagXyBqkHxAy7WckbNXfql3mLxnuYqyVhekBin+ZEXSPbo28HXUWZ1L8LxVVbh0D3V
         SyGp+obAdRY1UhOdGvcdjjM4mk+U4qmVp8HSYIvAcdl7a2YzJw9wTGhiooG6XsTdh6qr
         CC5KoGzP+cMKCCdbupWFbOU1gLaekS0jArsX+Wg7vJolxhOvaE4V6g8VkrAY7dRSKz+1
         yHCqqPdpNa92LyrS/LjWqhPcwnMextXSWkD0wLeKdEUuRSC6gNU7kJO9UV9mxpNoD5W1
         Y+XUOc5QleN37mwQO4TWZMvMcvTXEV9xIqsBrzfFA+kmDgvdgmHbQmEED0Vs+tyyJ4c4
         BDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=24qYr+2bWI8aLnsdvbATgckogrncguwhYuFu+3hLpIY=;
        b=nZbybigR9Eu1R5gi0krW18s3DiLyM67XLcEEO2zxpZ1LXR4cc/JMoJwPquXqyLtAz6
         rlhtfSkNDNxgbSh900yTWY9L7EMeZJtgXLFEcRmZSwC3LVb1HXC3HennVS5onsRvFlGI
         mfFteo1ElgiRbBN+6yuv4Vg12Xil9YG1C5Wo5eunqWslwCjr6Rjix3kp/K+YlG7WTTJi
         ndte2OyWPA2OkvZVi40pW7UE5+QeXZcdlSSltbHN38pUFzFc7bIAWO2hrIwgtFk/27K5
         xvn0uuG9r4mlYfo94PE1Aut1m92yHpn03TI31fiijO8YLX7MDWM9x1CpHO642Mk0qyYY
         Gqmg==
X-Gm-Message-State: AOAM533nFanvVpractmRmo+VnE0VNULtA/VkXcBY97yElf5BbZ8QKhmq
        BuHxCYlqRn9w8pvFXpnvrEe0P9HQi4784tDsJPiKXtvXSzI=
X-Google-Smtp-Source: ABdhPJz3bghFyovDymhD5ovjJyOpBI5efUQkZW3bNsyvsBhmZl1b6KExy6RV3GSRCkgPkvAHL/yExBRrXLSIa2AoHAw=
X-Received: by 2002:a65:654e:: with SMTP id a14mr3852977pgw.265.1611307498856;
 Fri, 22 Jan 2021 01:24:58 -0800 (PST)
MIME-Version: 1.0
References: <20210120102057.21143-1-tiwai@suse.de> <20210120102057.21143-2-tiwai@suse.de>
In-Reply-To: <20210120102057.21143-2-tiwai@suse.de>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Fri, 22 Jan 2021 10:24:47 +0100
Message-ID: <CAG3jFythAY8AqANV6PiQOus0Nhf0M8kdD-0Pneg5EN5BeE=wkQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: dvb-usb: Fix memory leak at error in dvb_usb_device_init()
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Stefan Seyfried <seife+kernel@b1-systems.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Takashi,

Thanks for the patch. It looks good to me, feel free to add my r-b.
Reviewed-by: Robert Foss <robert.foss@linaro.org>


On Wed, 20 Jan 2021 at 12:51, Takashi Iwai <tiwai@suse.de> wrote:
>
> dvb_usb_device_init() allocates a dvb_usb_device object, but it
> doesn't release it even when returning an error.  The callers don't
> seem caring it as well, hence those memories are leaked.
>
> This patch assures releasing the memory at the error path in
> dvb_usb_device_init().  Also it makes sure that USB intfdata is reset
> and don't return the bogus pointer to the caller at the error path,
> too.
>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  drivers/media/usb/dvb-usb/dvb-usb-init.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/usb/dvb-usb/dvb-usb-init.c b/drivers/media/usb/dvb-usb/dvb-usb-init.c
> index c1a7634e27b4..5befec87f26a 100644
> --- a/drivers/media/usb/dvb-usb/dvb-usb-init.c
> +++ b/drivers/media/usb/dvb-usb/dvb-usb-init.c
> @@ -281,15 +281,21 @@ int dvb_usb_device_init(struct usb_interface *intf,
>
>         usb_set_intfdata(intf, d);
>
> -       if (du != NULL)
> +       ret = dvb_usb_init(d, adapter_nums);
> +       if (ret) {
> +               info("%s error while loading driver (%d)", desc->name, ret);
> +               goto error;
> +       }
> +
> +       if (du)
>                 *du = d;
>
> -       ret = dvb_usb_init(d, adapter_nums);
> +       info("%s successfully initialized and connected.", desc->name);
> +       return 0;
>
> -       if (ret == 0)
> -               info("%s successfully initialized and connected.", desc->name);
> -       else
> -               info("%s error while loading driver (%d)", desc->name, ret);
> + error:
> +       usb_set_intfdata(intf, NULL);
> +       kfree(d);
>         return ret;
>  }
>  EXPORT_SYMBOL(dvb_usb_device_init);
> --
> 2.26.2
>
