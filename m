Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84E463F8765
	for <lists+linux-media@lfdr.de>; Thu, 26 Aug 2021 14:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240784AbhHZM1l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Aug 2021 08:27:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:52020 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234321AbhHZM1k (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Aug 2021 08:27:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 170FD6108D;
        Thu, 26 Aug 2021 12:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629980813;
        bh=bDGtqakJbl2/aSYYv6rUc9MgzgRV4Dq+6HU0H8DYC54=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=I5yx4DzxOx7KRRjBLeDFEbg85ghhc0zYJnCkgznSSqXyJJh2D+nJrHKhd2rvkXlhN
         PjbrAu51iKv3Kxkz2ivyx70pUJPFmMvJLkpoD8KUJGmx6B0rFOfK/f2TI1ZxgvS6tK
         2drQKvR03uMuMzcPSZzrClx+JsaFFTIudO4YpxLjzJxZCUcP+P2NCtuRtN0NPbMhPz
         O5M/bnXoikvrLDga7UQ9/70hhyCZl93d38rBfC43VQv9vZ4wTcB1wAtL1dSERPtDe2
         cI773QrGPX4pFX9rHRVPa05sBcypRudsyKmIA1JE+5dxKPduH2+Gai2t7af4p0ZJRX
         zEEDzC1h5Lzfg==
Date:   Thu, 26 Aug 2021 14:26:49 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Manu Abraham <abraham.manu@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Soeren Moch <smoch@web.de>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Regression 5.14] media: dvb userspace api
Message-ID: <20210826142649.142b967a@coco.lan>
In-Reply-To: <CAHFNz9L6W=zMjMZJRgtmiAwY9xHiM06Cp52GS0swy5awUoxpOQ@mail.gmail.com>
References: <4e3e0d40-df4a-94f8-7c2d-85010b0873c4@web.de>
        <20210819133128.45ef4353@coco.lan>
        <c56ec571-2278-95e9-2028-990e03159c3f@web.de>
        <20210822194709.4b9d33d4@coco.lan>
        <be6ac929-2443-ff55-3e11-6a86d6472e0e@web.de>
        <CAHk-=wjSadWPfzQ_hOqbjq6c_xwJs8GLHTyznhXRvDF5Yrs4FA@mail.gmail.com>
        <CAHFNz9L29LK+L8LjqyTyqq3LsvzeA6iYFHwP9n3uNBbqbbm1bg@mail.gmail.com>
        <20210825083305.562eba48@coco.lan>
        <CAHFNz9L6W=zMjMZJRgtmiAwY9xHiM06Cp52GS0swy5awUoxpOQ@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 25 Aug 2021 21:46:23 +0530
Manu Abraham <abraham.manu@gmail.com> escreveu:

> > The "full-featured" API that it is implemented on av7110 always had
> > troubles. This is not only my view, but also the view of the
> > original API authors,as can be seen at the DVBv4 WIP documentation:
> >
> >         https://www.linuxtv.org/downloads/legacy/linux-dvb-api-v4/linux=
-dvb-api-v4-0-3.pdf
> >
> > It clearly says that, on chapter 2.2:
> >
> >         "2.2 Linux DVB API Version 3 problems =20
>=20
>=20
> That's very misleading ! In fact, the legacy V3 API was upgraded to 3.1 a=
nd 3.2
> and those issues were ironed out. You are talking about V3 while V3.2
> fixed those
> issues.

No. When Linux version 2.6.12-rc2 started using git, the DVB API version
was already 3.1. This was in April, 2005, which is the the same date that
rev 0.3 of the DVBv4 spec was released[1].=20

[1] https://www.linuxtv.org/downloads/legacy/linux-dvb-api-v4/linux-dvb-api=
-v4-0-3.pdf

DVB API version 3.2 was merged in 2007 on this commit:

  commit 2435be11ae1afb64ac7dfb25e10b6e3037ab0522
  Author: Hans Verkuil <hverkuil@xs4all.nl>
  Date:   Fri Apr 27 12:31:09 2007 -0300

    V4L/DVB (5307): Add support for the cx23415 MPEG decoding features.
   =20
    The cx23415 adds some extra features that this DVB decoding API did
    not support. This API has been expanded to support the required
    features. Both source and binary backwards compatibility is kept
    intact by these changes. So existing applications are not affected.
   =20
    Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
    Signed-off-by: Ralph Metzler <rjkm@metzlerbros.de>
    Signed-off-by: Oliver Endriss <o.endriss@gmx.de>
    Signed-off-by: Mauro Carvalho Chehab <mchehab@infradead.org>

The focus of this change was to add support to better control a MPEG2=20
decoder on an analog TV hardware (IVTV). That didn't bring any uAPI change=
=20
for av7110.

Between 3.1 and 2435be11ae1a ("V4L/DVB (5307): Add support for the cx23415=
=20
MPEG decoding features."), there were a couple of changes:

	+#define AUDIO_GET_PTS              _IOR('o', 19, __u64)
	+#define VIDEO_GET_PTS              _IOR('o', 57, __u64)
	-#define DMX_GET_EVENT            _IOR('o', 46, struct dmx_event)
	+#define FE_TUNE_MODE_ONESHOT 0x01
	+#define FE_SET_FRONTEND_TUNE_MODE  _IO('o', 81) /* unsigned int */

Those don't cover the main proposed changes at DVBv4. Btw, what it is
said there at at chapter 2.2[1] is still true:

	"Because of the architectual problems of the core, the=20
	 inconsitency of the API and the lack of zero-copy DMA it=E2=80=99s not
	 possible to simply extend the existing API. A complete new
	 design is inevitable."

> > The "modern" there refers to hardware back in 2005! =20
> This is exactly what I wrote just above.

Precisely.

> Multiple frontends, tuners/demods, CAM's were already supported
> There is no encrypt/decrypt hardware, either you have hardware
> CAM's or SoftCAM's, which do the decryption for DVB streams.
> These already exist with the old API itself.

Yes, support for multiple fontends/demux/demods were added, but the
A/V API only supports a 1:1 mapping between demux---> demod:
=20
	typedef enum {
		VIDEO_SOURCE_DEMUX, /* Select the demux as the main source */
		VIDEO_SOURCE_MEMORY /* If this source is selected, the stream
				comes from the user through the write
				system call */
	} video_stream_source_t;

	typedef enum {
		AUDIO_SOURCE_DEMUX, /* Select the demux as the main source */
		AUDIO_SOURCE_MEMORY /* Select internal memory as the main source */
	} audio_stream_source_t;

On other words, zero-copy decoding is only possible with 1:1 mapping:

	demux0 should route the video PID to video0 codec,
	demux1 should route the video PID to video1 codec
	...
	demux<n> should route the video PID to video<n> codec

There's no way to route a PID from demux3 to be handled by video0.

Btw, if demux0 is filtering multiple video channels and the
video codec accepts only a single video, with the current API,=20
what channel would be decoded by its video0 codec? There's no way to
set it with the existing API.

> The S2 6400, KNC S2 Twin and most others do have multiple first
> and second generation frontends.
>=20
> The DVB demux provides multiple PID's, you can have multiple PiP's
> whatever you want.

There's no provision at the API to control any parameters of PiP (like=20
setting the position/size of the overlay area).

Also, chipsets for TV sets expect zero-copy transfers between video decoders
and GPU DRM planes. Most of such hardware are implemented with two separate
chips (or two separate areas at the same silicon):=20

	- GPU + ISP + video memory;
	- ARM CPU.

On such hardware, copying buffers via CPU is a very expensive operation.=20
So, hardware pipelines should be programmed. For instance:

	frontend1 -> demux3 -> video0 -> DMA buffer 0
	frontend1 -> demux3 --OSD pid--> DMA buffer 2
	frontend1 -> demux3 --audio pid--> Audio input 0

	frontend0 -> demux0 -> video1 -> DMA buffer 1
	frontend0 -> demux0 --OSD pid--> DMA buffer 3

Then, the GPU's compositor will be programmed to properly place
each DMA buffer at the composed PiP display, on whatever position
the second video will be positioned at the composite screen.

> For some SoC's with A/V codecs what you are saying is true.
> It does not make sense for PCTV hardware to use the pipelines
> you apparently describe. Such SoC's make use the extended API that
> you advocate, but the standard PCTV, or standard STB hardware
> we all are used to need not use the convoluted API being advocated.
> For those SoC's one may use the V4L2 output. But for DVB output
> devices, it makes no sense but going many steps backwards to use
> the V4L2 output.

The existing API works for simple hardware like av7110, but, in order
to support what current chipsets provide, it has to be re-designed.
As explained said at DVBv4 session 2.2[1]:

	"Linux DVB API Version 3 was focussed on the popular Siemens
	 PCI DVB card."

> > From driver's perspective, it makes no sense to keep support for av7110,
> > as TI stopped production of TMS320AV7110 a very long time ago. They
> > don't even mention this product number anymore on their website.
> > =20
>=20
> What I meant: If there are some users for some hardware, it is impolite
> to rip them out, especially when someone is volunteering to maintain them.
> Rather than impolite, that's quite rude and arrogant.
>=20
> I believe that is the de facto Linux kernel principle still, unless
> there is some
> real reason to rip it out.
>=20
> FWIW, my 2c worth:
> a) leave the headers where they belong, already done by Linus.

Linus actually asked to copy such headers to the VDR source code.

> b) av7110: hand over the maintenance to someone who is happy and has
> time to fiddle around with

Nobody that actually uses av7110 hardware (if are there any users for such
hardware nowadays) ever sent a single patch upstream for quite a long time.

See, from 2013 to today, there were 81 patches applied on it:

	$ git lg --since 2013 --follow -- drivers/media/pci/ttpci/|wc -l
	81

None of those were produced by someone actually using av7110.

No av7110 users ever replied to any of those patches with a Tested-by.

So, nobody has shown any time/interest on maintaining it upstream for
quite a long time.

> c) Pull in the saa716x driver. I wrote the saa716x driver with NXP support
> and with additional help from the community. It would be good to maintain
> the credits to the original developers though.
>=20
> You can pull the saa716x driver from Soeren, if he needs some help,
> I can chip in whatever possible way. Let him have some fun with the drive=
r.

It won't make any good to upstream a driver before discussing the API.

Even low-end PC hardware (like those with Atom CPUs) nowadays are capable
of decoding MPEG2 - and other video codecs - in hardware (at the GPU).
This was a reality even back in 2005, as said at the DVBv4 doc,
at section 2.1[1]:

	'PCs and embedded platforms are divering. For PCs, new cards are
	 only available as =E2=80=9Dbudget=E2=80=9D cards, which means that they o=
nly=20
	 provide the full, raw, unmodified TS to the system and put the
	 burden of handling the data to the main CPU.

	 On embedded platforms, however, dedicated STB/IDTV chipsets
	 demultiplex the data for direct application use and specialized=20
	 hardware or firmware on DSPs relieves the main CPU greatly.'

As Honza pointed, a large amount of users of such API are the ones that have
a DreamBox STB and decided to build their own firmware (like opendreambox),=
=20
running a Kernel based on downstream patches[2].

Clearly, the main usage for a full-feat api is on Embedded hardware.

[2] For them, it doesn't matter what API is at the upstream=20
    Kernel. All that matters is that the userspace software (like VDR)
    shall implement whatever API is used to communicate with the=20
    Enigma/Enigma2 DVB drivers.

Thanks,
Mauro
