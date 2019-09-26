Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CD03BF614
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2019 17:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727260AbfIZPkh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Sep 2019 11:40:37 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:37976 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbfIZPkg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Sep 2019 11:40:36 -0400
Received: by mail-qt1-f194.google.com with SMTP id j31so3405346qta.5
        for <linux-media@vger.kernel.org>; Thu, 26 Sep 2019 08:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=sn0PLyTLnq0tSvBmiLFjrP+jGq42GqU3fnUKGfM6iWQ=;
        b=KcmOazsNvL4kq0vF0HoKsj8oW+dtdbXOcZ2gJxJkHZqmsRx8I775pvYpSheAiavxf0
         1mprdQBfp3tPc9i5D61HxJk8LQC/ZU7Jb9A/rhNLSaWCx2b62z5y2FZZRKiaBVO02uWf
         sJzlAw1Tt9Izy+HGXZ3UoGmsD5F190xgMo8UmHHHnBNoxeprOuYfnv8nZPrYuGRufwJA
         pJu8bX97ItnvOFM1CQJcdPfV7zwmkcQNAwOZE240n7T+hZk0O0hsMIvjOkz0H3GGscDD
         ScKQOuecjdBEWxIKTfw1wv8snzLnXNbxCN6qeCrRH1D0RrfHxQ2UtBiEjWFEglCBlq2A
         6CNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=sn0PLyTLnq0tSvBmiLFjrP+jGq42GqU3fnUKGfM6iWQ=;
        b=FitFWaiYj6NQMKv8mb4j8MUE8yCQiq7lpgO9EV6PsTV+j6WtwP6H35sHOjRfBcVJkX
         oXZ6WyDTZWGYnP6EeR2EtDLVE4YJCfd48B5RbvMDmVXBbOvX2DxY/YCTpoW3IrJsn4V4
         CwRpamwudhnO1cTZLZVRUQWuL7a1hc+L+3XhDVpJ6poFcuV52F1zoe8LxVh5Wnp2c+fD
         JJ4ApoornWF8ba3grolineLyvW3r2pGlbJeEUtU/6JeIT/4xb1EMblrPl1uxi6E87t2I
         6udfcPYcP2p9004NBK1JPnHatuEnTz2Yes6zn1ucfQKNHYPoTP0Vsk40TYbljQYg2V0G
         kalQ==
X-Gm-Message-State: APjAAAWqRju+t9Iv/BQdxW1DfgvanIdueF57OpqMnxCQTwNzE3WH8tvp
        Lh2Jpapa3TIL0yRC3KTXSoQFNQ==
X-Google-Smtp-Source: APXvYqxU2b3BZxOEivwWvYuTKxNtifDrwZyDEK0pDS84Gg6eXklbS1iIa14I5rO3lfN2YItL597StA==
X-Received: by 2002:aed:3709:: with SMTP id i9mr4627211qtb.61.1569512435048;
        Thu, 26 Sep 2019 08:40:35 -0700 (PDT)
Received: from tpx230-nicolas (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id p199sm1207054qke.18.2019.09.26.08.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2019 08:40:33 -0700 (PDT)
Message-ID: <98231e25a99c4e4c84b5704e57e78b78e2523266.camel@ndufresne.ca>
Subject: Re: [PATCHv3 11/12] media: docs-rst: Document m2m stateless video
 decoder interface
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>
Date:   Thu, 26 Sep 2019 11:40:32 -0400
In-Reply-To: <1225224c-9991-9cdb-e554-cf2a7bb374e6@xs4all.nl>
References: <20190815144456.54583-1-hverkuil-cisco@xs4all.nl>
         <20190815144456.54583-12-hverkuil-cisco@xs4all.nl>
         <1225224c-9991-9cdb-e554-cf2a7bb374e6@xs4all.nl>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-jCHWl120bDGD/dQKWouS"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-jCHWl120bDGD/dQKWouS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 26 septembre 2019 =C3=A0 13:33 +0200, Hans Verkuil a =C3=A9crit :
> Hi Alexandre, Tomasz,
>=20
> On 8/15/19 4:44 PM, Hans Verkuil wrote:
> > From: Alexandre Courbot <acourbot@chromium.org>
> >=20
> > Documents the protocol that user-space should follow when
> > communicating with stateless video decoders.
> >=20
> > The stateless video decoding API makes use of the new request and tags
> > APIs. While it has been implemented with the Cedrus driver so far, it
> > should probably still be considered staging for a short while.
>=20
> I noticed that this stateless decoder spec doesn't describe how to set up
> crop/compose selection rectangles for CAPTURE. Was there a reason for tha=
t?
> Would this work differently for stateless vs stateful decoders?
>=20
> It's true that cedrus and hantro currently do not support this, but I
> assume there is no reason why this can't be supported by other drivers.

Most of the encoders upstream aren't fully production ready, so they
might be missing some bits. What we minimally need to be able to do is
encode let's say 15x15 image and see this crop reflected into the
headers.

I wonder if instead of using the compose API, the drivers aren't
assuming that the width/height on the CAPTURE queue format is the
display width/height, and then the format on the OUTPUT queue format is
the padded one. Works for top/left crop, which is likely what we will
be using most of the time.

For sure, to support all possibilities, we'd need the compose API, the
SPS has top/left/right/bottom offset (in pixels) for cropping the
image. Specially if you have an odd left or top offset, since cropping
with sub-sampled formats require re-siting to avoid chroma shift. But
I'm pretty sure, this is rarely supported, or just handle the naive way
(with offset and stride modification).

>=20
> Regards,
>=20
> 	Hans
>=20
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > ---
> >  Documentation/media/uapi/v4l/dev-mem2mem.rst  |   1 +
> >  .../media/uapi/v4l/dev-stateless-decoder.rst  | 424 ++++++++++++++++++
> >  2 files changed, 425 insertions(+)
> >  create mode 100644 Documentation/media/uapi/v4l/dev-stateless-decoder.=
rst
> >=20
> > diff --git a/Documentation/media/uapi/v4l/dev-mem2mem.rst b/Documentati=
on/media/uapi/v4l/dev-mem2mem.rst
> > index caa05f5f6380..70953958cee6 100644
> > --- a/Documentation/media/uapi/v4l/dev-mem2mem.rst
> > +++ b/Documentation/media/uapi/v4l/dev-mem2mem.rst
> > @@ -46,3 +46,4 @@ devices are given in the following sections.
> >      :maxdepth: 1
> > =20
> >      dev-decoder
> > +    dev-stateless-decoder
> > diff --git a/Documentation/media/uapi/v4l/dev-stateless-decoder.rst b/D=
ocumentation/media/uapi/v4l/dev-stateless-decoder.rst
> > new file mode 100644
> > index 000000000000..4a26646eeec5
> > --- /dev/null
> > +++ b/Documentation/media/uapi/v4l/dev-stateless-decoder.rst
> > @@ -0,0 +1,424 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +.. _stateless_decoder:
> > +
> > +**************************************************
> > +Memory-to-memory Stateless Video Decoder Interface
> > +**************************************************
> > +
> > +A stateless decoder is a decoder that works without retaining any kind=
 of state
> > +between processed frames. This means that each frame is decoded indepe=
ndently
> > +of any previous and future frames, and that the client is responsible =
for
> > +maintaining the decoding state and providing it to the decoder with ea=
ch
> > +decoding request. This is in contrast to the stateful video decoder in=
terface,
> > +where the hardware and driver maintain the decoding state and all the =
client
> > +has to do is to provide the raw encoded stream and dequeue decoded fra=
mes in
> > +display order.
> > +
> > +This section describes how user-space ("the client") is expected to co=
mmunicate
> > +with stateless decoders in order to successfully decode an encoded str=
eam.
> > +Compared to stateful codecs, the decoder/client sequence is simpler, b=
ut the
> > +cost of this simplicity is extra complexity in the client which is res=
ponsible
> > +for maintaining a consistent decoding state.
> > +
> > +Stateless decoders make use of the :ref:`media-request-api`. A statele=
ss
> > +decoder must expose the ``V4L2_BUF_CAP_SUPPORTS_REQUESTS`` capability =
on its
> > +``OUTPUT`` queue when :c:func:`VIDIOC_REQBUFS` or :c:func:`VIDIOC_CREA=
TE_BUFS`
> > +are invoked.
> > +
> > +Depending on the encoded formats supported by the decoder, a single de=
coded
> > +frame may be the result of several decode requests (for instance, H.26=
4 streams
> > +with multiple slices per frame). Decoders that support such formats mu=
st also
> > +expose the ``V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF`` capability o=
n their
> > +``OUTPUT`` queue.
> > +
> > +Querying capabilities
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +1. To enumerate the set of coded formats supported by the decoder, the=
 client
> > +   calls :c:func:`VIDIOC_ENUM_FMT` on the ``OUTPUT`` queue.
> > +
> > +   * The driver must always return the full set of supported ``OUTPUT`=
` formats,
> > +     irrespective of the format currently set on the ``CAPTURE`` queue=
.
> > +
> > +   * Simultaneously, the driver must restrain the set of values return=
ed by
> > +     codec-specific capability controls (such as H.264 profiles) to th=
e set
> > +     actually supported by the hardware.
> > +
> > +2. To enumerate the set of supported raw formats, the client calls
> > +   :c:func:`VIDIOC_ENUM_FMT` on the ``CAPTURE`` queue.
> > +
> > +   * The driver must return only the formats supported for the format =
currently
> > +     active on the ``OUTPUT`` queue.
> > +
> > +   * Depending on the currently set ``OUTPUT`` format, the set of supp=
orted raw
> > +     formats may depend on the value of some codec-dependent controls.
> > +     The client is responsible for making sure that these controls are=
 set
> > +     before querying the ``CAPTURE`` queue. Failure to do so will resu=
lt in the
> > +     default values for these controls being used, and a returned set =
of formats
> > +     that may not be usable for the media the client is trying to deco=
de.
> > +
> > +3. The client may use :c:func:`VIDIOC_ENUM_FRAMESIZES` to detect suppo=
rted
> > +   resolutions for a given format, passing desired pixel format in
> > +   :c:type:`v4l2_frmsizeenum`'s ``pixel_format``.
> > +
> > +4. Supported profiles and levels for the current ``OUTPUT`` format, if
> > +   applicable, may be queried using their respective controls via
> > +   :c:func:`VIDIOC_QUERYCTRL`.
> > +
> > +Initialization
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +1. Set the coded format on the ``OUTPUT`` queue via :c:func:`VIDIOC_S_=
FMT`.
> > +
> > +   * **Required fields:**
> > +
> > +     ``type``
> > +         a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT``.
> > +
> > +     ``pixelformat``
> > +         a coded pixel format.
> > +
> > +     ``width``, ``height``
> > +         coded width and height parsed from the stream.
> > +
> > +     other fields
> > +         follow standard semantics.
> > +
> > +   .. note::
> > +
> > +      Changing the ``OUTPUT`` format may change the currently set ``CA=
PTURE``
> > +      format. The driver will derive a new ``CAPTURE`` format from the
> > +      ``OUTPUT`` format being set, including resolution, colorimetry
> > +      parameters, etc. If the client needs a specific ``CAPTURE`` form=
at,
> > +      it must adjust it afterwards.
> > +
> > +2. Call :c:func:`VIDIOC_S_EXT_CTRLS` to set all the controls (parsed h=
eaders,
> > +   etc.) required by the ``OUTPUT`` format to enumerate the ``CAPTURE`=
` formats.
> > +
> > +3. Call :c:func:`VIDIOC_G_FMT` for ``CAPTURE`` queue to get the format=
 for the
> > +   destination buffers parsed/decoded from the bytestream.
> > +
> > +   * **Required fields:**
> > +
> > +     ``type``
> > +         a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> > +
> > +   * **Returned fields:**
> > +
> > +     ``width``, ``height``
> > +         frame buffer resolution for the decoded frames.
> > +
> > +     ``pixelformat``
> > +         pixel format for decoded frames.
> > +
> > +     ``num_planes`` (for _MPLANE ``type`` only)
> > +         number of planes for pixelformat.
> > +
> > +     ``sizeimage``, ``bytesperline``
> > +         as per standard semantics; matching frame buffer format.
> > +
> > +   .. note::
> > +
> > +      The value of ``pixelformat`` may be any pixel format supported f=
or the
> > +      ``OUTPUT`` format, based on the hardware capabilities. It is sug=
gested
> > +      that the driver chooses the preferred/optimal format for the cur=
rent
> > +      configuration. For example, a YUV format may be preferred over a=
n RGB
> > +      format, if an additional conversion step would be required for R=
GB.
> > +
> > +4. *[optional]* Enumerate ``CAPTURE`` formats via :c:func:`VIDIOC_ENUM=
_FMT` on
> > +   the ``CAPTURE`` queue. The client may use this ioctl to discover wh=
ich
> > +   alternative raw formats are supported for the current ``OUTPUT`` fo=
rmat and
> > +   select one of them via :c:func:`VIDIOC_S_FMT`.
> > +
> > +   .. note::
> > +
> > +      The driver will return only formats supported for the currently =
selected
> > +      ``OUTPUT`` format and currently set controls, even if more forma=
ts may be
> > +      supported by the decoder in general.
> > +
> > +      For example, a decoder may support YUV and RGB formats for
> > +      resolutions 1920x1088 and lower, but only YUV for higher resolut=
ions (due
> > +      to hardware limitations). After setting a resolution of 1920x108=
8 or lower
> > +      as the ``OUTPUT`` format, :c:func:`VIDIOC_ENUM_FMT` may return a=
 set of
> > +      YUV and RGB pixel formats, but after setting a resolution higher=
 than
> > +      1920x1088, the driver will not return RGB pixel formats, since t=
hey are
> > +      unsupported for this resolution.
> > +
> > +5. *[optional]* Choose a different ``CAPTURE`` format than suggested v=
ia
> > +   :c:func:`VIDIOC_S_FMT` on ``CAPTURE`` queue. It is possible for the=
 client to
> > +   choose a different format than selected/suggested by the driver in
> > +   :c:func:`VIDIOC_G_FMT`.
> > +
> > +    * **Required fields:**
> > +
> > +      ``type``
> > +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> > +
> > +      ``pixelformat``
> > +          a raw pixel format.
> > +
> > +      ``width``, ``height``
> > +         frame buffer resolution of the decoded stream; typically unch=
anged from
> > +         what was returned with :c:func:`VIDIOC_G_FMT`, but it may be =
different
> > +         if the hardware supports composition and/or scaling.
> > +
> > +   After performing this step, the client must perform step 3 again in=
 order
> > +   to obtain up-to-date information about the buffers size and layout.
> > +
> > +6. Allocate source (bytestream) buffers via :c:func:`VIDIOC_REQBUFS` o=
n
> > +   ``OUTPUT`` queue.
> > +
> > +    * **Required fields:**
> > +
> > +      ``count``
> > +          requested number of buffers to allocate; greater than zero.
> > +
> > +      ``type``
> > +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT``.
> > +
> > +      ``memory``
> > +          follows standard semantics.
> > +
> > +    * **Return fields:**
> > +
> > +      ``count``
> > +          actual number of buffers allocated.
> > +
> > +    * If required, the driver will adjust ``count`` to be equal or big=
ger to the
> > +      minimum of required number of ``OUTPUT`` buffers for the given f=
ormat and
> > +      requested count. The client must check this value after the ioct=
l returns
> > +      to get the actual number of buffers allocated.
> > +
> > +7. Allocate destination (raw format) buffers via :c:func:`VIDIOC_REQBU=
FS` on the
> > +   ``CAPTURE`` queue.
> > +
> > +    * **Required fields:**
> > +
> > +      ``count``
> > +          requested number of buffers to allocate; greater than zero. =
The client
> > +          is responsible for deducing the minimum number of buffers re=
quired
> > +          for the stream to be properly decoded (taking e.g. reference=
 frames
> > +          into account) and pass an equal or bigger number.
> > +
> > +      ``type``
> > +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> > +
> > +      ``memory``
> > +          follows standard semantics. ``V4L2_MEMORY_USERPTR`` is not s=
upported
> > +          for ``CAPTURE`` buffers.
> > +
> > +    * **Return fields:**
> > +
> > +      ``count``
> > +          adjusted to allocated number of buffers, in case the codec r=
equires
> > +          more buffers than requested.
> > +
> > +    * The driver must adjust count to the minimum of required number o=
f
> > +      ``CAPTURE`` buffers for the current format, stream configuration=
 and
> > +      requested count. The client must check this value after the ioct=
l
> > +      returns to get the number of buffers allocated.
> > +
> > +8. Allocate requests (likely one per ``OUTPUT`` buffer) via
> > +    :c:func:`MEDIA_IOC_REQUEST_ALLOC` on the media device.
> > +
> > +9. Start streaming on both ``OUTPUT`` and ``CAPTURE`` queues via
> > +    :c:func:`VIDIOC_STREAMON`.
> > +
> > +Decoding
> > +=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +For each frame, the client is responsible for submitting at least one =
request to
> > +which the following is attached:
> > +
> > +* The amount of encoded data expected by the codec for its current
> > +  configuration, as a buffer submitted to the ``OUTPUT`` queue. Typica=
lly, this
> > +  corresponds to one frame worth of encoded data, but some formats may=
 allow (or
> > +  require) different amounts per unit.
> > +* All the metadata needed to decode the submitted encoded data, in the=
 form of
> > +  controls relevant to the format being decoded.
> > +
> > +The amount of data and contents of the source ``OUTPUT`` buffer, as we=
ll as the
> > +controls that must be set on the request, depend on the active coded p=
ixel
> > +format and might be affected by codec-specific extended controls, as s=
tated in
> > +documentation of each format.
> > +
> > +If there is a possibility that the decoded frame will require one or m=
ore
> > +decode requests after the current one in order to be produced, then th=
e client
> > +must set the ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag on the ``OUTP=
UT``
> > +buffer. This will result in the (potentially partially) decoded ``CAPT=
URE``
> > +buffer not being made available for dequeueing, and reused for the nex=
t decode
> > +request if the timestamp of the next ``OUTPUT`` buffer has not changed=
.
> > +
> > +A typical frame would thus be decoded using the following sequence:
> > +
> > +1. Queue an ``OUTPUT`` buffer containing one unit of encoded bytestrea=
m data for
> > +   the decoding request, using :c:func:`VIDIOC_QBUF`.
> > +
> > +    * **Required fields:**
> > +
> > +      ``index``
> > +          index of the buffer being queued.
> > +
> > +      ``type``
> > +          type of the buffer.
> > +
> > +      ``bytesused``
> > +          number of bytes taken by the encoded data frame in the buffe=
r.
> > +
> > +      ``flags``
> > +          the ``V4L2_BUF_FLAG_REQUEST_FD`` flag must be set. Additiona=
lly, if
> > +          we are not sure that the current decode request is the last =
one needed
> > +          to produce a fully decoded frame, then
> > +          ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` must also be set.
> > +
> > +      ``request_fd``
> > +          must be set to the file descriptor of the decoding request.
> > +
> > +      ``timestamp``
> > +          must be set to a unique value per frame. This value will be =
propagated
> > +          into the decoded frame's buffer and can also be used to use =
this frame
> > +          as the reference of another. If using multiple decode reques=
ts per
> > +          frame, then the timestamps of all the ``OUTPUT`` buffers for=
 a given
> > +          frame must be identical. If the timestamp changes, then the =
currently
> > +          held ``CAPTURE`` buffer will be made available for dequeuing=
 and the
> > +          current request will work on a new ``CAPTURE`` buffer.
> > +
> > +2. Set the codec-specific controls for the decoding request, using
> > +   :c:func:`VIDIOC_S_EXT_CTRLS`.
> > +
> > +    * **Required fields:**
> > +
> > +      ``which``
> > +          must be ``V4L2_CTRL_WHICH_REQUEST_VAL``.
> > +
> > +      ``request_fd``
> > +          must be set to the file descriptor of the decoding request.
> > +
> > +      other fields
> > +          other fields are set as usual when setting controls. The ``c=
ontrols``
> > +          array must contain all the codec-specific controls required =
to decode
> > +          a frame.
> > +
> > +   .. note::
> > +
> > +      It is possible to specify the controls in different invocations =
of
> > +      :c:func:`VIDIOC_S_EXT_CTRLS`, or to overwrite a previously set c=
ontrol, as
> > +      long as ``request_fd`` and ``which`` are properly set. The contr=
ols state
> > +      at the moment of request submission is the one that will be cons=
idered.
> > +
> > +   .. note::
> > +
> > +      The order in which steps 1 and 2 take place is interchangeable.
> > +
> > +3. Submit the request by invoking :c:func:`MEDIA_REQUEST_IOC_QUEUE` on=
 the
> > +   request FD.
> > +
> > +    If the request is submitted without an ``OUTPUT`` buffer, or if so=
me of the
> > +    required controls are missing from the request, then
> > +    :c:func:`MEDIA_REQUEST_IOC_QUEUE` will return ``-ENOENT``. If more=
 than one
> > +    ``OUTPUT`` buffer is queued, then it will return ``-EINVAL``.
> > +    :c:func:`MEDIA_REQUEST_IOC_QUEUE` returning non-zero means that no
> > +    ``CAPTURE`` buffer will be produced for this request.
> > +
> > +``CAPTURE`` buffers must not be part of the request, and are queued
> > +independently. They are returned in decode order (i.e. the same order =
as coded
> > +frames were submitted to the ``OUTPUT`` queue).
> > +
> > +Runtime decoding errors are signaled by the dequeued ``CAPTURE`` buffe=
rs
> > +carrying the ``V4L2_BUF_FLAG_ERROR`` flag. If a decoded reference fram=
e has an
> > +error, then all following decoded frames that refer to it also have th=
e
> > +``V4L2_BUF_FLAG_ERROR`` flag set, although the decoder will still try =
to
> > +produce (likely corrupted) frames.
> > +
> > +Buffer management while decoding
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +Contrary to stateful decoders, a stateless decoder does not perform an=
y kind of
> > +buffer management: it only guarantees that dequeued ``CAPTURE`` buffer=
s can be
> > +used by the client for as long as they are not queued again. "Used" he=
re
> > +encompasses using the buffer for compositing or display.
> > +
> > +A dequeued capture buffer can also be used as the reference frame of a=
nother
> > +buffer.
> > +
> > +A frame is specified as reference by converting its timestamp into nan=
oseconds,
> > +and storing it into the relevant member of a codec-dependent control s=
tructure.
> > +The :c:func:`v4l2_timeval_to_ns` function must be used to perform that
> > +conversion. The timestamp of a frame can be used to reference it as so=
on as all
> > +its units of encoded data are successfully submitted to the ``OUTPUT``=
 queue.
> > +
> > +A decoded buffer containing a reference frame must not be reused as a =
decoding
> > +target until all the frames referencing it have been decoded. The safe=
st way to
> > +achieve this is to refrain from queueing a reference buffer until all =
the
> > +decoded frames referencing it have been dequeued. However, if the driv=
er can
> > +guarantee that buffers queued to the ``CAPTURE`` queue are processed i=
n queued
> > +order, then user-space can take advantage of this guarantee and queue =
a
> > +reference buffer when the following conditions are met:
> > +
> > +1. All the requests for frames affected by the reference frame have be=
en
> > +   queued, and
> > +
> > +2. A sufficient number of ``CAPTURE`` buffers to cover all the decoded
> > +   referencing frames have been queued.
> > +
> > +When queuing a decoding request, the driver will increase the referenc=
e count of
> > +all the resources associated with reference frames. This means that th=
e client
> > +can e.g. close the DMABUF file descriptors of reference frame buffers =
if it
> > +won't need them afterwards.
> > +
> > +Seeking
> > +=3D=3D=3D=3D=3D=3D=3D
> > +In order to seek, the client just needs to submit requests using input=
 buffers
> > +corresponding to the new stream position. It must however be aware tha=
t
> > +resolution may have changed and follow the dynamic resolution change s=
equence in
> > +that case. Also depending on the codec used, picture parameters (e.g. =
SPS/PPS
> > +for H.264) may have changed and the client is responsible for making s=
ure that a
> > +valid state is sent to the decoder.
> > +
> > +The client is then free to ignore any returned ``CAPTURE`` buffer that=
 comes
> > +from the pre-seek position.
> > +
> > +Pausing
> > +=3D=3D=3D=3D=3D=3D=3D
> > +
> > +In order to pause, the client can just cease queuing buffers onto the =
``OUTPUT``
> > +queue. Without source bytestream data, there is no data to process and=
 the codec
> > +will remain idle.
> > +
> > +Dynamic resolution change
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > +
> > +If the client detects a resolution change in the stream, it will need =
to perform
> > +the initialization sequence again with the new resolution:
> > +
> > +1. If the last submitted request resulted in a ``CAPTURE`` buffer bein=
g
> > +   held by the use of the ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag,=
 then the
> > +   last frame is not available on the ``CAPTURE`` queue. In this case,=
 a
> > +   ``V4L2_DEC_CMD_FLUSH`` command shall be sent. This will make the dr=
iver
> > +   dequeue the held ``CAPTURE`` buffer.
> > +
> > +2. Wait until all submitted requests have completed and dequeue the
> > +   corresponding output buffers.
> > +
> > +3. Call :c:func:`VIDIOC_STREAMOFF` on both the ``OUTPUT`` and ``CAPTUR=
E``
> > +   queues.
> > +
> > +4. Free all ``CAPTURE`` buffers by calling :c:func:`VIDIOC_REQBUFS` on=
 the
> > +   ``CAPTURE`` queue with a buffer count of zero.
> > +
> > +5. Perform the initialization sequence again (minus the allocation of
> > +   ``OUTPUT`` buffers), with the new resolution set on the ``OUTPUT`` =
queue.
> > +   Note that due to resolution constraints, a different format may nee=
d to be
> > +   picked on the ``CAPTURE`` queue.
> > +
> > +Drain
> > +=3D=3D=3D=3D=3D
> > +
> > +If the last submitted request resulted in a ``CAPTURE`` buffer being
> > +held by the use of the ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag, th=
en the
> > +last frame is not available on the ``CAPTURE`` queue. In this case, a
> > +``V4L2_DEC_CMD_FLUSH`` command shall be sent. This will make the drive=
r
> > +dequeue the held ``CAPTURE`` buffer.
> > +
> > +After that, in order to drain the stream on a stateless decoder, the c=
lient
> > +just needs to wait until all the submitted requests are completed.
> >=20

--=-jCHWl120bDGD/dQKWouS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXYzb8AAKCRBxUwItrAao
HBqDAKCDx2yjEXY0ezCqxgXK1IjaEhhGGwCbB4oncimbmNkwN3c9qz7v9ObWnEg=
=56BN
-----END PGP SIGNATURE-----

--=-jCHWl120bDGD/dQKWouS--

