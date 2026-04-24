Return-Path: <linux-media+bounces-59502-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOq4EOkv62lfJwAAu9opvQ
	(envelope-from <linux-media+bounces-59502-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 10:55:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C863345BC2C
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 10:55:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 237403026C2B
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 08:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3BD83603D8;
	Fri, 24 Apr 2026 08:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xgc8ub41"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DCF359FAA;
	Fri, 24 Apr 2026 08:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777020867; cv=none; b=iWkYhcRsaKq9GoHE9wfuUD8QLk8cefAoUv0A9OV5vw6bvXodT8FGV3aLlEqf0lDWsA/P1sKoG8PnfnXuHQXNJJBNofwnOxGaT9l9gkfpGPX470nsYnZ0XXW7E+wHuKM3AC9ITix7cUmgejlMogzdxCksk40NdvGneZ/dSQOnzrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777020867; c=relaxed/simple;
	bh=1Qvg63gqx8J3FYmo7Q4o671furr8Ydz6DasPJFmsXls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rVs6G0uNggx2SAnObvus0wL0d3nf/rGcuu/3l3yANI8edjBCgFK3GYznW8/v2IdO5qfbrmbNIov9yYDzQNUqgKFWXGMIm+NLWiluUC5/4j5ACG+fWjkoQEloH2pXuDihKSKt2rmcKaRbRnevz8Dj+eeGG4nCgsoZmLIekYmnBQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xgc8ub41; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777020866; x=1808556866;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1Qvg63gqx8J3FYmo7Q4o671furr8Ydz6DasPJFmsXls=;
  b=Xgc8ub41fugghJToCx/3hhU8EUcHp2TwKu8rs/cTXaVWGhCuzVyZCk39
   5Ywe6TlUzIEdEpDRZy0vbZno3C6D9dpkNeR3dmP1ShKcWwUVRyjxKf28Q
   R0kj8/XFCMubzvtz/JK0QWd5woJKs/BAGoPzVe9qTmMW46CgO9eWibnhf
   xcIX8YsOQTSpqSE7dsx9HPqgvZxaQyj/ENfkfRJklwU58FG1mHMGX2Ll4
   Os3Y67Mfx1S5vN+vwwtwNoWNZ7KbzhJxRvN3e8Wojd/4rwju8K87fQvMf
   Xq0mQKLsJ+vYU+1kpPbLdyQi8eh7MvMeyOlLSxcBojntku9e9HsBVoKtt
   A==;
X-CSE-ConnectionGUID: +CGTpJYyRNqMUvI+5xosIg==
X-CSE-MsgGUID: sPOBkCQVRJaUnFbIwkFlkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="78113940"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="78113940"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 01:54:26 -0700
X-CSE-ConnectionGUID: a17V6VOdSlaNozpdPC/6oQ==
X-CSE-MsgGUID: FJDqTa0FRAGrwXD4xmGj3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="237952893"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.71])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 01:54:23 -0700
Date: Fri, 24 Apr 2026 11:54:20 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Gabriel Sanches <gabriel@gsr.dev>
Cc: linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
	sakari.ailus@linux.intel.com, mchehab@kernel.org, hansg@kernel.org,
	andy@kernel.org, ~lkcamp/patches@lists.sr.ht, koike@igalia.com
Subject: Re: [PATCH] media: atomisp: Use negation to check for NULL
Message-ID: <aesvvPPq35g2yHR0@ashevche-desk.local>
References: <20260423181443.46566-1-gabriel@gsr.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423181443.46566-1-gabriel@gsr.dev>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: C863345BC2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59502-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,ashevche-desk.local:mid]

On Thu, Apr 23, 2026 at 03:14:36PM -0300, Gabriel Sanches wrote:

...

> Hey, this is my first patch ever. I would appreciate any
> feedback. Thanks!

Please, start reviewing others' patches for the same driver and read other
reviews and learn from them first.

I'm not going to repeat what I said already several times on a patches like
this over the very same driver (atomisp).

-- 
With Best Regards,
Andy Shevchenko



