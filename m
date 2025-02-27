Return-Path: <linux-media+bounces-27140-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A529A478F0
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 10:21:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1D5A7A490A
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 09:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1A1F227BAD;
	Thu, 27 Feb 2025 09:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WeHpMBn2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE92515DBB3;
	Thu, 27 Feb 2025 09:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740648080; cv=none; b=VfxUxQsLxQpgorq+Sl/OQMNEMRswjGOf8x7phYN8vwq059ZhG/UD3/G4CJC8bzY3PpyHQQ3bEUsELz3QeqDKcIKIdeXB+3S2Z+a3Lq6sVBJUwXx+nQvLvZPfRqBai+7QBwhL2RKulGeHGHMo65mFRLBzM+CHsF70U6K8tg+ljvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740648080; c=relaxed/simple;
	bh=+4tBccp2hJaSrzDQVra5A8hudiY5I7ym0Fqom3OIn6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VBjVlOKqi8R5my/JNf/iojK5zmr04f93IqfkY5m2jT/EUZwt6+SNcxv81Ccif4WkCDuF0ttyaTh1vHTVGWZ4iYJig6cGT19aErx4qPt1fhAeVah9eIElaI2/Sz2cimx15bZNVJmjjUDZEHiUsDXM61tKwZOuJ0cKcVumvusJ+8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WeHpMBn2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740648079; x=1772184079;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+4tBccp2hJaSrzDQVra5A8hudiY5I7ym0Fqom3OIn6A=;
  b=WeHpMBn2HTF5Kpk1KEd42UWSxcGa48RvWW7SI7nIijazyQFTi+9ye0ci
   KWsMmQLI/LNbi8Mw3XPSTSlh3mqwU42evqf1Zf9ONo/BFGevvTjI1sZMs
   xUQTvzR98vydst7p7MjMavgyxhBvsgNZEkXSWwtLHS9mQ7387W5xRFSFH
   pv1QFNxxRANe12G0MnRHI9z/yan0CyMkczem46RS45KgqCEkPJyjnFh9s
   re4GmcFsIPvEfjZ2fnedtMZ4o3wFXxqYJCrZ1pt2A/HdnwNuYwUY6Av6o
   pSfJIQOsqTLqqxKvBTdxmo2bfpwuPrR8q8fpY3nYCzfeLvI7lmk+dNFYw
   A==;
X-CSE-ConnectionGUID: B3xtlKx/Q1WphPXB6CAukQ==
X-CSE-MsgGUID: YE2Pj0x+QNKF5LcnBOjDNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41783188"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="41783188"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 01:21:18 -0800
X-CSE-ConnectionGUID: K21TiGyvSsq3xymICO23Yw==
X-CSE-MsgGUID: aCB2f2A1RAuzRiBg/1YofA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="117461361"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 01:21:17 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DA6F711F944;
	Thu, 27 Feb 2025 11:21:12 +0200 (EET)
Date: Thu, 27 Feb 2025 09:21:12 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Shravan.Chippa@microchip.com
Cc: mchehab@kernel.org, kieran.bingham@ideasonboard.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor.Dooley@microchip.com, Valentina.FernandezAlanis@microchip.com,
	Praveen.Kumar@microchip.com
Subject: Re: [PATCH V5 1/2] media: i2c: imx334: Optimized 4k and 2k mode
 register arrays
Message-ID: <Z8AuiGKcGUeKxf_H@kekkonen.localdomain>
References: <20250225062635.3566513-1-shravan.chippa@microchip.com>
 <20250225062635.3566513-2-shravan.chippa@microchip.com>
 <Z78lKVUsd-sxnZ0v@kekkonen.localdomain>
 <PH0PR11MB56115C346E4BE3CD3598DB5C81CD2@PH0PR11MB5611.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0PR11MB56115C346E4BE3CD3598DB5C81CD2@PH0PR11MB5611.namprd11.prod.outlook.com>

Hi Shravan,

On Thu, Feb 27, 2025 at 05:04:11AM +0000, Shravan.Chippa@microchip.com wrote:
> Hi Sakari,
> 
> > -----Original Message-----
> > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Sent: Wednesday, February 26, 2025 7:59 PM
> > To: shravan Chippa - I35088 <Shravan.Chippa@microchip.com>
> > Cc: mchehab@kernel.org; kieran.bingham@ideasonboard.com; linux-
> > media@vger.kernel.org; linux-kernel@vger.kernel.org; Conor Dooley -
> > M52691 <Conor.Dooley@microchip.com>; Valentina Fernandez Alanis -
> > M63239 <Valentina.FernandezAlanis@microchip.com>; Praveen Kumar -
> > I30718 <Praveen.Kumar@microchip.com>
> > Subject: Re: [PATCH V5 1/2] media: i2c: imx334: Optimized 4k and 2k mode
> > register arrays
> > 
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> > content is safe
> > 
> > Hi Shravan,
> > 
> > On Tue, Feb 25, 2025 at 11:56:34AM +0530, shravan kumar wrote:
> > > From: Shravan Chippa <shravan.chippa@microchip.com>
> > >
> > > Optimized the resolution arrays by integrating a common register array.
> > >
> > > Adjusted the register array values for 1920x1080@30 and 3840x2160@30
> > > resolutions to align with the common register array values.
> > >
> > > Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> > > ---
> > >  drivers/media/i2c/imx334.c | 148
> > > +++++++++++--------------------------
> > >  1 file changed, 43 insertions(+), 105 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> > > index a544fc3df39c..b2ad19abaca8 100644
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
> > >       {0x3168, 0xa0},
> > >       {0x316a, 0x7e},
> > >       {0x319e, 0x02},
> > > @@ -330,116 +314,63 @@ static const struct imx334_reg
> > mode_1920x1080_regs[] = {
> > >       {0x3002, 0x00},
> > >  };
> > >
> > > +/* Sensor mode registers for 1920x1080@30fps */ static const struct
> > > +imx334_reg mode_1920x1080_regs[] = {
> > > +     {0x302c, 0xf0},
> > > +     {0x302d, 0x03},
> > > +     {0x302e, 0x80},
> > > +     {0x302f, 0x07},
> > > +     {0x3074, 0xcc},
> > > +     {0x3075, 0x02},
> > > +     {0x308e, 0xcd},
> > > +     {0x308f, 0x02},
> > > +     {0x3076, 0x38},
> > > +     {0x3077, 0x04},
> > > +     {0x3090, 0x38},
> > > +     {0x3091, 0x04},
> > > +     {0x3308, 0x38},
> > > +     {0x3309, 0x04},
> > > +     {0x30d8, 0x18},
> > > +     {0x30d9, 0x0a},
> > > +};
> > > +
> > >  /* Sensor mode registers for 3840x2160@30fps */  static const struct
> > > imx334_reg mode_3840x2160_regs[] = {
> > > -     {0x3000, 0x01},
> > > -     {0x3002, 0x00},
> > > -     {0x3018, 0x04},
> > > -     {0x37b0, 0x36},
> > > -     {0x304c, 0x00},
> > > -     {0x300c, 0x3b},
> > > -     {0x300d, 0x2a},
> > > -     {0x3034, 0x26},
> > > -     {0x3035, 0x02},
> > > -     {0x314c, 0x29},
> > > -     {0x314d, 0x01},
> > > -     {0x315a, 0x02},
> > > -     {0x3168, 0xa0},
> > > -     {0x316a, 0x7e},
> > > -     {0x3288, 0x21},
> > > -     {0x328a, 0x02},
> > >       {0x302c, 0x3c},
> > >       {0x302d, 0x00},
> > >       {0x302e, 0x00},
> > >       {0x302f, 0x0f},
> > > +     {0x3074, 0xb0},
> > > +     {0x3075, 0x00},
> > > +     {0x308e, 0xb1},
> > 
> > This register wasn't part of the original register list for the mode. It seems to
> > have been written to in the other (binned?) mode only. It looks like a possible
> > bugfix. Should it be in a separate patch? This patch is only meant to reorganise
> > register settings to a base set and modes, not change the registers written in
> > any way.
> 
> Yes, it is correct that these values are not part of the original
> 3840x2160 register list. However, these registers have been modified in
> the other three mode registers array. The 3840x2160 mode operates with
> the reset value. If we switch to the other three modes and then return to
> the 3840x2160 mode, it should function correctly. Therefore, I am
> restoring the reset values.

Please do wrap at 75 characters when replying.

Such changes belong to separate patches. Please add further patches in such
cases.

-- 
Regards,

Sakari Ailus

