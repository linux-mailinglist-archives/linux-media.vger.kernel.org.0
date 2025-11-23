Return-Path: <linux-media+bounces-47620-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC30C7E81E
	for <lists+linux-media@lfdr.de>; Sun, 23 Nov 2025 23:29:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A8813A3EAA
	for <lists+linux-media@lfdr.de>; Sun, 23 Nov 2025 22:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E33274B48;
	Sun, 23 Nov 2025 22:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="moafI85T"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D104433A6;
	Sun, 23 Nov 2025 22:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763936953; cv=none; b=cw1NL78y6C5xEyeKVNfcsVW7PY8W1yOshoakKxDKDFglOnjHtD1QQF88QXcy46qDzE0QQQdG/I105oYClXta/GjY1IHxRnRMuCfZOVA2W6FB38gbrs4QsRYxs2iWY2Oosdu9aCsyjEjMyGGRoQbFUwoCiEV7zzJH3p82ufxr6Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763936953; c=relaxed/simple;
	bh=HVYStuqoqDMlm90IYZiFbfw27vrFjgOsWLDFDAv5nrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IFbSFU8worL1j6GaYpMqFKs9+xuJhO1pgYAaRfE1qAafdNhcj13LGU4Iz8olKBUaC3e+76N/BI193D2LmRGqfgFinSPH0V9ccLqQ59maOzlKHzhmsdsfnWxaxw2dxbxicMjKw5bPs9q+Xxr4aIWvdFn0j2UMh/YtZdDrqsrKXSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=moafI85T; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763936951; x=1795472951;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HVYStuqoqDMlm90IYZiFbfw27vrFjgOsWLDFDAv5nrA=;
  b=moafI85Tz88js/3ggIP8I0SlDJN0ltXkmMh7O1zNPSWMSDU7SqJDvl1v
   aXwW8/mW3XKXaK26Vz4phfzj1XgvpZ4QATG/4yOSa1NKD1bsUs/alAZAr
   sANcY8hSlyE4dxAAX037Ae7cIkYh2xs5cXAildqogE2Rl8du/EMnEisha
   UigI5eNpe6o6hDxdBFV4Lod7GkNfBmnf1Wz3BnC7VcubVc+yNGBNMVvqm
   MWDhtCGh3AznYuipJXDsM/ZhCxFI2MDsxkTj8bTETqow3fT1/geN094SJ
   9mVV5jsYtlLHKLKmfNZHhMSZBgjJcVKJjZ58JM0thXBf1/g8fXVSCbjca
   g==;
X-CSE-ConnectionGUID: 8CFnQOK3Ql6wyHfmYYEYFA==
X-CSE-MsgGUID: 3jKrpzfsTSOwM3w1sMBanA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76550180"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; 
   d="scan'208";a="76550180"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 14:29:11 -0800
X-CSE-ConnectionGUID: AKRJtZDfS5GybDL7pS6qzQ==
X-CSE-MsgGUID: PYO5J11dSHyVC+Tl71f0Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; 
   d="scan'208";a="215530293"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.203])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 14:29:09 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id BBC8611F869;
	Mon, 24 Nov 2025 00:29:06 +0200 (EET)
Date: Mon, 24 Nov 2025 00:29:06 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>, linux-media@vger.kernel.org
Subject: Re: drivers/media/i2c/ccs/ccs.o: error: objtool:
 ccs_set_selection(): unexpected end of section .text.ccs_set_selection
Message-ID: <aSOKsu3XjLc9GRM-@kekkonen.localdomain>
References: <aSEGwejeD3f7lnUL@rli9-mobl>
 <20251122013414.GA3094872@ax162>
 <ahukd6b3wonye3zgtptvwzvrxldcruazs2exfvll6etjhmcxyj@vq3eh6pd375b>
 <20251122062946.GA3054484@ax162>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122062946.GA3054484@ax162>

Hi folks,

On Fri, Nov 21, 2025 at 11:29:46PM -0700, Nathan Chancellor wrote:
> On Fri, Nov 21, 2025 at 09:51:33PM -0800, Josh Poimboeuf wrote:
> > On Fri, Nov 21, 2025 at 06:34:14PM -0700, Nathan Chancellor wrote:
> > > On Sat, Nov 22, 2025 at 08:41:37AM +0800, kernel test robot wrote:
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > > head:   2eba5e05d9bcf4cdea995ed51b0f07ba0275794a
> > > > commit: 188d90f817e13b66e03e110eb6f82e8f5f0d654b objtool: Append "()" to function name in "unexpected end of section" warning
> > > > date:   8 months ago
> > > > :::::: branch date: 4 hours ago
> > > > :::::: commit date: 8 months ago
> > > > config: x86_64-randconfig-101-20251122 (https://download.01.org/0day-ci/archive/20251122/202511220717.5HHMLUHG-lkp@intel.com/config)
> > > > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511220717.5HHMLUHG-lkp@intel.com/reproduce)
> > > > 
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/r/202511220717.5HHMLUHG-lkp@intel.com/
> > > > 
> > > > All errors (new ones prefixed by >>):
> > > > 
> > > > >> drivers/media/i2c/ccs/ccs.o: error: objtool: ccs_set_selection(): unexpected end of section .text.ccs_set_selection
> > > 
> > > That change obviously does not result in this warning/error. This
> > > appears to be another divide by zero issue but based on my analysis so
> > > far, I do not understand how...
> > > 
> > > https://github.com/ClangBuiltLinux/linux/issues/2129
> > 
> > Here ya go :-)  After looking at a gazillion of these I can often spot
> > these pretty easily.  I'm not sure what the correct fix is here but this
> > made the error go away.
> > 
> > diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> > index 1c889c878abd..2429c05bffb3 100644
> > --- a/drivers/media/i2c/ccs/ccs-core.c
> > +++ b/drivers/media/i2c/ccs/ccs-core.c
> > @@ -2346,7 +2346,7 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
> >  		* CCS_LIM(sensor, SCALER_N_MIN) / sel->r.height;
> >  	max_m = crops[CCS_PAD_SINK]->width
> >  		* CCS_LIM(sensor, SCALER_N_MIN)
> > -		/ CCS_LIM(sensor, MIN_X_OUTPUT_SIZE);
> > +		/ (CCS_LIM(sensor, MIN_X_OUTPUT_SIZE) ? : 1);

Thanks for cc'ing me.

I prefer this as there's no guarantee the value read via ccs_get_limit()
would be non-zero. Presumably it is (and has been so far as no-one has hit
this to my knowledge), but we shouldn't rely on that.

I can post a patch as well.

> >  
> >  	a = clamp(a, CCS_LIM(sensor, SCALER_M_MIN),
> >  		  CCS_LIM(sensor, SCALER_M_MAX));
> 
> Aha! Thanks a lot :) I had thought it might be something with CCS_LIM()
> since ccs_get_limit() returns zero if ccs_limit_ptr() errors and in the
> default case of the switch statement. There are a lot of unchecked
> divides with the result of CCS_LIM() throughout this driver so I figured
> if that was it, there would be other instances of this warning... oh
> well.
> 
> Something like the following diff also fixes it since LLVM no longer
> sees 0 as a possible divisor, which seems a little better to me since it
> seems like one of the other uses could turn problematic with other
> optimizations.  Given these cases are both errors and have visible WARNs
> in case they are hit, it seems like it is better to use a valid divisor
> instead of 0.
> 
> Just one more warning to tackle in my personal configuration then I can
> enable CONFIG_OBJTOOL_WERROR to make new warnings from LLVM uprevs more
> obvious :)
> 
>   https://github.com/ClangBuiltLinux/linux/issues/2130
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 1c889c878abd..05c3da29f14c 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -137,7 +137,7 @@ u32 ccs_get_limit(struct ccs_sensor *sensor, unsigned int limit,
> 
>         ret = ccs_limit_ptr(sensor, limit, offset, &ptr);
>         if (ret)
> -               return 0;
> +               return 1;
> 
>         switch (CCI_REG_WIDTH_BYTES(ccs_limits[ccs_limit_offsets[limit].info].reg)) {
>         case sizeof(u8):
> @@ -151,7 +151,7 @@ u32 ccs_get_limit(struct ccs_sensor *sensor, unsigned int limit,
>                 break;
>         default:
>                 WARN_ON(1);
> -               return 0;
> +               return 1;
>         }
> 
>         return ccs_reg_conv(sensor, ccs_limits[limit].reg, val);

-- 
Kind regards,

Sakari Ailus

