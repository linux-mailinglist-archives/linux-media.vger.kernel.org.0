Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F25DA1F54CF
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 14:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729082AbgFJM2o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 08:28:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728728AbgFJM2o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 08:28:44 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8783AC03E96B
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 05:28:43 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id k11so2333045ejr.9
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 05:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HnzfkfqblJ8ddCWv7boZOcId9zTNyCm6cPBHGR88hXU=;
        b=KPzaStDz/8tHuPJuj8JJEquTB1SpQx6VPRH9V6oKobEhROsFl3PsE+HXGhB/GpOEwG
         LFLqIVJsJ8MalhNSiTkvBhu3TF0yQFWVp0WGvPXG9BCLugW4E8Gm89Ph2UUvmjhDuF28
         AGXGH8vLi5JZk0WrZo2ETOSxM8dlC3S/V+3sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HnzfkfqblJ8ddCWv7boZOcId9zTNyCm6cPBHGR88hXU=;
        b=SdyuTH89xhRTFusIm5ceHMoJvBshebHrpZcBpHxMHIJE/mieLxPVj8e+IbfCBn/SNO
         jlPXb/AwNbVbhOZq2gUT8oC/8IjDrLk2NcH4z5WcBL11WoyE/Y363R29Z5qLRP/F6+/P
         67UnQKwgKwZntfGP4/MeG+Js4O+Gkcb4kepCVZ83VL7rgkT1y2yu3G7XKxXKgNnobNfO
         ZFbSoflNzFdBArfFxWiT2PzsZYx/sxQ9b6mNkCOD1DeaVWDxkmCoOMnofXKwQ+g/INT/
         DXAleEIkuwUBCYa5IWZdgLUtOONvuPaC5MqDL0m3f9Od/dAuxoQPrF3n3P5Qz4474Hf5
         yb7g==
X-Gm-Message-State: AOAM532mFAjx8x20P2AsUEbqeONpdMm1XbpgmwLJtSEc8VQ62YMA2HVq
        ckES8e3HZ4KShyBS/RX4fOBZnFPGKefoCA==
X-Google-Smtp-Source: ABdhPJyEbQNnJ6XDGhHOVL2CT13Ud/nYPBckDyluUTJ59ZXkgmkxxXwCKdF+3DlgDAayJOKBe+yQgQ==
X-Received: by 2002:a17:906:6094:: with SMTP id t20mr3284120ejj.359.1591792121510;
        Wed, 10 Jun 2020 05:28:41 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id dn17sm17291645edb.26.2020.06.10.05.28.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2020 05:28:40 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id u26so4546605wmn.1
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 05:28:40 -0700 (PDT)
X-Received: by 2002:a1c:2e0e:: with SMTP id u14mr3003154wmu.55.1591792119908;
 Wed, 10 Jun 2020 05:28:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200526100932.2626420-1-hverkuil-cisco@xs4all.nl>
 <20200526100932.2626420-2-hverkuil-cisco@xs4all.nl> <728b621a-0df7-5c6f-9135-8b9794035b95@linaro.org>
 <b3c33f48ed8ac31e6148e54ccc1650f3d96e0daa.camel@ndufresne.ca>
In-Reply-To: <b3c33f48ed8ac31e6148e54ccc1650f3d96e0daa.camel@ndufresne.ca>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 10 Jun 2020 14:28:23 +0200
X-Gmail-Original-Message-ID: <CAAFQd5Ce4MPOopmD6pXqF-QkiUdj1+UZ6dceKGeDbM8mvevDbQ@mail.gmail.com>
Message-ID: <CAAFQd5Ce4MPOopmD6pXqF-QkiUdj1+UZ6dceKGeDbM8mvevDbQ@mail.gmail.com>
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

On Fri, Jun 5, 2020 at 11:24 PM Nicolas Dufresne <nicolas@ndufresne.ca> wro=
te:
>
> Le vendredi 05 juin 2020 =C3=A0 10:19 +0300, Stanimir Varbanov a =C3=A9cr=
it :
> >
> > On 5/26/20 1:09 PM, Hans Verkuil wrote:
> > > From: Tomasz Figa <tfiga@chromium.org>
> > >
> > > Due to complexity of the video encoding process, the V4L2 drivers of
> > > stateful encoder hardware require specific sequences of V4L2 API call=
s
> > > to be followed. These include capability enumeration, initialization,
> > > encoding, encode parameters change, drain and reset.
> > >
> > > Specifics of the above have been discussed during Media Workshops at
> > > LinuxCon Europe 2012 in Barcelona and then later Embedded Linux
> > > Conference Europe 2014 in D=C3=BCsseldorf. The de facto Codec API tha=
t
> > > originated at those events was later implemented by the drivers we al=
ready
> > > have merged in mainline, such as s5p-mfc or coda.
> > >
> > > The only thing missing was the real specification included as a part =
of
> > > Linux Media documentation. Fix it now and document the encoder part o=
f
> > > the Codec API.
> > >
> > > Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> > > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > > ---
> > >  .../userspace-api/media/v4l/dev-encoder.rst   | 728 ++++++++++++++++=
++
> > >  .../userspace-api/media/v4l/dev-mem2mem.rst   |   1 +
> > >  .../userspace-api/media/v4l/pixfmt-v4l2.rst   |   5 +
> > >  .../userspace-api/media/v4l/v4l2.rst          |   2 +
> > >  .../media/v4l/vidioc-encoder-cmd.rst          |  51 +-
> > >  5 files changed, 767 insertions(+), 20 deletions(-)
> > >  create mode 100644 Documentation/userspace-api/media/v4l/dev-encoder=
.rst
> > >
> > > diff --git a/Documentation/userspace-api/media/v4l/dev-encoder.rst b/=
Documentation/userspace-api/media/v4l/dev-encoder.rst
> > > new file mode 100644
> > > index 000000000000..aace7b812a9c
> > > --- /dev/null
> > > +++ b/Documentation/userspace-api/media/v4l/dev-encoder.rst
> > > @@ -0,0 +1,728 @@
> > > +.. SPDX-License-Identifier: GPL-2.0
> > > +
> > > +.. _encoder:
> > > +
> > > +*************************************************
> > > +Memory-to-Memory Stateful Video Encoder Interface
> > > +*************************************************
> > > +
> > > +A stateful video encoder takes raw video frames in display order and=
 encodes
> > > +them into a bytestream. It generates complete chunks of the bytestre=
am, including
> > > +all metadata, headers, etc. The resulting bytestream does not requir=
e any
> > > +further post-processing by the client.
> > > +
> > > +Performing software stream processing, header generation etc. in the=
 driver
> > > +in order to support this interface is strongly discouraged. In case =
such
> > > +operations are needed, use of the Stateless Video Encoder Interface =
(in
> > > +development) is strongly advised.
> > > +
> >
> > <cut>
> >
> > > +Encoding Parameter Changes
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > > +
> > > +The client is allowed to use :c:func:`VIDIOC_S_CTRL` to change encod=
er
> > > +parameters at any time. The availability of parameters is encoder-sp=
ecific
> > > +and the client must query the encoder to find the set of available c=
ontrols.
> > > +
> > > +The ability to change each parameter during encoding is encoder-spec=
ific, as
> > > +per the standard semantics of the V4L2 control interface. The client=
 may
> > > +attempt to set a control during encoding and if the operation fails =
with the
> > > +-EBUSY error code, the ``CAPTURE`` queue needs to be stopped for the
> > > +configuration change to be allowed. To do this, it may follow the `D=
rain`
> > > +sequence to avoid losing the already queued/encoded frames.
> > > +
> > > +The timing of parameter updates is encoder-specific, as per the stan=
dard
> > > +semantics of the V4L2 control interface. If the client needs to appl=
y the
> > > +parameters exactly at specific frame, using the Request API
> > > +(:ref:`media-request-api`) should be considered, if supported by the=
 encoder.
> >
> > In request-api case does the control will return EBUSY immediately when
> > S_CTRL is called from the client? I'm asking in the context of the
> > controls which are not dynamic (cannot set during streaming and Reset
> > sequence is needed).
>
> This is all hypothetical, as nothing of that has been implemented. But
> I suppose there should be instant validation to allow that, even if
> that means more plumbing inside the kernel. It would be better then
> just running the request ignoring silently that control. Ideally
> userspace should not have to go into trial and errors, so controls that
> are means for the should be marked.
>

There isn't much to be implemented here, as it's the same standard
V4L2 behavior as existed for a while. If a device supports changing
the control on the fly, a call to S_CTRL succeeds, if not, it fails
with -EBUSY. This is regardless of whether requests are used or not.
Requests in this case simply synchronize applying the new control
values with the right frame.


> >
> > > +
> > > +Drain
> > > +=3D=3D=3D=3D=3D
> > > +
> > > +To ensure that all the queued ``OUTPUT`` buffers have been processed=
 and the
> > > +related ``CAPTURE`` buffers are given to the client, the client must=
 follow the
> > > +drain sequence described below. After the drain sequence ends, the c=
lient has
> > > +received all encoded frames for all ``OUTPUT`` buffers queued before=
 the
> > > +sequence was started.
> > > +
> > > +1. Begin the drain sequence by issuing :c:func:`VIDIOC_ENCODER_CMD`.
> > > +
> > > +   * **Required fields:**
> > > +
> > > +     ``cmd``
> > > +         set to ``V4L2_ENC_CMD_STOP``.
> > > +
> > > +     ``flags``
> > > +         set to 0.
> > > +
> > > +     ``pts``
> > > +         set to 0.
> > > +
> > > +   .. warning::
> > > +
> > > +      The sequence can be only initiated if both ``OUTPUT`` and ``CA=
PTURE``
> > > +      queues are streaming. For compatibility reasons, the call to
> > > +      :c:func:`VIDIOC_ENCODER_CMD` will not fail even if any of the =
queues is
> > > +      not streaming, but at the same time it will not initiate the `=
Drain`
> > > +      sequence and so the steps described below would not be applica=
ble.
> > > +
> > > +2. Any ``OUTPUT`` buffers queued by the client before the
> > > +   :c:func:`VIDIOC_ENCODER_CMD` was issued will be processed and enc=
oded as
> > > +   normal. The client must continue to handle both queues independen=
tly,
> > > +   similarly to normal encode operation. This includes:
> > > +
> > > +   * queuing and dequeuing ``CAPTURE`` buffers, until a buffer marke=
d with the
> > > +     ``V4L2_BUF_FLAG_LAST`` flag is dequeued,
> > > +
> > > +     .. warning::
> > > +
> > > +        The last buffer may be empty (with :c:type:`v4l2_buffer`
> > > +        ``bytesused`` =3D 0) and in that case it must be ignored by =
the client,
> > > +        as it does not contain an encoded frame.
> > > +
> > > +     .. note::
> > > +
> > > +        Any attempt to dequeue more ``CAPTURE`` buffers beyond the b=
uffer
> > > +        marked with ``V4L2_BUF_FLAG_LAST`` will result in a -EPIPE e=
rror from
> > > +        :c:func:`VIDIOC_DQBUF`.
> > > +
> > > +   * dequeuing processed ``OUTPUT`` buffers, until all the buffers q=
ueued
> > > +     before the ``V4L2_ENC_CMD_STOP`` command are dequeued,
> > > +
> > > +   * dequeuing the ``V4L2_EVENT_EOS`` event, if the client subscribe=
s to it.
> > > +
> > > +   .. note::
> > > +
> > > +      For backwards compatibility, the encoder will signal a ``V4L2_=
EVENT_EOS``
> > > +      event when the last frame has been encoded and all frames are =
ready to be
> > > +      dequeued. It is deprecated behavior and the client must not re=
ly on it.
> > > +      The ``V4L2_BUF_FLAG_LAST`` buffer flag should be used instead.
> > > +
> > > +3. Once all ``OUTPUT`` buffers queued before the ``V4L2_ENC_CMD_STOP=
`` call are
> > > +   dequeued and the last ``CAPTURE`` buffer is dequeued, the encoder=
 is stopped
> > > +   and it will accept, but not process any newly queued ``OUTPUT`` b=
uffers
> > > +   until the client issues any of the following operations:
> > > +
> > > +   * ``V4L2_ENC_CMD_START`` - the encoder will not be reset and will=
 resume
> > > +     operation normally, with all the state from before the drain,
> > > +
> > > +   * a pair of :c:func:`VIDIOC_STREAMOFF` and :c:func:`VIDIOC_STREAM=
ON` on the
> > > +     ``CAPTURE`` queue - the encoder will be reset (see the `Reset` =
sequence)
> > > +     and then resume encoding,
> > > +
> > > +   * a pair of :c:func:`VIDIOC_STREAMOFF` and :c:func:`VIDIOC_STREAM=
ON` on the
> > > +     ``OUTPUT`` queue - the encoder will resume operation normally, =
however any
> > > +     source frames queued to the ``OUTPUT`` queue between ``V4L2_ENC=
_CMD_STOP``
> > > +     and :c:func:`VIDIOC_STREAMOFF` will be discarded.
> > > +
> > > +.. note::
> > > +
> > > +   Once the drain sequence is initiated, the client needs to drive i=
t to
> > > +   completion, as described by the steps above, unless it aborts the=
 process by
> > > +   issuing :c:func:`VIDIOC_STREAMOFF` on any of the ``OUTPUT`` or ``=
CAPTURE``
> > > +   queues.  The client is not allowed to issue ``V4L2_ENC_CMD_START`=
` or
> > > +   ``V4L2_ENC_CMD_STOP`` again while the drain sequence is in progre=
ss and they
> > > +   will fail with -EBUSY error code if attempted.
> > > +
> > > +   For reference, handling of various corner cases is described belo=
w:
> > > +
> > > +   * In case of no buffer in the ``OUTPUT`` queue at the time the
> > > +     ``V4L2_ENC_CMD_STOP`` command was issued, the drain sequence co=
mpletes
> > > +     immediately and the encoder returns an empty ``CAPTURE`` buffer=
 with the
> > > +     ``V4L2_BUF_FLAG_LAST`` flag set.
> > > +
> > > +   * In case of no buffer in the ``CAPTURE`` queue at the time the d=
rain
> > > +     sequence completes, the next time the client queues a ``CAPTURE=
`` buffer
> > > +     it is returned at once as an empty buffer with the ``V4L2_BUF_F=
LAG_LAST``
> > > +     flag set.
> > > +
> > > +   * If :c:func:`VIDIOC_STREAMOFF` is called on the ``CAPTURE`` queu=
e in the
> > > +     middle of the drain sequence, the drain sequence is canceled an=
d all
> > > +     ``CAPTURE`` buffers are implicitly returned to the client.
> > > +
> > > +   * If :c:func:`VIDIOC_STREAMOFF` is called on the ``OUTPUT`` queue=
 in the
> > > +     middle of the drain sequence, the drain sequence completes imme=
diately and
> > > +     next ``CAPTURE`` buffer will be returned empty with the
> > > +     ``V4L2_BUF_FLAG_LAST`` flag set.
> > > +
> > > +   Although not mandatory, the availability of encoder commands may =
be queried
> > > +   using :c:func:`VIDIOC_TRY_ENCODER_CMD`.
> > > +
> > > +Reset
> > > +=3D=3D=3D=3D=3D
> > > +
> > > +The client may want to request the encoder to reinitialize the encod=
ing, so
> > > +that the following stream data becomes independent from the stream d=
ata
> > > +generated before. Depending on the coded format, that may imply that=
:
> > > +
> > > +* encoded frames produced after the restart must not reference any f=
rames
> > > +  produced before the stop, e.g. no long term references for H.264/H=
EVC,
> > > +
> > > +* any headers that must be included in a standalone stream must be p=
roduced
> > > +  again, e.g. SPS and PPS for H.264/HEVC.
> >
> > It seems that clients needs to know SPS/PPS (for muxers?) and thus they
> > will need to extract or parse the encoder output buffers to find them.
> > Maybe the spec should consider adding some buffer flag to mark such
> > buffers which contain SPS/PPS only.
> >
> > [1] - see at "type AvcCBox struct"
> >
> > Nicolas, how the gstreamer handle this?
> >
> > > +
> > > +This can be achieved by performing the reset sequence.
> > > +
> > > +1. Perform the `Drain` sequence to ensure all the in-flight encoding=
 finishes
> > > +   and respective buffers are dequeued.
> > > +
> > > +2. Stop streaming on the ``CAPTURE`` queue via :c:func:`VIDIOC_STREA=
MOFF`. This
> > > +   will return all currently queued ``CAPTURE`` buffers to the clien=
t, without
> > > +   valid frame data.
> > > +
> > > +3. Start streaming on the ``CAPTURE`` queue via :c:func:`VIDIOC_STRE=
AMON` and
> > > +   continue with regular encoding sequence. The encoded frames produ=
ced into
> > > +   ``CAPTURE`` buffers from now on will contain a standalone stream =
that can be
> > > +   decoded without the need for frames encoded before the reset sequ=
ence,
> > > +   starting at the first ``OUTPUT`` buffer queued after issuing the
> > > +   `V4L2_ENC_CMD_STOP` of the `Drain` sequence.
> > > +
> > > +This sequence may be also used to change encoding parameters for enc=
oders
> > > +without the ability to change the parameters on the fly.
> > > +
> >
> > <cut>
> >
>
