Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F21321F2A
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2019 22:43:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728391AbfEQUnX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 May 2019 16:43:23 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:39049 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728072AbfEQUnX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 May 2019 16:43:23 -0400
Received: by mail-qt1-f193.google.com with SMTP id y42so9577077qtk.6
        for <linux-media@vger.kernel.org>; Fri, 17 May 2019 13:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=pwnwWoGlFW/7v+RBfTFlgzzi2IE/5FbCxoht7qYkfTk=;
        b=RWrW2RwrjQdFW3Qi5kRDvFm6bLhldLib2Rt58Sl16B46TPKxLSiaEf0YY7oMXxrzTs
         fjeisvToW4I8POSgKyd1CDcdrU4maTZ+ABlAR6iTrQh4uAGPvDw2c9I20J6FC2wttLzm
         S/Imss78sf4snQJyHwj39Hc/3Eu/EV+sCWYeck/7i1288opRjYSGW+vrJcJV+SKvRQh+
         2kCoFQO/CKb3BcKP/lLWuR/0PK+zgqAK7OfpVTZmf1B6L33fAUJJQwrjITt7OBKnuH0q
         +PHZuvQaIB2yA7l0eVfJ0Qxr7aOwNwsliDRCpGZWtBaAOoxK9pz/tbz1AvHzM+I2bj4L
         +OZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=pwnwWoGlFW/7v+RBfTFlgzzi2IE/5FbCxoht7qYkfTk=;
        b=bghSWdj5E1KA76tKkIZQrz4H0ICKq8AuGxNobZ4UKc2ouU+MrQMaJADSWKHHHYGxFY
         b61Qrs3B71EYwUdAUdbyP0KJArGwghmu2QBTR5glVNOClngOS+KVYtDHXIsIAIEHPlZb
         A17+LuBUqdso2swBmznbBTvzV2iREuGaxbQ+Q4aNFyXBQQP3XfAL4Xngj2k1+LqwZXwX
         2jrBlhSSiGeVDVVvwhPCL/+0glYej+mpH2fS+DdJnjxmNHysV32j0wVrDzcYSKTUX15V
         jCW+hE0o3b7gQ4TxPssDt33SQz45OK+HJ29zaasaNsXamFsQN0aHSproZeqa9/YEUYvP
         Frww==
X-Gm-Message-State: APjAAAX/aolpj5zloMLCQsTj0LRcyiRm/Fmht+C64aTVwL/X2nQP6wPe
        KgkrGGbXjZcatwyS7PscI4yl5sAZ+3A+aOCu
X-Google-Smtp-Source: APXvYqw9Z46K2YAwyTYhyG6YJSYTjsFgmYL1SzmYMPsplwtACpjIXHY8vkZoLmN7ZuQ5BLihhakr6Q==
X-Received: by 2002:a0c:d96c:: with SMTP id t41mr36795932qvj.232.1558125801532;
        Fri, 17 May 2019 13:43:21 -0700 (PDT)
Received: from tpx230-nicolas.collaboramtl (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id u9sm4095877qtg.91.2019.05.17.13.43.19
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 17 May 2019 13:43:19 -0700 (PDT)
Message-ID: <3de878d39d32280b5a83001944dd2b4aea9b3d43.camel@ndufresne.ca>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
Date:   Fri, 17 May 2019 16:43:17 -0400
In-Reply-To: <4510502d4c25a4a9616d4175fe09b5ca2b0761a1.camel@bootlin.com>
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
         <3e0d6d5106e9c0c27ef4b11e64a488726ff77103.camel@ndufresne.ca>
         <39ded6d4ddf85849bf45abc94dc8e104fd4c0978.camel@bootlin.com>
         <039e3a9dafe8c518ab2498e09594642ebccbeb18.camel@ndufresne.ca>
         <841578be5f11b4d34ed7cb0a4391f35603682e43.camel@bootlin.com>
         <1f39f90b1418ed971bfbff4f357b2631ed5fc99f.camel@ndufresne.ca>
         <4510502d4c25a4a9616d4175fe09b5ca2b0761a1.camel@bootlin.com>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-5CM7aDWmQDT8ttj1sV64"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-5CM7aDWmQDT8ttj1sV64
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 16 mai 2019 =C3=A0 20:45 +0200, Paul Kocialkowski a =C3=A9crit :
> Hi,
>=20
> Le jeudi 16 mai 2019 =C3=A0 14:24 -0400, Nicolas Dufresne a =C3=A9crit :
> > Le mercredi 15 mai 2019 =C3=A0 22:59 +0200, Paul Kocialkowski a =C3=A9c=
rit :
> > > Hi,
> > >=20
> > > Le mercredi 15 mai 2019 =C3=A0 14:54 -0400, Nicolas Dufresne a =C3=A9=
crit :
> > > > Le mercredi 15 mai 2019 =C3=A0 19:42 +0200, Paul Kocialkowski a =C3=
=A9crit :
> > > > > Hi,
> > > > >=20
> > > > > Le mercredi 15 mai 2019 =C3=A0 10:42 -0400, Nicolas Dufresne a =
=C3=A9crit :
> > > > > > Le mercredi 15 mai 2019 =C3=A0 12:09 +0200, Paul Kocialkowski a=
 =C3=A9crit :
> > > > > > > Hi,
> > > > > > >=20
> > > > > > > With the Rockchip stateless VPU driver in the works, we now h=
ave a
> > > > > > > better idea of what the situation is like on platforms other =
than
> > > > > > > Allwinner. This email shares my conclusions about the situati=
on and how
> > > > > > > we should update the MPEG-2, H.264 and H.265 controls accordi=
ngly.
> > > > > > >=20
> > > > > > > - Per-slice decoding
> > > > > > >=20
> > > > > > > We've discussed this one already[0] and Hans has submitted a =
patch[1]
> > > > > > > to implement the required core bits. When we agree it looks g=
ood, we
> > > > > > > should lift the restriction that all slices must be concatena=
ted and
> > > > > > > have them submitted as individual requests.
> > > > > > >=20
> > > > > > > One question is what to do about other controls. I feel like =
it would
> > > > > > > make sense to always pass all the required controls for decod=
ing the
> > > > > > > slice, including the ones that don't change across slices. Bu=
t there
> > > > > > > may be no particular advantage to this and only downsides. No=
t doing it
> > > > > > > and relying on the "control cache" can work, but we need to s=
pecify
> > > > > > > that only a single stream can be decoded per opened instance =
of the
> > > > > > > v4l2 device. This is the assumption we're going with for hand=
ling
> > > > > > > multi-slice anyway, so it shouldn't be an issue.
> > > > > >=20
> > > > > > My opinion on this is that the m2m instance is a state, and the=
 driver
> > > > > > should be responsible of doing time-division multiplexing acros=
s
> > > > > > multiple m2m instance jobs. Doing the time-division multiplexin=
g in
> > > > > > userspace would require some sort of daemon to work properly ac=
ross
> > > > > > processes. I also think the kernel is better place for doing re=
source
> > > > > > access scheduling in general.
> > > > >=20
> > > > > I agree with that yes. We always have a single m2m context and sp=
ecific
> > > > > controls per opened device so keeping cached values works out wel=
l.
> > > > >=20
> > > > > So maybe we shall explicitly require that the request with the fi=
rst
> > > > > slice for a frame also contains the per-frame controls.
> > > > >=20
> > > > > > > - Annex-B formats
> > > > > > >=20
> > > > > > > I don't think we have really reached a conclusion on the pixe=
l formats
> > > > > > > we want to expose. The main issue is how to deal with codecs =
that need
> > > > > > > the full slice NALU with start code, where the slice_header i=
s
> > > > > > > duplicated in raw bitstream, when others are fine with just t=
he encoded
> > > > > > > slice data and the parsed slice header control.
> > > > > > >=20
> > > > > > > My initial thinking was that we'd need 3 formats:
> > > > > > > - One that only takes only the slice compressed data (without=
 raw slice
> > > > > > > header and start code);
> > > > > > > - One that takes both the NALU data (including start code, ra=
w header
> > > > > > > and compressed data) and slice header controls;
> > > > > > > - One that takes the NALU data but no slice header.
> > > > > > >=20
> > > > > > > But I no longer think the latter really makes sense in the co=
ntext of
> > > > > > > stateless video decoding.
> > > > > > >=20
> > > > > > > A side-note: I think we should definitely have data offsets i=
n every
> > > > > > > case, so that implementations can just push the whole NALU re=
gardless
> > > > > > > of the format if they're lazy.
> > > > > >=20
> > > > > > I realize that I didn't share our latest research on the subjec=
t. So a
> > > > > > slice in the original bitstream is formed of the following bloc=
ks
> > > > > > (simplified):
> > > > > >=20
> > > > > >   [nal_header][nal_type][slice_header][slice]
> > > > >=20
> > > > > Thanks for the details!
> > > > >=20
> > > > > > nal_header:
> > > > > > This one is a header used to locate the start and the end of th=
e of a
> > > > > > NAL. There is two standard forms, the ANNEX B / start code, a s=
equence
> > > > > > of 3 bytes 0x00 0x00 0x01, you'll often see 4 bytes, the first =
byte
> > > > > > would be a leading 0 from the previous NAL padding, but this is=
 also
> > > > > > totally valid start code. The second form is the AVC form, nota=
bly used
> > > > > > in ISOMP4 container. It simply is the size of the NAL. You must=
 keep
> > > > > > your buffer aligned to NALs in this case as you cannot scan fro=
m random
> > > > > > location.
> > > > > >=20
> > > > > > nal_type:
> > > > > > It's a bit more then just the type, but it contains at least th=
e
> > > > > > information of the nal type. This has different size on H.264 a=
nd HEVC
> > > > > > but I know it's size is in bytes.
> > > > > >=20
> > > > > > slice_header:
> > > > > > This contains per slice parameters, like the modification lists=
 to
> > > > > > apply on the references. This one has a size in bits, not in by=
tes.
> > > > > >=20
> > > > > > slice:
> > > > > > I don't really know what is in it exactly, but this is the data=
 used to
> > > > > > decode. This bit has a special coding called the anti-emulation=
, which
> > > > > > prevents a start-code from appearing in it. This coding is pres=
ent in
> > > > > > both forms, ANNEX-B or AVC (in GStreamer and some reference man=
ual they
> > > > > > call ANNEX-B the bytestream format).
> > > > > >=20
> > > > > > So, what we notice is that what is currently passed through Ced=
rus
> > > > > > driver:
> > > > > >   [nal_type][slice_header][slice]
> > > > > >=20
> > > > > > This matches what is being passed through VA-API. We can unders=
tand
> > > > > > that stripping off the slice_header would be hard, since it's s=
ize is
> > > > > > in bits. Instead we pass size and header_bit_size in slice_para=
ms.
> > > > >=20
> > > > > True, there is that.
> > > > >=20
> > > > > > About Rockchip. RK3288 is a Hantro G1 and has a bit called
> > > > > > start_code_e, when you turn this off, you don't need start code=
. As a
> > > > > > side effect, the bitstream becomes identical. We do now know th=
at it
> > > > > > works with the ffmpeg branch implement for cedrus.
> > > > >=20
> > > > > Oh great, that makes life easier in the short term, but I guess t=
he
> > > > > issue could arise on another decoder sooner or later.
> > > > >=20
> > > > > > Now what's special about Hantro G1 (also found on IMX8M) is tha=
t it
> > > > > > take care for us of reading and executing the modification list=
s found
> > > > > > in the slice header. Mostly because I very disliked having to p=
ass the
> > > > > > p/b0/b1 parameters, is that Boris implemented in the driver the
> > > > > > transformation from the DPB entries into this p/b0/b1 list. The=
se list
> > > > > > a standard, it's basically implementing 8.2.4.1 and 8.2.4.2. th=
e
> > > > > > following section is the execution of the modification list. As=
 this
> > > > > > list is not modified, it only need to be calculated per frame. =
As a
> > > > > > result, we don't need these new lists, and we can work with the=
 same
> > > > > > H264_SLICE format as Cedrus is using.
> > > > >=20
> > > > > Yes but I definitely think it makes more sense to pass the list
> > > > > modifications rather than reconstructing those in the driver from=
 a
> > > > > full list. IMO controls should stick to the bitstream as close as
> > > > > possible.
> > > >=20
> > > > For Hantro and RKVDEC, the list of modification is parsed by the IP
> > > > from the slice header bits. Just to make sure, because I myself was
> > > > confused on this before, the slice header does not contain a list o=
f
> > > > references, instead it contains a list modification to be applied t=
o
> > > > the reference list. I need to check again, but to execute these
> > > > modification, you need to filter and sort the references in a speci=
fic
> > > > order. This should be what is defined in the spec as 8.2.4.1 and
> > > > 8.2.4.2. Then 8.2.4.3 is the process that creates the l0/l1.
> > > >=20
> > > > The list of references is deduced from the DPB. The DPB, which I th=
inks
> > > > should be rename as "references", seems more useful then p/b0/b1, s=
ince
> > > > this is the data that gives use the ability to implementing glue in=
 the
> > > > driver to compensate some HW differences.
> > > >=20
> > > > In the case of Hantro / RKVDEC, we think it's natural to build the =
HW
> > > > specific lists (p/b0/b1) from the references rather then adding HW
> > > > specific list in the decode_params structure. The fact these lists =
are
> > > > standard intermediate step of the standard is not that important.
> > >=20
> > > Sorry I got confused (once more) about it. Boris just explained the
> > > same thing to me over IRC :) Anyway my point is that we want to pass
> > > what's in ffmpeg's short and long term ref lists, and name them that
> > > instead of dpb.
> > >=20
> > > > > > Now, this is just a start. For RK3399, we have a different CODE=
C
> > > > > > design. This one does not have the start_code_e bit. What the I=
P does,
> > > > > > is that you give it one or more slice per buffer, setup the par=
ams,
> > > > > > start decoding, but the decoder then return the location of the
> > > > > > following NAL. So basically you could offload the scanning of s=
tart
> > > > > > code to the HW. That being said, with the driver layer in betwe=
en, that
> > > > > > would be amazingly inconvenient to use, and with Boyer-more alg=
orithm,
> > > > > > it is pretty cheap to scan this type of start-code on CPU. But =
the
> > > > > > feature that this allows is to operate in frame mode. In this m=
ode, you
> > > > > > have 1 interrupt per frame.
> > > > >=20
> > > > > I'm not sure there is any interest in exposing that from userspac=
e and
> > > > > my current feeling is that we should just ditch support for per-f=
rame
> > > > > decoding altogether. I think it mixes decoding with notions that =
are
> > > > > higher-level than decoding, but I agree it's a blurry line.
> > > >=20
> > > > I'm not worried about this either. We can already support that by
> > > > copying the bitstream internally to the driver, though zero-copy wi=
th
> > > > this would require a new format, the one we talked about,
> > > > SLICE_ANNEX_B.
> > >=20
> > > Right, but what I'm thinking about is making that the one and only
> > > format. The rationale is that it's always easier to just append a sta=
rt
> > > code from userspace if needed. And we need a bit offset to the slice
> > > data part anyway, so it doesn't hurt to require a few extra bits to
> > > have the whole thing that will work in every situation.
> >=20
> > What I'd like is to eventually allow zero-copy (aka userptr) into the
> > driver. If you make the start code mandatory, any decoding from ISOMP4
> > (.mp4, .mov) will require a full bitstream copy in userspace to add the
> > start code (unless you hack your allocation in your demuxer, but it's a
> > bit complicated since this code might come from two libraries). In
> > ISOMP4, you have an AVC header, which is just the size of the NAL that
> > follows.
>=20
> Well, I think we have to do a copy from system memory to the buffer
> allocated by v4l2 anyway. Our hardware pipelines can reasonably be
> expected not to have any MMU unit and not allow sg import anyway.

The Rockchip has an mmu. You need one copy at least indeed, e.g. file
to mem, or udpsocket to mem. But right now, let's say with ffmpeg/mpeg-
ts, first you need to copy the MPEG TS to mem, then to demux you copy
that H264 stream to another buffer, you then copy in the parser,
removing the start-code and finally copy in the accelerator, adding the
start code. If the driver would allow userptr, it would be unusable.

GStreamer on the other side implement lazy conversion, so it would copy
the mpegts to mem, copy to demux, aggregate (with lazy merging) in the
parser (but stream format is negotiation, so it keeps the start-code).
If you request alignment=3Dau, you have full frame of buffers, so if your
driver could do userptr, you can same that extra copy.

Now, if we demux an MP4 it's the same, the parser will need do a full
copy instead of lazy aggregation in order to prepend the start code
(since it had an AVC header). But userptr could save a copy.

If the driver requires no nal prefix, then we could just pass a
slightly forward point to userptr and avoid ACV to ANNEX-B conversion,
which is a bit slower (even know it's nothing compare to the full
copies we already do.

That was my argument in favour for no NAL prefix in term of efficiency,
and it does not prevent adding a control to enable start-code for cases
it make sense.

>=20
> So with that in mind, asking userspace to add a startcode it already
> knows doesn't seem to be asking too much.
>=20
> > On the other end, the data_offset thing is likely just a thing for the
> > RK3399 to handle, it does not affect RK3288, Cedrus or IMX8M.
>=20
> Well, I think it's best to be fool-proof here and just require that
> start code. We should also have per-slice bit offsets to the different
> parts anyway, so drivers that don't need it can just ignore it.
>=20
> In extreme cases where there is some interest in doing direct buffer
> import without doing a copy in userspace, userspace could trick the
> format and avoid a copy by not providing the start-code (assuming it
> knows it doesn't need it) and specifying the bit offsets accordingly.
> That'd be a hack for better performance, and it feels better to do
> things in this order rather than having to hack around in the drivers
> that need the start code in every other case.

So basically, you and Tomas are both strongly in favour of adding
ANNEX-B start-code to the current uAPI. I have digged into Cedrus
registers, and it seems that it does have start-code scanning support.
I'm not sure it can do "full-frame" decoding, 1 interrupt per frame
like the RK do. That requires the IP to deal with the modifications
lists, which are per slices.

My question is, are you willing to adapt the Cedrus driver to support
receiving start-code ? And will this have a performance impact or not ?
On RK side, it's really just about flipping 1 bit.

On the Rockchip side, Tomas had concern about CPU wakeup and the fact
that we didn't aim at supporting passing multiple slices at once to the
IP (something RK supports). It's important to understand that multi-
slice streams are relatively rare and mostly used for low-latency /
video conferencing. So aggregating in these case defeats the purpose of
using slices. So I think RK feature is not very important.

Of course, I do believe that long term we will want to expose bot
stream formats on RK (because the HW can do that), so then userspace
can just pick the best when available. So that boils down to our first
idea, shall we expose _SLICE_A and _SLICE_B or something like this ?
Now that we have progressed on the matter, I'm quite in favour of
having _SLICE in the first place, with the preferred format that
everyone should support, and allow for variants later. Now, if we make
one mandatory, we could also just have a menu control to allow other
formats.

>=20
> > > To me the breaking point was about having the slice header both in ra=
w
> > > bitstream and parsed forms. Since we agree that's fine, we might as
> > > well push it to its logical conclusion and include all the bits that
> > > can be useful.
> >=20
> > To take your words, the bits that contain useful information starts
> > from the NAL type byte, exactly were the data was cut by VA-API and the
> > current uAPI.
>=20
> Agreed, but I think that the advantages of always requiring the start
> code outweigh the potential (yet quite unlikely) downsides.
>=20
> > > > > > But it also support slice mode, with an
> > > > > > interrupt per slice, which is what we decided to use.
> > > > >=20
> > > > > Easier for everyone and probably better for latency as well :)
> > > > >=20
> > > > > > So in this case, indeed we strictly require on start-code. Thou=
gh, to
> > > > > > me this is not a great reason to make a new fourcc, so we will =
try and
> > > > > > use (data_offset =3D 3) in order to make some space for that st=
art code,
> > > > > > and write it down in the driver. This is to be continued, we wi=
ll
> > > > > > report back on this later. This could have some side effect in =
the
> > > > > > ability to import buffers. But most userspace don't try to do z=
ero-copy=20
> > > > > > on the encoded size and just copy anyway.
> > > > > >=20
> > > > > > To my opinion, having a single format is a big deal, since user=
space
> > > > > > will generally be developed for one specific HW and we would en=
dup with
> > > > > > fragmented support. What we really want to achieve is having a =
driver
> > > > > > interface which works across multiple HW, and I think this is q=
uite
> > > > > > possible.
> > > > >=20
> > > > > I agree with that. The more I think about it, the more I believe =
we
> > > > > should just pass the whole [nal_header][nal_type][slice_header][s=
lice]
> > > > > and the parsed list in every scenario.
> > > >=20
> > > > What I like of the cut at nal_type, is that there is only format. I=
f we
> > > > cut at nal_header, then we need to expose 2 formats. And it makes o=
ur
> > > > API similar to other accelerator API, so it's easy to "convert"
> > > > existing userspace.
> > >=20
> > > Unless we make that cut the single one and only true cut that shall
> > > supersed all other cuts :)
> >=20
> > That's basically what I've been trying to do, kill this _RAW/ANNEX_B
> > thing and go back to our first idea.
>=20
> Right, in the end I think we should go with:
> V4L2_PIX_FMT_MPEG2_SLICE
> V4L2_PIX_FMT_H264_SLICE
> V4L2_PIX_FMT_HEVC_SLICE
>=20
> And just require raw bitstream for the slice with emulation-prevention
> bits included.

That's should be the set of format we start with indeed. The single
format for which software gets written and tested, making sure software
support is not fragmented, and other variants should be something to
opt-in.

>=20
> Cheers,
>=20
> Paul
>=20
> > > > > For H.265, our decoder needs some information from the NAL type t=
oo.
> > > > > We currently extract that in userspace and stick it to the
> > > > > slice_header, but maybe it would make more sense to have drivers =
parse
> > > > > that info from the buffer if they need it. On the other hand, it =
seems
> > > > > quite common to pass information from the NAL type, so maybe we s=
hould
> > > > > either make a new control for it or have all the fields in the
> > > > > slice_header (which would still be wrong in terms of matching bit=
stream
> > > > > description).
> > > >=20
> > > > Even in userspace, it's common to just parse this in place, it's a
> > > > simple mask. But yes, if we don't have it yet, we should expose the=
 NAL
> > > > type, it would be cleaner.
> > >=20
> > > Right, works for me.
> >=20
> > Ack.
> >=20
> > > Cheers,
> > >=20
> > > Paul
> > >=20
> > > > > > > - Dropping the DPB concept in H.264/H.265
> > > > > > >=20
> > > > > > > As far as I could understand, the decoded picture buffer (DPB=
) is a
> > > > > > > concept that only makes sense relative to a decoder implement=
ation. The
> > > > > > > spec mentions how to manage it with the Hypothetical referenc=
e decoder
> > > > > > > (Annex C), but that's about it.
> > > > > > >=20
> > > > > > > What's really in the bitstream is the list of modified short-=
term and
> > > > > > > long-term references, which is enough for every decoder.
> > > > > > >=20
> > > > > > > For this reason, I strongly believe we should stop talking ab=
out DPB in
> > > > > > > the controls and just pass these lists agremented with releva=
nt
> > > > > > > information for userspace.
> > > > > > >=20
> > > > > > > I think it should be up to the driver to maintain a DPB and w=
e could
> > > > > > > have helpers for common cases. For instance, the rockchip dec=
oder needs
> > > > > > > to keep unused entries around[2] and cedrus has the same requ=
irement
> > > > > > > for H.264. However for cedrus/H.265, we don't need to do any =
book-
> > > > > > > keeping in particular and can manage with the lists from the =
bitstream
> > > > > > > directly.
> > > > > >=20
> > > > > > As discusses today, we still need to pass that list. It's being=
 index
> > > > > > by the HW to retrieve the extra information we have collected a=
bout the
> > > > > > status of the reference frames. In the case of Hantro, which pr=
ocess
> > > > > > the modification list from the slice header for us, we also nee=
d that
> > > > > > list to construct the unmodified list.
> > > > > >=20
> > > > > > So the problem here is just a naming problem. That list is not =
really a
> > > > > > DPB. It is just the list of long-term/short-term references wit=
h the
> > > > > > status of these references. So maybe we could just rename as
> > > > > > references/reference_entry ?
> > > > >=20
> > > > > What I'd like to pass is the diff to the references list, as ffmp=
eg
> > > > > currently provides for v4l2 request and vaapi (probably vdpau too=
). No
> > > > > functional change here, only that we should stop calling it a DPB=
,
> > > > > which confuses everyone.
> > > >=20
> > > > Yes.
> > > >=20
> > > > > > > - Using flags
> > > > > > >=20
> > > > > > > The current MPEG-2 controls have lots of u8 values that can b=
e
> > > > > > > represented as flags. Using flags also helps with padding.
> > > > > > > It's unlikely that we'll get more than 64 flags, so using a u=
64 by
> > > > > > > default for that sounds fine (we definitely do want to keep s=
ome room
> > > > > > > available and I don't think using 32 bits as a default is goo=
d enough).
> > > > > > >=20
> > > > > > > I think H.264/HEVC per-control flags should also be moved to =
u64.
> > > > > >=20
> > > > > > Make sense, I guess bits (member : 1) are not allowed in uAPI r=
ight ?
> > > > >=20
> > > > > Mhh, even if they are, it makes it much harder to verify 32/64 bi=
t
> > > > > alignment constraints (we're dealing with 64-bit platforms that n=
eed to
> > > > > have 32-bit userspace and compat_ioctl).
> > > >=20
> > > > I see, thanks.
> > > >=20
> > > > > > > - Clear split of controls and terminology
> > > > > > >=20
> > > > > > > Some codecs have explicit NAL units that are good fits to mat=
ch as
> > > > > > > controls: e.g. slice header, pps, sps. I think we should stic=
k to the
> > > > > > > bitstream element names for those.
> > > > > > >=20
> > > > > > > For H.264, that would suggest the following changes:
> > > > > > > - renaming v4l2_ctrl_h264_decode_param to v4l2_ctrl_h264_slic=
e_header;
> > > > > >=20
> > > > > > Oops, I think you meant slice_prams ? decode_params matches the
> > > > > > information found in SPS/PPS (combined?), while slice_params ma=
tches
> > > > > > the information extracted (and executed in case of l0/l1) from =
the
> > > > > > slice headers.
> > > > >=20
> > > > > Yes you're right, I mixed them up.
> > > > >=20
> > > > > >  That being said, to me this name wasn't confusing, since
> > > > > > it's not just the slice header, and it's per slice.
> > > > >=20
> > > > > Mhh, what exactly remains in there and where does it originate in=
 the
> > > > > bitstream? Maybe it wouldn't be too bad to have one control per a=
ctual
> > > > > group of bitstream elements.
> > > > >=20
> > > > > > > - killing v4l2_ctrl_h264_decode_param and having the referenc=
e lists
> > > > > > > where they belong, which seems to be slice_header;
> > > > > >=20
> > > > > > There reference list is only updated by userspace (through it's=
 DPB)
> > > > > > base on the result of the last decoding step. I was very confus=
ed for a
> > > > > > moment until I realize that the lists in the slice_header are j=
ust a
> > > > > > list of modification to apply to the reference list in order to=
 produce
> > > > > > l0 and l1.
> > > > >=20
> > > > > Indeed, and I'm suggesting that we pass the modifications only, w=
hich
> > > > > would fit a slice_header control.
> > > >=20
> > > > I think I made my point why we want the dpb -> references. I'm goin=
g to
> > > > validate with the VA driver now, to see if the references list ther=
e is
> > > > usable with our code.
> > > >=20
> > > > > Cheers,
> > > > >=20
> > > > > Paul
> > > > >=20
> > > > > > > I'm up for preparing and submitting these control changes and=
 updating
> > > > > > > cedrus if they seem agreeable.
> > > > > > >=20
> > > > > > > What do you think?
> > > > > > >=20
> > > > > > > Cheers,
> > > > > > >=20
> > > > > > > Paul
> > > > > > >=20
> > > > > > > [0]: https://lkml.org/lkml/2019/3/6/82
> > > > > > > [1]: https://patchwork.linuxtv.org/patch/55947/
> > > > > > > [2]: https://chromium.googlesource.com/chromiumos/third_party=
/kernel/+/4d7cb46539a93bb6acc802f5a46acddb5aaab378
> > > > > > >=20

--=-5CM7aDWmQDT8ttj1sV64
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXN8c5QAKCRBxUwItrAao
HFNQAJ9tFl+23RGsxLyfbXt0IHYABN0BBwCeOtoDuPLChY3PvzgADfNYNdQe6no=
=P4Eh
-----END PGP SIGNATURE-----

--=-5CM7aDWmQDT8ttj1sV64--

