Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 756732631C
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2019 13:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728761AbfEVLjb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 May 2019 07:39:31 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47]:53244 "EHLO
        mail-wm1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727464AbfEVLjb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 May 2019 07:39:31 -0400
Received: by mail-wm1-f47.google.com with SMTP id y3so1881515wmm.2
        for <linux-media@vger.kernel.org>; Wed, 22 May 2019 04:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+QoW0RnwgDHvzIpAjFCDFCzKO7YHcP9gva9zYeFBU2w=;
        b=PjiNIJsHrlzBBe0Rd6ZVoSYAID4WIUbSRZd+2eew4FuqFmwI3RLQY2+ELU0a4d4OVN
         KXhosHW0nOnpUBGx64kmAXIW0nIzKx+xsRi7J9jgZuDhPi2Pc96x8xnIjENIetm+SyIw
         3G739UOYWEG4ombR5XYfGAiyfWBjKzKdsp0sB9vz55Oats3iAhGptt8G+GqNgvvEW6QB
         2rCCkRGojNK9fXJCt1smBqG5yiEF9inlEGYRcnHCE2bjfOkVblvVLiqzvbhwRF1CXVLN
         kUbCKfOLCcRJU0U+g+tOoix6a6vKx9XySeQy/xF0F4FtZTQO9aropMSMG91U6RllVQtt
         bwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+QoW0RnwgDHvzIpAjFCDFCzKO7YHcP9gva9zYeFBU2w=;
        b=XJ73XrnHpEZ4ZAM5/f6kjhUUOEFiQveGj0k0KcqbRIQHz3T6WezG1Xr/ba3PhnJOTx
         B51g+v4cegvkRhlx2rFujnVO1yD8vjcTyTDYH4W/FIPqkvrRiVDZEUx1rDOzeM8prQsz
         /I0oDxnEfH6KVWk+/AHZQ4AwbGNz/W34OLyUc9pKrXhHNMSt3NrLpSeXS5F9qxn1LKn8
         jvzfNScOU9EqQKsMqZ7ljQ0tDnmHNWYWBT0wQWy7GHz2PJ4lLagCPaKm3V3Qx0PDA/Jj
         GocTJDk+EAtpq23VB3Tv8GfacAmtiPympEDVWpfT5PPkgPXpKXYoac9Z+5LCD8qi8/Mg
         c+yA==
X-Gm-Message-State: APjAAAWCYZoOb0TPwx2CzpMwAaEGlzrU/UZTXUWtEcZ8D5bLOKoCjYjM
        Q5GhYAYHNndWNO7u/zU7kyU=
X-Google-Smtp-Source: APXvYqzdOAmSdbmXQ+3qZazwuQdruDx7Ml+8CEunbMChUPbsPohSvUm2pKHZPaMzlvDRrOA58sbMjA==
X-Received: by 2002:a1c:1a0b:: with SMTP id a11mr2210984wma.12.1558525167103;
        Wed, 22 May 2019 04:39:27 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id c207sm5328181wme.47.2019.05.22.04.39.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 May 2019 04:39:25 -0700 (PDT)
Date:   Wed, 22 May 2019 13:39:24 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
Message-ID: <20190522113924.GE30938@ulmo>
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
 <3e0d6d5106e9c0c27ef4b11e64a488726ff77103.camel@ndufresne.ca>
 <39ded6d4ddf85849bf45abc94dc8e104fd4c0978.camel@bootlin.com>
 <20190521154358.GC7098@ulmo>
 <124db795c1ed77854be6c565092c2820776ac223.camel@ndufresne.ca>
 <CAAFQd5Cmv-CJAsQ7QdoEPYyCFLDjAJjFFLo8PMZT=zeOumnkmQ@mail.gmail.com>
 <20190522092924.116b212e@collabora.com>
 <20190522083229.GB30938@ulmo>
 <0961169f7abbecbc0f8382f946bd37dc9bea8507.camel@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LSp5EJdfMPwZcMS1"
Content-Disposition: inline
In-Reply-To: <0961169f7abbecbc0f8382f946bd37dc9bea8507.camel@bootlin.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--LSp5EJdfMPwZcMS1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2019 at 11:29:13AM +0200, Paul Kocialkowski wrote:
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
> > > > driver that was created mostly by RK themselves, we've been assuming
> > > > that the interrupt is for the complete frame, without any problems.
> > >=20
> > > I confirm that's what happens when all slices forming a frame are pac=
ked
> > > in a single output buffer: you only get one interrupt at the end of t=
he
> > > decoding process (in that case, when the frame is decoded). Of course,
> > > if you split things up and do per-slice decoding instead (one slice p=
er
> > > buffer) you get an interrupt per slice, though I didn't manage to make
> > > that work.
> > > I get a DEC_BUFFER interrupt (AKA, "buffer is empty but frame is not
> > > fully decoded") on the first slice and an ASO (Arbitrary Slice Orderi=
ng)
> > > interrupt on the second slice, which makes me think some states are
> > > reset between the 2 operations leading the engine to think that the
> > > second slice is part of a new frame.
> >=20
> > That sounds a lot like how this works on Tegra. My understanding is that
> > for slice decoding you'd also get an interrupt every time a full slice
> > has been decoded perhaps coupled with another "frame done" interrupt
> > when the full frame has been decoded after the last slice.
> >=20
> > In frame-level decode mode you don't get interrupts in between and
> > instead only get the "frame done" interrupt. Unless something went wrong
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
> > very natural way to describe it. Applications can already detect the set
> > of supported input formats and set the format when they allocate buffers
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

To be honest, my testing has been very minimal, so it's quite possible
that I've always only run into examples with either only a single slice
or multiple slices with the same configuration. Or perhaps with
differing configurations but non-significant (or non-noticable)
differences.

> You mentionned that the Tegra VPU currentyl always operates in frame
> mode (even when the stream actually has multiple slices, which I assume
> are gathered at some point). I wonder how it goes about configuring
> different slice parameters (which are specific to each slice, not
> frame) for the different slices.

That's part of the beauty of the frame-level decoding mode (I think
that's call SXE-P). The syntax engine has access to the complete
bitstream and can parse all the information that it needs. There's some
data that we pass into the decoder from the SPS and PPS, but other than
that the VDE will do everything by itself.

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

I'm not sure I understand why this would be simpler than exposing two
different pixel formats. It sounds like essentially the same thing, just
with a different method.

One advantage I see with your approach is that it more formally defines
how slices are passed. This might be a good thing to do anyway. I'm not
sure if software stacks provide that information anyway. If they do this
would be trivial to achieve. If they don't this could be an extra burden
on userspace for decoder that don't need it.

Would it perhaps be possible to make this slice meta data optional? For
example, could we just provide an H.264 slice pixel format and then let
userspace fill in buffers in whatever way they want, provided that they
follow some rules (must be annex B or something else, concatenated
slices, ...) and then if there's an extra control specifying the offsets
of individual slices drivers can use that, if not they just pass the
bitstream buffer to the hardware if frame-level decoding is supported
and let the hardware do its thing?

Hardware that has requirements different from that could require the
meta data to be present and fail otherwise.

On the other hand, userspace would have to be prepared to deal with this
type of hardware anyway, so it basically needs to provide the meta data
in any case. Perhaps the meta data could be optional if a buffer
contains a single slice.

One other thing that occurred to me is that the meta data could perhaps
contain a more elaborate description of the data in the slice. But that
has the problem that it can't be detected upfront, so userspace can't
discover whether the decoder can handle that data until an error is
returned from the decoder upon receiving the meta data.

To answer your question: I don't feel strongly one way or the other. The
above is really just discussing the specifics of how the data is passed,
but we don't really know what exactly the data is that we need to pass.

> > > The other option would be to support only per-slice decoding with a
> > > mandatory START_FRAME/END_FRAME sequence to let drivers for HW that
> > > only support per-frame decoding know when they should trigger the
> > > decoding operation. The downside is that it implies having a bounce
> > > buffer where the driver can pack slices to be decoded on the END_FRAME
> > > event.
> >=20
> > I vaguely remember that that's what the video codec abstraction does in
> > Mesa/Gallium.=20
>=20
> Well, if it's exposed through VDPAU or VAAPI, the interface already
> operates per-slice and it would certainly not be a big issue to change
> that.

The video pipe callbacks can implement a ->decode_bitstream() callback
that gets a number of buffer/size pairs along with a picture description
(which corresponds roughly to the SPS/PPS). The buffer/size pairs are
exactly what's passed in from VDPAU or VAAPI. It looks like VDPAU can
pass multiple slices, each per VdpBitstreamBuffer, whereas VAAPI passes
only a single buffer at a time at the driver level.

(Interesting side-note: VDPAU seems to require the start code to be part
of the bitstream, whereas the VAAPI state tracker in Mesa will go and
check whether a buffer contains the start code and prepend it via SG if
not. So at the pipe_video_codec level it seems the decision was made to
use annex B as the lowest common denominator).

> Talking about the mesa/gallium video decoding stuff, I think it would
> be worth having V4L2 interfaces for that now that we have the Request
> API.

Yeah, I think that'd be nice, but I'm not sure that you're going to find
someone to redo all the work...

> Basically, Nvidia GPUs have video decoding blocks (which could be
> similar to the ones present on Tegra) that are accessed through a
> firmware running on a Falcon MCU on the GPU side.

Yeah, the video decoding blocks on GPUs are very similar to the ones
found on more recent Tegra. The big difference, of course, is that on
Tegra they are separate (platform) devices, whereas on the GPU they are
part of the PCI device's register space. It'd be nice if we could
somehow share drivers between the two, but I'm not sure that that's
possible. Besides the different bus there are also difference is how
memory is managed (video RAM on GPU vs. system memory on Tegra) and so
on.

> Having a standardized firmware interface for these and a V4L2 M2M
> driver for the interface would certainly make it easier for everyone to
> handle that. I don't really see why these video decoding hardware has
> to be exposed through the display stack anyway and one could want to
> use the GPU's video decoder without bringing up the shading cores.

Are you saying that it might be possible to structure this as basically
two "backend" drivers that each expose the command stream interface and
then build a "frontend" driver that could talk to either backend? That
sounds like a really nice idea, but I'm not sure that it'd work.

> > I'm not very familiar with V4L2, but this seems like it
> > could be problematic to integrate with the way that V4L2 works in
> > general. Perhaps sending a special buffer (0 length or whatever) to mark
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

Right. So sounds like the request is the natural boundary here. I guess
that would allow drivers to manually concatenate accumulated bitstream
buffers into a single one.

Thierry

--LSp5EJdfMPwZcMS1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzlNOoACgkQ3SOs138+
s6HEig//WPNXxro3zMC5J9clZRjaCMEqBwUaHqgLXdf1thIrydA4uufg+wGsrFI1
3i6GbEld5mD1sCItxqvdEft8nbfcsxyp1t9kHG+pbDeUyE5aCKrzJaJtNJMDG98W
ZhhNkW0HeiMJb/HZLIU3kzAnpTc68ZitQ2IeXyafXgg6eZA7yXEhDGJKnHHlPgv4
buHjZL8xMwusxYuiWd8B+jrAR9H8csXLdBLrj1LkRxbFCszSXokQc51eQAmMD1S2
9ePUUnhXweEVjkWS+pFyiHVTMdlw+64hFgYu/U4ezx2HE0vKcTwXRcB/i428WOmr
L/jTeyD0n5LOjREHQjt9FDkURU0dwI1v/nq2sLces+dbiZZjc6LvDvyNP8nt3c78
jC+fgi1n6ZzSPUmnl3ANF0D4nnrM5st2hOLkjLXQiykj2wqKLC3BSPGCBE1lN1Fq
1BJuCebLC/tN0E9uHBTSi8o/g1CeN3vJnFZPSn57YRBJtvvsZTJ0kBeoTzXR6Zup
KYzvLZ4GkmBieWDQUlPF3b6LENU8tvkx8AEIvsFs0tDxfKmshI9Mw4Hf9phIyzGz
f8e04SvrGheWv0LPZS6xMPI5m8UZTE5shhg5xvz5NyRqro2ezT/h8Mi5Lk7VOC0r
Chb+iHE3rBvgGsm74DtU+jpOyex6Qi8WWTrfrzzdHsTqTt2lKIE=
=lq0x
-----END PGP SIGNATURE-----

--LSp5EJdfMPwZcMS1--
