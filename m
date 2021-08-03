Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F77A3DE6FC
	for <lists+linux-media@lfdr.de>; Tue,  3 Aug 2021 09:07:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234157AbhHCHII (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Aug 2021 03:08:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234126AbhHCHIG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Aug 2021 03:08:06 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D87DC06175F
        for <linux-media@vger.kernel.org>; Tue,  3 Aug 2021 00:07:55 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id pj14-20020a17090b4f4eb029017786cf98f9so3455411pjb.2
        for <linux-media@vger.kernel.org>; Tue, 03 Aug 2021 00:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WN6UWlQHlJrqX7fWKP3w+a4gz17W1v3husZzZ4lYdZs=;
        b=FG0BxQgTNclREe9wLVv4qS4z2N2sM3E8tcxJy7sG5CSbcRPTBPLmmzNBD++56n1i0Y
         iAlp6ISBOSnkdYxdVe/Zu8i/Zkxikk3+SUwgoKONvFraMu/GvvzYdYTtcdIyhpEuRhHy
         dvyre83Eg6GNEFlItaCRt9/Z7jox9BnAyajaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WN6UWlQHlJrqX7fWKP3w+a4gz17W1v3husZzZ4lYdZs=;
        b=hij7xYSyyBCldN7bbLOXTKADaze4z3V5IO02MqceyZ4JZBQEDPOsk7/mmwB/ps9H3H
         EuBZYlD4Yw243ZIUQLYscB9bQp+4F1wm+/x2mVhReoJQ6nc/fd3CPOM7YxjChLLV2Isa
         PUg5S+h/xm7W/g2mF+MtYNoJrb+JZQITj1LyOCa27HjiS4lz3J4ivxXcjMdE0+nC2UM6
         iIWVtQUZALthct2wiBCBKLXdKjP9ozYWLfVYa8ZirOk1SrmAztn+QZQ+9pUtNvCFJtEJ
         ujPm6CvXP5A6mpuIC6RI82Zed+vJLpXMryskRw0SyEFfJ/hw7tQeBoV1GKp4lAXGiQoO
         02nw==
X-Gm-Message-State: AOAM530MpoJ/tOEGTQ5Vq63TRdEnFwXTTMFfef6MfAgLXmiqgzxx5UNz
        r6gpgN/2Stwc9OlKvXM7i+NvnQ==
X-Google-Smtp-Source: ABdhPJzwY/O8zGrmytB0XZTu4NI3puVLQ4qTvp0bifc+rcCa4MZIaf+qz4BUpXKkmLFaMBheKpJfSg==
X-Received: by 2002:a65:63cf:: with SMTP id n15mr189772pgv.392.1627974475115;
        Tue, 03 Aug 2021 00:07:55 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c14sm15852676pgv.86.2021.08.03.00.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 00:07:54 -0700 (PDT)
Date:   Tue, 3 Aug 2021 00:07:53 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Len Baker <len.baker@gmx.com>
Cc:     "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-hardening@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Joe Perches <joe@perches.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] drivers/input: Remove all strcpy() uses in favor of
 strscpy()
Message-ID: <202108022354.49612943B7@keescook>
References: <20210801144316.12841-1-len.baker@gmx.com>
 <20210801145959.GI22278@shell.armlinux.org.uk>
 <20210801155732.GA16547@titan>
 <202108010934.FA668DEB28@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202108010934.FA668DEB28@keescook>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Aug 01, 2021 at 09:44:33AM -0700, Kees Cook wrote:
> On Sun, Aug 01, 2021 at 05:57:32PM +0200, Len Baker wrote:
> > Hi,
> > 
> > On Sun, Aug 01, 2021 at 04:00:00PM +0100, Russell King (Oracle) wrote:
> > > On Sun, Aug 01, 2021 at 04:43:16PM +0200, Len Baker wrote:
> > > > strcpy() performs no bounds checking on the destination buffer. This
> > > > could result in linear overflows beyond the end of the buffer, leading
> > > > to all kinds of misbehaviors. The safe replacement is strscpy().
> > > >
> > > > Signed-off-by: Len Baker <len.baker@gmx.com>
> > > > ---
> > > > This is a task of the KSPP [1]
> > > >
> > > > [1] https://github.com/KSPP/linux/issues/88
> > > >
> > > >  drivers/input/keyboard/locomokbd.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/input/keyboard/locomokbd.c b/drivers/input/keyboard/locomokbd.c
> > > > index dae053596572..dbb3dc48df12 100644
> > > > --- a/drivers/input/keyboard/locomokbd.c
> > > > +++ b/drivers/input/keyboard/locomokbd.c
> > > > @@ -254,7 +254,7 @@ static int locomokbd_probe(struct locomo_dev *dev)
> > > >  	locomokbd->suspend_jiffies = jiffies;
> > > >
> > > >  	locomokbd->input = input_dev;
> > > > -	strcpy(locomokbd->phys, "locomokbd/input0");
> > > > +	strscpy(locomokbd->phys, "locomokbd/input0", sizeof(locomokbd->phys));
> > >
> > > So if the string doesn't fit, it's fine to silently truncate it?
> > 
> > I think it is better than overflow :)
> > 
> > > Rather than converting every single strcpy() in the kernel to
> > > strscpy(), maybe there should be some consideration given to how the
> > > issue of a strcpy() that overflows the buffer should be handled.
> > > E.g. in the case of a known string such as the above, if it's longer
> > > than the destination, should we find a way to make the compiler issue
> > > a warning at compile time?
> > 
> > Good point. I am a kernel newbie and have no experience. So this
> > question should be answered by some kernel hacker :) But I agree
> > with your proposals.
> > 
> > Kees and folks: Any comments?
> > 
> > Note: Kees is asked the same question in [2]
> > 
> > [2] https://lore.kernel.org/lkml/20210731135957.GB1979@titan/
> 
> Hi!
> 
> Sorry for the delay at looking into this. It didn't use to be a problem
> (there would always have been a compile-time warning generated for
> known-too-small cases), but that appears to have regressed when,
> ironically, strscpy() coverage was added. I've detailed it in the bug
> report:
> https://github.com/KSPP/linux/issues/88
> 
> So, bottom line: we need to fix the missing compile-time warnings for
> strcpy() and strscpy() under CONFIG_FORTIFY_SOURCE=y.

I've got these fixed now, and will send them out likely tomorrow, but I
did, in fact, find 4 cases of truncation, all in v4l, and all appear to
have been truncated since introduction:

struct v4l2_capability {
...
        __u8    card[32];
(stores 31 characters)

drivers/media/radio/radio-wl1273.c:1282
wl1273_fm_vidioc_querycap()
            strscpy(capability->card, "Texas Instruments Wl1273 FM Radio",
                    sizeof(capability->card));
33 characters, getting truncated to:
Texas Instruments Wl1273 FM Rad
87d1a50ce45168cbaec10397e876286a398052c1

drivers/media/radio/si470x/radio-si470x-usb.c:514
si470x_vidioc_querycap()
#define DRIVER_CARD "Silicon Labs Si470x FM Radio Receiver"
            strscpy(capability->card, DRIVER_CARD,
sizeof(capability->card));
37 characters, getting truncated to:
Silicon Labs Si470x FM Radio Re
78656acdcf4852547a29e929a1b7a98d5ac65f17

drivers/media/radio/si470x/radio-si470x-i2c.c:225
si470x_vidioc_querycap()
#define DRIVER_CARD "Silicon Labs Si470x FM Radio Receiver"
            strscpy(capability->card, DRIVER_CARD,
sizeof(capability->card));
37 characters, getting truncated to:
Silicon Labs Si470x FM Radio Re
cc35bbddfe10f77d949f0190764b252cd2b70c3c

drivers/media/usb/tm6000/tm6000-video.c:855
vidioc_querycap()
            strscpy(cap->card, "Trident TVMaster TM5600/6000/6010",
                    sizeof(cap->card));
33 characters, getting truncated to:
Trident TVMaster TM5600/6000/60
e28f49b0b2a8e678af62745ffdc4e4f36d7283a6

How should these be handled? I assume v4l2_capability::card can't be
resized since it's part of IOCTL response, so likely all the string just
need to be shortened in some way? Seems like dropping the manufacturer
name makes the most sense, since manufacturer can be kind of derived
from the driver names.

Thoughts?

-Kees

-- 
Kees Cook
