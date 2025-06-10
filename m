Return-Path: <linux-media+bounces-34399-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE81EAD3124
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 11:04:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 592E13B3633
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 09:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273E01A8401;
	Tue, 10 Jun 2025 09:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PYMBdDi4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261591EE033;
	Tue, 10 Jun 2025 09:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749546287; cv=none; b=PyrBLgh63voumDq5Zk7keJxcFuZJAxky4q6RSuCLJVv42b/HN6I3S6Vrawu9MnYRtb42SCua1jGI0PpGGKEsnMoR8d1bSjoFRk78+LRwHlHab91Z++OfiF4MxDICbRYCP0+ulkK4cNozgLQsXbx5Pzqt6fGmrP+d5m78eQnR10k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749546287; c=relaxed/simple;
	bh=2WVnwozUW5aFCG+bhnHVa0Z0N0H4uOWDzvYAcojgCE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Guo0qTczrLNLxWtm1HW6f7Q1eAuYeg4g5uHxFU5FwFVA6pIDg/GSKxNOwMBYBDbwD7HeYJy+hYeYRtfkSlBcti6o6/cfKHvrPEG0C6U1bKDq7FU2aOpf8PrH/frQHroXuWIykEkIcl93wby5jpyFCarwMCHexekESs90U9mnTcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PYMBdDi4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749546286; x=1781082286;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2WVnwozUW5aFCG+bhnHVa0Z0N0H4uOWDzvYAcojgCE8=;
  b=PYMBdDi4jau3Ynb3gysjm8OybuFSvq5t8uNqBCxs4eYFNR9YoHSeUheT
   LexHtlQgy8Arva1wPHqK/3JYF7Z/ZsBFtRW7Juzv67eKv2Kv/pNCHVl32
   CEMJqj3lUrO1P+z1cJDYe0FnxXKFnKGB3omwTYQVqaitdo7Amfiyl6sQw
   1TsqIwbuDo9sLWsUGnxyBiWEMuqVxMqS6tmykKtBXhw4pFspoVEQiKM8Z
   zc7wVsdJTFurd++4u2F1tUHocCdtBvKfOW2egdniftKG4ZFMgh0h6njDw
   EAw7hYbWtJadHujaABhbHF3pIpdhZ2kSmxC3U7myLvJtr2N3vf0K1mCrI
   w==;
X-CSE-ConnectionGUID: qNYLSQLbRzKoUCObD5h7yg==
X-CSE-MsgGUID: qFSRwUV2RKeIpjbGTezdaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51557375"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="51557375"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 02:04:45 -0700
X-CSE-ConnectionGUID: dYNwyboNSpic8iDav4ABiA==
X-CSE-MsgGUID: 0vOjj/+XQbKs83dBlB7dsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="146688029"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.169])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 02:04:44 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id AA29B11FBA0;
	Tue, 10 Jun 2025 12:04:40 +0300 (EEST)
Date: Tue, 10 Jun 2025 09:04:40 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] media: i2c: vd55g1: Use first index of mbus codes
 array as default
Message-ID: <aEf1KIRuP_DdSqJO@kekkonen.localdomain>
References: <20250609-fix_vd55g1-v1-0-594f1134e3fb@foss.st.com>
 <20250609-fix_vd55g1-v1-4-594f1134e3fb@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-fix_vd55g1-v1-4-594f1134e3fb@foss.st.com>

Hi Benjamin,

On Mon, Jun 09, 2025 at 03:46:24PM +0200, Benjamin Mugnier wrote:
> Factorize code and prevent future erros in case of media bus codes
> change.
> Rename VD55G1_DEFAULT_MODE to VD55G1_MODE_DEF to mimic other macros
> while at it.
> 
> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> ---
>  drivers/media/i2c/vd55g1.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
> index dec6e3e231d54a742bdd08ff2a506c152bb89429..177caa5470cfcf49e0ae2fb568d7872a5608a11f 100644
> --- a/drivers/media/i2c/vd55g1.c
> +++ b/drivers/media/i2c/vd55g1.c
> @@ -111,9 +111,9 @@
>  
>  #define VD55G1_WIDTH					804
>  #define VD55G1_HEIGHT					704
> -#define VD55G1_DEFAULT_MODE				0
> +#define VD55G1_MODE_DEF					0
>  #define VD55G1_NB_GPIOS					4
> -#define VD55G1_MEDIA_BUS_FMT_DEF			MEDIA_BUS_FMT_Y8_1X8
> +#define VD55G1_MBUS_CODE_DEF				0
>  #define VD55G1_DGAIN_DEF				256
>  #define VD55G1_AGAIN_DEF				19
>  #define VD55G1_EXPO_MAX_TERM				64
> @@ -1260,7 +1260,8 @@ static int vd55g1_set_pad_fmt(struct v4l2_subdev *sd,
>  static int vd55g1_init_state(struct v4l2_subdev *sd,
>  			     struct v4l2_subdev_state *sd_state)
>  {
> -	unsigned int def_mode = VD55G1_DEFAULT_MODE;
> +	unsigned int def_mode = VD55G1_MODE_DEF;
> +	unsigned int def_mbus_code = VD55G1_MBUS_CODE_DEF;

Why the local variables?

>  	struct vd55g1 *sensor = to_vd55g1(sd);
>  	struct v4l2_subdev_format fmt = { 0 };
>  	struct v4l2_subdev_route routes[] = {
> @@ -1278,7 +1279,8 @@ static int vd55g1_init_state(struct v4l2_subdev *sd,
>  		return ret;
>  
>  	vd55g1_update_img_pad_format(sensor, &vd55g1_supported_modes[def_mode],
> -				     VD55G1_MEDIA_BUS_FMT_DEF, &fmt.format);
> +				     vd55g1_mbus_codes[def_mbus_code].code,
> +				     &fmt.format);

I'd remove def_mode, too, and just use VD55G1_DEFAULT_MODE. The 80
characters per line is preferred but I think in this case using local
variables just to use them once doens't make the code easier to read.

>  
>  	return vd55g1_set_pad_fmt(sd, sd_state, &fmt);
>  }
> 

-- 
Regards,

Sakari Ailus

