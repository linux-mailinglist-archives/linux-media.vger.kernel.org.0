Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F699C47C8
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 08:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbfJBGcN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 02:32:13 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:34318 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfJBGcN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 02:32:13 -0400
Received: by mail-ed1-f65.google.com with SMTP id p10so14157002edq.1
        for <linux-media@vger.kernel.org>; Tue, 01 Oct 2019 23:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qHvME24CX/a3TzpltLl6GAw8Bthj9woXnOHTBAG5Vzk=;
        b=BWtmw1jr3yZ+cgce6K+LTVFJSXBS6Uo1iOcrLUjx3rORSP3JJ2zjrEC/3XaJz5/nZW
         Z0lMXUtncSTpd5oHampHECCBCMZd2G7ztQAYr4A0JHaJElWAwQ2zMhBRarbGaKM3Yn1g
         ltWhwtdheuM3w/CVuT+PhJiY+0+LQwBgwxnAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qHvME24CX/a3TzpltLl6GAw8Bthj9woXnOHTBAG5Vzk=;
        b=tXHY5JkZQeflbRglkIi5X1rUtEJnSxi6124fqlUa2f33FZjjXoPlGal2n1gn9/xaHC
         6D0x5uCJXW3J6D1xsvxsO+F5uOsUXiYM3rbkhQvN6o/Kz/OFzJpz/XssSnKcVCWg5goN
         ht85b/g5B+/5AZMZ8NLGFLiYLHYyGC8ExSCJno3DuoGmidtpK/OBCpt3Fb+yHIwuIOsm
         8FNWSOoZVtqABNxL0xzytpFcRQvziu5DVqvqeqrQs1jOOBDroJoNDaM3DSwWD4JvMUeK
         Zt9mwZTj6Xs5EKdJfpovu3Ribyt9ezhVDvaWFwn9M0REiAHIDgF9/aQa2OqZ9ShC/cy+
         2q2Q==
X-Gm-Message-State: APjAAAXF5SWjdHiPmVYjiMV9fYUhizzDFKS3PKXBfajyUwjnsIlOvKrC
        dGyun2/6lTrX4fpNLKyk4chwF/JzdFZeDw==
X-Google-Smtp-Source: APXvYqxzuRZTkQfFIDoz7aKEGu/3nRTeVrK9giz1QAfvbimqCz5O0X0oKejMWtzBTXGoXZH8zUYaQA==
X-Received: by 2002:a17:906:1991:: with SMTP id g17mr1617714ejd.220.1569997927527;
        Tue, 01 Oct 2019 23:32:07 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id t22sm3687653edd.79.2019.10.01.23.32.06
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2019 23:32:06 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id p7so5769792wmp.4
        for <linux-media@vger.kernel.org>; Tue, 01 Oct 2019 23:32:06 -0700 (PDT)
X-Received: by 2002:a1c:c104:: with SMTP id r4mr1552482wmf.64.1569997925588;
 Tue, 01 Oct 2019 23:32:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190815144456.54583-1-hverkuil-cisco@xs4all.nl>
 <20190815144456.54583-12-hverkuil-cisco@xs4all.nl> <1225224c-9991-9cdb-e554-cf2a7bb374e6@xs4all.nl>
 <98231e25a99c4e4c84b5704e57e78b78e2523266.camel@ndufresne.ca>
In-Reply-To: <98231e25a99c4e4c84b5704e57e78b78e2523266.camel@ndufresne.ca>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 2 Oct 2019 15:31:54 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DiS2jKGvVc847Ff0F2F44fhb-=SR3KFyWu3gKgPAFhRQ@mail.gmail.com>
Message-ID: <CAAFQd5DiS2jKGvVc847Ff0F2F44fhb-=SR3KFyWu3gKgPAFhRQ@mail.gmail.com>
Subject: Re: [PATCHv3 11/12] media: docs-rst: Document m2m stateless video
 decoder interface
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 27, 2019 at 12:40 AM Nicolas Dufresne <nicolas@ndufresne.ca> wr=
ote:
>
> Le jeudi 26 septembre 2019 =C3=A0 13:33 +0200, Hans Verkuil a =C3=A9crit =
:
> > Hi Alexandre, Tomasz,
> >
> > On 8/15/19 4:44 PM, Hans Verkuil wrote:
> > > From: Alexandre Courbot <acourbot@chromium.org>
> > >
> > > Documents the protocol that user-space should follow when
> > > communicating with stateless video decoders.
> > >
> > > The stateless video decoding API makes use of the new request and tag=
s
> > > APIs. While it has been implemented with the Cedrus driver so far, it
> > > should probably still be considered staging for a short while.
> >
> > I noticed that this stateless decoder spec doesn't describe how to set =
up
> > crop/compose selection rectangles for CAPTURE. Was there a reason for t=
hat?
> > Would this work differently for stateless vs stateful decoders?

There is one big difference between stateless and stateful decoders -
the latter detect the rectangle from the decoded stream. The former
just write pixels to the area specified by the application.

Another aspect is that a stateless decoder always needs to write the
full macroblocks to the frame buffer, because it is not aware of the
visible part. That invisible area might be also required for decoding
further inter-frames.

> >
> > It's true that cedrus and hantro currently do not support this, but I
> > assume there is no reason why this can't be supported by other drivers.
>
> Most of the encoders upstream aren't fully production ready, so they
> might be missing some bits. What we minimally need to be able to do is
> encode let's say 15x15 image and see this crop reflected into the
> headers.

I might be confused, but I thought we were talking about decoders here.

Best regards,
Tomasz

>
> I wonder if instead of using the compose API, the drivers aren't
> assuming that the width/height on the CAPTURE queue format is the
> display width/height, and then the format on the OUTPUT queue format is
> the padded one. Works for top/left crop, which is likely what we will
> be using most of the time.
>
> For sure, to support all possibilities, we'd need the compose API, the
> SPS has top/left/right/bottom offset (in pixels) for cropping the
> image. Specially if you have an odd left or top offset, since cropping
> with sub-sampled formats require re-siting to avoid chroma shift. But
> I'm pretty sure, this is rarely supported, or just handle the naive way
> (with offset and stride modification).
>
> >
> > Regards,
> >
> >       Hans
> >
> > > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > > ---
> > >  Documentation/media/uapi/v4l/dev-mem2mem.rst  |   1 +
> > >  .../media/uapi/v4l/dev-stateless-decoder.rst  | 424 ++++++++++++++++=
++
> > >  2 files changed, 425 insertions(+)
> > >  create mode 100644 Documentation/media/uapi/v4l/dev-stateless-decode=
r.rst
> > >
> > > diff --git a/Documentation/media/uapi/v4l/dev-mem2mem.rst b/Documenta=
tion/media/uapi/v4l/dev-mem2mem.rst
> > > index caa05f5f6380..70953958cee6 100644
> > > --- a/Documentation/media/uapi/v4l/dev-mem2mem.rst
> > > +++ b/Documentation/media/uapi/v4l/dev-mem2mem.rst
> > > @@ -46,3 +46,4 @@ devices are given in the following sections.
> > >      :maxdepth: 1
> > >
> > >      dev-decoder
> > > +    dev-stateless-decoder
> > > diff --git a/Documentation/media/uapi/v4l/dev-stateless-decoder.rst b=
/Documentation/media/uapi/v4l/dev-stateless-decoder.rst
> > > new file mode 100644
> > > index 000000000000..4a26646eeec5
> > > --- /dev/null
> > > +++ b/Documentation/media/uapi/v4l/dev-stateless-decoder.rst
> > > @@ -0,0 +1,424 @@
> > > +.. SPDX-License-Identifier: GPL-2.0
> > > +
> > > +.. _stateless_decoder:
> > > +
> > > +**************************************************
> > > +Memory-to-memory Stateless Video Decoder Interface
> > > +**************************************************
> > > +
> > > +A stateless decoder is a decoder that works without retaining any ki=
nd of state
> > > +between processed frames. This means that each frame is decoded inde=
pendently
> > > +of any previous and future frames, and that the client is responsibl=
e for
> > > +maintaining the decoding state and providing it to the decoder with =
each
> > > +decoding request. This is in contrast to the stateful video decoder =
interface,
> > > +where the hardware and driver maintain the decoding state and all th=
e client
> > > +has to do is to provide the raw encoded stream and dequeue decoded f=
rames in
> > > +display order.
> > > +
> > > +This section describes how user-space ("the client") is expected to =
communicate
> > > +with stateless decoders in order to successfully decode an encoded s=
tream.
> > > +Compared to stateful codecs, the decoder/client sequence is simpler,=
 but the
> > > +cost of this simplicity is extra complexity in the client which is r=
esponsible
> > > +for maintaining a consistent decoding state.
> > > +
> > > +Stateless decoders make use of the :ref:`media-request-api`. A state=
less
> > > +decoder must expose the ``V4L2_BUF_CAP_SUPPORTS_REQUESTS`` capabilit=
y on its
> > > +``OUTPUT`` queue when :c:func:`VIDIOC_REQBUFS` or :c:func:`VIDIOC_CR=
EATE_BUFS`
> > > +are invoked.
> > > +
> > > +Depending on the encoded formats supported by the decoder, a single =
decoded
> > > +frame may be the result of several decode requests (for instance, H.=
264 streams
> > > +with multiple slices per frame). Decoders that support such formats =
must also
> > > +expose the ``V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF`` capability=
 on their
> > > +``OUTPUT`` queue.
> > > +
> > > +Querying capabilities
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +1. To enumerate the set of coded formats supported by the decoder, t=
he client
> > > +   calls :c:func:`VIDIOC_ENUM_FMT` on the ``OUTPUT`` queue.
> > > +
> > > +   * The driver must always return the full set of supported ``OUTPU=
T`` formats,
> > > +     irrespective of the format currently set on the ``CAPTURE`` que=
ue.
> > > +
> > > +   * Simultaneously, the driver must restrain the set of values retu=
rned by
> > > +     codec-specific capability controls (such as H.264 profiles) to =
the set
> > > +     actually supported by the hardware.
> > > +
> > > +2. To enumerate the set of supported raw formats, the client calls
> > > +   :c:func:`VIDIOC_ENUM_FMT` on the ``CAPTURE`` queue.
> > > +
> > > +   * The driver must return only the formats supported for the forma=
t currently
> > > +     active on the ``OUTPUT`` queue.
> > > +
> > > +   * Depending on the currently set ``OUTPUT`` format, the set of su=
pported raw
> > > +     formats may depend on the value of some codec-dependent control=
s.
> > > +     The client is responsible for making sure that these controls a=
re set
> > > +     before querying the ``CAPTURE`` queue. Failure to do so will re=
sult in the
> > > +     default values for these controls being used, and a returned se=
t of formats
> > > +     that may not be usable for the media the client is trying to de=
code.
> > > +
> > > +3. The client may use :c:func:`VIDIOC_ENUM_FRAMESIZES` to detect sup=
ported
> > > +   resolutions for a given format, passing desired pixel format in
> > > +   :c:type:`v4l2_frmsizeenum`'s ``pixel_format``.
> > > +
> > > +4. Supported profiles and levels for the current ``OUTPUT`` format, =
if
> > > +   applicable, may be queried using their respective controls via
> > > +   :c:func:`VIDIOC_QUERYCTRL`.
> > > +
> > > +Initialization
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +1. Set the coded format on the ``OUTPUT`` queue via :c:func:`VIDIOC_=
S_FMT`.
> > > +
> > > +   * **Required fields:**
> > > +
> > > +     ``type``
> > > +         a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT``.
> > > +
> > > +     ``pixelformat``
> > > +         a coded pixel format.
> > > +
> > > +     ``width``, ``height``
> > > +         coded width and height parsed from the stream.
> > > +
> > > +     other fields
> > > +         follow standard semantics.
> > > +
> > > +   .. note::
> > > +
> > > +      Changing the ``OUTPUT`` format may change the currently set ``=
CAPTURE``
> > > +      format. The driver will derive a new ``CAPTURE`` format from t=
he
> > > +      ``OUTPUT`` format being set, including resolution, colorimetry
> > > +      parameters, etc. If the client needs a specific ``CAPTURE`` fo=
rmat,
> > > +      it must adjust it afterwards.
> > > +
> > > +2. Call :c:func:`VIDIOC_S_EXT_CTRLS` to set all the controls (parsed=
 headers,
> > > +   etc.) required by the ``OUTPUT`` format to enumerate the ``CAPTUR=
E`` formats.
> > > +
> > > +3. Call :c:func:`VIDIOC_G_FMT` for ``CAPTURE`` queue to get the form=
at for the
> > > +   destination buffers parsed/decoded from the bytestream.
> > > +
> > > +   * **Required fields:**
> > > +
> > > +     ``type``
> > > +         a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> > > +
> > > +   * **Returned fields:**
> > > +
> > > +     ``width``, ``height``
> > > +         frame buffer resolution for the decoded frames.
> > > +
> > > +     ``pixelformat``
> > > +         pixel format for decoded frames.
> > > +
> > > +     ``num_planes`` (for _MPLANE ``type`` only)
> > > +         number of planes for pixelformat.
> > > +
> > > +     ``sizeimage``, ``bytesperline``
> > > +         as per standard semantics; matching frame buffer format.
> > > +
> > > +   .. note::
> > > +
> > > +      The value of ``pixelformat`` may be any pixel format supported=
 for the
> > > +      ``OUTPUT`` format, based on the hardware capabilities. It is s=
uggested
> > > +      that the driver chooses the preferred/optimal format for the c=
urrent
> > > +      configuration. For example, a YUV format may be preferred over=
 an RGB
> > > +      format, if an additional conversion step would be required for=
 RGB.
> > > +
> > > +4. *[optional]* Enumerate ``CAPTURE`` formats via :c:func:`VIDIOC_EN=
UM_FMT` on
> > > +   the ``CAPTURE`` queue. The client may use this ioctl to discover =
which
> > > +   alternative raw formats are supported for the current ``OUTPUT`` =
format and
> > > +   select one of them via :c:func:`VIDIOC_S_FMT`.
> > > +
> > > +   .. note::
> > > +
> > > +      The driver will return only formats supported for the currentl=
y selected
> > > +      ``OUTPUT`` format and currently set controls, even if more for=
mats may be
> > > +      supported by the decoder in general.
> > > +
> > > +      For example, a decoder may support YUV and RGB formats for
> > > +      resolutions 1920x1088 and lower, but only YUV for higher resol=
utions (due
> > > +      to hardware limitations). After setting a resolution of 1920x1=
088 or lower
> > > +      as the ``OUTPUT`` format, :c:func:`VIDIOC_ENUM_FMT` may return=
 a set of
> > > +      YUV and RGB pixel formats, but after setting a resolution high=
er than
> > > +      1920x1088, the driver will not return RGB pixel formats, since=
 they are
> > > +      unsupported for this resolution.
> > > +
> > > +5. *[optional]* Choose a different ``CAPTURE`` format than suggested=
 via
> > > +   :c:func:`VIDIOC_S_FMT` on ``CAPTURE`` queue. It is possible for t=
he client to
> > > +   choose a different format than selected/suggested by the driver i=
n
> > > +   :c:func:`VIDIOC_G_FMT`.
> > > +
> > > +    * **Required fields:**
> > > +
> > > +      ``type``
> > > +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> > > +
> > > +      ``pixelformat``
> > > +          a raw pixel format.
> > > +
> > > +      ``width``, ``height``
> > > +         frame buffer resolution of the decoded stream; typically un=
changed from
> > > +         what was returned with :c:func:`VIDIOC_G_FMT`, but it may b=
e different
> > > +         if the hardware supports composition and/or scaling.
> > > +
> > > +   After performing this step, the client must perform step 3 again =
in order
> > > +   to obtain up-to-date information about the buffers size and layou=
t.
> > > +
> > > +6. Allocate source (bytestream) buffers via :c:func:`VIDIOC_REQBUFS`=
 on
> > > +   ``OUTPUT`` queue.
> > > +
> > > +    * **Required fields:**
> > > +
> > > +      ``count``
> > > +          requested number of buffers to allocate; greater than zero=
.
> > > +
> > > +      ``type``
> > > +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT``.
> > > +
> > > +      ``memory``
> > > +          follows standard semantics.
> > > +
> > > +    * **Return fields:**
> > > +
> > > +      ``count``
> > > +          actual number of buffers allocated.
> > > +
> > > +    * If required, the driver will adjust ``count`` to be equal or b=
igger to the
> > > +      minimum of required number of ``OUTPUT`` buffers for the given=
 format and
> > > +      requested count. The client must check this value after the io=
ctl returns
> > > +      to get the actual number of buffers allocated.
> > > +
> > > +7. Allocate destination (raw format) buffers via :c:func:`VIDIOC_REQ=
BUFS` on the
> > > +   ``CAPTURE`` queue.
> > > +
> > > +    * **Required fields:**
> > > +
> > > +      ``count``
> > > +          requested number of buffers to allocate; greater than zero=
. The client
> > > +          is responsible for deducing the minimum number of buffers =
required
> > > +          for the stream to be properly decoded (taking e.g. referen=
ce frames
> > > +          into account) and pass an equal or bigger number.
> > > +
> > > +      ``type``
> > > +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> > > +
> > > +      ``memory``
> > > +          follows standard semantics. ``V4L2_MEMORY_USERPTR`` is not=
 supported
> > > +          for ``CAPTURE`` buffers.
> > > +
> > > +    * **Return fields:**
> > > +
> > > +      ``count``
> > > +          adjusted to allocated number of buffers, in case the codec=
 requires
> > > +          more buffers than requested.
> > > +
> > > +    * The driver must adjust count to the minimum of required number=
 of
> > > +      ``CAPTURE`` buffers for the current format, stream configurati=
on and
> > > +      requested count. The client must check this value after the io=
ctl
> > > +      returns to get the number of buffers allocated.
> > > +
> > > +8. Allocate requests (likely one per ``OUTPUT`` buffer) via
> > > +    :c:func:`MEDIA_IOC_REQUEST_ALLOC` on the media device.
> > > +
> > > +9. Start streaming on both ``OUTPUT`` and ``CAPTURE`` queues via
> > > +    :c:func:`VIDIOC_STREAMON`.
> > > +
> > > +Decoding
> > > +=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +For each frame, the client is responsible for submitting at least on=
e request to
> > > +which the following is attached:
> > > +
> > > +* The amount of encoded data expected by the codec for its current
> > > +  configuration, as a buffer submitted to the ``OUTPUT`` queue. Typi=
cally, this
> > > +  corresponds to one frame worth of encoded data, but some formats m=
ay allow (or
> > > +  require) different amounts per unit.
> > > +* All the metadata needed to decode the submitted encoded data, in t=
he form of
> > > +  controls relevant to the format being decoded.
> > > +
> > > +The amount of data and contents of the source ``OUTPUT`` buffer, as =
well as the
> > > +controls that must be set on the request, depend on the active coded=
 pixel
> > > +format and might be affected by codec-specific extended controls, as=
 stated in
> > > +documentation of each format.
> > > +
> > > +If there is a possibility that the decoded frame will require one or=
 more
> > > +decode requests after the current one in order to be produced, then =
the client
> > > +must set the ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag on the ``OU=
TPUT``
> > > +buffer. This will result in the (potentially partially) decoded ``CA=
PTURE``
> > > +buffer not being made available for dequeueing, and reused for the n=
ext decode
> > > +request if the timestamp of the next ``OUTPUT`` buffer has not chang=
ed.
> > > +
> > > +A typical frame would thus be decoded using the following sequence:
> > > +
> > > +1. Queue an ``OUTPUT`` buffer containing one unit of encoded bytestr=
eam data for
> > > +   the decoding request, using :c:func:`VIDIOC_QBUF`.
> > > +
> > > +    * **Required fields:**
> > > +
> > > +      ``index``
> > > +          index of the buffer being queued.
> > > +
> > > +      ``type``
> > > +          type of the buffer.
> > > +
> > > +      ``bytesused``
> > > +          number of bytes taken by the encoded data frame in the buf=
fer.
> > > +
> > > +      ``flags``
> > > +          the ``V4L2_BUF_FLAG_REQUEST_FD`` flag must be set. Additio=
nally, if
> > > +          we are not sure that the current decode request is the las=
t one needed
> > > +          to produce a fully decoded frame, then
> > > +          ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` must also be set.
> > > +
> > > +      ``request_fd``
> > > +          must be set to the file descriptor of the decoding request=
.
> > > +
> > > +      ``timestamp``
> > > +          must be set to a unique value per frame. This value will b=
e propagated
> > > +          into the decoded frame's buffer and can also be used to us=
e this frame
> > > +          as the reference of another. If using multiple decode requ=
ests per
> > > +          frame, then the timestamps of all the ``OUTPUT`` buffers f=
or a given
> > > +          frame must be identical. If the timestamp changes, then th=
e currently
> > > +          held ``CAPTURE`` buffer will be made available for dequeui=
ng and the
> > > +          current request will work on a new ``CAPTURE`` buffer.
> > > +
> > > +2. Set the codec-specific controls for the decoding request, using
> > > +   :c:func:`VIDIOC_S_EXT_CTRLS`.
> > > +
> > > +    * **Required fields:**
> > > +
> > > +      ``which``
> > > +          must be ``V4L2_CTRL_WHICH_REQUEST_VAL``.
> > > +
> > > +      ``request_fd``
> > > +          must be set to the file descriptor of the decoding request=
.
> > > +
> > > +      other fields
> > > +          other fields are set as usual when setting controls. The `=
`controls``
> > > +          array must contain all the codec-specific controls require=
d to decode
> > > +          a frame.
> > > +
> > > +   .. note::
> > > +
> > > +      It is possible to specify the controls in different invocation=
s of
> > > +      :c:func:`VIDIOC_S_EXT_CTRLS`, or to overwrite a previously set=
 control, as
> > > +      long as ``request_fd`` and ``which`` are properly set. The con=
trols state
> > > +      at the moment of request submission is the one that will be co=
nsidered.
> > > +
> > > +   .. note::
> > > +
> > > +      The order in which steps 1 and 2 take place is interchangeable=
.
> > > +
> > > +3. Submit the request by invoking :c:func:`MEDIA_REQUEST_IOC_QUEUE` =
on the
> > > +   request FD.
> > > +
> > > +    If the request is submitted without an ``OUTPUT`` buffer, or if =
some of the
> > > +    required controls are missing from the request, then
> > > +    :c:func:`MEDIA_REQUEST_IOC_QUEUE` will return ``-ENOENT``. If mo=
re than one
> > > +    ``OUTPUT`` buffer is queued, then it will return ``-EINVAL``.
> > > +    :c:func:`MEDIA_REQUEST_IOC_QUEUE` returning non-zero means that =
no
> > > +    ``CAPTURE`` buffer will be produced for this request.
> > > +
> > > +``CAPTURE`` buffers must not be part of the request, and are queued
> > > +independently. They are returned in decode order (i.e. the same orde=
r as coded
> > > +frames were submitted to the ``OUTPUT`` queue).
> > > +
> > > +Runtime decoding errors are signaled by the dequeued ``CAPTURE`` buf=
fers
> > > +carrying the ``V4L2_BUF_FLAG_ERROR`` flag. If a decoded reference fr=
ame has an
> > > +error, then all following decoded frames that refer to it also have =
the
> > > +``V4L2_BUF_FLAG_ERROR`` flag set, although the decoder will still tr=
y to
> > > +produce (likely corrupted) frames.
> > > +
> > > +Buffer management while decoding
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +Contrary to stateful decoders, a stateless decoder does not perform =
any kind of
> > > +buffer management: it only guarantees that dequeued ``CAPTURE`` buff=
ers can be
> > > +used by the client for as long as they are not queued again. "Used" =
here
> > > +encompasses using the buffer for compositing or display.
> > > +
> > > +A dequeued capture buffer can also be used as the reference frame of=
 another
> > > +buffer.
> > > +
> > > +A frame is specified as reference by converting its timestamp into n=
anoseconds,
> > > +and storing it into the relevant member of a codec-dependent control=
 structure.
> > > +The :c:func:`v4l2_timeval_to_ns` function must be used to perform th=
at
> > > +conversion. The timestamp of a frame can be used to reference it as =
soon as all
> > > +its units of encoded data are successfully submitted to the ``OUTPUT=
`` queue.
> > > +
> > > +A decoded buffer containing a reference frame must not be reused as =
a decoding
> > > +target until all the frames referencing it have been decoded. The sa=
fest way to
> > > +achieve this is to refrain from queueing a reference buffer until al=
l the
> > > +decoded frames referencing it have been dequeued. However, if the dr=
iver can
> > > +guarantee that buffers queued to the ``CAPTURE`` queue are processed=
 in queued
> > > +order, then user-space can take advantage of this guarantee and queu=
e a
> > > +reference buffer when the following conditions are met:
> > > +
> > > +1. All the requests for frames affected by the reference frame have =
been
> > > +   queued, and
> > > +
> > > +2. A sufficient number of ``CAPTURE`` buffers to cover all the decod=
ed
> > > +   referencing frames have been queued.
> > > +
> > > +When queuing a decoding request, the driver will increase the refere=
nce count of
> > > +all the resources associated with reference frames. This means that =
the client
> > > +can e.g. close the DMABUF file descriptors of reference frame buffer=
s if it
> > > +won't need them afterwards.
> > > +
> > > +Seeking
> > > +=3D=3D=3D=3D=3D=3D=3D
> > > +In order to seek, the client just needs to submit requests using inp=
ut buffers
> > > +corresponding to the new stream position. It must however be aware t=
hat
> > > +resolution may have changed and follow the dynamic resolution change=
 sequence in
> > > +that case. Also depending on the codec used, picture parameters (e.g=
. SPS/PPS
> > > +for H.264) may have changed and the client is responsible for making=
 sure that a
> > > +valid state is sent to the decoder.
> > > +
> > > +The client is then free to ignore any returned ``CAPTURE`` buffer th=
at comes
> > > +from the pre-seek position.
> > > +
> > > +Pausing
> > > +=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +In order to pause, the client can just cease queuing buffers onto th=
e ``OUTPUT``
> > > +queue. Without source bytestream data, there is no data to process a=
nd the codec
> > > +will remain idle.
> > > +
> > > +Dynamic resolution change
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > > +
> > > +If the client detects a resolution change in the stream, it will nee=
d to perform
> > > +the initialization sequence again with the new resolution:
> > > +
> > > +1. If the last submitted request resulted in a ``CAPTURE`` buffer be=
ing
> > > +   held by the use of the ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` fla=
g, then the
> > > +   last frame is not available on the ``CAPTURE`` queue. In this cas=
e, a
> > > +   ``V4L2_DEC_CMD_FLUSH`` command shall be sent. This will make the =
driver
> > > +   dequeue the held ``CAPTURE`` buffer.
> > > +
> > > +2. Wait until all submitted requests have completed and dequeue the
> > > +   corresponding output buffers.
> > > +
> > > +3. Call :c:func:`VIDIOC_STREAMOFF` on both the ``OUTPUT`` and ``CAPT=
URE``
> > > +   queues.
> > > +
> > > +4. Free all ``CAPTURE`` buffers by calling :c:func:`VIDIOC_REQBUFS` =
on the
> > > +   ``CAPTURE`` queue with a buffer count of zero.
> > > +
> > > +5. Perform the initialization sequence again (minus the allocation o=
f
> > > +   ``OUTPUT`` buffers), with the new resolution set on the ``OUTPUT`=
` queue.
> > > +   Note that due to resolution constraints, a different format may n=
eed to be
> > > +   picked on the ``CAPTURE`` queue.
> > > +
> > > +Drain
> > > +=3D=3D=3D=3D=3D
> > > +
> > > +If the last submitted request resulted in a ``CAPTURE`` buffer being
> > > +held by the use of the ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag, =
then the
> > > +last frame is not available on the ``CAPTURE`` queue. In this case, =
a
> > > +``V4L2_DEC_CMD_FLUSH`` command shall be sent. This will make the dri=
ver
> > > +dequeue the held ``CAPTURE`` buffer.
> > > +
> > > +After that, in order to drain the stream on a stateless decoder, the=
 client
> > > +just needs to wait until all the submitted requests are completed.
> > >
