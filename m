Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1D5D5A0AA
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 18:18:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbfF1QSh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 12:18:37 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:44076 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726542AbfF1QSh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 12:18:37 -0400
Received: by mail-qt1-f196.google.com with SMTP id x47so6875217qtk.11
        for <linux-media@vger.kernel.org>; Fri, 28 Jun 2019 09:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version;
        bh=G1o/8CAktliaI6C+GktSX9aIs3rAkT2b2ryD+3/MjeI=;
        b=VTvuv//sIs99sdlu/JihvFd6gKp5w74BwxUFlW3Z9aPzzfRNsK79oW5OhD9807aoTK
         mMxfLtjQX6zyP3jnSS059WQvOBKow68I/p/YlTlr0m1uqk1vrvWXgMtrqACK05lDaZae
         Mz1WW3SwToPLfMJffu0A6d+be9JTVw80ddbe1Zyp861B1oPY8HImGWpLLras+yQRBPMy
         tgPMQmKBa/9SysWydEsdM5N6xzex3//hgiGYNbNtdHO0I5cweleu+w7oTBxQHd83rfRX
         +59qIVoodNXRMydvlzF7FkoNl5v8K1AtSEyIex1gi1gBfMP4hd2wP/A69bskJcOuJrXd
         kfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version;
        bh=G1o/8CAktliaI6C+GktSX9aIs3rAkT2b2ryD+3/MjeI=;
        b=ZSyQ5rSbFU1ELpXHRSSJyTe/QRk3Yq8bLc50Sa8SiPzuqDvwF+2AA7qyCGaJ3yyzJT
         MXDeRmLtp87JXIteUAhniR3tQyJBpfNY29jvzknwHoGohqCl4AI0c2WwM4/s8fFlTXOB
         DZ/TGHnNVFY88PEPw7OFVO0+IABHdsQHOl5NdLALVCZgQsE7E42rORnHTPSqBXtpPzaR
         XZQRFEeLA5uhlFaeaK1g1tRfl8IPTPzkx0ANOYGHjFj88LkfrbdbvNx18owTtDFiqovk
         LWWU/90hbOa8oy3JbM/IZ2tf2PLaCNLpniWibg03NW1Hz0aDgMSnf18MTdsueZJOie8q
         ad7A==
X-Gm-Message-State: APjAAAW8bgNwFI5DwOheKc8oTUmVtdW9lL1/w1WnCMD1IPflFR6yIphK
        9xsyPR9v9Pt29YiGPfpHVtkH2A==
X-Google-Smtp-Source: APXvYqz1yn3GFHpCoAUtimjS/3zS7mWpMOuQIER1aZkY62aCuFFxqOr/oI9DsuiI0/j3uy6IpB27Tw==
X-Received: by 2002:a0c:b0ce:: with SMTP id p14mr8264756qvc.51.1561738716249;
        Fri, 28 Jun 2019 09:18:36 -0700 (PDT)
Received: from tpx230-nicolas.collaboramtl (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id o22sm1122685qkk.50.2019.06.28.09.18.34
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 28 Jun 2019 09:18:35 -0700 (PDT)
Message-ID: <a7a20acb4672a13e2f1225d62e5d69baf5e7231d.camel@ndufresne.ca>
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
Date:   Fri, 28 Jun 2019 12:18:33 -0400
In-Reply-To: <530f28e9-f686-6222-c6cc-9a5207b151f7@xs4all.nl>
References: <530f28e9-f686-6222-c6cc-9a5207b151f7@xs4all.nl>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-VUUMoWrvctBiQzmjR6by"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-VUUMoWrvctBiQzmjR6by
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

So in "4.5.1.7. Decoding", there is a bit of confusion. The text speaks
about ordered of frames in capture and output, but the bullet points
stays that output buffers aren't frames. The following note about
timestamps creates more confusion, since it says there is potentially,
it's not very affirmative, timestamp matching that let you detect re-
ordering done by the driver, but no clarification on how the timestamp
are to be handle if the packing is random.

What seems entirely missing in what we discussed, is a per format
clarification for the behaviour of codec. I was assuming the NAL
alignment to be documented for H264 and HEVC format. It make sense to
allow some more flexibility since these formats are bytestream with
startcodes, but to be, full-frame behaviour is what existing userspace
expects and we should make this the defacto default. And if the buffer
size ends up too small (badly predicted), I believe we should use the
source change event to allow handling that. That being said, we have
been able to survive this for a long time.

For VP8 and VP9, which don't really have a bytestream format, I do
assume it's logical to enforce full frames always. But if not, special
care is needed to ensure the driver can reconstruct the full frames,
since a firmware won't be able to parse the frame boundaries. Now, when
I saw you taking over, I thought it was clear that this was only the
common bits of the spec and that a per format specification would be
developed later.

> Specifically, the venus decoder needs to know the resolution of the coded=
 video
> beforehand and it expects a single frame per buffer (how does that work f=
or
> interlaced formats?).

If the firmware works in a 1:1 behaviour, with H264 you may have two AU
to compose 1 frame in interlaced stream (and that may change for each
frame). In HEVC you'd always have two AU.

>=20
> Such requirements mean that some userspace parsing is still required, so =
these
> decoders are not completely stateful.

There was a discussion about the meaning of the stateful/stateless.
This is not strictly related to parsing, the amount of parsing being
affected is a side effect. The stateful decoder HW (or firmware) offer
an interface with streams. It hides the state of the decoded stream. As
a side effect, the HW can only be multiplexed if the firmware handles
that. On the other end, stateless decoder offer an API where you
configure the decoding of a frame (and sometimes a slice). Two
consecutive frames do not have to be part of the same stream, which has
the side effect of allowing application to handle their own
multiplexing.

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

I just wanted to highlight that there is lot of behaviour specific to
the formats here. Specially this last one, since it implies that
capture format will be field =3D ALTERNATE for interlace decoding (this
is a relatively rare format). So the behaviour here can already be
inferred by the capture format (appart that interlace mode cannot be
enumerated, so for encoding, it's a bit of a pain to guess). And there
is already in the spec the information needed to match the pairs (or
detect lost field).

>=20
> Let's see what the results are.
>=20
> Regards,
>=20
> 	Hans

--=-VUUMoWrvctBiQzmjR6by
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXRY92QAKCRBxUwItrAao
HOBeAJ92IB5rTO3kSQuZ2md4/hwFLFrUxgCg3WshfNzzSj3ofhFl2bdu8Tql+ag=
=8DvX
-----END PGP SIGNATURE-----

--=-VUUMoWrvctBiQzmjR6by--

