Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7941EBF5E3
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2019 17:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727253AbfIZP21 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Sep 2019 11:28:27 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:43448 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726845AbfIZP20 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Sep 2019 11:28:26 -0400
Received: by mail-qk1-f193.google.com with SMTP id h126so2100531qke.10
        for <linux-media@vger.kernel.org>; Thu, 26 Sep 2019 08:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=KTzRw4A764RyQaNDLM4Y70e+8wx+biKN5gkyp2vWAf0=;
        b=gbcBV81jXRMUe7YzZLOCFE7HvLT1LUViiIkaSBgPV/iO9QArMBSZNYcNY2fX12Pkth
         vWoN6apwAZ0ZHsfBhGemthlbrwjZPUZZ6iz5j2hoCguqHZ2n2Q6EiYKXiub3IkfWfuuH
         JO0flKLrtBS2jlHNJV5ZNepGFbWRSJplyZ5cf6ondqfG8IhXRgDh8AvI/pAbqgRcoc5q
         8duDLCqs1zlFEOz5sj2xC79+8mZl6ODjj9adRQ44ivLHZMXDVcUTMNi65a/E7fKlHYtX
         yj5ygKRwrTdvkhElA2jBKviD983ohuMIKjDtvdCHZGl/hBTfMkLoyR3DKxS0N/hhbDki
         UxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=KTzRw4A764RyQaNDLM4Y70e+8wx+biKN5gkyp2vWAf0=;
        b=dIkRHmyAIeSmgm9nC0j0Vto+46F2NQbj7aeeSVdQ3oaPZRG4E2ULxEv/UjDUzK1UEY
         gM8m2NChF+lLecDnuzmRoJL3RlojRofZz3ILdR+FqWw2OFw+DIn5eLi+eWJBbiTDMdQl
         5BqFctkGhuwHg4K0OrvGmK7PhCPWzjo4sQ8w55A3nxP6YbUs0ottohlMGqzceKLtzULx
         Ebffu38kxUjr0nCykCz88q0wQsYCvNAcSIJc5iZtHPC+1bMNJYfewuZB2SiI9Uh8Qxc2
         XizamLouxzd2Sspj/pEziONoepjIXVsOJPMzx3zPk03q2YNFH3CgYQzV6aVDPpT7aepl
         Ii8A==
X-Gm-Message-State: APjAAAUkldMzQKFPjTxYiLbaprtIfhV7FIxN5+HMtcK2cCxheEFCQmSv
        RRV+H7Qsvxcm3WWvnftd0jK9zQ==
X-Google-Smtp-Source: APXvYqzRmRX38KgFLbtD+15all6dMwgb0D+2F3XbvWQir55hHwSmcSwwJmBe5FFSqmcbd23i5VnSMw==
X-Received: by 2002:a37:bd45:: with SMTP id n66mr3766082qkf.272.1569511705393;
        Thu, 26 Sep 2019 08:28:25 -0700 (PDT)
Received: from tpx230-nicolas (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id i2sm1578981qti.58.2019.09.26.08.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2019 08:28:24 -0700 (PDT)
Message-ID: <e1defecccd596ed7dfc76d4085fce1a2863e784f.camel@ndufresne.ca>
Subject: Re: [ANN] Media sessions in Lyon in October: codecs
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Tomasz Figa <tfiga@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Daniel Gomez <daniel@qtec.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Eugen Hristev <Eugen.Hristev@microchip.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Helen Koike <helen.koike@collabora.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date:   Thu, 26 Sep 2019 11:28:21 -0400
In-Reply-To: <CAAFQd5Bk+C=wDr-PpRhUnyuRjKppaZE79MXEvH65q-D5LxN1cg@mail.gmail.com>
References: <b3b2c3a6-43d6-ffbd-f94c-e6f92cad8a97@xs4all.nl>
         <CAAFQd5Bk+C=wDr-PpRhUnyuRjKppaZE79MXEvH65q-D5LxN1cg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-PQJZxljIGHKmRkz2gFQz"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-PQJZxljIGHKmRkz2gFQz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 26 septembre 2019 =C3=A0 19:21 +0900, Tomasz Figa a =C3=A9crit :
> On Mon, Sep 23, 2019 at 11:13 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> > Hi all,
> >=20
> > Since we have three separate half-day sessions for different topics I d=
ecided
> > to split the announcement for this in three emails as well, so these th=
ings
> > can be discussed in separate threads.
> >=20
> > All sessions are in room Terreaux VIP Lounge - Level 0.
> > There is a maximum of 15 people.
> >=20
> > The first session deals with the codec API and is on Tuesday morning fr=
om
> > 8:30 (tentative, might change) to 12:00 (we have to vacate the room at =
that
> > time).
> >=20
> > Confirmed attendees for this session:
> >=20
> > Boris Brezillon <boris.brezillon@collabora.com>
> > Alexandre Courbot <acourbot@chromium.org>
> > Nicolas Dufresne <nicolas@ndufresne.ca>
> > Tomasz Figa <tfiga@chromium.org>
> > Ezequiel Garcia <ezequiel@collabora.com>
> > Daniel Gomez <daniel@qtec.com>
> > Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > Eugen Hristev <Eugen.Hristev@microchip.com>
> > Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > Helen Koike <helen.koike@collabora.com>
> > Michael Tretter <m.tretter@pengutronix.de>
> > Hans Verkuil <hverkuil@xs4all.nl>
> >=20
> > Tentative:
> >=20
> > Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Jacopo Mondi <jacopo@jmondi.org>
> >=20
> > Jacopo, please confirm if you want to attend this session. I didn't fin=
d
> > an email with explicit confirmation, so it was probably done via irc. B=
ut since
> > this session is getting close to capacity I would prefer to keep attend=
ance to
> > those are actually working with codecs (or will work with it in the nea=
r future).
> >=20
> > If I missed someone, or you are on the list but won't attend after all,=
 then
> > please let me know.
> >=20
> >=20
> >=20
> > Agenda:
> >=20
> > - Status of any pending patches related to codec support.
> >=20
> > - Requirements of moving codec drivers out of staging.
> >=20
> > - Finalize the stateful encoder API. There are two pieces that need
> >   to be defined:
> >=20
> > 1) Setting the frame rate so bitrate control can make sense, since
> >    they need to know this information. This is also relevant for the
> >    stateless codec (and this may have to change on a per-frame basis
> >    for stateless codecs!).
> >=20
> >    This can either be implemented via ENUM_FRAMEINTERVALS for the coded
> >    pixelformats and S_PARM support, or we just add a new control for th=
is.
> >    E.g. V4L2_CID_MPEG_VIDEO_FRAME_INTERVAL (or perhaps FRAME_RATE). If =
we
> >    go for a control, then we need to consider the unit. We can use a
> >    fraction as well. See this series that puts in the foundation for th=
at:
> >    https://patchwork.linuxtv.org/cover/58857/
> >=20
> >    I am inclined to go with a control, since the semantics don't really
> >    match ENUM_FRAMEINTERVALS/S_PARM. These ioctls still need to be supp=
orted
> >    for legacy drivers. Open question: some drivers (mediatek, hva, coda=
)
> >    require S_PARM(OUTPUT), some (venus) allow both S_PARM(CAPTURE) and
> >    S_PARM(OUTPUT). I am inclined to allow both since this is not a CAPT=
URE
> >    vs OUTPUT thing, it is global to both queues.
> >=20
> > 2) Interactions between OUTPUT and CAPTURE formats.
> >=20
> >    The main problem is what to do if the capture sizeimage is too small
> >    for the OUTPUT resolution when streaming starts.
> >=20
> >    Proposal: width and height of S_FMT(OUTPUT) are used to
> >    calculate a minimum sizeimage (app may request more). This is
> >    driver-specific. (Is it? Or is this codec-specific?)
> >=20
> >    V4L2_FMT_FLAG_FIXED_RESOLUTION is always set for codec formats
> >    for the encoder (i.e. we don't support mid-stream resolution
> >    changes for now) and V4L2_EVENT_SOURCE_CHANGE is not
> >    supported. See https://patchwork.linuxtv.org/patch/56478/ for
> >    the patch adding this flag.
> >=20
> >    Of course, if we start to support mid-stream resolution
> >    changes (or other changes that require a source change event),
> >    then this flag should be dropped by the encoder driver and
> >    documentation on how to handle the source change event should
> >    be documented in the encoder spec. I prefer to postpone this
> >    until we have an encoder than can actually do mid-stream
> >    resolution changes.
> >=20
> >    If sizeimage of the OUTPUT is too small for the CAPTURE
> >    resolution and V4L2_EVENT_SOURCE_CHANGE is not supported,
> >    then the second STREAMON (either CAPTURE or OUTPUT) will
> >    return -ENOMEM since there is not enough memory to do the
> >    encode.
> >=20
> >    If V4L2_FMT_FLAG_FIXED_RESOLUTION is set (i.e. that should
> >    be the case for all current encoders), then any bitrate controls
> >    will be limited in range to what the current state (CAPTURE and
> >    OUTPUT formats and frame rate) supports.
> >=20
> > - Stateless encoders?
>=20
> This could indeed be a good topic. The hantro driver currently only
> supports JPEG encoding, but the hardware also supports H.264 and VP8
> at least. It, however, handles only the core parts of the encoding,
> i.e. generating the actual encoded frames (slices) without headers. It
> also doesn't do any bitrate control or scene change detection on its
> own and expects quality parameters (QP) or keyframe requests to come
> from the software.
>=20
> I'm not sure if there is any other hardware with similar constraints
> that could use V4L2, but I believe the Intel video encoder supported
> by VAAPI has a similar design.

The bitrate adaption is mostly done inside the VAAPI driver on Intel
side, software of shaders (could also be in HW for other drivers, not
sure if it's different with VDBox, which is real HW, also advertised as
the Iris Low Power CODCE). Users of VAAPI will setup certain parameter
in a structure called VAEncMiscParameterRateControl, but there is no
per-frame or per-slice work from what I can see.

Though, the encoded bits are similar, they come pretty raw, no
sps/pps/sei or anything, and no slice headers at all. This all being
generated in gstreamer-vaapi, and I suppose it's the same in FFMPEG or
Chromium ?


>=20
> Best regards,
> Tomasz
>=20
> > - Anything else? (I have a feeling I missed a codec-related topic, but
> >   I can't find it in my mailbox)
> >=20
> > Regards,
> >=20
> >         Hans

--=-PQJZxljIGHKmRkz2gFQz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXYzZFgAKCRBxUwItrAao
HGewAKCnpo2baDqa7mZHTM8r8iDuUeijXACfYihyyY/3LsvY1mtTsgjU5MOcRy4=
=k96/
-----END PGP SIGNATURE-----

--=-PQJZxljIGHKmRkz2gFQz--

