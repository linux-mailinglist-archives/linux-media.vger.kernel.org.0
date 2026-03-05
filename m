Return-Path: <linux-media+bounces-54573-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PnXDd07qWld3QAAu9opvQ
	(envelope-from <linux-media+bounces-54573-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 09:16:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ED21320D528
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 09:16:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6C47830439DA
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 08:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A59C3372B47;
	Thu,  5 Mar 2026 08:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QtZHoXYF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DA7372B2D;
	Thu,  5 Mar 2026 08:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772698583; cv=none; b=LivPzfla1ZLUGXWAR/vjX4CX/6VIZwOnw8Y6PPDhLcHIZA+zPHQIE1RI26xJEw+Y34JY0gyTcWjrhkFWXFMfRpsY9GHFwx6HufaU4OS3rk7EsM77mT2hjBBqXHbwhLOJ17Vi2bkt97T/RZCTKLoZ5o+Ssq/9hN/4C7FOqbxpQj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772698583; c=relaxed/simple;
	bh=rw76qL6L945evGUO8vbdDxjDjSV3PdnBtZDJY0ap8Rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGog8K6LAvX+Rh9JzwQbENVIRRKMOwBg9atxqTJLsDgkcmfWy5cm5EkV57GZ8+wEd0cGIUZFEfyzgSElhn4jAnckxS1GGt8KUyBxOIIdLUQLeWVTLc0qIq4heaYCMGNGX1hR/G6R490H6pegmpuS2DV+DOfQ7ujTh0RnrJ1wXVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QtZHoXYF; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772698582; x=1804234582;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rw76qL6L945evGUO8vbdDxjDjSV3PdnBtZDJY0ap8Rk=;
  b=QtZHoXYFW35w/6tPDeqMPm/UDqMLbBr3T4F7tzIcp9kT0ZZ1YuSZfVHW
   rpkAhEuIRtub18/NLBDsL6f63ApozHpPn+d0OgRllmytk3q5Rq+cTYUQv
   h163+Z5yIvqWc0v8Qi4YcaMamx30Tigjzh6g1gjYJcS3JzUn7jepo33Be
   7kLSc1rx2Ise3Uc6GqUfNhND9N64oqR1jbGU6whSypXH800V2dIicDMJl
   5asDbHjaFPgOUMtLXmTs//mVTxRlhFZ8ddX8Ll1P3vS/EcaAUa0Loit8k
   TMlxg6ZE0UmjIxg3tGYBtR3O3sO0WEURUEIUw+6tDQ94FKp/kx6S3pCxK
   Q==;
X-CSE-ConnectionGUID: x06Zp828T3aSx3+lJSBN1Q==
X-CSE-MsgGUID: 7pZSUWRqRzGXgqnEzfoNIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73692537"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="73692537"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 00:16:21 -0800
X-CSE-ConnectionGUID: zEhTmYNIQM2x2Y/QtP29Wg==
X-CSE-MsgGUID: IIEZ4/MPRXq5xAUryvtyzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="223282398"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.65])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 00:16:19 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id AE42A120CA3;
	Thu, 05 Mar 2026 10:16:48 +0200 (EET)
Date: Thu, 5 Mar 2026 10:16:48 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bogdan Sandu <bogdanelsandu2011@gmail.com>
Cc: gregkh@linuxfoundation.org, bingbu.cao@intel.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, mchehab@kernel.org,
	tian.shu.qiu@intel.com
Subject: Re: [PATCH v2 2/4] media: ipu3: use tabs
Message-ID: <aak78ByijKCWk-Uj@kekkonen.localdomain>
References: <2026020258-very-numbly-b36b@gregkh>
 <20260202175033.8640-1-bogdanelsandu2011@gmail.com>
 <20260202175033.8640-3-bogdanelsandu2011@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202175033.8640-3-bogdanelsandu2011@gmail.com>
X-Rspamd-Queue-Id: ED21320D528
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-54573-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kekkonen.localdomain:mid,intel.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 07:50:31PM +0200, Bogdan Sandu wrote:
> Use tabs instead of spaces.
> 
> Signed-off-by: Bogdan Sandu <bogdanelsandu2011@gmail.com>
> ---
>  drivers/staging/media/ipu3/ipu3-css.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
> index 145501e90..e990eb5b3 100644
> --- a/drivers/staging/media/ipu3/ipu3-css.c
> +++ b/drivers/staging/media/ipu3/ipu3-css.c
> @@ -1034,8 +1034,8 @@ static int imgu_css_pipeline_init(struct imgu_css *css, unsigned int pipe)
>  			       3 * cfg_dvs->num_horizontal_blocks / 2 *
>  			       cfg_dvs->num_vertical_blocks) ||
>  	    imgu_css_pool_init(imgu, &css_pipe->pool.obgrid,
> -			       imgu_css_fw_obgrid_size(
> -			       &css->fwp->binary_header[css_pipe->bindex])))
> +			       imgu_css_fw_obgrid_size
> +			       (&css->fwp->binary_header[css_pipe->bindex])))

This doesn't seem to be a major improvement.

>  		goto out_of_memory;
>  
>  	for (i = 0; i < IMGU_ABI_NUM_MEMORIES; i++)

-- 
Sakari Ailus

