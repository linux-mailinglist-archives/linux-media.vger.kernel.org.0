Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 346AB44DC2D
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 20:31:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231754AbhKKTdr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 14:33:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbhKKTdq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 14:33:46 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E801DC061766
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 11:30:56 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id d5so11602703wrc.1
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 11:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rm56SCqAXb5uOyc72Bo1A0nWO7aIt/JfY9K6Wibt22A=;
        b=ZlXI/Xv9cUajKr1koyCV4xSbtY1lZSzj04i/YurC3WfSFy45QvgkbQ7B18cBYElM1/
         24buOHhukeMGmHIkbIG8KUzYMsItbq/YAIy76qE2EVIu+a+tCQiQiDRG6/MLm76y1RP6
         N1PU6Af9JDtSTdcy8KL0FwM0RLeJRjXYPwNc7Q3O4wz7ox6u4wb3YLbOo6KAq4XTg3TP
         ME+C0EtfhnF/5Cffef5LafaXqmLeRk2xcLsRCiYx37xiyaxS7VYg5jxg0zoDRAdR/6pu
         pkPtHbeUTWNGlZjgFOJUEAcEuPAivAL77g7SXUNUKv3i5jEWEsZTH8QkJ6zaw5QfjoC8
         VXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rm56SCqAXb5uOyc72Bo1A0nWO7aIt/JfY9K6Wibt22A=;
        b=1OtaNom3E61Pl5GLsREspPQ3y0ica0X4jlQM269fB4/9k/m7ssFgb1ai+7bjUWjiHY
         +cJhdC2z2kNOCHfxpTuZu0iDStfdnardM8GuvRkaydq3byD5JeFQf5OlLQuB2zxQRc6e
         bX1TTEfgrdf7ZGBD/J5VwViekTOS1//euKP7b80uVlaQ50Zcg2NxAWzfvBNuPk2pqHET
         XMy4Z66Di6UpXdjTncINDHvbZtqvFjMEAmLBC9C7Yr7OvwojNrVpUeKWhukiSK+BcF7o
         CTEGy3m/XSGz79MiH24WS9aZtM6CYTzUZfv1MU7lr90cdJph53z1CeU7IKAMCNz0hdZZ
         BQDQ==
X-Gm-Message-State: AOAM530if33YFIJn0Ihub15Z70Y2KLACYwdab2O0lTWFhNLMP91vp9Z7
        XGgekdQ9AzI0rodx0gvcQJy4Lcjsi+LkSqsrHUS0jA==
X-Google-Smtp-Source: ABdhPJwP/zQ8Io2BSfNk/+Y5OzMOn0xtaXTvpjgHoIv3PpmeghMiZcO3Z5QNAZnKtEl44NoLscCANB719IKlfZpVWDI=
X-Received: by 2002:a5d:5850:: with SMTP id i16mr11432881wrf.197.1636659055425;
 Thu, 11 Nov 2021 11:30:55 -0800 (PST)
MIME-Version: 1.0
References: <e2312277-f967-7d3f-5ce9-fbb197d35fd6@gmail.com>
 <3b61bb2d-1136-cf35-ba7a-724da9642855@gmail.com> <418dc16a-2a03-7604-a8e2-31c5ddfcf436@redhat.com>
 <58dabc46-211c-844d-3ed3-fd2411936d6d@gmail.com> <b0a6a762-3445-7c61-3510-6bd493f8e0fa@redhat.com>
 <d0f969f6-e029-7c28-17ce-79b8228ddaee@gmail.com> <b77cf78f-ea5e-adcc-a1b8-8cff77ebf847@gmail.com>
 <bbfb4bd6-871a-eb14-653c-64c05c22e165@redhat.com> <29bf3454-2f82-7791-2aa2-c5e1cb5610a5@gmail.com>
 <6ee7c491-4636-8819-c954-dfc6abcfd1a5@gmail.com> <495cbb6b-656d-6c3b-669a-f4b588e970cc@redhat.com>
 <a26f70ae-203e-99fd-8e4d-484af6f207f7@gmail.com> <4c7b9d72-4634-ea1d-5fff-bf17c3834b72@redhat.com>
 <CAPY8ntBZpZjecHNCMf-eMefcp2EgmbqkXMt4p=UeOe0n-o8WrA@mail.gmail.com> <6e832988-4810-fe59-7357-886b286697a0@redhat.com>
In-Reply-To: <6e832988-4810-fe59-7357-886b286697a0@redhat.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 11 Nov 2021 19:30:39 +0000
Message-ID: <CAPY8ntB3pT4EqornywTtqcn4_iD-QUHPkApq=nb3XCc+6CuepA@mail.gmail.com>
Subject: Re: Fwd: Surface Go VCM type (was: Need to pass acpi_enforce_resources=lax
 on the Surface Go (version1))
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera devel <libcamera-devel@lists.libcamera.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 11 Nov 2021 at 16:50, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 11/11/21 16:51, Dave Stevenson wrote:
> > Hi Hans
> >
> > On Thu, 11 Nov 2021 at 15:23, Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Hi,
> >>
> >> On 11/11/21 12:18, Daniel Scally wrote:
> >>
> >> <snip>
> >>
> >>>>> One problem I'm experiencing
> >>>>> is that the focus position I set isn't maintained; it holds for a couple
> >>>>> of seconds and then resets to the "normal" focus...this happens when the
> >>>>> .close() callback for the driver is called, which happens right after
> >>>>> the control value is applied. All the other VCM drivers in the kernel
> >>>>> power down on .close() so I did the same>
> >>>> Right, I believe that this is fine though, we expect people to use
> >>>> libcamera with this and once libcamera gets autofocus support, then
> >>>> I would expect libcamera to keep the fd open the entire time while
> >>>> streaming.
> >>>
> >>>
> >>> OK - as long as that's how it works then I agree that this is fine as is
> >>> yes.
> >>
> >> So I've just picked up an old project of mine, called gtk-v4l which
> >> is a nice simply v4l2 controls applet and patches it up to also
> >> work on v4l-subdevs:
> >>
> >> https://github.com/jwrdegoede/gtk-v4l/
> >>
> >> So now you can run:
> >>
> >> sudo gtk-v4l -d /dev/v4l-subdev8
> >>
> >> And it will give you a slider to control the focus; and as
> >> a bonus it keeps the v4l-subdev open, so no more runtime-pm
> >> issue :)
> >
> > Do the lens and sensor share a regulator / enable GPIO?
>
> No, if they did then there would be no runtime-pm issue,
> because then the VCM would not get turned off after
> a v4l2-set command (for a quick test) since then the
> streaming from the sensor would keep the sensor and
> thus the regulator on.

Registering with the regulator was more so that it restored the
position on sensor power up, independent of whether the lens driver
was opened or not.

> > I was looking at the same issue for a Sony IMX135 module with AD5398
> > VCM driver [1].
> > In my case they do share an enable GPIO, so using regulator-gpio we
> > can register via regulator_register_notifier for information on when
> > the regulator is powered up. It can then also reset to the last
> > position should the sensor subdev enable the regulator without the
> > lens driver being opened at all.
>
> That sounds like it is relying on board-depedent behavior
> (the enable GPIO and/or regulator being shared) which we don't
> want in the VCM drivers as those are supposed to be board
> agnostic.

All platforms I've encountered so far have used the same GPIO to
control both VCM and sensor, hence why I asked. The number of use
cases where you want one without the other is incredibly low, and
hardware guys generally don't like wasting GPIOs or having to route
them around the PCB. It's interesting that your platform has separated
them.

> This really is something which should be fixed in userspace
> where the userspace consumer of the sensor should also always
> open the vcm v4l-subdev.

Not all use cases involve libcamera, and what you're proposing is
making life very difficult for the simple use cases.
There may be GStreamer folk on board with libcamera, but I've heard no
noises from FFmpeg about libcamera support. V4L2 is still the default
API that users generally care about. Particularly with mono sensors
the output is often directly usable without worrying about the
complexities of ISPs, but you're effectively saying "jump through lots
of hoops or you can't use a VCM with these sensors".

If userspace has called VIDIOC_STREAMON doesn't that mean they want
the whole entity (as configured) to be powered on and start streaming?
Are you saying that the lens isn't part of that entity? In which case
why does Media Controller include it (and eventually link it to the
sensor) in the media entity?

Would you advocate making backlight control in DRM a function that
userspace is responsible for independently of the panel pipeline?
There are significant similarities to this situation as the panel
isn't usable without the backlight being powered, same as the sensor
isn't usable without the VCM being powered.

Sorry, but I just see isolating power control for the VCM from the
sensor in this way to be a very odd design decision. It'd be
interesting to hear other views.

  Dave
