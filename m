Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C966B269DB
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2019 20:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729372AbfEVSb4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 May 2019 14:31:56 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:36275 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729005AbfEVSbz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 May 2019 14:31:55 -0400
Received: by mail-qk1-f193.google.com with SMTP id o2so1827474qkb.3
        for <linux-media@vger.kernel.org>; Wed, 22 May 2019 11:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=NxuzGORxIBPkpa4m1tg8i86SmAMuz+tG2rKiPMn3yrE=;
        b=a2jLtyB/SNfbu4j7xswXzVcVJ/h/nku7q1+l0b0/P/8OvY5C1O6hcup+U9dAxFehp4
         XtS3ZSryO6SAYepPWEFCEGqVJh3Gck9+N/hiPc8utq6mY+Gb3CGLGfd6CCWAXK3I3j3K
         tTWP41oxGH7WySWk+eD6DW8E3w48vqM4VOWnSgl/ghlEjYwWrdaQVx96XkwPmwdglUJO
         QBMQJ86tyAnhjz1a6BtqtPsoq2AyFvs4JBZeh61PIfXgKonIGjVxFlATAJ6cDWIh/7W+
         5h4Y5Xn6Wi9H4PA+o3uHWMydZnRI7wJdvJnae9zws8IC6l1uKf7oH/Iwd3bnTJnS1Zlg
         SNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=NxuzGORxIBPkpa4m1tg8i86SmAMuz+tG2rKiPMn3yrE=;
        b=KyfzE+az5nSWJiSZbpkj59ZUwerYML3BVRAmA/A57ZGf0aRzKyj2HyuYes6ds87NjN
         VqvcIWng7O8maqWFQeicZU23HIcHcbb9Ds8sQnbis8qFxjMSjyBRtvovdBRaiRVQPKtp
         hcbrYzXcXd+7S6htfxGFbZBwqlyuNutmbWutfWqxV3iBHzxrmUBZ98/1rBwDIX8N+ju8
         84Vn3ep6415faP7XOXPgWprXV5g+EgZGB7fhNMRHvwWMgnkXf/X4mR+iNUnnTCuP1k0/
         SY2qETnm1He+nL+6v39PVu4wqDZby1Z8NHAwWYvrMOSEU5OordXrPfYp0uElFkQiQNat
         dNyg==
X-Gm-Message-State: APjAAAU2g4gF0DRGOCuS6uK8swirb4LoXbhU/Us2WCQ0vgavVV8uLy9j
        V9fiE1lqw6hkpLc9TeBvdPgkKQ==
X-Google-Smtp-Source: APXvYqxtvlTtXb3DvUtLinXpIAZCaBqgyTY1YwYeZayf5xDvVmOULR3Whl3VzS0s0qIzCj1OKCeBBw==
X-Received: by 2002:ae9:e30f:: with SMTP id v15mr18660553qkf.61.1558549914598;
        Wed, 22 May 2019 11:31:54 -0700 (PDT)
Received: from tpx230-nicolas.collaboramtl (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id s26sm145963qtk.21.2019.05.22.11.31.52
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 22 May 2019 11:31:53 -0700 (PDT)
Message-ID: <01edfeb7da13e3a6eec743cacbcee298c3b2123f.camel@ndufresne.ca>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
Date:   Wed, 22 May 2019 14:31:51 -0400
In-Reply-To: <20190522113924.GE30938@ulmo>
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
         <3e0d6d5106e9c0c27ef4b11e64a488726ff77103.camel@ndufresne.ca>
         <39ded6d4ddf85849bf45abc94dc8e104fd4c0978.camel@bootlin.com>
         <20190521154358.GC7098@ulmo>
         <124db795c1ed77854be6c565092c2820776ac223.camel@ndufresne.ca>
         <CAAFQd5Cmv-CJAsQ7QdoEPYyCFLDjAJjFFLo8PMZT=zeOumnkmQ@mail.gmail.com>
         <20190522092924.116b212e@collabora.com> <20190522083229.GB30938@ulmo>
         <0961169f7abbecbc0f8382f946bd37dc9bea8507.camel@bootlin.com>
         <20190522113924.GE30938@ulmo>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-Dn17zPEbxlLVxtS5xieP"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-Dn17zPEbxlLVxtS5xieP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 22 mai 2019 =C3=A0 13:39 +0200, Thierry Reding a =C3=A9crit :
> On Wed, May 22, 2019 at 11:29:13AM +0200, Paul Kocialkowski wrote:
> > Le mercredi 22 mai 2019 =C3=A0 10:32 +0200, Thierry Reding a =C3=A9crit=
 :
> > > On Wed, May 22, 2019 at 09:29:24AM +0200, Boris Brezillon wrote:
> > > > On Wed, 22 May 2019 15:39:37 +0900
> > > > Tomasz Figa <tfiga@chromium.org> wrote:
> > > >=20
> > > > > > It would be premature to state that we are excluding. We are ju=
st
> > > > > > trying to find one format to get things upstream, and make sure=
 we have
> > > > > > a plan how to extend it. Trying to support everything on the fi=
rst try
> > > > > > is not going to work so well.
> > > > > >=20
> > > > > > What is interesting to provide is how does you IP achieve multi=
-slice
> > > > > > decoding per frame. That's what we are studying on the RK/Hantr=
o chip.
> > > > > > Typical questions are:
> > > > > >=20
> > > > > >   1. Do all slices have to be contiguous in memory
> > > > > >   2. If 1., do you place start-code, AVC header or pass a seper=
ate index to let the HW locate the start of each NAL ?
> > > > > >   3. Does the HW do support single interrupt per frame (RK3288 =
as an example does not, but RK3399 do) =20
> > > > >=20
> > > > > AFAICT, the bit about RK3288 isn't true. At least in our downstre=
am
> > > > > driver that was created mostly by RK themselves, we've been assum=
ing
> > > > > that the interrupt is for the complete frame, without any problem=
s.
> > > >=20
> > > > I confirm that's what happens when all slices forming a frame are p=
acked
> > > > in a single output buffer: you only get one interrupt at the end of=
 the
> > > > decoding process (in that case, when the frame is decoded). Of cour=
se,
> > > > if you split things up and do per-slice decoding instead (one slice=
 per
> > > > buffer) you get an interrupt per slice, though I didn't manage to m=
ake
> > > > that work.
> > > > I get a DEC_BUFFER interrupt (AKA, "buffer is empty but frame is no=
t
> > > > fully decoded") on the first slice and an ASO (Arbitrary Slice Orde=
ring)
> > > > interrupt on the second slice, which makes me think some states are
> > > > reset between the 2 operations leading the engine to think that the
> > > > second slice is part of a new frame.
> > >=20
> > > That sounds a lot like how this works on Tegra. My understanding is t=
hat
> > > for slice decoding you'd also get an interrupt every time a full slic=
e
> > > has been decoded perhaps coupled with another "frame done" interrupt
> > > when the full frame has been decoded after the last slice.
> > >=20
> > > In frame-level decode mode you don't get interrupts in between and
> > > instead only get the "frame done" interrupt. Unless something went wr=
ong
> > > during decoding, in which case you also get an interrupt but with err=
or
> > > flags and status registers that help determine what exactly happened.
> > >=20
> > > > Anyway, it doesn't sound like a crazy idea to support both per-slic=
e
> > > > and per-frame decoding and maybe have a way to expose what a
> > > > specific codec can do (through an extra cap mechanism).
> > >=20
> > > Yeah, I think it makes sense to support both for devices that can do
> > > both. From what Nicolas said it may make sense for an application to
> > > want to do slice-level decoding if receiving a stream from the networ=
k
> > > and frame-level decoding if playing back from a local file. If a driv=
er
> > > supports both, the application could detect that and choose the
> > > appropriate format.
> > >=20
> > > It sounds to me like using different input formats for that would be =
a
> > > very natural way to describe it. Applications can already detect the =
set
> > > of supported input formats and set the format when they allocate buff=
ers
> > > so that should work very nicely.
> >=20
> > Pixel formats are indeed the natural way to go about this, but I have
> > some reservations in this case. Slices are the natural unit of video
> > streams, just like frames are to display hardware. Part of the pipeline
> > configuration is slice-specific, so in theory, the pipeline needs to be
> > reconfigured with each slice.
> >=20
> > What we have been doing in Cedrus is to currently gather all the slices
> > and use the last slice's specific configuration for the pipeline, which
> > sort of works, but is very likely not a good idea.
>=20
> To be honest, my testing has been very minimal, so it's quite possible
> that I've always only run into examples with either only a single slice
> or multiple slices with the same configuration. Or perhaps with
> differing configurations but non-significant (or non-noticable)
> differences.
>=20
> > You mentionned that the Tegra VPU currentyl always operates in frame
> > mode (even when the stream actually has multiple slices, which I assume
> > are gathered at some point). I wonder how it goes about configuring
> > different slice parameters (which are specific to each slice, not
> > frame) for the different slices.
>=20
> That's part of the beauty of the frame-level decoding mode (I think
> that's call SXE-P). The syntax engine has access to the complete
> bitstream and can parse all the information that it needs. There's some
> data that we pass into the decoder from the SPS and PPS, but other than
> that the VDE will do everything by itself.
>=20
> > I believe we should at least always expose per-slice granularity in the
> > pixel format and requests. Maybe we could have a way to allow multiple
> > slices to be gathered in the source buffer and have a control slice
> > array for each request. In that case, we'd have a single request queued
> > for the series of slices, with a bit offset in each control to the
> > matching slice.
> >=20
> > Then we could specify that such slices must be appended in a way that
> > suits most decoders that would have to operate per-frame (so we need to
> > figure this out) and worst case, we'll always have offsets in the
> > controls if we need to setup a bounce buffer in the driver because
> > things are not laid out the way we specified.
> >=20
> > Then we introduce a specific cap to indicate which mode is supported
> > (per-slice and/or per-frame) and adapt our ffmpeg reference to be able
> > to operate in both modes.
> >=20
> > That adds some complexity for userspace, but I don't think we can avoid
> > it at this point and it feels better than having two different pixel
> > formats (which would probably be even more complex to manage for
> > userspace).
> >=20
> > What do you think?
>=20
> I'm not sure I understand why this would be simpler than exposing two
> different pixel formats. It sounds like essentially the same thing, just
> with a different method.
>=20
> One advantage I see with your approach is that it more formally defines
> how slices are passed. This might be a good thing to do anyway. I'm not
> sure if software stacks provide that information anyway. If they do this
> would be trivial to achieve. If they don't this could be an extra burden
> on userspace for decoder that don't need it.

Just to feed the discussion, in GStreamer it would be exposed like this
(except that this is full bitstream, not just slices):

/* FULL Frame */
video/x-h264,stream-format=3Dbyte-stream,alignment=3Dau

/* One of more NAL per memory buffer */
video/x-h264,stream-format=3Dbyte-stream,alignment=3Dnal

"stream-format=3Dbyte-stream" means with start-code, where you could AVC
or AVC3 bitstream too. We do that, so you have a common format, with
variant. I'm worried having too many formats will not scale in the long
term, that's all, I still think this solution works too. But note that
we already have _H264 and _H264_NOSC format. And then, how do you call
a stream that only has slice nals, but all all slice of a frame per
buffer ...

p.s. In Tegra OMX, there is a control to pick between AU/NAL, so I'm
pretty sure the HW support both ways.

>=20
> Would it perhaps be possible to make this slice meta data optional? For
> example, could we just provide an H.264 slice pixel format and then let
> userspace fill in buffers in whatever way they want, provided that they
> follow some rules (must be annex B or something else, concatenated
> slices, ...) and then if there's an extra control specifying the offsets
> of individual slices drivers can use that, if not they just pass the
> bitstream buffer to the hardware if frame-level decoding is supported
> and let the hardware do its thing?
>=20
> Hardware that has requirements different from that could require the
> meta data to be present and fail otherwise.
>=20
> On the other hand, userspace would have to be prepared to deal with this
> type of hardware anyway, so it basically needs to provide the meta data
> in any case. Perhaps the meta data could be optional if a buffer
> contains a single slice.
>=20
> One other thing that occurred to me is that the meta data could perhaps
> contain a more elaborate description of the data in the slice. But that
> has the problem that it can't be detected upfront, so userspace can't
> discover whether the decoder can handle that data until an error is
> returned from the decoder upon receiving the meta data.
>=20
> To answer your question: I don't feel strongly one way or the other. The
> above is really just discussing the specifics of how the data is passed,
> but we don't really know what exactly the data is that we need to pass.
>=20
> > > > The other option would be to support only per-slice decoding with a
> > > > mandatory START_FRAME/END_FRAME sequence to let drivers for HW that
> > > > only support per-frame decoding know when they should trigger the
> > > > decoding operation. The downside is that it implies having a bounce
> > > > buffer where the driver can pack slices to be decoded on the END_FR=
AME
> > > > event.
> > >=20
> > > I vaguely remember that that's what the video codec abstraction does =
in
> > > Mesa/Gallium.=20
> >=20
> > Well, if it's exposed through VDPAU or VAAPI, the interface already
> > operates per-slice and it would certainly not be a big issue to change
> > that.
>=20
> The video pipe callbacks can implement a ->decode_bitstream() callback
> that gets a number of buffer/size pairs along with a picture description
> (which corresponds roughly to the SPS/PPS). The buffer/size pairs are
> exactly what's passed in from VDPAU or VAAPI. It looks like VDPAU can
> pass multiple slices, each per VdpBitstreamBuffer, whereas VAAPI passes
> only a single buffer at a time at the driver level.
>=20
> (Interesting side-note: VDPAU seems to require the start code to be part
> of the bitstream, whereas the VAAPI state tracker in Mesa will go and
> check whether a buffer contains the start code and prepend it via SG if
> not. So at the pipe_video_codec level it seems the decision was made to
> use annex B as the lowest common denominator).
>=20
> > Talking about the mesa/gallium video decoding stuff, I think it would
> > be worth having V4L2 interfaces for that now that we have the Request
> > API.
>=20
> Yeah, I think that'd be nice, but I'm not sure that you're going to find
> someone to redo all the work...
>=20
> > Basically, Nvidia GPUs have video decoding blocks (which could be
> > similar to the ones present on Tegra) that are accessed through a
> > firmware running on a Falcon MCU on the GPU side.
>=20
> Yeah, the video decoding blocks on GPUs are very similar to the ones
> found on more recent Tegra. The big difference, of course, is that on
> Tegra they are separate (platform) devices, whereas on the GPU they are
> part of the PCI device's register space. It'd be nice if we could
> somehow share drivers between the two, but I'm not sure that that's
> possible. Besides the different bus there are also difference is how
> memory is managed (video RAM on GPU vs. system memory on Tegra) and so
> on.
>=20
> > Having a standardized firmware interface for these and a V4L2 M2M
> > driver for the interface would certainly make it easier for everyone to
> > handle that. I don't really see why these video decoding hardware has
> > to be exposed through the display stack anyway and one could want to
> > use the GPU's video decoder without bringing up the shading cores.
>=20
> Are you saying that it might be possible to structure this as basically
> two "backend" drivers that each expose the command stream interface and
> then build a "frontend" driver that could talk to either backend? That
> sounds like a really nice idea, but I'm not sure that it'd work.
>=20
> > > I'm not very familiar with V4L2, but this seems like it
> > > could be problematic to integrate with the way that V4L2 works in
> > > general. Perhaps sending a special buffer (0 length or whatever) to m=
ark
> > > the end of a frame would work. But this is probably something that
> > > others have already thought about, since slice-level decoding is what
> > > most people are using, hence there must already be a way for userspac=
e
> > > to somehow synchronize input vs. output buffers. Or does this current=
ly
> > > just work by queueing bitstream buffers as fast as possible and then
> > > dequeueing frame buffers as they become available?
> >=20
> > We have a Request API mechanism where we group controls (parsed
> > bitstream meta-data) and source (OUTPUT) buffers together and submit
> > them tied. When each request gets processed its buffer enters the
> > OUTPUT queue, which gets picked up by the driver and associated with
> > the first destination (CAPTURE) buffer available. Then the driver grabs
> > the buffers and applies the controls matching the source buffer's
> > request before starting decoding with M2M.
> >=20
> > We have already worked on handling the case of requiring a single
> > destination buffer for the different slices, by having a flag to
> > indicate whether the destination buffer should be held.
>=20
> Right. So sounds like the request is the natural boundary here. I guess
> that would allow drivers to manually concatenate accumulated bitstream
> buffers into a single one.
>=20
> Thierry

--=-Dn17zPEbxlLVxtS5xieP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXOWVlwAKCRBxUwItrAao
HKcIAKCzajA53jJJvVXDbIT2MP5SNcY6PgCfVxgDg90qZEUR7I4pSr/89+JO20s=
=bzWh
-----END PGP SIGNATURE-----

--=-Dn17zPEbxlLVxtS5xieP--

