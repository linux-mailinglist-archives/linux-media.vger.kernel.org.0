Return-Path: <linux-media+bounces-65614-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9EYJNlDVPGottAgAu9opvQ
	(envelope-from <linux-media+bounces-65614-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 09:14:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C28F6C3485
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 09:14:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=XTR4vvgW;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65614-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65614-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EBC9B3043C3A
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 07:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E86133C2799;
	Thu, 25 Jun 2026 07:14:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BA91C5F13;
	Thu, 25 Jun 2026 07:14:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782371651; cv=none; b=dQm5YGcBK0/KeXbHwnZ/6lsE9R5ewglAkxtmlvFOueNOWUCDP0OnmNjIc/vN9eFmYfQVR37NywXYOKzu07MPelDQWcTur01Ob5RqF9IQ2m4aY/k9gxPU+E7T2POv6eRs9dXc8Lzb1RvkbfZ4Mttu0X+cOKyjTmrZbct+2YUPa3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782371651; c=relaxed/simple;
	bh=Tguj9rM7L+Pr1kybxB6ItHT3wFbHPbjQ1nRrVHjccX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=etAI0nXoEQkEW7afPSBnzEBmiOqpv6xnLZa0TJZw6jnWz3GqbBtFS70xb5NGsGLt/iQSvHWQ8LVdP8Y2t18w7hQgdaQlZs4lPOgMIW+YnyG1krDoDAPFnUMrZfCmx3IrHQSipx7eXsjF/VfX1B7rbvufDAXPIexxWkssLCDQ8Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XTR4vvgW; arc=none smtp.client-ip=192.198.163.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782371650; x=1813907650;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tguj9rM7L+Pr1kybxB6ItHT3wFbHPbjQ1nRrVHjccX0=;
  b=XTR4vvgWBnlUzu4jMnpa09iAqaBJMphjwJp3qQC4KxHqHWtcQ4Wr7PC6
   ubOk/mjnnRUN7fT7CUYP7ntYHtWNzppsXUJ09+gcccgMWuwKK395OSgpa
   KQbuhnhcJMKg4mSJ0GMIAMyhIXeNv6itLCaInCzMhjzM/2INFIoIUslPJ
   mOgFxlYKvmw9UXk92xTNMYWeXLMshBVfN0AZZtaqNS75h7CCHznL3i+YF
   d/J3laqaPDneGxcWgFBsFR1uNX5HtkdxVJ/xkYaLTGmCRQZaEg9ioIQR3
   rrZE1rjCiLlYlh+/kkrraP3QLsuk6v04af9nU54j8TLoFp/asPs9ZEEVv
   Q==;
X-CSE-ConnectionGUID: 7tsJw+lFTjWvtdoJhqgu0w==
X-CSE-MsgGUID: /bicr6O8RgSn6GoSUsRKyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="82127747"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="82127747"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 00:14:10 -0700
X-CSE-ConnectionGUID: hNasxWafSTOy4fs6HUaMwA==
X-CSE-MsgGUID: AtoV4Dk+RVOBM+88SJmmTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="247303780"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 00:14:06 -0700
Date: Thu, 25 Jun 2026 10:14:04 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	feng@innora.ai, ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 2/3] staging: media: atomisp: use kvmalloc_objs() for
 overflow-safe allocation
Message-ID: <ajzVPHie23a90TA3@ashevche-desk.local>
References: <20260623221028.40238-1-rodrigo.gobbi.7@gmail.com>
 <20260623221028.40238-3-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623221028.40238-3-rodrigo.gobbi.7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65614-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:rodrigo.gobbi.7@gmail.com,m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:feng@innora.ai,m:~lkcamp/patches@lists.sr.ht,m:linux-kernel-mentees@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:rodrigogobbi7@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C28F6C3485

On Tue, Jun 23, 2026 at 07:09:27PM -0300, Rodrigo Gobbi wrote:

> Replace open-coded width * height * sizeof() multiplications with
> kvmalloc_objs() and array_size() to prevent integer overflow in buffer
> allocations.
> 
> The atomisp driver computes DVS and statistics buffer sizes using
> unchecked arithmetic.  When dimensions are large, the product can
> silently wrap, causing kvmalloc() to allocate an undersized buffer.
> 
> kvmalloc_objs() uses size_mul() internally, which saturates to SIZE_MAX
> on overflow, so kvmalloc() returns NULL instead of succeeding with too
> few bytes.  array_size() provides the same overflow protection for the
> two-factor dimension products.
> 
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Feng Ning <feng@innora.ai>

> [rodrigo: rebased; convert only the sites left open-coded after
>    commit d178c7ca8fef]

Thanks, you can keep this on a single line

[rodrigo: rebased; convert only the sites left open-coded after commit d178c7ca8fef]

> Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>

-- 
With Best Regards,
Andy Shevchenko



