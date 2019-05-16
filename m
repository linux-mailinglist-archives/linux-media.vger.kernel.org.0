Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 949AE20E93
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 20:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727821AbfEPSYZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 14:24:25 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:43503 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726357AbfEPSYY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 14:24:24 -0400
Received: by mail-qt1-f193.google.com with SMTP id i26so5032422qtr.10
        for <linux-media@vger.kernel.org>; Thu, 16 May 2019 11:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=sXFa8ZIAzm+7AFxpHlO3fvjgx3OprFDTKMa94kKssfs=;
        b=X4KHDSTpAK9hcG5Vz2kJR0sBuQThewmDdLqLcfiUkQ1JL0Dtb0Kv6sHHF3y87K/eTj
         LzOsUgMntYkLQj9wFqd2nn/juGLPHRP6laO7Wreq9tLwuqd4a7ERdir7RBxy6n/Otsi0
         6CqRdcdkVYsuNQi5HQSl8rtgo6UNlwMB4u+cdLqkFyGL/QwuZwgpGxmF7kVX/9/7aW6r
         7jIhHb/SyLoVnt8l/zYai205+WQsvTJdHibBmcGpaN4lw73bmDKbldx0qIJnQbqDI9d7
         NdvT/XRATR1ZCd973x1K4fvoC9jEUo0xlN12paxeTmEoVMGV0NolPzJyYS7qYwCy3/ct
         +AuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=sXFa8ZIAzm+7AFxpHlO3fvjgx3OprFDTKMa94kKssfs=;
        b=jm1610+VOV3bAjU451Gm1Iu0k4a7vTotzw9QfKBksw5PY6yKUjyJFL1A5nJ5ypHFnM
         I5LeIMJgXVwXSNuI5SgVu/Wun045fs/FFQcPOmjqjJq0S1S1Cd3ZiLxRnVTUOlEr5GbL
         24Go7NAO4QyUXTyi9s949d9MtmRyVpct9MAJ4+sswENR4miEjvY3+7+5YMC+ZA4SKRn6
         yxq7fueqrF9L9tZ6zS6TtpQxJ2Xq7fX2m76+ZOlnLoNjMIFh4c2VnTefLDVPYXaTxtaH
         TxJY6nyN8F7xWJPF5KU5nujc7DmyUnZn1dr3hmsNvbma1iaMRdgnx/cwzJs4hYmS/X5w
         mR9w==
X-Gm-Message-State: APjAAAWlCSUEo6bNGwSfrpQHF9by95UUMzxWruFp7f9chAupIXdSilZV
        FftBqWXTQecc/x/kZ7wfBdZYfhhSydZdAL6c
X-Google-Smtp-Source: APXvYqx1HqVvOCm9LAnmfUN5w5KYRgsxGIbQwtnuTTSAybVS+2XohspWT1PscrjaoeOhjDUROskoLQ==
X-Received: by 2002:a0c:df0a:: with SMTP id g10mr41649130qvl.164.1558031063101;
        Thu, 16 May 2019 11:24:23 -0700 (PDT)
Received: from tpx230-nicolas.collaboramtl (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id o13sm3464390qtk.74.2019.05.16.11.24.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 16 May 2019 11:24:21 -0700 (PDT)
Message-ID: <1f39f90b1418ed971bfbff4f357b2631ed5fc99f.camel@ndufresne.ca>
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
Date:   Thu, 16 May 2019 14:24:20 -0400
In-Reply-To: <841578be5f11b4d34ed7cb0a4391f35603682e43.camel@bootlin.com>
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
         <3e0d6d5106e9c0c27ef4b11e64a488726ff77103.camel@ndufresne.ca>
         <39ded6d4ddf85849bf45abc94dc8e104fd4c0978.camel@bootlin.com>
         <039e3a9dafe8c518ab2498e09594642ebccbeb18.camel@ndufresne.ca>
         <841578be5f11b4d34ed7cb0a4391f35603682e43.camel@bootlin.com>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-b84nfRtAKNDCYa7zTCpj"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-b84nfRtAKNDCYa7zTCpj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 15 mai 2019 =C3=A0 22:59 +0200, Paul Kocialkowski a =C3=A9crit =
:
> Hi,
>=20
> Le mercredi 15 mai 2019 =C3=A0 14:54 -0400, Nicolas Dufresne a =C3=A9crit=
 :
> > Le mercredi 15 mai 2019 =C3=A0 19:42 +0200, Paul Kocialkowski a =C3=A9c=
rit :
> > > Hi,
> > >=20
> > > Le mercredi 15 mai 2019 =C3=A0 10:42 -0400, Nicolas Dufresne a =C3=A9=
crit :
> > > > Le mercredi 15 mai 2019 =C3=A0 12:09 +0200, Paul Kocialkowski a =C3=
=A9crit :
> > > > > Hi,
> > > > >=20
> > > > > With the Rockchip stateless VPU driver in the works, we now have =
a
> > > > > better idea of what the situation is like on platforms other than
> > > > > Allwinner. This email shares my conclusions about the situation a=
nd how
> > > > > we should update the MPEG-2, H.264 and H.265 controls accordingly=
.
> > > > >=20
> > > > > - Per-slice decoding
> > > > >=20
> > > > > We've discussed this one already[0] and Hans has submitted a patc=
h[1]
> > > > > to implement the required core bits. When we agree it looks good,=
 we
> > > > > should lift the restriction that all slices must be concatenated =
and
> > > > > have them submitted as individual requests.
> > > > >=20
> > > > > One question is what to do about other controls. I feel like it w=
ould
> > > > > make sense to always pass all the required controls for decoding =
the
> > > > > slice, including the ones that don't change across slices. But th=
ere
> > > > > may be no particular advantage to this and only downsides. Not do=
ing it
> > > > > and relying on the "control cache" can work, but we need to speci=
fy
> > > > > that only a single stream can be decoded per opened instance of t=
he
> > > > > v4l2 device. This is the assumption we're going with for handling
> > > > > multi-slice anyway, so it shouldn't be an issue.
> > > >=20
> > > > My opinion on this is that the m2m instance is a state, and the dri=
ver
> > > > should be responsible of doing time-division multiplexing across
> > > > multiple m2m instance jobs. Doing the time-division multiplexing in
> > > > userspace would require some sort of daemon to work properly across
> > > > processes. I also think the kernel is better place for doing resour=
ce
> > > > access scheduling in general.
> > >=20
> > > I agree with that yes. We always have a single m2m context and specif=
ic
> > > controls per opened device so keeping cached values works out well.
> > >=20
> > > So maybe we shall explicitly require that the request with the first
> > > slice for a frame also contains the per-frame controls.
> > >=20
> > > > > - Annex-B formats
> > > > >=20
> > > > > I don't think we have really reached a conclusion on the pixel fo=
rmats
> > > > > we want to expose. The main issue is how to deal with codecs that=
 need
> > > > > the full slice NALU with start code, where the slice_header is
> > > > > duplicated in raw bitstream, when others are fine with just the e=
ncoded
> > > > > slice data and the parsed slice header control.
> > > > >=20
> > > > > My initial thinking was that we'd need 3 formats:
> > > > > - One that only takes only the slice compressed data (without raw=
 slice
> > > > > header and start code);
> > > > > - One that takes both the NALU data (including start code, raw he=
ader
> > > > > and compressed data) and slice header controls;
> > > > > - One that takes the NALU data but no slice header.
> > > > >=20
> > > > > But I no longer think the latter really makes sense in the contex=
t of
> > > > > stateless video decoding.
> > > > >=20
> > > > > A side-note: I think we should definitely have data offsets in ev=
ery
> > > > > case, so that implementations can just push the whole NALU regard=
less
> > > > > of the format if they're lazy.
> > > >=20
> > > > I realize that I didn't share our latest research on the subject. S=
o a
> > > > slice in the original bitstream is formed of the following blocks
> > > > (simplified):
> > > >=20
> > > >   [nal_header][nal_type][slice_header][slice]
> > >=20
> > > Thanks for the details!
> > >=20
> > > > nal_header:
> > > > This one is a header used to locate the start and the end of the of=
 a
> > > > NAL. There is two standard forms, the ANNEX B / start code, a seque=
nce
> > > > of 3 bytes 0x00 0x00 0x01, you'll often see 4 bytes, the first byte
> > > > would be a leading 0 from the previous NAL padding, but this is als=
o
> > > > totally valid start code. The second form is the AVC form, notably =
used
> > > > in ISOMP4 container. It simply is the size of the NAL. You must kee=
p
> > > > your buffer aligned to NALs in this case as you cannot scan from ra=
ndom
> > > > location.
> > > >=20
> > > > nal_type:
> > > > It's a bit more then just the type, but it contains at least the
> > > > information of the nal type. This has different size on H.264 and H=
EVC
> > > > but I know it's size is in bytes.
> > > >=20
> > > > slice_header:
> > > > This contains per slice parameters, like the modification lists to
> > > > apply on the references. This one has a size in bits, not in bytes.
> > > >=20
> > > > slice:
> > > > I don't really know what is in it exactly, but this is the data use=
d to
> > > > decode. This bit has a special coding called the anti-emulation, wh=
ich
> > > > prevents a start-code from appearing in it. This coding is present =
in
> > > > both forms, ANNEX-B or AVC (in GStreamer and some reference manual =
they
> > > > call ANNEX-B the bytestream format).
> > > >=20
> > > > So, what we notice is that what is currently passed through Cedrus
> > > > driver:
> > > >   [nal_type][slice_header][slice]
> > > >=20
> > > > This matches what is being passed through VA-API. We can understand
> > > > that stripping off the slice_header would be hard, since it's size =
is
> > > > in bits. Instead we pass size and header_bit_size in slice_params.
> > >=20
> > > True, there is that.
> > >=20
> > > > About Rockchip. RK3288 is a Hantro G1 and has a bit called
> > > > start_code_e, when you turn this off, you don't need start code. As=
 a
> > > > side effect, the bitstream becomes identical. We do now know that i=
t
> > > > works with the ffmpeg branch implement for cedrus.
> > >=20
> > > Oh great, that makes life easier in the short term, but I guess the
> > > issue could arise on another decoder sooner or later.
> > >=20
> > > > Now what's special about Hantro G1 (also found on IMX8M) is that it
> > > > take care for us of reading and executing the modification lists fo=
und
> > > > in the slice header. Mostly because I very disliked having to pass =
the
> > > > p/b0/b1 parameters, is that Boris implemented in the driver the
> > > > transformation from the DPB entries into this p/b0/b1 list. These l=
ist
> > > > a standard, it's basically implementing 8.2.4.1 and 8.2.4.2. the
> > > > following section is the execution of the modification list. As thi=
s
> > > > list is not modified, it only need to be calculated per frame. As a
> > > > result, we don't need these new lists, and we can work with the sam=
e
> > > > H264_SLICE format as Cedrus is using.
> > >=20
> > > Yes but I definitely think it makes more sense to pass the list
> > > modifications rather than reconstructing those in the driver from a
> > > full list. IMO controls should stick to the bitstream as close as
> > > possible.
> >=20
> > For Hantro and RKVDEC, the list of modification is parsed by the IP
> > from the slice header bits. Just to make sure, because I myself was
> > confused on this before, the slice header does not contain a list of
> > references, instead it contains a list modification to be applied to
> > the reference list. I need to check again, but to execute these
> > modification, you need to filter and sort the references in a specific
> > order. This should be what is defined in the spec as 8.2.4.1 and
> > 8.2.4.2. Then 8.2.4.3 is the process that creates the l0/l1.
> >=20
> > The list of references is deduced from the DPB. The DPB, which I thinks
> > should be rename as "references", seems more useful then p/b0/b1, since
> > this is the data that gives use the ability to implementing glue in the
> > driver to compensate some HW differences.
> >=20
> > In the case of Hantro / RKVDEC, we think it's natural to build the HW
> > specific lists (p/b0/b1) from the references rather then adding HW
> > specific list in the decode_params structure. The fact these lists are
> > standard intermediate step of the standard is not that important.
>=20
> Sorry I got confused (once more) about it. Boris just explained the
> same thing to me over IRC :) Anyway my point is that we want to pass
> what's in ffmpeg's short and long term ref lists, and name them that
> instead of dpb.
>=20
> > > > Now, this is just a start. For RK3399, we have a different CODEC
> > > > design. This one does not have the start_code_e bit. What the IP do=
es,
> > > > is that you give it one or more slice per buffer, setup the params,
> > > > start decoding, but the decoder then return the location of the
> > > > following NAL. So basically you could offload the scanning of start
> > > > code to the HW. That being said, with the driver layer in between, =
that
> > > > would be amazingly inconvenient to use, and with Boyer-more algorit=
hm,
> > > > it is pretty cheap to scan this type of start-code on CPU. But the
> > > > feature that this allows is to operate in frame mode. In this mode,=
 you
> > > > have 1 interrupt per frame.
> > >=20
> > > I'm not sure there is any interest in exposing that from userspace an=
d
> > > my current feeling is that we should just ditch support for per-frame
> > > decoding altogether. I think it mixes decoding with notions that are
> > > higher-level than decoding, but I agree it's a blurry line.
> >=20
> > I'm not worried about this either. We can already support that by
> > copying the bitstream internally to the driver, though zero-copy with
> > this would require a new format, the one we talked about,
> > SLICE_ANNEX_B.
>=20
> Right, but what I'm thinking about is making that the one and only
> format. The rationale is that it's always easier to just append a start
> code from userspace if needed. And we need a bit offset to the slice
> data part anyway, so it doesn't hurt to require a few extra bits to
> have the whole thing that will work in every situation.

What I'd like is to eventually allow zero-copy (aka userptr) into the
driver. If you make the start code mandatory, any decoding from ISOMP4
(.mp4, .mov) will require a full bitstream copy in userspace to add the
start code (unless you hack your allocation in your demuxer, but it's a
bit complicated since this code might come from two libraries). In
ISOMP4, you have an AVC header, which is just the size of the NAL that
follows.

On the other end, the data_offset thing is likely just a thing for the
RK3399 to handle, it does not affect RK3288, Cedrus or IMX8M.

>=20
> To me the breaking point was about having the slice header both in raw
> bitstream and parsed forms. Since we agree that's fine, we might as
> well push it to its logical conclusion and include all the bits that
> can be useful.

To take your words, the bits that contain useful information starts
from the NAL type byte, exactly were the data was cut by VA-API and the
current uAPI.

>=20
> > > > But it also support slice mode, with an
> > > > interrupt per slice, which is what we decided to use.
> > >=20
> > > Easier for everyone and probably better for latency as well :)
> > >=20
> > > > So in this case, indeed we strictly require on start-code. Though, =
to
> > > > me this is not a great reason to make a new fourcc, so we will try =
and
> > > > use (data_offset =3D 3) in order to make some space for that start =
code,
> > > > and write it down in the driver. This is to be continued, we will
> > > > report back on this later. This could have some side effect in the
> > > > ability to import buffers. But most userspace don't try to do zero-=
copy=20
> > > > on the encoded size and just copy anyway.
> > > >=20
> > > > To my opinion, having a single format is a big deal, since userspac=
e
> > > > will generally be developed for one specific HW and we would endup =
with
> > > > fragmented support. What we really want to achieve is having a driv=
er
> > > > interface which works across multiple HW, and I think this is quite
> > > > possible.
> > >=20
> > > I agree with that. The more I think about it, the more I believe we
> > > should just pass the whole [nal_header][nal_type][slice_header][slice=
]
> > > and the parsed list in every scenario.
> >=20
> > What I like of the cut at nal_type, is that there is only format. If we
> > cut at nal_header, then we need to expose 2 formats. And it makes our
> > API similar to other accelerator API, so it's easy to "convert"
> > existing userspace.
>=20
> Unless we make that cut the single one and only true cut that shall
> supersed all other cuts :)

That's basically what I've been trying to do, kill this _RAW/ANNEX_B
thing and go back to our first idea.

>=20
> > > For H.265, our decoder needs some information from the NAL type too.
> > > We currently extract that in userspace and stick it to the
> > > slice_header, but maybe it would make more sense to have drivers pars=
e
> > > that info from the buffer if they need it. On the other hand, it seem=
s
> > > quite common to pass information from the NAL type, so maybe we shoul=
d
> > > either make a new control for it or have all the fields in the
> > > slice_header (which would still be wrong in terms of matching bitstre=
am
> > > description).
> >=20
> > Even in userspace, it's common to just parse this in place, it's a
> > simple mask. But yes, if we don't have it yet, we should expose the NAL
> > type, it would be cleaner.
>=20
> Right, works for me.

Ack.

>=20
> Cheers,
>=20
> Paul
>=20
> > > > > - Dropping the DPB concept in H.264/H.265
> > > > >=20
> > > > > As far as I could understand, the decoded picture buffer (DPB) is=
 a
> > > > > concept that only makes sense relative to a decoder implementatio=
n. The
> > > > > spec mentions how to manage it with the Hypothetical reference de=
coder
> > > > > (Annex C), but that's about it.
> > > > >=20
> > > > > What's really in the bitstream is the list of modified short-term=
 and
> > > > > long-term references, which is enough for every decoder.
> > > > >=20
> > > > > For this reason, I strongly believe we should stop talking about =
DPB in
> > > > > the controls and just pass these lists agremented with relevant
> > > > > information for userspace.
> > > > >=20
> > > > > I think it should be up to the driver to maintain a DPB and we co=
uld
> > > > > have helpers for common cases. For instance, the rockchip decoder=
 needs
> > > > > to keep unused entries around[2] and cedrus has the same requirem=
ent
> > > > > for H.264. However for cedrus/H.265, we don't need to do any book=
-
> > > > > keeping in particular and can manage with the lists from the bits=
tream
> > > > > directly.
> > > >=20
> > > > As discusses today, we still need to pass that list. It's being ind=
ex
> > > > by the HW to retrieve the extra information we have collected about=
 the
> > > > status of the reference frames. In the case of Hantro, which proces=
s
> > > > the modification list from the slice header for us, we also need th=
at
> > > > list to construct the unmodified list.
> > > >=20
> > > > So the problem here is just a naming problem. That list is not real=
ly a
> > > > DPB. It is just the list of long-term/short-term references with th=
e
> > > > status of these references. So maybe we could just rename as
> > > > references/reference_entry ?
> > >=20
> > > What I'd like to pass is the diff to the references list, as ffmpeg
> > > currently provides for v4l2 request and vaapi (probably vdpau too). N=
o
> > > functional change here, only that we should stop calling it a DPB,
> > > which confuses everyone.
> >=20
> > Yes.
> >=20
> > > > > - Using flags
> > > > >=20
> > > > > The current MPEG-2 controls have lots of u8 values that can be
> > > > > represented as flags. Using flags also helps with padding.
> > > > > It's unlikely that we'll get more than 64 flags, so using a u64 b=
y
> > > > > default for that sounds fine (we definitely do want to keep some =
room
> > > > > available and I don't think using 32 bits as a default is good en=
ough).
> > > > >=20
> > > > > I think H.264/HEVC per-control flags should also be moved to u64.
> > > >=20
> > > > Make sense, I guess bits (member : 1) are not allowed in uAPI right=
 ?
> > >=20
> > > Mhh, even if they are, it makes it much harder to verify 32/64 bit
> > > alignment constraints (we're dealing with 64-bit platforms that need =
to
> > > have 32-bit userspace and compat_ioctl).
> >=20
> > I see, thanks.
> >=20
> > > > > - Clear split of controls and terminology
> > > > >=20
> > > > > Some codecs have explicit NAL units that are good fits to match a=
s
> > > > > controls: e.g. slice header, pps, sps. I think we should stick to=
 the
> > > > > bitstream element names for those.
> > > > >=20
> > > > > For H.264, that would suggest the following changes:
> > > > > - renaming v4l2_ctrl_h264_decode_param to v4l2_ctrl_h264_slice_he=
ader;
> > > >=20
> > > > Oops, I think you meant slice_prams ? decode_params matches the
> > > > information found in SPS/PPS (combined?), while slice_params matche=
s
> > > > the information extracted (and executed in case of l0/l1) from the
> > > > slice headers.
> > >=20
> > > Yes you're right, I mixed them up.
> > >=20
> > > >  That being said, to me this name wasn't confusing, since
> > > > it's not just the slice header, and it's per slice.
> > >=20
> > > Mhh, what exactly remains in there and where does it originate in the
> > > bitstream? Maybe it wouldn't be too bad to have one control per actua=
l
> > > group of bitstream elements.
> > >=20
> > > > > - killing v4l2_ctrl_h264_decode_param and having the reference li=
sts
> > > > > where they belong, which seems to be slice_header;
> > > >=20
> > > > There reference list is only updated by userspace (through it's DPB=
)
> > > > base on the result of the last decoding step. I was very confused f=
or a
> > > > moment until I realize that the lists in the slice_header are just =
a
> > > > list of modification to apply to the reference list in order to pro=
duce
> > > > l0 and l1.
> > >=20
> > > Indeed, and I'm suggesting that we pass the modifications only, which
> > > would fit a slice_header control.
> >=20
> > I think I made my point why we want the dpb -> references. I'm going to
> > validate with the VA driver now, to see if the references list there is
> > usable with our code.
> >=20
> > > Cheers,
> > >=20
> > > Paul
> > >=20
> > > > > I'm up for preparing and submitting these control changes and upd=
ating
> > > > > cedrus if they seem agreeable.
> > > > >=20
> > > > > What do you think?
> > > > >=20
> > > > > Cheers,
> > > > >=20
> > > > > Paul
> > > > >=20
> > > > > [0]: https://lkml.org/lkml/2019/3/6/82
> > > > > [1]: https://patchwork.linuxtv.org/patch/55947/
> > > > > [2]: https://chromium.googlesource.com/chromiumos/third_party/ker=
nel/+/4d7cb46539a93bb6acc802f5a46acddb5aaab378
> > > > >=20
>=20
>=20

--=-b84nfRtAKNDCYa7zTCpj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXN2q1AAKCRBxUwItrAao
HOgnAJ9VY4Fv+1EoXYWmgIC7MCFrn0T3YwCfYPRXKGlHNrwQ8yrHY02aMBgfuIs=
=8bHH
-----END PGP SIGNATURE-----

--=-b84nfRtAKNDCYa7zTCpj--

