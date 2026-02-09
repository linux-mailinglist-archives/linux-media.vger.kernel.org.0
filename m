Return-Path: <linux-media+bounces-52430-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCz7DqcAimluFQAAu9opvQ
	(envelope-from <linux-media+bounces-52430-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 16:43:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A571120CA
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 16:43:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 633FF3036E92
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 15:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21CD937FF62;
	Mon,  9 Feb 2026 15:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bpYaZufe"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749E8378813;
	Mon,  9 Feb 2026 15:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770651731; cv=none; b=Gx90zyvRI3S2h/EGpvE5EofJkSQgJQ5/WGpaya5JyMZVAlQ0NZHLSP5bD2c7xYv0BkSW87OMjZHqlrdM8aPSNJLraKT+V+dDx+OBYvsmyrA3QjiAss9wsmoydS2bmggT+V+sf/HQGbkjka4sCx4/m553zcrCG4Hw/k5X30SK628=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770651731; c=relaxed/simple;
	bh=XExZ1PIeh++r3MitmEqnXqN0JM/Q6OFx/wHmAxHEiVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYA9/plyYlqkyrbIHpQ9iQJ9IeAz+/v4mR8BD5HitVIEBU89RpRwLTDSUE0A01kAg+H30Cf2jQv8oYpnGkV/YSBsmn67QeKyFyFzG5y6nQi+YXPbXkLPcfhJULWVzWvAvpO66qOV5aDiPcCMR1VrZlTtMcWhTKERjqaDMli3j9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bpYaZufe; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770651732; x=1802187732;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XExZ1PIeh++r3MitmEqnXqN0JM/Q6OFx/wHmAxHEiVY=;
  b=bpYaZufedWmAOBOvTAZ2D2pt59cPZmO8J2lCYadmqWIKQfUnB0pLHVpf
   /YJGRXVkLTG3Yx3/KvVSy+HYCnKCt/ZeOKYbvnybi7gmOyM6kVDOwpKPu
   /K3MOe3m6Rrh+avumZJESbzJ7QwnJUiR9ZAoSNV4/QiO2gAr1DyfMzmUK
   Yg5273M6iDt/a+S3vGmFjqNkC9es63Xppli4vxY0aJTfrhl3d+D6Mevsk
   hH5vBM0ViNr+BPmzHlqLmL+Wh6dsjf+GVvp1Vme6HlqbZxErU4SOGZ9KF
   UYtgTpvNEO+gNMGC3Zh71qiq+vTW/5OjQEN1YsqGXz//KoG/Dvi2namrA
   Q==;
X-CSE-ConnectionGUID: D7ZOGicsQhim4ZaTkr1GVA==
X-CSE-MsgGUID: HX3fwT6XS76QQ0masplG+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71750601"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="71750601"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 07:42:12 -0800
X-CSE-ConnectionGUID: eXYu0PUsQJqy982UXp/f4A==
X-CSE-MsgGUID: l/EviUYETFu6MfAj2yldog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="210714442"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.128])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 07:42:09 -0800
Date: Mon, 9 Feb 2026 17:42:06 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Matt Wardle <matt@mattwardle.net>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] staging: media: atomisp: Fix braces on incorrect
 lines
Message-ID: <aYoATsI9KB8bgwjz@smile.fi.intel.com>
References: <20260209142820.650334-1-matt@mattwardle.net>
 <20260209142820.650334-2-matt@mattwardle.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209142820.650334-2-matt@mattwardle.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52430-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,smile.fi.intel.com:mid,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A7A571120CA
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 02:29:07PM +0000, Matt Wardle wrote:
> Fix checkpatch.pl errors:
> 
> ERROR: open brace '{' following function definitions go on the next line
> ERROR: that open brace { should be on the previous line

Nice! My comments below.

...

> store_dvs_6axis_config(

>      const struct ia_css_dvs_6axis_config *dvs_6axis_config,
>      const struct ia_css_binary *binary,
>      const struct ia_css_frame_info *dvs_in_frame_info,
> -    ia_css_ptr ddr_addr_y) {
> +    ia_css_ptr ddr_addr_y)
> +{

This makes no sense to touch before the parameters are indented correctly.
I dunno if open parenthesis is fine at the end of the line, but I would do it
differently, as

store_dvs_6axis_config(const struct ia_css_dvs_6axis_config *dvs_6axis_config,
		       const struct ia_css_binary *binary,
		       ...)
{

...

The bottom line is, you need to check manually these and make prerequisite
patch to first fix the indentation.

...

>  int
>  ia_css_get_dvs2_statistics(
>      struct ia_css_dvs2_statistics          *host_stats,
> -    const struct ia_css_isp_dvs_statistics *isp_stats) {
> +    const struct ia_css_isp_dvs_statistics *isp_stats)
> +{

Ditto.

And when you go with indentation it makes sense to combine (it's fine in this
case) those changes with the splitting { to the next line.

-- 
With Best Regards,
Andy Shevchenko



