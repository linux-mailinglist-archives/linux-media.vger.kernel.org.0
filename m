Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BDC019D50A
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 12:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390632AbgDCK3U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 06:29:20 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:35466 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727956AbgDCK3U (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 06:29:20 -0400
Received: by mail-oi1-f193.google.com with SMTP id t25so5673886oij.2
        for <linux-media@vger.kernel.org>; Fri, 03 Apr 2020 03:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UQFLz6/WB3AY/atr6wtt95nBqCir6R4mEcSDWeXfarM=;
        b=Uy73p90NR0BqqAmHZkTBGrS/B2yIc07LsWozpdahnseeJokC3DZxNNzW8+ccM3O4yk
         fM4j4FcBmpcin37cef68OT0aGkr9TNU7RUEU5FZrsvoM8Gsp9Bi+hXB/+6WqlFP9LhYt
         tlNJpfjtPvsw0N1uzXCtjdq+Dw3BhgVJR2acUO+YTYqGMuHQ2zxLLU3n7KCS2P/xspDB
         SVoRvrFmZs7CuuYNQZ36aXXP/CWtnXRuil62TNOtQ4FHdipoHTf2pucslmsX/jtOoAwq
         ai2KeZoYg2tBKNrcrkAzGetX7WK5MQMNf1h7ybRZKgECJsB+FRLVnximd3WA0ptVGDi6
         L3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UQFLz6/WB3AY/atr6wtt95nBqCir6R4mEcSDWeXfarM=;
        b=S9ezDgkW03MnDHv9vuvQQyNFedS/2V8+Cpkb4adEQPHcYMfetyfzjALHyGa155Ul4u
         Wsqd443xi+zKk+aEJy6ldttiQTGozNN/GF3/4AXB5DlWY+m7JAJQPlORB2xxRqWgkKyL
         vTV09tV/gvIk0LQlwpOZZSfHVyWkiLOz/sUkvrUWikfSWPoHZUeechExuxgIpM/yIy+E
         x/0Di4zHlzSA94dMLlW6ATcpKPTKVxzd7W6fzZBAneEkDgKalszTwAIG2pzm40FP+xRA
         1AaE8pMwY9PB3grf598RMHFxSH8Kji+mfFIiWvQ076clQqidTt0S2FIeZHipGBzhJomg
         /REg==
X-Gm-Message-State: AGi0Pua8LWOhee6bcepPwNekx44kXjtUuXc2VRg9s+pgeD+4vf2Rvtlb
        kh18AMZHN+7U/kg+qCH0HFtDDyeOeqJUNrulrug=
X-Google-Smtp-Source: APiQypIdgHNwrxNrLOu3mUskq53h/hM2m+UuIljS8exP1CD40R+xR6Rohn0M5vVuFnrOA4CUiKZByefaydl5P7K2lCo=
X-Received: by 2002:aca:d10:: with SMTP id 16mr2482108oin.142.1585909757910;
 Fri, 03 Apr 2020 03:29:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200331180630.5703-1-dafna.hirschfeld@collabora.com> <CAPY8ntD=4i6VnxTHakt2dnfM3BLfNsBPEhJt6qS229rOfCHZmg@mail.gmail.com>
In-Reply-To: <CAPY8ntD=4i6VnxTHakt2dnfM3BLfNsBPEhJt6qS229rOfCHZmg@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 3 Apr 2020 11:28:52 +0100
Message-ID: <CA+V-a8unuigag-c0fgJopMG30cxXz6c6yGf67pY=TUQ8JvCaSw@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: imx219: Fix a bug in imx219_enum_frame_size
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        helen.koike@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        dafna3@gmail.com,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Apr 3, 2020 at 11:23 AM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Dafna
>
> Thanks for the patch.
>
> On Tue, 31 Mar 2020 at 19:06, Dafna Hirschfeld
> <dafna.hirschfeld@collabora.com> wrote:
> >
> > When enumerating the frame sizes, the value sent to
> > imx219_get_format_code should be fse->code
> > (the code from the ioctl) and not imx219->fmt.code
> > which is the code set currently in the driver.
> >
> > Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> Agreed that v4l2-ctl --list-formats-ext doesn't list the frame sizes
> for the mode that isn't selected without this patch. With this patch
> you get the full list.
>
> Does it warrant a "Fixes: 22da1d56e ("media: i2c: imx219: Add support
> for RAW8 bit bayer format")"? I'd probably say yes.
>
+1

Cheers,
--Prabhakar

> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> > ---
> >  drivers/media/i2c/imx219.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index b1f30debe449..df2a6ed7c8ac 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -781,7 +781,7 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
> >         if (fse->index >= ARRAY_SIZE(supported_modes))
> >                 return -EINVAL;
> >
> > -       if (fse->code != imx219_get_format_code(imx219, imx219->fmt.code))
> > +       if (fse->code != imx219_get_format_code(imx219, fse->code))
> >                 return -EINVAL;
> >
> >         fse->min_width = supported_modes[fse->index].width;
> > --
> > 2.17.1
> >
