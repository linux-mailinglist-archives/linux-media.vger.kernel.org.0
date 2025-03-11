Return-Path: <linux-media+bounces-28019-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE87A5BD72
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 11:15:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37DC6168E2C
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 10:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61829233120;
	Tue, 11 Mar 2025 10:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RiuGFZtA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C6422FF32;
	Tue, 11 Mar 2025 10:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741688021; cv=none; b=nHmiYiDFnoZuGOrY0RgJmZawWsJ2sGyu3yRn3pGfNE7I30idUyVVhF9z2Fpsz95QmNYRbBY1JZjQcNJe2EIrwh58+6cnBQyC10j1BVif6e9CkEnl0TjOJG8s5NCN6sLhk0doKMfRw4rWcMDh8HrowDOfKijN5py1GIwYy/lp6zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741688021; c=relaxed/simple;
	bh=GBn0NHUBaGIWk0/Mhl3s+SCamZca4Z2s+E0VjQ/t7yg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PG3jgY5KPvUE90bce1du5Q5uvJTz9VWOdDuGEDLQOFBBJa0z95c/xic/2vJcVJ3o1psLbHfUxkD8Gkn6u5CSfnIYAKTtTmgrVh1VDTErGGUZcWTnUjjpU7xCwQybsX+FykbtdU5hoAXwpIb5uejg80+Ge0JgNRTD0UtJtcrjojA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RiuGFZtA; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741688019; x=1773224019;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=GBn0NHUBaGIWk0/Mhl3s+SCamZca4Z2s+E0VjQ/t7yg=;
  b=RiuGFZtAOa6pkP7iCyWO0rKXD4qJzs3lhvz5spzTmwrMWhck7w0TFe4c
   cVKIEr86HK4zCWGU1F/pK1X7slbxSlign4o7jp28g3q9toWdy20Z3ZtZe
   yY7RDkJ0yEp0ti4T7mwps8ITGS1DAF9ny1JGrYWjSkiKqX3oohsN+6tY1
   O2LtIfsLdOej+lEt1wb67tlE822yhxyJeCmC36vXpm5TNW/EsvprUd+VF
   RW5JxqA0hm1AlrlvMG4dPEr8mENcRL1JnyGccwbACLZ5IG0imgdYQAMl/
   pl+ihZrKCdZXRRRcMouL5pNN7QT8ZSPUL1Mfpy0uYARZCP6DFEkmwyrop
   A==;
X-CSE-ConnectionGUID: ybaABSk7RGyTpweZspyaVw==
X-CSE-MsgGUID: tBH219ieT4mX1xEidJlOBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="46366259"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="46366259"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 03:13:36 -0700
X-CSE-ConnectionGUID: v2AEapuIRVGpcC2EwYDGJg==
X-CSE-MsgGUID: 3Wzl8BTgT76oVqpNZ1tqsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="120312756"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 03:13:33 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5FC7711F828;
	Tue, 11 Mar 2025 12:13:31 +0200 (EET)
Date: Tue, 11 Mar 2025 10:13:31 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: "Shravan.Chippa@microchip.com" <Shravan.Chippa@microchip.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	"umang.jain@ideasonboard.com" <umang.jain@ideasonboard.com>,
	"zhi.mao@mediatek.com" <zhi.mao@mediatek.com>,
	"julien.massot@collabora.com" <julien.massot@collabora.com>,
	"mike.rudenko@gmail.com" <mike.rudenko@gmail.com>,
	"benjamin.mugnier@foss.st.com" <benjamin.mugnier@foss.st.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/6] media: i2c: imx334: Convert to CCI register access
 helpers
Message-ID: <Z9AMywzmV97OycES@kekkonen.localdomain>
References: <20250310071751.151382-1-tarang.raval@siliconsignals.io>
 <20250310071751.151382-3-tarang.raval@siliconsignals.io>
 <PH0PR11MB5611A568DC879D4206FDE76681D12@PH0PR11MB5611.namprd11.prod.outlook.com>
 <20250311063849.GB29331@pendragon.ideasonboard.com>
 <PH0PR11MB5611257EF7BF21EA7617008881D12@PH0PR11MB5611.namprd11.prod.outlook.com>
 <Z9AGeIA-207RuGQ0@kekkonen.localdomain>
 <PN3P287MB18297B36A79D3A1AD568448A8BD12@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3P287MB18297B36A79D3A1AD568448A8BD12@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>

Hi Tarang,

On Tue, Mar 11, 2025 at 10:05:12AM +0000, Tarang Raval wrote:
> Hi Sakari,
> 
> > On Tue, Mar 11, 2025 at 06:51:48AM +0000, Shravan.Chippa@microchip.com wrote:
> > > Hi Laurent,
> > >
> > > > -----Original Message-----
> > > > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Sent: Tuesday, March 11, 2025 12:09 PM
> > > > To: shravan Chippa - I35088 <Shravan.Chippa@microchip.com>
> > > > Cc: tarang.raval@siliconsignals.io; sakari.ailus@linux.intel.com;
> > > > kieran.bingham@ideasonboard.com; mchehab@kernel.org;
> > > > hverkuil@xs4all.nl; umang.jain@ideasonboard.com; zhi.mao@mediatek.com;
> > > > julien.massot@collabora.com; mike.rudenko@gmail.com;
> > > > benjamin.mugnier@foss.st.com; linux-media@vger.kernel.org; linux-
> > > > kernel@vger.kernel.org
> > > > Subject: Re: [PATCH 2/6] media: i2c: imx334: Convert to CCI register access
> > > > helpers
> > > >
> > > > EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> > > > content is safe
> > > >
> > > > Hi Shravan,
> > > >
> > > > On Tue, Mar 11, 2025 at 06:14:28AM +0000, Shravan.Chippa@microchip.com
> > > > wrote:
> > > > > Hi Tarang,
> > > > >
> > > > > Thanks for the patch series with CCI register access helpers on top of
> > > > > my patches I have tested (1080p,720p, 480p resolution only) and
> > > > > working on my board with small PLL changes to make it compatible with
> > > > > pfsoc board (mpfs-video-kit).
> > > >
> > > > Could you please provide more information about what those PLL changes are
> > > > ?
> > >
> > > Here is the change for mpfs-video-kit board.
> > >
> > > diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> > > index 375367314416..30470dbd1f3c 100644
> > > --- a/drivers/media/i2c/imx334.c
> > > +++ b/drivers/media/i2c/imx334.c
> > > @@ -236,9 +236,9 @@ static const struct cci_reg_sequence common_mode_regs[] = {
> > >         { IMX334_REG_XVS_XHS_OUTSEL, 0x20},
> > >         { IMX334_REG_XVS_XHS_DRV, 0x0f},
> > >         { IMX334_REG_BCWAIT_TIME, 0x3b},
> > > -       { IMX334_REG_CPWAIT_TIME, 0x2a},
> > > +       { IMX334_REG_CPWAIT_TIME, 0x29},
> > 
> > A patch converting the driver to use V4L2 CCI / human-readable register
> > names should not change the values written.
> 
> This change is not from my patch.
> 
> You can recheck Shravan’s second patch, there is no change in the 
> CPWAIT_TIME value from my patch or his.
> 
> The change Shravan mentioned was made locally to ensure compatibility
> with the mpfs-video-kit board, as Laurent requested. 
> That’s why he provided those details.

Right. I don't know what this or the other change do exactly, but
presumably the other one is a clock tree divider that reduces the link
frequency (or pixel rate in pixel array). That should be handled
separately.

-- 
Sakari Ailus

