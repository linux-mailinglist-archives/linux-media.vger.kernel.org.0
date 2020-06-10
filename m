Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5290B1F5648
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 15:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbgFJN4M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 09:56:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbgFJN4L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 09:56:11 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D7E0C03E96B
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 06:56:11 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id w7so1462438edt.1
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 06:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZMigeBMNd9z5m1mtV5QFEFuu7N8LYEJaNCZyUcZ9ifA=;
        b=eVtfYRH58pXd3vT97PWWMrcRQ+77W8DpQhoC76LOrOthHgkaDitCOewosGd/w0yGYf
         h958gwKrqjBey3f/IVKvIR40x/uCZxQnG03lwzZs/0B2M8fqKfnJ3R0kDIitX0bT+rwn
         UfLlfr4atlNl3vM1wyj1BcZ9Tx4tRi1aJa89E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZMigeBMNd9z5m1mtV5QFEFuu7N8LYEJaNCZyUcZ9ifA=;
        b=em5QcCJf5kKIYn1Hj18Lvv8QfD0GOqpyeA8xuGvxRyysCw4S4xKSiV0Ay0C79T4yb6
         5a9B+AYkDUHsoF6qG9Jfg14CK0mVuiOXMp5TPLnoWthGgdCcBnhtsnysdCzjWQR+KPg0
         FeeFTP1vicltkO4FhgUq2XmsGrls3mIEb9HnbZINVzw+n+H9NKPP3lSFkLAuwt2noC2j
         ZyEFCnpdQQT6gaJz7QvfV3l7LIjQhxTMnFpRRtIsN4yFgcKx22/jXqifSxhrT5gc6zqX
         hlchGwNfyt1IBGeMEtPxY9yWE2XOP2cH1VtjX0ILTmBno2i4AyiUma09DwgYaIfkqGh1
         hpNA==
X-Gm-Message-State: AOAM5334RUsPyWKTEM2CmpvkEQII//1CYy05H+csUTYoQvMU6/4pokZy
        645Z6omtYhfjj6Dlrtzj4DaFRo1qLI2cqg==
X-Google-Smtp-Source: ABdhPJy+WtGtfe5gVndnzSq/0EbYb8lGHlmdD6E9po7RAO+46a1xpthtUr4gbYe01C8MpomLtDyPAQ==
X-Received: by 2002:aa7:c9c9:: with SMTP id i9mr2505426edt.166.1591797369738;
        Wed, 10 Jun 2020 06:56:09 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id c9sm15479111ejx.98.2020.06.10.06.56.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2020 06:56:09 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id x6so2351000wrm.13
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 06:56:08 -0700 (PDT)
X-Received: by 2002:adf:e2ce:: with SMTP id d14mr3925197wrj.415.1591797368097;
 Wed, 10 Jun 2020 06:56:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200526100932.2626420-1-hverkuil-cisco@xs4all.nl>
 <20200526100932.2626420-2-hverkuil-cisco@xs4all.nl> <728b621a-0df7-5c6f-9135-8b9794035b95@linaro.org>
 <b3c33f48ed8ac31e6148e54ccc1650f3d96e0daa.camel@ndufresne.ca>
 <CAAFQd5Ce4MPOopmD6pXqF-QkiUdj1+UZ6dceKGeDbM8mvevDbQ@mail.gmail.com> <a8b466eee221bda45489eca2b7b8ac52c1635bb4.camel@ndufresne.ca>
In-Reply-To: <a8b466eee221bda45489eca2b7b8ac52c1635bb4.camel@ndufresne.ca>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 10 Jun 2020 15:55:56 +0200
X-Gmail-Original-Message-ID: <CAAFQd5CHOh82m9atCZB5X-m1ZmND4O=id3pQzHiOO0Qm6m80-w@mail.gmail.com>
Message-ID: <CAAFQd5CHOh82m9atCZB5X-m1ZmND4O=id3pQzHiOO0Qm6m80-w@mail.gmail.com>
Subject: Re: [PATCHv3 1/5] media: docs-rst: Document memory-to-memory video
 encoder interface
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 10, 2020 at 3:08 PM Nicolas Dufresne <nicolas@ndufresne.ca> wro=
te:
>
> Le mercredi 10 juin 2020 =C3=A0 14:28 +0200, Tomasz Figa a =C3=A9crit :
> > On Fri, Jun 5, 2020 at 11:24 PM Nicolas Dufresne <nicolas@ndufresne.ca>=
 wrote:
> > > Le vendredi 05 juin 2020 =C3=A0 10:19 +0300, Stanimir Varbanov a =C3=
=A9crit :
> > > > On 5/26/20 1:09 PM, Hans Verkuil wrote:
> > > > > From: Tomasz Figa <tfiga@chromium.org>
> > > > >
> > > > > Due to complexity of the video encoding process, the V4L2 drivers=
 of
> > > > > stateful encoder hardware require specific sequences of V4L2 API =
calls
> > > > > to be followed. These include capability enumeration, initializat=
ion,
> > > > > encoding, encode parameters change, drain and reset.
> > > > >
> > > > > Specifics of the above have been discussed during Media Workshops=
 at
> > > > > LinuxCon Europe 2012 in Barcelona and then later Embedded Linux
> > > > > Conference Europe 2014 in D=C3=BCsseldorf. The de facto Codec API=
 that
> > > > > originated at those events was later implemented by the drivers w=
e already
> > > > > have merged in mainline, such as s5p-mfc or coda.
> > > > >
> > > > > The only thing missing was the real specification included as a p=
art of
> > > > > Linux Media documentation. Fix it now and document the encoder pa=
rt of
> > > > > the Codec API.
> > > > >
> > > > > Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> > > > > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > > > > ---
> > > > >  .../userspace-api/media/v4l/dev-encoder.rst   | 728 ++++++++++++=
++++++
> > > > >  .../userspace-api/media/v4l/dev-mem2mem.rst   |   1 +
> > > > >  .../userspace-api/media/v4l/pixfmt-v4l2.rst   |   5 +
> > > > >  .../userspace-api/media/v4l/v4l2.rst          |   2 +
> > > > >  .../media/v4l/vidioc-encoder-cmd.rst          |  51 +-
> > > > >  5 files changed, 767 insertions(+), 20 deletions(-)
> > > > >  create mode 100644 Documentation/userspace-api/media/v4l/dev-enc=
oder.rst
> > > > >
> > > > > diff --git a/Documentation/userspace-api/media/v4l/dev-encoder.rs=
t b/Documentation/userspace-api/media/v4l/dev-encoder.rst
> > > > > new file mode 100644
> > > > > index 000000000000..aace7b812a9c
> > > > > --- /dev/null
> > > > > +++ b/Documentation/userspace-api/media/v4l/dev-encoder.rst
> > > > > @@ -0,0 +1,728 @@
> > > > > +.. SPDX-License-Identifier: GPL-2.0
> > > > > +
> > > > > +.. _encoder:
> > > > > +
> > > > > +*************************************************
> > > > > +Memory-to-Memory Stateful Video Encoder Interface
> > > > > +*************************************************
> > > > > +
> > > > > +A stateful video encoder takes raw video frames in display order=
 and encodes
> > > > > +them into a bytestream. It generates complete chunks of the byte=
stream, including
> > > > > +all metadata, headers, etc. The resulting bytestream does not re=
quire any
> > > > > +further post-processing by the client.
> > > > > +
> > > > > +Performing software stream processing, header generation etc. in=
 the driver
> > > > > +in order to support this interface is strongly discouraged. In c=
ase such
> > > > > +operations are needed, use of the Stateless Video Encoder Interf=
ace (in
> > > > > +development) is strongly advised.
> > > > > +
> > > >
> > > > <cut>
> > > >
> > > > > +Encoding Parameter Changes
> > > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > > > > +
> > > > > +The client is allowed to use :c:func:`VIDIOC_S_CTRL` to change e=
ncoder
> > > > > +parameters at any time. The availability of parameters is encode=
r-specific
> > > > > +and the client must query the encoder to find the set of availab=
le controls.
> > > > > +
> > > > > +The ability to change each parameter during encoding is encoder-=
specific, as
> > > > > +per the standard semantics of the V4L2 control interface. The cl=
ient may
> > > > > +attempt to set a control during encoding and if the operation fa=
ils with the
> > > > > +-EBUSY error code, the ``CAPTURE`` queue needs to be stopped for=
 the
> > > > > +configuration change to be allowed. To do this, it may follow th=
e `Drain`
> > > > > +sequence to avoid losing the already queued/encoded frames.
> > > > > +
> > > > > +The timing of parameter updates is encoder-specific, as per the =
standard
> > > > > +semantics of the V4L2 control interface. If the client needs to =
apply the
> > > > > +parameters exactly at specific frame, using the Request API
> > > > > +(:ref:`media-request-api`) should be considered, if supported by=
 the encoder.
> > > >
> > > > In request-api case does the control will return EBUSY immediately =
when
> > > > S_CTRL is called from the client? I'm asking in the context of the
> > > > controls which are not dynamic (cannot set during streaming and Res=
et
> > > > sequence is needed).
> > >
> > > This is all hypothetical, as nothing of that has been implemented. Bu=
t
> > > I suppose there should be instant validation to allow that, even if
> > > that means more plumbing inside the kernel. It would be better then
> > > just running the request ignoring silently that control. Ideally
> > > userspace should not have to go into trial and errors, so controls th=
at
> > > are means for the should be marked.
> > >
> >
> > There isn't much to be implemented here, as it's the same standard
> > V4L2 behavior as existed for a while. If a device supports changing
> > the control on the fly, a call to S_CTRL succeeds, if not, it fails
> > with -EBUSY. This is regardless of whether requests are used or not.
>
> Are you against introducing flags to signal generically when a control
> will have live effect, delayed effect or will simply be rejected (-
> EBUSY) if set while streaming ? I'm particularly concern for cases
> where the same control may work live for one driver, and not for
> another. It would be very disappointing to get an EBUSY on a bitrate
> control of an encoder as an example. So if someone foresee having
> bitrate control that cannot be adapted while streaming (or that will
> only be applied if a key frame is generated), I'd rather prefer to know
> in advance, and likely not select this encoder for WebRTC purpose as an
> example. Having to do all the steps to get the driver in streaming in
> order to set the control and discover that it's not suitable for the
> purpose seems quite sub-optimal.
>
> I'm just saying, but the "standard" that existed for a while has always
> been hardcoded to the control (through control documentation, and
> that's fine with me) or the HW driver being used (which isn't fine in
> my opinion).

I was just clarifying the behavior of S_(EXT_)CTRL(S).

A way to query the behavior in advance is an orthogonal problem, which
I agree that should be solved and I guess a flag returned by
VIDIOC_QUERY_EXT_CTRLS could do.

Best regards,
Tomasz
