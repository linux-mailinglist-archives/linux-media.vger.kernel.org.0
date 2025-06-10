Return-Path: <linux-media+bounces-34411-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A657AD3263
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 11:42:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14090173240
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 09:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9BB528B4F8;
	Tue, 10 Jun 2025 09:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nlWZl4Br"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C682F28B40D;
	Tue, 10 Jun 2025 09:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548517; cv=none; b=j9LB+Tvun1frp7SKjV42hnM8/6vD64nxRxOWP8TyVVU4qgiuIePILHKNOR7H/xRyxUqVvpoZwVwGQ7RO4k96YZMHFdJKwUYonP8B4uMpGT6cXgE3o8hKovFdIzH7IUtR4kd4uXsxWz43zSlLhHiljoA2GtY1kEGleCSf661xjVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548517; c=relaxed/simple;
	bh=DXEDcE1cizNF5Juxgkb8zD05SX5O2gAwfPXNpFKbu6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EM3WgqD/cAv6tzN/WiaLPKxhT4rK3NUU0SHLg2elmBCp3CCzAZrhNWjVLhSnyVwA6lj7jLluH57kMNIsHVq/Fx9qlQcT3XZGAV7uYJ2GL/fnTVdIB7U7/R3k2ak3pmdjG+DhDQuwr8p8mFU5xj18Apkb86LPZdtaV/XHk6P8MQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nlWZl4Br; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749548516; x=1781084516;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DXEDcE1cizNF5Juxgkb8zD05SX5O2gAwfPXNpFKbu6w=;
  b=nlWZl4BrPhV6HHo4hbbdoY7k36Lo9h5kkACbxehxBlTPrOdmnm6zAQRG
   YmGI8IL9gYwNuDgQN7eAg6eBcs4yUw2ea+ahYLy4qHPyazcQrNO8B4bWQ
   j46klgbhlTz1oOFvMm7CqfI9jyRsaeDhd1OSomC7wZhCxGrind3n5h6lW
   FLD1OFPQb5O0pLstwZVfLmRVyI6CsEo6I6DdCRgl6wDqab34FWhDHyP4Z
   TTMm35+2xoYn/oxAZdCAOz2R7eMrGHFSdsyy2Wo2tgKhhQyifwnbuHxLZ
   SoZ/QEfoU16xDzltp7SEw8kEzHH77ibPvbmW1ebwbrc29zXif6mcUhnit
   w==;
X-CSE-ConnectionGUID: 5zPHrkEMQvGqACQk5UoqCQ==
X-CSE-MsgGUID: HMdOY8d+R+mE7FjG/8bmjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51791955"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="51791955"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 02:41:56 -0700
X-CSE-ConnectionGUID: bHdyWezEQcW1Wc3KpZn66w==
X-CSE-MsgGUID: WEckVTlOSBiJr2ZS8WDFLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="169958265"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.169])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 02:41:54 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 248F611FBA0;
	Tue, 10 Jun 2025 12:41:51 +0300 (EEST)
Date: Tue, 10 Jun 2025 09:41:51 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] media: i2c: vd55g1: Use first index of mbus codes
 array as default
Message-ID: <aEf938EjRMODfJYq@kekkonen.localdomain>
References: <20250609-fix_vd55g1-v1-0-594f1134e3fb@foss.st.com>
 <20250609-fix_vd55g1-v1-4-594f1134e3fb@foss.st.com>
 <aEf1KIRuP_DdSqJO@kekkonen.localdomain>
 <396b3ee1-d737-49dd-a804-e07027c19fd9@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <396b3ee1-d737-49dd-a804-e07027c19fd9@foss.st.com>

Hi Benjamin,

On Tue, Jun 10, 2025 at 11:31:11AM +0200, Benjamin Mugnier wrote:
> On 6/10/25 11:04, Sakari Ailus wrote:
> > Hi Benjamin,
> > 
> > On Mon, Jun 09, 2025 at 03:46:24PM +0200, Benjamin Mugnier wrote:
> >> Factorize code and prevent future erros in case of media bus codes
> >> change.
> >> Rename VD55G1_DEFAULT_MODE to VD55G1_MODE_DEF to mimic other macros
> >> while at it.
> >>
> >> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> >> ---
> >>  drivers/media/i2c/vd55g1.c | 10 ++++++----
> >>  1 file changed, 6 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
> >> index dec6e3e231d54a742bdd08ff2a506c152bb89429..177caa5470cfcf49e0ae2fb568d7872a5608a11f 100644
> >> --- a/drivers/media/i2c/vd55g1.c
> >> +++ b/drivers/media/i2c/vd55g1.c
> >> @@ -111,9 +111,9 @@
> >>  
> >>  #define VD55G1_WIDTH					804
> >>  #define VD55G1_HEIGHT					704
> >> -#define VD55G1_DEFAULT_MODE				0
> >> +#define VD55G1_MODE_DEF					0
> >>  #define VD55G1_NB_GPIOS					4
> >> -#define VD55G1_MEDIA_BUS_FMT_DEF			MEDIA_BUS_FMT_Y8_1X8
> >> +#define VD55G1_MBUS_CODE_DEF				0
> >>  #define VD55G1_DGAIN_DEF				256
> >>  #define VD55G1_AGAIN_DEF				19
> >>  #define VD55G1_EXPO_MAX_TERM				64
> >> @@ -1260,7 +1260,8 @@ static int vd55g1_set_pad_fmt(struct v4l2_subdev *sd,
> >>  static int vd55g1_init_state(struct v4l2_subdev *sd,
> >>  			     struct v4l2_subdev_state *sd_state)
> >>  {
> >> -	unsigned int def_mode = VD55G1_DEFAULT_MODE;
> >> +	unsigned int def_mode = VD55G1_MODE_DEF;
> >> +	unsigned int def_mbus_code = VD55G1_MBUS_CODE_DEF;
> > 
> > Why the local variables?
> > 
> >>  	struct vd55g1 *sensor = to_vd55g1(sd);
> >>  	struct v4l2_subdev_format fmt = { 0 };
> >>  	struct v4l2_subdev_route routes[] = {
> >> @@ -1278,7 +1279,8 @@ static int vd55g1_init_state(struct v4l2_subdev *sd,
> >>  		return ret;
> >>  
> >>  	vd55g1_update_img_pad_format(sensor, &vd55g1_supported_modes[def_mode],
> >> -				     VD55G1_MEDIA_BUS_FMT_DEF, &fmt.format);
> >> +				     vd55g1_mbus_codes[def_mbus_code].code,
> >> +				     &fmt.format);
> > 
> > I'd remove def_mode, too, and just use VD55G1_DEFAULT_MODE. The 80
> > characters per line is preferred but I think in this case using local
> > variables just to use them once doens't make the code easier to read.
> > 
> 
> You guessed correctly, local variables are here to avoid overflowing the
> 80 characters per line.
> If I put VD55G1_DEFAULT_MODE directly then checkpatch will fail. As I
> understand this is a hard requirement ?

It's not a hard requirement in media-ci, no. In some cases it's justified
to have longer lines than that (see V4L2 IOCTL definitions, for instance),
I don't mind if it happens above. You could also make the function name
shorter, it's pretty long. Up to you.

> 
> I could do something like :
> 
> const struct vd55g1_mode *mode =
> 	&vd55g1_supported_modes[VD55G1_MODE_DEF];
> const struct vd55g1_fmt_desc *mbus_code =
> 	&vd55g1_mbus_codes[VD55G1_MBUS_CODE_DEF];
> [...]
> vd55g1_update_img_pad_format(sensor, mode, mbus_code->code,
> 			     &fmt.format);
> 
> Which IMO improves readability, what do you think ?

I'd just do this without local variables.

-- 
Regards,

Sakari Ailus

