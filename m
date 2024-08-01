Return-Path: <linux-media+bounces-15714-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B6394502A
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 18:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB19AB20D26
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 16:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1FB1B32DA;
	Thu,  1 Aug 2024 16:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E7NU5kdn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E0C1DA58;
	Thu,  1 Aug 2024 16:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722528577; cv=none; b=hUlBKNI25uXKJNO6imYLYvvsytKCOeh2y7gR0QmatBxIekErD/H6WCHuucUkUGxLAmuu7nsYizD7yfrwprs6nfxebVo1CVWDptK6rxbm+nFGi8u6VprjLosG/DUMKcWs01IVHP9BUEoNiWxkvFFm2RSZ327Qyalwh5snzFA8rb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722528577; c=relaxed/simple;
	bh=H3arMyqvh7LzvoEkqhspzcdXwUMwdie1CwdkMGrc86g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rM/c/xJB3U0SybxMzoMzcZZX9tV2HqIJHDHLAqeb95GaFGUuYA862AWV5+WWhULXfcAnZpQ49vfD8njelFdsD+TI4Kmw6BsCFRkjUby3Wre+ZzlQkF1lRECoiBmUyckpmq1OaQDqfIXlF3Ak6YLI0pgvPwCyaRDOewS9KVEbLTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E7NU5kdn; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722528576; x=1754064576;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H3arMyqvh7LzvoEkqhspzcdXwUMwdie1CwdkMGrc86g=;
  b=E7NU5kdnXEZmydh1RizrhlJEXYAvHQw8jZS8gvexs86qV1PdFBL6ylEV
   UY4aXvg6zlP0U71wMbEvOCtHe780FZavI/Tp/33svzih6QC9hl+e/uGoR
   06V0XuUYtbxMQ68GAcf9cEMm+JSAK9EO5PEQLAmmrA7dOrlTASt0F7fUf
   DlbnUzMx7X3KZKk7XvnKLHwFxfLyXugb5zK/WSf9XXyh7qyFFm2pIw8G9
   iqZwZmTTpUB4rx2wCyJKPs+cmvSIa8x5SG18YoBoPEvFoVEYf9KT3x2g7
   qH+YbkyL3FOju23FkQ8A6EqDP/u5r3X7Nl8bCN8p/CG0/sYehgL2z0E74
   Q==;
X-CSE-ConnectionGUID: MMY5ISEAQjuCZ/MouklT6g==
X-CSE-MsgGUID: tLXp7S3eQeWmvFJE6mZ3Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20342898"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; 
   d="scan'208";a="20342898"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 09:09:34 -0700
X-CSE-ConnectionGUID: dzZ6hq2hTieSPAzqog4uSQ==
X-CSE-MsgGUID: cPyPh3TwQo+b33B/sfswZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; 
   d="scan'208";a="54737261"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 09:09:31 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8FB3311F9F0;
	Thu,  1 Aug 2024 19:09:28 +0300 (EEST)
Date: Thu, 1 Aug 2024 16:09:28 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-media@vger.kernel.org, stable@vger.kernel.org,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v2 2/2] media: imx335: Fix reset-gpio handling
Message-ID: <ZquzONl9PihjhdCZ@kekkonen.localdomain>
References: <20240729110437.199428-1-umang.jain@ideasonboard.com>
 <20240729110437.199428-3-umang.jain@ideasonboard.com>
 <ef05c39a-ad5c-4751-a758-f73a2d114823@kernel.org>
 <ZqijVf68ZQuFGKhU@kekkonen.localdomain>
 <729280cd-557f-43ba-b1a6-8d319977ca82@kernel.org>
 <20240730091011.GL300@pendragon.ideasonboard.com>
 <cefc0b19-f065-4023-a536-56b2762ac967@ideasonboard.com>
 <172241654546.392292.16164306008596010671@ping.linuxembedded.co.uk>
 <c4f697d7-16a0-46d2-be34-45f6a8efaec8@kernel.org>
 <20240731093905.GQ8146@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731093905.GQ8146@pendragon.ideasonboard.com>

Hi Laurent, Krzysztof,

On Wed, Jul 31, 2024 at 12:39:05PM +0300, Laurent Pinchart wrote:
> On Wed, Jul 31, 2024 at 11:06:38AM +0200, Krzysztof Kozlowski wrote:
> > On 31/07/2024 11:02, Kieran Bingham wrote:
> > > Quoting Umang Jain (2024-07-31 06:41:35)
> > >> On 30/07/24 2:40 pm, Laurent Pinchart wrote:
> > >>> On Tue, Jul 30, 2024 at 10:42:01AM +0200, Krzysztof Kozlowski wrote:
> > >>>> On 30/07/2024 10:24, Sakari Ailus wrote:
> > >>>>> Hi Krzysztof,
> > >>>>>
> > >>>>> On Mon, Jul 29, 2024 at 04:09:39PM +0200, Krzysztof Kozlowski wrote:
> > >>>>>> On 29/07/2024 13:04, Umang Jain wrote:
> > >>>>>>> Rectify the logical value of reset-gpio so that it is set to
> > >>>>>>> 0 (disabled) during power-on and to 1 (enabled) during power-off.
> > >>>>>>>
> > >>>>>>> Meanwhile at it, set the reset-gpio to GPIO_OUT_HIGH at initialization
> > >>>>>>> time to make sure it starts off in reset.
> > >>>>>>>
> > >>>>>>> Fixes: 45d19b5fb9ae ("media: i2c: Add imx335 camera sensor driver")
> > >>>>>>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> > >>>>>>> ---
> > >>>>>>>   drivers/media/i2c/imx335.c | 8 ++++----
> > >>>>>>>   1 file changed, 4 insertions(+), 4 deletions(-)
> > >>>>>>>
> > >>>>>> This will break all the users, so no. At least not without mentioning
> > >>>>>> ABI break and some sort of investigating how customers or users are
> > >>>>>> affected.
> > >>>>>
> > >>>>> I know the original authors aren't using the driver anymore and it took
> > >>>>> quite a bit of time until others started to contribute to it so I suspect
> > >>>>> the driver hasn't been in use for that long. There are no instances of the
> > >>>>> device in the in-kernel DTS either.
> > >>>>>
> > >>>>> Any DTS author should have also noticed the issue but of course there's a
> > >>>>> risk someone could have just changed the polarity and not bothered to chech
> > >>>>> what it was supposed to be.
> > >>>>>
> > >>>>> I agree the commit message should be more vocal about the effects on
> > >>>>> existing DTS.
> > >>>>
> > >>>> I can imagine that all users (out of tree, in this case) inverted
> > >>>> polarity in DTS based on what's implemented. You could go with some
> > >>>> trivial hack, like I did for one of codecs - see 738455858a2d ("ASoC:
> > >>>> codecs: wsa881x: Use proper shutdown GPIO polarity"), but I remember
> > >>>> Mark Brown rejected similar commit for newer drivers.
> > >>>
> > >>> I don't think there's any out-of-tree user, because when we started
> > >>> using the recently driver, it required lots of fixes to even work at
> > >>> all. I'll let Kieran and Umang comment on that, I haven't follow the
> > >>> development in details.
> > >>
> > >> indeed, initially we had to put up fixes like :
> > >>
> > >> 14a60786d72e ("media: imx335: Set reserved register to default value")
> > >> 81495a59baeba ("media: imx335: Fix active area height discrepency")
> > >>
> > >> to make the sensor work properly on our platforms. Only after that we 
> > >> had a base to support more capabilities on the sensor (multiple lanes 
> > >> support, flips, TPG etc.)
> > > 
> > > I would also add that we had to provide control for the regulators to be
> > > able to power the device as well in fea91ee73b7c ("media: i2c: imx335:
> > > Enable regulator supplies").
> > 
> > Hm? That's not a proof of anything. Supplies are often turned on by default.
> > 
> > > Given the driver was posted from Intel, I would have anticipated perhaps
> > > the driver was in fact only actually tested by Intel on ACPI platforms -
> > > yet with no ACPI table registered in the driver - even that could likely
> > > be considered broken.
> > 
> > Nope, that does not work like that. Their platforms and such sensors are
> > often used on DT based boards.
> 
> What DT-platforms would that be ?
> 
> > Not mentioning even PRP0001.
> 
> I don't think PRP0001 is used by Intel for camera sensors.

The original author is no longer using the driver nor it is used for its
original purpose any more. The next users were quite probably Kieran and
Umang late last year.

> 
> Sakari, do you have any information about all this ? Do you think
> there's a risk that the driver is currently used by anyone with a
> mainline kernel ?

I think it's extremely unlikely the driver has been or continues to be in
use on ACPI based systems.

-- 
Kind regards,

Sakari Ailus

