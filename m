Return-Path: <linux-media+bounces-52113-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCXtJ7YQgmm9OwMAu9opvQ
	(envelope-from <linux-media+bounces-52113-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 16:13:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CA9DB297
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 16:13:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98AA730DB280
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 15:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 146D9316193;
	Tue,  3 Feb 2026 15:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C9OjkHyC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749C33101BD;
	Tue,  3 Feb 2026 15:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770131339; cv=none; b=e/+A4xg2Rz1Q9ID4PDRL9OELaCiImKDvNGn75hns5eXLHdhm/92waOCgQ5iLrY2eP0Rb+YeGnHL1IJQN5F7ct5WM/d6rtp4A8f4z6KSZO2WvRDlJmbIJO3ND75IaoNhIWDu4PgngDkSBInos3eJ7Kzbqf3aqbCCReSBJRGUgrBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770131339; c=relaxed/simple;
	bh=e4sqJ1UNO+FAZKwOmKR+4uAi34dqjv+pWrRv4ajgQDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CDoIG0JxihdJyOdHPGf+BrzauA92x7adwtRyGFYJp6zZh/sNoAa83gcb2eHPK+Y1go4FkT6UeXsvXHSXvIOpnikUkVHtKDUkyEptFtG6CQj3yzk31zpcR9zk73a52ibfCxxMBr6RMkpMgYzN+GWnNucVsmBYjBd1rmDxvE/Zh6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C9OjkHyC; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770131338; x=1801667338;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e4sqJ1UNO+FAZKwOmKR+4uAi34dqjv+pWrRv4ajgQDg=;
  b=C9OjkHyCIvDBlbHp37z2KlyKea3jiD4l+p0dQH+ZtKAqpuYd0/8Jzjhw
   ORd4TGfKgD1K51xci4jh/gwaZk9hPNDn2xuAHzC3/PfxsTtlTXLpPgVti
   ecYOY+b7LDNiqFuxgD9HC9YW7JAJVLOm98BPb9HtPIzuY0ZfAzis3ibrH
   MKHWbQgJuHvXI+bp82fUPW5PRK6ceE9ysYVBt5KdO5IrY3syey7fyOD4C
   hlPZNQZAH9N3pV15tTvA414MIeldoG+++bClh9X/ZN4mWHfMAJrMmvEt9
   i9Gc+vhZVyaehRde7Dl7fQLCNhvYbAnamhiYN/pT751Gj4S02Yfz455+E
   w==;
X-CSE-ConnectionGUID: 53LNgdKHSwa8VOuqtuEOxQ==
X-CSE-MsgGUID: xt7tgRLaSWiN251msWkRPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82731675"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="82731675"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 07:08:57 -0800
X-CSE-ConnectionGUID: OmL2nHe4S0+Zpx3+1LVZhg==
X-CSE-MsgGUID: x24vwGYnRM+7Ysw6ba5vPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="247472632"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 07:08:54 -0800
Date: Tue, 3 Feb 2026 17:08:51 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Zilin Guan <zilin@seu.edu.cn>
Cc: andy.shevchenko@gmail.com, andy@kernel.org, gregkh@linuxfoundation.org,
	hansg@kernel.org, hverkuil@kernel.org, jianhao.xu@seu.edu.cn,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Re: [PATCH v3] media: atomisp: Fix memory leak in
 atomisp_fixed_pattern_table()
Message-ID: <aYIPg22Z-GDOy1fG@smile.fi.intel.com>
References: <20260203135659.3801028-1-zilin@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203135659.3801028-1-zilin@seu.edu.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,seu.edu.cn,vger.kernel.org,lists.linux.dev,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-52113-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,smile.fi.intel.com:mid,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 43CA9DB297
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 01:56:59PM +0000, Zilin Guan wrote:
> atomisp_v4l2_framebuffer_to_css_frame() allocates memory for
> temporary variable raw_black_frame, which must be released via
> ia_css_frame_free() before the function returns. However, if
> sh_css_set_black_frame() fails, the function returns immediately without
> performing this cleanup, leading to a memory leak.
> 
> Fix this by assigning the return value of sh_css_set_black_frame() to
> ret. This ensures that the error code is propagated while allowing the
> execution to fall through to the ia_css_frame_free() cleanup call.
> 
> The bug was originally detected on v6.13-rc1 using an experimental
> static analysis tool we are developing, and we have verified that the
> issue persists in the latest mainline kernel. The tool is based on the
> LLVM framework and is specifically designed to detect memory management
> issues. It is currently under active development and not yet publicly
> available.
> 
> We performed build testing on x86_64 with allyesconfig. Since triggering
> this error path in atomisp requires specific Intel Atom ISP hardware and
> firmware, we were unable to perform runtime testing and instead verified
> the fix according to the code logic.

> Fixes: 85b606e02ad7 ("media: atomisp: get rid of a bunch of other wrappers")
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>

I haven't suggested this patch. I only provided a hint on a better
implementation, so there are no grounds to have this tag to be here.

Replace that with

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
as current version LGTM.

-- 
With Best Regards,
Andy Shevchenko



