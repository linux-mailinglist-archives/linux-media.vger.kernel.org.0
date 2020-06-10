Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54D0D1F5651
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 15:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726570AbgFJN6V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 09:58:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726316AbgFJN6U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 09:58:20 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15989C03E96B
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 06:58:20 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id l27so2724871ejc.1
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 06:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YZLt3xys26aNhtvd6gJF2pMj2rVxNSWM8BN5UU82LVo=;
        b=STaJyWniUuswYjAWZyQUSn/g1gEC7IUx7Tft8FULoElJI3qu2wxehfainPc7sS7oBa
         0t1kKRlxpKURC5MaI4L4/q6wMzHdGvHh8kvJoWINHSjMUFVjH/Yysg4j3vEz8cperbOB
         Icmq6T44OHc9JAt6+sNM/tECtIK5GpJC7jRpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YZLt3xys26aNhtvd6gJF2pMj2rVxNSWM8BN5UU82LVo=;
        b=IpYvY+uUOk4N4N6qgUqhFusTXElrJBlyBeo99EAR7dxjKR3gf1tZZyE0+G3Hhs/ok/
         oSVqhoAbo1EoZgghsNuQ11ETLW41qQmSFqcsroZvKZxEL7wHEtG+x0lio+/6ltiMQWxL
         2FV38heMRdQfzxmVXp5W0hmNBNZ/WYlGJY629ybCnlqXDxrWBH96ed3OssXcURpilcWA
         M+sYDgjSpF5I95zT5zrE2sK83iZRHobc4zHIYJVdHOuP4qwyiWfdGlhE8E+uHYOh1fnh
         vZsVy7dH2YexdoLhTCZ1BP6+8lYHuTdbLJcsC+z3CsRbA6CvRoedzcQ7+I7JW3/7di2w
         zfRw==
X-Gm-Message-State: AOAM532Ji2EW5B+IZlhmbVthASCM7BbuKrzt763w3wCyMwoaUFfDuSVt
        gXZCohRqxbCR15CWbZhgaD24FWHe3hvSDA==
X-Google-Smtp-Source: ABdhPJwN+Cs+T+h8TFzyMb8XpkAvoZH66TISeauizRGmAYs/oQI2Rd+ekkLqz7YPs8gCmro9k7EF1w==
X-Received: by 2002:a17:906:f745:: with SMTP id jp5mr3618621ejb.440.1591797498048;
        Wed, 10 Jun 2020 06:58:18 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id m21sm17795718edj.74.2020.06.10.06.58.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2020 06:58:17 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id l17so1940642wmj.0
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 06:58:17 -0700 (PDT)
X-Received: by 2002:a7b:c0c8:: with SMTP id s8mr3532396wmh.134.1591797496333;
 Wed, 10 Jun 2020 06:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200526100932.2626420-1-hverkuil-cisco@xs4all.nl>
 <20200526100932.2626420-2-hverkuil-cisco@xs4all.nl> <728b621a-0df7-5c6f-9135-8b9794035b95@linaro.org>
 <b3c33f48ed8ac31e6148e54ccc1650f3d96e0daa.camel@ndufresne.ca> <CAAFQd5Ce4MPOopmD6pXqF-QkiUdj1+UZ6dceKGeDbM8mvevDbQ@mail.gmail.com>
In-Reply-To: <CAAFQd5Ce4MPOopmD6pXqF-QkiUdj1+UZ6dceKGeDbM8mvevDbQ@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 10 Jun 2020 15:58:03 +0200
X-Gmail-Original-Message-ID: <CAAFQd5CmOqVUfoLH5cmWnr0cXoqnBRFdStyeSWtqJGLDdFdZoA@mail.gmail.com>
Message-ID: <CAAFQd5CmOqVUfoLH5cmWnr0cXoqnBRFdStyeSWtqJGLDdFdZoA@mail.gmail.com>
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

On Wed, Jun 10, 2020 at 2:28 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> On Fri, Jun 5, 2020 at 11:24 PM Nicolas Dufresne <nicolas@ndufresne.ca> w=
rote:
> >
> > Le vendredi 05 juin 2020 =C3=A0 10:19 +0300, Stanimir Varbanov a =C3=A9=
crit :
> > >
> > > On 5/26/20 1:09 PM, Hans Verkuil wrote:
> > > > From: Tomasz Figa <tfiga@chromium.org>
> > > >
> > > > Due to complexity of the video encoding process, the V4L2 drivers o=
f
> > > > stateful encoder hardware require specific sequences of V4L2 API ca=
lls
> > > > to be followed. These include capability enumeration, initializatio=
n,
> > > > encoding, encode parameters change, drain and reset.
> > > >
> > > > Specifics of the above have been discussed during Media Workshops a=
t
> > > > LinuxCon Europe 2012 in Barcelona and then later Embedded Linux
> > > > Conference Europe 2014 in D=C3=BCsseldorf. The de facto Codec API t=
hat
> > > > originated at those events was later implemented by the drivers we =
already
> > > > have merged in mainline, such as s5p-mfc or coda.
> > > >
> > > > The only thing missing was the real specification included as a par=
t of
> > > > Linux Media documentation. Fix it now and document the encoder part=
 of
> > > > the Codec API.
> > > >
> > > > Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> > > > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > > > ---
> > > >  .../userspace-api/media/v4l/dev-encoder.rst   | 728 ++++++++++++++=
++++
> > > >  .../userspace-api/media/v4l/dev-mem2mem.rst   |   1 +
> > > >  .../userspace-api/media/v4l/pixfmt-v4l2.rst   |   5 +
> > > >  .../userspace-api/media/v4l/v4l2.rst          |   2 +
> > > >  .../media/v4l/vidioc-encoder-cmd.rst          |  51 +-
> > > >  5 files changed, 767 insertions(+), 20 deletions(-)
> > > >  create mode 100644 Documentation/userspace-api/media/v4l/dev-encod=
er.rst
> > > >
> > > > diff --git a/Documentation/userspace-api/media/v4l/dev-encoder.rst =
b/Documentation/userspace-api/media/v4l/dev-encoder.rst
> > > > new file mode 100644
> > > > index 000000000000..aace7b812a9c
> > > > --- /dev/null
> > > > +++ b/Documentation/userspace-api/media/v4l/dev-encoder.rst
> > > > @@ -0,0 +1,728 @@
> > > > +.. SPDX-License-Identifier: GPL-2.0
> > > > +
> > > > +.. _encoder:
> > > > +
> > > > +*************************************************
> > > > +Memory-to-Memory Stateful Video Encoder Interface
> > > > +*************************************************
> > > > +
> > > > +A stateful video encoder takes raw video frames in display order a=
nd encodes
> > > > +them into a bytestream. It generates complete chunks of the bytest=
ream, including
> > > > +all metadata, headers, etc. The resulting bytestream does not requ=
ire any
> > > > +further post-processing by the client.
> > > > +
> > > > +Performing software stream processing, header generation etc. in t=
he driver
> > > > +in order to support this interface is strongly discouraged. In cas=
e such
> > > > +operations are needed, use of the Stateless Video Encoder Interfac=
e (in
> > > > +development) is strongly advised.
> > > > +
> > >
> > > <cut>
> > >
> > > > +Encoding Parameter Changes
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > > > +
> > > > +The client is allowed to use :c:func:`VIDIOC_S_CTRL` to change enc=
oder
> > > > +parameters at any time. The availability of parameters is encoder-=
specific
> > > > +and the client must query the encoder to find the set of available=
 controls.
> > > > +
> > > > +The ability to change each parameter during encoding is encoder-sp=
ecific, as
> > > > +per the standard semantics of the V4L2 control interface. The clie=
nt may
> > > > +attempt to set a control during encoding and if the operation fail=
s with the
> > > > +-EBUSY error code, the ``CAPTURE`` queue needs to be stopped for t=
he
> > > > +configuration change to be allowed. To do this, it may follow the =
`Drain`
> > > > +sequence to avoid losing the already queued/encoded frames.
> > > > +
> > > > +The timing of parameter updates is encoder-specific, as per the st=
andard
> > > > +semantics of the V4L2 control interface. If the client needs to ap=
ply the
> > > > +parameters exactly at specific frame, using the Request API
> > > > +(:ref:`media-request-api`) should be considered, if supported by t=
he encoder.
> > >
> > > In request-api case does the control will return EBUSY immediately wh=
en
> > > S_CTRL is called from the client? I'm asking in the context of the
> > > controls which are not dynamic (cannot set during streaming and Reset
> > > sequence is needed).
> >
> > This is all hypothetical, as nothing of that has been implemented. But
> > I suppose there should be instant validation to allow that, even if
> > that means more plumbing inside the kernel. It would be better then
> > just running the request ignoring silently that control. Ideally
> > userspace should not have to go into trial and errors, so controls that
> > are means for the should be marked.
> >
>
> There isn't much to be implemented here, as it's the same standard
> V4L2 behavior as existed for a while. If a device supports changing
> the control on the fly, a call to S_CTRL succeeds, if not, it fails
> with -EBUSY. This is regardless of whether requests are used or not.
> Requests in this case simply synchronize applying the new control
> values with the right frame.
>

Maybe one more thing that needs to be clarified about the Request API:
The operations are still validated at the time the commands are
executed, not when the request is queued or executed. So calling
S_EXT_CTRLS with a request would instantly fail with -EBUSY if the
driver doesn't support changing the control on the fly.

>
> > >
> > > > +
> > > > +Drain
> > > > +=3D=3D=3D=3D=3D
> > > > +
> > > > +To ensure that all the queued ``OUTPUT`` buffers have been process=
ed and the
> > > > +related ``CAPTURE`` buffers are given to the client, the client mu=
st follow the
> > > > +drain sequence described below. After the drain sequence ends, the=
 client has
> > > > +received all encoded frames for all ``OUTPUT`` buffers queued befo=
re the
> > > > +sequence was started.
> > > > +
> > > > +1. Begin the drain sequence by issuing :c:func:`VIDIOC_ENCODER_CMD=
`.
> > > > +
> > > > +   * **Required fields:**
> > > > +
> > > > +     ``cmd``
> > > > +         set to ``V4L2_ENC_CMD_STOP``.
> > > > +
> > > > +     ``flags``
> > > > +         set to 0.
> > > > +
> > > > +     ``pts``
> > > > +         set to 0.
> > > > +
> > > > +   .. warning::
> > > > +
> > > > +      The sequence can be only initiated if both ``OUTPUT`` and ``=
CAPTURE``
> > > > +      queues are streaming. For compatibility reasons, the call to
> > > > +      :c:func:`VIDIOC_ENCODER_CMD` will not fail even if any of th=
e queues is
> > > > +      not streaming, but at the same time it will not initiate the=
 `Drain`
> > > > +      sequence and so the steps described below would not be appli=
cable.
> > > > +
> > > > +2. Any ``OUTPUT`` buffers queued by the client before the
> > > > +   :c:func:`VIDIOC_ENCODER_CMD` was issued will be processed and e=
ncoded as
> > > > +   normal. The client must continue to handle both queues independ=
ently,
> > > > +   similarly to normal encode operation. This includes:
> > > > +
> > > > +   * queuing and dequeuing ``CAPTURE`` buffers, until a buffer mar=
ked with the
> > > > +     ``V4L2_BUF_FLAG_LAST`` flag is dequeued,
> > > > +
> > > > +     .. warning::
> > > > +
> > > > +        The last buffer may be empty (with :c:type:`v4l2_buffer`
> > > > +        ``bytesused`` =3D 0) and in that case it must be ignored b=
y the client,
> > > > +        as it does not contain an encoded frame.
> > > > +
> > > > +     .. note::
> > > > +
> > > > +        Any attempt to dequeue more ``CAPTURE`` buffers beyond the=
 buffer
> > > > +        marked with ``V4L2_BUF_FLAG_LAST`` will result in a -EPIPE=
 error from
> > > > +        :c:func:`VIDIOC_DQBUF`.
> > > > +
> > > > +   * dequeuing processed ``OUTPUT`` buffers, until all the buffers=
 queued
> > > > +     before the ``V4L2_ENC_CMD_STOP`` command are dequeued,
> > > > +
> > > > +   * dequeuing the ``V4L2_EVENT_EOS`` event, if the client subscri=
bes to it.
> > > > +
> > > > +   .. note::
> > > > +
> > > > +      For backwards compatibility, the encoder will signal a ``V4L=
2_EVENT_EOS``
> > > > +      event when the last frame has been encoded and all frames ar=
e ready to be
> > > > +      dequeued. It is deprecated behavior and the client must not =
rely on it.
> > > > +      The ``V4L2_BUF_FLAG_LAST`` buffer flag should be used instea=
d.
> > > > +
> > > > +3. Once all ``OUTPUT`` buffers queued before the ``V4L2_ENC_CMD_ST=
OP`` call are
> > > > +   dequeued and the last ``CAPTURE`` buffer is dequeued, the encod=
er is stopped
> > > > +   and it will accept, but not process any newly queued ``OUTPUT``=
 buffers
> > > > +   until the client issues any of the following operations:
> > > > +
> > > > +   * ``V4L2_ENC_CMD_START`` - the encoder will not be reset and wi=
ll resume
> > > > +     operation normally, with all the state from before the drain,
> > > > +
> > > > +   * a pair of :c:func:`VIDIOC_STREAMOFF` and :c:func:`VIDIOC_STRE=
AMON` on the
> > > > +     ``CAPTURE`` queue - the encoder will be reset (see the `Reset=
` sequence)
> > > > +     and then resume encoding,
> > > > +
> > > > +   * a pair of :c:func:`VIDIOC_STREAMOFF` and :c:func:`VIDIOC_STRE=
AMON` on the
> > > > +     ``OUTPUT`` queue - the encoder will resume operation normally=
, however any
> > > > +     source frames queued to the ``OUTPUT`` queue between ``V4L2_E=
NC_CMD_STOP``
> > > > +     and :c:func:`VIDIOC_STREAMOFF` will be discarded.
> > > > +
> > > > +.. note::
> > > > +
> > > > +   Once the drain sequence is initiated, the client needs to drive=
 it to
> > > > +   completion, as described by the steps above, unless it aborts t=
he process by
> > > > +   issuing :c:func:`VIDIOC_STREAMOFF` on any of the ``OUTPUT`` or =
``CAPTURE``
> > > > +   queues.  The client is not allowed to issue ``V4L2_ENC_CMD_STAR=
T`` or
> > > > +   ``V4L2_ENC_CMD_STOP`` again while the drain sequence is in prog=
ress and they
> > > > +   will fail with -EBUSY error code if attempted.
> > > > +
> > > > +   For reference, handling of various corner cases is described be=
low:
> > > > +
> > > > +   * In case of no buffer in the ``OUTPUT`` queue at the time the
> > > > +     ``V4L2_ENC_CMD_STOP`` command was issued, the drain sequence =
completes
> > > > +     immediately and the encoder returns an empty ``CAPTURE`` buff=
er with the
> > > > +     ``V4L2_BUF_FLAG_LAST`` flag set.
> > > > +
> > > > +   * In case of no buffer in the ``CAPTURE`` queue at the time the=
 drain
> > > > +     sequence completes, the next time the client queues a ``CAPTU=
RE`` buffer
> > > > +     it is returned at once as an empty buffer with the ``V4L2_BUF=
_FLAG_LAST``
> > > > +     flag set.
> > > > +
> > > > +   * If :c:func:`VIDIOC_STREAMOFF` is called on the ``CAPTURE`` qu=
eue in the
> > > > +     middle of the drain sequence, the drain sequence is canceled =
and all
> > > > +     ``CAPTURE`` buffers are implicitly returned to the client.
> > > > +
> > > > +   * If :c:func:`VIDIOC_STREAMOFF` is called on the ``OUTPUT`` que=
ue in the
> > > > +     middle of the drain sequence, the drain sequence completes im=
mediately and
> > > > +     next ``CAPTURE`` buffer will be returned empty with the
> > > > +     ``V4L2_BUF_FLAG_LAST`` flag set.
> > > > +
> > > > +   Although not mandatory, the availability of encoder commands ma=
y be queried
> > > > +   using :c:func:`VIDIOC_TRY_ENCODER_CMD`.
> > > > +
> > > > +Reset
> > > > +=3D=3D=3D=3D=3D
> > > > +
> > > > +The client may want to request the encoder to reinitialize the enc=
oding, so
> > > > +that the following stream data becomes independent from the stream=
 data
> > > > +generated before. Depending on the coded format, that may imply th=
at:
> > > > +
> > > > +* encoded frames produced after the restart must not reference any=
 frames
> > > > +  produced before the stop, e.g. no long term references for H.264=
/HEVC,
> > > > +
> > > > +* any headers that must be included in a standalone stream must be=
 produced
> > > > +  again, e.g. SPS and PPS for H.264/HEVC.
> > >
> > > It seems that clients needs to know SPS/PPS (for muxers?) and thus th=
ey
> > > will need to extract or parse the encoder output buffers to find them=
.
> > > Maybe the spec should consider adding some buffer flag to mark such
> > > buffers which contain SPS/PPS only.
> > >
> > > [1] - see at "type AvcCBox struct"
> > >
> > > Nicolas, how the gstreamer handle this?
> > >
> > > > +
> > > > +This can be achieved by performing the reset sequence.
> > > > +
> > > > +1. Perform the `Drain` sequence to ensure all the in-flight encodi=
ng finishes
> > > > +   and respective buffers are dequeued.
> > > > +
> > > > +2. Stop streaming on the ``CAPTURE`` queue via :c:func:`VIDIOC_STR=
EAMOFF`. This
> > > > +   will return all currently queued ``CAPTURE`` buffers to the cli=
ent, without
> > > > +   valid frame data.
> > > > +
> > > > +3. Start streaming on the ``CAPTURE`` queue via :c:func:`VIDIOC_ST=
REAMON` and
> > > > +   continue with regular encoding sequence. The encoded frames pro=
duced into
> > > > +   ``CAPTURE`` buffers from now on will contain a standalone strea=
m that can be
> > > > +   decoded without the need for frames encoded before the reset se=
quence,
> > > > +   starting at the first ``OUTPUT`` buffer queued after issuing th=
e
> > > > +   `V4L2_ENC_CMD_STOP` of the `Drain` sequence.
> > > > +
> > > > +This sequence may be also used to change encoding parameters for e=
ncoders
> > > > +without the ability to change the parameters on the fly.
> > > > +
> > >
> > > <cut>
> > >
> >
