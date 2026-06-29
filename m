Return-Path: <linux-media+bounces-65985-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A1+fN22OQmrQ9gkAu9opvQ
	(envelope-from <linux-media+bounces-65985-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 17:25:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8139A6DC9FD
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 17:25:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=LjIVLW7y;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65985-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65985-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 60B07303B9F1
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 15:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB3C426EAB;
	Mon, 29 Jun 2026 15:22:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03FA426D37;
	Mon, 29 Jun 2026 15:22:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782746537; cv=none; b=RqG/JWzC2lJVeNRlCujfkUjJt4miJTzVAlAan0/dzvJ9tG5aQk5vVmaogkDNx/1XXfPY+D4UblgIGXwdrzxpm783sWeMPMbnDkQFnUuKTqkT+1chAwVvmmITVfRJBtKvWNJEMVDIEmnWdKKVy3tCGsJwPxXXjMpQz2vTaBQj9Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782746537; c=relaxed/simple;
	bh=3nhMqATbBpip5vicGHiYjtjkt6pG1SvW6hoLlNxb+lM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m13JhX3WQch0uk+UT8zwtdsNGPqva6w2mt0LbyIf/MO99n+nMIJmoKDbSeN5wzvdGioon1lsALAkTYJ9GAKUiEADYJLt0d+QayXI2fG+YxUdwfM2atpysh4cks6OS20NTNLxMS0pY/0tzc89bYwyHejDeei+F8Ou8S/zkF1CfqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LjIVLW7y; arc=none smtp.client-ip=198.175.65.21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782746537; x=1814282537;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3nhMqATbBpip5vicGHiYjtjkt6pG1SvW6hoLlNxb+lM=;
  b=LjIVLW7yDAIyVf+uVp3GHci2+IhB+4FMsJyScbO3/sFPFlmjjMn/mwtm
   sfvrE+NEAhMIWejfs6s2gcO30vkgoGD8C5cmiR9sipIC0R1ValePnHqxq
   p24EsIQkD9XWtx3os9B3jA0SywvLJ7mJa8VEzKGShXYRGuoQW3woC/TGX
   lq+KHWJtdOYLVGph96ZD1M197E96mQVWc5a3nXNd6xgRGH9jvPWNveB5L
   4NrC/ku6H4hGy/QhNz/hviwYZRO2e5AeTYOuKzhp5W0n1tGLg2mX7pn3A
   YMZXkTvA+d2DCDaZ+iW7Nd09Qtf3Oe/7dYMWtQx6JyTMjvNxp7u1gX6QF
   A==;
X-CSE-ConnectionGUID: rgBCitxITpC28W9levB0Dw==
X-CSE-MsgGUID: qDS+S/tbStC1pvk6lPXtRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83315533"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="83315533"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 08:22:16 -0700
X-CSE-ConnectionGUID: 4LWcxAVJTICeY4WckVwoMg==
X-CSE-MsgGUID: 6uew36sjSSirYu1kwU6bHw==
X-ExtLoop1: 1
Received: from abityuts-desk.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.82])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 08:22:13 -0700
Date: Mon, 29 Jun 2026 17:22:04 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, stable@vger.kernel.org, 
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/15] media: i2c: os05b10: Use
 pm_runtime_get_if_active() when applying controls
Message-ID: <akKM6VhoLNep5UZB@mdjait-mobl>
References: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
 <20260325114404.95188-2-tarang.raval@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325114404.95188-2-tarang.raval@siliconsignals.io>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65985-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mehdi.djait@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tarang.raval@siliconsignals.io,m:sakari.ailus@linux.intel.com,m:stable@vger.kernel.org,m:himanshu.bhavani@siliconsignals.io,m:elgin.perumbilly@siliconsignals.io,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mehdi.djait@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:dkim,intel.com:email,vger.kernel.org:from_smtp,linux.intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8139A6DC9FD

Hi Tarang,

On Wed, Mar 25, 2026 at 05:13:47PM +0530, Tarang Raval wrote:
> os05b10_set_ctrl() currently uses pm_runtime_get_if_in_use() to decide
> whether controls should be applied to hardware.
> 
> This is not correct for the intended behavior. If the runtime PM usage
> count is 0 while the device is still active, pm_runtime_get_if_in_use()
> returns 0 and the control update is skipped, leaving the software state
> updated but not the hardware state.
> 
> Use pm_runtime_get_if_active() instead so controls are applied whenever
> the device is runtime-active, regardless of the current usage count.
> 
> Cc: stable@vger.kernel.org
> Fixes: 3aa9296a23ec4("media: i2c: add os05b10 image sensor driver")

A space is missing here after the commit hash.
See https://docs.kernel.org/process/submitting-patches.html

checkpatch will warn you about it.

with that:
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>  drivers/media/i2c/os05b10.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
> index e0453c988e4a..5da5b7d21f31 100644
> --- a/drivers/media/i2c/os05b10.c
> +++ b/drivers/media/i2c/os05b10.c
> @@ -531,7 +531,7 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
>  			return ret;
>  	}
>  
> -	if (pm_runtime_get_if_in_use(os05b10->dev) == 0)
> +	if (pm_runtime_get_if_active(os05b10->dev) == 0)

small nit: how about
	if (!pm_runtime_get_if_active(os05b10->dev))

consistent with other drivers using this call but really not important,
up to you if you want to change it.

--
Kind Regards
Mehdi Djait

