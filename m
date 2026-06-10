Return-Path: <linux-media+bounces-64379-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cI64OD8aKWqpQgMAu9opvQ
	(envelope-from <linux-media+bounces-64379-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 10:03:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1DB666E3B
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 10:03:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=fWuuyzoI;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64379-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64379-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6FA61306DEF2
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 07:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C47C396587;
	Wed, 10 Jun 2026 07:59:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58BF306D26
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 07:59:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781078348; cv=none; b=tVa8EmxdNZOli0tlmxDAJ0VY23H7MN/5VbokZEwFv1mLCjxdvHM10V4vIrAiQIHUyM8gDYqoqb0oQpYEJB4ii5LMFwVrkXFgvMQbXdyEnNkrC9yRrl7kdddCO99yTtXfjKnW0eJGj8v9YOVpWwjW+zpf/IVYwh+qb7sHggJqpvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781078348; c=relaxed/simple;
	bh=rsf9ZbjebAuumPJ9NTrFKbgLp1JjV1gA6gJ1dVDE7t8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bh4qh9wlAWIec8H5B9WEgJF2Ya/XJWLb5DdCtS9ktODlXs1thxvzXFABJjcrl9h6kaGBZ3LR6fsOnqdLeRliWveA0kVX19T4ftVIAQgiw05R8LjsA1JM1Rpr9EcRX4Po2DE8Y2xnkhqz6mNae29c6lDukPdXddLzyGokkhz6o/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fWuuyzoI; arc=none smtp.client-ip=198.175.65.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781078347; x=1812614347;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rsf9ZbjebAuumPJ9NTrFKbgLp1JjV1gA6gJ1dVDE7t8=;
  b=fWuuyzoI8GuMK04J7U4SZVqoFY687F4v4Iwh3VP+J7TdqbekKFEFm/lO
   LhO3izxukNPT74Gm/dO6LswIdMmMMtYAn8MrngqG1AHOYzCTkRQG8QmsU
   RfEsGLRo0OVNEUjpOiP51qe9Hlj1qtrgwH1Rhob1LE/IzqbVee8dk9fVQ
   5Bk7GXAlf2mggcaF6FM9J53dsnLzPMyXkdjuUt3jbKyLuCWQsZ8NaUxVW
   Z9/1RyAfLFnEMStLKsnq+Uhx8PWP8m4zNoPtap5qwAxzsY0ifjyZn+5hr
   ESiT+xcCjTCyBCuMelHkonFSHoVQV9Jja/VxZ8Hz1mlnhIRhF9acP0un8
   Q==;
X-CSE-ConnectionGUID: 960s03MnRPiul6u03wYPjw==
X-CSE-MsgGUID: ei2CMPqpT9is/ANcnd5ovQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81841048"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81841048"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 00:59:06 -0700
X-CSE-ConnectionGUID: wVKtDQETTNuH/NeYBbzE1Q==
X-CSE-MsgGUID: QaQFsvU7QAeu0m90ttxZMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="241959507"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.253])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 00:59:04 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9A936121C50;
	Wed, 10 Jun 2026 10:59:01 +0300 (EEST)
Date: Wed, 10 Jun 2026 10:59:01 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jurison Murati <eng.juri@gmail.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: ov8865: Drop PM runtime reference if
 stream start fails
Message-ID: <aikZRf93bHZEBL-e@kekkonen.localdomain>
References: <20260609232255.13559-1-eng.juri@gmail.com>
 <20260609232255.13559-2-eng.juri@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609232255.13559-2-eng.juri@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:eng.juri@gmail.com,m:dan.scally@ideasonboard.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:engjuri@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64379-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4E1DB666E3B

Hi Jurison,

On Wed, Jun 10, 2026 at 01:22:55AM +0200, Jurison Murati wrote:
> ov8865_s_stream() takes a runtime PM reference when enabling the
> stream, but returns without releasing it if ov8865_sw_standby()
> fails, leaving the reference unbalanced and the sensor powered
> indefinitely.
> 
> Signed-off-by: Jurison Murati <eng.juri@gmail.com>
> ---
> --- a/drivers/media/i2c/ov8865.c
> +++ b/drivers/media/i2c/ov8865.c
> @@ -2647,8 +2647,11 @@
>  	ret = ov8865_sw_standby(sensor, !enable);
>  	mutex_unlock(&sensor->mutex);
>  
> -	if (ret)
> +	if (ret) {
> +		if (enable)
> +			pm_runtime_put(sensor->dev);
>  		return ret;
> +	}
>  
>  	state->streaming = !!enable;

How about:

	if (ret || !enable)
		pm_runtime_put(sensor->dev);

	if (!ret)
		state->streaming = enable;

	return ret;
>  

The driver should be switched to {enable,disable}_streams but that's
another issue altogether.

-- 
Regards,

Sakari Ailus

