Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EBC2112CC0
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2019 14:38:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727883AbfLDNhz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Dec 2019 08:37:55 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:42268 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727530AbfLDNhz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Dec 2019 08:37:55 -0500
Received: by mail-il1-f193.google.com with SMTP id f6so6681138ilh.9;
        Wed, 04 Dec 2019 05:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+b0g+KEhsGSbMr8f59QsRUNDcK99rmsk3xClHRajYv8=;
        b=bTlKA8wS/DozQEHHB74GZRbgit+aAQ2EVrDJt4zQLpUQVHEF8Wdt6zUpqlZBJTHZ1W
         uXsNxfknQ6aRLAHOheTyuDb3+Rfrn02TZqFpV90i9NSNrWWbOiHiE9jWiq5kdoPe5CJC
         iGWeaabMNepDBWuR7WT+hdRSeVZ3UlVdLb0b+5p03aAmt6FFMTTqj1JD7DESZEZe9d00
         CYG6NmzJ2CuTPyuA4jk5lVXpt/EOY/tEdeXjccSUf+NEk/W6DsMv348e6TIl2TeMTKns
         e5iK6Yn/+yxd2pZYda7EB4SSfiAm3bO0Llp31CL/minmalQ17DDKbOEEBlOYoKbtQyk0
         4hYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+b0g+KEhsGSbMr8f59QsRUNDcK99rmsk3xClHRajYv8=;
        b=hMrY3jQPl3UYXWDBI+taWWkVs14ynXJ0b3t3drZsYkMUVXnTqKYsVIxxEBUIQBVEav
         LFCJNTW5Cpm0mUquvJEZELYGSG1mEfmVp6NZxdDqW0cKjSMgKpsmq2CiMJWo165yXo3+
         Mv3L/RFZg4TEfiIujENZ00+mCZBVtatelq7S8UtSubQfzew4+taWSLaN3cGHslq6HmTB
         /ikbDhHdrWpLd41FXs8umJJqc4hYZ7jjHr8zktlFpEwKuoea2nTY5jR+9BPAQjsye5rC
         dYmfh0KjksEEPGIXCK2yga45pmozCh5ZuJCccmQNufXE3co4/mUhOxxYb0n9LNNkgdl3
         lkKA==
X-Gm-Message-State: APjAAAWxp5SYLOAii12iAMEdKtqfV6hqdvzK7mgIyMAJ5Rv1bMKKFMuI
        oewKv+8lGncXrZXhc7Z2vautaLS+zXenaQ5/SdJ4Fq6z
X-Google-Smtp-Source: APXvYqz+4eY7fzeIA115HzD2/HdBg2qM64eGapJRh5UfVXMSymTEddhoTmqudiohtFS9r9NQfo+tWtwY5jBi/vYua+E=
X-Received: by 2002:a05:6e02:c2c:: with SMTP id q12mr3496269ilg.205.1575466674334;
 Wed, 04 Dec 2019 05:37:54 -0800 (PST)
MIME-Version: 1.0
References: <20191204130907.19799-1-aford173@gmail.com> <20191204132557.pl6rwfprtcwewato@uno.localdomain>
In-Reply-To: <20191204132557.pl6rwfprtcwewato@uno.localdomain>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 4 Dec 2019 07:37:43 -0600
Message-ID: <CAHCN7xLKBWoHVPZqcgMTuY7dMM7UhwU9kOyzALhHyvf7fTLeng@mail.gmail.com>
Subject: Re: [PATCH V2] media: ov5640: Fix check for PLL1 exceeding max
 allowed rate
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 4, 2019 at 7:23 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hi Adam,
>
> On Wed, Dec 04, 2019 at 07:09:07AM -0600, Adam Ford wrote:
> > The PLL calculation routine checks the wrong variable name 'rate'
> > when it should be called '_rate' when checking to see whether or
> > not the PLL1 output frequency exceeds 1GHz.
> >
> > This patch changes it to the correct variable '_rate'
> >
> > Acked-by: Jacopo Mondi <jacopo@jmondi.org>
> > Signed-off-by: Adam Ford <aford173@gmail.com>
>
> Why have you dropped the fixes tag you had in v1?
>
> Fixes: aa2882481cad ("media: ov5640: Adjust the clock based on the expected rate")
>
> I'm not the one who collects patches, so maybe wait for Sakari or Hans
> to tell you if you need to resend or not :)

It wasn't intentional.  I couldn't find the original patch nor could I
find it in patchwork, so I re-did it from scratch and forgot.
(I have too many different computers)

I already sent a V3 before I read your e-mail.  Sorry about that.

adam

>
> Thanks
>    j
>
> > ---
> > V2:  No code change.  Only change commit description to be less confusing.
> >
> > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > index 5e495c833d32..bb968e764f31 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -874,7 +874,7 @@ static unsigned long ov5640_calc_sys_clk(struct ov5640_dev *sensor,
> >                        * We have reached the maximum allowed PLL1 output,
> >                        * increase sysdiv.
> >                        */
> > -                     if (!rate)
> > +                     if (!_rate)
> >                               break;
> >
> >                       /*
> > --
> > 2.20.1
> >
