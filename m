Return-Path: <linux-media+bounces-58286-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBfNE0S41mlxHggAu9opvQ
	(envelope-from <linux-media+bounces-58286-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 22:19:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2413C3B30
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 22:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 95658300E687
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 20:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BF1E35E55D;
	Wed,  8 Apr 2026 20:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HuXYieS7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA7127E076
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 20:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775679515; cv=none; b=T+99DmTLC272ORCAetDg2LP2pOmvUs4xSsiCAWN0HT0qzmi2W6ytU/CJTS3idK4dA4ZxL2/NhCDpmpj9u9BeO2Mw7OUYemzRrl1jkAsq2f7nxhNPcuEMexYhoz/SmXKFQyY3oK4wWLruY/+ysm6w672rQInrOnkXXdpJfEJnx/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775679515; c=relaxed/simple;
	bh=iGMcY6cVrqtR7vc7QkTzUASYe8I5tLTEm7AYMV1oBWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VBEaOdGmKMINEJb3vu2jUTxTygviZQvx1qwSil4/c4iF/O/OX65BNm4DjRmi4Mz2fBxyjr1tNfS/UWViYk9gHYTrd7dhfB59zIA3MJ9m2g9zPwgeFKLC5qzS7zfOUw4TMTZqtE7r8nerDtF51zh//VPZfb23K4dyzbt08anw1t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HuXYieS7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775679515; x=1807215515;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iGMcY6cVrqtR7vc7QkTzUASYe8I5tLTEm7AYMV1oBWU=;
  b=HuXYieS7Ii07+zrEeuLOIzupnvzEVBvjIr3OWO4e3L2jWn8AmWrB2VI/
   jrzh5kOx/0U7W3rKlgtxbTWkWdNZGnguacrXPmpjR7ul8jR3TBiQWuAMe
   44+QV8FvHLF1cLhtVP3DbKJgadFvqulUgnC3J661LwawaYdwf8gElM8ic
   AYb2GGuXzBn0pzNLkvMMygca8/blF/+PvUXQJnjP5ejbSua7OzzKVvNFo
   vxVphq2N2lvFmpWWKTucraXExERQolf1SqmDB3BSSVIB/mUDDVp2k+eXz
   AIXJrtJ0fd2NQ4vBvBBONPyRstKcRPWexjJ/4HSPqfxxtuuflXbFXKAMp
   g==;
X-CSE-ConnectionGUID: NU4YqUmxQdyGRYnpVkf4KQ==
X-CSE-MsgGUID: KYPiHlhsR0Gbf64uvvj4yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="86963271"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="86963271"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 13:18:34 -0700
X-CSE-ConnectionGUID: 27JI42GHRe6yOXbGZhCTeQ==
X-CSE-MsgGUID: oFrOiA3sQNuP1U8F8P4+2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="228801938"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.72])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 13:18:33 -0700
Date: Wed, 8 Apr 2026 23:18:29 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Daniil Bulgar <bulgardaniil18@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: media: atomisp: pci: cleanup and refactor
 tracing functions
Message-ID: <ada4FSg3JVkbZXlf@ashevche-desk.local>
References: <20260404203547.108347-1-bulgardaniil18@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404203547.108347-1-bulgardaniil18@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58286-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 4A2413C3B30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 04, 2026 at 10:35:47PM +0200, Daniil Bulgar wrote:
> The current tracing in sh_css.c contains many ftrace-like enter/leave
> logs that clutter the code and provide little diagnostic value. These
> manual traces are redundant because the kernel's ftrace infrastructure
> (specifically function_graph) already provides entry/exit information
> automatically.
> 
> This patch removes these redundant traces and updates the remaining
> useful logs to use __func__ instead of hardcoded function names for
> better maintainability and adherence to Linux kernel coding style.

I agree in principal of dropping enter/exit cases as it's indeed repeats
ftrace, but the problem here is that the current mechanism is not ftrace,
it's custom. And now some messages need to be retrieved via different
mechanism.  This will include time synchronisation between two records.

I suggest to move everything to trace points and trace events.

Also the change doesn't improve the style for __func__. In the formatting
string there are few different styles are in use. Converting to trace
points and trace events will also target this issue (as you simply drop
it for good, trace framework has that information already).

P.S. No need to convert all at once. Just start with one family of the events
and enable them, for (hypothetical) example, accessing HW. Then extend it
little-by-little to cover other aspects and eventually kill the full _dtrace()
custom mechanism. This better to be done in the series, so we don't have
dangling old messages after the conversion.

-- 
With Best Regards,
Andy Shevchenko



