Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82E551E5F96
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2020 14:04:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389085AbgE1MC6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 08:02:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389044AbgE1MC4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 08:02:56 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B7A6C08C5C5
        for <linux-media@vger.kernel.org>; Thu, 28 May 2020 05:02:56 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id e2so31736177eje.13
        for <linux-media@vger.kernel.org>; Thu, 28 May 2020 05:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=tlw1KiNC4cnClwU5YlwcjjU4Hgb5JZ0fTSl0Htfv7nU=;
        b=mNnB0g7PRxkwbO7X8YsiQwtxM71w/1C4N7DsgA8gOzb0+mpz8jVF7c8+of0HIJB+nT
         W44DWTjVl1T41K0rkBIo2ZhR1m8uvoK2lse6Nkb5SgRisu98Z07AdZI+ea67tbKPilf2
         acxo4aLPGbLOImvvDVoxk3uKV5rvql4CXAURk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=tlw1KiNC4cnClwU5YlwcjjU4Hgb5JZ0fTSl0Htfv7nU=;
        b=jJv0cBoU6JHWBnwmq7k/xXzbQ0tSo9zzsjqLuJQSPUyrNAycGgT1Xc9Su5prwDz3vn
         UzrzoAF7IjbySJIV38JfGbazmUYEUdw5j7jt/RZVsbzU/bEx492rw5Dn1Qr2pK15lL2S
         URa89XIZS6Wf+Y2mB9Ec9aDoBzrmJ9n4wbs4EzZpDYjtJkLkXycls7eGAn6E5pplCAz0
         1h+aKz25TJFkV9DZIjD5YFjq1wB3POPMJn74vuQhhcSGIIXHexO2PJ4RUF3hARHFX4hb
         CNdI/IE4pRuzNKFVY6vGjfNqlSoM+mc8pPi3LkFy9ttCRnrP7zvZw8v7YNwxP+tXxqIy
         Gu9A==
X-Gm-Message-State: AOAM532LSt1g2CQ6Y84wtgmo2D9JU9HkZFXMjnhZJ7aDSzNwWT7+8iQH
        e8uttZzfT9/+ZrZotG+Ma/kBLcCWgX4=
X-Google-Smtp-Source: ABdhPJyILUHorsLPDSW+Q0Qck32zx18taHH+3apIbQ2RCmcgCUL8aoi97MRlajx/SiM9UreX+QmNIQ==
X-Received: by 2002:a17:906:538d:: with SMTP id g13mr2656418ejo.194.1590667373651;
        Thu, 28 May 2020 05:02:53 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id o18sm5196933eje.40.2020.05.28.05.02.52
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 05:02:52 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id t18so13548031wru.6
        for <linux-media@vger.kernel.org>; Thu, 28 May 2020 05:02:52 -0700 (PDT)
X-Received: by 2002:a05:6000:d:: with SMTP id h13mr3134061wrx.17.1590667371953;
 Thu, 28 May 2020 05:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200520100159.2094831-1-hverkuil-cisco@xs4all.nl>
 <20200520100159.2094831-2-hverkuil-cisco@xs4all.nl> <a14b50176ae678904f9dd39c1bb8edbc5801a030.camel@ndufresne.ca>
 <6caf4e56-2cb3-b193-3760-3a9b3c31bfb0@xs4all.nl> <CAAFQd5AveRXvi6GO42qeLXMRLAHiE43tiNvjCKNi2WTZHkVbzQ@mail.gmail.com>
 <20200528074428.GB19211@pengutronix.de>
In-Reply-To: <20200528074428.GB19211@pengutronix.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 28 May 2020 14:02:38 +0200
X-Gmail-Original-Message-ID: <CAAFQd5A2ogPO24eAa59mppLTLtpbEDRv7EqDxRx1Lxs9btvqUg@mail.gmail.com>
Message-ID: <CAAFQd5A2ogPO24eAa59mppLTLtpbEDRv7EqDxRx1Lxs9btvqUg@mail.gmail.com>
Subject: Re: [PATCHv2 1/2] media: docs-rst: Document memory-to-memory video
 encoder interface
To:     Michael Tretter <m.tretter@pengutronix.de>,
        Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 28, 2020 at 9:44 AM Michael Tretter
<m.tretter@pengutronix.de> wrote:
>
> On Tue, May 26, 2020 at 06:01:35PM +0200, Tomasz Figa wrote:
> > On Tue, May 26, 2020 at 10:32 AM Hans Verkuil <hverkuil-cisco@xs4all.nl=
> wrote:
> > >
> > > On 20/05/2020 22:32, Nicolas Dufresne wrote:
> > > > Le mercredi 20 mai 2020 =C3=A0 12:01 +0200, Hans Verkuil a =C3=A9cr=
it :
> > > >> From: Tomasz Figa <tfiga@chromium.org>
> > > >>
> > > >> Due to complexity of the video encoding process, the V4L2 drivers =
of
> > > >> stateful encoder hardware require specific sequences of V4L2 API c=
alls
> > > >> to be followed. These include capability enumeration, initializati=
on,
> > > >> encoding, encode parameters change, drain and reset.
> > > >>
> > > >> Specifics of the above have been discussed during Media Workshops =
at
> > > >> LinuxCon Europe 2012 in Barcelona and then later Embedded Linux
> > > >> Conference Europe 2014 in D=C3=BCsseldorf. The de facto Codec API =
that
> > > >> originated at those events was later implemented by the drivers we=
 already
> > > >> have merged in mainline, such as s5p-mfc or coda.
> > > >>
> > > >> The only thing missing was the real specification included as a pa=
rt of
> > > >> Linux Media documentation. Fix it now and document the encoder par=
t of
> > > >> the Codec API.
> > > >>
> > > >> Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> > > >> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > > >> ---
> > > >>  .../userspace-api/media/v4l/dev-encoder.rst   | 727 +++++++++++++=
+++++
> > > >>  .../userspace-api/media/v4l/dev-mem2mem.rst   |   1 +
> > > >>  .../userspace-api/media/v4l/pixfmt-v4l2.rst   |   5 +
> > > >>  .../userspace-api/media/v4l/v4l2.rst          |   2 +
> > > >>  .../media/v4l/vidioc-encoder-cmd.rst          |  51 +-
> > > >>  5 files changed, 766 insertions(+), 20 deletions(-)
> > > >>  create mode 100644 Documentation/userspace-api/media/v4l/dev-enco=
der.rst
> > > >>
> > > >> diff --git a/Documentation/userspace-api/media/v4l/dev-encoder.rst=
 b/Documentation/userspace-api/media/v4l/dev-encoder.rst
> > >
> > > <snip>
> > >
> > > >> +5. **Optional** Set the coded frame interval on the ``CAPTURE`` q=
ueue via
> > > >> +   :c:func:`VIDIOC_S_PARM`. This is only necessary if the coded f=
rame
> > > >> +   interval is different from the raw frame interval, which is ty=
pically
> > > >> +   the case for off-line encoding.
> > > >> +
> > > >> +   * ** Required fields:**
> > > >> +
> > > >> +     ``type``
> > > >> +     a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> > > >> +
> > > >> +     ``parm.capture``
> > > >> +     set all fields except ``parm.capture.timeperframe`` to 0.
> > > >> +
> > > >> +     ``parm.capture.timeperframe``
> > > >> +     the desired coded frame interval; the encoder may adjust it =
to
> > > >> +     match hardware requirements.
> > > >> +
> > > >> +   * **Return fields:**
> > > >> +
> > > >> +     ``parm.capture.timeperframe``
> > > >> +     the adjusted frame interval.
> > > >> +
> > > >> +   .. important::
> > > >> +
> > > >> +      Changing the ``CAPTURE`` frame interval sets the framerate =
for the
> > > >> +      coded video. It does *not* set the rate at which buffers ar=
rive on the
> > > >> +      ``CAPTURE`` queue, that depends on how fast the encoder is =
and how
> > > >> +      fast raw frames are queued on the ``OUTPUT`` queue.
> > > >> +
> > > >> +   .. important::
> > > >> +
> > > >> +      ``timeperframe`` deals with *frames*, not fields. So for in=
terlaced
> > > >> +      formats this is the time per two fields, since a frame cons=
ists of
> > > >> +      a top and a bottom field.
> > > >> +
> > > >> +   .. note::
> > > >> +
> > > >> +      Not all drivers support this functionality, in that case ju=
st set
> > > >> +      the desired coded frame interval for the ``OUTPUT`` queue.
> > > >
> > > > There is a slight contorsion in the resulting user-space API. When =
I
> > > > read this, the logical thing to do for live streams would be to jus=
t
> > > > set the OUTPUT and the driver will take care of CAPTURE for me.
> > > >
> > > > While if I want to do offline, I don't know if this is supported or
> > > > not. So the flow would be a bit special:
> > > >
> > > >   S_PARM(OUTPUT) with coded video frame rate
> > > >   S_PARM(CAPTURE) width coded video
> > > >   if ^ worked:
> > > >      S_PARM(OUTPUT) with fastest rate possible
> > > >
> > > > Ideally I would have preferred if there was a more straight forward=
 way
> > > > to configure offline encoding for fastest performance with specific
> > > > coded framerate. I don't think it's a blocker though, performance i=
s
> > > > not critical at all here. Maybe I'm missing something that allow to
> > > > check if this is supported or not without trying it ?
> > >
> > > Good point. I considered adding a flag for the v4l2_fmtdesc struct th=
at
> > > reports whether you can set the capture framerate independently from =
the
> > > OUTPUT framerate. Perhaps V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL?
> > >
> > > I actually think it would be best if that's added. It is not enough t=
o
> > > rely on whether S_PARM(CAPTURE) works to determine this feature since
> > > at least one encoder drivers supports both OUTPUT and CAPTURE with S_=
PARM,
> > > but CAPTURE does the same as OUTPUT, so that would be a red herring.
> > >
> > > I'll add this flag for v3.
> >
> > Now if I think of it again, this behavior might be problematic for
> > existing userspace, which I believe assumes encoding as fast as
> > possible, because of how mem2mem devices were expected to behave.
> > Could we define this to always default to as fast as possible?
> > Otherwise we could end up regressing the encoding latency on latency
> > sensitive applications, such as video conferencing.
>
> I see your point regarding the latency, but I don't think that this justi=
fies
> "as fast as possible" as a default in the API. Adjusting the encoding spe=
ed
> based on a user space hint is usually a trade-off that the driver must ma=
ke.
> If the trade-off results in a reduced latency, it is a regression in the
> individual driver and the trade-offs must be discussed per driver.

I have to disagree. This is not a driver-specific interface and
consistent behavior must be exposed to the userspace regardless of the
underlying driver.

However, I guess that making it "as fast as possible" by default would
fix it for some of the users, while breaking it for the others, who
assumed "according to the frame rate", because of the behavior being
unspecified. On our (Chromium) side we won't have much of an issue to
just update the code to set both frame rates, so I guess I'm fine with
the proposed behavior.

+Alexandre Courbot +Jeffrey Kardatzke for awareness.

>
> >
> > For example, we could define the rates of both queues the other way
> > around. The OUTPUT queue, which seems to be where the existing user
> > space currently sets the desired stream frame rate, could be
> > interpreted as the frame rate of the video to be encoded, while the
> > CAPTURE queue would control the desired output rate of the encoded
> > video, which would kind of match the V4L2 definition of CAPTURE frame
> > interval.
>
> Setting the desired stream frame rate on CAPTURE does not work with frame
> reordering. In that case driver returns the CAPTURE buffers, whenever a c=
oded
> buffer is finished, and not necessarily at a certain frame rate. Strictly
> following the V4L2 definition for CAPTURE frame interval, the driver woul=
d
> need to produce repeated frames if the decode order differs from the disp=
lay
> order.

Good point. I haven't thought about this as I don't recall seeing any
encoder driver which could actually do frame reordering.

Best regards,
Tomasz
