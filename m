Return-Path: <linux-media+bounces-55221-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMXMGINgsGloigIAu9opvQ
	(envelope-from <linux-media+bounces-55221-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 19:18:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EE08225653E
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 19:18:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5533C30074AD
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 18:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3576829E10F;
	Tue, 10 Mar 2026 18:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jpz9Wk4A"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1166295DAC
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 18:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773166720; cv=none; b=K3WvFiALso0Cq52S5SETRPVTkabNd/PgnSHpe5chpJVIXiU98vqh5v6UiK+AwDBjXxM3dNjnVfi8A5RsGun4Qajs6j03nOZs/NK7Wfd+IEPQUS+edfIFvElYyL40ItdPHQ3j/wvGsZah5vkMCScaz5bYLUUwKXygGQl6woEG4dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773166720; c=relaxed/simple;
	bh=CU6OB0pSzGG/cjl9BY4xjDfo9b3n9MeNN8mBpN0JfQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IcvdNrdo6vuXocXpFIIIQQIWiH3p3a+n3vdLjycvv6hMdu8+tsl6yurVvjDWruXlZ5BTvaQo8qCxayt4FvJhOEGJOop5TMBni/8Hmix2/OQVbWKGU82MwWJOqYMDAnqGYZ1q3ATB7pF9k2cGtvSyFrbzM0aEXY+kpRww4jwlWcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jpz9Wk4A; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773166715; x=1804702715;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CU6OB0pSzGG/cjl9BY4xjDfo9b3n9MeNN8mBpN0JfQU=;
  b=Jpz9Wk4AW+rd1p/Llebywi/WwZvWt4uDA29oZD19ZTChNA+LKvf87ax0
   bNRigB/nrftUsI1LKoHhZJNLQidT2YdZgmcg5QbS/oKdcTCF0L+MWiXMt
   obDksXeGtHDP/eUkVMmwZ/SuFp06HcN39Gp0IH8CrRIt8ypBy+sJ7DECR
   8Y851Wr/YMTQ3CIvIv6uXhu0235g6baHd63b2oY3P4gJeKgDTE725kGJs
   IdL8p//EbLD5YsYb4begV7/4yXddbkgTmB4hvwOZCAgXLi8xWMlqWKEGY
   LyiGaZYiKo//gGn1UYszNIdJ7/AfdQhLkm+D6nCnKsv1EFxp5ODkOjZJ8
   w==;
X-CSE-ConnectionGUID: +EWXUSrkRmuMuA1QuZhV/g==
X-CSE-MsgGUID: UMLwej/CRBO16ww2MPpNmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="76832214"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="76832214"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 11:18:35 -0700
X-CSE-ConnectionGUID: DtoPLCBKS5G8E7hAf9f9YA==
X-CSE-MsgGUID: UzHzKRDEQmqVknCt76Qipw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="220382118"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.54])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 11:18:32 -0700
Date: Tue, 10 Mar 2026 20:18:30 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: Fix alloc_pages_bulk() failed errors
Message-ID: <abBgdqjFID0rcm_T@ashevche-desk.local>
References: <20260310121826.35519-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310121826.35519-1-johannes.goede@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: EE08225653E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55221-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:dkim,intel.com:email,qualcomm.com:email,ashevche-desk.local:mid]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 01:18:26PM +0100, Hans de Goede wrote:
> Systems with the atomisp ISP do not have a lot of memory for modern
> standards, so these are often under memory pressure and alloc_pages_bulk()
> does not try very hard to free pages before returning an amount of pages
> which is less then requested. This leads to streaming from the camera
> often failing with a "alloc_pages_bulk() failed" error.
> 
> vmalloc() also uses alloc_pages_bulk(), but falls back to allocating one
> page at a time when that fails.
> 
> Do the same in alloc_private_pages() to avoid these errors.
> 
> While at it also drop the weird custom GFP flags and just use GFP_KERNEL
> and drop the dev_err() as alloc_pages() already complaints loudly if
> it fails itself.

> Closes: https://github.com/jfwells/linux-asus-t100ta/issues/4

I think it needs more precise link like
https://github.com/jfwells/linux-asus-t100ta/issues/4#issuecomment-3828755521

(I read over 100 comments to find some mentions of the memory issues).

> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Code wise LGTM, thanks for fixing this!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



