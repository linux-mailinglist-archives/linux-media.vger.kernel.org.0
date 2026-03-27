Return-Path: <linux-media+bounces-57206-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDzPDDBSxmk2IgUAu9opvQ
	(envelope-from <linux-media+bounces-57206-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 10:47:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 754B3341F83
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 10:47:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB21F30524FE
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 09:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE5B53D813E;
	Fri, 27 Mar 2026 09:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DdI0Zopd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2639836AB46;
	Fri, 27 Mar 2026 09:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774604491; cv=none; b=bz0KEcOnixGn2hQ4cswbyWfReBPW+iSUbbPYv7fJ/7nomGbAUPk92MLP7LxOLr+2h5LqBIuGMdu1MiNpo2CGrpHTb0/Ste3gIFAVx8ysfwbJfiTs49NIKyAWeQVXjW+YqLWFXiFQ6HAKuj42c+e++aUga3T/GPiU6UuxlXI7bW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774604491; c=relaxed/simple;
	bh=wv9Tjjlkh4qez9onYzW6UO0YtIB/fXvueojSzMLfPw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KgBGw7nk4Es3OTuNRRfMbKiGje9eO2odOog2oolwIKyb/O3phWfFU3+0sf9K+62sVXtKc+2wBxJp0Lr9TTVtHj8ak5P7zxq6mEA2rjl3Pez1KYb/w7mqD3Do/kpzR3RS9mSpP49IrxKSilZV6+x7i2QFPWh+gMAczHJyy8jQS5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DdI0Zopd; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774604490; x=1806140490;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wv9Tjjlkh4qez9onYzW6UO0YtIB/fXvueojSzMLfPw0=;
  b=DdI0ZopdAlaVTr6ww3tfZ49IluAJvQWe7IWL6FtmcZU/uSnnxJDfOin/
   w+5NcNGWyQHeWAQyBt2gSQTZxOe7FkOcffvVDVR932xRdsS3lzx6hUsxt
   dVWuR5LRjMTrEe383p0Q6Kuy+T4GNhZbbooNBcWFm2dMZznq18Mis9M9X
   /lPF18y/WKW9POC/Vkef7dw5gVCwO+Vzm5m9MXzV/Rp2QUO7FygVcGnNI
   FmlHLcl8ig7eZOR04MMB0WBAr0MFAm4GcwNfGwAFVKPaFlTxL3V4UAaGI
   +zewukMbqhETu2Zj/RelriIJcxl5S6IIUocGXs9+MwY0AG6qF1/SUzekT
   A==;
X-CSE-ConnectionGUID: CWzCjXgiQyOLeC9JvO+P7g==
X-CSE-MsgGUID: nFDqRP61Rm+m70vQH+lRvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75556839"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="75556839"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 02:41:29 -0700
X-CSE-ConnectionGUID: Ejl9t+TWQBSiulWta6o32A==
X-CSE-MsgGUID: sJC0DAQARpGPrfLGQolNmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="230044016"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.127])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 02:41:27 -0700
Date: Fri, 27 Mar 2026 11:41:25 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Anushka Badhe <anushkabadhe@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, hansg@kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Re: [PATCH v5] staging: media: atomisp: pci Move GP_TIMER_BASE to
 where it is used
Message-ID: <acZQxdOVacQSSncG@ashevche-desk.local>
References: <20260326202458.110368-1-anushkabadhe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326202458.110368-1-anushkabadhe@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-57206-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,ashevche-desk.local:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 754B3341F83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 01:54:58AM +0530, Anushka Badhe wrote:
> GP_TIMER_BASE is only used in gp_timer.c, so there is no need to
> define it in system_local.c and declare it as extern in system_local.h.
> 
> Move the definition directly into gp_timer.c and remove the extern
> declaration from system_local.h, along with its mention in gp_timer.h.

...

> Note:
> * This patch is part of the GSoC2026 application process for device tree
> bindings conversions
> * https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

Not sure how it's related, but thanks for cleaning this driver up!

...

> +/*GP TIMER , all timer registers are inter-twined,
> + * so, having multiple base addresses for
> + * different timers does not help
> + */

Now you also may fix the multi-line comment style and amend the text.

/*
 * All timer registers are inter-twined, so having multiple base addresses
 * for different timers does not help.
 */

With that being fixed, you may add
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



