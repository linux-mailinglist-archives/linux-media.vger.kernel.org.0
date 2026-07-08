Return-Path: <linux-media+bounces-67030-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U6mIOKVoTmqIMAIAu9opvQ
	(envelope-from <linux-media+bounces-67030-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:11:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB89727CCA
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:11:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=GGoQ05uo;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67030-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67030-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 06F8E3041814
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 15:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFDA240927E;
	Wed,  8 Jul 2026 15:04:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CF2409263;
	Wed,  8 Jul 2026 15:04:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523054; cv=none; b=lL0chzSR27IVZyxeVolDGQsE7R76ewFW1xsM9f56aIJ9bC9INMDB4GEXTgRnsr9YFs4LLgOC7GsGrxE1dJljrxcmUCzfZOUcPuY+1Z4T9YtbXgGrZ/a55LDWG41Cc2o65j+myQ0N/bM/U26eWd2ToKauH6sGi7J3nkO/ND74Frk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523054; c=relaxed/simple;
	bh=ZZpg8A+rIRcn+8itiF87hNZtG2qu7fvDh8gEoQxK+lU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E9anzBwfQMHblNkQB4vhPLDoMN7AFwdy5KjAeaEBsep9daB87SBlTrAsOyBSYhHzjHZRcwk2dtxjRl0dyzrFPxQR+7i5JsHqNUcn+qvf0TAOz/8MjNvqAbsxeXw5KaSIEm0+JHDzzLDbmZa3oHWrQfmdkl8fN4piuVBDTWCo/ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GGoQ05uo; arc=none smtp.client-ip=192.198.163.7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783523049; x=1815059049;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZZpg8A+rIRcn+8itiF87hNZtG2qu7fvDh8gEoQxK+lU=;
  b=GGoQ05uo0Ux/thE0FbUUwc02atdZcEr/USzpIdrxlSVyd7VsGeCzSAdQ
   LZIWQL9mbTSADFDYUCYZMpEWDSvVvDSE6TVG6v0tj+Te2QFotLPiY705a
   iJqZ+LYpZVikdCvdc5DTb83pWYZ5xALecHaw/u+EjnwbAIsNtAO9xEs8O
   1fxZOo+zKKNlRwKIC0Mgsm8t6aRGUfs1PozNzKPo3tHfkD0nXcjTe/Xyr
   bcD0IxlW79OmULOHBH7pVecW9lB3pX5FfR1D2AeWJ7RPucl957oJDg201
   otdsTQnvgVZPsGC+2OqsXwJ7i2BH4QQzQPi2bPpyDpI5KHBer2BZjMq6C
   g==;
X-CSE-ConnectionGUID: DwkSWqF7SuODX1jzfi3u9g==
X-CSE-MsgGUID: pkonbQAqQzyCx1vpNnbr/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="109733976"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="109733976"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 08:04:04 -0700
X-CSE-ConnectionGUID: hALrnO3LTSmb8a3SfS9DDA==
X-CSE-MsgGUID: umfwa/0ISpeyVFB/GMkDhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="253833060"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.120])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 08:04:02 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E48E011FB4A;
	Wed, 08 Jul 2026 18:04:01 +0300 (EEST)
Date: Wed, 8 Jul 2026 18:04:01 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Biren Pandya <birenpandya@gmail.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: rdacm21: Fix missing
 media_entity_cleanup()
Message-ID: <ak5m4UZKfO6dvz2L@kekkonen.localdomain>
References: <20260704201627.82584-2-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704201627.82584-2-birenpandya@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67030-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:birenpandya@gmail.com,m:jacopo+renesas@jmondi.org,m:kieran.bingham+renesas@ideasonboard.com,m:laurent.pinchart+renesas@ideasonboard.com,m:niklas.soderlund+renesas@ragnatech.se,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo@jmondi.org,m:kieran.bingham@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.intel.com:from_mime,intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BBB89727CCA

Hi Biren,

Thanks for the patches.

On Sun, Jul 05, 2026 at 01:46:28AM +0530, Biren Pandya wrote:
> The driver misses calling media_entity_cleanup() on the probe error path
> and during remove, leaking resources if probe fails after entity
> initialization or when the driver is unloaded.
> 
> Fix this by adding media_entity_cleanup() to the rdacm21_probe() error
> handling path and to rdacm21_remove().
> 
> Fixes: a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
> Signed-off-by: Biren Pandya <birenpandya@gmail.com>
> ---
> Changes in v2:
> - Fixed a bug in v1's probe error handling where media_entity_cleanup() could be called on an uninitialized entity.
> - Added Signed-off-by tag which was missing in v1.
> 
>  drivers/media/i2c/rdacm21.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> index bcab462708c70..ece8a410e7ced 100644
> --- a/drivers/media/i2c/rdacm21.c
> +++ b/drivers/media/i2c/rdacm21.c
> @@ -588,10 +588,12 @@ static int rdacm21_probe(struct i2c_client *client)
>  
>  	ret = v4l2_async_register_subdev(&dev->sd);
>  	if (ret)
> -		goto error_free_ctrls;
> +		goto error_entity_cleanup;
>  
>  	return 0;
>  
> +error_entity_cleanup:
> +	media_entity_cleanup(&dev->sd.entity);

A newline would be nice here.

Somehow the patch can't be found in linuxtv.org...

>  error_free_ctrls:
>  	v4l2_ctrl_handler_free(&dev->ctrls);
>  error:
> @@ -606,6 +608,7 @@ static void rdacm21_remove(struct i2c_client *client)
>  
>  	v4l2_async_unregister_subdev(&dev->sd);
>  	v4l2_ctrl_handler_free(&dev->ctrls);
> +	media_entity_cleanup(&dev->sd.entity);
>  	i2c_unregister_device(dev->isp);
>  }
>  

-- 
Regards,

Sakari Ailus

