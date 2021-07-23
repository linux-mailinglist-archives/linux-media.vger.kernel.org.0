Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E43D3D385D
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 12:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230238AbhGWJbb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 05:31:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbhGWJbb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 05:31:31 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6CB9C061575;
        Fri, 23 Jul 2021 03:12:03 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id z26so1140261edr.0;
        Fri, 23 Jul 2021 03:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lq6dxgIqN0xaQXANjs2LAfU4P3/YylmyKp58xBdTWlM=;
        b=op4xvQbJ03bPymE1+ptO+ymqU8x+zTfVlt4X87zKKci3oNuHr22EJBI3+ZyI6YjhO1
         qitKiNdHuXKYsDqPYa6gU+zArHwnuJUI30Vj3sEhYHYicjEoyzqZ2xfBQmCyy6tOfan0
         FLdRxnyYek5/VMT2KXSvLo/uGdb12qnqqMUKvKKduerWX4ToplE5/Z3nWMnHhzcucJSA
         EuA3iLe1Usf/N7qschGf117jTJLWfezejsVcIiI3KawXApWVZmKz+BXAp4kwfhKSRBg8
         jR3BBsp82dhgJlL58DVAd/TstmxcGMZrG/Zwl3HZzYeuIiuYNMB1Uci2+580n2GdzhcW
         OK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lq6dxgIqN0xaQXANjs2LAfU4P3/YylmyKp58xBdTWlM=;
        b=LwM2UzAPYySu+BBCpc+THi+UhhOD9GX52WprMvH5DZ2B8D/75zqNiMQ0fu0wtMb6s1
         8T5XJMUQ4CyJbM+EtSI7Zub18PIDF1eUE5phkc+hrt/RuB5ttiNpsj1QNdKnn1NW35fI
         Tcdvxy7dE/htwKJeyfpC5/vrD3T+6Bz7gtUZqH49DLJIk6wY4i3t/kHQDKVmmotN7ckq
         b5PgAsDZ0FzTONPEaw14Db/j+I9RwLRZEt3aMle0YO++UpGJMEVWFT0DrM4M+WrramLS
         uvDGUECwv9tpLXxAKFQ0QpR2PW+6YCQ7KN84cHz4JwC8M3fV8wrgPfGW4rvDCg2AEB+A
         90HA==
X-Gm-Message-State: AOAM533fW22AAA2G6pz/Vnf152ltfALHDvNKyqLk1kpKHy6CRLQGwDoo
        GdX7Zv4ayLSMFFQTQYKbpLp5NVi1l16DmXpz8+k=
X-Google-Smtp-Source: ABdhPJxcI09jK+c6tll+K883wEHfou6PUNg0ft7BHr4kM23p0vLOke5QrVQX8E/HXM8O+sJ7d+JHAs1cksoKe4hURsk=
X-Received: by 2002:a05:6402:1c10:: with SMTP id ck16mr4560349edb.339.1627035122444;
 Fri, 23 Jul 2021 03:12:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210714032340.504836-1-mudongliangabcd@gmail.com>
In-Reply-To: <20210714032340.504836-1-mudongliangabcd@gmail.com>
From:   Dongliang Mu <mudongliangabcd@gmail.com>
Date:   Fri, 23 Jul 2021 18:11:36 +0800
Message-ID: <CAD-N9QXWHeNvR06wyg3Pym8xUb27TsuFKKKG=tZ0-x5ZGCr-Hw@mail.gmail.com>
Subject: Re: [PATCH] media: usb: fix memory leak in stk_camera_probe
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dongliang Mu <mudongliangabcd@gmail.com>
Cc:     linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 14, 2021 at 11:23 AM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
>
> stk_camera_probe mistakenly execute usb_get_intf and increase the
> refcount of interface->dev.
>
> Fix this by removing the execution of usb_get_intf.

Any idea about this patch?

>
> Reported-by: Dongliang Mu <mudongliangabcd@gmail.com>
> Fixes: 0aa77f6c2954 ("[media] move the remaining USB drivers to drivers/media/usb")
> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> ---
>  drivers/media/usb/stkwebcam/stk-webcam.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/media/usb/stkwebcam/stk-webcam.c b/drivers/media/usb/stkwebcam/stk-webcam.c
> index a45d464427c4..5bd8e85b9452 100644
> --- a/drivers/media/usb/stkwebcam/stk-webcam.c
> +++ b/drivers/media/usb/stkwebcam/stk-webcam.c
> @@ -1311,7 +1311,6 @@ static int stk_camera_probe(struct usb_interface *interface,
>
>         dev->udev = udev;
>         dev->interface = interface;
> -       usb_get_intf(interface);
>
>         if (hflip != -1)
>                 dev->vsettings.hflip = hflip;
> --
> 2.25.1
>
