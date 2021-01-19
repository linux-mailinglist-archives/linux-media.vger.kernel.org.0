Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 459392FB4C1
	for <lists+linux-media@lfdr.de>; Tue, 19 Jan 2021 10:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728777AbhASJDO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jan 2021 04:03:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731683AbhASI5x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jan 2021 03:57:53 -0500
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94A76C061575
        for <linux-media@vger.kernel.org>; Tue, 19 Jan 2021 00:57:13 -0800 (PST)
Received: by mail-io1-xd2a.google.com with SMTP id d81so22918925iof.3
        for <linux-media@vger.kernel.org>; Tue, 19 Jan 2021 00:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3BeiBtcm9SCY0g91u2WvZrEK8opo1/Kd2ZEOb1FMWyU=;
        b=DvwdpNezTQuRjskcmsqaM5J9cwAIeBpZNuG2isQwJyKqFxUDVF7ozHTubOBI1YUyEO
         Fjm3bHgbOjCBhtOyYF8g0SKCUrHrSov0dO1fBSkm6nBy2kUWbyO+vTR+tkyyRMKctN+3
         UkB2uNFIBTomMwVxT45RL1fIjT0vJKop142Xw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3BeiBtcm9SCY0g91u2WvZrEK8opo1/Kd2ZEOb1FMWyU=;
        b=Krd+Zfv4MS6lFHmh1LIb6j+VLvKyBS5SlruPTbmvoaVpkrhxwRgFMD0Zy723JligyP
         IrjqSz5K0T1SXXDnw7eEjFjfsJOxz6OdpTjFFqO8cQ2+ZA6++qa+zlmKu5hrWLuHrvm2
         Ln8l1R2cJyIIKP8U1LwCpSSsmdNEgbBDkQ9vauL36Il/IUaLweA90TVxKuFoAhnSjIkp
         Ii5xK7TgS6U0tjWmyXSdZcB9NaCm/qFNloPFNtpMagJmK8Olm92IudSu1PXJkx1HjEl8
         wKUNdCA449qmLDa/d59TmHcxPe4NSC7qLrfKd2fiXyq/2IFGKEZV3UQt/k+8hjCMv8qj
         sTPw==
X-Gm-Message-State: AOAM532osHl/zpl8DxEjrRbNQHb9J45D7CaFnBuhnyc80WdGUenKDPR0
        LAcJBfzW6y9wA7Yn/Eu/qR+UziKNlvO8Bw==
X-Google-Smtp-Source: ABdhPJzEe1/PEXUBSidfDIGTH2zdy/0d7/hamCpiagiH3Xk2U5zm6GKxMnml9uv10NXEhhwoJ1lB0w==
X-Received: by 2002:a02:3f0d:: with SMTP id d13mr2612313jaa.19.1611046632844;
        Tue, 19 Jan 2021 00:57:12 -0800 (PST)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com. [209.85.166.46])
        by smtp.gmail.com with ESMTPSA id n11sm8893966ioh.37.2021.01.19.00.57.12
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jan 2021 00:57:12 -0800 (PST)
Received: by mail-io1-f46.google.com with SMTP id d81so22918831iof.3
        for <linux-media@vger.kernel.org>; Tue, 19 Jan 2021 00:57:12 -0800 (PST)
X-Received: by 2002:a02:a58d:: with SMTP id b13mr2642407jam.115.1611046631587;
 Tue, 19 Jan 2021 00:57:11 -0800 (PST)
MIME-Version: 1.0
References: <20210114130316.803231-1-ribalda@chromium.org> <d472a1b1-71d6-0c9c-0ead-d2287bd788ae@embeddedor.com>
In-Reply-To: <d472a1b1-71d6-0c9c-0ead-d2287bd788ae@embeddedor.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 19 Jan 2021 09:57:00 +0100
X-Gmail-Original-Message-ID: <CANiDSCt5o-k=8L2YhpYCQhWJhsE7vHJ_u6TFgFu0a9gAyT49TQ@mail.gmail.com>
Message-ID: <CANiDSCt5o-k=8L2YhpYCQhWJhsE7vHJ_u6TFgFu0a9gAyT49TQ@mail.gmail.com>
Subject: Re: [PATCH] media: hantro: Fix reset_raw_fmt initialization
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Gustavo

On Mon, Jan 18, 2021 at 11:26 PM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
>
> Hey Ricardo,
>
> On 1/14/21 07:03, Ricardo Ribalda wrote:
> > raw_fmt->height in never initialized. But width in initialized twice.
>
> Nice catch!
Thanks :)

>
> How did you find this?

Pure luck. I was backporting a patch and the duplicated line hit my
eye. Maybe we could just search for duplicated lines in the codebase.
I guess it is not the only c&p issue we have

>
> > Fixes: 88d06362d1d05 ("media: hantro: Refactor for V4L2 API spec compliancy")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> This should be tagged for -stable:
>
> Cc: stable@vger.kernel.org
>
> --
> Gustavo
>
> > ---
> >  drivers/staging/media/hantro/hantro_v4l2.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
> > index b668a82d40ad..f5fbdbc4ffdb 100644
> > --- a/drivers/staging/media/hantro/hantro_v4l2.c
> > +++ b/drivers/staging/media/hantro/hantro_v4l2.c
> > @@ -367,7 +367,7 @@ hantro_reset_raw_fmt(struct hantro_ctx *ctx)
> >
> >       hantro_reset_fmt(raw_fmt, raw_vpu_fmt);
> >       raw_fmt->width = encoded_fmt->width;
> > -     raw_fmt->width = encoded_fmt->width;
> > +     raw_fmt->height = encoded_fmt->height;
> >       if (ctx->is_encoder)
> >               hantro_set_fmt_out(ctx, raw_fmt);
> >       else
> >



-- 
Ricardo Ribalda
