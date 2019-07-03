Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CCDE5EAB5
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 19:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbfGCRnk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 13:43:40 -0400
Received: from mail-qt1-f172.google.com ([209.85.160.172]:36062 "EHLO
        mail-qt1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726430AbfGCRnk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 13:43:40 -0400
Received: by mail-qt1-f172.google.com with SMTP id z4so1222843qtc.3
        for <linux-media@vger.kernel.org>; Wed, 03 Jul 2019 10:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=HGrQRjHNhDyB+g4Vdy4A1tyHxi4XtB3lsGpG2Pfa6uc=;
        b=d/Ru+oa7YASWl2Btha2LfMvgX9kfT5NnYZeetI9d9EYKaDiH+/8osGwG0Xi3YBLXqh
         LZ0uONnQoS8xvthX7GJ3pn8bhl/oBTIkGoRzRz/Zc8fPXOLRhwZa3P/s17Jjqf7cviZJ
         Vr6isbfj00O+PCIxHbBFlGnidgPxfSSMuh+04yoo2NYKg7vUUQXqjV6k9Y6Z+LsIqz6N
         o34FhhDyanMmQaDtiLNCo3ijOS0BNZocv25YWw4/iaBvtgkezkFGvFuh6kv4YuDUKolD
         lUyyULAVAXx9VooAGW7wYfqjOeBvK92zNTYjoV/bFJrRm7OS6Fniky+dp73rW/FZAynX
         6eXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=HGrQRjHNhDyB+g4Vdy4A1tyHxi4XtB3lsGpG2Pfa6uc=;
        b=JUDtZAluQQXt+ZtOYMq+r7tox3pndxtt2Hcpe7drSupZ/pl4dtXM3+8B4p84myJS9P
         ElBfFQYzAVpKdg0RzLQ/ZYImOoqDj30ck4IeT4SolGJ5chmumiPmIedb3VQXWz2dclG8
         ESK85jM4SUkuObCJZuEbtAS5o/XiyxeznEcjYd1HfJbvVGHJgCEfUy5LIwavqO6SWiIU
         NQq2XgIX+GOqjol6qqC8lPCgsSdn/ozWw249+zVGp2yjbF7qtvgZHuIq8ajQivT5S7yD
         85TWOXZ7FMI7aMDaAxDMF0NGm1LaZ+qciJvnAExRgmd02y0KX6F7ZMLw3Rf/MXHVH97z
         rDSw==
X-Gm-Message-State: APjAAAX9PwZCzPsisouuvQZk439qKUvAR5BMrwnvb7cV2/cujkSTJmjq
        h7swSbg+kqreUofDJuP+Yzceog==
X-Google-Smtp-Source: APXvYqwjg2DSvNe0MOX7WXfBMFa7fljHdZeawhsjHje8WVs8sBfHjrsgXM12nw+EUCMyncIpvF+zqQ==
X-Received: by 2002:ac8:48cc:: with SMTP id l12mr8473781qtr.98.1562175819234;
        Wed, 03 Jul 2019 10:43:39 -0700 (PDT)
Received: from tpx230-nicolas.collaboramtl (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id v72sm1283352qkb.0.2019.07.03.10.43.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 03 Jul 2019 10:43:37 -0700 (PDT)
Message-ID: <33884cd0124de2236f9488f1f3f1ff6afcc65d28.camel@ndufresne.ca>
Subject: Re: [RFC] Stateful codecs and requirements for compressed formats
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Date:   Wed, 03 Jul 2019 13:43:36 -0400
In-Reply-To: <CAAFQd5CW5=WUkGdv+=TiAM-x5zRFNrDFYVDfzf+En6xh6XUiMA@mail.gmail.com>
References: <530f28e9-f686-6222-c6cc-9a5207b151f7@xs4all.nl>
         <5b1362779132c1a47c26cd5080d5eb9920e72db3.camel@ndufresne.ca>
         <CAAFQd5CW5=WUkGdv+=TiAM-x5zRFNrDFYVDfzf+En6xh6XUiMA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-3Nob3zs9/SOBH6MRyW63"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-3Nob3zs9/SOBH6MRyW63
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 03 juillet 2019 =C3=A0 17:46 +0900, Tomasz Figa a =C3=A9crit :
> On Sat, Jun 29, 2019 at 3:09 AM Nicolas Dufresne <nicolas@ndufresne.ca> w=
rote:
> > Le vendredi 28 juin 2019 =C3=A0 16:34 +0200, Hans Verkuil a =C3=A9crit =
:
> > > Hi all,
> > >=20
> > > I hope I Cc-ed everyone with a stake in this issue.
> > >=20
> > > One recurring question is how a stateful encoder fills buffers and ho=
w a stateful
> > > decoder consumes buffers.
> > >=20
> > > The most generic case is that an encoder produces a bitstream and jus=
t fills each
> > > CAPTURE buffer to the brim before continuing with the next buffer.
> > >=20
> > > I don't think there are drivers that do this, I believe that all driv=
ers just
> > > output a single compressed frame. For interlaced formats I understand=
 it is either
> > > one compressed field per buffer, or two compressed fields per buffer =
(this is
> > > what I heard, I don't know if this is true).
> > >=20
> > > In any case, I don't think this is specified anywhere. Please correct=
 me if I am
> > > wrong.
> > >=20
> > > The latest stateful codec spec is here:
> > >=20
> > > https://hverkuil.home.xs4all.nl/codec-api/uapi/v4l/dev-mem2mem.html
> > >=20
> > > Assuming what I described above is indeed the case, then I think this=
 should
> > > be documented. I don't know enough if a flag is needed somewhere to d=
escribe
> > > the behavior for interlaced formats, or can we leave this open and ha=
ve userspace
> > > detect this?
> > >=20
> > >=20
> > > For decoders it is more complicated. The stateful decoder spec is wri=
tten with
> > > the assumption that userspace can just fill each OUTPUT buffer to the=
 brim with
> > > the compressed bitstream. I.e., no need to split at frame or other bo=
undaries.
> > >=20
> > > See section 4.5.1.7 in the spec.
> > >=20
> > > But I understand that various HW decoders *do* have limitations. I wo=
uld really
> > > like to know about those, since that needs to be exposed to userspace=
 somehow.
> > >=20
> > > Specifically, the venus decoder needs to know the resolution of the c=
oded video
> > > beforehand and it expects a single frame per buffer (how does that wo=
rk for
> > > interlaced formats?).
> > >=20
> > > Such requirements mean that some userspace parsing is still required,=
 so these
> > > decoders are not completely stateful.
> > >=20
> > > Can every codec author give information about their decoder/encoder?
> > >=20
> > > I'll start off with my virtual codec driver:
> > >=20
> > > vicodec: the decoder fully parses the bitstream. The encoder produces=
 a single
> > > compressed frame per buffer. This driver doesn't yet support interlac=
ed formats,
> > > but when that is added it will encode one field per buffer.
> > >=20
> > > Let's see what the results are.
> >=20
> > Hans though a summary of what existing userspace expects / assumes
> > would be nice.
> >=20
> > GStreamer:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > Encodes:
> >   fwht, h263, h264, hevc, jpeg, mpeg4, vp8, vp9
> > Decodes:
> >   fwht, h263, h264, hevc, jpeg, mpeg2, mpeg4, vc1, vp8, vp9
> >=20
> > It assumes that each encoded v4l2_buffer contains exactly one frame
> > (any format, two fields for interlaced content). It may still work
> > otherwise, but some issues will appear, timestamp shift, lost of
> > metadata (e.g. timecode, cc, etc.).
> >=20
> > FFMpeg:
> > =3D=3D=3D=3D=3D=3D=3D
> > Encodes:
> >   h263, h264, hevc, mpeg4, vp8
> > Decodes:
> >   h263, h264, hevc, mpeg2, mpeg4, vc1, vp8, vp9
> >=20
> > Similarly to GStreamer, it assumes that one AVPacket will fit one
> > v4l2_buffer. On the encoding side, it seems less of a problem, but they
> > don't fully implement the FFMPEG CODEC API for frame matching, which I
> > suspect would create some ambiguity if it was.
> >=20
> > Chromium:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> > Decodes:
> >   H264, VP8, VP9
> > Encodes:
> >   H264
>=20
> VP8 too.
>=20
> It can in theory handle any format V4L2 could expose, but these 2 seem
> to be the only commonly used codecs used in practice and supported by
> hardware.
>=20
> > That is the code I know the less, but the encoder does not seem
> > affected by the nal alignment. The keyframe flag and timestamps seems
> > to be used and are likely expected to correlate with the input, so I
> > suspect that there exist some possible ambiguity if the output is not
> > full frame. For the decoder, I'll have to ask someone else to comment,
> > the code is hard to follow and I could not get to the place where
> > output buffers are filled. I thought the GStreamer code was tough, but
> > this is quite similarly a mess.
>=20
> Not sure what's so complicated there. There is a clearly isolated
> function that does the parsing:
> https://cs.chromium.org/chromium/src/media/gpu/v4l2/v4l2_video_decode_acc=
elerator.cc?rcl=3D2880fe4f6b246809f1be72c5a5698dced4cd85d1&l=3D984
>=20
> It puts special NALUs like SPS and PPS in separate buffers and for
> frames it's 1 frame (all slices of the frame) : 1 buffer.

Consider this a feedback, but the mix of parsing with decoding, along
with the name of the method "::AdvanceFrameFragment".

Thanks for pointing to this code. Was there any HW where this split was
strictly required ?

>=20
> Best regards,
> Tomasz

--=-3Nob3zs9/SOBH6MRyW63
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXRzpSAAKCRBxUwItrAao
HAQ8AKDU8Ds/9xp41rjVy294lmNTbvwj1wCeKCndLKI5L6RLI7VVAlMpnaa3iWA=
=r9z2
-----END PGP SIGNATURE-----

--=-3Nob3zs9/SOBH6MRyW63--

