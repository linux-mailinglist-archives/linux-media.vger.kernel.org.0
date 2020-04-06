Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8002719FE2B
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 21:39:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbgDFTjc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 15:39:32 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43659 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbgDFTjc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 15:39:32 -0400
Received: by mail-lj1-f196.google.com with SMTP id g27so991011ljn.10
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2020 12:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zed8MZ9tqU8zJLxpXevi+qYlhEAlVWolHnBCcHs5lts=;
        b=tUz+EO0FX/ShlvqFKktzDSIxrUjp38TPSZSJucYzbJ+0rn+jkHFK/zB/AEVNdlZuEc
         4n2OGZ/QaMOe+Q3Pbkq906k2BKXwu/GllYUE2p72tvxKhqDhER/s+M9NnBPyKwKcpUSX
         ooKvz8jm8V/unbCA2ZDJUxCri7+WQZ1VB6+7xgRj5q84jBF8k+5irNiLnFY99CfAO/81
         1Mnfbs7plykPfn/WSL3oIvwCyFU0wBG7aGMI0ccgH45JKC472x2t+45JgFeCDiqCt4eQ
         UlTPrA+H/pOgDCBkjTHUIIoA6CIdUf4X0QwDs4IIR/9ucf1Kk1KR6HP/wrCA2I2pYamt
         4XDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zed8MZ9tqU8zJLxpXevi+qYlhEAlVWolHnBCcHs5lts=;
        b=GmKe4OA5rGej6NparnOnZFNXhTKkpT25CnXHr52gPxJDv4XPPvyHM3iYYdpdYgavjB
         RlbblVq24jZu4s6jqzTRUkO+zJDS+CEkx5YRmtv7WzrNuULC1nRtLfm8rl4qeP3OUB2k
         RtugK2c8RVt89EOafa1zQtU2dVQNk7eUQD5YO9MP85EE/qZYI3kHE0A2vHRYYy6Ft3MF
         r1tP6rD4tLdaaxvI2JrTIcJ9AWFlJKqB4wWUi20VP7uxf36lMdxpN2mj6xrQD1Ls5/Fm
         uzUJnuEYbljpOTjxintH/5HV6FLHnzxluDK/pgGzpMVEOJEVAp7GwM9KCJRu3dx+pAkl
         4zvQ==
X-Gm-Message-State: AGi0PubBlJL9ypBmy/ZgVU+MqjlZgYkXHg4BZU5pSMC8jdIbVEsLKXcK
        jw8vwEv/v5tR4V8vXtzFL3snGg9/T9Y6G/QvMa4=
X-Google-Smtp-Source: APiQypILn62fYoAJu/VozXYMJn2ggAsB2Rsv5a8Dz+wgR2S3I2STX0bg7la/3MmSmF6fPpC0DfOWhjIWVMCWsVS/WC4=
X-Received: by 2002:a05:651c:30b:: with SMTP id a11mr529016ljp.164.1586201970239;
 Mon, 06 Apr 2020 12:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5BQEHA-+pMmKzQj8kteNgMACYP==ezFdz_oYhJYFWKXSw@mail.gmail.com>
 <77add588-5756-8684-3e8f-0f46cbb2442b@gmail.com> <CAOMZO5C32M-JzCtfd7_=HtyfMqyqYd6adUEj1XRB6SYGoq0a0Q@mail.gmail.com>
 <CAOMZO5Ask2GF7fA=K6_RYF7138YEhsg4ERqvyS5SRt6jkh8QvQ@mail.gmail.com> <65b57718-a60e-66bf-61ba-348457fc524f@gmail.com>
In-Reply-To: <65b57718-a60e-66bf-61ba-348457fc524f@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 6 Apr 2020 16:39:53 -0300
Message-ID: <CAOMZO5C95_G_Zeff2NRJZ4fxH29VfJP7B74H3h+bMp05WGF2Rg@mail.gmail.com>
Subject: Re: imx6: Cannot register mem2mem
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Tim Harvey <tharvey@gateworks.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

[Adding Nicolas]

On Mon, Apr 6, 2020 at 3:50 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:

> > Ok, so now I connected the ov5640 module as per your suggestion and
> > this is what I get with a clean 5.6.2:
> >
> > [    6.618296] imx-media: ov5640 1-003c:0 -> imx6-mipi-csi2:0
> > [    6.644522] imx-media: Registered ipu_ic_pp csc/scaler as /dev/video8
>
> This shows that imx-media completed probe (v4l2 core called its probe
> complete callback).

Yes, correct: /dev/video8 is the mem2mem device.

> > However,  the v4l2video8convert Gstreamer element is not detected:
> >
> > # gst-inspect-1.0 | grep convert
> > video4linux2:  v4l2convert: V4L2 Video Converter
> > audioconvert:  audioconvert: Audio converter
> >
> > If I do the kernel hack I mentioned previously then I can get v4l2video8convert:
> >
> > --- a/drivers/media/v4l2-core/v4l2-async.c
> > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > @@ -213,10 +213,6 @@ v4l2_async_notifier_try_complete(struct
> > v4l2_async_notifier *notifier)
> >          if (!notifier->v4l2_dev)
> >                  return 0;
> >
> > -       /* Is everything ready? */
> > -       if (!v4l2_async_notifier_can_complete(notifier))
> > -               return 0;
> > -
> >          return v4l2_async_notifier_call_complete(notifier);
>
> That's very odd, because v4l2_async_notifier_call_complete() was
> definitely called on the imx-media root notifier from above.

Yes, I agree.

> Is there is another v4l2 driver that is not completing?

Yes, there are some that do not complete, but the mem2mem is getting probed.

Maybe a Gstreamer issue?

Nicolas,

I am using Gstreamer 1.16.2 on i.MX6 and cannot get the
v4l2video8convert to show up.

The mem2mem appears at /dev/video8 and it corresponds to i.MX6
ipu_ic_pp csc/scaler.

Any suggestions?

Thanks
