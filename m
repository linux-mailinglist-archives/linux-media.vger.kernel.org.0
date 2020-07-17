Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63FD122378C
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 11:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbgGQJB0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 05:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725864AbgGQJBZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 05:01:25 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3685C061755;
        Fri, 17 Jul 2020 02:01:25 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id x8so5180605plm.10;
        Fri, 17 Jul 2020 02:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HKitXDlmydxI6z4/CnYabITgS4bsdTbz6585MnaltvY=;
        b=b2O8QIoQic4W5SlcWRjg1H7nUBkNxMl+7QDNcLhjXY131F1HlAENZBz8xvzDCvl1oJ
         1BuuU1zO9j2G3QXvaf8EQc14TRC39k5q8/UzXyG1N7n6mVEQzPXlciGtzRwlxd2j/xNg
         A9mRJYvjHo/Y9XJqKU0PcF4xJ7ktjejg2zqqtH/QKwcN1vZZyN/WBhJTw4TP7F4m6oWU
         xxhrN+YzK1WerBSdt42dMcyR73PSwjFn67CAAENYcFOAhXU/8W+GjmntKvW8ou3K9FML
         zlfBQj4frWYbVAUwV2SvsiC8r3GpE4SqFY6PogG/+ne8mxSQjGw5ectipb48zx3WUADF
         b+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HKitXDlmydxI6z4/CnYabITgS4bsdTbz6585MnaltvY=;
        b=e+7xr7NADUr7xk/MUEs0KTSwf7H1PYLU8icEXjYRzIKv5Y26bvtZRmIiyCJvThgQC1
         8nBOKf4Bd9ojM6Rr9Lb0foxF6dcSyrSrtyMEZkZDqbd+Vhr6ROOZ2yrL/t/VeNesqK2O
         xBkqCHsuAVEWBugu/JFtxtFpXC/Igh88otJ/ZZIGK9CLZxsl3rIY2QLTqnib9K03/8Dp
         iek+/Jd762/lT4Opxa6yqdFuMKckXai9YsiNt7sFvO/4wis5ErLJQ3uvIPQfjEyuLkqN
         Oc9XyAscs3qZa+xW8Qv7JyakmOhNH63Bkm/vt4DLL0jxBf7NWuz6PjiTnEx3D9ZscuYO
         XV1A==
X-Gm-Message-State: AOAM532gy7AGQ9hWPoSCS3WrKUcImg/uSRHJcs6Ocz4kkbfJMcswuYSt
        xu2+RIj/LtwpL/j1MluujbC4w5LYa0TtcuSKvbU=
X-Google-Smtp-Source: ABdhPJyCMCY3NhiXGvxqc2+yg2fZHFBpFAYLZxFj2EQgd+ZUK5lmCJBGrbNFFEemrHRHoDWdoOS+rm8NZ/HPs8uUp4Q=
X-Received: by 2002:a17:902:8491:: with SMTP id c17mr6791039plo.262.1594976485312;
 Fri, 17 Jul 2020 02:01:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200716115122.15909-1-jslaby@suse.cz>
In-Reply-To: <20200716115122.15909-1-jslaby@suse.cz>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 17 Jul 2020 12:01:09 +0300
Message-ID: <CAHp75VeqV1Jj3rOxbFCx2DsrH1Y_re03i3ndvXvShi2UG6FGyQ@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: fix NULL pointer dereference
To:     Jiri Slaby <jslaby@suse.cz>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 16, 2020 at 2:52 PM Jiri Slaby <jslaby@suse.cz> wrote:
>
> I am currently seeing:
> BUG: kernel NULL pointer dereference, address: 0000000000000002
> ...
> Hardware name: UMAX VisionBook 10Wi Pro/CQM1018CWP, BIOS CQ1018.007 09/22/2016
> RIP: 0010:gmin_subdev_add.cold+0x303/0x312 [atomisp_gmin_platform]
> ...
> Call Trace:
>  gmin_camera_platform_data+0x2f/0x60 [atomisp_gmin_platform]
>  ov2680_probe+0x7f/0x2b0 [atomisp_ov2680]
>  i2c_device_probe+0x95/0x290
>
> power can be NULL and that is properly handled earlier in this function.
> Even i2c address is set there. So this is a duplicated assignment which
> can cause the bug above. Remove it.

I believe it's fixed in [1].

[1]: https://git.linuxtv.org/mchehab/experimental.git/log/?h=atomisp_v5

> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> index 1af9da8acf4c..246742f44d84 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> @@ -574,7 +574,6 @@ static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
>                 gmin_subdevs[i].eldo2_ctrl_shift = gmin_get_var_int(dev, false,
>                                                                     "eldo2_ctrl_shift",
>                                                                     ELDO2_CTRL_SHIFT);
> -               gmin_subdevs[i].pwm_i2c_addr = power->addr;
>                 break;
>
>         default:
> --
> 2.27.0
>


-- 
With Best Regards,
Andy Shevchenko
