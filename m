Return-Path: <linux-media+bounces-59939-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJOwIEO48WngjwEAu9opvQ
	(envelope-from <linux-media+bounces-59939-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 09:50:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4437490C27
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 09:50:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4AAF5302C6E1
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 07:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E763AE704;
	Wed, 29 Apr 2026 07:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O0xvXKoG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E91C3A6F0D;
	Wed, 29 Apr 2026 07:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448673; cv=none; b=twDHjzE/jJP31bHsHg74Ws/KypUvt6OgFK6yfvWqN9fVuqLyAqJSdCdGrDbGuxPY1wuPQOVZ8qpCaKwmYbhprcuC2Mkp4+vmKBlGnvuaLsFgCirahsnNxdGIOQ4mx4ul5jQBOp2gCCNj/4ms2MIZmrZwSdYDcyAJadrsVIlB6vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448673; c=relaxed/simple;
	bh=kIESDZ9Ioy/sjFgPJ+z7d8gjaGENBLVFHCubQpqh7g8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L8TACmMB3/F88dp/sSra7lzVdlQxsvJxg6wdU/FwHfa5uRTqm8axytsRlKGyvY6SW9c0xUu7Qe5Ov/2yVkhhY+P3iPBcKwJy3jrDnpfwwc9SJFCvyn+9Ne1eGC0ljmUJUHA+CE+x/eS3J7e42hDVEPpXrp52MQnd8Vje3M5FVfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O0xvXKoG; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777448671; x=1808984671;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kIESDZ9Ioy/sjFgPJ+z7d8gjaGENBLVFHCubQpqh7g8=;
  b=O0xvXKoGVS6rLLNJZajcZyiddgp/Gezzu0hv54ZKOIIz1AtJK8Ird/ns
   1PUf27rgMYojYo2x9Cx3E0AhuQ0Lw/yQNYAYFjMFEZbxsjQWLL+9YiUyy
   TRNzl42oyS9BqbRWABpir5akeHIhlM46UZmilz//vlXiRocn8rrbEFJ5L
   Y3hHuZy+LOLpaq3ViveJeb+jScB7zzYZk78ea9eGCZ6xPXmYuDunIcGGG
   Q5rOLd8fe7oZT+apzgJ2leeCG1mPZccXleWjbuacv8yS3n83VrROVYtQ8
   SDeoQ8rzuB93srdAQYdQe7Hkltvu6PiT1DObkLq7w4z31f7NWDnZcu9dS
   Q==;
X-CSE-ConnectionGUID: PABOSiWCRoCq2XJuyaCwTA==
X-CSE-MsgGUID: Iy+MeZjBQ6isM8/rHx6zIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78289725"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="78289725"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 00:44:30 -0700
X-CSE-ConnectionGUID: 5Ao5iiU6SYiEIc/hvF+Ggw==
X-CSE-MsgGUID: GPcQ7FTMQwSEfd3CNgZswQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="231055114"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.150])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 00:44:29 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0ECD611FCDF;
	Wed, 29 Apr 2026 10:44:34 +0300 (EEST)
Date: Wed, 29 Apr 2026 10:44:34 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: hi846: fix hi846_write_reg_16 handling
Message-ID: <afG24mTIqU3jx0Bm@kekkonen.localdomain>
References: <20260429070351.1307204-1-mitltlatltl@gmail.com>
 <20260429070351.1307204-2-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429070351.1307204-2-mitltlatltl@gmail.com>
X-Rspamd-Queue-Id: D4437490C27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59939-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MAILSPIKE_FAIL(0.00)[2600:3c0a:e001:db::12fc:5321:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,kekkonen.localdomain:mid]

Hi Pengyu,

Thanks for the set.

On Wed, Apr 29, 2026 at 03:03:50PM +0800, Pengyu Luo wrote:
> hi846_write_reg_16() does not clear a positive *err value on success.
> pm_runtime_get_if_in_use() returns a positive value when the device
> is already in use. When hi846_set_ctrl() passes &ret holding this
> positive value) to hi846_write_reg_16(), the function returns with ret
> as is, the positive value propagates back as a return code, which
> callers interpret as an error.
> 
> Fix this by resetting *err to 0 only when it is positive.
> 
> Fixes: 04fc06f6dc15 ("media: hi846: fix usage of pm_runtime_get_if_in_use()")
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/media/i2c/hi846.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
> index a3f77b8434ca..09c109f3fba9 100644
> --- a/drivers/media/i2c/hi846.c
> +++ b/drivers/media/i2c/hi846.c
> @@ -1270,6 +1270,8 @@ static void hi846_write_reg_16(struct hi846 *hi846, u16 reg, u16 val, int *err)
>  
>  	if (*err < 0)
>  		return;
> +	else

Else is useless here.

> +		*err = 0;
>  
>  	put_unaligned_be16(reg, buf);
>  	put_unaligned_be16(val, buf + 2);

-- 
Regards,

Sakari Ailus

