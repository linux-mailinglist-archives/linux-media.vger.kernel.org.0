Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E5DD255D8B
	for <lists+linux-media@lfdr.de>; Fri, 28 Aug 2020 17:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbgH1PNU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Aug 2020 11:13:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbgH1PNO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Aug 2020 11:13:14 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE656C061264
        for <linux-media@vger.kernel.org>; Fri, 28 Aug 2020 08:13:13 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id k15so793428pfc.12
        for <linux-media@vger.kernel.org>; Fri, 28 Aug 2020 08:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BKjrrvGukms7oApav7erWoo0oPTGMcbx8gjhXd3ukgs=;
        b=NhhM7Wd+6AXFxeOeMWRB148tGgNlOMcALtzVTyDpKSNCuzc3VWYLfJz/pX5kXgMHGL
         9yWWnDA5z/smkM1Md/N/OArnjuz3dkLQV4msTL+jLALnqY9rkSCrrIw3nio1scj68TCz
         kmbApPm0zBAt0F7neVf0zLYRSsyNM0OCcLf+HpLOhoJcFqOK+xSHUgVdylKhSuEnIixE
         rpId1DnDwsD41p0iGXpblh/s1NjnVMFJ/HXYO3mQuwurIrfBJTzxcGKgRyueLjGR9ZhD
         r9pYDJDfQwYo++eOmCF7TQpboaZRr/hNx95K1YSvRQpGo5gRDwPlVae/L9cg29T3IQBh
         8lag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BKjrrvGukms7oApav7erWoo0oPTGMcbx8gjhXd3ukgs=;
        b=oYASEPAjLyRUsyUfwIs8lUbaBeZQBhXFQLShU6VqzumZ5Mk55RjCrB/vpmjpox8Emr
         upQHt1e7eU6eEQoNmyUZQXj+wUmw1DIlmctspZC/86crIsxA8YQQ9Rd+TFJWvtmnb8SQ
         415ABiCzeeAUh61zPIaEd69gUT7LD7WWKc3+1CBsaYDEXVm3zljV3VCxgiELfzCP+8bs
         IBUyzkIu9KrMfY+IPrkn6MP1waQKZmHzbV2SPtffseJnGWahwuOslkHv+z4zO2R6KzBk
         Ftu3Q+pUau1yfFVp1CTmJpozM79zw1yeaOthQAXHm/8dncEcUUm3SFD8AC7f6TzOGY4o
         2D4Q==
X-Gm-Message-State: AOAM532kXM2BYK1Au0VbJpisNme/W10v+9pJwWM8gTfssdV8LY/UWpfw
        GY13a6GVTBy0lPJCzrL/+ScyfrqEwlhEskUznmW+iMskwu4ypg==
X-Google-Smtp-Source: ABdhPJzBRHZpU27bCnEfRWEIjU42rJu3H1xXxc3QjqEmLrHzIIwqgmaz4ebaoH3M0cNLgMndZvXGFvpUlnmrLB9iN0o=
X-Received: by 2002:a62:1514:: with SMTP id 20mr1712792pfv.62.1598627593154;
 Fri, 28 Aug 2020 08:13:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200828145518.26324-1-trix@redhat.com>
In-Reply-To: <20200828145518.26324-1-trix@redhat.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 28 Aug 2020 08:13:02 -0700
Message-ID: <CAKwvOd=S=aw6KoRvzhUMi4fR799kaPwAKoigjuR9fS-JSYSGPA@mail.gmail.com>
Subject: Re: [PATCH] media: ov7670: check status of ov7670_read
To:     trix@redhat.com
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        linux-media@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Huckleberry <nhuck15@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 28, 2020 at 7:55 AM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> clang static analysis flags this representative problem
>
> drivers/media/i2c/ov7670.c:1463:9: warning: Assigned
>   value is garbage or undefined
>         *value = gain;
>                ^ ~~~~
>
> gain is set by a successful call to ov7670_read()

Indeed, it looks like gain is only valid if the return value from
ov7670_read() is >= 0.  Would it be simpler to just initialize gain to
0 in ov7670_g_gain?

Side question; I'm super happy to see someone sending patches for
things identified by clang's static analyzer.  I'm curious, Tom, how
did you run it?  Did you use the recently landed in kbuild-next
support for the make target `make clang-analyzer`?

>
> So check that ov7670_read() is successful.
>
> The remaining static analysis problems are false positives.
> There appears to be a limitation with checking the
> aggregated returns.
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/media/i2c/ov7670.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/i2c/ov7670.c b/drivers/media/i2c/ov7670.c
> index b42b289faaef..001d4b09db72 100644
> --- a/drivers/media/i2c/ov7670.c
> +++ b/drivers/media/i2c/ov7670.c
> @@ -929,6 +929,8 @@ static int ov7670_set_hw(struct v4l2_subdev *sd, int hstart, int hstop,
>         ret =  ov7670_write(sd, REG_HSTART, (hstart >> 3) & 0xff);
>         ret += ov7670_write(sd, REG_HSTOP, (hstop >> 3) & 0xff);
>         ret += ov7670_read(sd, REG_HREF, &v);
> +       if (ret)
> +               return ret;
>         v = (v & 0xc0) | ((hstop & 0x7) << 3) | (hstart & 0x7);
>         msleep(10);
>         ret += ov7670_write(sd, REG_HREF, v);
> @@ -938,6 +940,8 @@ static int ov7670_set_hw(struct v4l2_subdev *sd, int hstart, int hstop,
>         ret += ov7670_write(sd, REG_VSTART, (vstart >> 2) & 0xff);
>         ret += ov7670_write(sd, REG_VSTOP, (vstop >> 2) & 0xff);
>         ret += ov7670_read(sd, REG_VREF, &v);
> +       if (ret)
> +               return ret;
>         v = (v & 0xf0) | ((vstop & 0x3) << 2) | (vstart & 0x3);
>         msleep(10);
>         ret += ov7670_write(sd, REG_VREF, v);
> @@ -1460,6 +1464,8 @@ static int ov7670_g_gain(struct v4l2_subdev *sd, __s32 *value)
>         unsigned char gain;
>
>         ret = ov7670_read(sd, REG_GAIN, &gain);
> +       if (ret)
> +               return ret;
>         *value = gain;
>         return ret;
>  }
> @@ -1470,11 +1476,14 @@ static int ov7670_s_gain(struct v4l2_subdev *sd, int value)
>         unsigned char com8;
>
>         ret = ov7670_write(sd, REG_GAIN, value & 0xff);
> +       if (ret)
> +               return ret;
>         /* Have to turn off AGC as well */
> -       if (ret == 0) {
> -               ret = ov7670_read(sd, REG_COM8, &com8);
> -               ret = ov7670_write(sd, REG_COM8, com8 & ~COM8_AGC);
> -       }
> +       ret = ov7670_read(sd, REG_COM8, &com8);
> +       if (ret)
> +               return ret;
> +       ret = ov7670_write(sd, REG_COM8, com8 & ~COM8_AGC);
> +
>         return ret;
>  }
>
> --
> 2.18.1
>


-- 
Thanks,
~Nick Desaulniers
