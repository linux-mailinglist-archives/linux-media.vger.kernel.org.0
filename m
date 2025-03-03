Return-Path: <linux-media+bounces-27319-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A997A4B8A1
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 08:56:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FEE81892896
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 07:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A18A1EE013;
	Mon,  3 Mar 2025 07:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fliox6Xo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEBC1EB5E9;
	Mon,  3 Mar 2025 07:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740988588; cv=none; b=pl7CCHfPLi1Y57GCl9j2wcwokNMh8rMHDd5k7r2uM7mXiP/85c3yFriODoqoRDZR+3aI3ae44bpdSPhpePW2xVr94hAmdoRIY4iLLbPpvd0NIHXa5ez17destXr3HZJAdn8AfIb0ed/7hiaXUntfOqYRFPogdlUI6muapZg6vxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740988588; c=relaxed/simple;
	bh=Tche++yzYe0govX8J9qG26Gu3L7YQEixsuceVG26mXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KYIVlL7+YjfKFwKdcyiqLgS3OYVpU5lUtpzhYiNsQMfqes2TuYTh/t4B+eIBfKW9VUsagEweFlPLyj/FAlhsfqgh8KLQIWcYcySvbNDVsiBIpjHmT3PInljnMR2ZYS74HU0PUqKNDFFRcVNIecE5Iob2r55vrNm3892t6oLXu+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fliox6Xo; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740988587; x=1772524587;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tche++yzYe0govX8J9qG26Gu3L7YQEixsuceVG26mXU=;
  b=Fliox6Xoep9w4DoDHX2xaw0yJH+S4KpbJXaM7kfB/y96wkvGAu6GI47o
   GcwE8UO8UbVkI3yHkLHdFTYVq9WORGMNecuynxOnNyluAov1WLVB3+CMo
   l2s69dVaMf9yaRqSFYAd2HN+UDI9rpYspQSqr0FVz/y8o09QBva/Sx5s/
   SMLFcxsz0DQfZFJ/gCnEfAbumrDdbHB3TlNoB3ll3KN3n1vZ3FwUj1drb
   4Oz99fyMt0MHc4s1ohWDoPjpqIKmYVOMTWU7FUSBwcbWa6lme7Lbzi1Ax
   lhImShyZpumb5qiRyPiKdAzWk8SeUCyVsnuiH3C91FGKWI4L87MmPuvbY
   Q==;
X-CSE-ConnectionGUID: 2QGn0zAdTSCKJ0sTpP6g5g==
X-CSE-MsgGUID: xXo/+EDzRjqwD82VUwwpYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="42107516"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="42107516"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 23:55:58 -0800
X-CSE-ConnectionGUID: Kg1XoXbZSE2J4TEGeyaxTA==
X-CSE-MsgGUID: C1pKHd42TPaC8w3czY6NHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117783315"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 23:55:54 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A985D11F7F0;
	Mon,  3 Mar 2025 09:55:51 +0200 (EET)
Date: Mon, 3 Mar 2025 07:55:51 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Shravan.Chippa@microchip.com
Cc: mchehab@kernel.org, kieran.bingham@ideasonboard.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor.Dooley@microchip.com, Valentina.FernandezAlanis@microchip.com,
	Praveen.Kumar@microchip.com
Subject: Re: [PATCH V6 1/3] media: i2c: imx334: Optimized 4k and 2k mode
 register arrays
Message-ID: <Z8Vgh24HtnjmuBNy@kekkonen.localdomain>
References: <20250228103332.3647098-1-shravan.chippa@microchip.com>
 <20250228103332.3647098-2-shravan.chippa@microchip.com>
 <Z8GiqSfuyQdUNylt@kekkonen.localdomain>
 <PH0PR11MB5611466B2027B79F7598534B81CF2@PH0PR11MB5611.namprd11.prod.outlook.com>
 <Z8VgUoNklDUd_jaF@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8VgUoNklDUd_jaF@kekkonen.localdomain>

On Mon, Mar 03, 2025 at 07:54:58AM +0000, Sakari Ailus wrote:
> Hi Shravan,
> 
> On Sat, Mar 01, 2025 at 12:56:55AM +0000, Shravan.Chippa@microchip.com wrote:
> > Hi Sakari,
> > 
> > > -----Original Message-----
> > > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Sent: Friday, February 28, 2025 5:19 PM
> > > To: shravan Chippa - I35088 <Shravan.Chippa@microchip.com>
> > > Cc: mchehab@kernel.org; kieran.bingham@ideasonboard.com; linux-
> > > media@vger.kernel.org; linux-kernel@vger.kernel.org; Conor Dooley -
> > > M52691 <Conor.Dooley@microchip.com>; Valentina Fernandez Alanis -
> > > M63239 <Valentina.FernandezAlanis@microchip.com>; Praveen Kumar -
> > > I30718 <Praveen.Kumar@microchip.com>
> > > Subject: Re: [PATCH V6 1/3] media: i2c: imx334: Optimized 4k and 2k mode
> > > register arrays
> > > 
> > > EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> > > content is safe
> > > 
> > > Hi Shravan,
> > > 
> > > On Fri, Feb 28, 2025 at 04:03:30PM +0530, shravan kumar wrote:
> > > > From: Shravan Chippa <shravan.chippa@microchip.com>
> > > >
> > > > Optimized the resolution arrays by integrating a common register array.
> > > >
> > > > Adjusted the register array values for 1920x1080@30 and 3840x2160@30
> > > > resolutions to align with the common register array values.
> > > >
> > > > Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> > > > ---
> > > >  drivers/media/i2c/imx334.c | 132
> > > > +++++++++----------------------------
> > > >  1 file changed, 31 insertions(+), 101 deletions(-)
> > > >
> > > > diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> > > > index a544fc3df39c..a800f2203592 100644
> > > > --- a/drivers/media/i2c/imx334.c
> > > > +++ b/drivers/media/i2c/imx334.c
> > > > @@ -167,8 +167,8 @@ static const s64 link_freq[] = {
> > > >       IMX334_LINK_FREQ_445M,
> > > >  };
> > > >
> > > > -/* Sensor mode registers for 1920x1080@30fps */ -static const struct
> > > > imx334_reg mode_1920x1080_regs[] = {
> > > > +/* Sensor common mode registers values */ static const struct
> > > > +imx334_reg common_mode_regs[] = {
> > > >       {0x3000, 0x01},
> > > >       {0x3018, 0x04},
> > > >       {0x3030, 0xca},
> > > > @@ -176,26 +176,10 @@ static const struct imx334_reg
> > > mode_1920x1080_regs[] = {
> > > >       {0x3032, 0x00},
> > > >       {0x3034, 0x4c},
> > > >       {0x3035, 0x04},
> > > > -     {0x302c, 0xf0},
> > > > -     {0x302d, 0x03},
> > > > -     {0x302e, 0x80},
> > > > -     {0x302f, 0x07},
> > > > -     {0x3074, 0xcc},
> > > > -     {0x3075, 0x02},
> > > > -     {0x308e, 0xcd},
> > > > -     {0x308f, 0x02},
> > > > -     {0x3076, 0x38},
> > > > -     {0x3077, 0x04},
> > > > -     {0x3090, 0x38},
> > > > -     {0x3091, 0x04},
> > > > -     {0x3308, 0x38},
> > > > -     {0x3309, 0x04},
> > > > -     {0x30C6, 0x00},
> > > > +     {0x30c6, 0x00},
> > > >       {0x30c7, 0x00},
> > > >       {0x30ce, 0x00},
> > > >       {0x30cf, 0x00},
> > > > -     {0x30d8, 0x18},
> > > > -     {0x30d9, 0x0a},
> > > >       {0x304c, 0x00},
> > > >       {0x304e, 0x00},
> > > >       {0x304f, 0x00},
> > > > @@ -210,7 +194,7 @@ static const struct imx334_reg
> > > mode_1920x1080_regs[] = {
> > > >       {0x300d, 0x29},
> > > >       {0x314c, 0x29},
> > > >       {0x314d, 0x01},
> > > > -     {0x315a, 0x06},
> > > > +     {0x315a, 0x0a},
> > > 
> > > We still have this change in the patch that's just supposed to move register
> > > address/value pairs around. :-( Please check the changes yourself before
> > > posting v7.
> > 
> > Do I need to split the patch or drop this change ? in v7
> 
> Either way but it does not belong here.

Oh, and btw. if you want to make the change, then I think you'll need to
make HBLANK configurable with the default being the original value.

-- 
Sakari Ailus

