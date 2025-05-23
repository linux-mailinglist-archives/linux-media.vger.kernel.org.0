Return-Path: <linux-media+bounces-33253-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA0AAC2201
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 13:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FDF6A45E2B
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 11:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6F58231839;
	Fri, 23 May 2025 11:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZMI4g2V3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E2122A811;
	Fri, 23 May 2025 11:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748000012; cv=none; b=C0oxwr28/BD5QqwXB6YTQjJgNcKE49hfw3r4GhZ3iN1budvL+yHZJiS6tEZEikMeDcMn2Jl2CppACi4nLZNCGWBP958MbcH9w/vBA9D4WBJMzYlu7II/BpPGvSUJT2vQQ1eUIZagEardTU/OAvwPA7tM7e+grp/u2heUngPPjG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748000012; c=relaxed/simple;
	bh=+AdCLW58O2v6UqjFap1e1Sh72SHswmLyGTAeC0TkxVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GGMEps5ifonmZ9h7oszBcrwDTNOutPyX6XH14aND2XTnqwjbqhIcU5CUKPxmGCHNO+P6+5MhZbRwy05hsiLvNRpnXXp7VG1EjumTZf9aM86Kvq2qBReBmSq2bnlsylpzW3e3nBKh97NUIuAfj+QUWyIYyh6k1g8MkHLO8zI07Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZMI4g2V3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77B3A6B5;
	Fri, 23 May 2025 13:33:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747999985;
	bh=+AdCLW58O2v6UqjFap1e1Sh72SHswmLyGTAeC0TkxVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZMI4g2V3vFwanYXprRF1UcZ/4UHtYQy4RnRRrTj9LcW/kQxms3izizpjLZYyC/1IT
	 S9hW1pdyse1KOMX97NhB7ni1fIIuAlT0gI1xQGOeawgsWdFLDKbgHXxH1nqFYRlLmh
	 DRctBdSue6NLMDPvbr7d+BmuQ2fM8iTtIOtzpjJA=
Date: Fri, 23 May 2025 13:33:24 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
	Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Enable MIPI filtering by DT on i.MX8M*
Message-ID: <jqjptsphbtdtziuucehxutseaz7j4kjiirz2hk77f3dznswvza@avbjjzu3jcam>
References: <m3h61u9jy2.fsf@t19.piap.pl>
 <20250509103733.GE28896@pendragon.ideasonboard.com>
 <m3o6vn8np5.fsf@t19.piap.pl>
 <iegnn5xoosqpk52hvipcr73aliwhqtsq6r6ctvt5756bhy6yen@rqcdongb7fdf>
 <m31psg97dy.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m31psg97dy.fsf@t19.piap.pl>

Hi Krzysztof

On Thu, May 22, 2025 at 02:06:49PM +0200, Krzysztof Hałasa wrote:
> Hi Jacopo,
>
> Jacopo Mondi <jacopo.mondi@ideasonboard.com> writes:
>
> > However the i.MX8MP does implement INTERLEAVE_MODE, and it's anyway
> > marked as V3.6.3, so DT filtering is there disabled as well. I guess
> > this is intentional, see below...
>
> BTW the version register on iMX8MP is 3060301, which may possibly mean
> something like 3.6.3.1. I wonder if 8MM has the same.
>
> > some registers like 32E4_000C are not listed in the peripheral memory
> > map, so you're probably reading an invalid memory area there
>
> Sure - those are apparently wired to contain "DEADCAFE" (a hex value).
>
> > If you're capturing RAW12 in 1920x1080 these two registers are
> >
> > 32E40040: (MIPI_CSI1_ISP_CONFIG_CH0) = 0xb0
> > 32E40044: (MIPI_CSI1_ISP_RESOLUTION_CH0) = 0x4380780
> > 32E40048: (MIPI_CSI1_ISP_SYNC_CH0) = 0
> > 32E4004c: invalid
>
> Sure.
>
> >> 32E40050:      8FD 80008000        0 DEADCAFE <<< ISP_CONFIG1
> >> 32E40060:      8FE 80008000        0 DEADCAFE <<< ISP_CONFIG2
> >> 32E40070:      8FF 80008000        0 DEADCAFE ???
> >
> > All of these are invalid registers
>
> Only those DEADCAFEs are strictly invalid, the rest is just
> undocumented. With the notable exception of version register, they
> aren't probably useful, though - due to the way the CSIC is connected to
> the rest of the chip.
>
> I only mentioned them because Laurent asked about capturing embedded
> data - I guess the registers could be used for that on some other chip
> (apparently not on i.MX8MP).
>
> > We have been using 8mp extensively with sensors that produce embedded
> > data and afaict ED are not in the final image.
>
> Well, I admit I haven't looked it down to this finest detail. The
> visible effect was the image was slightly corrupted without the DT
> filtering, so I assumed ED was doing that.
>
> I use two similar sensors: IMX290 (on CSI1) and IMX462 (CSI2). It
> appears IMX290 doesn't cause the problem, while IMX462 does. This may
> depend on the CSI used, though. Both sensors seem to produce the
> following MIPI packets (counting from start of video frame, 1920x1080p25
> raw 12 bit):
> - Frame Start: DT=0
> - a short Embedded data packet, DT=12h
> - a NULL packet, line-sized, DT=0x10
> - 10 User Defined 8-bit Data Type 8 packets, line-sized, DT=0x37, called
>   apparently "Vertical OB" by Sony datasheet

These are optically black pixels and should probably be discarded by
the gasket as well as embedded data ?

> - 1080 real lines, DT=0x2C, 12-bit RGGB data
> - short Frame End packet, DT=1
>
> I hope I got this right, this is straight from oscilloscope (only
> checked IDs on IMX462, will confirm IMX290 later but it looks the same).
> In 1280x1080p25 mode there are 4 (not 10) "vertical OB" packets, and 720
> RGGB lines instead of 1080.

Is this correct ? you ask for 1280x1080 and get back 720 lines ?

>
> The ED packet is much shorted than an RGGB line data (2.32us vs 13.57 us
> or 3.54us vs 13.88us - 1080p and 720p use different MIPI clock rates).
>
> So yes, this whole ED packet definitely doesn't end up in the image.

Great to know!

> IMX462 produces just a tiny 2-pixel dot in the left top corner, possibly
> shifting some data to the right (I remember it did that, but I can't
> observe it now - could be a kernel (driver) version change?).

What are those two pixels ? Does the datasheet describes them ?

>
> > My understanding is that the gasket that connects the CSIS to the ISI
> > and the ISP has a filtering register has well, and there is where ED
> > gets discarded. Could you maybe check the value of register GASKET_0_CTRL
> > to confirm this ?
>
> (with the filtering)
>
> MEDIA_BLOCK_CTRL:
>    32EC0000h   1FFFFFFh Media Mix Software Reset Register (IMX_MEDIA_BLK_CTRL_SFT_RSTN)
>    32EC0004h     70700h Media Mix Clock Enable Register (IMX_MEDIA_BLK_CTRL_CLK_EN)
>       Clock enabled: ISP_CLKs MIPI_CSI2_CLKs BUS_BLK_CLK
>    32EC0008h  40000000h MIPI PHY Control Register (MIPI_RESET_DIV)
>    32EC004Ch      FC00h LCDIF ARCACHE Control Register (LCDIF_ARCACHE_CTRL)
>    32EC0050h  1FF00000h ISI CACHE Control Register (ISI_CACHE_CTRL)
>    32EC0060h          0 Gasket 0 output disabled
>    32EC0090h          0 Gasket 1 output disabled

indeed gaskets seems to be disabled when using the ISP


>    32EC0138h    2D8000h ISP Dewarp Control Register (ISP_DEWARP_CONTROL)
>       ISP ID mode 0, ISP1: DT 0h (unknown), ISP2: DT 2Ch (RAW12) left-just mode

But this other register has (again) one other filtering option and
reading the value here it is set to filter RAW12 (mipi_isp2_data_type)

Weirdly enough, I don't see this register being programmed in the
mainline gasket driver...

>
> MIPI_CSI2:
>    32E50000h   3060301h CSIS version (MIPI_CSIS_VERSION)
>    32E50004h      4705h CSIS Common Control Register (MIPI_CSIS_CMN_CTRL)

Do you mean 0x14705 ? I'm asking because Shadow Crtl is BIT(16). Surprisingly
BIT(14) is marked as reserved in the datasheet version I have


>       Filtering by DT, Update shadow ctrl, 4 data lanes
>    32E50008h     F0000h CSIS Clock Control Register (MIPI_CSIS_CLK_CTRL)
>    32E50010h  FFFFFFFFh Interrupt mask register 0 (MIPI_CSIS_INTMSK)
>    32E50020h        F0h D-PHY status register (MIPI_CSIS_DPHYSTATUS)
>       Clock lane: Active, Data lanes: 0: Stop, 1: Stop, 2: Stop, 3: Stop
>    32E50024h   600001Fh D-PHY common control register (MIPI_CSIS_DPHYCTRL)
>    32E50030h       1F4h D-PHY Master and Slave Control register Low (DPHY_MASTER_SLAVE_CTRL_LOW)
>    32E50040h        B0h ISP Configuration Register (MIPI_CSIS_ISPCONFIG_CH0)
>       DT 2Ch (RAW12)
>    32E50044h   2D00500h ISP Resolution Register (MIPI_CSIS_ISPRESOL_CH0) => 1280 * 720
>    32E50080h        B0h Shadow Configuration Register (MIPI_CSIS_ISPCONFIG_CH0)
>       DT 2Ch (RAW12)
>    32E50084h   2D00500h Shadow Resolution Register (MIPI_CSIS_ISPRESOL_CH0) => 1280 * 720
>    32E50100h      25E2h Frame Counter (FRAME_COUNTER_CH0)
>
> This produces (test_pattern=5 which starts with black, using ISP):
> Y =  00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00...
> UV = 80 80 80 80  80 80 80 80  80 80 80 80  80 80 80 80...
>
> Now I do (perhaps I should revert the patch instead):
> ./devmem write32 0x32E50004 0x14305
>
> and this does:
> Y =  E6 FF 36 1B  00 00 00 00  00 00 00 00  00 00 00 00...
> UV = 85 6A 74 B4  7D 8C 80 80  80 80 80 80  80 80 80 80...
>
> Maybe I could see where these values come from.
>
>
> With test_pattern = 4
> Y =  52 52 4E 4D  14 14 00 00  00 00 00 51  52 52 4E 4D...
> UV = 82 83 82 83  81 81 80 80  80 80 81 80  82 83 82 83...
> changes into (without filtering):
> Y =  9B 99 58 53  14 14 00 00  00 00 00 51  52 52 4E 4D...
> UV = 77 AE 78 9A  81 83 80 80  80 80 81 80  82 83 82 83...
>
> The values are stable but it seems they are added/xored/etc. with the
> original image data or something.
>
> > In particular the "Gasket 0 data type" is programmed in
> > drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c with the data
> > type of the first stream reported by the sensor with get_frame_desc().
> > In your case, assuming RAW12 you should have 101100b in that register.
>
> Gaskets are disabled. I will try to do some tests tomorrow.
>

I know that the internal working of the gasket and the cross-bar are
not entirely clear and very bad documented. I wouldn't be against
enabling filtering on the CSIS but
1) if we ever want to capture embedded data the change should be
reversed
2) it would be nice to actually understand where ED are filtered if
gaskets are disabled

> > Now, I think the idea was to use the gasket for filtering ED (and
> > other non-image data) to be able to route them to the ISI for capture,
> > while images are sent to the ISP for processing. This is currently not
> > implemented and there are some unclear parts in the documentation
> > about this, but overall my expectation is that ED are filtered by the
> > gasket so you shouldn't need to enable DT filtering on the CSIS.
> --
> Krzysztof "Chris" Hałasa
>
> Sieć Badawcza Łukasiewicz
> Przemysłowy Instytut Automatyki i Pomiarów PIAP
> Al. Jerozolimskie 202, 02-486 Warszawa

