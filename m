Return-Path: <linux-media+bounces-60850-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DlCDYzv/GlKVgAAu9opvQ
	(envelope-from <linux-media+bounces-60850-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 22:01:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 894214EE342
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 22:01:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92EA8303C3D6
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 20:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2D0F35B644;
	Thu,  7 May 2026 20:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GJsyLmL9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8E5175A85;
	Thu,  7 May 2026 20:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778184057; cv=none; b=S+ya/SPuUBN4PrIVQXaDduHptLGTSjfJJIKSrvbwBGrTOFxxKGPTIWTQfH8F2LwwlmG9tGfijGbrmfYKkkyHAYWf5w9Z2rap/cG5cZmRTSKQWVJbQN79wDjVPW6mw97ux6qx5iz2qevzt1VoiYnQU93QQLRM71VlSVZTR+DZlpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778184057; c=relaxed/simple;
	bh=2qNsDmDgw6c8QSIadJe4FyI4GCBLCzF1MIx5RJRIrZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dbiqpt8aTrLXDIoaqlUfiN4WttRk56VgNTS92WWZwwnoa2UFmcNy5ExPdTtMl6qcvKBPvM/9x2ik4aCv5w/Q+IGKl3BpPXrfbe2mZHj4SavHwz+tcGm3QG5EXH0mdVaRTkvD9vqYzXW8nvSTtz0Tr+9sIipYTDmSwj2xqRB5lA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GJsyLmL9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778184055; x=1809720055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2qNsDmDgw6c8QSIadJe4FyI4GCBLCzF1MIx5RJRIrZY=;
  b=GJsyLmL9Re0SARK04Ug+WyJPHi/VuYNz1MJPmSf28USsVAldSU64lzQU
   0FJ8YyVl5X5ma2sgpp/jNCSzaSzW8xuOqv7+BBoTLvQEx7MiVyC2iX7ao
   /bMrEuLWjPAaLCre/yp6pq1LacMAwcsUuhZdNtkhWh1CpBY8Ek7Gh5d+q
   +pPzzs1jYV0WyyXToNQds/sD9noyRuT7HxFwIixpI6Zj8JwpvYQ7jKYYG
   dd2SLkQgqiOv9rwLId4FAa3RL0+sSx/vyn/AR+xhW/TnJkPznebK1F0nS
   Ef+jzOjnYRgIRDEfvKNAMHW2riDX3OruUy08W0pbhVoFtBTuEE4sEAOAb
   A==;
X-CSE-ConnectionGUID: ih7FDrFGSO+s4DCKZf80hA==
X-CSE-MsgGUID: vcB+4rjyQqSIo55Dt1vLrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="78998137"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="78998137"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 13:00:55 -0700
X-CSE-ConnectionGUID: V7P3ZoYnSX6pFoznmIjjRA==
X-CSE-MsgGUID: vA0SJt3/QR+KePyfQiGgxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="240550375"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.213])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 13:00:52 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 750FB11F8DF;
	Thu, 07 May 2026 23:00:48 +0300 (EEST)
Date: Thu, 7 May 2026 23:00:48 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Martin Hecht <mhecht73@gmail.com>
Cc: martin.hecht@avnet.eu, michael.roeder@avnet.eu, stable@vger.kernel.org,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] media: i2c: alvium: fix critical pointer access in
 alvium_ctrl_init
Message-ID: <afzvcAFPYJ_oMB9T@kekkonen.localdomain>
References: <20260507163443.39794-1-mhecht73@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507163443.39794-1-mhecht73@gmail.com>
X-Rspamd-Queue-Id: 894214EE342
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[avnet.eu,vger.kernel.org,gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-60850-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

Hi Martin,

On Thu, May 07, 2026 at 06:34:30PM +0200, Martin Hecht wrote:
> The current implementation of alvium_ctrl_init creates several controls
> in function alvium_ctrl_init and uses the returned pointer without
> check. That can cause write access over NULL-pointer for several
> controls.

No reason to have so short lines in the middle of a paragraph. But...

> The reworked code checks the pointers before adding flags and also it
> creates controls for V4L2_CID_BLUE_BALANCE and V4L2_CID_RED_BALANCE only
> if supported by the particular camera model.

can you put this into a separate patch? It's a different issue, albeit both
patches are dealing with controls.

> 
> Fixes: 0a7af872915e ("media: i2c: Add support for alvium camera")
> Cc: stable@vger.kernel.org
> Signed-off-by: Martin Hecht <mhecht73@gmail.com>
> ---
>  drivers/media/i2c/alvium-csi2.c | 72 +++++++++++++++++++--------------
>  1 file changed, 42 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
> index b62b45a4f2fc..947b32950efa 100644
> --- a/drivers/media/i2c/alvium-csi2.c
> +++ b/drivers/media/i2c/alvium-csi2.c
> @@ -2100,34 +2100,41 @@ static int alvium_ctrl_init(struct alvium_dev *alvium)
>  					      V4L2_CID_PIXEL_RATE, 0,
>  					      ALVIUM_DEFAULT_PIXEL_RATE_MHZ, 1,
>  					      ALVIUM_DEFAULT_PIXEL_RATE_MHZ);
> -	ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +	if (ctrls->pixel_rate)
> +		ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;

There are many controls that need flags and your next patch was going to
set the flags after checking the error. I'd therefore do that here, too.

The PIXEL_RATE controls's READ_ONLY flag is set by the framework, the
driver doesn't need to set it anymore. I'd just remove the line setting the
flag above.

>  
>  	/* Link freq is fixed */
>  	ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, ops,
>  						  V4L2_CID_LINK_FREQ,
>  						  0, 0, &alvium->link_freq);
> -	ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> -
> -	/* Auto/manual white balance */
> +	if (ctrls->link_freq)
> +		ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	/* manual white balance */
> +	if (alvium->avail_ft.whiteb) {
> +		ctrls->blue_balance = v4l2_ctrl_new_std(hdl, ops,
> +							V4L2_CID_BLUE_BALANCE,
> +							alvium->min_bbalance,
> +							alvium->max_bbalance,
> +							alvium->inc_bbalance,
> +							alvium->dft_bbalance);
> +
> +		ctrls->red_balance = v4l2_ctrl_new_std(hdl, ops,
> +						       V4L2_CID_RED_BALANCE,
> +						       alvium->min_rbalance,
> +						       alvium->max_rbalance,
> +						       alvium->inc_rbalance,
> +						       alvium->dft_rbalance);
> +	}
> +
> +	/* Auto white balance */
>  	if (alvium->avail_ft.auto_whiteb) {
>  		ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
>  						   V4L2_CID_AUTO_WHITE_BALANCE,
>  						   0, 1, 1, 1);
> -		v4l2_ctrl_auto_cluster(3, &ctrls->auto_wb, 0, false);
> -	}
> -
> -	ctrls->blue_balance = v4l2_ctrl_new_std(hdl, ops,
> -						V4L2_CID_BLUE_BALANCE,
> -						alvium->min_bbalance,
> -						alvium->max_bbalance,
> -						alvium->inc_bbalance,
> -						alvium->dft_bbalance);
> -	ctrls->red_balance = v4l2_ctrl_new_std(hdl, ops,
> -					       V4L2_CID_RED_BALANCE,
> -					       alvium->min_rbalance,
> -					       alvium->max_rbalance,
> -					       alvium->inc_rbalance,
> -					       alvium->dft_rbalance);
> +		if (ctrls->auto_wb)
> +			v4l2_ctrl_auto_cluster(3, &ctrls->auto_wb, 0, false);
> +	}
>  
>  	/* Auto/manual exposure */
>  	if (alvium->avail_ft.auto_exp) {
> @@ -2136,7 +2143,9 @@ static int alvium_ctrl_init(struct alvium_dev *alvium)
>  					       V4L2_CID_EXPOSURE_AUTO,
>  					       V4L2_EXPOSURE_MANUAL, 0,
>  					       V4L2_EXPOSURE_AUTO);
> -		v4l2_ctrl_auto_cluster(2, &ctrls->auto_exp, 1, true);
> +		if (ctrls->auto_exp)
> +			v4l2_ctrl_auto_cluster(2, &ctrls->auto_exp,
> +					       V4L2_EXPOSURE_MANUAL, true);
>  	}
>  
>  	ctrls->exposure = v4l2_ctrl_new_std(hdl, ops,
> @@ -2145,15 +2154,8 @@ static int alvium_ctrl_init(struct alvium_dev *alvium)
>  					    alvium->max_exp,
>  					    alvium->inc_exp,
>  					    alvium->dft_exp);
> -	ctrls->exposure->flags |= V4L2_CTRL_FLAG_VOLATILE;
> -
> -	/* Auto/manual gain */
> -	if (alvium->avail_ft.auto_gain) {
> -		ctrls->auto_gain = v4l2_ctrl_new_std(hdl, ops,
> -						     V4L2_CID_AUTOGAIN,
> -						     0, 1, 1, 1);
> -		v4l2_ctrl_auto_cluster(2, &ctrls->auto_gain, 0, true);
> -	}
> +	if (ctrls->exposure)
> +		ctrls->exposure->flags |= V4L2_CTRL_FLAG_VOLATILE;
>  
>  	if (alvium->avail_ft.gain) {
>  		ctrls->gain = v4l2_ctrl_new_std(hdl, ops,
> @@ -2162,7 +2164,17 @@ static int alvium_ctrl_init(struct alvium_dev *alvium)
>  						alvium->max_gain,
>  						alvium->inc_gain,
>  						alvium->dft_gain);
> -		ctrls->gain->flags |= V4L2_CTRL_FLAG_VOLATILE;
> +		if (ctrls->gain)
> +			ctrls->gain->flags |= V4L2_CTRL_FLAG_VOLATILE;
> +	}
> +
> +	/* Auto/manual gain */
> +	if (alvium->avail_ft.auto_gain) {
> +		ctrls->auto_gain = v4l2_ctrl_new_std(hdl, ops,
> +						     V4L2_CID_AUTOGAIN,
> +						     0, 1, 1, 1);
> +		if (ctrls->auto_gain)
> +			v4l2_ctrl_auto_cluster(2, &ctrls->auto_gain, 0, true);
>  	}
>  
>  	if (alvium->avail_ft.sat)

-- 
Kind regards,

Sakari Ailus

