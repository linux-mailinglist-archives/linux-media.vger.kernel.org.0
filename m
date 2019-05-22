Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A78F226229
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2019 12:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728438AbfEVKmx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 May 2019 06:42:53 -0400
Received: from mail-wm1-f43.google.com ([209.85.128.43]:37782 "EHLO
        mail-wm1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727464AbfEVKmx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 May 2019 06:42:53 -0400
Received: by mail-wm1-f43.google.com with SMTP id 7so1672204wmo.2
        for <linux-media@vger.kernel.org>; Wed, 22 May 2019 03:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IS1yBp/LRkbRJ2GL+fT8Mg8yRCmf+N84U+6XOmw5jGE=;
        b=FEylA9XTvBsDqgUd9ccYJkCIMN3z5FlfmbPUPOMFmAuvxeHYBDi7CPdence56MBHmC
         oGTVq8JzlnJAqtO3Zr9ToI7TWmPD0IpJ4+2Tn+rzlaFm6BOquD1m07Z2FX+W7PHOgFdN
         7wcu6Z1HZJL79vPxy6fy8q5VXJ1ioi8IBzP1jvLUXsFT2fD/OFDHDGiPAzn9yUydKhPX
         Z9zjGTFSxCpOtT/zAnNj7QprVphOiknm433xWIUYu42uNCYpho8TB9+Hzga971ok0s+E
         Li1TMaHifjKEmsB5kJKc9KsL3n30ndJkauVEMldKc1I5matGrOjcE0GU4JDKUp2DGjJ9
         vLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IS1yBp/LRkbRJ2GL+fT8Mg8yRCmf+N84U+6XOmw5jGE=;
        b=eplcXVijmxkI7T9OdssJ6a0T9DEu5qP+u5Y8xRoFe/r7oPIeJGRp9PsUM/wuQxD7yK
         m5GoZH5+YboJow3UpjXzEg2znsnJ4575QS1eMkJAhV/I6WdYuVC9AvtV5ppBaXylogW3
         vfy2WW9I0869ER5v5xDEGpLWzWEN2k+5UG+ziHsWCYwnXriZv3kFb81nLkFSAqXnbknD
         2tDmnWQsjGSA0DSGooFysiG3ephtwcUD/Ff8vjYsci3ed0VSj4cLoQsYJ1iAlu/qXMaY
         AdgyOOhKEvOmA5dycCPCa/dBLqZcXLvmKo2C7ga1JPgk/zhptrwG9Y3YgCJRk1UybqKL
         NM5w==
X-Gm-Message-State: APjAAAWPCGOcGVoZuMZjBmErGvvOlyZq4GmOJvVWoGByuzaUujzkUPpC
        YOt3Xp1Ew6gqjd+4mJlFNp0=
X-Google-Smtp-Source: APXvYqwdhP+ml9spSTgyoVAwPB64cQDEWAG7Y6icuningXy+iiK+6Ig1iEt0ajxd9raSn1QareDyoA==
X-Received: by 2002:a1c:cb82:: with SMTP id b124mr7120205wmg.107.1558521768487;
        Wed, 22 May 2019 03:42:48 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id z1sm10014645wrl.91.2019.05.22.03.42.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 May 2019 03:42:47 -0700 (PDT)
Date:   Wed, 22 May 2019 12:42:46 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
Message-ID: <20190522104246.GD30938@ulmo>
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
 <3de878d39d32280b5a83001944dd2b4aea9b3d43.camel@ndufresne.ca>
 <8bcc41efa3f477ca34a3da203a2f3fa91474e502.camel@bootlin.com>
 <2793216.N2HdOGtWhe@jernej-laptop>
 <5d9a5567eed5148fc7ade7c9a9cef5dcb48f47db.camel@bootlin.com>
 <58ef7cda93864ed88922dce76fa6ddb8dac0a38d.camel@ndufresne.ca>
 <CAAFQd5AintQedU7b1PQ3WgaO+EruLLtOWPcwVd3azTx+hiENHg@mail.gmail.com>
 <6ab029d01d532540dfb170072ca5063feaded946.camel@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8nsIa27JVQLqB7/C"
Content-Disposition: inline
In-Reply-To: <6ab029d01d532540dfb170072ca5063feaded946.camel@bootlin.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--8nsIa27JVQLqB7/C
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2019 at 10:26:28AM +0200, Paul Kocialkowski wrote:
> Hi,
>=20
> Le mercredi 22 mai 2019 =C3=A0 15:48 +0900, Tomasz Figa a =C3=A9crit :
> > On Sat, May 18, 2019 at 11:09 PM Nicolas Dufresne <nicolas@ndufresne.ca=
> wrote:
> > > Le samedi 18 mai 2019 =C3=A0 12:29 +0200, Paul Kocialkowski a =C3=A9c=
rit :
> > > > Hi,
> > > >=20
> > > > Le samedi 18 mai 2019 =C3=A0 12:04 +0200, Jernej =C5=A0krabec a =C3=
=A9crit :
> > > > > Dne sobota, 18. maj 2019 ob 11:50:37 CEST je Paul Kocialkowski na=
pisal(a):
> > > > > > Hi,
> > > > > >=20
> > > > > > On Fri, 2019-05-17 at 16:43 -0400, Nicolas Dufresne wrote:
> > > > > > > Le jeudi 16 mai 2019 =C3=A0 20:45 +0200, Paul Kocialkowski a =
=C3=A9crit :
> > > > > > > > Hi,
> > > > > > > >=20
> > > > > > > > Le jeudi 16 mai 2019 =C3=A0 14:24 -0400, Nicolas Dufresne a=
 =C3=A9crit :
> > > > > > > > > Le mercredi 15 mai 2019 =C3=A0 22:59 +0200, Paul Kocialko=
wski a =C3=A9crit :
> > > > > > > > > > Hi,
> > > > > > > > > >=20
> > > > > > > > > > Le mercredi 15 mai 2019 =C3=A0 14:54 -0400, Nicolas Duf=
resne a =C3=A9crit :
> > > > > > > > > > > Le mercredi 15 mai 2019 =C3=A0 19:42 +0200, Paul Koci=
alkowski a =C3=A9crit :
> > > > > > > > > > > > Hi,
> > > > > > > > > > > >=20
> > > > > > > > > > > > Le mercredi 15 mai 2019 =C3=A0 10:42 -0400, Nicolas=
 Dufresne a =C3=A9crit
> > > > > :
> > > > > > > > > > > > > Le mercredi 15 mai 2019 =C3=A0 12:09 +0200, Paul =
Kocialkowski a
> > > > > =C3=A9crit :
> > > > > > > > > > > > > > Hi,
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > With the Rockchip stateless VPU driver in the w=
orks, we now
> > > > > > > > > > > > > > have a
> > > > > > > > > > > > > > better idea of what the situation is like on pl=
atforms other
> > > > > > > > > > > > > > than
> > > > > > > > > > > > > > Allwinner. This email shares my conclusions abo=
ut the
> > > > > > > > > > > > > > situation and how
> > > > > > > > > > > > > > we should update the MPEG-2, H.264 and H.265 co=
ntrols
> > > > > > > > > > > > > > accordingly.
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > - Per-slice decoding
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > We've discussed this one already[0] and Hans ha=
s submitted a
> > > > > > > > > > > > > > patch[1]
> > > > > > > > > > > > > > to implement the required core bits. When we ag=
ree it looks
> > > > > > > > > > > > > > good, we
> > > > > > > > > > > > > > should lift the restriction that all slices mus=
t be
> > > > > > > > > > > > > > concatenated and
> > > > > > > > > > > > > > have them submitted as individual requests.
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > One question is what to do about other controls=
=2E I feel like
> > > > > > > > > > > > > > it would
> > > > > > > > > > > > > > make sense to always pass all the required cont=
rols for
> > > > > > > > > > > > > > decoding the
> > > > > > > > > > > > > > slice, including the ones that don't change acr=
oss slices.
> > > > > > > > > > > > > > But there
> > > > > > > > > > > > > > may be no particular advantage to this and only=
 downsides.
> > > > > > > > > > > > > > Not doing it
> > > > > > > > > > > > > > and relying on the "control cache" can work, bu=
t we need to
> > > > > > > > > > > > > > specify
> > > > > > > > > > > > > > that only a single stream can be decoded per op=
ened instance
> > > > > > > > > > > > > > of the
> > > > > > > > > > > > > > v4l2 device. This is the assumption we're going=
 with for
> > > > > > > > > > > > > > handling
> > > > > > > > > > > > > > multi-slice anyway, so it shouldn't be an issue.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > My opinion on this is that the m2m instance is a =
state, and
> > > > > > > > > > > > > the driver
> > > > > > > > > > > > > should be responsible of doing time-division mult=
iplexing
> > > > > > > > > > > > > across
> > > > > > > > > > > > > multiple m2m instance jobs. Doing the time-divisi=
on
> > > > > > > > > > > > > multiplexing in
> > > > > > > > > > > > > userspace would require some sort of daemon to wo=
rk properly
> > > > > > > > > > > > > across
> > > > > > > > > > > > > processes. I also think the kernel is better plac=
e for doing
> > > > > > > > > > > > > resource
> > > > > > > > > > > > > access scheduling in general.
> > > > > > > > > > > >=20
> > > > > > > > > > > > I agree with that yes. We always have a single m2m =
context and
> > > > > > > > > > > > specific
> > > > > > > > > > > > controls per opened device so keeping cached values=
 works out
> > > > > > > > > > > > well.
> > > > > > > > > > > >=20
> > > > > > > > > > > > So maybe we shall explicitly require that the reque=
st with the
> > > > > > > > > > > > first
> > > > > > > > > > > > slice for a frame also contains the per-frame contr=
ols.
> > > > > > > > > > > >=20
> > > > > > > > > > > > > > - Annex-B formats
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > I don't think we have really reached a conclusi=
on on the
> > > > > > > > > > > > > > pixel formats
> > > > > > > > > > > > > > we want to expose. The main issue is how to dea=
l with codecs
> > > > > > > > > > > > > > that need
> > > > > > > > > > > > > > the full slice NALU with start code, where the =
slice_header
> > > > > > > > > > > > > > is
> > > > > > > > > > > > > > duplicated in raw bitstream, when others are fi=
ne with just
> > > > > > > > > > > > > > the encoded
> > > > > > > > > > > > > > slice data and the parsed slice header control.
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > My initial thinking was that we'd need 3 format=
s:
> > > > > > > > > > > > > > - One that only takes only the slice compressed=
 data
> > > > > > > > > > > > > > (without raw slice
> > > > > > > > > > > > > > header and start code);
> > > > > > > > > > > > > > - One that takes both the NALU data (including =
start code,
> > > > > > > > > > > > > > raw header
> > > > > > > > > > > > > > and compressed data) and slice header controls;
> > > > > > > > > > > > > > - One that takes the NALU data but no slice hea=
der.
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > But I no longer think the latter really makes s=
ense in the
> > > > > > > > > > > > > > context of
> > > > > > > > > > > > > > stateless video decoding.
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > A side-note: I think we should definitely have =
data offsets
> > > > > > > > > > > > > > in every
> > > > > > > > > > > > > > case, so that implementations can just push the=
 whole NALU
> > > > > > > > > > > > > > regardless
> > > > > > > > > > > > > > of the format if they're lazy.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > I realize that I didn't share our latest research=
 on the
> > > > > > > > > > > > > subject. So a
> > > > > > > > > > > > > slice in the original bitstream is formed of the =
following
> > > > > > > > > > > > > blocks
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > (simplified):
> > > > > > > > > > > > >   [nal_header][nal_type][slice_header][slice]
> > > > > > > > > > > >=20
> > > > > > > > > > > > Thanks for the details!
> > > > > > > > > > > >=20
> > > > > > > > > > > > > nal_header:
> > > > > > > > > > > > > This one is a header used to locate the start and=
 the end of
> > > > > > > > > > > > > the of a
> > > > > > > > > > > > > NAL. There is two standard forms, the ANNEX B / s=
tart code, a
> > > > > > > > > > > > > sequence
> > > > > > > > > > > > > of 3 bytes 0x00 0x00 0x01, you'll often see 4 byt=
es, the first
> > > > > > > > > > > > > byte
> > > > > > > > > > > > > would be a leading 0 from the previous NAL paddin=
g, but this
> > > > > > > > > > > > > is also
> > > > > > > > > > > > > totally valid start code. The second form is the =
AVC form,
> > > > > > > > > > > > > notably used
> > > > > > > > > > > > > in ISOMP4 container. It simply is the size of the=
 NAL. You
> > > > > > > > > > > > > must keep
> > > > > > > > > > > > > your buffer aligned to NALs in this case as you c=
annot scan
> > > > > > > > > > > > > from random
> > > > > > > > > > > > > location.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > nal_type:
> > > > > > > > > > > > > It's a bit more then just the type, but it contai=
ns at least
> > > > > > > > > > > > > the
> > > > > > > > > > > > > information of the nal type. This has different s=
ize on H.264
> > > > > > > > > > > > > and HEVC
> > > > > > > > > > > > > but I know it's size is in bytes.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > slice_header:
> > > > > > > > > > > > > This contains per slice parameters, like the modi=
fication
> > > > > > > > > > > > > lists to
> > > > > > > > > > > > > apply on the references. This one has a size in b=
its, not in
> > > > > > > > > > > > > bytes.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > slice:
> > > > > > > > > > > > > I don't really know what is in it exactly, but th=
is is the
> > > > > > > > > > > > > data used to
> > > > > > > > > > > > > decode. This bit has a special coding called the
> > > > > > > > > > > > > anti-emulation, which
> > > > > > > > > > > > > prevents a start-code from appearing in it. This =
coding is
> > > > > > > > > > > > > present in
> > > > > > > > > > > > > both forms, ANNEX-B or AVC (in GStreamer and some=
 reference
> > > > > > > > > > > > > manual they
> > > > > > > > > > > > > call ANNEX-B the bytestream format).
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > So, what we notice is that what is currently pass=
ed through
> > > > > > > > > > > > > Cedrus
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > driver:
> > > > > > > > > > > > >   [nal_type][slice_header][slice]
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > This matches what is being passed through VA-API.=
 We can
> > > > > > > > > > > > > understand
> > > > > > > > > > > > > that stripping off the slice_header would be hard=
, since it's
> > > > > > > > > > > > > size is
> > > > > > > > > > > > > in bits. Instead we pass size and header_bit_size=
 in
> > > > > > > > > > > > > slice_params.
> > > > > > > > > > > >=20
> > > > > > > > > > > > True, there is that.
> > > > > > > > > > > >=20
> > > > > > > > > > > > > About Rockchip. RK3288 is a Hantro G1 and has a b=
it called
> > > > > > > > > > > > > start_code_e, when you turn this off, you don't n=
eed start
> > > > > > > > > > > > > code. As a
> > > > > > > > > > > > > side effect, the bitstream becomes identical. We =
do now know
> > > > > > > > > > > > > that it
> > > > > > > > > > > > > works with the ffmpeg branch implement for cedrus.
> > > > > > > > > > > >=20
> > > > > > > > > > > > Oh great, that makes life easier in the short term,=
 but I guess
> > > > > > > > > > > > the
> > > > > > > > > > > > issue could arise on another decoder sooner or late=
r.
> > > > > > > > > > > >=20
> > > > > > > > > > > > > Now what's special about Hantro G1 (also found on=
 IMX8M) is
> > > > > > > > > > > > > that it
> > > > > > > > > > > > > take care for us of reading and executing the mod=
ification
> > > > > > > > > > > > > lists found
> > > > > > > > > > > > > in the slice header. Mostly because I very dislik=
ed having to
> > > > > > > > > > > > > pass the
> > > > > > > > > > > > > p/b0/b1 parameters, is that Boris implemented in =
the driver
> > > > > > > > > > > > > the
> > > > > > > > > > > > > transformation from the DPB entries into this p/b=
0/b1 list.
> > > > > > > > > > > > > These list
> > > > > > > > > > > > > a standard, it's basically implementing 8.2.4.1 a=
nd 8.2.4.2.
> > > > > > > > > > > > > the
> > > > > > > > > > > > > following section is the execution of the modific=
ation list.
> > > > > > > > > > > > > As this
> > > > > > > > > > > > > list is not modified, it only need to be calculat=
ed per frame.
> > > > > > > > > > > > > As a
> > > > > > > > > > > > > result, we don't need these new lists, and we can=
 work with
> > > > > > > > > > > > > the same
> > > > > > > > > > > > > H264_SLICE format as Cedrus is using.
> > > > > > > > > > > >=20
> > > > > > > > > > > > Yes but I definitely think it makes more sense to p=
ass the list
> > > > > > > > > > > > modifications rather than reconstructing those in t=
he driver
> > > > > > > > > > > > from a
> > > > > > > > > > > > full list. IMO controls should stick to the bitstre=
am as close
> > > > > > > > > > > > as
> > > > > > > > > > > > possible.
> > > > > > > > > > >=20
> > > > > > > > > > > For Hantro and RKVDEC, the list of modification is pa=
rsed by the
> > > > > > > > > > > IP
> > > > > > > > > > > from the slice header bits. Just to make sure, becaus=
e I myself
> > > > > > > > > > > was
> > > > > > > > > > > confused on this before, the slice header does not co=
ntain a list
> > > > > > > > > > > of
> > > > > > > > > > > references, instead it contains a list modification t=
o be applied
> > > > > > > > > > > to
> > > > > > > > > > > the reference list. I need to check again, but to exe=
cute these
> > > > > > > > > > > modification, you need to filter and sort the referen=
ces in a
> > > > > > > > > > > specific
> > > > > > > > > > > order. This should be what is defined in the spec as =
8.2.4.1 and
> > > > > > > > > > > 8.2.4.2. Then 8.2.4.3 is the process that creates the=
 l0/l1.
> > > > > > > > > > >=20
> > > > > > > > > > > The list of references is deduced from the DPB. The D=
PB, which I
> > > > > > > > > > > thinks
> > > > > > > > > > > should be rename as "references", seems more useful t=
hen p/b0/b1,
> > > > > > > > > > > since
> > > > > > > > > > > this is the data that gives use the ability to implem=
enting glue
> > > > > > > > > > > in the
> > > > > > > > > > > driver to compensate some HW differences.
> > > > > > > > > > >=20
> > > > > > > > > > > In the case of Hantro / RKVDEC, we think it's natural=
 to build the
> > > > > > > > > > > HW
> > > > > > > > > > > specific lists (p/b0/b1) from the references rather t=
hen adding HW
> > > > > > > > > > > specific list in the decode_params structure. The fac=
t these lists
> > > > > > > > > > > are
> > > > > > > > > > > standard intermediate step of the standard is not tha=
t important.
> > > > > > > > > >=20
> > > > > > > > > > Sorry I got confused (once more) about it. Boris just e=
xplained the
> > > > > > > > > > same thing to me over IRC :) Anyway my point is that we=
 want to pass
> > > > > > > > > > what's in ffmpeg's short and long term ref lists, and n=
ame them that
> > > > > > > > > > instead of dpb.
> > > > > > > > > >=20
> > > > > > > > > > > > > Now, this is just a start. For RK3399, we have a =
different
> > > > > > > > > > > > > CODEC
> > > > > > > > > > > > > design. This one does not have the start_code_e b=
it. What the
> > > > > > > > > > > > > IP does,
> > > > > > > > > > > > > is that you give it one or more slice per buffer,=
 setup the
> > > > > > > > > > > > > params,
> > > > > > > > > > > > > start decoding, but the decoder then return the l=
ocation of
> > > > > > > > > > > > > the
> > > > > > > > > > > > > following NAL. So basically you could offload the=
 scanning of
> > > > > > > > > > > > > start
> > > > > > > > > > > > > code to the HW. That being said, with the driver =
layer in
> > > > > > > > > > > > > between, that
> > > > > > > > > > > > > would be amazingly inconvenient to use, and with =
Boyer-more
> > > > > > > > > > > > > algorithm,
> > > > > > > > > > > > > it is pretty cheap to scan this type of start-cod=
e on CPU. But
> > > > > > > > > > > > > the
> > > > > > > > > > > > > feature that this allows is to operate in frame m=
ode. In this
> > > > > > > > > > > > > mode, you
> > > > > > > > > > > > > have 1 interrupt per frame.
> > > > > > > > > > > >=20
> > > > > > > > > > > > I'm not sure there is any interest in exposing that=
 from
> > > > > > > > > > > > userspace and
> > > > > > > > > > > > my current feeling is that we should just ditch sup=
port for
> > > > > > > > > > > > per-frame
> > > > > > > > > > > > decoding altogether. I think it mixes decoding with=
 notions that
> > > > > > > > > > > > are
> > > > > > > > > > > > higher-level than decoding, but I agree it's a blur=
ry line.
> > > > > > > > > > >=20
> > > > > > > > > > > I'm not worried about this either. We can already sup=
port that by
> > > > > > > > > > > copying the bitstream internally to the driver, thoug=
h zero-copy
> > > > > > > > > > > with
> > > > > > > > > > > this would require a new format, the one we talked ab=
out,
> > > > > > > > > > > SLICE_ANNEX_B.
> > > > > > > > > >=20
> > > > > > > > > > Right, but what I'm thinking about is making that the o=
ne and only
> > > > > > > > > > format. The rationale is that it's always easier to jus=
t append a
> > > > > > > > > > start
> > > > > > > > > > code from userspace if needed. And we need a bit offset=
 to the slice
> > > > > > > > > > data part anyway, so it doesn't hurt to require a few e=
xtra bits to
> > > > > > > > > > have the whole thing that will work in every situation.
> > > > > > > > >=20
> > > > > > > > > What I'd like is to eventually allow zero-copy (aka userp=
tr) into the
> > > > > > > > > driver. If you make the start code mandatory, any decodin=
g from ISOMP4
> > > > > > > > > (.mp4, .mov) will require a full bitstream copy in usersp=
ace to add
> > > > > > > > > the
> > > > > > > > > start code (unless you hack your allocation in your demux=
er, but it's
> > > > > > > > > a
> > > > > > > > > bit complicated since this code might come from two libra=
ries). In
> > > > > > > > > ISOMP4, you have an AVC header, which is just the size of=
 the NAL that
> > > > > > > > > follows.
> > > > > > > >=20
> > > > > > > > Well, I think we have to do a copy from system memory to th=
e buffer
> > > > > > > > allocated by v4l2 anyway. Our hardware pipelines can reason=
ably be
> > > > > > > > expected not to have any MMU unit and not allow sg import a=
nyway.
> > > > > > >=20
> > > > > > > The Rockchip has an mmu. You need one copy at least indeed,
> > > > > >=20
> > > > > > Is the MMU in use currently? That can make things troublesome i=
f we run
> > > > > > into a case where the VPU has MMU and deals with scatter-gather=
 while
> > > > > > the display part doesn't. As far as I know, there's no way for
> > > > > > userspace to know whether a dma-buf-exported buffer is backed b=
y CMA or
> > > > > > by scatter-gather memory. This feels like a major issue for usi=
ng dma-
> > > > > > buf, since userspace can't predict whether a buffer exported on=
 one
> > > > > > device can be imported on another when building its pipeline.
> > > > >=20
> > > > > FYI, Allwinner H6 also has IOMMU, it's just that there is no main=
line driver
> > > > > for it yet. It is supported for display, both VPUs and some other=
 devices. I
> > > > > think no sane SoC designer would left out one or another unit wit=
hout IOMMU
> > > > > support, that just calls for troubles, as you pointed out.
> > > >=20
> > > > Right right, I've been following that from a distance :)
> > > >=20
> > > > Indeed I think it's realistic to expect that for now, but it may not
> > > > play out so well in the long term. For instance, maybe connecting a=
 USB
> > > > display would require CMA when the rest of the system can do with s=
g.
> > > >=20
> > > > I think it would really be useful for userspace to have a way to te=
st
> > > > whether a buffer can be imported from one device to another. It fee=
ls
> > > > better than indicating where the memory lives, since there are
> > > > countless cases where additional restrictions apply too.
> > >=20
> > > I don't know for the integration on the Rockchip, but I did notice the
> > > register documentation for it.
> >=20
> > All the important components in the SoC have their IOMMUs as well -
> > display controller, GPU.
> >=20
> > There is a blitter called RGA that is not behind an IOMMU, but has
> > some scatter-gather capability (with a need for the hardware sg table
> > to be physically contiguous).=20
>=20
> That's definitely good to know and justfies the need to introduce a way
> for userspace to check if a buffer can be imported from one device to
> another.

There's been a lot of discussion about this before. You may be aware of
James Jones' attempt to create an allocator library for this:

	https://github.com/cubanismo/allocator

I haven't heard an update on this for quite some time and I think it's
stagnated due to a lack of interest. However, I think the lack of
interest could be an indicator that the issue might not be pressing
enough. Luckily most SoCs are reasonably integrated, so there's usually
no issue sharing buffers between different hardware blocks.

Technically it's already possible to check for compatibility of buffers
at import time.

In the tegra-vde driver we do something along the lines of:

	sgt =3D dma_buf_map_attachment(...);
	...
	if (sgt->nents !=3D 1)
		return -EINVAL;

because we don't support an IOMMU currently. Of course its still up to
userspace to react to that in a sensible way and it may not be obvious
what to do when the import fails.

> > That said, significance of such blitters
> > nowadays is rather low, as most of the time you need a compositor on
> > the GPU anyway, which can do any transformation in the same pass as
> > the composition.
>=20
> I think that is a crucial mistake and the way I see things, this will
> have to change eventually. We cannot keep under-using the fast and
> efficient hardware components and going with the war machine that is
> the GPU in all situations. This has caused enough trouble in the
> GNU/Linux userspace display stack already and I strongly believe it has
> to stop.

Unfortunately there's really no good API to develop drivers against. All
of the 2D APIs that exist are not really efficient when implemented via
hardware-accelerated drivers. And none of the attempts at defining an
API for hardware-accelerated 2D haven't really gained any momentum.

I had looked a bit at ways to make use of some compositing hardware that
we have on Tegra (which is like a blender/blitter of a sort) and the
best thing I could find would've been to accelerate some paths in Mesa.
However that would require quite a bit of infrastructure work because it
currently completely relies on GPU shaders to accelerate those paths.

Daniel has written a very interesting bit about this, in case you
haven't seen it yet:

	https://blog.ffwll.ch/2018/08/no-2d-in-drm.html

> > > In general, the most significant gain
> > > with having iommu for CODECs is that it makes start up (and re-init)
> > > time much shorter, but also in a much more predictable duration. I do
> > > believe that the Venus driver (qualcomm) is one with solid support for
> > > this, and it's quite noticably more snappy then the others.
> >=20
> > Obviously you also get support for USERPTR if you have an IOMMU, but
> > that also has some costs - you need to pin the user pages and map to
> > the IOMMU before each frame and unmap and unpin after each frame,
> > which sometimes is more costly than actually having the userspace copy
> > to a preallocated and premapped buffer, especially for relatively
> > small contents, such as compressed bitstream.
>=20
> Heh, interesting point!

I share the same experience. Bitstream buffers are usually so small that
you can always find a physically contiguous memory region for them and a
memcpy() will be faster than the overhead of getting an IOMMU involved.
This obviously depends on the specific hardware, but there's always some
threshold before which mapping through an IOMMU just doesn't make sense
=66rom a fragmentation and/or performance point of view.

I wonder, though, if it's not possible to keep userptr buffers around
and avoid the constant mapping/unmapping. If we only performed cache
maintenance on them as necessary, perhaps that could provide a viable,
maybe even good, zero-copy mechanism.

Thierry

--8nsIa27JVQLqB7/C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzlJ6MACgkQ3SOs138+
s6H5uw//Q8+ChVw3hwU8P+onnr9BZ0kpsLiZsEU8r5lHD49FnvuKnDcOGxQo2pRl
4QkDqWlrHTGUXGXhsKpkVkjoOHFnpLII0lPMIQYNxT4oe38BozcgikrRzjJKe8rQ
7yIPDliuCmPjeoBNjxIzj8JAQ2ZBIM47xptUtVqg82ErO6lfURjrAS8CAaB4u1cO
ep5K0MpBwj30QG9IOSZjGjjl4g0dMyN1XBbAEoPdA10bp2RsFsy52JpFP6V9kgF3
pgNOO+UTUR43uWEjbM8bUcKZoS41vN2E7NkGgv7arKy/k2Nb5WKaN3X/dX3IWM7P
/Ev8kc1YO6JdtHGmei6Cvb3mki3dsrO27OkGsPkOwfIHuoGzWQQLEyfGi9fHqaJ+
uV8F7Hajs88NOW9ecEgfdLTUZCDfg3tai/MMET1XJ3eT5qFGThvTgAKOh92Zxq+E
jICEM5QY2Cy/LjpaYiJEVLtANUI5NrbIpvdA0VVLKa9aspoURm3WNUOO2+s+y1qw
q+58wo++vLQpVeTK1PYSZWmnT+YT5ZRQw9JmZcQbzFoub5fK6vD4UJr8OzIp88wU
vu7T081rcnBIGQIdSAx5ZumavwCzX10706zuMQgUun8N01os++/W54YFiFsqGYk+
CEFVdCc6KK/iBHIpIjIB4W9Zj7aFvCKlSdAFwpVuUDBWnP7c/oE=
=VB/K
-----END PGP SIGNATURE-----

--8nsIa27JVQLqB7/C--
