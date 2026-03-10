Return-Path: <linux-media+bounces-55276-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELtSCt+fsGkwlQIAu9opvQ
	(envelope-from <linux-media+bounces-55276-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 23:49:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C9ACD259124
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 23:49:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1CF53188FD3
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C42D3BED1D;
	Tue, 10 Mar 2026 22:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TlPgEndH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A86F215F6B;
	Tue, 10 Mar 2026 22:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773182932; cv=none; b=XLF3iZyM2+SU190eLYp2GRuBhL26x+VwDGDAMq9O6ctrijulk+v1FnAjeNhri+OiS4XzgJd1PXyXR0FP1hUYUls+i35U9tpq7R4tgUPyyspSnYHEaB3OU0PsccYEKW9IjuwLBbFN/KHYJ3iK+Daa7E+RUJjfRaJv0kNtsFxx5r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773182932; c=relaxed/simple;
	bh=ZuzveDGPZnQkr48Tk949S4ONvwNNBmG1BcdLoq8/Ng4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iDmmf0el9ezHy/CTTSUuHIVsfxm56zGyeDXSbs6V0X5qt1xCL3kxKHHpJiUJTnGncvnnRFRe+Lk8VpEr656cNfy2rnZEwYIIgWqlyptGf2NQFloZubKsOvH2c83Yz/GKlJLAhRWfQGI/EvoqPJAtkwGpeSIv6fPFyfXRxKJKP5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TlPgEndH; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773182930; x=1804718930;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZuzveDGPZnQkr48Tk949S4ONvwNNBmG1BcdLoq8/Ng4=;
  b=TlPgEndHIo3Ngxd0Rw5RlFHywEHudeNv8426G06e5aH45Ew0A7lpZBtH
   c1JvWYUjNrCpGsA9IpVjvrY2FoF3zLVakSfKFXTpDfzFAju2G5D10rABc
   RednMeiZDQSH4x2tbQvwsOovOEVLP9yvEKeoyL3nJOAy2zrQHq64z0bUu
   uDCp4jFTYzEi9lVixIaxmPfcWPw7t2cO3/xKXGsyWbb7x6nsA6Fd18hBN
   yWpOzxj9Qqkij3H1P0fVhfQlBKs6714dCkTe0o/mLe6Ct4fWNFC00ydOg
   4adx02F6vp3WImT7ghr3tGdPIw4Wv1eWpZ5OydzojpvzxwqQD77NGybQa
   w==;
X-CSE-ConnectionGUID: JPunHQQ5T9mau9V9sFBirA==
X-CSE-MsgGUID: EY//ou53RWOGxb1OsaIScQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74120263"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74120263"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 15:48:50 -0700
X-CSE-ConnectionGUID: Na6XIS1FQZSgRUieJlzFNw==
X-CSE-MsgGUID: 1kA1q+GSSlq/JzCjVEN3lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="243283007"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.54])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 15:48:47 -0700
Date: Wed, 11 Mar 2026 00:48:45 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: atomisp: fix block comment style in
 refcount.c
Message-ID: <abCfzdNBb-qYJpRK@ashevche-desk.local>
References: <20260309215516.6091-1-rayfraytech@gmail.com>
 <20260310203546.8849-1-rayfraytech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310203546.8849-1-rayfraytech@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: C9ACD259124
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-55276-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ashevche-desk.local:mid,intel.com:dkim]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 09:35:46PM +0100, Oskar Ray-Frayssinet wrote:
> Fix block comment formatting to comply with kernel coding style:
> - Move text from opening '/*' line to a separate continuation line
> - Add leading '*' on continuation lines
> - Move trailing '*/' to a separate line

> - Replace commented-out code with #if 0 ... #endif blocks

This should be done in a separate patch as this is not about comments.

> Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
> ---

Where is the changelog?

-- 
With Best Regards,
Andy Shevchenko



