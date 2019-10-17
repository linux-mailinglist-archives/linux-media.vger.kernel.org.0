Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B61DCDA6AF
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 09:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404644AbfJQHsc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 03:48:32 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:33600 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387930AbfJQHsb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 03:48:31 -0400
Received: by mail-ed1-f66.google.com with SMTP id c4so979823edl.0;
        Thu, 17 Oct 2019 00:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8B+VL6RjXg5KMDSHhbVjjx3TQz+ogXFR8+wGExPxeGQ=;
        b=qOCBOGJLloO3vmyqaRI+6T72uldMbOQsHidQ6BRi2voae07zuY8uRplwWLvQULhXAq
         EnhD5ORTI/u17427MXfItSfVk86MDBU2dRcWm4hlr8ZZFxwSiYp/c6XF6OARVLEZviYF
         kGTgQFbtkjVo5BmhvtD9Ee7JuVIglLO4jxCUh2Vy7l0CRUXmrRdydt+Xihue/MAH9X6y
         ghpJmSx2ExE8r65ZdJyXWNBAbaIwqAnRojflSTV30kOrfqBZep5b0CJjh+9y0zRwVtMA
         djKD41iFnE5eKX1WXfVJR+OR8RaZvcbkt4GRNePH2E8fbIc6XIY2gOoCtwGbg/Ab6/ZL
         rM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8B+VL6RjXg5KMDSHhbVjjx3TQz+ogXFR8+wGExPxeGQ=;
        b=lIETvUVjsKDYQI7Wn0ZB8lGELC7af379TRY4FRJ40FAiFnr2WS+nOCcdSpUPWrQNKJ
         kWc0XyKkj4EJZPM4vI3lBmhfCfNXS/9brRLHei0Taz+cSrzKbljoNauqFM92beGSgd8Z
         P32kWWZr5bDrooCV1T7vJjIRz54bZClTNgn5LYtTwntqlYUOovdpc148ta0JitqGF5Zf
         P5M2cRhCeJGaBIr57uMzQIaCAjM5YoEbm5lBA95SbyZiBX6hW+7htyuBgjuLqGfn/s2u
         G1s2rFZ0PrjawD5zSI7WZICvaC1GUytffsQly9UZ4xAm4nJqxLQ8OMabGQ9vRQUZ8JT+
         G+6Q==
X-Gm-Message-State: APjAAAWW/L5nYV3Lo/9jpisMd3GdA3k+tsKRtZSY89sTdlhRKWZJP+x1
        nam7tDGFRw36bg+2+yr2aaSQyCLmCwztFyP02AjNO20m
X-Google-Smtp-Source: APXvYqzLkBj4wrmLsp0uHhkF+gPgoWTWlVybA1KoNGKYa6VGb9+7wEs3hq1+1i16D7MxY4U9nT+RrTGKqmUpwpVle+c=
X-Received: by 2002:aa7:d410:: with SMTP id z16mr2360627edq.40.1571298509980;
 Thu, 17 Oct 2019 00:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <20191016105604.8036-1-hslester96@gmail.com> <8de93390-ae04-4278-bb34-aa175c659c23@st.com>
In-Reply-To: <8de93390-ae04-4278-bb34-aa175c659c23@st.com>
From:   Chuhong Yuan <hslester96@gmail.com>
Date:   Thu, 17 Oct 2019 15:48:19 +0800
Message-ID: <CANhBUQ0MvXYm4iLcx5gWyq=0VMmafRAJ7TsTtUuOT0YwgBcAOA@mail.gmail.com>
Subject: Re: [PATCH] media: st-mipid02: add a check for devm_gpiod_get_optional
To:     Mickael GUENE <mickael.guene@st.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 17, 2019 at 1:43 PM Mickael GUENE <mickael.guene@st.com> wrote:
>
> Hello Chuhong,
>
>  Is this check necessary ?
> since looking into code it seems to me devm_gpiod_get_optional() can only
> return NULL in case of error due to following check in devm_gpiod_get_index_optional()
>         if (IS_ERR(desc)) {
>                 if (PTR_ERR(desc) == -ENOENT)
>                         return NULL;
>         }
>  And in that case reset_gpio is not used
>

The problem may not be a null return value, but a returned error,
which is a minus value,
like -EPROBE_DEFER or -EINVAL returned by gpiod_find in gpiod_get_index.
In these cases, devm_gpiod_get_index_optional will not return null but
return the error.
Therefore, this check is necessary.

> Regards
> Mickael
>
> On 10/16/19 12:56, Chuhong Yuan wrote:
> > mipid02_probe misses a check for devm_gpiod_get_optional and may miss
> > the failure.
> > Add a check to fix the problem.
> >
> > Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> > ---
> >  drivers/media/i2c/st-mipid02.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
> > index 81285b8d5cfb..d38e888b0a43 100644
> > --- a/drivers/media/i2c/st-mipid02.c
> > +++ b/drivers/media/i2c/st-mipid02.c
> > @@ -971,6 +971,9 @@ static int mipid02_probe(struct i2c_client *client)
> >       bridge->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> >                                                    GPIOD_OUT_HIGH);
> >
> > +     if (IS_ERR(bridge->reset_gpio))
> > +             return PTR_ERR(bridge->reset_gpio);
> > +
> >       ret = mipid02_get_regulators(bridge);
> >       if (ret) {
> >               dev_err(dev, "failed to get regulators %d", ret);
> >
