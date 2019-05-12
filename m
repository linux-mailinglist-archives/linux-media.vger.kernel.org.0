Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A7E01AD10
	for <lists+linux-media@lfdr.de>; Sun, 12 May 2019 18:32:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbfELQcl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 May 2019 12:32:41 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:39397 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726604AbfELQcl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 May 2019 12:32:41 -0400
X-Originating-IP: 93.29.109.196
Received: from collins (unknown [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 7F4EF240005;
        Sun, 12 May 2019 16:32:36 +0000 (UTC)
Message-ID: <bfe1680249569241227ab90d5736b228de7b10f9.camel@bootlin.com>
Subject: Re: Hardware-accelerated video decoders used through a firmware
 instead of hardware registers
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Date:   Sun, 12 May 2019 18:32:23 +0200
In-Reply-To: <69c10fdd26566049c523d4c8cfb1b8c35018b738.camel@ndufresne.ca>
References: <19804f842e80f1f8bd85b8eb49e75e149abf0062.camel@bootlin.com>
         <69c10fdd26566049c523d4c8cfb1b8c35018b738.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

Le dimanche 12 mai 2019 à 10:17 -0400, Nicolas Dufresne a écrit :
> Le dimanche 12 mai 2019 à 13:35 +0200, Paul Kocialkowski a écrit :
> > Hi,
> > 
> > With the work done on the media request API and the cedrus driver for
> > Allwinner ARM SoCs, we now have a kernel interface for exposing fixed-
> > hardware video decoding pipelines (currently MPEG-2 and H.264, with
> > H.265 on the way). Some work remains on the per-format interface and we
> > are looking to improve latency-related aspects, but we are all set to
> > have a nice interface here, that plays well with e.g. ffmpeg.
> > 
> > A specific situation came to my interest, which is apparently quite
> > common: some platforms have general-purpose microcontrollers embedded,
> > which can help with video decoding. They are however rarely to never
> > used to do the decoding itself (since they are general-purpose, not
> > DSPs) and just coordinate the decoding with the fixed-pipeline decoding
> > hardware block. The advantage is that the interface is just a simple
> > mailbox and the raw video bitstream from the file can be passed
> > directly without the need for userspace to do any parsing that the
> > codec requires.
> > 
> > One side-effect from this setup is that the actual hardware register
> > layout of the decoder is hidden away in a non-free piece of
> > microcontroller firmware, that's usually loaded at run-time.
> > 
> > With the recent developments on the media interface, we could interface
> > with these hardware decoders directly, which offers various advantages:
> > - we no longer need a 3rd party external non-free firmware, which just
> >   makes distribution easier for everyone and allows support in fully-
> >   free setups;
> > - all the usual advantages of having free code that can be fixed and
> >   updated instead of an obscure binary that many not always be doing
> >   the right thing;
> > - parsing of the slices is probably best done in userspace, and I
> >   heard that ffmpeg does this threaded, so there could be a latency
> >   advantage there as well, not to mention that it avoids the drag of
> >   a mailbox interface altogether;
> > - the general-purpose micro-controller can then be reused for something
> >   useful where it could actually make a performance difference.
> > 
> > As far as I understand, it seems that the video decoder for MT8173
> > fails in that category, where a MD32 general-purpose micro-controller
> > is used to only do the parsing. We even have device-tree nodes about
> > the decoder and encoder, but no register layout.
> > 
> > So I was wondering if the linux-media community should set some
> > boundaries here and push towards native implementations instead of
> > firmware-based ones. My opininon is that it definitely should.
> > 
> > It seems that other platforms (e.g. Tegra K1 and onwards) are in the
> > same situation, and I think the ChromiumOS downstream kernel uses an
> > obscure firmware on a general-purpose auxiliary ARM core (that's also
> > used at boot time IIRC).
> 
> I like the idea, but enforcing this now is likely going to prevent a
> lot of mainline usage of CODECs (which are proprietary by patents to
> start with).

This would probably be the general feeling of the industry, but the
situation is turning anyway, now that we have already started exposing
this for Allwinner and Rockchip, that things are already reversed for
Tegra and there are docs about more platforms (e.g. the i.MX8 decoder).

So maybe companies need to understand that this is the proper way to do
things at this point and re-think their approach. Right now, Linux as a
project is in a situation where it has leverage over these entities to
push them to do the right thing, by setting a high level of standards
like it has often done in the past. So I see an opportunity to push
against non-free firmware and bad software design in general, which
will overall be beneficial in the long run.

> One thing to note, the CODEC accelerators may not be
> accessible from CPU. So to support such idea, we'd need to develop
> minimalist firmware to access these accelerators. That would require a
> lot of reverse engineering as the third party codec vendors (e.g.
> Chips&Media, Allegro etc.) don't document the accelerator or even the
> architecture of the micro-controller. Compilation of these firmware can
> also become tedious, specially if there is no Open Source compiler for
> the chosen micro-controller architecture.

It would be interesting to start a collection of such free firmwares
for cases where something absolutely needs to run on an auxiliary CPU.
I think there are efforts by Intel to do something similar for audio
DSPs with the Sound Open Firmware and our situation is not that much
different.

In our setup, the firmware would have considerably less to do (no
parsing, just pushing values prepared by the driver to the actual
registers), so perhaps some minimal assembly code with a simple
assemblers could work out. There could be no need to bring-in
equivalents to complex build software used for significant firmwares.

But that would also create incentive for bringing up these side-CPUs
into our free compilers (and there's sdcc for devices that are not 32-
bit or need custom C semantics). With that, one could write just any
firmware for using the auxiliary processor to suit their needs and
purposes. I think that's a great way to explode the "firmware that
sucks" bubble we have today.

> I can comment on ChromeOS, current generation is mostly based on
> Rockchip SoC. The CODEC on Rockchip are just accelators, and this is
> what ChromeOS team implemented, and that's what the stateless you have
> done is based upon. The first generation was Samsung Exynos, this one
> uses a unknown source design that they call MFC. This runs on
> proprietary blob, I have not found any information about this blob.

My bet is that it's also backed by a hardware pipeline. From the looks
of it, the whole block runs at 200 MHz on the Exynos 4 and does full HD
H.264. Given the size of the firmware, there's just no way it's doing
all that on the aux CPU.

I would be curious to know what the situation is on the i.MX6 coda
block, which also seems pretty obscure.

> The early boot stage is not obscure, it's called CoreBoot. This code is
> meant to initialize your CPU when you CPU isn't started yet.

Hehe, obscure was about the VPU firmware itself, not so much the ARM
core and how it's used at boot :) And it so happens that I have been
contributing to coreboot on Tegra K1 (and actually fixed mainline
support for the nyan big and nyan blaze chromebooks, the Acer and HP
Tegra K1 ones).

Come to think of Tegra and nVidia, this could also apply to nouveau
which currently relies on non-free firmware for video decoding, which
is basically the same situation but on a GPU (in that case, a firmware
to access the registers is probably required too). Not sure whether
these cores are Falcon or not and if so we may already have our first
candidate with an assembler available.

>  Notably on
> Intel, there has been a lot of security concerns with this proprietary
> blob, CoreBoot effort includes reverse engineering and replacing this
> bit. At least on Intel blobs, the micro-controller is still running
> after your main CPU is loaded, giving attackers a place to run with
> true full access to your computer, without being detectable.

I think you're talking about the Intel ME, which is indeed a major
concern on Intel. Oh but guess what, they enabled JTAG on that ARC chip
earlier than signature check time, so we could effectively manage to
neuter that chip (or better, get it to run with a free firmware, since
it needs one anyway to operate critical power stuff) by using a
hardware JTAG add-on which would just skip the signature checking step
in the bootrom at startup. That's an exploit that I've been thinking
about recently and from the looks of it, a bunch of other platforms
could be concerned regarding their "secure boot" mechanism.

All the more opportunities for running free software at the boot and
firmware levels and actually deciding on our own threat models (which
may or may not include the chip manufacturer as trusted).

It's incredible that after so much time they haven't figured out this
basic thing about security, that it's not an absolute thing but depends
on the thread model assigned by the user. Unless that whole security
thing was just a scarecrow to push the pill of threat models where the
user is considered a menace to the system to keep oh precious DRM keys
safe and out of reach.

And it's not like both are incompatible either, ChromeOS gets this
quite right. Keep the root of trust a ground-wired pin of the boot SPI-
NOR flash chip and you're good, add a RW screw there and everyone's
happy. It's not that hard, really.

> On some platforms it can be even more complex. Think of the Xilinx
> ZynMP. Documentation is pretty sparse, it's clear the VCU is only
> accessible from the FPGA, and that's probably why we need a MicroBlaze
> firmware (micro blaze being a micro-controller architecture programmed
> into some part of a Xilinx FPGA) in order to use it. But then, it is
> not clear if the VCU is fully capable of decoding, or if the work is a
> mix of FPA and circuit. So replacing the firmware could be the same as
> rewriting the CODEC HW (or at least some bits of it).

I guess there are a few examples of such complex cases, as well as DSPs
being used for decoding (it's the case on OMAP3, not sure what it's
like on 4 and 5, that IVA-HD thing could just be a firmware gateway to
a hardware pipeline too).

Cheers,

Paul

