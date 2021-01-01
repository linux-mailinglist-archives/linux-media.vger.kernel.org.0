Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2E52E83F0
	for <lists+linux-media@lfdr.de>; Fri,  1 Jan 2021 15:21:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbhAAOUi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Jan 2021 09:20:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727134AbhAAOUh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Jan 2021 09:20:37 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4337AC0613C1
        for <linux-media@vger.kernel.org>; Fri,  1 Jan 2021 06:19:57 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id o13so49219164lfr.3
        for <linux-media@vger.kernel.org>; Fri, 01 Jan 2021 06:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QsPmcpPsnbLYhOMm5UbpDdIc3jRbIuXMnc0dIdfRJHg=;
        b=ErisSbaPcB8BB4XhBaWiauqo6oXZ2o5NsyVejRrRaKper3qCdYovSNVlXPD3wRx1xB
         UFwuAu4cpmxBx+mRF7I7XoC1BKvwvLnvuK1PpXRKuLEWxrP9GvrUlmZLJ93tADwZxdyY
         +b9Ce0wgIDopTSu5KBkkoRIHjCIrQp2SmxDdTKljJzHZzaYpFO8BWikWDK2tXiynpi/Y
         ayxFzMP5kebCNJvMaiH9BugTZs1fD4mB9U+6Q2J/3i982m/x7bKORtkO3EmFk+kttqrZ
         i6nwdpUIimpvx3Bc/HiB9YgWmjB88ghyc9bOXY0PAvZTcGzypsqNyKJs/PYXqCjj0K59
         433A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QsPmcpPsnbLYhOMm5UbpDdIc3jRbIuXMnc0dIdfRJHg=;
        b=FCPGOZq7RK30JxyL2ITwBc+LNW1LsGu4xXZPDSJaIN0g+lSycio6ikhK8R2nf9P3it
         jNbfxPMmIvf7NI90ww5mpjG4xHK9xupd3c8JnREG+zU9ynYGtBs1taCCjzGyiNHPrgZ4
         V+YQvHU+LoAR7lRW0CeOFAhTXiujatAeCIjbvrXQcQ9jLHqyhHpXrk7fdsMej08Tq64e
         eywhoVVUUIvHarQAd0CHr6jk/SeurjVeh1qC1+1z3FnCBzaNQt5HRz7zshOixQx0fopm
         qdwlslTaLRxR8AVgPw2yQp3ExUWjWB6B0l1QEAJhJ4n2yhQpdpZXdwLY+1gy+HOuw/1o
         6M0w==
X-Gm-Message-State: AOAM530B3tdmUGespf6ScJ0iCM8e0LKWAptfGgvR+HJ3F8ZmnM5i1eDF
        NifG/MkqJn05M86MztOGHsEzZxhUKRnmz0KUOfQtZw==
X-Google-Smtp-Source: ABdhPJxjCnV8DIPwpx74Q8C5a9/BZjmLvCTVWXleQYJzFd8wFli1vcpOuHDFfoh4HZJiP/V09zBm24OUcYJkBpc5Fmk=
X-Received: by 2002:a05:6512:3f3:: with SMTP id n19mr28579606lfq.586.1609510795503;
 Fri, 01 Jan 2021 06:19:55 -0800 (PST)
MIME-Version: 1.0
References: <20201201101350.1401956-1-linus.walleij@linaro.org>
 <20201201101350.1401956-2-linus.walleij@linaro.org> <20201230190907.GE25903@duo.ucw.cz>
In-Reply-To: <20201230190907.GE25903@duo.ucw.cz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 1 Jan 2021 15:19:44 +0100
Message-ID: <CACRpkdYtcmLc3GsJA8H0g_G55Cnffn2Tm2da6UOqyv2DSn_UXQ@mail.gmail.com>
Subject: Re: [PATCH 2/2 v7] leds: rt8515: Add Richtek RT8515 LED driver
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, newbytee@protonmail.com,
        Stephan Gerhold <stephan@gerhold.net>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        phone-devel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Pavel,

will send a new version with some minor tweaks!

On Wed, Dec 30, 2020 at 8:09 PM Pavel Machek <pavel@ucw.cz> wrote:

> > +     if (ret1 || ret2) {
> > +             dev_err(rt->dev,
> > +                     "either %s or %s missing from DT, using HW max\n"=
,
> > +                     resistance, max_ua_prop);
> > +             max_ma =3D RT8515_MAX_IOUT_MA;
> > +             max_intensity =3D hw_max;
> > +             goto out_assign_max;
> > +     }
>
> I'd go with some minimum values if we don't have complete information
> from devicetree.

I think this is safe because of the way the current limiting
resistors work, the device is designed to have hardware
constraints on currents. The max brightness is the max
current as limited by hardware. It is not possible to break
this LED with software.

Of course someone could have mounted the LED in violation
of the manual but ... we can't protect for everything I think.

The resistances etc is mainly here to give v4l an idea of the
current since V4L is a current-oriented API. Not a good fit
in this case, but with these DT properties we can make it fit
somewhat so ... =C2=AF\_(=E3=83=84)_/=C2=AF

> > +MODULE_LICENSE("GPL v2");
>
> v2+, iirc?

It seems GPL-2.0-or-late just use "GPL" as license so I changed
to that.

Yours,
Linus Walleij
