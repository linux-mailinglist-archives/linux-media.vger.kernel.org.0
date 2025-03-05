Return-Path: <linux-media+bounces-27611-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F05DA4FE02
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 12:51:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9A34189243A
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 11:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D0EE241C8F;
	Wed,  5 Mar 2025 11:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VIPAJDZG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C369E23496F;
	Wed,  5 Mar 2025 11:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741175482; cv=none; b=XO9hJWSDt4SyeUps7bblNLcO80ZFCFAJOLbuqQqpopCpuIFqeGh3ylL4l4WWvTm1n/PRKGQm6F1YJKRPJcS2X5+rFwLxqTZj3BOMdQRoJ6LZ+JHsineopohuj0g0K254Zv5+jgbi/eBrkEpcbGBZ5j7/Sqa4FJVOsOD5c+Cw60g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741175482; c=relaxed/simple;
	bh=yE1qsvpZTFn67Y9Av23+WDsU3gWjvTM5nn2tZmg+Ysw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=boBe/Zxo7rlfTEywEnJFBew+OJOPIZD4O62d6mh1luRI6eqxlSuEv+LsvC7yevhN+AD+86ePemoKsWEHNCXyScd11+gv0XDfcVuazPMalg3SNiiOfO7U5xPXWw9NFES8RNrChedUgO4KcqgCXgpMj/d6QWG9h+dkHweA91S0xtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VIPAJDZG; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741175481; x=1772711481;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yE1qsvpZTFn67Y9Av23+WDsU3gWjvTM5nn2tZmg+Ysw=;
  b=VIPAJDZG3IxG8WdzM/2JZG1QAHA7RcxUlyzfbHttpq67a3jlB4iYf1PU
   bErQ8YHOE6NibJkvFLbIIYvJWYdCV+GE7k4qOh/mVAOP+UJxw+f6C0ZnJ
   6YqGiJ5UCMsWSiwua1pMboV8TLAScHBLn6xLpnU/8e//QdztxMpvrepKs
   3T0PxIV1stRH6PXFZDIrFY1tCCPH/DO4D0L+yYwfOg0KUoNgw9+VzRJ9z
   XURQwVK4193SRq+gK1n/9RGU0QGMkqDl58MoJnOVmVGlKKNrwXrA7pJwW
   Pag1VWtrb3oD9s76AKy+XS66O+NvNf9wR/mV6dBVGX3sUmp0vCl+bdeCV
   g==;
X-CSE-ConnectionGUID: bj3PLQ/bRGKcYWndw1bISg==
X-CSE-MsgGUID: GqVh1GCVSaC5Qy8n8Z/BQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53538122"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="53538122"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 03:50:59 -0800
X-CSE-ConnectionGUID: MmLCdaS8SOG6iew/bHQPrg==
X-CSE-MsgGUID: YLvi6Q5KR1atnl8Kirqtaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="118682658"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 03:50:55 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A1A4A12034A;
	Wed,  5 Mar 2025 13:50:53 +0200 (EET)
Date: Wed, 5 Mar 2025 11:50:53 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Shravan.Chippa@microchip.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor.Dooley@microchip.com, Valentina.FernandezAlanis@microchip.com,
	Praveen.Kumar@microchip.com
Subject: Re: [PATCH V7 4/4] media: i2c: imx334: add modes for 720p and 480p
 resolutions
Message-ID: <Z8g6nWDe2cjumixt@kekkonen.localdomain>
References: <20250305051442.3716817-1-shravan.chippa@microchip.com>
 <20250305051442.3716817-5-shravan.chippa@microchip.com>
 <174116732611.2914008.9738053002324304147@ping.linuxembedded.co.uk>
 <PH0PR11MB5611988F18EF02394E983AA881CB2@PH0PR11MB5611.namprd11.prod.outlook.com>
 <174117154242.2914008.10875320688605396953@ping.linuxembedded.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174117154242.2914008.10875320688605396953@ping.linuxembedded.co.uk>

Hi Kieran, Shravan,

On Wed, Mar 05, 2025 at 10:45:42AM +0000, Kieran Bingham wrote:
> Quoting Shravan.Chippa@microchip.com (2025-03-05 10:22:12)
> > Hi Kieran
> > 
> > > -----Original Message-----
> > > From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > > Sent: Wednesday, March 5, 2025 3:05 PM
> > > To: mchehab@kernel.org; sakari.ailus@linux.intel.com; shravan Chippa -
> > > I35088 <Shravan.Chippa@microchip.com>
> > > Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; Conor Dooley
> > > - M52691 <Conor.Dooley@microchip.com>; Valentina Fernandez Alanis -
> > > M63239 <Valentina.FernandezAlanis@microchip.com>; Praveen Kumar -
> > > I30718 <Praveen.Kumar@microchip.com>; shravan Chippa - I35088
> > > <Shravan.Chippa@microchip.com>
> > > Subject: Re: [PATCH V7 4/4] media: i2c: imx334: add modes for 720p and 480p
> > > resolutions
> > > 
> > > EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> > > content is safe
> > > 
> > > Quoting shravan kumar (2025-03-05 05:14:42)
> > > > From: Shravan Chippa <shravan.chippa@microchip.com>
> > > >
> > > > Added support for 1280x720@30 and 640x480@30 resolutions
> > > >
> > > > Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> > > > ---
> > > >  drivers/media/i2c/imx334.c | 66
> > > > ++++++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 66 insertions(+)
> > > >
> > > > diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> > > > index a7c0bd38c9b8..8cd1eecd0143 100644
> > > > --- a/drivers/media/i2c/imx334.c
> > > > +++ b/drivers/media/i2c/imx334.c
> > > > @@ -314,6 +314,46 @@ static const struct imx334_reg
> > > common_mode_regs[] = {
> > > >         {0x3002, 0x00},
> > > >  };
> > > >
> > > > +/* Sensor mode registers for 640x480@30fps */ static const struct
> > > > +imx334_reg mode_640x480_regs[] = {
> > > > +       {0x302c, 0x70},
> > > > +       {0x302d, 0x06},
> > > 
> > > These two are a single 16 bit register HTRIMMING_START = 1648
> > > 
> > > > +       {0x302e, 0x80},
> > > > +       {0x302f, 0x02},
> > > 
> > > These two are a single 16 bit register HNUM = 640
> > > 
> > > > +       {0x3074, 0x48},
> > > > +       {0x3075, 0x07},
> > > 
> > > These two are a single 16 bit (well, 12 bit value) AREA3_ST_ADR_1 = 1864
> > > 
> > > > +       {0x308e, 0x49},
> > > > +       {0x308f, 0x07},
> > > 
> > > These two are a single 16 bit register AREA3_ST_ADR_2 = 1865
> > > 
> > > > +       {0x3076, 0xe0},
> > > > +       {0x3077, 0x01},
> > > 
> > > These two are a single 16 bit register AREA3_WIDTH_1 = 480
> > > 
> > > > +       {0x3090, 0xe0},
> > > > +       {0x3091, 0x01},
> > > 
> > > These two are a single 16 bit register AREA3_WIDTH_2 = 480
> > > 
> > > > +       {0x3308, 0xe0},
> > > > +       {0x3309, 0x01},
> > > 
> > > These two are a single 16 bit register Y_OUT_SIZE
> > > 
> > > Don't you think
> > >         { Y_OUT_SIZE, 480 },
> > > 
> > > Is so much more readable and easier to comprehend and maintain?
> > > 
> > > 
> > > > +       {0x30d8, 0x30},
> > > > +       {0x30d9, 0x0b},
> > > 
> > > These two are a single 16 bit register UNREAD_ED_ADR = 2864
> > > 
> > > > +};
> > > 
> > > I'm still sad that we can all know the names of all these registers and yet this
> > > is writing new tables of hex values.
> > 
> > Do you want me use call like bellow API with register names:
> > CCI_REG16_LE(0x30d8);
> > cci_write();
> > cci_multi_reg_write();
> > devm_cci_regmap_init_i2c();
>  
> 
> Yes please, I would want that very much. I'm not very good at reading
> and storing hex values in my head! That's why I broke down the above
> registers to strings and decimal values.

I agree, it'd be good to do these while changing the driver now. I think it
could be done after adding the new modes, now that the patches already
exist.

> 
> 
> The discussions at
> https://lore.kernel.org/all/PH0PR11MB5611FD22CF6E12F7226FA9C081E12@PH0PR11MB5611.namprd11.prod.outlook.com/
> reports the full datasheet, and I stated:
> 
> 
> > > > This is an enormous amount of duplicated data that could be factored
> > > > out.
> > > >
> > > > These are also /very/ common against the existing mode register
> > > > tables too.
> > > >
> > > > I think several things need to happen in this driver:
> > > >
> > > >  1. It should be converted to use the CCI helpers.
> > > >  2. Whereever identifiable, the register names should be used
> > > > instead of
> > > >     just the addresses.
> > > >  3. The common factors of these tables should be de-duplicated.
> > > >
> > > > In your additions you only have differences in the following
> > > > registers from those entire tables:
> 
> You replied with
> 
> > >
> > > I will try to optimize camera resolution array register value usage by
> > > writing common register array values.
> 
> which you have done (point 3), and is great progress in the series.
> 
> Further down in the thread I stated:
> 
> 
> > > >  4. And ideally - the differences which determine the modes should
> > > > be
> > > >     factored out to calculations so that we are not writing out
> > > > large
> > > >     tables just to write a parameterised frame size.
> > > >
> > > >
> > > > I would beleive that at least steps 1 and 3 would be achievable, 2
> > > > and 4 would depend upon access to the datasheet.
> > > >
> 
> 
> I still believe steps 1 is important to this development. You have done
> step 3 I think. And now both step 2 and (later) step 4 are possible as we
> have the datasheet.

In this case the datasheet doesn't appear to be documenting the PLL.

-- 
Regards,

Sakari Ailus

