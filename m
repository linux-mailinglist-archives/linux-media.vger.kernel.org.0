Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 251F67DDCC
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2019 16:24:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731988AbfHAOYW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Aug 2019 10:24:22 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:40583 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731986AbfHAOYW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Aug 2019 10:24:22 -0400
Received: by mail-qt1-f195.google.com with SMTP id a15so70357519qtn.7
        for <linux-media@vger.kernel.org>; Thu, 01 Aug 2019 07:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=8eEC/zShes7f9e4U4OX6q9Xv7PEjW7Dxj6wno+YzhLI=;
        b=OdZiidc7NJizLVznmNs2dIIh8dK5S5dQDtkV4jDgWuWYxXNGOZ+8aQzSR6fPBg8coM
         v9eQCw0SbWxdXbPG5yhdHQ8dXu8lDa5XAhAMAHV+vG/CKR7SOCcfRxij8WnSFbRaMwSo
         HMHm2eaALga5fjAvd62dESBwzoyOigYt+99DUBCSb3dHtYpw1/wcv/slpGYxxlCKpi/c
         0Pr/nH9dIIi0WZZGhqzDl6qX/pbLdYHEIaqtf2m0/3O1cGpk64YRQqf3L3cGOfYncOHO
         XNC6u23GwaVDgHoGAXjTYahJrrMXmEwNrdGJBw8YgXYOJIwaRVNSMkfsu+Awiy6fxf15
         Ag2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=8eEC/zShes7f9e4U4OX6q9Xv7PEjW7Dxj6wno+YzhLI=;
        b=VSwfNZUpHYqLglRkv7DLqlJCBLjE+HUUVmC90syhT9JLts2E+fy5EBvagBd2cwcwF/
         1/I1aHt4tDNAe8tJJvkoEaJ5nTjlSKni+0ZiqWnxuNJIlJ+Q/2bhh0VgvwGCaM6DT1x6
         pDRYki8FTRUxlyWO5ZSquQkSyik4DqLzu0Fqh2QTKbuP/1y+TCLKOpnhte3UwOGh37bL
         Y8/d31HWLzB8WeYtxl6/wCFt3zLOWI0wpi4c7CYE96UYtvfVUjUgHv9kHdXDEMTOED5J
         3LcblMYiX09kA47Ok2ewKmwcsdfKLKaQ8OJFM7aFGmnybz/xApab2h3kfay1gUVQszeI
         YWeg==
X-Gm-Message-State: APjAAAUFSKrSYiBkv1A1730PiAJPuUbFRziQghIK4Zt8ylDrbizlS17E
        RQ1THxQ/DgOymIJ6nFKmd+c=
X-Google-Smtp-Source: APXvYqzHbcBJURql6ZsgcB1jZpbeTXtvbFsnofeq3JVe0z5lFVBZvTKqUl7QW15zrdI567qfdQIKmQ==
X-Received: by 2002:ac8:2c35:: with SMTP id d50mr87396664qta.313.1564669461040;
        Thu, 01 Aug 2019 07:24:21 -0700 (PDT)
Received: from tpx230-nicolas.collaboramtl (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id o33sm33979306qtd.72.2019.08.01.07.24.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 01 Aug 2019 07:24:18 -0700 (PDT)
Message-ID: <c1b58b1169a6c6e04e6bbaf01775c67148f21ffb.camel@ndufresne.ca>
Subject: Re: [PATCH 02/14] videodev2.h: add
 V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Date:   Thu, 01 Aug 2019 10:24:15 -0400
In-Reply-To: <2d8e8a7f-144c-5ce2-8dd0-3c82248a3a83@xs4all.nl>
References: <20190724110523.29248-1-hverkuil-cisco@xs4all.nl>
         <20190724110523.29248-3-hverkuil-cisco@xs4all.nl>
         <20190727093745.GB16618@aptenodytes>
         <CAAFQd5CTcvyOe6_gETcdyvxVE6NaWmQwrgpWbTu5so_-FLYWtA@mail.gmail.com>
         <20190729131229.GB24269@aptenodytes>
         <CAAFQd5Au5+AZvSG-5p9Zp32aUUANyEi-b68wHf=g_diBw-+2BQ@mail.gmail.com>
         <2d8e8a7f-144c-5ce2-8dd0-3c82248a3a83@xs4all.nl>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-JAu0RuiAvKx2t/J1CFBq"
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-JAu0RuiAvKx2t/J1CFBq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 30 juillet 2019 =C3=A0 09:21 +0200, Hans Verkuil a =C3=A9crit :
> On 7/29/19 3:18 PM, Tomasz Figa wrote:
> > On Mon, Jul 29, 2019 at 10:12 PM Paul Kocialkowski
> > <paul.kocialkowski@bootlin.com> wrote:
> > > Hi,
> > >=20
> > > On Sun 28 Jul 19, 23:05, Tomasz Figa wrote:
> > > > On Sat, Jul 27, 2019 at 6:37 PM Paul Kocialkowski
> > > > <paul.kocialkowski@bootlin.com> wrote:
> > > > > Hi,
> > > > >=20
> > > > > On Wed 24 Jul 19, 13:05, Hans Verkuil wrote:
> > > > > > Add an enum_fmt format flag to specifically tag coded formats w=
here
> > > > > > full bitstream parsing is supported by the device.
> > > > > >=20
> > > > > > Some stateful decoders are capable of fully parsing a bitstream=
,
> > > > > > but others require that userspace pre-parses the bitstream into
> > > > > > frames or fields (see the corresponding pixelformat description=
s
> > > > > > for details).
> > > > > >=20
> > > > > > If this flag is set, then this pre-parsing step is not required
> > > > > > (but still possible, of course).
> > > > > >=20
> > > > > > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > > > > > ---
> > > > > >  Documentation/media/uapi/v4l/vidioc-enum-fmt.rst | 8 ++++++++
> > > > > >  Documentation/media/videodev2.h.rst.exceptions   | 1 +
> > > > > >  include/uapi/linux/videodev2.h                   | 5 +++--
> > > > > >  3 files changed, 12 insertions(+), 2 deletions(-)
> > > > > >=20
> > > > > > diff --git a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst b=
/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> > > > > > index 822d6730e7d2..4e24e671f32e 100644
> > > > > > --- a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> > > > > > +++ b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> > > > > > @@ -127,6 +127,14 @@ one until ``EINVAL`` is returned.
> > > > > >        - This format is not native to the device but emulated t=
hrough
> > > > > >       software (usually libv4l2), where possible try to use a n=
ative
> > > > > >       format instead for better performance.
> > > > > > +    * - ``V4L2_FMT_FLAG_HAS_BITSTREAM_PARSER``
> > > > > > +      - 0x0004
> > > > > > +      - The hardware decoder for this compressed bitstream for=
mat (aka coded
> > > > > > +     format) is capable of parsing the bitstream. Applications=
 do not
> > > > > > +     need to parse the bitstream themselves to find the bounda=
ries between
> > > > > > +     frames/fields. This flag can only be used in combination =
with the
> > > > > > +     ``V4L2_FMT_FLAG_COMPRESSED`` flag, since this applies to =
compressed
> > > > > > +     formats only.
> > > > >=20
> > > > > Should this flag be set for stateless codecs as well? It seems a =
bit over-kill
> > > > > for this case. I am not sure whether "compressed bitstream format=
" clearly only
> > > > > covers the formats used by stateful decoders and not the ones for=
 stateless
> > > > > decoders.
> > > >=20
> > > > I'd suggest using a different name for the flag, because "bitstream
> > > > parser" is actually one of the core differences between stateful an=
d
> > > > stateless. All stateful decoders have bitstream parsers, the only
> > > > difference between the implementations is the unit on which the par=
ser
> > > > operates, i.e. full stream, frame, NALU.
> > > >=20
> > > > Perhaps V4L2_FMT_FLAG_CONTINUOUS_BITSTREAM (as opposed to discrete,
> > > > framed/sliced chunks)?
> > >=20
> > > Sure, that seems like a more explicit name regarding what it's suppos=
ed to
> > > describe in my opinion.
>=20
> I like that name. And this flag is valid for stateful decoders only.

Sorry, I'm not against the name change, but it should be
V4L2_FMT_FLAG_HAS_BYTESTREAM_PARSER (BYTE). Parsers don't support
random bit alignment, so I think usage of bitstream would be miss-
leading. This is playing on words of course, H264 is a bitstream, but
what is passed to the driver is byte aligned, hence a bytestream.

>=20
> > > > Regardless of that, it doesn't make sense for a stateless decoder t=
o
> > > > set this flag anyway, because the userspace needs to parse the whol=
e
> > > > stream anyway and the whole stateless API is based on the assumptio=
n
> > > > that the userspace splits the bitstream into frames (or slices).
> > >=20
> > > Indeed, I agree that it doesn't make sense, but I thought that the na=
me of the
> > > flag could be confusing. Since there is no direct equivalency between
> > > "stateless" and "doesn't parse the bitstream" (as we've seen with the=
 rockchip
> > > decoder needing to parse the slice header on its own), that could hav=
e been
> > > ambiguous. I think the name you're suggesting mostly solves this conc=
ern.
> > >=20
> > > I'm still a bit unsure about what "compressed formats" entails or not=
, so it
> > > could be good to explicitly mention that this applies to stateful dec=
oders only
> > > (but it's just a suggestion, advanced users of the API will probably =
find it
> > > straightforward).
> >=20
> > My understanding is that a compressed format is any format that
> > doesn't have a directly accessible 2D pixel matrix in its memory
> > representation, so all the bitstream formats should have it set.
>=20
> Correct.
>=20
> Regards,
>=20
> 	Hans
>=20
> > Best regards,
> > Tomasz
> >=20

--=-JAu0RuiAvKx2t/J1CFBq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXUL2EAAKCRBxUwItrAao
HAnqAJ4jrJbDUJQZsJwKja31vVc+E9qfqACfQjyulPLY+Rq62amtX2aDZpiMklU=
=+ne+
-----END PGP SIGNATURE-----

--=-JAu0RuiAvKx2t/J1CFBq--

