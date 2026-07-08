Return-Path: <linux-media+bounces-66958-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ztg+EmcPTmqiCQIAu9opvQ
	(envelope-from <linux-media+bounces-66958-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 10:50:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CA172356E
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 10:50:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=YSeigy63;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66958-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66958-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DCEC2302E9AD
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 08:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28F4345741;
	Wed,  8 Jul 2026 08:46:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29CF403147;
	Wed,  8 Jul 2026 08:46:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783500414; cv=none; b=laIvNBu20wDwdL1WWllXKH03wt9MmWX//PdOzzReBA7i/YjnS8mk1I5xM0j3wbX0HyOvxNHPh//ySBqhBbXkOp4MtAA8D4OYRronRpPTLXgA4Mk+pt0+7ok8TsGaTzczY2H4p2X0YB5oW9PXJxmXEZvBnQEdQDc7MJKsWefo0Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783500414; c=relaxed/simple;
	bh=jIbHKZxPVmlDKzs5seFvKgSaqpDtIpTnYijEIYyYPpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2nOxvLxFPOyKLRGgAzh/IRfUNOKmIlJSMDerQ0YcKFQ0cHXf7b4Xd+nP2el1Gn//+4RD7QZ149E0i5dGfnGjGntMpswNSF1n1DKS5rSs5UAeCXHaPZ0MGrXXWsxQivOaSzEwQIYPOSapXcoRU58Y0Vd5I5+8KRQB4maNKFeVUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YSeigy63; arc=none smtp.client-ip=192.198.163.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783500413; x=1815036413;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jIbHKZxPVmlDKzs5seFvKgSaqpDtIpTnYijEIYyYPpA=;
  b=YSeigy63UMqwWfNXLISI2t/IVEe//CpPUwZ50J+/40dYJBUsBXGm+Pa6
   3cnlb8JXf17tcKbfFF5hb/kEI0x/0wSJB7mtVycnkcKHlWxuObIHRbCPU
   zCaj44L7He+eWJKLCJY0BZxbyvzzHh/R+fdtRbJy+D848MWWj2fXfBbPF
   etuJIwspffM+U77ONRiW1xlLv7xsZk1MwOEFGjOpE2wpnE4YSYLbpDlWj
   8LPIg5WpMOVN9933ovAZFY8/r1q6K9AsFRqjWRr4khyS6xSYvKbd3JJ9c
   zj2Uq0hgdENN3TGd5Rsq3YpBdgyorqcbVfIijDljEMPJNtShigyCrZ3+U
   Q==;
X-CSE-ConnectionGUID: vxkcJcnERMiY3AAlo4+FRA==
X-CSE-MsgGUID: rUDhY0tARmy0F8Rx8EF88g==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="83269103"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="83269103"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 01:46:52 -0700
X-CSE-ConnectionGUID: 0zaz651aQSq9xXd8LTeuXQ==
X-CSE-MsgGUID: qfORS3I4RduI0XFKEgfVSg==
X-ExtLoop1: 1
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.120])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 01:46:51 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 56E4911FB4A;
	Wed, 08 Jul 2026 11:46:51 +0300 (EEST)
Date: Wed, 8 Jul 2026 11:46:51 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Biren Pandya <birenpandya@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: ov7740: Fix unchecked
 pm_runtime_get_sync() in remove()
Message-ID: <ak4Oe30jyaOTlQ1a@kekkonen.localdomain>
References: <20260615210412.34567-1-birenpandya@gmail.com>
 <20260615210412.34567-3-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615210412.34567-3-birenpandya@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66958-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:birenpandya@gmail.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim,kekkonen.localdomain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 45CA172356E

Hi Biren,

On Tue, Jun 16, 2026 at 02:34:12AM +0530, Biren Pandya wrote:
> The ov7740_remove() function unconditionally called pm_runtime_get_sync()
> but completely ignored the return value. If the device was already in an
> error state or disconnected, this could lead to an unbalanced PM runtime
> usage count or attempt to communicate with an unresponsive device.
> 
> Replace pm_runtime_get_sync() with pm_runtime_resume_and_get() to ensure
> the device actually resumed before attempting to issue I2C power-off
> commands, and safely put the PM runtime usage counter.
> 
> Signed-off-by: Biren Pandya <birenpandya@gmail.com>
> ---
>  drivers/media/i2c/ov7740.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
> index 62c124a1353a..6b81882da307 100644
> --- a/drivers/media/i2c/ov7740.c
> +++ b/drivers/media/i2c/ov7740.c
> @@ -1115,17 +1115,20 @@ static void ov7740_remove(struct i2c_client *client)
>  {
>  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>  	struct ov7740 *ov7740 = container_of(sd, struct ov7740, subdev);
> +	int ret;
>  
>  	v4l2_async_unregister_subdev(sd);
>  	media_entity_cleanup(&ov7740->subdev.entity);
>  	ov7740_free_controls(ov7740);
>  
> -	pm_runtime_get_sync(&client->dev);
> +	ret = pm_runtime_resume_and_get(&client->dev);
>  	pm_runtime_disable(&client->dev);
>  	pm_runtime_set_suspended(&client->dev);
> -	pm_runtime_put_noidle(&client->dev);
>  
> -	ov7740_set_power(ov7740, 0);
> +	if (ret >= 0) {
> +		ov7740_set_power(ov7740, 0);
> +		pm_runtime_put_noidle(&client->dev);
> +	}

Could you do what's done in other drivers, i.e. disable Runtime PM and then
see if the device is active and if so, power it off?

-- 
Regards,

Sakari Ailus

