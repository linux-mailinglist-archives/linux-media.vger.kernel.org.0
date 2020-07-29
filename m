Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AE36232158
	for <lists+linux-media@lfdr.de>; Wed, 29 Jul 2020 17:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726615AbgG2POB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jul 2020 11:14:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726449AbgG2POB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jul 2020 11:14:01 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B8AFC061794;
        Wed, 29 Jul 2020 08:14:01 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id c10so537979pjn.1;
        Wed, 29 Jul 2020 08:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uTiBwXbJ/NNgJMQGMIY8FxAJr7nGPTOl3ItEnVx+egg=;
        b=lU9aW1zQB2JvPFxKWebURugB6JMTmheNYXpi4oSgi+iWb7P6NXSesvfW2GV74FvmNZ
         61Lq6UAxEgFgGGZke2HbAiBwrmy/J9OYahuobaIXWV7hxzj1hukW1k12Uc7FOEQ+YjN3
         qXvhBH+SfBWXvi3GKZDxT+Zweb/WX1cn9S3jxEmJvCZnvTWqgr1MtTcAJS0gdzAy2MYZ
         GxNwxKeoInCJETaUfTemth95M3EyxhFyx5GTbcSutbCm0vV64Vywy/+nHO00UOGjBhiB
         2f3Lnedu2UMzXb0ytjyFGpEYEAq7TVnoAJPReP4Z6Ny2fhykJRJVEdKXnt9K8ZE8QjMb
         IOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uTiBwXbJ/NNgJMQGMIY8FxAJr7nGPTOl3ItEnVx+egg=;
        b=Fi33CrYdGsE3kVHVdyQOI/D1SP6kAzwsyIeJPZ+RJaodc9VVpJ9ghIv5YXONidPMCb
         kb6S2E4j2zt5ROLAH5/EGfhOvLCL730XvS7D/mlBrVjraJSh/XTePwGf6MHkSEDPfmpV
         laBPgfBShJVtxDijJdyn/ed9vD1sBOjJweejOdgEyk5mI+kUBU0+Ue/qcsFhGJgR6Ynm
         biUhQsC8XhclQ6AZ7B6+5ri68hbMqMeO507+M0wHk18E27QQ5HPA0I0DQrStyBtikPzi
         olk0nSlhf+K5nFpwqqJwsm0U+W4k3S+NEILtaEnrVfUIJ+Gh/u5QinbKTdaVLSLh9TbH
         Wefg==
X-Gm-Message-State: AOAM532sqJFdQcl7T1MfsUBFW/OKgbRUqw9N8Nv/MpIvWhnVbSJypR4p
        FyQMehx+cSGxDfYzezgoGwCYsBF1LIS2iVi3Icu4nDru42s=
X-Google-Smtp-Source: ABdhPJxAwR2uw6M4ZO71A974LNQoSM/gUFMLZ3l/bZyau+lndlozCjIpYqC7GMkpaDXUzvHdsZDGseJSqaJXfcLd4rc=
X-Received: by 2002:a17:90a:390f:: with SMTP id y15mr2723618pjb.181.1596035640864;
 Wed, 29 Jul 2020 08:14:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200729135636.9220-1-cengiz@kernel.wtf>
In-Reply-To: <20200729135636.9220-1-cengiz@kernel.wtf>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 29 Jul 2020 18:13:44 +0300
Message-ID: <CAHp75VfM3OapAkYJ-sN-MG2yuGDqaqDjc6p0gXT9cHYgnH+5LQ@mail.gmail.com>
Subject: Re: [PATCH] staging: atomisp: move null check to earlier point
To:     Cengiz Can <cengiz@kernel.wtf>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 29, 2020 at 5:00 PM Cengiz Can <cengiz@kernel.wtf> wrote:
>
> `find_gmin_subdev` function that returns a pointer to `struct
> gmin_subdev` can return NULL.
>
> In `gmin_v2p8_ctrl` there's a call to this function but the possibility
> of a NULL was not checked before its being dereferenced. ie:
>
> ```
> /* Acquired here --------v */
> struct gmin_subdev *gs = find_gmin_subdev(subdev);
> int ret;
> int value;
>
> /*  v------Dereferenced here */
> if (gs->v2p8_gpio >= 0) {
>         pr_info("atomisp_gmin_platform: 2.8v power on GPIO %d\n",
>                 gs->v2p8_gpio);
>         ret = gpio_request(gs->v2p8_gpio, "camera_v2p8");
>         if (!ret)
>                 ret = gpio_direction_output(gs->v2p8_gpio, 0);
>         if (ret)
>                 pr_err("V2P8 GPIO initialization failed\n");
> }
> ```
>
> I have moved the NULL check before deref point.

"Move the NULL check..."
See Submitting Patches documentation how to avoid "This patch", "I", "we", etc.

> diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> index 0df46a1af5f0..8e9c5016f299 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> @@ -871,6 +871,11 @@ static int gmin_v2p8_ctrl(struct v4l2_subdev *subdev, int on)
>         int ret;
>         int value;
>
> +       if (!gs) {
> +               pr_err("Unable to find gmin subdevice\n");

> +               return -EINVAL;

And here is a change of semantics...

> +       }

...

> -       if (!gs || gs->v2p8_on == on)
> +       if (gs->v2p8_on == on)
>                 return 0;

...compared to above.

-- 
With Best Regards,
Andy Shevchenko
