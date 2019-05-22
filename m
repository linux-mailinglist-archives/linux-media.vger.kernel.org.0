Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B2D5269CC
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2019 20:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729570AbfEVS0M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 May 2019 14:26:12 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:34274 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728272AbfEVS0M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 May 2019 14:26:12 -0400
Received: by mail-qk1-f194.google.com with SMTP id t64so1934510qkh.1
        for <linux-media@vger.kernel.org>; Wed, 22 May 2019 11:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=vP1+LM304WVH6dDEYTvspcg6bTMiysvPX7tw1hdfhDA=;
        b=o1EZyFaAYytA6SoTiquEufehdkmnWNXt4w/apAFgx4jRIEQJY0m68ilaKqGA/erWA+
         g0xeoz1q1S1lc4whhG8EN9eLvoLprz8peiOcUxB1yK+1L3e+vXc2C4JS4e+FQyKMq936
         F+yZtaQonU6QWVEZqF2tZXS9M4kwyjf5LFNHJIiN+WapIlTvYAdI46dG8GU72fkiF555
         0KOM768ylhh0Bo9OCD994zTcBGysHzVFqcFL+e5QP0CEHUCQ7TIo7QUW7xl8FIl+yHSQ
         Kitwl++LiyiZOMxoLSaFUgcRwOUSnn7MUT/wMmb6G65a5mX8TnKoCJ3tC/CKfTRqHwmk
         ivRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=vP1+LM304WVH6dDEYTvspcg6bTMiysvPX7tw1hdfhDA=;
        b=LtwrQKCoZwiy4wA8+vjbdQI8nHJpeAn0acNdLYgoCwdatJtk5L1Z0ULTkrh+mIBoQd
         zIDTkRqSv+XGsp0ohH+o0UZzhqrLx7YW8EduoFHGrHJZXJdHcmIB+6gMUNPEGxFwBd3V
         4VVVDTmZLcuxp9XdKfmAUOHwTdR2lzD69LEywl6uHqArfjnEzYtEUF83VMvFNPIezxAn
         XD2VTcmGbRtSWDx6hbXxpcn+rq4ugXXDgVKApCsGTtU6eohM/vVg3/J1JRt4Q6AykuFu
         XM38Lc0D5g7vHgHxK/CzCZ0yU5bq3hZs3vK/2Foom2vsWobexphqDwLfg0G94TGBxzep
         wq3A==
X-Gm-Message-State: APjAAAXLaNkiXcWSNj77bfhSpRk0Lr2GnJHqCoUK1oySgmA144QNi7uD
        SAUNU9+cm+57UcokL2ZKo0vKeQ==
X-Google-Smtp-Source: APXvYqxBKqi/VL9nJtXmCO7rVPfA/CF6nV4WhU0lfOcy6M0lyQtxj/6Tez8/8XbXy2X2e8WmAMezAQ==
X-Received: by 2002:a37:f50d:: with SMTP id l13mr49444164qkk.13.1558549571242;
        Wed, 22 May 2019 11:26:11 -0700 (PDT)
Received: from tpx230-nicolas.collaboramtl (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id s188sm1495940qkd.67.2019.05.22.11.26.09
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 22 May 2019 11:26:09 -0700 (PDT)
Message-ID: <3cd36eae82d335b8443be1e1a96568971e160f82.camel@ndufresne.ca>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
Date:   Wed, 22 May 2019 14:26:08 -0400
In-Reply-To: <0961169f7abbecbc0f8382f946bd37dc9bea8507.camel@bootlin.com>
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
         <3e0d6d5106e9c0c27ef4b11e64a488726ff77103.camel@ndufresne.ca>
         <39ded6d4ddf85849bf45abc94dc8e104fd4c0978.camel@bootlin.com>
         <20190521154358.GC7098@ulmo>
         <124db795c1ed77854be6c565092c2820776ac223.camel@ndufresne.ca>
         <CAAFQd5Cmv-CJAsQ7QdoEPYyCFLDjAJjFFLo8PMZT=zeOumnkmQ@mail.gmail.com>
         <20190522092924.116b212e@collabora.com> <20190522083229.GB30938@ulmo>
         <0961169f7abbecbc0f8382f946bd37dc9bea8507.camel@bootlin.com>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-a03Y9zeoSdNoPYYjfFC4"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-a03Y9zeoSdNoPYYjfFC4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 22 mai 2019 =C3=A0 11:29 +0200, Paul Kocialkowski a =C3=A9crit =
:
> Le mercredi 22 mai 2019 =C3=A0 10:32 +0200, Thierry Reding a =C3=A9crit :
> > On Wed, May 22, 2019 at 09:29:24AM +0200, Boris Brezillon wrote:
> > > On Wed, 22 May 2019 15:39:37 +0900
> > > Tomasz Figa <tfiga@chromium.org> wrote:
> > >=20
> > > > > It would be premature to state that we are excluding. We are just
> > > > > trying to find one format to get things upstream, and make sure w=
e have
> > > > > a plan how to extend it. Trying to support everything on the firs=
t try
> > > > > is not going to work so well.
> > > > >=20
> > > > > What is interesting to provide is how does you IP achieve multi-s=
lice
> > > > > decoding per frame. That's what we are studying on the RK/Hantro =
chip.
> > > > > Typical questions are:
> > > > >=20
> > > > >   1. Do all slices have to be contiguous in memory
> > > > >   2. If 1., do you place start-code, AVC header or pass a seperat=
e index to let the HW locate the start of each NAL ?
> > > > >   3. Does the HW do support single interrupt per frame (RK3288 as=
 an example does not, but RK3399 do) =20
> > > >=20
> > > > AFAICT, the bit about RK3288 isn't true. At least in our downstream
> > > > driver that was created mostly by RK themselves, we've been assumin=
g
> > > > that the interrupt is for the complete frame, without any problems.
> > >=20
> > > I confirm that's what happens when all slices forming a frame are pac=
ked
> > > in a single output buffer: you only get one interrupt at the end of t=
he
> > > decoding process (in that case, when the frame is decoded). Of course=
,
> > > if you split things up and do per-slice decoding instead (one slice p=
er
> > > buffer) you get an interrupt per slice, though I didn't manage to mak=
e
> > > that work.
> > > I get a DEC_BUFFER interrupt (AKA, "buffer is empty but frame is not
> > > fully decoded") on the first slice and an ASO (Arbitrary Slice Orderi=
ng)
> > > interrupt on the second slice, which makes me think some states are
> > > reset between the 2 operations leading the engine to think that the
> > > second slice is part of a new frame.
> >=20
> > That sounds a lot like how this works on Tegra. My understanding is tha=
t
> > for slice decoding you'd also get an interrupt every time a full slice
> > has been decoded perhaps coupled with another "frame done" interrupt
> > when the full frame has been decoded after the last slice.
> >=20
> > In frame-level decode mode you don't get interrupts in between and
> > instead only get the "frame done" interrupt. Unless something went wron=
g
> > during decoding, in which case you also get an interrupt but with error
> > flags and status registers that help determine what exactly happened.
> >=20
> > > Anyway, it doesn't sound like a crazy idea to support both per-slice
> > > and per-frame decoding and maybe have a way to expose what a
> > > specific codec can do (through an extra cap mechanism).
> >=20
> > Yeah, I think it makes sense to support both for devices that can do
> > both. From what Nicolas said it may make sense for an application to
> > want to do slice-level decoding if receiving a stream from the network
> > and frame-level decoding if playing back from a local file. If a driver
> > supports both, the application could detect that and choose the
> > appropriate format.
> >=20
> > It sounds to me like using different input formats for that would be a
> > very natural way to describe it. Applications can already detect the se=
t
> > of supported input formats and set the format when they allocate buffer=
s
> > so that should work very nicely.
>=20
> Pixel formats are indeed the natural way to go about this, but I have
> some reservations in this case. Slices are the natural unit of video
> streams, just like frames are to display hardware. Part of the pipeline
> configuration is slice-specific, so in theory, the pipeline needs to be
> reconfigured with each slice.
>=20
> What we have been doing in Cedrus is to currently gather all the slices
> and use the last slice's specific configuration for the pipeline, which
> sort of works, but is very likely not a good idea.
>=20
> You mentionned that the Tegra VPU currentyl always operates in frame
> mode (even when the stream actually has multiple slices, which I assume
> are gathered at some point). I wonder how it goes about configuring
> different slice parameters (which are specific to each slice, not
> frame) for the different slices.=20

Per-frame CODEC won't ask for the l0/l1 list, which is slice specific.
This is the case for the RK3288, we don't pass that information.
Instead we build a list from the DPB entries, this is the list before
the applying the modifications found in the slice header. The HW will
do the rest.

>=20
> I believe we should at least always expose per-slice granularity in the
> pixel format and requests. Maybe we could have a way to allow multiple
> slices to be gathered in the source buffer and have a control slice
> array for each request. In that case, we'd have a single request queued
> for the series of slices, with a bit offset in each control to the
> matching slice.
>=20
> Then we could specify that such slices must be appended in a way that
> suits most decoders that would have to operate per-frame (so we need to
> figure this out) and worst case, we'll always have offsets in the
> controls if we need to setup a bounce buffer in the driver because
> things are not laid out the way we specified.
>=20
> Then we introduce a specific cap to indicate which mode is supported
> (per-slice and/or per-frame) and adapt our ffmpeg reference to be able
> to operate in both modes.
>=20
> That adds some complexity for userspace, but I don't think we can avoid
> it at this point and it feels better than having two different pixel
> formats (which would probably be even more complex to manage for
> userspace).
>=20
> What do you think?
>=20
> > > The other option would be to support only per-slice decoding with a
> > > mandatory START_FRAME/END_FRAME sequence to let drivers for HW that
> > > only support per-frame decoding know when they should trigger the
> > > decoding operation. The downside is that it implies having a bounce
> > > buffer where the driver can pack slices to be decoded on the END_FRAM=
E
> > > event.
> >=20
> > I vaguely remember that that's what the video codec abstraction does in
> > Mesa/Gallium.=20
>=20
> Well, if it's exposed through VDPAU or VAAPI, the interface already
> operates per-slice and it would certainly not be a big issue to change
> that.

VDPAU seem to be per-frame to me (I only read that API recently once).
I believe this is the main difference between both. But most VDPAU
drivers needs to do their own final bit of parsing. The VAAPI has a
start/end call, so with a bounce buffer you can implement the other way
too in your driver. But then the cons is that userspace may be doing
parsing that won't be used by the driver.

>=20
> Talking about the mesa/gallium video decoding stuff, I think it would
> be worth having V4L2 interfaces for that now that we have the Request
> API.
>=20
> Basically, Nvidia GPUs have video decoding blocks (which could be
> similar to the ones present on Tegra) that are accessed through a
> firmware running on a Falcon MCU on the GPU side.
>=20
> Having a standardized firmware interface for these and a V4L2 M2M
> driver for the interface would certainly make it easier for everyone to
> handle that. I don't really see why these video decoding hardware has
> to be exposed through the display stack anyway and one could want to
> use the GPU's video decoder without bringing up the shading cores.
>=20
> > I'm not very familiar with V4L2, but this seems like it
> > could be problematic to integrate with the way that V4L2 works in
> > general. Perhaps sending a special buffer (0 length or whatever) to mar=
k
> > the end of a frame would work. But this is probably something that
> > others have already thought about, since slice-level decoding is what
> > most people are using, hence there must already be a way for userspace
> > to somehow synchronize input vs. output buffers. Or does this currently
> > just work by queueing bitstream buffers as fast as possible and then
> > dequeueing frame buffers as they become available?
>=20
> We have a Request API mechanism where we group controls (parsed
> bitstream meta-data) and source (OUTPUT) buffers together and submit
> them tied. When each request gets processed its buffer enters the
> OUTPUT queue, which gets picked up by the driver and associated with
> the first destination (CAPTURE) buffer available. Then the driver grabs
> the buffers and applies the controls matching the source buffer's
> request before starting decoding with M2M.
>=20
> We have already worked on handling the case of requiring a single
> destination buffer for the different slices, by having a flag to
> indicate whether the destination buffer should be held.
>=20
> Cheers,
>=20
> Paul
>=20

--=-a03Y9zeoSdNoPYYjfFC4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXOWUQAAKCRBxUwItrAao
HJ4bAJsHTjIdeCT9PZPQR3w7zLWEl5KYCQCgr1ZkaR/Q6MGitFbyZ497MauY1uY=
=3i3J
-----END PGP SIGNATURE-----

--=-a03Y9zeoSdNoPYYjfFC4--

