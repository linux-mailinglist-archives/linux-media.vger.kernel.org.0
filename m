Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4023025577
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2019 18:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727969AbfEUQXv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 May 2019 12:23:51 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:46092 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727817AbfEUQXv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 May 2019 12:23:51 -0400
Received: by mail-qt1-f193.google.com with SMTP id z19so21123862qtz.13
        for <linux-media@vger.kernel.org>; Tue, 21 May 2019 09:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=Zu90A91WwUXyZOsVghrLmZTT67VyUcfdJlRALIwIsjU=;
        b=r/nnkaExMCHrKxjvGZ60vNYrt+vRZt4MjcDHAbnuBALVBTHVZNf/xoFOcxS71Pc/sI
         wc2fVl9PdD7V4uXRwPP3s5cSue8/sS1qydWtFcusYmXoeB5xsvqkMVAwrKnVQwWbATCo
         VAWfvZEy0GikckHA9EN18q7GUW5rJF0EW03OtUqaxipqDFquGfDAOG39ziwZknhYknOH
         04Tziornl7TWt8D42GE86fxWjFW3nHYo4qTO4jwtnuDC603vIDMJ9jHIsE84A0mEhjIP
         K22cg1eX5SnX8u/Tv/Y3TtqrezEurnq27oyQMO43WmZH0tdu761lUoeXqXjo24Gknlgb
         cqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=Zu90A91WwUXyZOsVghrLmZTT67VyUcfdJlRALIwIsjU=;
        b=YKx76N+gnTs1eV5ahCz9cnXnUK8HDQFiSZ3KCXP2ZNSZAdgprWPHxsXiJQYS67MEwq
         xdzto9ksQ4C84uYEcLxwrHm6mtEm2Fyh+WpSTRl4XThcYuJXvqycc9Vd7wBUnHS5Ql10
         8zCkuE6KAjQRP8u3T+LsOhhvL4xzAa2LKH8N+UmZENBksm7UKECEGZ9+2Y+8nVsT1oDM
         UZK/lId/7FdgLu3Bku4t+bS19Xu0ftdkz9Sz0Y8g9ilT0BZSdEJhjy4wbO6EzmP609ml
         Koor7mNtNcKozkT0iAyin5x1V8Fyu4IL4kT6iNXdPBDb+FmpAraWofB5P+GsfiSsyG2q
         J+TQ==
X-Gm-Message-State: APjAAAW5HcBuQ9ynmVQDrpK7giOeMTmvY8F+uUogfSkgPGM09XUTg/SB
        eyLkgesDvWuruvaos22sU4j2kg==
X-Google-Smtp-Source: APXvYqztU5C70qpqGeK7a5bb+5CgUQBdpGxukHFFnMBzPKq0AqIiomiXfk2M4PUBBd59PQZ2j/CKig==
X-Received: by 2002:a0c:ed29:: with SMTP id u9mr8337506qvq.205.1558455829646;
        Tue, 21 May 2019 09:23:49 -0700 (PDT)
Received: from tpx230-nicolas.collaboramtl (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id t2sm9848350qkm.11.2019.05.21.09.23.47
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 21 May 2019 09:23:48 -0700 (PDT)
Message-ID: <124db795c1ed77854be6c565092c2820776ac223.camel@ndufresne.ca>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
Date:   Tue, 21 May 2019 12:23:46 -0400
In-Reply-To: <20190521154358.GC7098@ulmo>
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
         <3e0d6d5106e9c0c27ef4b11e64a488726ff77103.camel@ndufresne.ca>
         <39ded6d4ddf85849bf45abc94dc8e104fd4c0978.camel@bootlin.com>
         <20190521154358.GC7098@ulmo>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-omXPVr4llaUbbqq9pfeG"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-omXPVr4llaUbbqq9pfeG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 21 mai 2019 =C3=A0 17:43 +0200, Thierry Reding a =C3=A9crit :
> On Wed, May 15, 2019 at 07:42:50PM +0200, Paul Kocialkowski wrote:
> > Hi,
> >=20
> > Le mercredi 15 mai 2019 =C3=A0 10:42 -0400, Nicolas Dufresne a =C3=A9cr=
it :
> > > Le mercredi 15 mai 2019 =C3=A0 12:09 +0200, Paul Kocialkowski a =C3=
=A9crit :
> > > > Hi,
> > > >=20
> > > > With the Rockchip stateless VPU driver in the works, we now have a
> > > > better idea of what the situation is like on platforms other than
> > > > Allwinner. This email shares my conclusions about the situation and=
 how
> > > > we should update the MPEG-2, H.264 and H.265 controls accordingly.
> > > >=20
> > > > - Per-slice decoding
> > > >=20
> > > > We've discussed this one already[0] and Hans has submitted a patch[=
1]
> > > > to implement the required core bits. When we agree it looks good, w=
e
> > > > should lift the restriction that all slices must be concatenated an=
d
> > > > have them submitted as individual requests.
> > > >=20
> > > > One question is what to do about other controls. I feel like it wou=
ld
> > > > make sense to always pass all the required controls for decoding th=
e
> > > > slice, including the ones that don't change across slices. But ther=
e
> > > > may be no particular advantage to this and only downsides. Not doin=
g it
> > > > and relying on the "control cache" can work, but we need to specify
> > > > that only a single stream can be decoded per opened instance of the
> > > > v4l2 device. This is the assumption we're going with for handling
> > > > multi-slice anyway, so it shouldn't be an issue.
> > >=20
> > > My opinion on this is that the m2m instance is a state, and the drive=
r
> > > should be responsible of doing time-division multiplexing across
> > > multiple m2m instance jobs. Doing the time-division multiplexing in
> > > userspace would require some sort of daemon to work properly across
> > > processes. I also think the kernel is better place for doing resource
> > > access scheduling in general.
> >=20
> > I agree with that yes. We always have a single m2m context and specific
> > controls per opened device so keeping cached values works out well.
> >=20
> > So maybe we shall explicitly require that the request with the first
> > slice for a frame also contains the per-frame controls.
> >=20
> > > > - Annex-B formats
> > > >=20
> > > > I don't think we have really reached a conclusion on the pixel form=
ats
> > > > we want to expose. The main issue is how to deal with codecs that n=
eed
> > > > the full slice NALU with start code, where the slice_header is
> > > > duplicated in raw bitstream, when others are fine with just the enc=
oded
> > > > slice data and the parsed slice header control.
> > > >=20
> > > > My initial thinking was that we'd need 3 formats:
> > > > - One that only takes only the slice compressed data (without raw s=
lice
> > > > header and start code);
> > > > - One that takes both the NALU data (including start code, raw head=
er
> > > > and compressed data) and slice header controls;
> > > > - One that takes the NALU data but no slice header.
> > > >=20
> > > > But I no longer think the latter really makes sense in the context =
of
> > > > stateless video decoding.
> > > >=20
> > > > A side-note: I think we should definitely have data offsets in ever=
y
> > > > case, so that implementations can just push the whole NALU regardle=
ss
> > > > of the format if they're lazy.
> > >=20
> > > I realize that I didn't share our latest research on the subject. So =
a
> > > slice in the original bitstream is formed of the following blocks
> > > (simplified):
> > >=20
> > >   [nal_header][nal_type][slice_header][slice]
> >=20
> > Thanks for the details!
> >=20
> > > nal_header:
> > > This one is a header used to locate the start and the end of the of a
> > > NAL. There is two standard forms, the ANNEX B / start code, a sequenc=
e
> > > of 3 bytes 0x00 0x00 0x01, you'll often see 4 bytes, the first byte
> > > would be a leading 0 from the previous NAL padding, but this is also
> > > totally valid start code. The second form is the AVC form, notably us=
ed
> > > in ISOMP4 container. It simply is the size of the NAL. You must keep
> > > your buffer aligned to NALs in this case as you cannot scan from rand=
om
> > > location.
> > >=20
> > > nal_type:
> > > It's a bit more then just the type, but it contains at least the
> > > information of the nal type. This has different size on H.264 and HEV=
C
> > > but I know it's size is in bytes.
> > >=20
> > > slice_header:
> > > This contains per slice parameters, like the modification lists to
> > > apply on the references. This one has a size in bits, not in bytes.
> > >=20
> > > slice:
> > > I don't really know what is in it exactly, but this is the data used =
to
> > > decode. This bit has a special coding called the anti-emulation, whic=
h
> > > prevents a start-code from appearing in it. This coding is present in
> > > both forms, ANNEX-B or AVC (in GStreamer and some reference manual th=
ey
> > > call ANNEX-B the bytestream format).
> > >=20
> > > So, what we notice is that what is currently passed through Cedrus
> > > driver:
> > >   [nal_type][slice_header][slice]
> > >=20
> > > This matches what is being passed through VA-API. We can understand
> > > that stripping off the slice_header would be hard, since it's size is
> > > in bits. Instead we pass size and header_bit_size in slice_params.
> >=20
> > True, there is that.
> >=20
> > > About Rockchip. RK3288 is a Hantro G1 and has a bit called
> > > start_code_e, when you turn this off, you don't need start code. As a
> > > side effect, the bitstream becomes identical. We do now know that it
> > > works with the ffmpeg branch implement for cedrus.
> >=20
> > Oh great, that makes life easier in the short term, but I guess the
> > issue could arise on another decoder sooner or later.
> >=20
> > > Now what's special about Hantro G1 (also found on IMX8M) is that it
> > > take care for us of reading and executing the modification lists foun=
d
> > > in the slice header. Mostly because I very disliked having to pass th=
e
> > > p/b0/b1 parameters, is that Boris implemented in the driver the
> > > transformation from the DPB entries into this p/b0/b1 list. These lis=
t
> > > a standard, it's basically implementing 8.2.4.1 and 8.2.4.2. the
> > > following section is the execution of the modification list. As this
> > > list is not modified, it only need to be calculated per frame. As a
> > > result, we don't need these new lists, and we can work with the same
> > > H264_SLICE format as Cedrus is using.
> >=20
> > Yes but I definitely think it makes more sense to pass the list
> > modifications rather than reconstructing those in the driver from a
> > full list. IMO controls should stick to the bitstream as close as
> > possible.
> >=20
> > > Now, this is just a start. For RK3399, we have a different CODEC
> > > design. This one does not have the start_code_e bit. What the IP does=
,
> > > is that you give it one or more slice per buffer, setup the params,
> > > start decoding, but the decoder then return the location of the
> > > following NAL. So basically you could offload the scanning of start
> > > code to the HW. That being said, with the driver layer in between, th=
at
> > > would be amazingly inconvenient to use, and with Boyer-more algorithm=
,
> > > it is pretty cheap to scan this type of start-code on CPU. But the
> > > feature that this allows is to operate in frame mode. In this mode, y=
ou
> > > have 1 interrupt per frame.
> >=20
> > I'm not sure there is any interest in exposing that from userspace and
> > my current feeling is that we should just ditch support for per-frame
> > decoding altogether. I think it mixes decoding with notions that are
> > higher-level than decoding, but I agree it's a blurry line.
>=20
> I'm not sure ditching support for per-frame decoding would be a wise
> decision. What if some device comes around that only supports frame
> decoding and can't handle individual slices?
>=20
> We have such a situation on Tegra, for example. I think the hardware can
> technically decode individual slices, but it can also be set up to do a
> lot more and operate in basically a per-frame mode where you just pass
> it a buffer containing the complete bitstream for one frame and it'll
> just raise an interrupt when it's done decoding.
>=20
> Per-frame mode is what's currently implemented in the staging driver and
> as far as I can tell it's also what's implemented in the downstream
> driver, which uses a completely different architecture (it uploads a
> firmware that processes a command stream). I have seen registers that
> seem to be related to a slice-decoding mode, but honestly I have no idea
> how to program them to achieve that.
>=20
> Now the VDE IP that I'm dealing with is pretty old, but from what I know
> of newer IP, they follow a similar command stream architecture as the
> downstream VDE driver, so I'm not sure those support per-slice decoding
> either. They typically have a firmware that processes command streams
> and userspace typically just passes a single bitstream buffer along with
> reference frames and gets back the decoded frame. I'd have to
> investigate further to understand if slice-level decoding is supported
> on the newer hardware.
>=20
> I'm not familiar with any other decoders, but per-frame decoding doesn't
> strike me as a very exotic idea. Excluding such decoders from the ABI
> sounds a bit premature.

It would be premature to state that we are excluding. We are just
trying to find one format to get things upstream, and make sure we have
a plan how to extend it. Trying to support everything on the first try
is not going to work so well.

What is interesting to provide is how does you IP achieve multi-slice
decoding per frame. That's what we are studying on the RK/Hantro chip.
Typical questions are:

  1. Do all slices have to be contiguous in memory
  2. If 1., do you place start-code, AVC header or pass a seperate index to=
 let the HW locate the start of each NAL ?
  3. Does the HW do support single interrupt per frame (RK3288 as an exampl=
e does not, but RK3399 do)

And other things like this. The more data we have, the better the
initial interface will be.

>=20
> > > But it also support slice mode, with an
> > > interrupt per slice, which is what we decided to use.
> >=20
> > Easier for everyone and probably better for latency as well :)
>=20
> I'm not sure I understand what's easier about slice-level decoding or
> how this would improve latency. If anything getting less interrupts is
> good, isn't it?
>=20
> If we can offload more to hardware, certainly that's something we want
> to take advantage of, no?

In H.264, pretty much all stream have single slice per frame. That's
because it gives the highest quality. But in live streaming, like for
webrtc, it's getting more common to actually encode with multiple
slices (it's group of macroblocks usually in raster order). Usually
it's a very small amount of slices, 4, 8, something in this range.

When a slice is encoded, the encoder will let it go before it starts
the following, this allow network transfer to happen in parallel of
decoding.

On the receiver, as soon as a slice is available, the decoder will be
started immediately, which allow the receiving of buffer and the
decoding of the slices to happen in parallel. You end up with a lot
less delay between the reception of the last slice and having a full
frame ready.

So that's how slices are used to reduce latency. Now, if you are
decoding from a container like ISOMP4, you'll have full frame, so it
make sense to queue all these frame, and le the decoder bundle that if
possible, if the HW allow to enable mode where you have single IRQ per
frame. Though, it's pretty rare that you'll find such a file with
slices. What we'd like to resolve is how these are resolved. There is
nothing that prevents it right now in the uAPI, but you'd have to copy
the input into another buffer, adding the separators if needed.

What we are trying to achieve in this thread is to find a compromise
that makes uAPI sane, but also makes decoding efficient on all the HW
we know at least.

>=20
> Thierry
>=20
> > > So in this case, indeed we strictly require on start-code. Though, to
> > > me this is not a great reason to make a new fourcc, so we will try an=
d
> > > use (data_offset =3D 3) in order to make some space for that start co=
de,
> > > and write it down in the driver. This is to be continued, we will
> > > report back on this later. This could have some side effect in the
> > > ability to import buffers. But most userspace don't try to do zero-co=
py=20
> > > on the encoded size and just copy anyway.
> > >=20
> > > To my opinion, having a single format is a big deal, since userspace
> > > will generally be developed for one specific HW and we would endup wi=
th
> > > fragmented support. What we really want to achieve is having a driver
> > > interface which works across multiple HW, and I think this is quite
> > > possible.
> >=20
> > I agree with that. The more I think about it, the more I believe we
> > should just pass the whole [nal_header][nal_type][slice_header][slice]
> > and the parsed list in every scenario.
> >=20
> > For H.265, our decoder needs some information from the NAL type too.
> > We currently extract that in userspace and stick it to the
> > slice_header, but maybe it would make more sense to have drivers parse
> > that info from the buffer if they need it. On the other hand, it seems
> > quite common to pass information from the NAL type, so maybe we should
> > either make a new control for it or have all the fields in the
> > slice_header (which would still be wrong in terms of matching bitstream
> > description).
> >=20
> > > > - Dropping the DPB concept in H.264/H.265
> > > >=20
> > > > As far as I could understand, the decoded picture buffer (DPB) is a
> > > > concept that only makes sense relative to a decoder implementation.=
 The
> > > > spec mentions how to manage it with the Hypothetical reference deco=
der
> > > > (Annex C), but that's about it.
> > > >=20
> > > > What's really in the bitstream is the list of modified short-term a=
nd
> > > > long-term references, which is enough for every decoder.
> > > >=20
> > > > For this reason, I strongly believe we should stop talking about DP=
B in
> > > > the controls and just pass these lists agremented with relevant
> > > > information for userspace.
> > > >=20
> > > > I think it should be up to the driver to maintain a DPB and we coul=
d
> > > > have helpers for common cases. For instance, the rockchip decoder n=
eeds
> > > > to keep unused entries around[2] and cedrus has the same requiremen=
t
> > > > for H.264. However for cedrus/H.265, we don't need to do any book-
> > > > keeping in particular and can manage with the lists from the bitstr=
eam
> > > > directly.
> > >=20
> > > As discusses today, we still need to pass that list. It's being index
> > > by the HW to retrieve the extra information we have collected about t=
he
> > > status of the reference frames. In the case of Hantro, which process
> > > the modification list from the slice header for us, we also need that
> > > list to construct the unmodified list.
> > >=20
> > > So the problem here is just a naming problem. That list is not really=
 a
> > > DPB. It is just the list of long-term/short-term references with the
> > > status of these references. So maybe we could just rename as
> > > references/reference_entry ?
> >=20
> > What I'd like to pass is the diff to the references list, as ffmpeg
> > currently provides for v4l2 request and vaapi (probably vdpau too). No
> > functional change here, only that we should stop calling it a DPB,
> > which confuses everyone.
> >=20
> > > > - Using flags
> > > >=20
> > > > The current MPEG-2 controls have lots of u8 values that can be
> > > > represented as flags. Using flags also helps with padding.
> > > > It's unlikely that we'll get more than 64 flags, so using a u64 by
> > > > default for that sounds fine (we definitely do want to keep some ro=
om
> > > > available and I don't think using 32 bits as a default is good enou=
gh).
> > > >=20
> > > > I think H.264/HEVC per-control flags should also be moved to u64.
> > >=20
> > > Make sense, I guess bits (member : 1) are not allowed in uAPI right ?
> >=20
> > Mhh, even if they are, it makes it much harder to verify 32/64 bit
> > alignment constraints (we're dealing with 64-bit platforms that need to
> > have 32-bit userspace and compat_ioctl).
> >=20
> > > > - Clear split of controls and terminology
> > > >=20
> > > > Some codecs have explicit NAL units that are good fits to match as
> > > > controls: e.g. slice header, pps, sps. I think we should stick to t=
he
> > > > bitstream element names for those.
> > > >=20
> > > > For H.264, that would suggest the following changes:
> > > > - renaming v4l2_ctrl_h264_decode_param to v4l2_ctrl_h264_slice_head=
er;
> > >=20
> > > Oops, I think you meant slice_prams ? decode_params matches the
> > > information found in SPS/PPS (combined?), while slice_params matches
> > > the information extracted (and executed in case of l0/l1) from the
> > > slice headers.
> >=20
> > Yes you're right, I mixed them up.
> >=20
> > >  That being said, to me this name wasn't confusing, since
> > > it's not just the slice header, and it's per slice.
> >=20
> > Mhh, what exactly remains in there and where does it originate in the
> > bitstream? Maybe it wouldn't be too bad to have one control per actual
> > group of bitstream elements.
> >=20
> > > > - killing v4l2_ctrl_h264_decode_param and having the reference list=
s
> > > > where they belong, which seems to be slice_header;
> > >=20
> > > There reference list is only updated by userspace (through it's DPB)
> > > base on the result of the last decoding step. I was very confused for=
 a
> > > moment until I realize that the lists in the slice_header are just a
> > > list of modification to apply to the reference list in order to produ=
ce
> > > l0 and l1.
> >=20
> > Indeed, and I'm suggesting that we pass the modifications only, which
> > would fit a slice_header control.
> >=20
> > Cheers,
> >=20
> > Paul
> >=20
> > > > I'm up for preparing and submitting these control changes and updat=
ing
> > > > cedrus if they seem agreeable.
> > > >=20
> > > > What do you think?
> > > >=20
> > > > Cheers,
> > > >=20
> > > > Paul
> > > >=20
> > > > [0]: https://lkml.org/lkml/2019/3/6/82
> > > > [1]: https://patchwork.linuxtv.org/patch/55947/
> > > > [2]: https://chromium.googlesource.com/chromiumos/third_party/kerne=
l/+/4d7cb46539a93bb6acc802f5a46acddb5aaab378
> > > >=20

--=-omXPVr4llaUbbqq9pfeG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXOQmEgAKCRBxUwItrAao
HCSFAKCaIQinEgepqHSaQQZrOhVhUc78XACgkBK2Q/Fc+Zy68PlkRppCZ18LblA=
=l8Bl
-----END PGP SIGNATURE-----

--=-omXPVr4llaUbbqq9pfeG--

