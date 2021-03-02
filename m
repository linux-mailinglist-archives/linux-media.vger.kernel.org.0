Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0737B32A857
	for <lists+linux-media@lfdr.de>; Tue,  2 Mar 2021 18:42:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1580192AbhCBRaf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Mar 2021 12:30:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1574616AbhCBDsX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 22:48:23 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 119DDC06178A
        for <linux-media@vger.kernel.org>; Mon,  1 Mar 2021 19:48:24 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id b1so18335372lfb.7
        for <linux-media@vger.kernel.org>; Mon, 01 Mar 2021 19:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lAaLE90a2k/TFSGjz2q5NYs/bjp/OeHxcYNyzihaxbE=;
        b=gTYTIQCBC4IpDt5W2GlJPfUklDfqd2q3IlSxeT0T4AmX6Rof7oGk5YwnOD1r4G4lDs
         mIEvm204//qsDYmpLQQcvYiO7uvzQlLPD3BxqMLCRP39H1Qk/QYVaFLaxAoW0H5hweIZ
         ovKuJOfMcM0H8ao+YEcK4t/1qILWrzxEHzQQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lAaLE90a2k/TFSGjz2q5NYs/bjp/OeHxcYNyzihaxbE=;
        b=V92CGfaxCNMnrCce3KXkfBSBikXnUzZqmOP7dIeKS4LtZkITWxjRC1A+/LyOZRZluT
         pYBgoJ3FrI8w4O66HdwUVsUPaCCjxXrII6s6DAhka57ib9BJt4Cn45M2pXlSWppjQAdl
         903AnTOkARviVwD0X7lv6xOy/WyFxl12Ef5xwCTjuv+hsd+QfcQdanljYn5QbjeLx2qZ
         rHOYbVFBZXk3JdWARAW6pNw+xrcw2K5Hrg7ArwZFDtBcJ3As+qRBT9EMASGjaPxLJ1/W
         b/5SyEnIcZdudkJtmY77BVx8DUjC9Fl86gYneT/bRsoqYtI/5M3yCJw4H35MBwKzFDQ/
         TEQQ==
X-Gm-Message-State: AOAM530g4F3Nsuqs4Td2laM1hyNR9MFvETEHYuaPs7W9bsLVqAP/yLtv
        xaFL7cZTNUU9Fiyq0qlJR4/vd7xmVmGDJQ==
X-Google-Smtp-Source: ABdhPJym1Kj1VQDQWeyGV1TvkmUriHq9yzgJJGeptXX31YBQDirQcMHDg2ZZWntQ2WPa1qtISCWLbQ==
X-Received: by 2002:a05:6512:1109:: with SMTP id l9mr11569215lfg.559.1614656900930;
        Mon, 01 Mar 2021 19:48:20 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id f23sm2670609ljn.94.2021.03.01.19.48.19
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Mar 2021 19:48:19 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id k9so9192263lfo.12
        for <linux-media@vger.kernel.org>; Mon, 01 Mar 2021 19:48:19 -0800 (PST)
X-Received: by 2002:a19:c7d7:: with SMTP id x206mr7583640lff.403.1614656898124;
 Mon, 01 Mar 2021 19:48:18 -0800 (PST)
MIME-Version: 1.0
References: <20200518174011.15543-1-ezequiel@collabora.com>
 <20200518174011.15543-3-ezequiel@collabora.com> <CAPBb6MXezNVxPrJ05mpS1=yE8V81DjeQ2gA4pGfC8QQzgfUi8A@mail.gmail.com>
 <4a291ba7a0187408231dda601c64f5ee72b9e4ae.camel@collabora.com>
 <CAPBb6MU98vfJFJq=zgh3pEkRU14AALP6XnFq-KNz-RMLFCQaxw@mail.gmail.com> <ca03f32c586addf3992b83e5c1325ff7f58f10ee.camel@collabora.com>
In-Reply-To: <ca03f32c586addf3992b83e5c1325ff7f58f10ee.camel@collabora.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Tue, 2 Mar 2021 12:48:06 +0900
X-Gmail-Original-Message-ID: <CAPBb6MWtj=9U+n6djhKXpb+0LOZHLOHO6VWfFLdv+fC3D+ANHQ@mail.gmail.com>
Message-ID: <CAPBb6MWtj=9U+n6djhKXpb+0LOZHLOHO6VWfFLdv+fC3D+ANHQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] media: uapi: Add VP9 stateless decoder controls
To:     Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-rockchip@lists.infradead.org,
        LKML <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Gustavo Padovan <gustavo.padovan@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 2, 2021 at 3:43 AM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Le dimanche 28 f=C3=A9vrier 2021 =C3=A0 15:13 +0900, Alexandre Courbot a =
=C3=A9crit :
> > Hi Nicolas,
> >
> > On Thu, Feb 25, 2021 at 6:08 AM Nicolas Dufresne
> > <nicolas.dufresne@collabora.com> wrote:
> > >
> > > Le jeudi 10 septembre 2020 =C3=A0 15:04 +0900, Alexandre Courbot a =
=C3=A9crit :
> > > > Hi Ezequiel, sorry for the late review!
> > > >
> > > > On Tue, May 19, 2020 at 2:40 AM Ezequiel Garcia <ezequiel@collabora=
.com>
> > > > wrote:
> > > > >
> > > > > From: Boris Brezillon <boris.brezillon@collabora.com>
> > > > >
> > > > > Add the VP9 stateless decoder controls plus the documentation tha=
t goes
> > > > > with it.
> > > > >
> > > > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > > > ---
> > > > >  .../userspace-api/media/v4l/biblio.rst        |  10 +
> > > > >  .../media/v4l/ext-ctrls-codec.rst             | 550 ++++++++++++=
++++++
> > > > >  drivers/media/v4l2-core/v4l2-ctrls.c          | 239 ++++++++
> > > > >  drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
> > > > >  include/media/v4l2-ctrls.h                    |   1 +
> > > > >  include/media/vp9-ctrls.h                     | 485 ++++++++++++=
+++
> > > > >  6 files changed, 1286 insertions(+)
> > > > >  create mode 100644 include/media/vp9-ctrls.h
> > > > >
> > > > > diff --git a/Documentation/userspace-api/media/v4l/biblio.rst
> > > > > b/Documentation/userspace-api/media/v4l/biblio.rst
> > > > > index 3c9634173e82..e09102e572fd 100644
> > > > > --- a/Documentation/userspace-api/media/v4l/biblio.rst
> > > > > +++ b/Documentation/userspace-api/media/v4l/biblio.rst
> > > > > @@ -414,3 +414,13 @@ VP8
> > > > >  :title:     RFC 6386: "VP8 Data Format and Decoding Guide"
> > > > >
> > > > >  :author:    J. Bankoski et al.
> > > > > +
> > > > > +.. _vp9:
> > > > > +
> > > > > +VP9
> > > > > +=3D=3D=3D
> > > > > +
> > > > > +
> > > > > +:title:     VP9 Bitstream & Decoding Process Specification
> > > > > +
> > > > > +:author:    Adrian Grange (Google), Peter de Rivaz (Argon Design=
),
> > > > > Jonathan
> > > > > Hunt (Argon Design)
> > > > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-code=
c.rst
> > > > > b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > > > index d0d506a444b1..5c5f7dd868da 100644
> > > > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > > > @@ -2668,6 +2668,556 @@ enum
> > > > > v4l2_mpeg_video_h264_hierarchical_coding_type -
> > > > >        - ``padding[3]``
> > > > >        - Applications and drivers must set this to zero.
> > > > >
> > > > > +.. _v4l2-mpeg-vp9:
> > > > > +
> > > > > +``V4L2_CID_MPEG_VIDEO_VP9_FRAME_CONTEXT(0..3) (struct)``
> > > > > +    Stores VP9 probabilities attached to a specific frame contex=
t. The
> > > > > VP9
> > > > > +    specification allows using a maximum of 4 contexts. Each fra=
me
> > > > > being
> > > > > +    decoded refers to one of those context. See section '7.1.2 R=
efresh
> > > > > +    probs semantics' section of :ref:`vp9` for more details abou=
t these
> > > > > +    contexts.
> > > > > +
> > > > > +    This control is bi-directional:
> > > > > +
> > > > > +    * all 4 contexts must be initialized by userspace just after=
 the
> > > > > +      stream is started and before the first decoding request is
> > > > > submitted.
> > > > > +    * the referenced context might be read by the kernel when a
> > > > > decoding
> > > > > +      request is submitted, and will be updated after the decode=
r is
> > > > > done
> > > > > +      decoding the frame if the `V4L2_VP9_FRAME_FLAG_REFRESH_FRA=
ME_CTX`
> > > > > flag
> > > > > +      is set.
> > > > > +    * contexts will be read back by user space before each decod=
ing
> > > > > request
> > > > > +      to retrieve the updated probabilities.
> > > > > +    * userspace will re-initialize the context to their default =
values
> > > > > when
> > > > > +      a reset context is required.
> > > >
> > > > Just to make sure I understand this part correctly, it means that i=
f
> > > > frame A and B use the same context, and frame A has
> > > > V4L2_VP9_FRAME_FLAG_REFRESH_FRAME_CTX set, then user-space must wai=
t
> > > > for frame A to get dequeued and read back this control from the
> > > > completed request before it can submit frame B?
> > >
> > > We are preparing a new version, we believe it was an API mistake to t=
ry and
> > > share the probability update between kernel and userspace. It's actua=
lly
> > > worst,
> > > you really need to push/pull in a lock step, regardless of the frame =
context
> > > id.
> > >
> > > As you may know, the probabilities are used to parse the compressed p=
art of
> > > the
> > > stream (also know as entropy decoding). They are probability of a bit=
stream
> > > symbol of being 0 or 1. On RK3399, the hardware does not parse the
> > > compressed
> > > header. The compressed headers contains the bitstream coded updates t=
o the
> > > probabilities. The probabilities are also updated base on the count o=
f
> > > specific
> > > symbols found in the bitstream during decoding, this is currently don=
e in
> > > the
> > > driver (counts are returned, and driver updates the probabilities fro=
m
> > > that).
> > >
> > > What we found is that the symbols in the compress headers are coded w=
ith
> > > fixed
> > > probabilities, meaning we don't need the probabilities to parse the
> > > compressed
> > > headers. Our proposal will be to keep doing the compressed header par=
sing in
> > > userspace and only store the update value (as found in inv_map_table)=
 to the
> > > kernel. The driver will be responsible of applying this to the curren=
t
> > > probabilities along with doing the probability saving process.
> >
> > So if I am following:
> >
> > 1) The compressed headers can be decompressed using just the entropy
> > information contained in the previous compressed headers,
>
> Using just the entropy contained in the spec. The entropy for this one is
> static.

Even better then, thanks for the clarification.

>
> > 2) The frame data also requires the updated probabilities from the
> > decoding of the previous frames on top of 1)
>
> Yes, the entropy decoding of the frame data requires default tables, the =
deltas
> from the compressed headers, and for non-keyframe the counts of symbols i=
n the
> previous decoding.
>
> All this is being moved inside the kernel.

Sounds good to me. I guess that unless we want to support a
hypothetical decoder that cannot do frame entropy decoding (and such a
decoder does not exist AFAICT, nor would it make much sense) we don't
need to make that information available to user-space.

>
> >
> > Meaning that user-space can decompress the headers without any
> > feedback from the kernel. Am I understanding correctly?
>
> Correct. We have some really eirly code demonstrating it (will all be pub=
lished
> LGPL V2+ and submitted for including in GStreamer). In FFMPEG this is kno=
w as
> VP5/5 Range decoder, so nothing new here.
>
> >
> > >
> > > With this change, we should be able to only push data to the decoder =
without
> > > having to read this control. We believe this will allow better use of=
 the
> > > VB2
> > > queue and enhance the decoding performance.
> >
> > That sounds pretty good to me.
> >
> > >
> > > Please note that this hardware design looks like a mistake. It seems =
that
> > > with
> > > widevine, the compressed header is encrypted. As in some implementati=
on the
> > > decrypted bitstream is no visible to the CPU, it will not be possible=
 to
> > > perform
> > > the needed parsing. An offload to a TEE would be needed. We know that
> > > Rockchip
> > > have fixed this issue in new decoder, notably on RK3368. The probabil=
ity
> > > processing is done in HW.
> >
> > Mmm a solution would be not to encrypt the compressed header, but I
> > guess that's not how things work, right?
>
> Widewine, Playready and other folks will always dictate their way. I gues=
s I
> only wanted to mention publicly so that folks visiting this are not too
> surprised of the detour and contorsion needed. We are not implementing th=
is as
> we speak. For the browser version of Widevine, I don't think this issue w=
ill
> raise.
>
> >
> > Worst case the TEE could indeed copy the decrypted and decompressed
> > somewhere for the CPU to read, but that would complicate things a tiny
> > bit.
>
> Exact, there "exist a solution" ;-P From a API perspective, we simply vis=
ited
> this as we where told it was not possible at all, so we were curious upon=
 why.
> And this is slightly specific to this HW design, newer Rockchip design ha=
ndle
> compress header decoding in HW, so I suspect other vendors will follow th=
is path
> in the future.
>
> >
> > >
> > > >
> > > > > +
> > > > > +    .. note::
> > > > > +
> > > > > +       This compound control is not yet part of the public kerne=
l API
> > > > > and
> > > > > +       it is expected to change.
> > > > > +
> > > > > +.. c:type:: v4l2_ctrl_vp9_frame_ctx
> > > > > +
> > > > > +.. cssclass:: longtable
> > > > > +
> > > > > +.. tabularcolumns:: |p{5.8cm}|p{4.8cm}|p{6.6cm}|
> > > > > +
> > > > > +.. flat-table:: struct v4l2_ctrl_vp9_frame_ctx
> > > > > +    :header-rows:  0
> > > > > +    :stub-columns: 0
> > > > > +    :widths:       1 1 2
> > > > > +
> > > > > +    * - struct :c:type:`v4l2_vp9_probabilities`
> > > > > +      - ``probs``
> > > > > +      - Structure with VP9 probabilities attached to the context=
.
> > > > > +
> > > > > +.. c:type:: v4l2_vp9_probabilities
> > > > > +
> > > > > +.. cssclass:: longtable
> > > > > +
> > > > > +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> > > > > +
> > > > > +.. flat-table:: struct v4l2_vp9_probabilities
> > > > > +    :header-rows:  0
> > > > > +    :stub-columns: 0
> > > > > +    :widths:       1 1 2
> > > > > +
> > > > > +    * - __u8
> > > > > +      - ``tx8[2][1]``
> > > > > +      - TX 8x8 probabilities.
> > > > > +    * - __u8
> > > > > +      - ``tx16[2][2]``
> > > > > +      - TX 16x16 probabilities.
> > > > > +    * - __u8
> > > > > +      - ``tx32[2][3]``
> > > > > +      - TX 32x32 probabilities.
> > > > > +    * - __u8
> > > > > +      - ``coef[4][2][2][6][6][3]``
> > > > > +      - Coefficient probabilities.
> > > > > +    * - __u8
> > > > > +      - ``skip[3]``
> > > > > +      - Skip probabilities.
> > > > > +    * - __u8
> > > > > +      - ``inter_mode[7][3]``
> > > > > +      - Inter prediction mode probabilities.
> > > > > +    * - __u8
> > > > > +      - ``interp_filter[4][2]``
> > > > > +      - Interpolation filter probabilities.
> > > > > +    * - __u8
> > > > > +      - ``is_inter[4]``
> > > > > +      - Is inter-block probabilities.
> > > > > +    * - __u8
> > > > > +      - ``comp_mode[5]``
> > > > > +      - Compound prediction mode probabilities.
> > > > > +    * - __u8
> > > > > +      - ``single_ref[5][2]``
> > > > > +      - Single reference probabilities.
> > > > > +    * - __u8
> > > > > +      - ``comp_mode[5]``
> > > > > +      - Compound reference probabilities.
> > > > > +    * - __u8
> > > > > +      - ``y_mode[4][9]``
> > > > > +      - Y prediction mode probabilities.
> > > > > +    * - __u8
> > > > > +      - ``uv_mode[10][9]``
> > > > > +      - UV prediction mode probabilities.
> > > > > +    * - __u8
> > > > > +      - ``partition[16][3]``
> > > > > +      - Partition probabilities.
> > > > > +    * - __u8
> > > > > +      - ``mv.joint[3]``
> > > > > +      - Motion vector joint probabilities.
> > > > > +    * - __u8
> > > > > +      - ``mv.sign[2]``
> > > > > +      - Motion vector sign probabilities.
> > > > > +    * - __u8
> > > > > +      - ``mv.class[2][10]``
> > > > > +      - Motion vector class probabilities.
> > > > > +    * - __u8
> > > > > +      - ``mv.class0_bit[2]``
> > > > > +      - Motion vector class0 bit probabilities.
> > > > > +    * - __u8
> > > > > +      - ``mv.bits[2][10]``
> > > > > +      - Motion vector bits probabilities.
> > > > > +    * - __u8
> > > > > +      - ``mv.class0_fr[2][2][3]``
> > > > > +      - Motion vector class0 fractional bit probabilities.
> > > > > +    * - __u8
> > > > > +      - ``mv.fr[2][3]``
> > > > > +      - Motion vector fractional bit probabilities.
> > > > > +    * - __u8
> > > > > +      - ``mv.class0_hp[2]``
> > > > > +      - Motion vector class0 high precision fractional bit
> > > > > probabilities.
> > > > > +    * - __u8
> > > > > +      - ``mv.hp[2]``
> > > > > +      - Motion vector high precision fractional bit probabilitie=
s.
> > > > > +
> > > > > +``V4L2_CID_MPEG_VIDEO_VP9_FRAME_DECODE_PARAMS (struct)``
> > > > > +    Specifies the frame parameters for the associated VP9 frame =
decode
> > > > > request.
> > > > > +    This includes the necessary parameters for configuring a sta=
teless
> > > > > hardware
> > > > > +    decoding pipeline for VP9. The bitstream parameters are defi=
ned
> > > > > according
> > > > > +    to :ref:`vp9`.
> > > > > +
> > > > > +    .. note::
> > > > > +
> > > > > +       This compound control is not yet part of the public kerne=
l API
> > > > > and
> > > > > +       it is expected to change.
> > > > > +
> > > > > +.. c:type:: v4l2_ctrl_vp9_frame_decode_params
> > > > > +
> > > > > +.. cssclass:: longtable
> > > > > +
> > > > > +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> > > > > +
> > > > > +.. flat-table:: struct v4l2_ctrl_vp9_frame_decode_params
> > > > > +    :header-rows:  0
> > > > > +    :stub-columns: 0
> > > > > +    :widths:       1 1 2
> > > > > +
> > > > > +    * - __u32
> > > > > +      - ``flags``
> > > > > +      - Combination of V4L2_VP9_FRAME_FLAG_* flags. See
> > > > > +        :c:type:`v4l2_vp9_frame_flags`.
> > > > > +    * - __u16
> > > > > +      - ``compressed_header_size``
> > > > > +      - Compressed header size in bytes.
> > > > > +    * - __u16
> > > > > +      - ``uncompressed_header_size``
> > > > > +      - Uncompressed header size in bytes.
> > > > > +    * - __u8
> > > > > +      - ``profile``
> > > > > +      - VP9 profile. Can be 0, 1, 2 or 3.
> > > > > +    * - __u8
> > > > > +      - ``reset_frame_context``
> > > > > +      - Frame context that should be used/updated when decoding =
the
> > > > > frame.
> > > > > +    * - __u8
> > > > > +      - ``bit_depth``
> > > > > +      - Component depth in bits. Must be 8 for profile 0 and 1. =
Must 10
> > > > > or
> > > > > 12
> > > > > +        for profile 2 and 3.
> > > > > +    * - __u8
> > > > > +      - ``interpolation_filter``
> > > > > +      - Specifies the filter selection used for performing inter
> > > > > prediction. See
> > > > > +        :c:type:`v4l2_vp9_interpolation_filter`.
> > > > > +    * - __u8
> > > > > +      - ``tile_cols_log2``
> > > > > +      - Specifies the base 2 logarithm of the width of each tile=
 (where
> > > > > the
> > > > > +        width is measured in units of 8x8 blocks). Shall be less=
 than
> > > > > or
> > > > > equal
> > > > > +        to 6.
> > > > > +    * - __u8
> > > > > +      - ``tile_rows_log2``
> > > > > +      - Specifies the base 2 logarithm of the height of each til=
e
> > > > > (where
> > > > > the
> > > > > +        height is measured in units of 8x8 blocks)
> > > > > +    * - __u8
> > > > > +      - ``tx_mode``
> > > > > +      - Specifies the TX mode. See :c:type:`v4l2_vp9_tx_mode`.
> > > > > +    * - __u8
> > > > > +      - ``reference_mode``
> > > > > +      - Specifies the type of inter prediction to be used. See
> > > > > +        :c:type:`v4l2_vp9_reference_mode`.
> > > > > +    * - __u8
> > > > > +      - ``padding``
> > > > > +      - Needed to make this struct 64 bit aligned. Shall be fill=
ed with
> > > > > zeroes.
> > > > > +    * - __u16
> > > > > +      - ``frame_width_minus_1``
> > > > > +      - Add 1 to get the frame width expressed in pixels.
> > > > > +    * - __u16
> > > > > +      - ``frame_height_minus_1``
> > > > > +      - Add 1 to to get the frame height expressed in pixels.
> > > > > +    * - __u16
> > > > > +      - ``frame_width_minus_1``
> > > > > +      - Add 1 to to get the expected render width expressed in p=
ixels.
> > > > > This
> > > > > is
> > > > > +        not used during the decoding process but might be used b=
y HW
> > > > > scalers to
> > > > > +        prepare a frame that's ready for scanout.
> > > > > +    * - __u16
> > > > > +      - frame_height_minus_1
> > > > > +      - Add 1 to get the expected render height expressed in pix=
els.
> > > > > This
> > > > > is
> > > > > +        not used during the decoding process but might be used b=
y HW
> > > > > scalers to
> > > > > +        prepare a frame that's ready for scanout.
> > > > > +    * - __u64
> > > > > +      - ``refs[3]``
> > > > > +      - Array of reference frame timestamps.
> > > > > +    * - struct :c:type:`v4l2_vp9_loop_filter`
> > > > > +      - ``lf``
> > > > > +      - Loop filter parameters. See struct
> > > > > :c:type:`v4l2_vp9_loop_filter`.
> > > > > +    * - struct :c:type:`v4l2_vp9_quantization`
> > > > > +      - ``quant``
> > > > > +      - Quantization parameters. See :c:type:`v4l2_vp9_quantizat=
ion`.
> > > > > +    * - struct :c:type:`v4l2_vp9_segmentation`
> > > > > +      - ``seg``
> > > > > +      - Segmentation parameters. See :c:type:`v4l2_vp9_segmentat=
ion`.
> > > > > +    * - struct :c:type:`v4l2_vp9_probabilities`
> > > > > +      - ``probs``
> > > > > +      - Probabilities. See :c:type:`v4l2_vp9_probabilities`.
> > > > > +
> > > > > +.. c:type:: v4l2_vp9_frame_flags
> > > > > +
> > > > > +.. cssclass:: longtable
> > > > > +
> > > > > +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> > > > > +
> > > > > +.. flat-table:: enum v4l2_vp9_frame_flags
> > > > > +    :header-rows:  0
> > > > > +    :stub-columns: 0
> > > > > +    :widths:       1 2
> > > > > +
> > > > > +    * - ``V4L2_VP9_FRAME_FLAG_KEY_FRAME``
> > > > > +      - The frame is a key frame.
> > > > > +    * - ``V4L2_VP9_FRAME_FLAG_SHOW_FRAME``
> > > > > +      - The frame should be displayed.
> > > > > +    * - ``V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT``
> > > > > +      - The decoding should be error resilient.
> > > > > +    * - ``V4L2_VP9_FRAME_FLAG_INTRA_ONLY``
> > > > > +      - The frame does not reference other frames.
> > > > > +    * - ``V4L2_VP9_FRAME_FLAG_ALLOW_HIGH_PREC_MV``
> > > > > +      - the frame might can high precision motion vectors.
> > > > > +    * - ``V4L2_VP9_FRAME_FLAG_REFRESH_FRAME_CTX``
> > > > > +      - Frame context should be updated after decoding.
> > > > > +    * - ``V4L2_VP9_FRAME_FLAG_PARALLEL_DEC_MODE``
> > > > > +      - Parallel decoding is used.
> > > > > +    * - ``V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING``
> > > > > +      - Vertical subsampling is enabled.
> > > > > +    * - ``V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING``
> > > > > +      - Horizontal subsampling is enabled.
> > > > > +    * - ``V4L2_VP9_FRAME_FLAG_COLOR_RANGE_FULL_SWING``
> > > > > +      - The full UV range is used.
> > > > > +
> > > > > +.. c:type:: v4l2_vp9_ref_id
> > > > > +
> > > > > +.. cssclass:: longtable
> > > > > +
> > > > > +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> > > > > +
> > > > > +.. flat-table:: enum v4l2_vp9_ref_id
> > > > > +    :header-rows:  0
> > > > > +    :stub-columns: 0
> > > > > +    :widths:       1 2
> > > > > +
> > > > > +    * - ``V4L2_REF_ID_LAST``
> > > > > +      - Last reference frame.
> > > > > +    * - ``V4L2_REF_ID_GOLDEN``
> > > > > +      - Golden reference frame.
> > > > > +    * - ``V4L2_REF_ID_ALTREF``
> > > > > +      - Alternative reference frame.
> > > > > +    * - ``V4L2_REF_ID_CNT``
> > > > > +      - Number of reference frames.
> > > > > +
> > > > > +.. c:type:: v4l2_vp9_tx_mode
> > > > > +
> > > > > +.. cssclass:: longtable
> > > > > +
> > > > > +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> > > > > +
> > > > > +.. flat-table:: enum v4l2_vp9_tx_mode
> > > > > +    :header-rows:  0
> > > > > +    :stub-columns: 0
> > > > > +    :widths:       1 2
> > > > > +
> > > > > +    * - ``V4L2_VP9_TX_MODE_ONLY_4X4``
> > > > > +      - Transform size is 4x4.
> > > > > +    * - ``V4L2_VP9_TX_MODE_ALLOW_8X8``
> > > > > +      - Transform size can be up to 8x8.
> > > > > +    * - ``V4L2_VP9_TX_MODE_ALLOW_16X16``
> > > > > +      - Transform size can be up to 16x16.
> > > > > +    * - ``V4L2_VP9_TX_MODE_ALLOW_32X32``
> > > > > +      - transform size can be up to 32x32.
> > > > > +    * - ``V4L2_VP9_TX_MODE_SELECT``
> > > > > +      - Bitstream contains transform size for each block.
> > > > > +
> > > > > +.. c:type:: v4l2_vp9_reference_mode
> > > > > +
> > > > > +.. cssclass:: longtable
> > > > > +
> > > > > +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> > > > > +
> > > > > +.. flat-table:: enum v4l2_vp9_reference_mode
> > > > > +    :header-rows:  0
> > > > > +    :stub-columns: 0
> > > > > +    :widths:       1 2
> > > > > +
> > > > > +    * - ``V4L2_VP9_REF_MODE_SINGLE``
> > > > > +      - Indicates that all the inter blocks use only a single re=
ference
> > > > > frame
> > > > > +        to generate motion compensated prediction.
> > > > > +    * - ``V4L2_VP9_REF_MODE_COMPOUND``
> > > > > +      - Requires all the inter blocks to use compound mode. Sing=
le
> > > > > reference
> > > > > +        frame prediction is not allowed.
> > > > > +    * - ``V4L2_VP9_REF_MODE_SELECT``
> > > > > +      - Allows each individual inter block to select between sin=
gle and
> > > > > +        compound prediction modes.
> > > > > +
> > > > > +.. c:type:: v4l2_vp9_interpolation_filter
> > > > > +
> > > > > +.. cssclass:: longtable
> > > > > +
> > > > > +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> > > > > +
> > > > > +.. flat-table:: enum v4l2_vp9_interpolation_filter
> > > > > +    :header-rows:  0
> > > > > +    :stub-columns: 0
> > > > > +    :widths:       1 2
> > > > > +
> > > > > +    * - ``V4L2_VP9_INTERP_FILTER_8TAP``
> > > > > +      - Height tap filter.
> > > > > +    * - ``V4L2_VP9_INTERP_FILTER_8TAP_SMOOTH``
> > > > > +      - Height tap smooth filter.
> > > > > +    * - ``V4L2_VP9_INTERP_FILTER_8TAP_SHARP``
> > > > > +      - Height tap sharp filter.
> > > > > +    * - ``V4L2_VP9_INTERP_FILTER_BILINEAR``
> > > > > +      - Bilinear filter.
> > > > > +    * - ``V4L2_VP9_INTERP_FILTER_SWITCHABLE``
> > > > > +      - Filter selection is signaled at the block level.
> > > > > +
> > > > > +.. c:type:: v4l2_vp9_reset_frame_context
> > > > > +
> > > > > +.. cssclass:: longtable
> > > > > +
> > > > > +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> > > > > +
> > > > > +.. flat-table:: enum v4l2_vp9_reset_frame_context
> > > > > +    :header-rows:  0
> > > > > +    :stub-columns: 0
> > > > > +    :widths:       1 2
> > > > > +
> > > > > +    * - ``V4L2_VP9_RESET_FRAME_CTX_NONE``
> > > > > +      - Do not reset any frame context.
> > > > > +    * - ``V4L2_VP9_RESET_FRAME_CTX_SPEC``
> > > > > +      - Reset the frame context pointed by
> > > > > +        :c:type:`v4l2_ctrl_vp9_frame_decode_params`.frame_contex=
t_idx.
> > > > > +    * - ``V4L2_VP9_RESET_FRAME_CTX_ALL``
> > > > > +      - Reset all frame contexts.
> > > > > +
> > > > > +.. c:type:: v4l2_vp9_intra_prediction_mode
> > > > > +
> > > > > +.. cssclass:: longtable
> > > > > +
> > > > > +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> > > > > +
> > > > > +.. flat-table:: enum v4l2_vp9_intra_prediction_mode
> > > > > +    :header-rows:  0
> > > > > +    :stub-columns: 0
> > > > > +    :widths:       1 2
> > > > > +
> > > > > +    * - ``V4L2_VP9_INTRA_PRED_DC``
> > > > > +      - DC intra prediction.
> > > > > +    * - ``V4L2_VP9_INTRA_PRED_MODE_V``
> > > > > +      - Vertical intra prediction.
> > > > > +    * - ``V4L2_VP9_INTRA_PRED_MODE_H``
> > > > > +      - Horizontal intra prediction.
> > > > > +    * - ``V4L2_VP9_INTRA_PRED_MODE_D45``
> > > > > +      - D45 intra prediction.
> > > > > +    * - ``V4L2_VP9_INTRA_PRED_MODE_D135``
> > > > > +      - D135 intra prediction.
> > > > > +    * - ``V4L2_VP9_INTRA_PRED_MODE_D117``
> > > > > +      - D117 intra prediction.
> > > > > +    * - ``V4L2_VP9_INTRA_PRED_MODE_D153``
> > > > > +      - D153 intra prediction.
> > > > > +    * - ``V4L2_VP9_INTRA_PRED_MODE_D207``
> > > > > +      - D207 intra prediction.
> > > > > +    * - ``V4L2_VP9_INTRA_PRED_MODE_D63``
> > > > > +      - D63 intra prediction.
> > > > > +    * - ``V4L2_VP9_INTRA_PRED_MODE_TM``
> > > > > +      - True motion intra prediction.
> > > > > +
> > > > > +.. c:type:: v4l2_vp9_segmentation
> > > > > +
> > > > > +.. cssclass:: longtable
> > > > > +
> > > > > +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> > > > > +
> > > > > +.. flat-table:: struct v4l2_vp9_segmentation
> > > > > +    :header-rows:  0
> > > > > +    :stub-columns: 0
> > > > > +    :widths:       1 1 2
> > > > > +
> > > > > +    * - __u8
> > > > > +      - ``flags``
> > > > > +      - Combination of V4L2_VP9_SEGMENTATION_FLAG_* flags. See
> > > > > +        :c:type:`v4l2_vp9_segmentation_flags`.
> > > > > +    * - __u8
> > > > > +      - ``tree_probs[7]``
> > > > > +      - Specifies the probability values to be used when decodin=
g a
> > > > > Segment-ID.
> > > > > +        See '5.15. Segmentation map' section of :ref:`vp9` for m=
ore
> > > > > details.
> > > > > +    * - __u8
> > > > > +      - ``pred_prob[3]``
> > > > > +      - Specifies the probability values to be used when decodin=
g a
> > > > > +        Predicted-Segment-ID. See '6.4.14. Get segment id syntax=
'
> > > > > +        section of :ref:`vp9` for more details.
> > > > > +    * - __u8
> > > > > +      - ``padding[5]``
> > > > > +      - Used to align this struct on 64 bit. Shall be filled wit=
h
> > > > > zeroes.
> > > > > +    * - __u8
> > > > > +      - ``feature_enabled[8]``
> > > > > +      - Bitmask defining which features are enabled in each segm=
ent.
> > > > > +    * - __u8
> > > > > +      - ``feature_data[8][4]``
> > > > > +      - Data attached to each feature. Data entry is only valid =
if the
> > > > > feature
> > > > > +        is enabled.
> > > > > +
> > > > > +.. c:type:: v4l2_vp9_segment_feature
> > > > > +
> > > > > +.. cssclass:: longtable
> > > > > +
> > > > > +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> > > > > +
> > > > > +.. flat-table:: enum v4l2_vp9_segment_feature
> > > > > +    :header-rows:  0
> > > > > +    :stub-columns: 0
> > > > > +    :widths:       1 2
> > > > > +
> > > > > +    * - ``V4L2_VP9_SEGMENT_FEATURE_QP_DELTA``
> > > > > +      - QP delta segment feature.
> > > > > +    * - ``V4L2_VP9_SEGMENT_FEATURE_LF``
> > > > > +      - Loop filter segment feature.
> > > > > +    * - ``V4L2_VP9_SEGMENT_FEATURE_REF_FRAME``
> > > > > +      - Reference frame segment feature.
> > > > > +    * - ``V4L2_VP9_SEGMENT_FEATURE_SKIP``
> > > > > +      - Skip segment feature.
> > > > > +    * - ``V4L2_VP9_SEGMENT_FEATURE_CNT``
> > > > > +      - Number of segment features.
> > > > > +
> > > > > +.. c:type:: v4l2_vp9_segmentation_flags
> > > > > +
> > > > > +.. cssclass:: longtable
> > > > > +
> > > > > +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> > > > > +
> > > > > +.. flat-table:: enum v4l2_vp9_segmentation_flags
> > > > > +    :header-rows:  0
> > > > > +    :stub-columns: 0
> > > > > +    :widths:       1 2
> > > > > +
> > > > > +    * - ``V4L2_VP9_SEGMENTATION_FLAG_ENABLED``
> > > > > +      - Indicates that this frame makes use of the segmentation =
tool.
> > > > > +    * - ``V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP``
> > > > > +      - Indicates that the segmentation map should be updated du=
ring
> > > > > the
> > > > > +        decoding of this frame.
> > > > > +    * - ``V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE``
> > > > > +      - Indicates that the updates to the segmentation map are c=
oded
> > > > > +        relative to the existing segmentation map.
> > > > > +    * - ``V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA``
> > > > > +      - Indicates that new parameters are about to be specified =
for
> > > > > each
> > > > > +        segment.
> > > > > +    * - ``V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE``
> > > > > +      - Indicates that the segmentation parameters represent the=
 actual
> > > > > values
> > > > > +        to be used.
> > > > > +
> > > > > +.. c:type:: v4l2_vp9_quantization
> > > > > +
> > > > > +.. cssclass:: longtable
> > > > > +
> > > > > +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> > > > > +
> > > > > +.. flat-table:: struct v4l2_vp9_quantization
> > > > > +    :header-rows:  0
> > > > > +    :stub-columns: 0
> > > > > +    :widths:       1 1 2
> > > > > +
> > > > > +    * - __u8
> > > > > +      - ``base_q_idx``
> > > > > +      - Indicates the base frame qindex.
> > > > > +    * - __s8
> > > > > +      - ``delta_q_y_dc``
> > > > > +      - Indicates the Y DC quantizer relative to base_q_idx.
> > > > > +    * - __s8
> > > > > +      - ``delta_q_uv_dc``
> > > > > +      - Indicates the UV DC quantizer relative to base_q_idx.
> > > > > +    * - __s8
> > > > > +      - ``delta_q_uv_ac``
> > > > > +      - Indicates the UV AC quantizer relative to base_q_idx.
> > > > > +    * - __u8
> > > > > +      - ``padding[4]``
> > > > > +      - Padding bytes used to align this struct on 64 bit. Must =
be set
> > > > > to
> > > > > 0.
> > > > > +
> > > > > +.. c:type:: v4l2_vp9_loop_filter
> > > > > +
> > > > > +.. cssclass:: longtable
> > > > > +
> > > > > +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> > > > > +
> > > > > +.. flat-table:: struct v4l2_vp9_loop_filter
> > > > > +    :header-rows:  0
> > > > > +    :stub-columns: 0
> > > > > +    :widths:       1 1 2
> > > > > +
> > > > > +    * - __u8
> > > > > +      - ``flags``
> > > > > +      - Combination of V4L2_VP9_LOOP_FILTER_FLAG_* flags.
> > > > > +        See :c:type:`v4l2_vp9_loop_filter_flags`.
> > > > > +    * - __u8
> > > > > +      - ``level``
> > > > > +      - Indicates the loop filter strength.
> > > > > +    * - __u8
> > > > > +      - ``sharpness``
> > > > > +      - Indicates the sharpness level.
> > > > > +    * - __s8
> > > > > +      - ``ref_deltas[4]``
> > > > > +      - Contains the adjustment needed for the filter level base=
d on
> > > > > the
> > > > > chosen
> > > > > +        reference frame.
> > > > > +    * - __s8
> > > > > +      - ``mode_deltas[2]``
> > > > > +      - Contains the adjustment needed for the filter level base=
d on
> > > > > the
> > > > > chosen
> > > > > +        mode
> > > > > +    * - __u8
> > > > > +      - ``level_lookup[8][4][2]``
> > > > > +      - Level lookup table.
> > >
> > > We think it might be a poor choice to ask for computed values. Accord=
ing to
> > > "8.8.1 Loop filter frame init process" this is computed from
> > > loop_filter_level,
> > > loop_filter_ref_deltas[], V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPD=
ATE,
> > > feature_data[], ref_deltas[] and mode_deltas[]. We believe it is like=
ly a
> > > waste
> > > to pass this information assuming some HW could do that process.
> > >
> > > This is to be discussed. None of the other statelss APIs seems to req=
uire
> > > this
> > > value to be computed by userspace.
> >
> > Not particularly opinionated, but it would be a waste if the driver
> > needs to reverse that computation to pass it to the hardware. If the
> > lookup table is not difficult to compute, we can maybe do this using a
> > helper function for drivers that need it?
>
> Correct, the spec is quite clear, and gives the exact algorithm to produc=
e that
> table. If needs, we can do like we did fro H264 intermediate reference li=
sts and
> add a shared helper.
>
> >
> > >
> > > > > +
> > > > > +
> > > > > +.. c:type:: v4l2_vp9_loop_filter_flags
> > > > > +
> > > > > +.. cssclass:: longtable
> > > > > +
> > > > > +.. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
> > > > > +
> > > > > +.. flat-table:: enum v4l2_vp9_loop_filter_flags
> > > > > +    :header-rows:  0
> > > > > +    :stub-columns: 0
> > > > > +    :widths:       1 2
> > > > > +
> > > > > +    * - ``V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED``
> > > > > +      - When set, the filter level depends on the mode and refer=
ence
> > > > > frame
> > > > > used
> > > > > +        to predict a block.
> > > > > +    * - ``V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE``
> > > > > +      - When set, the bitstream contains additional syntax eleme=
nts
> > > > > that
> > > > > +        specify which mode and reference frame deltas are to be
> > > > > updated.
> > > > > +
> > > > >  .. raw:: latex
> > > > >
> > > > >      \normalsize
> > > > > diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media=
/v4l2-
> > > > > core/v4l2-ctrls.c
> > > > > index 1c617b42a944..115beadaf02d 100644
> > > > > --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> > > > > +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> > > > > @@ -930,6 +930,11 @@ const char *v4l2_ctrl_get_name(u32 id)
> > > > >         case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:                   r=
eturn
> > > > > "VP8
> > > > > Profile";
> > > > >         case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:                   r=
eturn
> > > > > "VP9
> > > > > Profile";
> > > > >         case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER:              r=
eturn
> > > > > "VP8
> > > > > Frame Header";
> > > > > +       case V4L2_CID_MPEG_VIDEO_VP9_FRAME_DECODE_PARAMS:       r=
eturn
> > > > > "VP9
> > > > > Frame Decode Parameters";
> > > > > +       case V4L2_CID_MPEG_VIDEO_VP9_FRAME_CONTEXT(0):          r=
eturn
> > > > > "VP9
> > > > > Frame Context 0";
> > > > > +       case V4L2_CID_MPEG_VIDEO_VP9_FRAME_CONTEXT(1):          r=
eturn
> > > > > "VP9
> > > > > Frame Context 1";
> > > > > +       case V4L2_CID_MPEG_VIDEO_VP9_FRAME_CONTEXT(2):          r=
eturn
> > > > > "VP9
> > > > > Frame Context 2";
> > > > > +       case V4L2_CID_MPEG_VIDEO_VP9_FRAME_CONTEXT(3):          r=
eturn
> > > > > "VP9
> > > > > Frame Context 3";
> > > > >
> > > > >         /* HEVC controls */
> > > > >         case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP:               r=
eturn
> > > > > "HEVC
> > > > > I-Frame QP Value";
> > > > > @@ -1403,6 +1408,15 @@ void v4l2_ctrl_fill(u32 id, const char **n=
ame,
> > > > > enum
> > > > > v4l2_ctrl_type *type,
> > > > >         case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER:
> > > > >                 *type =3D V4L2_CTRL_TYPE_VP8_FRAME_HEADER;
> > > > >                 break;
> > > > > +       case V4L2_CID_MPEG_VIDEO_VP9_FRAME_DECODE_PARAMS:
> > > > > +               *type =3D V4L2_CTRL_TYPE_VP9_FRAME_DECODE_PARAMS;
> > > > > +               break;
> > > > > +       case V4L2_CID_MPEG_VIDEO_VP9_FRAME_CONTEXT(0):
> > > > > +       case V4L2_CID_MPEG_VIDEO_VP9_FRAME_CONTEXT(1):
> > > > > +       case V4L2_CID_MPEG_VIDEO_VP9_FRAME_CONTEXT(2):
> > > > > +       case V4L2_CID_MPEG_VIDEO_VP9_FRAME_CONTEXT(3):
> > > > > +               *type =3D V4L2_CTRL_TYPE_VP9_FRAME_CONTEXT;
> > > > > +               break;
> > > > >         case V4L2_CID_MPEG_VIDEO_HEVC_SPS:
> > > > >                 *type =3D V4L2_CTRL_TYPE_HEVC_SPS;
> > > > >                 break;
> > > > > @@ -1703,6 +1717,219 @@ static void std_log(const struct v4l2_ctr=
l
> > > > > *ctrl)
> > > > >         0;                                                      \
> > > > >  })
> > > > >
> > > > > +static int
> > > > > +validate_vp9_lf_params(struct v4l2_vp9_loop_filter *lf)
> > > > > +{
> > > > > +       unsigned int i, j, k;
> > > > > +
> > > > > +       if (lf->flags &
> > > > > +           ~(V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED |
> > > > > +             V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE))
> > > > > +               return -EINVAL;
> > > > > +
> > > > > +       /*
> > > > > +        * V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED implies
> > > > > +        * V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE.
> > > > > +        */
> > > > > +       if (lf->flags & V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE &&
> > > > > +           !(lf->flags & V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED=
))
> > > > > +               return -EINVAL;
> > > > > +
> > > > > +       /* That all values are in the accepted range. */
> > > > > +       if (lf->level > GENMASK(5, 0))
> > > > > +               return -EINVAL;
> > > > > +
> > > > > +       if (lf->sharpness > GENMASK(2, 0))
> > > > > +               return -EINVAL;
> > > > > +
> > > > > +       for (i =3D 0; i < ARRAY_SIZE(lf->ref_deltas); i++) {
> > > > > +               if (lf->ref_deltas[i] < -63 || lf->ref_deltas[i] =
> 63)
> > > > > +                       return -EINVAL;
> > > > > +       }
> > > > > +
> > > > > +       for (i =3D 0; i < ARRAY_SIZE(lf->mode_deltas); i++) {
> > > > > +               if (lf->mode_deltas[i] < -63 || lf->mode_deltas[i=
] > 63)
> > > > > +                       return -EINVAL;
> > > > > +       }
> > > > > +
> > > > > +       for (i =3D 0; i < ARRAY_SIZE(lf->level_lookup); i++) {
> > > > > +               for (j =3D 0; j < ARRAY_SIZE(lf->level_lookup[0])=
; j++) {
> > > > > +                       for (k =3D 0; k < ARRAY_SIZE(lf-
> > > > > >level_lookup[0][0]);
> > > > > k++) {
> > > > > +                               if (lf->level_lookup[i][j][k] > 6=
3)
> > > > > +                                       return -EINVAL;
> > > > > +                       }
> > > > > +               }
> > > > > +       }
> > > > > +
> > > > > +       return 0;
> > > > > +}
> > > > > +
> > > > > +static int
> > > > > +validate_vp9_quant_params(struct v4l2_vp9_quantization *quant)
> > > > > +{
> > > > > +       if (quant->delta_q_y_dc < -15 || quant->delta_q_y_dc > 15=
 ||
> > > > > +           quant->delta_q_uv_dc < -15 || quant->delta_q_uv_dc > =
15 ||
> > > > > +           quant->delta_q_uv_ac < -15 || quant->delta_q_uv_ac > =
15)
> > > > > +               return -EINVAL;
> > > > > +
> > > > > +       memset(quant->padding, 0, sizeof(quant->padding));
> > > > > +       return 0;
> > > > > +}
> > > > > +
> > > > > +static int
> > > > > +validate_vp9_seg_params(struct v4l2_vp9_segmentation *seg)
> > > > > +{
> > > > > +       unsigned int i, j;
> > > > > +
> > > > > +       if (seg->flags &
> > > > > +           ~(V4L2_VP9_SEGMENTATION_FLAG_ENABLED |
> > > > > +             V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP |
> > > > > +             V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE |
> > > > > +             V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA |
> > > > > +             V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE))
> > > > > +               return -EINVAL;
> > > > > +
> > > > > +       /*
> > > > > +        * V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP and
> > > > > +        * V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA imply
> > > > > +        * V4L2_VP9_SEGMENTATION_FLAG_ENABLED.
> > > > > +        */
> > > > > +       if ((seg->flags &
> > > > > +            (V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP |
> > > > > +             V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA)) &&
> > > > > +           !(seg->flags & V4L2_VP9_SEGMENTATION_FLAG_ENABLED))
> > > > > +               return -EINVAL;
> > > > > +
> > > > > +       /*
> > > > > +        * V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE implies
> > > > > +        * V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP.
> > > > > +        */
> > > > > +       if (seg->flags & V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDA=
TE &&
> > > > > +           !(seg->flags & V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP)=
)
> > > > > +               return -EINVAL;
> > > > > +
> > > > > +       /*
> > > > > +        * V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE implies
> > > > > +        * V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA.
> > > > > +        */
> > > > > +       if (seg->flags & V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_=
UPDATE
> > > > > &&
> > > > > +           !(seg->flags & V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA=
))
> > > > > +               return -EINVAL;
> > > > > +
> > > > > +       for (i =3D 0; i < ARRAY_SIZE(seg->feature_enabled); i++) =
{
> > > > > +               if (seg->feature_enabled[i] &
> > > > > +                   ~(V4L2_VP9_SEGMENT_FEATURE_QP_DELTA |
> > > > > +                     V4L2_VP9_SEGMENT_FEATURE_LF |
> > > > > +                     V4L2_VP9_SEGMENT_FEATURE_REF_FRAME |
> > > > > +                     V4L2_VP9_SEGMENT_FEATURE_SKIP))
> > > > > +                       return -EINVAL;
> > > > > +       }
> > > > > +
> > > > > +       for (i =3D 0; i < ARRAY_SIZE(seg->feature_data); i++) {
> > > > > +               const int range[] =3D {255, 63, 3, 0};
> > > > > +
> > > > > +               for (j =3D 0; j < ARRAY_SIZE(seg->feature_data[j]=
); j++) {
> > > > > +                       if (seg->feature_data[i][j] < -range[j] |=
|
> > > > > +                           seg->feature_data[i][j] > range[j])
> > > > > +                               return -EINVAL;
> > > > > +               }
> > > > > +       }
> > > > > +
> > > > > +       memset(seg->padding, 0, sizeof(seg->padding));
> > > > > +       return 0;
> > > > > +}
> > > > > +
> > > > > +static int
> > > > > +validate_vp9_frame_decode_params(struct
> > > > > v4l2_ctrl_vp9_frame_decode_params
> > > > > *dec_params)
> > > > > +{
> > > > > +       int ret;
> > > > > +
> > > > > +       /* Make sure we're not passed invalid flags. */
> > > > > +       if (dec_params->flags &
> > > > > +           ~(V4L2_VP9_FRAME_FLAG_KEY_FRAME |
> > > > > +             V4L2_VP9_FRAME_FLAG_SHOW_FRAME |
> > > > > +             V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT |
> > > > > +             V4L2_VP9_FRAME_FLAG_INTRA_ONLY |
> > > > > +             V4L2_VP9_FRAME_FLAG_ALLOW_HIGH_PREC_MV |
> > > > > +             V4L2_VP9_FRAME_FLAG_REFRESH_FRAME_CTX |
> > > > > +             V4L2_VP9_FRAME_FLAG_PARALLEL_DEC_MODE |
> > > > > +             V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING |
> > > > > +             V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING |
> > > > > +             V4L2_VP9_FRAME_FLAG_COLOR_RANGE_FULL_SWING))
> > > > > +               return -EINVAL;
> > > > > +
> > > > > +       /*
> > > > > +        * The refresh context and error resilient flags are mutu=
ally
> > > > > exclusive.
> > > > > +        * Same goes for parallel decoding and error resilient mo=
des.
> > > > > +        */
> > > > > +       if (dec_params->flags & V4L2_VP9_FRAME_FLAG_ERROR_RESILIE=
NT &&
> > > > > +           dec_params->flags &
> > > > > +           (V4L2_VP9_FRAME_FLAG_REFRESH_FRAME_CTX |
> > > > > +            V4L2_VP9_FRAME_FLAG_PARALLEL_DEC_MODE))
> > > > > +               return -EINVAL;
> > > > > +
> > > > > +       if (dec_params->profile > V4L2_VP9_PROFILE_MAX)
> > > > > +               return -EINVAL;
> > > > > +
> > > > > +       if (dec_params->reset_frame_context >
> > > > > V4L2_VP9_RESET_FRAME_CTX_ALL)
> > > > > +               return -EINVAL;
> > > > > +
> > > > > +       if (dec_params->frame_context_idx >=3D V4L2_VP9_NUM_FRAME=
_CTX)
> > > > > +               return -EINVAL;
> > > > > +
> > > > > +       /*
> > > > > +        * Profiles 0 and 1 only support 8-bit depth, profiles 2 =
and 3
> > > > > only
> > > > > 10
> > > > > +        * and 12 bit depths.
> > > > > +        */
> > > > > +       if ((dec_params->profile < 2 && dec_params->bit_depth !=
=3D 8) ||
> > > > > +           (dec_params->profile >=3D 2 &&
> > > > > +            (dec_params->bit_depth !=3D 10 && dec_params->bit_de=
pth !=3D
> > > > > 12)))
> > > > > +               return -EINVAL;
> > > > > +
> > > > > +       /* Profile 0 and 2 only accept YUV 4:2:0. */
> > > > > +       if ((dec_params->profile =3D=3D 0 || dec_params->profile =
=3D=3D 2) &&
> > > > > +           (!(dec_params->flags & V4L2_VP9_FRAME_FLAG_X_SUBSAMPL=
ING) ||
> > > > > +            !(dec_params->flags & V4L2_VP9_FRAME_FLAG_Y_SUBSAMPL=
ING)))
> > > > > +               return -EINVAL;
> > > > > +
> > > > > +       /* Profile 1 and 3 only accept YUV 4:2:2, 4:4:0 and 4:4:4=
. */
> > > > > +       if ((dec_params->profile =3D=3D 1 || dec_params->profile =
=3D=3D 3) &&
> > > > > +           ((dec_params->flags & V4L2_VP9_FRAME_FLAG_X_SUBSAMPLI=
NG) &&
> > > > > +            (dec_params->flags & V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLI=
NG)))
> > > > > +               return -EINVAL;
> > > > > +
> > > > > +       if (dec_params->interpolation_filter >
> > > > > V4L2_VP9_INTERP_FILTER_SWITCHABLE)
> > > > > +               return -EINVAL;
> > > > > +
> > > > > +       /*
> > > > > +        * According to the spec, tile_cols_log2 shall be less th=
an or
> > > > > equal
> > > > > +        * to 6.
> > > > > +        */
> > > > > +       if (dec_params->tile_cols_log2 > 6)
> > > > > +               return -EINVAL;
> > > > > +
> > > > > +       if (dec_params->tx_mode > V4L2_VP9_TX_MODE_SELECT)
> > > > > +               return -EINVAL;
> > > > > +
> > > > > +       if (dec_params->reference_mode > V4L2_VP9_REF_MODE_SELECT=
)
> > > > > +               return -EINVAL;
> > > > > +
> > > > > +       ret =3D validate_vp9_lf_params(&dec_params->lf);
> > > > > +       if (ret)
> > > > > +               return ret;
> > > > > +
> > > > > +       ret =3D validate_vp9_quant_params(&dec_params->quant);
> > > > > +       if (ret)
> > > > > +               return ret;
> > > > > +
> > > > > +       ret =3D validate_vp9_seg_params(&dec_params->seg);
> > > > > +       if (ret)
> > > > > +               return ret;
> > > > > +
> > > > > +       memset(dec_params->padding, 0, sizeof(dec_params->padding=
));
> > > > > +       return 0;
> > > > > +}
> > > > > +
> > > > >  /* Validate a new control */
> > > > >
> > > > >  #define zero_padding(s) \
> > > > > @@ -1799,6 +2026,12 @@ static int std_validate_compound(const str=
uct
> > > > > v4l2_ctrl *ctrl, u32 idx,
> > > > >                 zero_padding(p_vp8_frame_header->coder_state);
> > > > >                 break;
> > > > >
> > > > > +       case V4L2_CTRL_TYPE_VP9_FRAME_DECODE_PARAMS:
> > > > > +               return validate_vp9_frame_decode_params(p);
> > > > > +
> > > > > +       case V4L2_CTRL_TYPE_VP9_FRAME_CONTEXT:
> > > > > +               break;
> > > > > +
> > > > >         case V4L2_CTRL_TYPE_HEVC_SPS:
> > > > >                 p_hevc_sps =3D p;
> > > > >
> > > > > @@ -2542,6 +2775,12 @@ static struct v4l2_ctrl *v4l2_ctrl_new(str=
uct
> > > > > v4l2_ctrl_handler *hdl,
> > > > >         case V4L2_CTRL_TYPE_VP8_FRAME_HEADER:
> > > > >                 elem_size =3D sizeof(struct v4l2_ctrl_vp8_frame_h=
eader);
> > > > >                 break;
> > > > > +       case V4L2_CTRL_TYPE_VP9_FRAME_CONTEXT:
> > > > > +               elem_size =3D sizeof(struct v4l2_ctrl_vp9_frame_c=
tx);
> > > > > +               break;
> > > > > +       case V4L2_CTRL_TYPE_VP9_FRAME_DECODE_PARAMS:
> > > > > +               elem_size =3D sizeof(struct
> > > > > v4l2_ctrl_vp9_frame_decode_params);
> > > > > +               break;
> > > > >         case V4L2_CTRL_TYPE_HEVC_SPS:
> > > > >                 elem_size =3D sizeof(struct v4l2_ctrl_hevc_sps);
> > > > >                 break;
> > > > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media=
/v4l2-
> > > > > core/v4l2-ioctl.c
> > > > > index 2322f08a98be..4fe77ad917c8 100644
> > > > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > > @@ -1423,6 +1423,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fm=
tdesc
> > > > > *fmt)
> > > > >                 case V4L2_PIX_FMT_VP8:          descr =3D "VP8"; =
break;
> > > > >                 case V4L2_PIX_FMT_VP8_FRAME:    descr =3D "VP8 Fr=
ame";
> > > > > break;
> > > > >                 case V4L2_PIX_FMT_VP9:          descr =3D "VP9"; =
break;
> > > > > +               case V4L2_PIX_FMT_VP9_FRAME:    descr =3D "VP9 Fr=
ame";
> > > > > break;
> > > > >                 case V4L2_PIX_FMT_HEVC:         descr =3D "HEVC";=
 break;
> > > > > /*
> > > > > aka H.265 */
> > > > >                 case V4L2_PIX_FMT_HEVC_SLICE:   descr =3D "HEVC P=
arsed
> > > > > Slice
> > > > > Data"; break;
> > > > >                 case V4L2_PIX_FMT_FWHT:         descr =3D "FWHT";=
 break;
> > > > > /*
> > > > > used in vicodec */
> > > > > diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrl=
s.h
> > > > > index 757a713bad41..2de8290f9f11 100644
> > > > > --- a/include/media/v4l2-ctrls.h
> > > > > +++ b/include/media/v4l2-ctrls.h
> > > > > @@ -21,6 +21,7 @@
> > > > >  #include <media/fwht-ctrls.h>
> > > > >  #include <media/h264-ctrls.h>
> > > > >  #include <media/vp8-ctrls.h>
> > > > > +#include <media/vp9-ctrls.h>
> > > > >  #include <media/hevc-ctrls.h>
> > > > >
> > > > >  /* forward references */
> > > > > diff --git a/include/media/vp9-ctrls.h b/include/media/vp9-ctrls.=
h
> > > > > new file mode 100644
> > > > > index 000000000000..0cdea8a18b72
> > > > > --- /dev/null
> > > > > +++ b/include/media/vp9-ctrls.h
> > > > > @@ -0,0 +1,485 @@
> > > > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > > > +/*
> > > > > + * These are the VP9 state controls for use with stateless VP9
> > > > > + * codec drivers.
> > > > > + *
> > > > > + * It turns out that these structs are not stable yet and will u=
ndergo
> > > > > + * more changes. So keep them private until they are stable and =
ready
> > > > > to
> > > > > + * become part of the official public API.
> > > > > + */
> > > > > +
> > > > > +#ifndef _VP9_CTRLS_H_
> > > > > +#define _VP9_CTRLS_H_
> > > > > +
> > > > > +#include <linux/types.h>
> > > > > +
> > > > > +#define V4L2_PIX_FMT_VP9_FRAME v4l2_fourcc('V', 'P', '9', 'F')
> > > > > +
> > > > > +#define V4L2_CID_MPEG_VIDEO_VP9_FRAME_CONTEXT(i)
> > > > > (V4L2_CID_MPEG_BASE
> > > > > + 4000 + (i))
> > > > > +#define V4L2_CID_MPEG_VIDEO_VP9_FRAME_DECODE_PARAMS
> > > > > (V4L2_CID_MPEG_BASE
> > > > > + 4004)
> > > > > +#define V4L2_CTRL_TYPE_VP9_FRAME_CONTEXT               0x400
> > > > > +#define V4L2_CTRL_TYPE_VP9_FRAME_DECODE_PARAMS         0x404
> > > > > +
> > > > > +/**
> > > > > + * enum v4l2_vp9_loop_filter_flags - VP9 loop filter flags
> > > > > + *
> > > > > + * @V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED: the filter level de=
pends
> > > > > on
> > > > > + *                                          the mode and referen=
ce
> > > > > frame
> > > > > used
> > > > > + *                                          to predict a block
> > > > > + * @V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE: the bitstream contai=
ns
> > > > > additional
> > > > > + *                                         syntax elements that =
specify
> > > > > which
> > > > > + *                                         mode and reference fr=
ame
> > > > > deltas
> > > > > + *                                         are to be updated
> > > > > + *
> > > > > + * Those are the flags you should pass to &v4l2_vp9_loop_filter.=
flags.
> > > > > See
> > > > > + * section '7.2.8 Loop filter semantics' of the VP9 specificatio=
n for
> > > > > more
> > > > > + * details.
> > > > > + */
> > > > > +enum v4l2_vp9_loop_filter_flags {
> > > > > +       V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED =3D 1 << 0,
> > > > > +       V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE =3D 1 << 1,
> > > > > +};
> > > > > +
> > > > > +/**
> > > > > + * struct v4l2_vp9_loop_filter - VP9 loop filter parameters
> > > > > + *
> > > > > + * @flags: combination of V4L2_VP9_LOOP_FILTER_FLAG_* flags
> > > > > + * @level: indicates the loop filter strength
> > > > > + * @sharpness: indicates the sharpness level
> > > > > + * @ref_deltas: contains the adjustment needed for the filter le=
vel
> > > > > based
> > > > > on
> > > > > + *             the chosen reference frame
> > > > > + * @mode_deltas: contains the adjustment needed for the filter l=
evel
> > > > > based
> > > > > on
> > > > > + *              the chosen mode
> > > > > + * @level_lookup: level lookup table
> > > > > + *
> > > > > + * This structure contains all loop filter related parameters. S=
ee
> > > > > sections
> > > > > + * '7.2.8 Loop filter semantics' and '8.8.1 Loop filter frame in=
it
> > > > > process'
> > > > > + * of the VP9 specification for more details.
> > > > > + */
> > > > > +struct v4l2_vp9_loop_filter {
> > > > > +       __u8 flags;
> > > > > +       __u8 level;
> > > > > +       __u8 sharpness;
> > > > > +       __s8 ref_deltas[4];
> > > > > +       __s8 mode_deltas[2];
> > > > > +       __u8 level_lookup[8][4][2];
> > > > > +};
> > > >
> > > > This struct is 73 bytes, doesn't it need padding?
> > > >
> > > > > +
> > > > > +/**
> > > > > + * struct v4l2_vp9_quantization - VP9 quantization parameters
> > > > > + *
> > > > > + * @base_q_idx: indicates the base frame qindex
> > > > > + * @delta_q_y_dc: indicates the Y DC quantizer relative to base_=
q_idx
> > > > > + * @delta_q_uv_dc: indicates the UV DC quantizer relative to bas=
e_q_idx
> > > > > + * @delta_q_uv_ac indicates the UV AC quantizer relative to base=
_q_idx
> > > > > + * @padding: padding bytes to align things on 64 bits. Must be s=
et to 0
> > > > > + *
> > > > > + * Encodes the quantization parameters. See section '7.2.9 Quant=
ization
> > > > > params
> > > > > + * syntax' of the VP9 specification for more details.
> > > > > + */
> > > > > +struct v4l2_vp9_quantization {
> > > > > +       __u8 base_q_idx;
> > > > > +       __s8 delta_q_y_dc;
> > > > > +       __s8 delta_q_uv_dc;
> > > > > +       __s8 delta_q_uv_ac;
> > > > > +       __u8 padding[4];
> > > > > +};
> > > > > +
> > > > > +/**
> > > > > + * enum v4l2_vp9_segmentation_flags - VP9 segmentation flags
> > > > > + *
> > > > > + * @V4L2_VP9_SEGMENTATION_FLAG_ENABLED: indicates that this fram=
e makes
> > > > > use
> > > > > of
> > > > > + *                                     the segmentation tool
> > > > > + * @V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP: indicates that the
> > > > > segmentation
> > > > > map
> > > > > + *                                        should be updated duri=
ng the
> > > > > + *                                        decoding of this frame
> > > > > + * @V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE: indicates that t=
he
> > > > > updates
> > > > > to
> > > > > + *                                             the segmentation =
map are
> > > > > coded
> > > > > + *                                             relative to the e=
xisting
> > > > > + *                                             segmentation map
> > > > > + * @V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA: indicates that new
> > > > > parameters
> > > > > are
> > > > > + *                                         about to be specified=
 for
> > > > > each
> > > > > + *                                         segment
> > > > > + * @V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE: indicates th=
at the
> > > > > + *                                                 segmentation
> > > > > parameters
> > > > > + *                                                 represent the=
 actual
> > > > > values
> > > > > + *                                                 to be used
> > > > > + *
> > > > > + * Those are the flags you should pass to &v4l2_vp9_segmentation=
.flags.
> > > > > See
> > > > > + * section '7.2.10 Segmentation params syntax' of the VP9 specif=
ication
> > > > > for
> > > > > + * more details.
> > > > > + */
> > > > > +enum v4l2_vp9_segmentation_flags {
> > > > > +       V4L2_VP9_SEGMENTATION_FLAG_ENABLED =3D 1 << 0,
> > > > > +       V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP =3D 1 << 1,
> > > > > +       V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE =3D 1 << 2,
> > > > > +       V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA =3D 1 << 3,
> > > > > +       V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE =3D 1 << 4=
,
> > > > > +};
> > > > > +
> > > > > +#define V4L2_VP9_SEGMENT_FEATURE_ENABLED(id)   (1 << (id))
> > > > > +#define V4L2_VP9_SEGMENT_FEATURE_ENABLED_MASK  0xf
> > > > > +
> > > > > +/**
> > > > > + * enum v4l2_vp9_segment_feature - VP9 segment feature IDs
> > > > > + *
> > > > > + * @V4L2_VP9_SEGMENT_FEATURE_QP_DELTA: QP delta segment feature
> > > > > + * @V4L2_VP9_SEGMENT_FEATURE_LF: loop filter segment feature
> > > > > + * @V4L2_VP9_SEGMENT_FEATURE_REF_FRAME: reference frame segment =
feature
> > > > > + * @V4L2_VP9_SEGMENT_FEATURE_SKIP: skip segment feature
> > > > > + * @V4L2_VP9_SEGMENT_FEATURE_CNT: number of segment features
> > > > > + *
> > > > > + * Segment feature IDs. See section '7.2.10 Segmentation params =
syntax'
> > > > > of
> > > > > the
> > > > > + * VP9 specification for more details.
> > > > > + */
> > > > > +enum v4l2_vp9_segment_feature {
> > > > > +       V4L2_VP9_SEGMENT_FEATURE_QP_DELTA,
> > > > > +       V4L2_VP9_SEGMENT_FEATURE_LF,
> > > > > +       V4L2_VP9_SEGMENT_FEATURE_REF_FRAME,
> > > > > +       V4L2_VP9_SEGMENT_FEATURE_SKIP,
> > > > > +       V4L2_VP9_SEGMENT_FEATURE_CNT,
> > > > > +};
> > > > > +
> > > > > +/**
> > > > > + * struct v4l2_vp9_segmentation - VP9 segmentation parameters
> > > > > + *
> > > > > + * @flags: combination of V4L2_VP9_SEGMENTATION_FLAG_* flags
> > > > > + * @tree_probs: specifies the probability values to be used when
> > > > > + *              decoding a Segment-ID. See '5.15. Segmentation m=
ap'
> > > > > + *              section of the VP9 specification for more detail=
s.
> > > > > + * @pred_prob: specifies the probability values to be used when
> > > > > decoding a
> > > > > + *            Predicted-Segment-ID. See '6.4.14. Get segment id =
syntax'
> > > > > + *            section of :ref:`vp9` for more details..
> > > > > + * @padding: padding used to make things aligned on 64 bits. Sha=
ll be
> > > > > zero
> > > > > + *          filled
> > > > > + * @feature_enabled: bitmask defining which features are enabled=
 in
> > > > > each
> > > > > + *                  segment
> > > > > + * @feature_data: data attached to each feature. Data entry is o=
nly
> > > > > valid
> > > > > if
> > > > > + *               the feature is enabled
> > > > > + *
> > > > > + * Encodes the quantization parameters. See section '7.2.10
> > > > > Segmentation
> > > > > + * params syntax' of the VP9 specification for more details.
> > > > > + */
> > > > > +struct v4l2_vp9_segmentation {
> > > > > +       __u8 flags;
> > > > > +       __u8 tree_probs[7];
> > > > > +       __u8 pred_probs[3];
> > > > > +       __u8 padding[5];
> > > > > +       __u8 feature_enabled[8];
> > > > > +       __s16 feature_data[8][4];
> > > > > +};
> > > > > +
> > > > > +/**
> > > > > + * enum v4l2_vp9_intra_prediction_mode - VP9 Intra prediction mo=
des
> > > > > + *
> > > > > + * @V4L2_VP9_INTRA_PRED_DC: DC intra prediction
> > > > > + * @V4L2_VP9_INTRA_PRED_MODE_V: vertical intra prediction
> > > > > + * @V4L2_VP9_INTRA_PRED_MODE_H: horizontal intra prediction
> > > > > + * @V4L2_VP9_INTRA_PRED_MODE_D45: D45 intra prediction
> > > > > + * @V4L2_VP9_INTRA_PRED_MODE_D135: D135 intra prediction
> > > > > + * @V4L2_VP9_INTRA_PRED_MODE_D117: D117 intra prediction
> > > > > + * @V4L2_VP9_INTRA_PRED_MODE_D153: D153 intra prediction
> > > > > + * @V4L2_VP9_INTRA_PRED_MODE_D207: D207 intra prediction
> > > > > + * @V4L2_VP9_INTRA_PRED_MODE_D63: D63 intra prediction
> > > > > + * @V4L2_VP9_INTRA_PRED_MODE_TM: True Motion intra prediction
> > > > > + *
> > > > > + * See section '7.4.5 Intra frame mode info semantics' for more
> > > > > details.
> > > > > + */
> > > > > +enum v4l2_vp9_intra_prediction_mode {
> > > > > +       V4L2_VP9_INTRA_PRED_MODE_DC,
> > > > > +       V4L2_VP9_INTRA_PRED_MODE_V,
> > > > > +       V4L2_VP9_INTRA_PRED_MODE_H,
> > > > > +       V4L2_VP9_INTRA_PRED_MODE_D45,
> > > > > +       V4L2_VP9_INTRA_PRED_MODE_D135,
> > > > > +       V4L2_VP9_INTRA_PRED_MODE_D117,
> > > > > +       V4L2_VP9_INTRA_PRED_MODE_D153,
> > > > > +       V4L2_VP9_INTRA_PRED_MODE_D207,
> > > > > +       V4L2_VP9_INTRA_PRED_MODE_D63,
> > > > > +       V4L2_VP9_INTRA_PRED_MODE_TM,
> > > > > +};
> > > > > +
> > > > > +/**
> > > > > + * struct v4l2_vp9_mv_probabilities - VP9 Motion vector probabil=
ities
> > > > > + * @joint: motion vector joint probabilities
> > > > > + * @sign: motion vector sign probabilities
> > > > > + * @class: motion vector class probabilities
> > > > > + * @class0_bit: motion vector class0 bit probabilities
> > > > > + * @bits: motion vector bits probabilities
> > > > > + * @class0_fr: motion vector class0 fractional bit probabilities
> > > > > + * @fr: motion vector fractional bit probabilities
> > > > > + * @class0_hp: motion vector class0 high precision fractional bi=
t
> > > > > probabilities
> > > > > + * @hp: motion vector high precision fractional bit probabilitie=
s
> > > > > + */
> > > > > +struct v4l2_vp9_mv_probabilities {
> > > > > +       __u8 joint[3];
> > > > > +       __u8 sign[2];
> > > > > +       __u8 class[2][10];
> > > > > +       __u8 class0_bit[2];
> > > > > +       __u8 bits[2][10];
> > > > > +       __u8 class0_fr[2][2][3];
> > > > > +       __u8 fr[2][3];
> > > > > +       __u8 class0_hp[2];
> > > > > +       __u8 hp[2];
> > > > > +};
> > > > > +
> > > > > +/**
> > > > > + * struct v4l2_vp9_probabilities - VP9 Probabilities
> > > > > + *
> > > > > + * @tx8: TX 8x8 probabilities
> > > > > + * @tx16: TX 16x16 probabilities
> > > > > + * @tx32: TX 32x32 probabilities
> > > > > + * @coef: coefficient probabilities
> > > > > + * @skip: skip probabilities
> > > > > + * @inter_mode: inter mode probabilities
> > > > > + * @interp_filter: interpolation filter probabilities
> > > > > + * @is_inter: is inter-block probabilities
> > > > > + * @comp_mode: compound prediction mode probabilities
> > > > > + * @single_ref: single ref probabilities
> > > > > + * @comp_ref: compound ref probabilities
> > > > > + * @y_mode: Y prediction mode probabilities
> > > > > + * @uv_mode: UV prediction mode probabilities
> > > > > + * @partition: partition probabilities
> > > > > + * @mv: motion vector probabilities
> > > > > + *
> > > > > + * Structure containing most VP9 probabilities. See the VP9
> > > > > specification
> > > > > + * for more details.
> > > > > + */
> > > > > +struct v4l2_vp9_probabilities {
> > > > > +       __u8 tx8[2][1];
> > > > > +       __u8 tx16[2][2];
> > > > > +       __u8 tx32[2][3];
> > > > > +       __u8 coef[4][2][2][6][6][3];
> > > > > +       __u8 skip[3];
> > > > > +       __u8 inter_mode[7][3];
> > > > > +       __u8 interp_filter[4][2];
> > > > > +       __u8 is_inter[4];
> > > > > +       __u8 comp_mode[5];
> > > > > +       __u8 single_ref[5][2];
> > > > > +       __u8 comp_ref[5];
> > > > > +       __u8 y_mode[4][9];
> > > > > +       __u8 uv_mode[10][9];
> > > > > +       __u8 partition[16][3];
> > > > > +
> > > > > +       struct v4l2_vp9_mv_probabilities mv;
> > > > > +};
> > > > > +
> > > > > +/**
> > > > > + * enum v4l2_vp9_reset_frame_context - Valid values for
> > > > > + *                     &v4l2_ctrl_vp9_frame_decode_params-
> > > > > > reset_frame_context
> > > > > + *
> > > > > + * @V4L2_VP9_RESET_FRAME_CTX_NONE: don't reset any frame context
> > > > > + * @V4L2_VP9_RESET_FRAME_CTX_SPEC: reset the frame context point=
ed by
> > > > > + *
> > > > > &v4l2_ctrl_vp9_frame_decode_params.frame_context_idx
> > > > > + * @V4L2_VP9_RESET_FRAME_CTX_ALL: reset all frame contexts
> > > > > + *
> > > > > + * See section '7.2 Uncompressed header semantics' of the VP9
> > > > > specification
> > > > > + * for more details.
> > > > > + */
> > > > > +enum v4l2_vp9_reset_frame_context {
> > > > > +       V4L2_VP9_RESET_FRAME_CTX_NONE,
> > > > > +       V4L2_VP9_RESET_FRAME_CTX_SPEC,
> > > > > +       V4L2_VP9_RESET_FRAME_CTX_ALL,
> > > > > +};
> > > > > +
> > > > > +/**
> > > > > + * enum v4l2_vp9_interpolation_filter - VP9 interpolation filter=
 types
> > > > > + *
> > > > > + * @V4L2_VP9_INTERP_FILTER_8TAP: height tap filter
> > > > > + * @V4L2_VP9_INTERP_FILTER_8TAP_SMOOTH: height tap smooth filter
> > > > > + * @V4L2_VP9_INTERP_FILTER_8TAP_SHARP: height tap sharp filter
> > > > > + * @V4L2_VP9_INTERP_FILTER_BILINEAR: bilinear filter
> > > > > + * @V4L2_VP9_INTERP_FILTER_SWITCHABLE: filter selection is signa=
led at
> > > > > the
> > > > > + *                                    block level
> > > > > + *
> > > > > + * See section '7.2.7 Interpolation filter semantics' of the VP9
> > > > > specification
> > > > > + * for more details.
> > > > > + */
> > > > > +enum v4l2_vp9_interpolation_filter {
> > > > > +       V4L2_VP9_INTERP_FILTER_8TAP,
> > > > > +       V4L2_VP9_INTERP_FILTER_8TAP_SMOOTH,
> > > > > +       V4L2_VP9_INTERP_FILTER_8TAP_SHARP,
> > > > > +       V4L2_VP9_INTERP_FILTER_BILINEAR,
> > > > > +       V4L2_VP9_INTERP_FILTER_SWITCHABLE,
> > > > > +};
> > > > > +
> > > > > +/**
> > > > > + * enum v4l2_vp9_reference_mode - VP9 reference modes
> > > > > + *
> > > > > + * @V4L2_VP9_REF_MODE_SINGLE: indicates that all the inter block=
s use
> > > > > only
> > > > > a
> > > > > + *                           single reference frame to generate =
motion
> > > > > + *                           compensated prediction
> > > > > + * @V4L2_VP9_REF_MODE_COMPOUND: requires all the inter blocks to=
 use
> > > > > compound
> > > > > + *                             mode. Single reference frame pred=
iction
> > > > > is
> > > > > not
> > > > > + *                             allowed
> > > > > + * @V4L2_VP9_REF_MODE_SELECT: allows each individual inter block=
 to
> > > > > select
> > > > > + *                           between single and compound predict=
ion
> > > > > modes
> > > > > + *
> > > > > + * See section '7.3.6 Frame reference mode semantics' of the VP9
> > > > > specification
> > > > > + * for more details.
> > > > > + */
> > > > > +enum v4l2_vp9_reference_mode {
> > > > > +       V4L2_VP9_REF_MODE_SINGLE,
> > > > > +       V4L2_VP9_REF_MODE_COMPOUND,
> > > > > +       V4L2_VP9_REF_MODE_SELECT,
> > > > > +};
> > > > > +
> > > > > +/**
> > > > > + * enum v4l2_vp9_tx_mode - VP9 TX modes
> > > > > + *
> > > > > + * @V4L2_VP9_TX_MODE_ONLY_4X4: transform size is 4x4
> > > > > + * @V4L2_VP9_TX_MODE_ALLOW_8X8: transform size can be up to 8x8
> > > > > + * @V4L2_VP9_TX_MODE_ALLOW_16X16: transform size can be up to 16=
x16
> > > > > + * @V4L2_VP9_TX_MODE_ALLOW_32X32: transform size can be up to 32=
x32
> > > > > + * @V4L2_VP9_TX_MODE_SELECT: bitstream contains transform size f=
or each
> > > > > block
> > > > > + *
> > > > > + * See section '7.3.1 Tx mode semantics' of the VP9 specificatio=
n for
> > > > > more
> > > > > + * details.
> > > > > + */
> > > > > +enum v4l2_vp9_tx_mode {
> > > > > +       V4L2_VP9_TX_MODE_ONLY_4X4,
> > > > > +       V4L2_VP9_TX_MODE_ALLOW_8X8,
> > > > > +       V4L2_VP9_TX_MODE_ALLOW_16X16,
> > > > > +       V4L2_VP9_TX_MODE_ALLOW_32X32,
> > > > > +       V4L2_VP9_TX_MODE_SELECT,
> > > > > +};
> > > > > +
> > > > > +/**
> > > > > + * enum v4l2_vp9_ref_id - VP9 Reference frame IDs
> > > > > + *
> > > > > + * @V4L2_REF_ID_LAST: last reference frame
> > > > > + * @V4L2_REF_ID_GOLDEN: golden reference frame
> > > > > + * @V4L2_REF_ID_ALTREF: alternative reference frame
> > > > > + * @V4L2_REF_ID_CNT: number of reference frames
> > > > > + *
> > > > > + * See section '7.4.12 Ref frames semantics' of the VP9 specific=
ation
> > > > > for
> > > > > more
> > > > > + * details.
> > > > > + */
> > > > > +enum v4l2_vp9_ref_id {
> > > > > +       V4L2_REF_ID_LAST,
> > > > > +       V4L2_REF_ID_GOLDEN,
> > > > > +       V4L2_REF_ID_ALTREF,
> > > > > +       V4L2_REF_ID_CNT,
> > > > > +};
> > > > > +
> > > > > +/**
> > > > > + * enum v4l2_vp9_frame_flags - VP9 frame flags
> > > > > + * @V4L2_VP9_FRAME_FLAG_KEY_FRAME: the frame is a key frame
> > > > > + * @V4L2_VP9_FRAME_FLAG_SHOW_FRAME: the frame should be displaye=
d
> > > > > + * @V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT: the decoding should be =
error
> > > > > resilient
> > > > > + * @V4L2_VP9_FRAME_FLAG_INTRA_ONLY: the frame does not reference=
 other
> > > > > frames
> > > > > + * @V4L2_VP9_FRAME_FLAG_ALLOW_HIGH_PREC_MV: the frame might can =
high
> > > > > precision
> > > > > + *                                         motion vectors
> > > > > + * @V4L2_VP9_FRAME_FLAG_REFRESH_FRAME_CTX: frame context should =
be
> > > > > updated
> > > > > + *                                        after decoding
> > > > > + * @V4L2_VP9_FRAME_FLAG_PARALLEL_DEC_MODE: parallel decoding is =
used
> > > > > + * @V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING: vertical subsampling is e=
nabled
> > > > > + * @V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING: horizontal subsampling is
> > > > > enabled
> > > > > + * @V4L2_VP9_FRAME_FLAG_COLOR_RANGE_FULL_SWING: full UV range is=
 used
> > > > > + *
> > > > > + * Check the VP9 specification for more details.
> > > > > + */
> > > > > +enum v4l2_vp9_frame_flags {
> > > > > +       V4L2_VP9_FRAME_FLAG_KEY_FRAME =3D 1 << 0,
> > > > > +       V4L2_VP9_FRAME_FLAG_SHOW_FRAME =3D 1 << 1,
> > > > > +       V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT =3D 1 << 2,
> > > > > +       V4L2_VP9_FRAME_FLAG_INTRA_ONLY =3D 1 << 3,
> > > > > +       V4L2_VP9_FRAME_FLAG_ALLOW_HIGH_PREC_MV =3D 1 << 4,
> > > > > +       V4L2_VP9_FRAME_FLAG_REFRESH_FRAME_CTX =3D 1 << 5,
> > > > > +       V4L2_VP9_FRAME_FLAG_PARALLEL_DEC_MODE =3D 1 << 6,
> > > > > +       V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING =3D 1 << 7,
> > > > > +       V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING =3D 1 << 8,
> > > > > +       V4L2_VP9_FRAME_FLAG_COLOR_RANGE_FULL_SWING =3D 1 << 9,
> > > > > +};
> > > > > +
> > > > > +#define V4L2_VP9_PROFILE_MAX           3
> > > > > +
> > > > > +/**
> > > > > + * struct v4l2_ctrl_vp9_frame_decode_params - VP9 frame decoding
> > > > > control
> > > > > + *
> > > > > + * @flags: combination of V4L2_VP9_FRAME_FLAG_* flags
> > > > > + * @compressed_header_size: compressed header size in bytes
> > > > > + * @uncompressed_header_size: uncompressed header size in bytes
> > > > > + * @profile: VP9 profile. Can be 0, 1, 2 or 3
> > > > > + * @reset_frame_context: specifies whether the frame context sho=
uld be
> > > > > reset
> > > > > + *                      to default values. See
> > > > > &v4l2_vp9_reset_frame_context
> > > > > + *                      for more details
> > > > > + * @frame_context_idx: frame context that should be used/updated
> > > > > + * @bit_depth: bits per components. Can be 8, 10 or 12. Note tha=
t not
> > > > > all
> > > > > + *            profiles support 10 and/or 12 bits depths
> > > > > + * @interpolation_filter: specifies the filter selection used fo=
r
> > > > > performing
> > > > > + *                       inter prediction. See
> > > > > &v4l2_vp9_interpolation_filter
> > > > > + *                       for more details
> > > > > + * @tile_cols_log2: specifies the base 2 logarithm of the width =
of each
> > > > > tile
> > > > > + *                 (where the width is measured in units of 8x8
> > > > > blocks).
> > > > > + *                 Shall be less than or equal to 6
> > > > > + * @tile_rows_log2: specifies the base 2 logarithm of the height=
 of
> > > > > each
> > > > > tile
> > > > > + *                 (where the height is measured in units of 8x8
> > > > > blocks)
> > > > > + * @tx_mode: specifies the TX mode. See &v4l2_vp9_tx_mode for mo=
re
> > > > > details
> > > > > + * @reference_mode: specifies the type of inter prediction to be=
 used.
> > > > > See
> > > > > + *                 &v4l2_vp9_reference_mode for more details
> > > > > + * @padding: needed to make this struct 64 bit aligned. Shall be=
 filled
> > > > > with
> > > > > + *          zeros
> > > > > + * @frame_width_minus_1: add 1 to it and you'll get the frame wi=
dth
> > > > > expressed
> > > > > + *                      in pixels
> > > > > + * @frame_height_minus_1: add 1 to it and you'll get the frame h=
eight
> > > > > expressed
> > > > > + *                       in pixels
> > > > > + * @frame_width_minus_1: add 1 to it and you'll get the expected=
 render
> > > > > width
> > > > > + *                      expressed in pixels. This is not used du=
ring
> > > > > the
> > > > > + *                      decoding process but might be used by HW
> > > > > scalers to
> > > > > + *                      prepare a frame that's ready for scanout
> > > > > + * @frame_height_minus_1: add 1 to it and you'll get the expecte=
d
> > > > > render
> > > > > height
> > > > > + *                      expressed in pixels. This is not used du=
ring
> > > > > the
> > > > > + *                      decoding process but might be used by HW
> > > > > scalers to
> > > > > + *                      prepare a frame that's ready for scanout
> > > > > + * @refs: array of reference frames. See &v4l2_vp9_ref_id for mo=
re
> > > > > details
> > > > > + * @lf: loop filter parameters. See &v4l2_vp9_loop_filter for mo=
re
> > > > > details
> > > > > + * @quant: quantization parameters. See &v4l2_vp9_quantization f=
or more
> > > > > details
> > > > > + * @seg: segmentation parameters. See &v4l2_vp9_segmentation for=
 more
> > > > > details
> > > > > + * @probs: probabilities. See &v4l2_vp9_probabilities for more d=
etails
> > > > > + */
> > > > > +struct v4l2_ctrl_vp9_frame_decode_params {
> > > > > +       __u32 flags;
> > > > > +       __u16 compressed_header_size;
> > > > > +       __u16 uncompressed_header_size;
> > > > > +       __u8 profile;
> > > > > +       __u8 reset_frame_context;
> > > > > +       __u8 frame_context_idx;
> > > > > +       __u8 bit_depth;
> > > > > +       __u8 interpolation_filter;
> > > > > +       __u8 tile_cols_log2;
> > > > > +       __u8 tile_rows_log2;
> > > > > +       __u8 tx_mode;
> > > > > +       __u8 reference_mode;
> > > > > +       __u8 padding[6];
> > > >
> > > > If my math is correct this should be 7.
> > > >
> > > > > +       __u16 frame_width_minus_1;
> > > > > +       __u16 frame_height_minus_1;
> > > > > +       __u16 render_width_minus_1;
> > > > > +       __u16 render_height_minus_1;
> > > > > +       __u64 refs[V4L2_REF_ID_CNT];
> > > >
> > > > Why are we using u64s to store these [0..7] indices? Or are we stor=
ing
> > > > more than that?
> > > >
> > > > > +       struct v4l2_vp9_loop_filter lf;
> > > > > +       struct v4l2_vp9_quantization quant;
> > > > > +       struct v4l2_vp9_segmentation seg;
> > > > > +       struct v4l2_vp9_probabilities probs;
> > > > > +};
> > > >
> > > > I cannot find a trace of ref_frame_sign_biases, which is also part =
of
> > > > the uncompressed header, in this structure. Is it missing, or is th=
is
> > > > information provided in a different way?
> > >
> > > This seems missing indeed. Interestingly the Rockchip reference softw=
are
> > > does
> > > not seem to pass this information to the hardware. On the other end, =
the
> > > VC8000D
> > > software does. It is also part of DXVA, VA and NVDEC APIs.
> >
> > I can think of at least one piece of hardware that will require this
> > information, so it would be nice to have it included.
>
> We'll had, the more we look at the spec, the less we understand how rkvde=
c
> manages proper decoding without.
>
> >
> > Cheers,
> > Alex.
>
>
