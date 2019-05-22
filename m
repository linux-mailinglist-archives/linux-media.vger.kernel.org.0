Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68FDA2616A
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2019 12:08:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728774AbfEVKIb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 May 2019 06:08:31 -0400
Received: from mail-wr1-f43.google.com ([209.85.221.43]:45826 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728424AbfEVKIb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 May 2019 06:08:31 -0400
Received: by mail-wr1-f43.google.com with SMTP id b18so1565113wrq.12
        for <linux-media@vger.kernel.org>; Wed, 22 May 2019 03:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KnzlCJgIaLXpCTRPmsZmi8cOZ2GQ0xFJ4+4trqyvLqA=;
        b=GixPdGZgT9L1+CTq30/GOc66laaDxPdCMMIvLlJPiBs9zL0kvwWsCJTAcZJwevVEKi
         U6OV+xXXAUABTLfH3yOEkCuYBMsKgaJqCm9vtLBp+KLcGNeaLmwd/KSZNI2GNBGvj1Ig
         sRyIduZ9vMT5Z8SXna0WglwLI6F8zkcFjaMrF0cXrX3C/PBg02SjOD3b1JyW9f6V4N4J
         SbKd9sqkRfTMqPpj4DmtKVoX8zY40VhElLEru+eaAlPINEZVoOEztpHrt1RrWPjFyQH4
         ugSqJwuJmAE2uRNfdqUybDQ8AwjhtvUnUJ0d8zF9VT3hmIxWm208ngNd3ZrW5yFMcpzS
         dIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KnzlCJgIaLXpCTRPmsZmi8cOZ2GQ0xFJ4+4trqyvLqA=;
        b=Y+wbpzuDIDKdFMOPcEvs1xV2EQmK6pmvC2fs4IGGUgOA//z436qIu1/rNJMOzLTOnF
         TNdmBQQyFxDRiRoYANoaZInSe/9k1OefGBOCTC/1K9IGGYiNQ8FjKKhNCb38TjC/p4gF
         Zc94ISsjmY3OU0n9KVX+O4PqQAGWMoY7arIvhnuuOF05M4O9DD78UDZbeDXHa3JYEcfH
         6MrVEOJtETw1x3DqLG38gi/+bnVApwJZ6TKrwpNOoB1cCUMrwxVXne18oa+mC8t90Fau
         SiX4GUzpiXB48J0Gwvi8tZmsMt16//nj0i+UCo+aMKKWce+a0oKlFh3GwYwr/d1LuCU1
         cuYA==
X-Gm-Message-State: APjAAAXneGkSkLHtXgWv1yewJO+NgP1V7PFPKphwtE3hQUNEdBTQotUC
        SNrfTzpfKQagaG8coFrfgUx3YHvdfTY=
X-Google-Smtp-Source: APXvYqyyYmVSf0H8x8HwZdhGQdXEPvQOB72oErwKZghZbAk5qQHdX2ih/Nxd9r/aXgbK5a1lYSfxTw==
X-Received: by 2002:adf:f208:: with SMTP id p8mr33338230wro.160.1558519707934;
        Wed, 22 May 2019 03:08:27 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id v13sm3685562wmj.46.2019.05.22.03.08.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 May 2019 03:08:26 -0700 (PDT)
Date:   Wed, 22 May 2019 12:08:25 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
Message-ID: <20190522100825.GC30938@ulmo>
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
 <3e0d6d5106e9c0c27ef4b11e64a488726ff77103.camel@ndufresne.ca>
 <39ded6d4ddf85849bf45abc94dc8e104fd4c0978.camel@bootlin.com>
 <20190521154358.GC7098@ulmo>
 <124db795c1ed77854be6c565092c2820776ac223.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9Ek0hoCL9XbhcSqy"
Content-Disposition: inline
In-Reply-To: <124db795c1ed77854be6c565092c2820776ac223.camel@ndufresne.ca>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--9Ek0hoCL9XbhcSqy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2019 at 12:23:46PM -0400, Nicolas Dufresne wrote:
> Le mardi 21 mai 2019 =C3=A0 17:43 +0200, Thierry Reding a =C3=A9crit :
> > On Wed, May 15, 2019 at 07:42:50PM +0200, Paul Kocialkowski wrote:
> > > Hi,
> > >=20
> > > Le mercredi 15 mai 2019 =C3=A0 10:42 -0400, Nicolas Dufresne a =C3=A9=
crit :
> > > > Le mercredi 15 mai 2019 =C3=A0 12:09 +0200, Paul Kocialkowski a =C3=
=A9crit :
> > > > > Hi,
> > > > >=20
> > > > > With the Rockchip stateless VPU driver in the works, we now have a
> > > > > better idea of what the situation is like on platforms other than
> > > > > Allwinner. This email shares my conclusions about the situation a=
nd how
> > > > > we should update the MPEG-2, H.264 and H.265 controls accordingly.
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
> > > > would be a leading 0 from the previous NAL padding, but this is also
> > > > totally valid start code. The second form is the AVC form, notably =
used
> > > > in ISOMP4 container. It simply is the size of the NAL. You must keep
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
> > > > side effect, the bitstream becomes identical. We do now know that it
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
> > > > following section is the execution of the modification list. As this
> > > > list is not modified, it only need to be calculated per frame. As a
> > > > result, we don't need these new lists, and we can work with the same
> > > > H264_SLICE format as Cedrus is using.
> > >=20
> > > Yes but I definitely think it makes more sense to pass the list
> > > modifications rather than reconstructing those in the driver from a
> > > full list. IMO controls should stick to the bitstream as close as
> > > possible.
> > >=20
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
> > > I'm not sure there is any interest in exposing that from userspace and
> > > my current feeling is that we should just ditch support for per-frame
> > > decoding altogether. I think it mixes decoding with notions that are
> > > higher-level than decoding, but I agree it's a blurry line.
> >=20
> > I'm not sure ditching support for per-frame decoding would be a wise
> > decision. What if some device comes around that only supports frame
> > decoding and can't handle individual slices?
> >=20
> > We have such a situation on Tegra, for example. I think the hardware can
> > technically decode individual slices, but it can also be set up to do a
> > lot more and operate in basically a per-frame mode where you just pass
> > it a buffer containing the complete bitstream for one frame and it'll
> > just raise an interrupt when it's done decoding.
> >=20
> > Per-frame mode is what's currently implemented in the staging driver and
> > as far as I can tell it's also what's implemented in the downstream
> > driver, which uses a completely different architecture (it uploads a
> > firmware that processes a command stream). I have seen registers that
> > seem to be related to a slice-decoding mode, but honestly I have no idea
> > how to program them to achieve that.
> >=20
> > Now the VDE IP that I'm dealing with is pretty old, but from what I know
> > of newer IP, they follow a similar command stream architecture as the
> > downstream VDE driver, so I'm not sure those support per-slice decoding
> > either. They typically have a firmware that processes command streams
> > and userspace typically just passes a single bitstream buffer along with
> > reference frames and gets back the decoded frame. I'd have to
> > investigate further to understand if slice-level decoding is supported
> > on the newer hardware.
> >=20
> > I'm not familiar with any other decoders, but per-frame decoding doesn't
> > strike me as a very exotic idea. Excluding such decoders from the ABI
> > sounds a bit premature.
>=20
> It would be premature to state that we are excluding. We are just
> trying to find one format to get things upstream, and make sure we have
> a plan how to extend it. Trying to support everything on the first try
> is not going to work so well.

Okay that sounds reasonable. I must have misinterpreted what you were
discussing. Sorry.

> What is interesting to provide is how does you IP achieve multi-slice
> decoding per frame. That's what we are studying on the RK/Hantro chip.
> Typical questions are:
>=20
>   1. Do all slices have to be contiguous in memory

All of the systems that integrate VDE have an SMMU, though on many of
them that SMMU is very limited (on one generation of Tegra it's really
only a GART and on others the number of virtual address spaces is so
small that it's not always practical to rely on the SMMU). So if SMMU
support is enabled, then slices can be scattered in memory, but they
will have to be I/O virtually contiguous. The VDE itself does not
support SG.

>   2. If 1., do you place start-code, AVC header or pass a seperate index =
to let the HW locate the start of each NAL ?

My understanding is that there's a "syntax engine" whose job it is to
parse the bitstream that you point it at (using the "bitstream engine"
to extract individual elements). The syntax elements parsed are used to
control the "macro-block engine" via a set of commands. The syntax
engine needs the start-code in order to work and will generate an error
ohterwise. I haven't come across a way to disable this, so it looks like
the start code is always required. Or I should say, the decoder always
requires Annex B format. This also happens to be what for example VDPAU
will generate. I suppose it's a fairly natural choice, given that that's
the byte stream format recommended by the H.264 standard.

>   3. Does the HW do support single interrupt per frame (RK3288 as an exam=
ple does not, but RK3399 do)

Yeah, we definitely do get a single interrupt at the end of a frame, or
when an error occurs. Looking a bit at the register documentation it
looks like this can be more fine-grained. We can for example get an
interrupt at the end of a slice or a row of macro blocks.

> And other things like this. The more data we have, the better the
> initial interface will be.
>=20
> >=20
> > > > But it also support slice mode, with an
> > > > interrupt per slice, which is what we decided to use.
> > >=20
> > > Easier for everyone and probably better for latency as well :)
> >=20
> > I'm not sure I understand what's easier about slice-level decoding or
> > how this would improve latency. If anything getting less interrupts is
> > good, isn't it?
> >=20
> > If we can offload more to hardware, certainly that's something we want
> > to take advantage of, no?
>=20
> In H.264, pretty much all stream have single slice per frame. That's
> because it gives the highest quality. But in live streaming, like for
> webrtc, it's getting more common to actually encode with multiple
> slices (it's group of macroblocks usually in raster order). Usually
> it's a very small amount of slices, 4, 8, something in this range.
>=20
> When a slice is encoded, the encoder will let it go before it starts
> the following, this allow network transfer to happen in parallel of
> decoding.
>=20
> On the receiver, as soon as a slice is available, the decoder will be
> started immediately, which allow the receiving of buffer and the
> decoding of the slices to happen in parallel. You end up with a lot
> less delay between the reception of the last slice and having a full
> frame ready.

Okay, that clarifies things. I'm not sure I fully agree with "a lot less
delay". Hardware decoders are usually capable of decoding in realtime so
in most cases I would expect the decoder latency to be somewhere on the
order of 16-40 ms, and network latency can't be much higher than that to
ensure smooth playback, so worst case the total latency should be on the
order of 32-80 ms. Even assuming 100 ms worst case latency, that's not
too bad in my experience. Unless you're aiming for some application like
game streaming, in which case you'd be more on the lower end of that
range anyway because of the required framerate.

Anyway, I'm not trying to argue that slice-level decoding is a bad thing
or unnecessary. I'm merely trying to point out that for many use-cases
frame-level decoding is more than good enough for people's needs.

> So that's how slices are used to reduce latency. Now, if you are
> decoding from a container like ISOMP4, you'll have full frame, so it
> make sense to queue all these frame, and le the decoder bundle that if
> possible, if the HW allow to enable mode where you have single IRQ per
> frame. Though, it's pretty rare that you'll find such a file with
> slices. What we'd like to resolve is how these are resolved. There is
> nothing that prevents it right now in the uAPI, but you'd have to copy
> the input into another buffer, adding the separators if needed.
>=20
> What we are trying to achieve in this thread is to find a compromise
> that makes uAPI sane, but also makes decoding efficient on all the HW
> we know at least.

It's been some time since I looked at this in detail, but my
recollection is that things like MPEG TS use what is basically the annex
B byte stream format. On the other hand I recall that ffmpeg has a
filter that can be used to add a start code if the input stream doesn't
have one (e.g. if you are playing back from an MP4 container) but the
decoder requires one (e.g. VDPAU). I'm not familiar with VAAPI or things
like gstreamer, but I suspect that they have something similar in place.
Perhaps somebody with more knowledge of those can share their wisdom. If
there are any commonalities between all of those maybe that could serve
as guidance on what a V4L2 interface should be providing in terms of
input format.

Naively I would consider more information (rather than less) easier to
deal with. If you have more information than necessary it's usually
pretty easy to skip it (hardware may already be able to do so, or you
can rewrite some pointer/offset to do that). On the other hand, if you
have too little information it's not always easy to add it. I guess you
could argue that it's not a big issue for something like a start code,
but it still means you have to concatenate in order to prepend the data,
which usually means you need a copy in software if you don't have SG
capabilities.

Of course I may be somewhat biased because this happens to coincide with
what VDE expects...

Thierry

--9Ek0hoCL9XbhcSqy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzlH5cACgkQ3SOs138+
s6GTGA//cTQSf+UTDp7Yu6kibCu87RRA5EAsV77VshS3YkyT2VIUvCfkA53Wiy4a
BTGfw4eh3Umy+GasFtypy0vWhJyrZE3DZq/6SmTS4vaBPbnBd0mG/VDPFCwXRFZH
W0GSiV9fdPkMoy+qxBcTiUcuxnbrzYVJM50KMXI0VWz+5ggsXza+a/EYjeNtVgrJ
noYWDRfBrjp0DVaulh4bN8l49nJMc80vVQMrnooHofDvWSdJdGe2dgqeOvib1RX+
MUDRadcM39OzyWVmEMNDGq+KDzy7ocAtIizvwvvZjY6akhXNI8r1YzDDK6QNI/f4
Kp4dWBBM6HLicG1IA2n1/CLr8b0vX10OvVqfIrpLP2Hj74BEyjiza2ACm0fEJX+s
vsdT7+G/Ya3B3dg7UJ16J+5RkJ79lm94vwnrQlrVy881Sllcjjv02v5bxEnfIsLr
4B4M3pEKVuMfx8c8HCoYi82/q4QJK0usEgzAPgGRLNMAngtfpiLb5q5JvG8mlnXT
06iBht9C52rEV2VMUUUtLK2zwL/3Z4Kl8o55GWK5ckrVvy6hD0iDv+7PI6oyxzUM
qXfFlc93g/3hukeTEJ96+5/BEphryfSQqeOHEnf69EGeFQVxc+dZ70WUDPa450QM
ARCU0bbAcrZXdmpBdrfwj1XJN9ck1H4c1jgyE7r1zs4NnPbMTyE=
=S5kr
-----END PGP SIGNATURE-----

--9Ek0hoCL9XbhcSqy--
