Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C6A55A32F
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 20:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbfF1SJX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 14:09:23 -0400
Received: from mail-qt1-f170.google.com ([209.85.160.170]:38150 "EHLO
        mail-qt1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726562AbfF1SJX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 14:09:23 -0400
Received: by mail-qt1-f170.google.com with SMTP id n11so7290081qtl.5
        for <linux-media@vger.kernel.org>; Fri, 28 Jun 2019 11:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version;
        bh=9sXSgKyh1po7Bcjf2Vb1uLNa5hQD83meh/P4oCtd/Zo=;
        b=SSn9o4WpGBxnCo0xmiXm9VDkn3BeRI1BVMvYqTJUivDGtX9KiFteVBc7Ffmhbit56w
         Q/Z1Vb4uRO44Xmxukoxi6SCRUBoYYBbaxZMy3fm72lnPM2a3vQVPDD0VLJAlR0xkCa++
         yG+rG+itBqOAXG6aejGfnqYmk8LCwoGfXe0YRqJd5iHXuzl2Su2QcdHV5CeG0DcCjBrD
         Iqcd2hk/1iu38J1FY+S28zMSOjvDavUbxDSLTBlLl86/FY2aWbZY3yqlGUs+zubPT6dA
         9DlaQ4KypA1O2NA6/IVg8ktWDyHHyS6Xkf1pTOh4wevlKAFLbgKSpvaZYuac3VJGMkqm
         gJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version;
        bh=9sXSgKyh1po7Bcjf2Vb1uLNa5hQD83meh/P4oCtd/Zo=;
        b=QyQhsWDAudBJjHILYkb8+vqAdhadM4XWt1WnlKGOqjHADjC9SVLkleCuJ0Wp8rn0fI
         S89QYpIVKcXpo7e6Y+Kx6KVZDichzFeO4HZNxbxv3P9tYboG+tA1qpAIiGnHVCaBjqv1
         zJlVjRfSNxt6rMIGU49sVfui7yr/qZjZdiWmBwwuej+tcHAhgBQ0cWqlaWXa3WtBt4bO
         vhYOVM4AOwbLCO6H2DxNnMrE3qVL1KJ/sT2DuUIJ5/ibNcB4IznJIzOk8RfgB9dPXlsq
         RVNsdxt31NFlmbJHna9jXye8S/6QVqERP193Sp3wagWfUfPzHxHQiJX+3Fq71hLsKZAY
         Wo2Q==
X-Gm-Message-State: APjAAAVsEBK2OBOH6tZsUQOQl4V306xxDyJsKk3mMiB3eHcDgNX4PZ50
        UjhKZ/QD+53KtBQAs7/hHMnjjA==
X-Google-Smtp-Source: APXvYqwLkBKf8Dp9GYX0tNVJbGiic46C5iCGYhB3lcIhpOHqLcoxup9h33Bu+Zewrp9oBPo+FbMdPA==
X-Received: by 2002:a0c:af18:: with SMTP id i24mr9288938qvc.115.1561745361764;
        Fri, 28 Jun 2019 11:09:21 -0700 (PDT)
Received: from tpx230-nicolas (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id g10sm1275079qki.37.2019.06.28.11.09.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 28 Jun 2019 11:09:20 -0700 (PDT)
Message-ID: <5b1362779132c1a47c26cd5080d5eb9920e72db3.camel@ndufresne.ca>
Subject: Re: [RFC] Stateful codecs and requirements for compressed formats
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Tomasz Figa <tfiga@chromium.org>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Date:   Fri, 28 Jun 2019 14:09:18 -0400
In-Reply-To: <530f28e9-f686-6222-c6cc-9a5207b151f7@xs4all.nl>
References: <530f28e9-f686-6222-c6cc-9a5207b151f7@xs4all.nl>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-SuHjexYYxjmquByuIvz3"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-SuHjexYYxjmquByuIvz3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 28 juin 2019 =C3=A0 16:34 +0200, Hans Verkuil a =C3=A9crit :
> Hi all,
>=20
> I hope I Cc-ed everyone with a stake in this issue.
>=20
> One recurring question is how a stateful encoder fills buffers and how a =
stateful
> decoder consumes buffers.
>=20
> The most generic case is that an encoder produces a bitstream and just fi=
lls each
> CAPTURE buffer to the brim before continuing with the next buffer.
>=20
> I don't think there are drivers that do this, I believe that all drivers =
just
> output a single compressed frame. For interlaced formats I understand it =
is either
> one compressed field per buffer, or two compressed fields per buffer (thi=
s is
> what I heard, I don't know if this is true).
>=20
> In any case, I don't think this is specified anywhere. Please correct me =
if I am
> wrong.
>=20
> The latest stateful codec spec is here:
>=20
> https://hverkuil.home.xs4all.nl/codec-api/uapi/v4l/dev-mem2mem.html
>=20
> Assuming what I described above is indeed the case, then I think this sho=
uld
> be documented. I don't know enough if a flag is needed somewhere to descr=
ibe
> the behavior for interlaced formats, or can we leave this open and have u=
serspace
> detect this?
>=20
>=20
> For decoders it is more complicated. The stateful decoder spec is written=
 with
> the assumption that userspace can just fill each OUTPUT buffer to the bri=
m with
> the compressed bitstream. I.e., no need to split at frame or other bounda=
ries.
>=20
> See section 4.5.1.7 in the spec.
>=20
> But I understand that various HW decoders *do* have limitations. I would =
really
> like to know about those, since that needs to be exposed to userspace som=
ehow.
>=20
> Specifically, the venus decoder needs to know the resolution of the coded=
 video
> beforehand and it expects a single frame per buffer (how does that work f=
or
> interlaced formats?).
>=20
> Such requirements mean that some userspace parsing is still required, so =
these
> decoders are not completely stateful.
>=20
> Can every codec author give information about their decoder/encoder?
>=20
> I'll start off with my virtual codec driver:
>=20
> vicodec: the decoder fully parses the bitstream. The encoder produces a s=
ingle
> compressed frame per buffer. This driver doesn't yet support interlaced f=
ormats,
> but when that is added it will encode one field per buffer.
>=20
> Let's see what the results are.

Hans though a summary of what existing userspace expects / assumes
would be nice.

GStreamer:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Encodes:
  fwht, h263, h264, hevc, jpeg, mpeg4, vp8, vp9
Decodes:
  fwht, h263, h264, hevc, jpeg, mpeg2, mpeg4, vc1, vp8, vp9

It assumes that each encoded v4l2_buffer contains exactly one frame
(any format, two fields for interlaced content). It may still work
otherwise, but some issues will appear, timestamp shift, lost of
metadata (e.g. timecode, cc, etc.).

FFMpeg:
=3D=3D=3D=3D=3D=3D=3D
Encodes:
  h263, h264, hevc, mpeg4, vp8
Decodes:
  h263, h264, hevc, mpeg2, mpeg4, vc1, vp8, vp9

Similarly to GStreamer, it assumes that one AVPacket will fit one
v4l2_buffer. On the encoding side, it seems less of a problem, but they
don't fully implement the FFMPEG CODEC API for frame matching, which I
suspect would create some ambiguity if it was.

Chromium:
=3D=3D=3D=3D=3D=3D=3D=3D=3D
Decodes:
  H264, VP8, VP9
Encodes:
  H264

That is the code I know the less, but the encoder does not seem
affected by the nal alignment. The keyframe flag and timestamps seems
to be used and are likely expected to correlate with the input, so I
suspect that there exist some possible ambiguity if the output is not
full frame. For the decoder, I'll have to ask someone else to comment,
the code is hard to follow and I could not get to the place where
output buffers are filled. I thought the GStreamer code was tough, but
this is quite similarly a mess.

Nicolas







--=-SuHjexYYxjmquByuIvz3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXRZXzgAKCRBxUwItrAao
HFp8AJ4uW4ookp5sPK/Irxsly98owKXL0gCeMlWJURseAvs25W9PkVh2zZFGmxM=
=vzPH
-----END PGP SIGNATURE-----

--=-SuHjexYYxjmquByuIvz3--

