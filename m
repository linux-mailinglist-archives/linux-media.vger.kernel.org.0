Return-Path: <linux-media+bounces-27318-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1C4A4B89F
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 08:55:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2C4016E64D
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 07:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3969D1EDA32;
	Mon,  3 Mar 2025 07:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nKLFpNCO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317541EB5F7;
	Mon,  3 Mar 2025 07:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740988505; cv=none; b=iyEQs+Ji/B3+puOYt2LpNt0yDiBiWGwQj57p0LUKGghW9Wk7qqPXG1TPf4CZRxlU6q3phQaGU8RDsOoTteGU8qAG+JuBWeKUp4P9vb9JJsVhJcfj6EOiN+UpnIIh7RnDE+5gZRm18uXco6Oesgd8wPF1OgDPYf3KzaUYYkiDeXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740988505; c=relaxed/simple;
	bh=D4IWbToKWcO62iNyJZD4aj1o1AqbKGWy2Gwm1GpJhGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kou/lrL3beKKSkc6VcdFJDYjR+bWkMM9s73rbkzqMvOjexhRR0b+zxCJyjLEXi4oOhXkkXxiNVoQrdCP3bXTlJePGhQkmoV+YLrvhmFqPu03j4i/IjxEs+d4sADf+nKw2fzpk/pOEHCRg57hZnetYZ7ZUspTQYhhj3ENgY524Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nKLFpNCO; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740988504; x=1772524504;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D4IWbToKWcO62iNyJZD4aj1o1AqbKGWy2Gwm1GpJhGU=;
  b=nKLFpNCO5DBa0w62VEhw0J2DSpnbxN/USOrFFQ06J8oXUCC6qpPx+ME6
   uaylDHzEcPHsfMMOwEj0c8VtqiPmxHvc/u3PQp8Sd+MIInrinyItOUOji
   I2upZGsPIBTiTlLKD+dh/L0ewc7Q8f5CzNH3XNeaRrcVuM4FTRNdrl1Q0
   mPm4XWPXBxZvMtC9VH4Rgo/+JZHiC+i/RjK95/Jr0kxivyi6DBQAEZloO
   RG7dRbV+T8JY0Vy/JiI2W/rYur5DxrSCOK6nsehc5oorckShN4NpNdogc
   /GcJaTwy57sM0AIReoK6VkfeyEQhAdbmiTKGvK7BpkCLpoOIRc+fbCUQH
   w==;
X-CSE-ConnectionGUID: Dp6eLZEdTFyLn6xKYePi9w==
X-CSE-MsgGUID: MwLT9vCLQfWjDN66aFWymw==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41879056"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="41879056"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 23:55:03 -0800
X-CSE-ConnectionGUID: WH46JkHPR16UKFzqWVvezA==
X-CSE-MsgGUID: elgnfmqxQP2ESY7UCfE1cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="117951499"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 23:55:01 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9D0EB11F7F0;
	Mon,  3 Mar 2025 09:54:58 +0200 (EET)
Date: Mon, 3 Mar 2025 07:54:58 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Shravan.Chippa@microchip.com
Cc: mchehab@kernel.org, kieran.bingham@ideasonboard.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor.Dooley@microchip.com, Valentina.FernandezAlanis@microchip.com,
	Praveen.Kumar@microchip.com
Subject: Re: [PATCH V6 1/3] media: i2c: imx334: Optimized 4k and 2k mode
 register arrays
Message-ID: <Z8VgUoNklDUd_jaF@kekkonen.localdomain>
References: <20250228103332.3647098-1-shravan.chippa@microchip.com>
 <20250228103332.3647098-2-shravan.chippa@microchip.com>
 <Z8GiqSfuyQdUNylt@kekkonen.localdomain>
 <PH0PR11MB5611466B2027B79F7598534B81CF2@PH0PR11MB5611.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0PR11MB5611466B2027B79F7598534B81CF2@PH0PR11MB5611.namprd11.prod.outlook.com>

Hi Shravan,

On Sat, Mar 01, 2025 at 12:56:55AM +0000, Shravan.Chippa@microchip.com wrote:
> Hi Sakari,
> 
> > -----Original Message-----
> > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Sent: Friday, February 28, 2025 5:19 PM
> > To: shravan Chippa - I35088 <Shravan.Chippa@microchip.com>
> > Cc: mchehab@kernel.org; kieran.bingham@ideasonboard.com; linux-
> > media@vger.kernel.org; linux-kernel@vger.kernel.org; Conor Dooley -
> > M52691 <Conor.Dooley@microchip.com>; Valentina Fernandez Alanis -
> > M63239 <Valentina.FernandezAlanis@microchip.com>; Praveen Kumar -
> > I30718 <Praveen.Kumar@microchip.com>
> > Subject: Re: [PATCH V6 1/3] media: i2c: imx334: Optimized 4k and 2k mode
> > register arrays
> > 
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> > content is safe
> > 
> > Hi Shravan,
> > 
> > On Fri, Feb 28, 2025 at 04:03:30PM +0530, shravan kumar wrote:
> > > From: Shravan Chippa <shravan.chippa@microchip.com>
> > >
> > > Optimized the resolution arrays by integrating a common register array.
> > >
> > > Adjusted the register array values for 1920x1080@30 and 3840x2160@30
> > > resolutions to align with the common register array values.
> > >
> > > Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> > > ---
> > >  drivers/media/i2c/imx334.c | 132
> > > +++++++++----------------------------
> > >  1 file changed, 31 insertions(+), 101 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> > > index a544fc3df39c..a800f2203592 100644
> > > --- a/drivers/media/i2c/imx334.c
> > > +++ b/drivers/media/i2c/imx334.c
> > > @@ -167,8 +167,8 @@ static const s64 link_freq[] = {
> > >       IMX334_LINK_FREQ_445M,
> > >  };
> > >
> > > -/* Sensor mode registers for 1920x1080@30fps */ -static const struct
> > > imx334_reg mode_1920x1080_regs[] = {
> > > +/* Sensor common mode registers values */ static const struct
> > > +imx334_reg common_mode_regs[] = {
> > >       {0x3000, 0x01},
> > >       {0x3018, 0x04},
> > >       {0x3030, 0xca},
> > > @@ -176,26 +176,10 @@ static const struct imx334_reg
> > mode_1920x1080_regs[] = {
> > >       {0x3032, 0x00},
> > >       {0x3034, 0x4c},
> > >       {0x3035, 0x04},
> > > -     {0x302c, 0xf0},
> > > -     {0x302d, 0x03},
> > > -     {0x302e, 0x80},
> > > -     {0x302f, 0x07},
> > > -     {0x3074, 0xcc},
> > > -     {0x3075, 0x02},
> > > -     {0x308e, 0xcd},
> > > -     {0x308f, 0x02},
> > > -     {0x3076, 0x38},
> > > -     {0x3077, 0x04},
> > > -     {0x3090, 0x38},
> > > -     {0x3091, 0x04},
> > > -     {0x3308, 0x38},
> > > -     {0x3309, 0x04},
> > > -     {0x30C6, 0x00},
> > > +     {0x30c6, 0x00},
> > >       {0x30c7, 0x00},
> > >       {0x30ce, 0x00},
> > >       {0x30cf, 0x00},
> > > -     {0x30d8, 0x18},
> > > -     {0x30d9, 0x0a},
> > >       {0x304c, 0x00},
> > >       {0x304e, 0x00},
> > >       {0x304f, 0x00},
> > > @@ -210,7 +194,7 @@ static const struct imx334_reg
> > mode_1920x1080_regs[] = {
> > >       {0x300d, 0x29},
> > >       {0x314c, 0x29},
> > >       {0x314d, 0x01},
> > > -     {0x315a, 0x06},
> > > +     {0x315a, 0x0a},
> > 
> > We still have this change in the patch that's just supposed to move register
> > address/value pairs around. :-( Please check the changes yourself before
> > posting v7.
> 
> Do I need to split the patch or drop this change ? in v7

Either way but it does not belong here.

-- 
Regards,

Sakari Ailus

