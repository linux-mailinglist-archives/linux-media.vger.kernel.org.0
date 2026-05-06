Return-Path: <linux-media+bounces-60558-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JbtFE4K+2mbVQMAu9opvQ
	(envelope-from <linux-media+bounces-60558-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 11:30:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F32B4D8A1E
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 11:30:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50B5D3027977
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 09:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 331483E3DA0;
	Wed,  6 May 2026 09:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WtmvjlbW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5BD3E1D01;
	Wed,  6 May 2026 09:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778059732; cv=none; b=ko9Zm//mhel3PtvYzDf4sLmzlY1lE1zhxCBdfduIUX0JO/8bQtR1r2fq9DquQuKQe0VD9iq9WDbn3X4BqsMWms95RkZhSM2D5oOz4+qqBiUD9LiXbUDzVQH+WbMds4Zn5YtxR005oWWIGgDwI+tzjZmwSj57xK+rs1KZYEfdOwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778059732; c=relaxed/simple;
	bh=3+UlTT82AzvhXCFAo6WB995cswC53PK4mXAxRgDRYEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aiC41MNAKDdk6IE3NZCoyQvPrNU7/DKuZ6eWJ3JHP7PYqcuaD3V945ekuadDfoaK9V2K8RbqsOXbGPX0yDRz75UPrL3BEAEMK86vOSs/VJkjBj9AFUDMiXM+UeKJic53II8fIagZYH2ZHl3la5jw9IVIEtR4p5Vvac5f4zos4X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WtmvjlbW; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778059730; x=1809595730;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3+UlTT82AzvhXCFAo6WB995cswC53PK4mXAxRgDRYEw=;
  b=WtmvjlbWNMIMStV8dvDH4NDzm9Gl8wBrH3g4ZHiGNxy7e+CkLH9Dry71
   l0bEPeSjlVDPMVi+nCOQvWhrj6d/wcd+UqRGh1gqONx2LumeV4RuBvDJN
   1Yj3mP46Wo/liDMviPBSNe83wPvwnvcykA8pSpz3RoPYcVnQTsvgwCN+y
   OZ1UjfqyyuskA+auJQQMECNPsaIgB9z6gW0OZz/AcPmaJY8neyMiybXby
   XedSKhAAa4O2mSPrYqbjdhVgOF+R4DfhGMSIS3lsAMg8rA9lTe5mgnp7m
   Eyfg5baQjNExyUUgjnPQXwd2vdqWym5ArGsd/ibMS2ubvrpPwTh+8L1JU
   A==;
X-CSE-ConnectionGUID: 6gxyOwsZTp2x0QFxJitasg==
X-CSE-MsgGUID: gXpQSGVqQ46dDsRte0V+aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="90441872"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="90441872"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 02:28:49 -0700
X-CSE-ConnectionGUID: aXwuU5mjQVieQp35TlF+Aw==
X-CSE-MsgGUID: M/1YFarlQemtZXpIsp4cIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="236190502"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.191])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 02:28:47 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4CDD911F70F;
	Wed, 06 May 2026 12:28:47 +0300 (EEST)
Date: Wed, 6 May 2026 12:28:47 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Martin Hecht <mhecht73@gmail.com>
Cc: martin.hecht@avnet.eu, michael.roeder@avnet.eu, stable@vger.kernel.org,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] media: i2c: alvium: Fix controls for WB/AWB
Message-ID: <afsJz1vVdd3o-pe9@kekkonen.localdomain>
References: <20260505142513.1551721-1-mhecht73@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505142513.1551721-1-mhecht73@gmail.com>
X-Rspamd-Queue-Id: 8F32B4D8A1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[avnet.eu,vger.kernel.org,gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-60558-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]

Hi Martin,

Thanks for the patch.

On Tue, May 05, 2026 at 04:25:10PM +0200, Martin Hecht wrote:
> With that patch the controls for red-balance and blue-balance were created
> only if the particular camera supports that. Otherwise the pointers on
> the control variable are initialized with NULL to prevent side effects for
> clustering with AWB control.
> 
> Fixes: 0a7af872915e ("media: i2c: Add support for alvium camera")
> Signed-off-by: Martin Hecht <mhecht73@gmail.com>
> ---
>  drivers/media/i2c/alvium-csi2.c | 37 ++++++++++++++++++++-------------
>  1 file changed, 22 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
> index b62b45a4f2fc..4c6934e9e177 100644
> --- a/drivers/media/i2c/alvium-csi2.c
> +++ b/drivers/media/i2c/alvium-csi2.c
> @@ -2108,26 +2108,33 @@ static int alvium_ctrl_init(struct alvium_dev *alvium)
>  						  0, 0, &alvium->link_freq);
>  	ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;

This is a problem. Can you move setting the flags after checking the
handler's error status? The functions adding controls may fail and this is
simply a missing error check.

Can you submit a fix, with a Fixes: tag and this patch should be rebased on
the fix, please?

>  
> +	if (alvium->avail_ft.whiteb) {
> +		ctrls->blue_balance = v4l2_ctrl_new_std(hdl, ops,
> +							V4L2_CID_BLUE_BALANCE,
> +							alvium->min_bbalance,
> +							alvium->max_bbalance,
> +							alvium->inc_bbalance,
> +							alvium->dft_bbalance);
> +		ctrls->red_balance = v4l2_ctrl_new_std(hdl, ops,
> +						       V4L2_CID_RED_BALANCE,
> +						       alvium->min_rbalance,
> +						       alvium->max_rbalance,
> +						       alvium->inc_rbalance,
> +						       alvium->dft_rbalance);
> +	} else {
> +		/* set to NULL for v4l2_ctrl_auto_cluster if not existing */
> +		ctrls->blue_balance	= NULL;
> +		ctrls->red_balance = NULL;

Aren't the two NULL already before this?

> +	}
> +
>  	/* Auto/manual white balance */
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
> +
> +		v4l2_ctrl_auto_cluster(3, &ctrls->auto_wb, 0, true);
> +	}
>  
>  	/* Auto/manual exposure */
>  	if (alvium->avail_ft.auto_exp) {

-- 
Kind regards,

Sakari Ailus

