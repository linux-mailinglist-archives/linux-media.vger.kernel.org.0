Return-Path: <linux-media+bounces-33636-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EDEAC898C
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 09:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04C833AB464
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 07:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3C3B2135DD;
	Fri, 30 May 2025 07:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BV1KlzZZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA2820E6E3;
	Fri, 30 May 2025 07:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748591800; cv=none; b=UJPbngf9hZ32+Wy5s4VYKDeE8gMGurIZvdqtxrX7b90F18sMeZWpXEtVKW8OWuHzuujOwR0SLKtjhP5odtaf70eeH0KgPWR6dV9U0UzhgHi0QgXBGeDCF6V/9KtSPa021JVvC0/ZPMHK8InRMDLaDmZBvdvoBBpLih7iq2sT7ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748591800; c=relaxed/simple;
	bh=uO3O3inxposTI0kQEYf2CJBUDFQHsCwBhLgCj9tgYIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XjBik3//9H/6icYz6CXvvCTmbKF+pV7juxSL7aLgI6PYf/LpQUFy0eUFZPj3T9cD+zsMT5CvrN9FROTsWfnxo1l/3qOq1CNu9V9cYN7p7BdFQFxP5q691SDzNgymdaG3LQllQgvjVE57tKOinjRm6Q+RSERRWTR/2YW283S+hQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BV1KlzZZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-143-247.net.vodafone.it [5.90.143.247])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65AC782E;
	Fri, 30 May 2025 09:56:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748591768;
	bh=uO3O3inxposTI0kQEYf2CJBUDFQHsCwBhLgCj9tgYIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BV1KlzZZI7s9MALqSYrJAL9VWbB9HE0WU5uVPB39ajpQA8s6PyZjeOUxXn2t5j836
	 A+T8efsnTiEsKB+363tozLYudNVpQTzQ7lSN2AHPfJWiVAin+/itZAEcPHbrlk2Fl+
	 2U8T7SgXyamo3LoB5eJOnOUkGgxOYduym9mZsBqA=
Date: Fri, 30 May 2025 09:56:32 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>, 
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
	Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Enable MIPI filtering by DT on i.MX8M*
Message-ID: <2fd6wgsiwfx4raharcrpmmtayhkipjnz64u2cbprhsxkna3lhv@yshftexhmgns>
References: <m3h61u9jy2.fsf@t19.piap.pl>
 <20250509103733.GE28896@pendragon.ideasonboard.com>
 <m3o6vn8np5.fsf@t19.piap.pl>
 <iegnn5xoosqpk52hvipcr73aliwhqtsq6r6ctvt5756bhy6yen@rqcdongb7fdf>
 <m31psg97dy.fsf@t19.piap.pl>
 <jqjptsphbtdtziuucehxutseaz7j4kjiirz2hk77f3dznswvza@avbjjzu3jcam>
 <m3o6vb64hv.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3o6vb64hv.fsf@t19.piap.pl>

Hi Krzysztof
  thanks for the detailed analysis

On Thu, May 29, 2025 at 01:27:56PM +0200, Krzysztof Hałasa wrote:
> Hi Jacopo,
>
> Jacopo Mondi <jacopo.mondi@ideasonboard.com> writes:
>
> >> - 10 User Defined 8-bit Data Type 8 packets, line-sized, DT=0x37, called
> >>   apparently "Vertical OB" by Sony datasheet
> >
> > These are optically black pixels and should probably be discarded by
> > the gasket as well as embedded data ?
>
> Yes, apparently.
>
> >> I hope I got this right, this is straight from oscilloscope (only
> >> checked IDs on IMX462, will confirm IMX290 later but it looks the same).
> >> In 1280x1080p25 mode there are 4 (not 10) "vertical OB" packets, and 720
> >> RGGB lines instead of 1080.
> >
> > Is this correct ? you ask for 1280x1080 and get back 720 lines ?
>
> Well, no, I just checked both modes and these are the differences.
> IOW, nothing unexpected. Wrong copy & paste or so.
>
> >> IMX462 produces just a tiny 2-pixel dot in the left top corner, possibly
> >> shifting some data to the right (I remember it did that, but I can't
> >> observe it now - could be a kernel (driver) version change?).
> >
> > What are those two pixels ? Does the datasheet describes them ?
>
> Nope, I guess it's a silicon bug. It corrupts 3 RAW-12 pixels, though
> (32 bits > 2 * 12 bits).
>
> >>    32EC0138h    2D8000h ISP Dewarp Control Register (ISP_DEWARP_CONTROL)
> >>       ISP ID mode 0, ISP1: DT 0h (unknown), ISP2: DT 2Ch (RAW12) left-just mode
> >
> > But this other register has (again) one other filtering option and
> > reading the value here it is set to filter RAW12 (mipi_isp2_data_type)
> >
> > Weirdly enough, I don't see this register being programmed in the
> > mainline gasket driver...
>
> I guess it's drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:
>
> static int rkisp1_gasket_enable(struct rkisp1_device *rkisp1,
>                                 struct media_pad *source)
> {
> ...
>         regmap_update_bits(rkisp1->gasket, ISP_DEWARP_CONTROL, mask, val);

Ah indeed, thanks!

>
> Now this register doesn't filter data: if you set it with a different
> value, the data still goes through. It's just processed differently.
> For example, my sensor is 12-bit (in addition to 10-bit). If I set
> ISP_DEWARP_CONTROL to 0xB68 (or 0x368) meaning RAW 14-bit, the image
> only gets darker - ISP thinks it's getting 14-bit samples.

Thanks for testing

>
> The only filtering (while using ISP) is, apparently, in the ISP
> Configuration Register (MIPI_CSIS_ISPCONFIG_CH0) and subsequently in its
> shadow counterpart. And it somehow may be enabled in CSIS Common Control
> Register (MIPI_CSIS_CMN_CTRL). But if you don't enable it there, the
> data is still filtered (e.g. wrong value in MIPI_CSIS_ISPCONFIG_CH0
> prevents data flow). The filtering is only needed for preventing pixel
> corruption (these 3 pixels).

Let me recap all of this.

With:

- MIPI_CSIx_CSIS_COMMON_CTRL[11:10]
 "Select Interleave mode" = 0x00 = CH0 only, no data interleave

- MIPI_CSIx_ISP_CONFIGn[7:2]
  "Image Data Format" = 0x2c = RAW12

Embedded data and OB pixels are filtered (which means we're filtering
on DT even if MIPI_CSIx_CSIS_COMMON_CTRL[11:10] = 0x0x would suggest
filtering is not enabled)

However corrupted pixels are still sent through.

If you

- MIPI_CSIx_CSIS_COMMON_CTRL[11:10]
 "Select Interleave mode" = 0x01 = DT (Data type) only

Embedded data and OB pixels are still filtered, and your corrupt
pixels are filtered as well.

Now, why are "corrupted pixels" filtered away by enabling this option ?

As far as I understand bad pixels are corrupt in their data values,
the CSI-2 packet header which contains the DT is correct. Is my
understanding correct ?


>
> So it means, for at least i.MX8MP, the DT filtering bit in
> MIPI_CSIS_CMN_CTRL should always be enabled.

It would be nice to actually understand what it does before enabling
it unconditionally.

I've cc-ed Xavier from NXP which maybe can help shed some light on
that register function ?

Thanks for the investigation

>
> >> MIPI_CSI2:
> >>    32E50004h      4705h CSIS Common Control Register (MIPI_CSIS_CMN_CTRL)
> >
> > Do you mean 0x14705 ? I'm asking because Shadow Crtl is BIT(16). Surprisingly
> > BIT(14) is marked as reserved in the datasheet version I have
>
> No, it's 0x4705 (usually).
> With 0xFF05 (resulting from write with 0xfffffffd) it's still working
> correctly (with DT filtering). Write 0xfffffbfd (= no DT filtering) and
> the magic light pixels in the left top corner reappear. So it means the
> INTERLEAVE_MODE bits (11 and 10) are probably two independent bits, with
> bit 11 probably not used at all.
>
>
> In my copy (i.MX 8M Plus Applications Processor Reference Manual, Rev.
> 1, 06/2021), CSIS Common Control Register (MIPI_CSIx_CSIS_COMMON_CTRL):
> - bits 31-17, 15, 13, 12, 7-2 are zero and reserved (though bits 12 and
>   2 are additionally marked "This read-only field is reserved and always
>   has the value 0")
> - bit 14 is reserved and shown as "1"
> - bit 16 is "UPDATE_SHADOW", and it clears itself after a write (unless
>   the pipeline locks up or something alike)
> - bits 11 and 10 are "INTERLEAVE_MODE":
>     Select Interleave mode
>     ISP Configuration register of CH# is used for data interleave.
>       00 CH0 only, no data interleave
>       01 DT (Data type) only
>       10 Reserved
>       11 Reserved
> - bits 9 and 8 are LANE_NUMBER, 0 to 3 means 1 to 4.
> - bit 1 is SW_RESET
> - bit 0 is CSI_EN
>
> In fact, bit 2 does not "always have the value 0", it's set to 1. Both
> bits 14 and 2 can be reset to 0, though (without apparent change in the
> image).
> --
> Krzysztof "Chris" Hałasa
>
> Sieć Badawcza Łukasiewicz
> Przemysłowy Instytut Automatyki i Pomiarów PIAP
> Al. Jerozolimskie 202, 02-486 Warszawa
>

