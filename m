Return-Path: <linux-media+bounces-55214-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLeVCtBKsGnFhgIAu9opvQ
	(envelope-from <linux-media+bounces-55214-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 17:46:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D1925508A
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 17:46:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6CB4C3055264
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 15:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B377539C00F;
	Tue, 10 Mar 2026 15:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZmYEkzIX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34A4391E5A;
	Tue, 10 Mar 2026 15:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773157472; cv=none; b=gu04s7Vjbx93Kw85WJam5dSTND8sDc4L5Lc8BAgwhyyZyuRlqQHBor0ERhmOMU6njqlpld4YW48TkHhg4MlQrklI8YkollUUm23SKqFM5Mgn3SPPZbtjSeeX0YZEEn3ZBrfxpJUArWJ7rCslBmsobm7t6cRwdQetez9wQ1Hlf1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773157472; c=relaxed/simple;
	bh=fR6x3Jw6FjOJ69pnz8RYPYNmGxc12+rT+/SFgXMzG9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnGW1aVxh4SO1CX9q48H9msqW4HkJ437msiZHaAjlAHI8gHyCn6xkmYpKejXCMss2A1EBT9OG/ypjZ0hel/iDzVjwP0MSozWl47nImUbnHhof/3iyR8NT7pm89DLfdUlVB2hwNG6CsPfcipOwFGFYnRjDc82xOcg/mr55uCht70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZmYEkzIX; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773157470; x=1804693470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fR6x3Jw6FjOJ69pnz8RYPYNmGxc12+rT+/SFgXMzG9U=;
  b=ZmYEkzIXQQ0q7qOgQFzrkENSEzZiJblje44+nTpCn6SJvbT0GvleKOuE
   PV0Da8KNAnV6EsUTLfxJ5POdWNnZilE4TKyvPuqEQUNkkNGAJ09i1wwSs
   8JGdVh6vYfXhNmdIuLrAQVrXtj6xghDllUKTsjgQjk13NWWj2h8qVAZLi
   s8vBQ1hCi/s3t5mmmYi5slJU8um0YpqzU+W5/hrOMXRLxqzQSb36y1EHX
   OpNrzQ61z5NE7R2MJ1w6kX9I7p4ryfvE/Z6Ap3NRG12RO5Qhyz8BurpQZ
   e4fUgIkolj8fqetZQo63BreICIS9CRGdi2WKtAd9F9PnnVK6K+1fsMWLt
   w==;
X-CSE-ConnectionGUID: v+Pwu+mFQCScAmI/gAOwKg==
X-CSE-MsgGUID: tB/kt5sBT4y4m+yNoY5+XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="91780773"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="91780773"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 08:44:30 -0700
X-CSE-ConnectionGUID: MDgz3mAUSfyQ/XtEzcEPNg==
X-CSE-MsgGUID: 4tCIacWQSbiF4PQC92NBZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="224341810"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.54])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 08:44:27 -0700
Date: Tue, 10 Mar 2026 17:44:25 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: atomisp: fix block comment style in
 circbuf.c
Message-ID: <abA8WebNosKYwvj-@ashevche-desk.local>
References: <20260309213024.5733-1-rayfraytech@gmail.com>
 <20260310151620.905-1-rayfraytech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310151620.905-1-rayfraytech@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 20D1925508A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-55214-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ashevche-desk.local:mid,intel.com:dkim]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 04:16:20PM +0100, Oskar Ray-Frayssinet wrote:
> Fix block comment formatting to comply with kernel coding style:
> - Add leading '*' on continuation lines
> - Move trailing '*/' to a separate line

You fixed something new I haven't asked for in v1 and you missed completely my
point in v1 review.

Try again.

-- 
With Best Regards,
Andy Shevchenko



