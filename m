Return-Path: <linux-media+bounces-13325-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F79909F8D
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 21:39:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2010C1C21D75
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 19:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF13E4D13F;
	Sun, 16 Jun 2024 19:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OtG5ggWs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920BC1B27D;
	Sun, 16 Jun 2024 19:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718566768; cv=none; b=H0F0D75yshUBtsa8Yv+cUzc5WMvZlteA//oiV8Ykllz/ld+jMwRSFJxdHSnyvpdR2mVZcwfxs8Rp6s1AiPUsDY9FhuIH30xQ1qIs1PlhqkQjIIK4fGw0Wnhv6UtLeGR7NfXS/NdUhSXDqDUGq6N3HXRS0aFblp6jxXA8TkENdXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718566768; c=relaxed/simple;
	bh=2m/5QEYEdi3O2P0lDiY6WGoFB3JhPXaqvMmDWs7BEM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BmsdDkprye5XgorQ/KIs1SIbXxiMbSQRH7Qnym2c/gaiao7hjYJYMLWyzBzec2EhMYbEFo89SnpFWFRgIpMawuXGKW/xMgJ2cvPldVNfpgbgQreYL/3rv5iAU821GiwsyJTEx1ymZ7/zNWBZSuaAVDWw8B3XoC1sYqB0ZHTlTYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OtG5ggWs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18E87581;
	Sun, 16 Jun 2024 21:39:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718566746;
	bh=2m/5QEYEdi3O2P0lDiY6WGoFB3JhPXaqvMmDWs7BEM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OtG5ggWssiTD1gFqEW5n26A6SEoHLnJfcmad0MJQk8g9sppZs0GAXidcRI+7r4eTG
	 44E3KU2z7O4/IDptuFAmoFvoLaa/J22pyeOZxrYvRoPl6p7dlQoukzxd9XqDLpObW5
	 KICHF2CT/dcD5cKwo0tiO6pz9dYgGFVVbezN7tw0=
Date: Sun, 16 Jun 2024 22:39:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	sakari.ailus@iki.fi
Subject: Re: [PATCH v5 05/16] media: mali-c55: Add Mali-C55 ISP driver
Message-ID: <20240616193901.GA10964@pendragon.ideasonboard.com>
References: <20240529152858.183799-1-dan.scally@ideasonboard.com>
 <20240529152858.183799-6-dan.scally@ideasonboard.com>
 <20240530001507.GG10586@pendragon.ideasonboard.com>
 <6d0be0cf-ff77-4943-8505-f78ad922e3fb@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6d0be0cf-ff77-4943-8505-f78ad922e3fb@ideasonboard.com>

Hi Dan,

On Fri, Jun 14, 2024 at 11:13:29AM +0100, Daniel Scally wrote:
> On 30/05/2024 01:15, Laurent Pinchart wrote:
> > On Wed, May 29, 2024 at 04:28:47PM +0100, Daniel Scally wrote:
> >> Add a driver for Arm's Mali-C55 Image Signal Processor. The driver is
> >> V4L2 and Media Controller compliant and creates subdevices to manage
> >> the ISP itself, its internal test pattern generator as well as the
> >> crop, scaler and output format functionality for each of its two
> >> output devices.
> >>
> >> Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
> >> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> >> ---
> >> Changes in v5:
> >>
> >> 	- Reworked input formats - previously we allowed representing input data
> >> 	  as any 8-16 bit format. Now we only allow input data to be represented
> >> 	  by the new 20-bit bayer formats, which is corrected to the equivalent
> >> 	  16-bit format in RAW bypass mode.
> >> 	- Stopped bypassing blocks that we haven't added supporting parameters
> >> 	  for yet.
> >> 	- Addressed most of Sakari's comments from the list
> >>
> >> Changes not yet made in v5:
> >>
> >> 	- The output pipelines can still be started and stopped independently of
> >> 	  one another - I'd like to discuss that more.
> >> 	- the TPG subdev still uses .s_stream() - I need to rebase onto a tree
> >> 	  with working .enable_streams() for a single-source-pad subdevice.
> >>
> >> Changes in v4:
> >>
> >> 	- Reworked mali_c55_update_bits() to internally perform the bit-shift
> >
> > I really don't like that, it makes the code very confusing, even more so
> > as it differs from regmap_update_bits().
> >
> > Look at this for instance:
> >
> > 	mali_c55_update_bits(mali_c55, MALI_C55_REG_MCU_CONFIG,
> > 			     MALI_C55_REG_MCU_CONFIG_OVERRIDE_MASK,
> > 			     MALI_C55_REG_MCU_CONFIG_OVERRIDE_MASK);
> >
> > It only works by change because MALI_C55_REG_MCU_CONFIG_OVERRIDE_MASK is
> > BIT(0).
> >
> > Sorry, I know it will be painful, but this change needs to be reverted.
> 
> I'd like to argue for keeping this, on the grounds that it's better. I got lazy in the change you 
> reference there, and because BIT(0) is the same as 0x01 didn't bother changing it. I agree that 
> that's confusing but I think it would be better to keep the change and just update all the call 
> sites properly. The benefits as I see them are two:
> 
> 
> 1. This method ensures sane consistent calling of the function. Without the internal shift you have 
> to shift the values at the call site, but there's no reason to do that if the value you're setting 
> is 0x00 or if the field you're targeting in the register starts at bit 0, so I think writing code 
> naturally we'd have a mix of situations like so:
> 
> 
> #define REG_1 0xfc00
> 
> #define REG_2 0xff
> 
> mali_c55_update_bits(mali_c55, 0x1234, REG_1, 0x02 << 10);
> 
> mali_c55_update_bits(mali_c55, 0x1234, REG_1, 0x00);
> 
> mali_c55_update_bits(mali_c55, 0x1234, REG_2, 0x02);
>
> And I think that the mixture is more confusing than the difference with regmap_update_bits(). We 
> could include the bitshifting for consistencies sake despite it being unecessary, but it's extra 
> work for no real reason and itself "looks wrong" if the field starts at bit(0)...it would look less 
> wrong with an offset macro that defines the number of bits to shift as 0 but then we're on to 
> advantage #2...
> 
> 2. It makes the driver far cleaner. Without it we either have magic numbers scattered throughout 
> (and sometimes have to calculate them with extra variables where the write can target different 
> places conditionally) or have macros defining the number of bits to shift, or have to do (ffs(mask) 
> - 1) everywhere, and that tends to make the call sites a lot messier - this was the original reason 
> I moved it internal actually.
> 
> What do you think?

All register values (possibly with the exception of 0) should have
macros. The callers will thus not need to perform shifts manually, they
will all be handled in the register fields macros. From a caller point
of view, not handling the shifts inside mali_c55_update_bits() will not
make a difference.

It's the first time I notice a driver trying to shift internally in its
update_bits function. I think that's really confusing, especially given
that it departs from how regmap operates. I still strongly favour
handling the shifts in the register macros.

> >> 	- Reworked the resizer to allow cropping during streaming
> >> 	- Fixed a bug in NV12 output
> >>
> >> Changes in v3:
> >>
> >> 	- Mostly minor fixes suggested by Sakari
> >> 	- Fixed the sequencing of vb2 buffers to be synchronised across the two
> >> 	  capture devices.
> >>
> >> Changes in v2:
> >>
> >> 	- Clock handling
> >> 	- Fixed the warnings raised by the kernel test robot
> >>
> >>   drivers/media/platform/Kconfig                |   1 +
> >>   drivers/media/platform/Makefile               |   1 +
> >>   drivers/media/platform/arm/Kconfig            |   5 +
> >>   drivers/media/platform/arm/Makefile           |   2 +
> >>   drivers/media/platform/arm/mali-c55/Kconfig   |  18 +
> >>   drivers/media/platform/arm/mali-c55/Makefile  |   9 +
> >>   .../platform/arm/mali-c55/mali-c55-capture.c  | 951 ++++++++++++++++++
> >>   .../platform/arm/mali-c55/mali-c55-common.h   | 266 +++++
> >>   .../platform/arm/mali-c55/mali-c55-core.c     | 767 ++++++++++++++
> >>   .../platform/arm/mali-c55/mali-c55-isp.c      | 611 +++++++++++
> >>   .../arm/mali-c55/mali-c55-registers.h         | 258 +++++
> >>   .../arm/mali-c55/mali-c55-resizer-coefs.h     | 382 +++++++
> >>   .../platform/arm/mali-c55/mali-c55-resizer.c  | 779 ++++++++++++++
> >>   .../platform/arm/mali-c55/mali-c55-tpg.c      | 402 ++++++++
> >>   14 files changed, 4452 insertions(+)
> >>   create mode 100644 drivers/media/platform/arm/Kconfig
> >>   create mode 100644 drivers/media/platform/arm/Makefile
> >>   create mode 100644 drivers/media/platform/arm/mali-c55/Kconfig
> >>   create mode 100644 drivers/media/platform/arm/mali-c55/Makefile
> >>   create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-capture.c
> >>   create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-common.h
> >>   create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-core.c
> >>   create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> >>   create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-registers.h
> >>   create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-resizer-coefs.h
> >>   create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
> >>   create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-tpg.c

[snip]

-- 
Regards,

Laurent Pinchart

