Return-Path: <linux-media+bounces-54782-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGIpG97ZqmnmXgEAu9opvQ
	(envelope-from <linux-media+bounces-54782-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 14:42:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7873221F85
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 14:42:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A29A830C30D5
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 13:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60509301718;
	Fri,  6 Mar 2026 13:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GbRETWeg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853F5273803;
	Fri,  6 Mar 2026 13:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804082; cv=none; b=aOT0xbq2EqyOZvq3tMAaVRtP+V6VBh+e7iZgTb5sX6ql7BtZ9cuWlWxhdwJpl9jmpvoL11BDwY/7/diN5/T5r3eaDbDBmtjzhNHqGRXj3v4O58m1KS5JBj5ILeG2OfuaZ5pPbrIUxxk21VjZ3bA0OiisC1Tsv1awlo7dHbH+UPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804082; c=relaxed/simple;
	bh=CDGW+I2+xLWSYq3NKrogUzaVD69oeTTr2TK4SmMDMm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JEP7Dm7751LRu3Rq50ssxD872A7kB7RL293VgLIkOKXfQSxFq/P2QERUNchcwkXfyyt2KDeeB0o7QNqrPU7K9P6+CLjpaTWTA9aJauhx0U1Lcp4PFagti4RyNXYcN7qFhVOk++UdUGYePjGtDmC6215nsPce44auENTiovlFZ5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GbRETWeg; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772804082; x=1804340082;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CDGW+I2+xLWSYq3NKrogUzaVD69oeTTr2TK4SmMDMm4=;
  b=GbRETWegqT52w/r0Ufbz5F6lssFKydt293TUt+2KvHN64B5slINYTeqd
   TyOFtiG2F1o3QJAEqPF2tqm3OOwxddiNT+TFq5oORa2Sz2m0ib95qR/WY
   zP4w4pyu+DwW7/AafKGXb2/0E/ZYGJrVtyYe0xTqUMfq3MPl6AQ1eHuW3
   mDUkCbWMtSo6/dZYrB8cNmh5/eCnq0pO8ow6KG6/rdxevIQIi4TpKyeEH
   Fkl/IXmLQvOrEIfB+2bMGsdhXSSvePNiPx2b3ZynPVi1+59FE+2j07VZw
   fHpEPv9zXjEZbg5vweztxykfdy0bcoQdWZ+KjFD5Izbij7Sj8BEuxMxqL
   Q==;
X-CSE-ConnectionGUID: vW5AOZvKTMqQx1NgWMm8Wg==
X-CSE-MsgGUID: kcl7REqcT1a92deUfcDRuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="84237158"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="84237158"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 05:34:42 -0800
X-CSE-ConnectionGUID: m6eLQIFhQluzyl0JYMrIjg==
X-CSE-MsgGUID: WsCasA3BSpmkqfzkjci9sw==
X-ExtLoop1: 1
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.201])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 05:34:39 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 21080121DC0;
	Fri, 06 Mar 2026 15:35:09 +0200 (EET)
Date: Fri, 6 Mar 2026 15:35:09 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: mehdi.djait@linux.intel.com,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/13] media: i2c: os05b10: keep vblank/exposure in sync
 on mode switch
Message-ID: <aarYDXtXzkMTWoES@kekkonen.localdomain>
References: <20260306123304.76722-1-tarang.raval@siliconsignals.io>
 <20260306123304.76722-11-tarang.raval@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306123304.76722-11-tarang.raval@siliconsignals.io>
X-Rspamd-Queue-Id: D7873221F85
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54782-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,siliconsignals.io:email]
X-Rspamd-Action: no action

Hi Tarang,

On Fri, Mar 06, 2026 at 06:03:00PM +0530, Tarang Raval wrote:
> When switching sensor modes, V4L2 updates the vblank range/default but
> keeps the previous current value, leaving vertical blanking unchanged.
> Update the vblank and exposure control values to the new mode defaults
> after adjusting the ranges.
> 
> Clamp the exposure default value to the new maximum to prevent -ERANGE
> during format changes.
> 
> Also use pm_runtime_get_if_active() in set_ctrl() to avoid touching the
> sensor when runtime suspended.
> 
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>  drivers/media/i2c/os05b10.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
> index d8d776de5f35..4601e33b7e8f 100644
> --- a/drivers/media/i2c/os05b10.c
> +++ b/drivers/media/i2c/os05b10.c
> @@ -732,16 +732,15 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
>  	if (ctrl->id == V4L2_CID_VBLANK) {
>  		/* Honour the VBLANK limits when setting exposure. */
>  		s64 max = fmt->height + ctrl->val - OS05B10_EXPOSURE_MARGIN;
> -
> +		s64 def = min_t (s64, max, os05b10->exposure->default_value);
>  		ret = __v4l2_ctrl_modify_range(os05b10->exposure,
>  					       os05b10->exposure->minimum, max,
> -					       os05b10->exposure->step,
> -					       os05b10->exposure->default_value);
> +					       os05b10->exposure->step, def);
>  		if (ret)
>  			return ret;
>  	}
>  
> -	if (pm_runtime_get_if_in_use(os05b10->dev) == 0)
> +	if (pm_runtime_get_if_active(os05b10->dev) == 0)

This actually appears to be a bugfix: it was possible to set controls
without them being applied on hardware if the use count was 0 but the
device was still active. I'd consider doing the bugfix separately before
the rest of the patches.

>  		return 0;
>  
>  	switch (ctrl->id) {
> @@ -844,10 +843,18 @@ static int os05b10_set_framing_limits(struct os05b10 *os05b10,
>  	if (ret)
>  		return ret;
>  
> +	ret = __v4l2_ctrl_s_ctrl(os05b10->vblank, vblank);
> +	if (ret)
> +		return ret;
> +
>  	max_exp = mode->vts - OS05B10_EXPOSURE_MARGIN;
> -	return __v4l2_ctrl_modify_range(os05b10->exposure,
> -					OS05B10_EXPOSURE_MIN, max_exp,
> -					OS05B10_EXPOSURE_STEP, mode->exp);
> +	ret = __v4l2_ctrl_modify_range(os05b10->exposure,
> +				       OS05B10_EXPOSURE_MIN, max_exp,
> +				       OS05B10_EXPOSURE_STEP, mode->exp);
> +	if (ret)
> +		return ret;
> +
> +	return __v4l2_ctrl_s_ctrl(os05b10->exposure, mode->exp);
>  }
>  
>  static inline void get_mode_table(unsigned int code,

-- 
Kind regards,

Sakari Ailus

