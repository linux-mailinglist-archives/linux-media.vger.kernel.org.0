Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 612C634BFD
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 17:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728110AbfFDPTQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 11:19:16 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:43525 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727960AbfFDPTP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 11:19:15 -0400
Received: by mail-qt1-f194.google.com with SMTP id z24so7043817qtj.10
        for <linux-media@vger.kernel.org>; Tue, 04 Jun 2019 08:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=+GLB//FJMzoRKaojHbKWRnGBjh+3MN+YOG5PwzjbOKg=;
        b=Kz74tCOv53muyp8/p6NdupmKuw+XBhRNaC5yX+mvvvW2aM/wgTht9w/CQQMz87v6av
         RRLydBUfqR0vg/cIPBv/dRHuAic6/t5AeV+DLSsAbG9uqANgKsbHC/r5+OyyPkV3vCLx
         MWkFUIsH3Cw8JQO1FtJ347AqdviS7DbhW5/AZdfxAX2IhhJvTf9Ytj96UYlmCcyeEWN8
         oHGE3BPxff1UAEsKSzvr9bQ2kt2XfPE3Pu6hTw+JYobZld4K8nhMS6/c456krekjDFnB
         9zh8Kx0ZfOUtcfdABTAx5b3+PwQzrZxpaiVJQh/pnb+fjJBdRExm//FyxxjNgXe3qBfr
         dQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=+GLB//FJMzoRKaojHbKWRnGBjh+3MN+YOG5PwzjbOKg=;
        b=TKUNPVyXT+540KxWUlG1//mWQEzV9PZI7J3M8i/DvdPW9IIz+jgXZ6Fo7n1uVXYi5B
         3y7fLrvjtvZ41ZoY9dVikLUYxRgZqxZ0zxAGrMS7zLHOhADGHLKw6Y6GvCjuCf9wpZ4b
         3oyOUNulXyaDnTCDrTnzdYCHe9FYWSe9HULH9pm5jyRV5JtwFXz74d/IjucgYY3MY8cT
         1li4Wm6Dgm6gk/kQ5EYyQYOgn+9YNAr2ef6W4fAOoPa0gx+U8XV216nsqzei16KycO/s
         OVWq+SbQAu49CXdBQZIdHbcnzpXAWvbt4oo74gE9VZure8EM8P4T6VKhrlRd5lwMNIW0
         TdVQ==
X-Gm-Message-State: APjAAAVD4+BOWwhEiAfoEMAxZbHHHmNB8AsaRLVFV5Cvgov4Ug1bQlS2
        x7+dFvVUdRXYOVh/6ivI2PQHNg==
X-Google-Smtp-Source: APXvYqwm+1CXoL9l4dlrHmtzp93ARlNFcklMLRuzN9brlvTUPxE84r5ERddU/N72qkOlVTTtM69AOQ==
X-Received: by 2002:aed:2389:: with SMTP id j9mr2200835qtc.244.1559661554019;
        Tue, 04 Jun 2019 08:19:14 -0700 (PDT)
Received: from tpx230-nicolas (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id x7sm7286334qka.6.2019.06.04.08.19.12
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 04 Jun 2019 08:19:13 -0700 (PDT)
Message-ID: <1cb8cc0c89f0017962226fdb84ae11e763fdd233.camel@ndufresne.ca>
Subject: Re: [PATCHv4 0/2] Document memory-to-memory video codec interfaces
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Pawel Osciak <posciak@chromium.org>
Date:   Tue, 04 Jun 2019 11:19:11 -0400
In-Reply-To: <20190603112835.19661-1-hverkuil-cisco@xs4all.nl>
References: <20190603112835.19661-1-hverkuil-cisco@xs4all.nl>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-z2rjHTDfEa06D9UEeCQq"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-z2rjHTDfEa06D9UEeCQq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 03 juin 2019 =C3=A0 13:28 +0200, Hans Verkuil a =C3=A9crit :
> Since Thomasz was very busy with other things, I've taken over this
> patch series. This v4 includes his draft changes and additional changes
> from me.
>=20
> This series attempts to add the documentation of what was discussed
> during Media Workshops at LinuxCon Europe 2012 in Barcelona and then
> later Embedded Linux Conference Europe 2014 in D=C3=BCsseldorf and then
> eventually written down by Pawel Osciak and tweaked a bit by Chrome OS
> video team (but mostly in a cosmetic way or making the document more
> precise), during the several years of Chrome OS using the APIs in
> production.
>=20
> Note that most, if not all, of the API is already implemented in
> existing mainline drivers, such as s5p-mfc or mtk-vcodec. Intention of
> this series is just to formalize what we already have.
>=20
> Thanks everyone for the huge amount of useful comments to previous
> versions of this series. Much of the credits should go to Pawel Osciak
> too, for writing most of the original text of the initial RFC.
>=20
> This v4 incorporates all known comments (let me know if I missed
> something!) and should be complete for the decoder.
>=20
> For the encoder there are two remaining TODOs for the API:
>=20
> 1) Setting the frame rate so bitrate control can make sense, since
>    they need to know this information.
>=20
>    Suggested solution: require support for ENUM_FRAMEINTERVALS for the
>    coded pixelformats and S_PARM(OUTPUT). Open question: some drivers
>    (mediatek, hva, coda) require S_PARM(OUTPUT), some (venus) allow both
>    S_PARM(CAPTURE) and S_PARM(OUTPUT). I am inclined to allow both since
>    this is not a CAPTURE vs OUTPUT thing, it is global to both queues.

I agree, as long as it's documented. I can imagine how this could be
confusing for new users.

>=20
> 2) Interactions between OUTPUT and CAPTURE formats.
>=20
>    The main problem is what to do if the capture sizeimage is too small
>    for the OUTPUT resolution when streaming starts.
>=20
>    Proposal: width and height of S_FMT(OUTPUT) are used to
>    calculate a minimum sizeimage (app may request more). This is
>    driver-specific.
>=20
>    V4L2_FMT_FLAG_FIXED_RESOLUTION is always set for codec formats
>    for the encoder (i.e. we don't support mid-stream resolution
>    changes for now) and V4L2_EVENT_SOURCE_CHANGE is not
>    supported. See https://patchwork.linuxtv.org/patch/56478/ for
>    the patch adding this flag.
>=20
>    Of course, if we start to support mid-stream resolution
>    changes (or other changes that require a source change event),
>    then this flag should be dropped by the encoder driver and
>    documentation on how to handle the source change event should
>    be documented in the encoder spec. I prefer to postpone this
>    until we have an encoder than can actually do mid-stream
>    resolution changes.
>=20
>    If sizeimage of the OUTPUT is too small for the CAPTURE
>    resolution and V4L2_EVENT_SOURCE_CHANGE is not supported,
>    then the second STREAMON (either CAPTURE or OUTPUT) will
>    return -ENOMEM since there is not enough memory to do the
>    encode.

You seem confident that we will know immediately if it's too small. But
what I remember is that HW has an interrupt for this, allowing
userspace to allocate a larger buffer and resume.

Should we make the capture queue independent of the streaming state, so
that we can streamoff/reqbufs/.../streamon to resume from an ENOMEM
error ? And shouldn't ENOMEM be returned by the following capture DQBUF
when such an interrupt is raised ?

>=20
>    If V4L2_FMT_FLAG_FIXED_RESOLUTION is set (i.e. that should
>    be the case for all current encoders), then any bitrate controls
>    will be limited in range to what the current state (CAPTURE and
>    OUTPUT formats and frame rate) supports.
>=20
> Comments regarding these two encoder proposals are welcome!
>=20
> Regards,
>=20
> 	Hans
>=20
> Changes since v3:
>=20
> - Lots of stylistic fixes and fixing typos/grammar/etc.
>=20
> Decoder:
>=20
> - width/height for S_FMT(OUTPUT):
>=20
>   Expects that the output width and height is always a valid
>   resolution (i.e. never 0x0), and G/S/TRY_FMT and REQBUFS will use that
>   instead of returning an error. Note that this resolution is a placehold=
er
>   until the actual resolution is parsed from the stream.
>=20
> - Dropped step 3 (Query the minimum number of buffers required for the CA=
PTURE
>   queue via VIDIOC_G_CTRL().) in the Capture Setup section. It seems to b=
e
>   a left-over from earlier versions. The same information is also in Step=
 10,
>   so no need to have this in two places.
>=20
> - Added step 5 in the Capture Setup section: set COMPOSE rectangle if nee=
ded.
>=20
> - VIDIO_DECODER_CMD: document EBUSY return while draining the queue.
>=20
> Encoder:
>=20
> - width/height for S_FMT(CAPTURE): The width/height for the CAPTURE forma=
t
>   are marked as read-only and are based on the encoders current state suc=
h
>   as the OUTPUT format.
>=20
> - Drop TGT_COMPOSE support in the encoder: there are currently
>   no encoders that can do composing/scaling.
>=20
> - Document corner cases in the Drain sequence
>=20
> - Document error handling.
>=20
> - VIDIO_ENCODER_CMD: document EBUSY return while draining the queue.
>=20
> Changes since v2:
> (https://lore.kernel.org/patchwork/cover/1002474/)
> Decoder:
>  - Specified that the initial source change event is signaled
>    regardless of whether the client-set format matches the
>    stream format.
>  - Dropped V4L2_CID_MIN_BUFFERS_FOR_OUTPUT since it's meaningless
>    for the bitstream input buffers of decoders.
>  - Explicitly stated that VIDIOC_REQBUFS is not allowed on CAPTURE
>    if the stream information is not available.
>  - Described decode error handling.
>  - Mentioned that timestamps can be observed after a seek to
>    determine whether the CAPTURE buffers originated from before
>    or after the seek.
>  - Explicitly stated that after a pair of V4L2_DEC_CMD_STOP and
>    V4L2_DEC_CMD_START, the decoder is not reset and preserves
>    all the state.
>=20
> Encoder:
>  - Specified that width and height of CAPTURE format are ignored
>    and always zero.
>  - Explicitly noted the common use case for the CROP target with
>    macroblock-unaligned video resolutions.
>  - Added a reference to Request API.
>  - Dropped V4L2_CID_MIN_BUFFERS_FOR_CAPTURE since it's meaningless
>    for the bitstream output buffers of encoders.
>  - Explicitly stated that after a pair of V4L2_ENC_CMD_STOP and
>    V4L2_ENC_CMD_START, the encoder is not reset and preserves
>    all the state.
>=20
> General:
>  - Dropped format enumeration from "Initialization", since it's already
>    a part of "Querying capabilities".
>  - Many spelling, grammar, stylistic, etc. changes.
>  - Changed the style of note blocks.
>  - Rebased onto Hans' documentation cleanup series.
>    (https://patchwork.kernel.org/cover/10775407/
>     https://patchwork.kernel.org/patch/10776737/)
>  - Moved the interfaces under the "Video Memory-To-Memory Interface"
>    section.
>=20
> For changes since v1 see the v2:
> https://lore.kernel.org/patchwork/cover/1002474/
>=20
> For changes since RFC see the v1:
> https://patchwork.kernel.org/cover/10542207/
>=20
> Tomasz Figa (2):
>   media: docs-rst: Document memory-to-memory video decoder interface
>   media: docs-rst: Document memory-to-memory video encoder interface
>=20
>  Documentation/media/uapi/v4l/dev-decoder.rst  | 1084 +++++++++++++++++
>  Documentation/media/uapi/v4l/dev-encoder.rst  |  608 +++++++++
>  Documentation/media/uapi/v4l/dev-mem2mem.rst  |    9 +-
>  Documentation/media/uapi/v4l/pixfmt-v4l2.rst  |   10 +
>  Documentation/media/uapi/v4l/v4l2.rst         |   12 +-
>  .../media/uapi/v4l/vidioc-decoder-cmd.rst     |   41 +-
>  .../media/uapi/v4l/vidioc-encoder-cmd.rst     |   51 +-
>  7 files changed, 1779 insertions(+), 36 deletions(-)
>  create mode 100644 Documentation/media/uapi/v4l/dev-decoder.rst
>  create mode 100644 Documentation/media/uapi/v4l/dev-encoder.rst
>=20

--=-z2rjHTDfEa06D9UEeCQq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXPaL7wAKCRBxUwItrAao
HLX/AJ4rYDmpomVuz9vTkwkuMNuprybr0wCfZlXD1+znpT3mx2TZpf1q2fEUoRk=
=7kSa
-----END PGP SIGNATURE-----

--=-z2rjHTDfEa06D9UEeCQq--

