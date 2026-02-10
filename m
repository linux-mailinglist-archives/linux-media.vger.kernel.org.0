Return-Path: <linux-media+bounces-52508-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBj/JdX9imlyPAAAu9opvQ
	(envelope-from <linux-media+bounces-52508-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 10:43:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6C8119065
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 10:43:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 87EB6300B59D
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 09:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4861334167B;
	Tue, 10 Feb 2026 09:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tu/g0M2E"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AA8340280;
	Tue, 10 Feb 2026 09:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770716626; cv=none; b=EzPGoXbst95o2kHyPKdxNF5d0cKaJzz9w/izSKYcA1a22A9hbBoVy14yg/XG4N+R5LAOkaZd3/JQTk2XNSmMcoa7Zkbnh8MgchZ+IL6BhKM/uK/a1xYvjMedccjOvOMOWZ33tXVjr7CwPomqIIfNz7rjz4CEF2zabRwf7/gcqbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770716626; c=relaxed/simple;
	bh=VNlCnlDm3LalWAYPVIDP8Zo+8N2RwvMxFWoqr6j/8cA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lnozumsd4Vkb/8gJ/NVJCbejN6iEdBUSq5fDWh/J4MkacusPdVwDjn2GcCVoPAcXgpOWI8bUfq24qoyfiCG9aQYLWCIz/j/YpI8wORiPM5geG+BMyZRplHvnTdKFULp72D3I53D2M5ISUTCRcE5hGhDRJYp4ztJD/aYgwF0PK2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tu/g0M2E; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770716625; x=1802252625;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VNlCnlDm3LalWAYPVIDP8Zo+8N2RwvMxFWoqr6j/8cA=;
  b=Tu/g0M2Es7pfYH8gT80eK6K5Z4wzeRsQ/IPUOvYO9CSY9FutgiJl8Cdk
   Z/39tDH9KvB8j+81eCv/WlDYmsshTpB+MHcor68lWjtlB1dYOB1hpK4b0
   MDwrpjroMe40CCoyU8jP04uodlT81vYC76fiOCdGck+lGKYlfM/zSYLIP
   gf47GZyujKQF59JbFdMANnOJzXEpfBZApt24iKD85WxQ2AjOsQHxdpNri
   yyejY2P6qHG33KKtSsGYxLgpSOZgKhygkUEGr61wSmVxl8nuQgx44mG5Y
   pf9UxNyiQV5Gv7b/FgNFUTh8mFEn78xi+hxv5sNiRHmB31h04BZjsz+I6
   g==;
X-CSE-ConnectionGUID: 0ahNoe0nR2ezha8Fvcux6g==
X-CSE-MsgGUID: 6+n6St5DRrOsGUoT0difsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="82478716"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="82478716"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 01:43:29 -0800
X-CSE-ConnectionGUID: hcf8+xKPSwuy2e1Tdni8qw==
X-CSE-MsgGUID: vQo+IOGYTAOx0nfHGuJUlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216839734"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.39])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 01:43:27 -0800
Date: Tue, 10 Feb 2026 11:43:24 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Ethan Lam <ethanlxkernel@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	sakari.ailus@linux.intel.com, andy@kernel.org, hverkuil@kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: atomisp: fix block comment style
Message-ID: <aYr9vMzvyBn83A0U@smile.fi.intel.com>
References: <20260210092312.29322-1-ethanlxkernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210092312.29322-1-ethanlxkernel@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-52508-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,checkpatch.pl:url,intel.com:dkim,smile.fi.intel.com:mid]
X-Rspamd-Queue-Id: 3F6C8119065
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 05:23:11PM +0800, Ethan Lam wrote:
> Fixed all block comment style warnings by checkpatch.pl.

...

>  /*
>   * DFS progress is shown as follows:
>   * 1. Target frequency is calculated according to FPS/Resolution/ISP running
> - *    mode.
> + * mode.
>   * 2. Ratio is calculated using formula: 2 * HPLL / target frequency - 1
> - *    with proper rounding.
> + * with proper rounding.
>   * 3. Set ratio to ISPFREQ40, 1 to FREQVALID and ISPFREQGUAR40
> - *    to 200MHz in ISPSSPM1.
> + * to 200MHz in ISPSSPM1.
>   * 4. Wait for FREQVALID to be cleared by P-Unit.
>   * 5. Wait for field ISPFREQSTAT40 in ISPSSPM1 turn to ratio set in 3.
>   */

Please, use your common sense. The above is false-positive.

...

>  	 * The standard CSS2.0 API tells the following calling sequence of
>  	 * dequeue ready buffers:
>  	 * while (ia_css_dequeue_psys_event(...)) {
> -	 *	switch (event.type) {
> -	 *	...
> -	 *	ia_css_pipe_dequeue_buffer()
> -	 *	}
> +	 * switch (event.type) {
> +	 * ...
> +	 * ia_css_pipe_dequeue_buffer()
> +	 * }
>  	 * }

No way, really.

...

You need to read the code and change wisely. NAK for this version.
(I'm even not going to read the rest.)

-- 
With Best Regards,
Andy Shevchenko



