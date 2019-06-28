Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2D659F8B
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 17:49:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726990AbfF1Psy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 11:48:54 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:46850 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726905AbfF1Psx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 11:48:53 -0400
Received: by mail-qk1-f193.google.com with SMTP id x18so5173866qkn.13
        for <linux-media@vger.kernel.org>; Fri, 28 Jun 2019 08:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=yKKlZWRz6OOKLBd6COu/wsC6kYjC3StDS7y5/3szpv8=;
        b=0e92RjKtmaoqN0lvHFIULA1uPvGAV5sx2kU5XBX4PsDgLhAjpXTUdQ4/JUEOIZc4Sv
         bX3SZulXZikmRif8PLH7u15UnlU2eXBHLXfrEepwXhm/PpxW3FGJae6j/en8G+GTsMus
         WdbKU2kz7RQfaOmStVQmOIV0kci9+GVJ7rUyJOejstVytc0OQwa54jDjBnCDwN+hYNcq
         7qI5xfmvuE3Sh/BSuR7zzh/I5/HLqwwHZza/PT4T51CT1JYVzWP/JQAzztRfIjEN9Cbb
         emES/AetaQl+C8efWgpx+2mJZeP70mH9Y4pnF6cGQp1QOzbUMamuY+cc5GNpQ4zGDeT6
         3WLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=yKKlZWRz6OOKLBd6COu/wsC6kYjC3StDS7y5/3szpv8=;
        b=XCiReNv7s1Nkzs8bEur2UDQwcjB9DHYd1r9AFPl/mV0qmcqwfjlNe79P9kTPen6Nhg
         egX2VHm+4zeHU+G+48qkYBc5LOrJXQYP10YwULf2A9J63EHcuzJtTf5XtqW6UaPnTzTp
         D6N/faUEYLRDp22GuseaQsLF1XZAu4EgD2MG7MtNrNTx/EHbE8qPKPiU2Q5nw8OckNmk
         GL8U27XDxrZDhK8nZlMKc2WThBp2dx+xwqCi3VJh2tu8mTxcXT8VjyESFE8urqKZX3Oj
         sigL8qVnhrYjLKp1v8nuL3V5hr6LQftE7lS82ulSlBg/wVDUhA+WemIpBVXNd/H/JtgX
         ZGrw==
X-Gm-Message-State: APjAAAWhoGhISPvqD60h0dNHMtTZ172KVJWHW2j+0vI0FU9jKiiDCmGB
        dl/td2Bv47A45aPJYoGS0xjoTA==
X-Google-Smtp-Source: APXvYqwZhrNljZ5R2l4AbzlVmB3HOnjzcuUBOmTYIJ6y+AuKijU1q0bzu6qstHa86fdc7WNYGdUfjw==
X-Received: by 2002:a37:6357:: with SMTP id x84mr9060166qkb.393.1561736932487;
        Fri, 28 Jun 2019 08:48:52 -0700 (PDT)
Received: from tpx230-nicolas.collaboramtl (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id r17sm1098010qtf.26.2019.06.28.08.48.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 28 Jun 2019 08:48:51 -0700 (PDT)
Message-ID: <9c3fe7a71aa4c2f9c3f92fa8d7a8fe0290f51da0.camel@ndufresne.ca>
Subject: Re: [RFC] Stateful codecs and requirements for compressed formats
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Tomasz Figa <tfiga@chromium.org>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Date:   Fri, 28 Jun 2019 11:48:49 -0400
In-Reply-To: <CAAoAYcOa7ngH5pPJze+H25rDQgjeNnpKY=HWQqsGFTTrO5iFgg@mail.gmail.com>
References: <530f28e9-f686-6222-c6cc-9a5207b151f7@xs4all.nl>
         <CAAoAYcOa7ngH5pPJze+H25rDQgjeNnpKY=HWQqsGFTTrO5iFgg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-5H/CcqlGPduhBjCGjMBQ"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-5H/CcqlGPduhBjCGjMBQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 28 juin 2019 =C3=A0 16:21 +0100, Dave Stevenson a =C3=A9crit :
> Hi Hans
>=20
> On Fri, 28 Jun 2019 at 15:34, Hans Verkuil <hverkuil@xs4all.nl> wrote:
> > Hi all,
> >=20
> > I hope I Cc-ed everyone with a stake in this issue.
> >=20
> > One recurring question is how a stateful encoder fills buffers and how =
a stateful
> > decoder consumes buffers.
> >=20
> > The most generic case is that an encoder produces a bitstream and just =
fills each
> > CAPTURE buffer to the brim before continuing with the next buffer.
> >=20
> > I don't think there are drivers that do this, I believe that all driver=
s just
> > output a single compressed frame. For interlaced formats I understand i=
t is either
> > one compressed field per buffer, or two compressed fields per buffer (t=
his is
> > what I heard, I don't know if this is true).
>=20
> From the discussion that started this thread, with H264 and similar,
> does the V4L2 buffer contain just the frame data, or the SPS/PPS
> headers as well.

In existing mainline encoder driver the SPS/PPS is included in the
first frame produced. Decoders expect them to be in the first frame
queued. For decoder, this is being relaxed now that we have a mechanism
to notify the state change after the header has been processed.

>=20
> > In any case, I don't think this is specified anywhere. Please correct m=
e if I am
> > wrong.
> >=20
> > The latest stateful codec spec is here:
> >=20
> > https://hverkuil.home.xs4all.nl/codec-api/uapi/v4l/dev-mem2mem.html
> >=20
> > Assuming what I described above is indeed the case, then I think this s=
hould
> > be documented. I don't know enough if a flag is needed somewhere to des=
cribe
> > the behavior for interlaced formats, or can we leave this open and have=
 userspace
> > detect this?
> >=20
> >=20
> > For decoders it is more complicated. The stateful decoder spec is writt=
en with
> > the assumption that userspace can just fill each OUTPUT buffer to the b=
rim with
> > the compressed bitstream. I.e., no need to split at frame or other boun=
daries.
> >=20
> > See section 4.5.1.7 in the spec.
> >=20
> > But I understand that various HW decoders *do* have limitations. I woul=
d really
> > like to know about those, since that needs to be exposed to userspace s=
omehow.
> >=20
> > Specifically, the venus decoder needs to know the resolution of the cod=
ed video
> > beforehand and it expects a single frame per buffer (how does that work=
 for
> > interlaced formats?).
> >=20
> > Such requirements mean that some userspace parsing is still required, s=
o these
> > decoders are not completely stateful.
> >=20
> > Can every codec author give information about their decoder/encoder?
> >=20
> > I'll start off with my virtual codec driver:
> >=20
> > vicodec: the decoder fully parses the bitstream. The encoder produces a=
 single
> > compressed frame per buffer. This driver doesn't yet support interlaced=
 formats,
> > but when that is added it will encode one field per buffer.
>=20
> On BCM283x:
>=20
> The underlying decoder will accept anything, but giving it a single
> frame per buffer reduces latency as the bitstream parser gets kicked
> earlier. Based on previous discussions I am setting the flag so that
> it expects one compressed frame per buffer, but I don't believe it
> goes wrong should that not be the case (it'll just waste a bit of
> processing effort).
> It'll parse the headers and produce a V4L2_EVENT_SOURCE_CHANGE event
> should the capture queue format not match the stream parameters.
> Interlacing isn't supported yet (it's on the list), but I believe the
> hardware produces the equivalent to V4L2_FIELD_INTERLACED_[TB|BT].
>=20
> The encoder currently spits out the H264 SPS/PPS headers as a separate
> V4L2 buffer, and then one compressed frame per V4L2 buffer (provided
> the buffer is big enough). Should
> V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER be set, then it will repeat the
> headers in an independent V4L2 buffer before each I frame.
> I'm quite happy to amend this should we have a decent spec of what is
> required. As I've never found a spec it's been trial and error until
> now.
> There is no interlaced support available.
>=20
>   Dave

--=-5H/CcqlGPduhBjCGjMBQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXRY24QAKCRBxUwItrAao
HAZGAJ48sMFLOzWLKAC6y6spiNrX51GgAQCeOsm/sS6U99Lhr2lty7ny/LjkBD0=
=cdWl
-----END PGP SIGNATURE-----

--=-5H/CcqlGPduhBjCGjMBQ--

