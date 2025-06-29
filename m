Return-Path: <linux-media+bounces-36207-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B63A3AED109
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 22:47:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA634164445
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 20:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BEB5239085;
	Sun, 29 Jun 2025 20:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="D6T3a81w"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E710D17A305
	for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 20:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751230042; cv=none; b=m3+f/+RVcLzcfGXoGrXA3qZWUcOqf2ePOVXKOrakfsnI4eI6NEwSUZpWJgm5I121JLPgump/5ZLCRnDZvbblb4Sef9c4+d0adeZb6jvvPinUmwv+d6d63UvkiH+2Vf5oa2XY1djM3pbzOZJqxWP2h0oVwK2VhXRunVCWyFSMZFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751230042; c=relaxed/simple;
	bh=nbiTby3fNTTn7Cb/UTciS7CL14MXVhbzGbAfP7B4Sno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RS+GY8uk1V1FwHJKz4h32Ycc4746nlwWeTps/6faZqiC1qUCXiNKrVj5jUDSbDDVRe2CADY+F3GES2iHA5ngNdMdg4T6zQOZ2gAo+y0jpH3x/ncpwyTKsxiyxFu68dqECfzLXIIAnfP1h6TiiZZO+j9ZVrdcZ7Y1Qcls5WgMNsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=D6T3a81w; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D51621352;
	Sun, 29 Jun 2025 22:46:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751230018;
	bh=nbiTby3fNTTn7Cb/UTciS7CL14MXVhbzGbAfP7B4Sno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D6T3a81wasssYZ02lBeyQe2DCy2YiyZhiLbRAuWbX2ZHPOeuTPnjRXGwY2T9Hciro
	 jOCaENkoVLl2t7SqDw8rDgNQ3+tRaBuQ9SHQeonWXm7IuCQws5FiFR8wGLiBxpEaoV
	 7JS6KVSWWnYm7vwv6AU5KOjcuMywu47BX3s94HIo=
Date: Sun, 29 Jun 2025 23:46:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mathis Foerst <mathis.foerst@mt.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 03/12] media: mt9m114: Use aptina-PLL helper to get
 PLL values
Message-ID: <20250629204655.GA2059@pendragon.ideasonboard.com>
References: <20250531163148.83497-1-hansg@kernel.org>
 <20250531163148.83497-4-hansg@kernel.org>
 <20250603105712.GA27361@pendragon.ideasonboard.com>
 <f7d0ab89-f119-4ff9-a78d-00c51d45bb43@kernel.org>
 <20250603140557.GB12117@pendragon.ideasonboard.com>
 <40f968d7-2c88-4eb4-b9ce-604de03bf7be@kernel.org>
 <20250627180639.GE24912@pendragon.ideasonboard.com>
 <86d8d80e-8ce5-477e-be81-f8a46a021d5b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <86d8d80e-8ce5-477e-be81-f8a46a021d5b@kernel.org>

On Sat, Jun 28, 2025 at 11:27:23AM +0200, Hans de Goede wrote:
> On 27-Jun-25 8:06 PM, Laurent Pinchart wrote:
> > On Fri, Jun 27, 2025 at 04:33:46PM +0200, Hans de Goede wrote:
> >> On 3-Jun-25 4:05 PM, Laurent Pinchart wrote:
> >>> On Tue, Jun 03, 2025 at 03:29:42PM +0200, Hans de Goede wrote:
> >>>> On 3-Jun-25 12:57 PM, Laurent Pinchart wrote:
> >>>>> On Sat, May 31, 2025 at 06:31:38PM +0200, Hans de Goede wrote:
> >>>>>> Before this change the driver used hardcoded PLL m, n and p values to
> >>>>>> achieve a 48MHz pixclock when used with an external clock with a frequency
> >>>>>> of 24 MHz.
> >>>>>>
> >>>>>> Use aptina_pll_calculate() to allow the driver to work with different
> >>>>>> external clock frequencies. The m, n, and p values will be unchanged
> >>>>>> with a 24 MHz extclk and this has also been tested with a 19.2 MHz
> >>>>>> clock where m gets increased from 32 to 40.
> >>>>>>
> >>>>>> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>>>>> Signed-off-by: Hans de Goede <hansg@kernel.org>
> >>>>>> ---
> >>>>>> Changes in v2:
> >>>>>> - Add select VIDEO_APTINA_PLL to Kconfig
> >>>>>> - Use correct aptina_pll_limits
> >>>>>> ---
> >>>>>>  drivers/media/i2c/Kconfig   |  1 +
> >>>>>>  drivers/media/i2c/mt9m114.c | 54 ++++++++++++++++++++++++++-----------
> >>>>>>  2 files changed, 40 insertions(+), 15 deletions(-)
> 
> ...
> 
> >>>>>> @@ -2262,12 +2262,29 @@ static int mt9m114_verify_link_frequency(struct mt9m114 *sensor,
> >>>>>>  
> >>>>>>  static int mt9m114_clk_init(struct mt9m114 *sensor)
> >>>>>>  {
> >>>>>> +	static const struct aptina_pll_limits limits = {
> >>>>>> +		.ext_clock_min = 6000000,
> >>>>>> +		.ext_clock_max = 54000000,
> >>>>>> +		/* int_clock_* limits are not documented taken from mt9p031.c */
> >>>>>> +		.int_clock_min = 2000000,
> >>>>>> +		.int_clock_max = 13500000,
> >>>>>> +		/*
> >>>>>> +		 * out_clock_min is not documented, taken from mt9p031.c.
> >>>>>> +		 * out_clock_max is documented as 768MHz, but this leads to
> >>>>>> +		 * different PLL settings then used by the vendor's drivers.
> >>>>>
> >>>>> s/then/than/
> >>>>>
> >>>>> Is that an issue though ? Does it prevent the sensor from working ?
> >>>>
> >>>> I did not try. It seems safer to just stick with the tested / proven
> >>>> values from the older register-list based drivers?
> >>>
> >>> Sometimes there are multiple options without any practical differences.
> >>> I wouldn't necessarily assume we have to follow the hardcoded register
> >>> values. Can you share the two PLL configurations ?
> >>>
> >>>> Even if it does work on my single mt9m114 sensor, that hardly
> >>>> constitutes testing on a representative sample.
> >>>
> >>> This sensor is rather old and not widely used. If using the correct
> >>> limits doesn't cause issues on platforms we can test, that's good enough
> >>> for me. We can always address problems later if any arise.
> >>
> >> Ok, so I've tried setting out_clock_max to 768MHz, but that results
> >> in PLL setting which cause the sensor to fail to stream.
> > 
> > Thank you for testing.
> > 
> > Could you share the PLL configuration you obtain with the 400 MHz and
> > 768 MHz limits ?
> 
> 400 MHz out_clock_max, working setup:
> 
> [   40.136435] mt9m114 i2c-INT33F0:00: PLL: ext clock 19200000 pix clock 48000000
> [   40.136453] mt9m114 i2c-INT33F0:00: pll: mf min 4 max 38
> [   40.136463] mt9m114 i2c-INT33F0:00: pll: p1 min 4 max 8
> [   40.136473] mt9m114 i2c-INT33F0:00: PLL: N 2 M 40 P1 8
> 
> 768 MHz non working setup:
> 
> [   28.388940] mt9m114 i2c-INT33F0:00: PLL: ext clock 19200000 pix clock 48000000
> [   28.388955] mt9m114 i2c-INT33F0:00: pll: mf min 4 max 38
> [   28.388966] mt9m114 i2c-INT33F0:00: pll: p1 min 4 max 16
> [   28.388976] mt9m114 i2c-INT33F0:00: PLL: N 2 M 80 P1 16

Hmmm...

Re-reading the documentation, I wonder if I had misunderstood the PLL.

There is no single clear description of the PLL (it would be too easy),
but there's informatio scattered in multiple places. One of them states
that

Fout = (Fin*2*m)/((n+1)*(p+1)).

Note the *2 multiplier. In another location, multiple frequencies are
defined:

fSensor = (M x fin) / ((N + 1) x (P + 1)) (max 48 MHz)
fWord = fSensor x 2 (max 96 MHz)
fBit = fWord * 8 (max 763 MHz)

The '+1' for N and P are understood, they relate to the values
programmed in the registers. From the point of view of the PLL
calculator, we should reason with that offset, with

Fout = (Fin*2*m)/(n*p).

and

fSensor = (M x fin) / (N x P)

This leads me to believe that the PLL is organized as follows:

        +-----+     +-----+     +-----+     +-----+     +-----+
Fin --> | / N | --> | x M | --> | x 2 | --> | / P | --> | / 2 | -->
        +-----+     +-----+     +-----+     +-----+     +-----+
	                                fBit       fWord        fSensor
ext_clock    int_clock   out_clock                             pix_clock

Seen this way, the maximum limit for out_clock should be 384 MHz, and
the P factor should be hardcoded to 8 for CSI-2 output.

Does that make sense to you ?

-- 
Regards,

Laurent Pinchart

