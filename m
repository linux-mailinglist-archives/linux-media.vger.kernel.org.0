Return-Path: <linux-media+bounces-59500-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CN9UN8Mt62mBJgAAu9opvQ
	(envelope-from <linux-media+bounces-59500-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 10:45:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D871045BAD5
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 10:45:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E59E73004D34
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 08:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 797E23502A6;
	Fri, 24 Apr 2026 08:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JQi6NB6K"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE514C6C;
	Fri, 24 Apr 2026 08:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777020344; cv=none; b=Yr6J8LqTNqPLI5ST+IIkazrIqw/hOlhWV6NbNhBKLfMB9zI5V2RqgMM5v41yvrnNyN8A+xqwh2yAsGyDg4k+IxLgsH/gjWPasTV4xu1mIOmZUwcNzOF+m+3ZSpLruQpLmeYvGefqxXeJJTvOhubyWCdnVN00OholduPrrCtUpkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777020344; c=relaxed/simple;
	bh=RNZU9MA+u1uvVesQ15c807rfA2R4AIWzmvk+3wGWmMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Av/BIU7xs+9+I8qDieyuRghvVwhqsZN0lZhoAZpX0xgrp1GNsnV5Ge7+kQnflIds/7cNm+WVqnPOaznEGXgDCwHtkiumZs3dD0La9dgSRFaYNAtpKB2xtwMRxG/2ySuzRCp7yJghwtfo1kvof8foHqlwgPXoIbcI4pWnZloLNZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JQi6NB6K; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777020344; x=1808556344;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RNZU9MA+u1uvVesQ15c807rfA2R4AIWzmvk+3wGWmMc=;
  b=JQi6NB6KjGfWndKDsOMUuR7GveceoHvpyWyvYBct8imFstWNf4q7Kq8/
   sGRTiiGd6rMCIuIu2UbGo1worTqJa5STkPOQS1qOoNWWVQtW/hNnzfX3K
   dQAeReBWc+70TY9cDPAF1YPnMMUDLRt/nq5ea4FCVpJryQR+SDDotSGlv
   GCHOwLQD6jNO/KbRCTYcMUAD/P1NdPDNCQnlzDSZBt3W87lRXL1zXrWnB
   /EsBhcgqUNJpFaqnhCLDxx41Wi+5xGPRJacCW39GudR/nMNoleEx0ZH6u
   aOy//l1eLNf+P0alMJMlQNHSSyqv10nuRShj5G65RlYdM1CB8V31hq+Vh
   w==;
X-CSE-ConnectionGUID: tM8Gh7XiSLC5fohx35yl1w==
X-CSE-MsgGUID: XsZyKVKOT/ShlizX5TA7ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="81603986"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="81603986"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 01:45:44 -0700
X-CSE-ConnectionGUID: f+gnyYU7TaSWgSMxlPgOtQ==
X-CSE-MsgGUID: mHqIs8VWRu2L9XD94sby/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="256417140"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.71])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 01:45:40 -0700
Date: Fri, 24 Apr 2026 11:45:38 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mylena Angelica <mylena.asf@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com
Subject: Re: [PATCH] media: atomisp: pci: hive_isp_css_common: host: vmem:
 fix line ending with '('
Message-ID: <aestsiuGrr6-AEws@ashevche-desk.local>
References: <20260424010008.325784-1-mylena.asf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424010008.325784-1-mylena.asf@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: D871045BAD5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59500-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ashevche-desk.local:mid]

On Thu, Apr 23, 2026 at 10:00:08PM -0300, Mylena Angelica wrote:

...

> Hello!! This is is my first patch,I appreciate any feedback, thanks!

Please, start reviewing others' patches for the same driver and read other
reviews and learn from them first.

I'm not going to repeat what I said already several times on a patches like
this over the very same driver (atomisp).

-- 
With Best Regards,
Andy Shevchenko



