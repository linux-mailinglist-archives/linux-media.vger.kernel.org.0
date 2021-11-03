Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE64444AF6
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 23:59:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbhKCXBs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Nov 2021 19:01:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbhKCXBr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Nov 2021 19:01:47 -0400
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com [IPv6:2607:f8b0:4864:20::a34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FA3DC061714
        for <linux-media@vger.kernel.org>; Wed,  3 Nov 2021 15:59:10 -0700 (PDT)
Received: by mail-vk1-xa34.google.com with SMTP id n201so2078634vkn.12
        for <linux-media@vger.kernel.org>; Wed, 03 Nov 2021 15:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=L/zSuuK/cYq+e4oX566AizzpAdlfYn8G0PZsLtJzn6U=;
        b=bYh4oMxdK5MwiU8PFjZKgF2lINAALAU+ARchfyXX9qkBUwS4X67EYaYw7dOWkL2Zg7
         yHdYs/BGSQUx+kRrb4Uhf3NPylGJL75C5hJRwhLEIjerOmUQSZvnH5yxfIxQOqRFrIkn
         BxrdtqFW28uljUWFZ/+o9348t1myLSS5CRIfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=L/zSuuK/cYq+e4oX566AizzpAdlfYn8G0PZsLtJzn6U=;
        b=Pm4sQdd9rtJRCkVT0ptAsDwAq8DS3Zn3ywYXEHyuwAMqDT/0o3qoa33g72Cx3yORNs
         thd66snrgj13RWJYJMsgxkKDrsQwQsbsSKWXU+s9j1J0KpXYZLu1E6XKpTE8XPLVbCvk
         +uopTMDKxyFmfWoSWxbQS/fwnkbEJiGePCvMhnMsybZ9Sz8eRpXQPhWl+bCih18sTVKp
         9+RVSJaDgb/9zm5bhX/QrThS4hhwkNmIPGCyYkt3DMNzQ60cYeJfAsDKlRVwHod2aEeo
         GHxlKClQn/559sHtZV6jlgUQMqtc6y8GrI50eo5ByLuLx0ApfimzIPgA250q/EDnEVEJ
         8y3A==
X-Gm-Message-State: AOAM531qCKDFI/UfW0WAfn9SVuCWhxDhPPyL+wrZ1HcWLgsbk65uH5Vr
        UZe8welPZJu3GIGVIcM2ajYVVa9OYeu7UA==
X-Google-Smtp-Source: ABdhPJz7XZO/UNtctecTmtrxIqHIlrX/CAoygvTIxaXJ0U5a7XlvguH54G0T01YO2hBli1hUO3nM2w==
X-Received: by 2002:a05:6122:1687:: with SMTP id 7mr17942997vkl.2.1635980349168;
        Wed, 03 Nov 2021 15:59:09 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id s14sm447975vkk.26.2021.11.03.15.59.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Nov 2021 15:59:08 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id p37so6291149uae.8
        for <linux-media@vger.kernel.org>; Wed, 03 Nov 2021 15:59:08 -0700 (PDT)
X-Received: by 2002:a05:6102:390f:: with SMTP id e15mr32938205vsu.10.1635980348154;
 Wed, 03 Nov 2021 15:59:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211018091427.88468-1-acourbot@chromium.org> <9cb4f64e2ec3959df44b71dd69ef95697920dc4b.camel@ndufresne.ca>
 <AM6PR04MB634130FEB433CCA352CE98FBE7879@AM6PR04MB6341.eurprd04.prod.outlook.com>
 <dc7496db-9ba3-fa7b-8563-1157b63c9b0d@linaro.org> <b8f877c9ba2cbd0d6839ac86892725a41097391a.camel@ndufresne.ca>
In-Reply-To: <b8f877c9ba2cbd0d6839ac86892725a41097391a.camel@ndufresne.ca>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Thu, 4 Nov 2021 07:58:56 +0900
X-Gmail-Original-Message-ID: <CAPBb6MVE3+=BXQver3FZtonHW-OoCvfhKeegWv+hE75cFJFTDA@mail.gmail.com>
Message-ID: <CAPBb6MVE3+=BXQver3FZtonHW-OoCvfhKeegWv+hE75cFJFTDA@mail.gmail.com>
Subject: Re: [EXT] Re: [PATCH] media: docs: dev-decoder: add restrictions
 about CAPTURE buffers
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Ming Qian <ming.qian@nxp.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks for the comments. It looks like we are having a consensus that
the described behavior is the current (untold) expectation, and how a
client should behave if it wants to support all V4L2 decoders. OTOH it
would also be nice to be able to signal the client that CAPTURE
buffers are not used by the hardware and can thus be overwritten/freed
at will.

I have discussed a bit with Nicolas on IRC and we were wondering where
such a flag signaling that capability should be. We could have:

1) Something global to the currently set format, i.e. maybe take some
space from the reserved area of v4l2_pix_format_mplane to add a flag.
The property would then be global to all buffers, and apply between
calls to STREAMON and STREAMOFF.

2) An additional flag to the v4l2_buffer structure that would signal
whether the buffer is currently writable. This means the writable
property of buffers can be signaled on a finer grain (i.e. reference
frames would not be writable, but non-reference ones would be), and we
can even update the status of a given buffer after it is not used as a
reference (the client would have to QUERYBUF to get the updated status
though). OTOH a client that needs to know whether the buffers are
writable before streaming would need to query them all one-by-one.

I am not sure whether we need something as precise as 2), or whether
1) would be enough and globally simpler. Any more thoughts?

Cheers,
Alex.

On Mon, Nov 1, 2021 at 11:52 PM Nicolas Dufresne <nicolas@ndufresne.ca> wro=
te:
>
> Le vendredi 29 octobre 2021 =C3=A0 10:28 +0300, Stanimir Varbanov a =C3=
=A9crit :
> >
> > On 10/29/21 5:10 AM, Ming Qian wrote:
> > > > -----Original Message-----
> > > > From: Nicolas Dufresne [mailto:nicolas@ndufresne.ca]
> > > > Sent: Tuesday, October 26, 2021 10:12 PM
> > > > To: Alexandre Courbot <acourbot@chromium.org>; Mauro Carvalho Cheha=
b
> > > > <mchehab@kernel.org>; Hans Verkuil <hverkuil-cisco@xs4all.nl>; Toma=
sz Figa
> > > > <tfiga@chromium.org>
> > > > Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org
> > > > Subject: [EXT] Re: [PATCH] media: docs: dev-decoder: add restrictio=
ns about
> > > > CAPTURE buffers
> > > >
> > > > Caution: EXT Email
> > > >
> > > > Le lundi 18 octobre 2021 =C3=A0 18:14 +0900, Alexandre Courbot a =
=C3=A9crit :
> > > > > CAPTURE buffers might be read by the hardware after they are dequ=
eued,
> > > > > which goes against the general idea that userspace has full contr=
ol
> > > > > over dequeued buffers. Explain why and document the restrictions =
that
> > > > > this implies for userspace.
> > > > >
> > > > > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > > > > ---
> > > > >  .../userspace-api/media/v4l/dev-decoder.rst     | 17
> > > > +++++++++++++++++
> > > > >  1 file changed, 17 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rs=
t
> > > > > b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > > > index 5b9b83feeceb..3cf2b496f2d0 100644
> > > > > --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > > > +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > > > @@ -752,6 +752,23 @@ available to dequeue. Specifically:
> > > > >       buffers are out-of-order compared to the ``OUTPUT`` buffers=
):
> > > > ``CAPTURE``
> > > > >       timestamps will not retain the order of ``OUTPUT`` timestam=
ps.
> > > > >
> > > > > +.. note::
> > > > > +
> > > > > +   The backing memory of ``CAPTURE`` buffers that are used as re=
ference
> > > > frames
> > > > > +   by the stream may be read by the hardware even after they are
> > > > dequeued.
> > > > > +   Consequently, the client should avoid writing into this memor=
y while the
> > > > > +   ``CAPTURE`` queue is streaming. Failure to observe this may r=
esult in
> > > > > +   corruption of decoded frames.
> > > > > +
> > > > > +   Similarly, when using a memory type other than
> > > > ``V4L2_MEMORY_MMAP``, the
> > > > > +   client should make sure that each ``CAPTURE`` buffer is alway=
s queued
> > > > with
> > > > > +   the same backing memory for as long as the ``CAPTURE`` queue =
is
> > > > streaming.
> > > > > +   The reason for this is that V4L2 buffer indices can be used b=
y drivers to
> > > > > +   identify frames. Thus, if the backing memory of a reference f=
rame is
> > > > > +   submitted under a different buffer ID, the driver may misiden=
tify it and
> > > > > +   decode a new frame into it while it is still in use, resultin=
g in corruption
> > > > > +   of the following frames.
> > > > > +
> > > >
> > > > I think this is nice addition, but insufficient. We should extend t=
he API with a
> > > > flags that let application know if the buffers are reference or sec=
ondary. For the
> > > > context, we have a mix of CODEC that will output usable reference f=
rames and
> > > > needs careful manipulation and many other drivers where the buffers=
 *maybe*
> > > > secondary, meaning they may have been post-processed and modifying =
these
> > > > in- place may have no impact.
> > > >
> > > > The problem is the "may", that will depends on the chosen CAPTURE f=
ormat. I
> > > > believe we should flag this, this flag should be set by the driver,=
 on CAPTURE
> > > > queue. The information is known after S_FMT, so Format Flag, Reqbuf=
s
> > > > capabilities or querybuf flags are candidates. I think the buffer f=
lags are the
> > > > best named flag, though we don't expect this to differ per buffer. =
Though,
> > > > userspace needs to call querybuf for all buf in order to export or =
map them.
> > > >
> > > > What userspace can do with this is to export the DMABuf as read-onl=
y, and
> > > > signal this internally in its own context. This is great to avoid a=
ny unwanted
> > > > side effect described here.
> > >
> > > I think a flag should be add to tell a buffer is reference or seconda=
ry.
> > > But for some codec, it's hard to determine the buffer flag when reqbu=
fs.
> > > The buffer flag should be dynamically updated by driver.
> > > User can check the flag after dqbuf every time.
> >
> > +1
> >
> > I'm not familiar with stateless decoders where on the reqbuf time it
> > could work, debut for stateful coders it should be a dynamic flag on
> > every capture buffer.
>
> This isn't very clear request here, on which C structure to you say you w=
ould
> prefer this ?
>
> There is no difference for stateful/stateless for this regard. The captur=
e
> format must have been configured prior to reqbuf, so nothing post S_FMT(C=
APTURE)
> can every be very dynamic. I think the flag in S_FMT is miss-named and wo=
uld
> create confusion. struct v4l2_reqbufs vs struc v4l2_buffer are equivalent=
. The
> seconds opens for flexibility.
>
> In fact, for some certain CODEC, there exist B-Frames that are never used=
 as
> references, so these could indeed can be written to even if the buffer ar=
e not
> secondary. I think recommending to flag this in v4l2_buffer, and read thr=
ough
> VIDIOC_QUERYBUF would be the best choice.
>
> >
> > >
> > > >
> > > > >  During the decoding, the decoder may initiate one of the special
> > > > > sequences, as  listed below. The sequences will result in the dec=
oder
> > > > > returning all the  ``CAPTURE`` buffers that originated from all t=
he
> > > > > ``OUTPUT`` buffers processed
> > > >
> > >
> >
>
>
