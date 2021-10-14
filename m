Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76E4642D5E4
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 11:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbhJNJX4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 05:23:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbhJNJXz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 05:23:55 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7259BC061570
        for <linux-media@vger.kernel.org>; Thu, 14 Oct 2021 02:21:50 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id y12so22056982eda.4
        for <linux-media@vger.kernel.org>; Thu, 14 Oct 2021 02:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NGncwgjmk01R1NOxUaIUXmvnjt5Mds85Um8dafRY7yk=;
        b=repqRrWxU+iPzYcYfh8M8XLUpe0NITrQu8HzQy1uwAZzUE/rLtT5ri32q+N6CavXdv
         sUeAGznWSBGPCdINirP09NOLuJC8vqCbrwr76bpc0IktvmffYjm2dn8MrYaPCNWKNA3r
         juABNPy136bL4WEIQI2/1NtSWSTwhhn27KsP0/BR1FnOoI0KBY9m+klw008+DvgPCOS0
         YpfmEpGj8qtBtYW7Y2UNVaoaG2VCbotL45sK2JRGWC2eXTVZfqnnWAD23G70vyJJE66p
         Us4ZbM6jTxJtHvU6DZWX5z4lXq9O6LdEq0GMZkiVZrQafBVvppOcbYNbrdvpks0WYKLJ
         dEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NGncwgjmk01R1NOxUaIUXmvnjt5Mds85Um8dafRY7yk=;
        b=EVKMICxicYpE5JDOiajAkQkO44H4eD95T7A/6xxe0iAVTNnANI2mMOuN91UsTj0hGA
         d1ARVTIuhccD4m/iYqzuhkzhzDzoAJKXPrP2vPWvCGjiGBNneNifTKB2ysJVoeiLDDPa
         E/Z9lQjBLmQ7605daQMJOfOha1Vqp9EC5X6/vJUJkBNWPBJUWhxaTaf+TZnYgd9CccaQ
         9oFv2pmju05BAJR2CRSVvu+0ILTyDlbzHFqqjO5fmx9Cscy/kmEO9b6vOhjPdppqft0U
         a/idpziwPiU3ClVxnQoY/u/fURmyrF1VSZIO1qv/cakCbZuFrm5J80DBpAH2eEnjUlvH
         SbUw==
X-Gm-Message-State: AOAM532E7l2dvpSDhTFz3k8gyJ9blLu4guPcgKPrxk94X669dLkWgdTJ
        tXd8A9ysbA6yQgXx4Z7cQvwFP8/iIeAl3eJQmZ0s7g==
X-Google-Smtp-Source: ABdhPJz4s2QP6UIoCo9OwSip58KCjHJQMQ+kWfTViXAfNhpFfiV/KhW2sF8pG64rqgtRczm1eXmRXuqpKc5+gVi0WBA=
X-Received: by 2002:a17:906:11cd:: with SMTP id o13mr2508126eja.208.1634203308887;
 Thu, 14 Oct 2021 02:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211008100423.739462-1-wenst@chromium.org> <f108f23dadc846222c63c88af826dae9c5082d83.camel@ndufresne.ca>
 <CAGXv+5FnFq1mN79sqUp-o6pHirYvp55gurnsUCgqYvEAX2=4oQ@mail.gmail.com>
 <ff0769efee51e15451d48e23860f8b1710593cd7.camel@ndufresne.ca>
 <CAGXv+5GJCaxnPPkXRp5xrTBuq-5=ggfjPbRhyS4vdm3meM_4eg@mail.gmail.com>
 <CAAEAJfAratFPK0iU8QWMr36ZFCL5cgBneKkzymy+gCgJV=goOg@mail.gmail.com> <CAGXv+5FsjNihOfvLib=MHf9Qq3X3t=fR2BY4myQ1tivkSJc6pw@mail.gmail.com>
In-Reply-To: <CAGXv+5FsjNihOfvLib=MHf9Qq3X3t=fR2BY4myQ1tivkSJc6pw@mail.gmail.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Thu, 14 Oct 2021 06:21:37 -0300
Message-ID: <CAAEAJfCTtXsZ9zHKadDYHRUr_xUS2qQyiQ-0gGRw2oVZEcUcgw@mail.gmail.com>
Subject: Re: [PATCH 0/2] media: rkvdec: Align decoder behavior with Hantro and Cedrus
To:     Chen-Yu Tsai <wenst@chromium.org>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 14 Oct 2021 at 05:57, Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Thu, Oct 14, 2021 at 4:46 PM Ezequiel Garcia
> <ezequiel@vanguardiasur.com.ar> wrote:
> >
> > On Thu, 14 Oct 2021 at 04:31, Chen-Yu Tsai <wenst@chromium.org> wrote:
> > >
> > > On Wed, Oct 13, 2021 at 9:40 PM Nicolas Dufresne <nicolas@ndufresne.c=
a> wrote:
> > > >
> > > > Le mercredi 13 octobre 2021 =C3=A0 15:05 +0800, Chen-Yu Tsai a =C3=
=A9crit :
> > > > > Hi,
> > > > >
> > > > > On Fri, Oct 8, 2021 at 11:42 PM Nicolas Dufresne <nicolas@ndufres=
ne.ca> wrote:
> > > > > >
> > > > > > Hi Chen-Yu,
> > > > > >
> > > > > > thanks for looking into this.
> > > > > >
> > > > > > Le vendredi 08 octobre 2021 =C3=A0 18:04 +0800, Chen-Yu Tsai a =
=C3=A9crit :
> > > > > > > Hi everyone,
> > > > > > >
> > > > > > > While working on the rkvdec H.264 decoder for ChromeOS, I not=
iced some
> > > > > > > behavioral differences compared to Hantro and Cedrus:
> > > > > > >
> > > > > > > 1. The driver always overrides the sizeimage setting given by=
 userspace
> > > > > > >    for the output format. This results in insufficient buffer=
 space when
> > > > > > >    running the ChromeOS video_decode_accelerator_tests test p=
rogram,
> > > > > > >    likely due to a small initial resolution followed by dynam=
ic
> > > > > > >    resolution change.
> > > > > > >
> > > > > > > 2. Doesn't support dynamic resolution change.
> > > > > > >
> > > > > > > This small series fixes both and aligns the behavior with the=
 other two
> > > > > > > stateless decoder drivers. This was tested on the downstream =
ChromeOS
> > > > > > > 5.10 kernel with ChromeOS. Also compiled tested on mainline b=
ut I don't
> > > > > > > have any other RK3399 devices set up to test video stuff, so =
testing
> > > > > > > would be very much appreciated.
> > > > > > >
> > > > > > > Also, I'm not sure if user applications are required to check=
 the value
> > > > > > > of sizeimage upon S_FMT return. If the value is different or =
too small,
> > > > > > > what can the application do besides fail? AFAICT it can't spl=
it the
> > > > > > > data of one frame (or slice) between different buffers.
> > > > > >
> > > > > > While most software out there just assumes that driver will do =
it right and
> > > > > > crash when it's not the case, application that do map the buffe=
r to CPU must
> > > > > > read back the fmt structure as the drivers are all fail-safe an=
d will modify
> > > > > > that structure to a set of valid value s for the context.
> > > > >
> > > > > I believe what is happening in Chromium is that the decoder is op=
ened with
> > > > > some default settings, including the smallest viable resolution f=
or the
> > > > > output side, and the buffers allocated accordingly. When dynamic =
resolution
> > > > > change happens, the decoder does not check if the current buffers=
 are
> > > > > sufficiently sized; it just assumes that they are. And when it st=
arts
> > > > > pushing data into the buffers, it realizes they are too small and=
 fails.
> > > > >
> > > > > The spec also says:
> > > > >
> > > > >     Clients are allowed to set the sizeimage field for variable l=
ength
> > > > >     compressed data flagged with V4L2_FMT_FLAG_COMPRESSED at ioct=
l
> > > > >     VIDIOC_ENUM_FMT, but the driver may ignore it and set the val=
ue itself,
> > > > >     or it may modify the provided value based on alignment requir=
ements or
> > > > >     minimum/maximum size requirements.
> > > > >
> > > > > The spec only guarantees that the buffers are of sufficient size =
for the
> > > > > resolution configured at the time they were allocated/requested.
> > > > >
> > > > > So I think my first patch is a workaround for a somewhat broken u=
serspace.
> > > > > But it seems the other stateless drivers are providing similar be=
havior,
> > > > > as I previously mentioned.
> > > >
> > > > That's what I mean, this is not a driver bug strictly speaking (ass=
uming it does
> > > > guaranty the buffer size is sufficient) but it is without your chan=
ge
> > > > inconvenient, as userspace may be aware of the largest resolution i=
t will
> > > > decode, and may want to allocate larger buffer upfront.
> > >
> > > Thinking about this more, I think a few follow up fixes for each driv=
er
> > > are in order. The spec implies that the driver should override the va=
lue
> > > should userspace give some unrealistic value, such as asking for a 25=
6 byte
> > > buffer for a 4K frame size.
> > >
> >
> > Where is the spec implying that?
>
> In Documentation/userspace-api/media/v4l/pixfmt-v4l2-mplane.rst:
>
>     Clients are allowed to set the sizeimage field for variable length
>     compressed data flagged with ``V4L2_FMT_FLAG_COMPRESSED`` at
>     :ref:`VIDIOC_ENUM_FMT`, but the driver may ignore it and set the
>     value itself, or it may modify the provided value based on
>     alignment requirements or minimum/maximum size requirements.
>
> I guess I read "minimum/maximum size requirements" a bit liberally.
> Maybe it refers to how much buffer space the hardware can address or
> program for each request?
>

My interpretation is that the driver may modify the value to adjust
for hardware requirements in terms of buffer alignment hardware requirement=
s
and buffer size hardware requirements.

> > This is encoded content, so I'm really inclined to avoid this path.
> > Having the driver decide what is "unrealistic" would mean some
> > heuristics in the drivers for something that should really come from us=
erspace.
>
> And if the driver refuses to give adequate buffer space, then it's a bug?
>

Not sure what you have in mind here. S_FMT typically won't fail,
as the spec mentions
https://www.kernel.org/doc/html/v4.9/media/uapi/v4l/vidioc-g-fmt.html?highl=
ight=3Ds_fmt#c.VIDIOC_S_FMT.
So the only way a driver can refuse, as you mentioned,
is by overriding a parameter (which is what you are fixing).

"""
Drivers should not return an error code unless the type field is
invalid, this is a mechanism to fathom device capabilities and to
approach parameters acceptable for both the application and driver. On
success the driver may program the hardware, allocate resources and
generally prepare for data exchange.
"""

The driver should just use what application provided for the buffer sizeima=
ge.
Let me quote your cover letter question:

"""
Also, I'm not sure if user applications are required to check the value
of sizeimage upon S_FMT return. If the value is different or too small,
what can the application do besides fail? AFAICT it can't split the
data of one frame (or slice) between different buffers.
"""

If the sizeimage is not adequate and the application knows this,
then it can only conclude the operation is not possible on this hardware.

However, if I understand correctly, that's why you are fixing rkvdec.
Because the rkvdec driver shouldn't override the value from the application=
,
since that may be wrong (besides being suboptimal).

Hope this makes sense...

Thanks,
Ezequiel

>
> Regards
> ChenYu
>
>
> > Thanks,
> > Ezequiel
> >
> > > Cedrus (CCing Jernej) comes close, but a 1K buffer might not be enoug=
h for
> > > really large frames, even though it's slice based?
> > >
> > > ChenYu
> > >
> > >
> > > > As per Chromium bug, this is being addressed already. Thanks for th=
is driver
> > > > improvement.
> > > >
> > > > >
> > > > > > As for opposite direction (output vs capture) format being chan=
ged, this should
> > > > > > be documented in the spec, if you find it too unclear or missin=
g for sateless
> > > > > > codec (I know it's there for stateful but can't remember, would=
 have to re-read,
> > > > > > for stateless) let us know.
> > > > >
> > > > > AFAICT the capture side is working OK and to spec.
> > > > >
> > > > >
> > > > > Regards
> > > > > ChenYu
> > > > >
> > > > > > regards,
> > > > > > Nicolas
> > > > > >
> > > > > > >
> > > > > > > Andrzej, I believe the second patch would conflict with your =
VP9 series.
> > > > > > >
> > > > > > >
> > > > > > > Regards
> > > > > > > ChenYu
> > > > > > >
> > > > > > > Chen-Yu Tsai (2):
> > > > > > >   media: rkvdec: Do not override sizeimage for output format
> > > > > > >   media: rkvdec: Support dynamic resolution changes
> > > > > > >
> > > > > > >  drivers/staging/media/rkvdec/rkvdec-h264.c |  5 +--
> > > > > > >  drivers/staging/media/rkvdec/rkvdec.c      | 40 +++++++++++-=
----------
> > > > > > >  2 files changed, 23 insertions(+), 22 deletions(-)
> > > > > > >
> > > > > >
> > > > > >
> > > >
> > > >
