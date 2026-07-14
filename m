Return-Path: <linux-media+bounces-67550-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Hv4SGSIDVmrUxwAAu9opvQ
	(envelope-from <linux-media+bounces-67550-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 11:36:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD30752ECA
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 11:36:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=iEB8PSVP;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67550-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67550-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0008326D470
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 09:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1291E3F413E;
	Tue, 14 Jul 2026 09:30:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F723F39FA;
	Tue, 14 Jul 2026 09:29:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784021395; cv=none; b=CSskypHKjoo5W8pmdDaipI63wK5ivO35/CMmVpOYc2elE4WWaW3cJl75lQHsbPZgHXqi0UUCoYr2c6GpM3U/Mz9ke+Ctwo9BnNpL6Lx8hpGbUEvrSPf8HKCDyOrgl+XPpzkc+fD7yC0g0eoA1kUNyxlDb3avMaccrdI1xWdRJSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784021395; c=relaxed/simple;
	bh=3tA7eaonEL2u/nkvbWwsehfpAPI9Aj9l6zIdfaCdW1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iPTVh6yDq4Volkk7XvJpNslGBnIRQmJtuJzq2ho4FOJL9S1R35Cfqo+mWhEeOgHXPIaBfSJtN8AB+V/qW2IZOpVkfOMhj8lVbLzv4XUhSuZcakmI1LAZwfAPUXm6EYWnquhVQQMJMY5Sj8I8lpAmeZJCf10QwsLsGaEJdevfHwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iEB8PSVP; arc=none smtp.client-ip=198.175.65.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784021391; x=1815557391;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3tA7eaonEL2u/nkvbWwsehfpAPI9Aj9l6zIdfaCdW1Y=;
  b=iEB8PSVPYzY3/8BXe9Zld7aKLD01sQf/pF5BY7ehcaiCTy0ZKeZahMT+
   iGjgE1kiFv9nAIdjFXhk3LUtYKzty01A8UZwXA4S0X8uLfdv9mYXdszgm
   SqJCmTqfX3R9Yt6vUQd982d9EuQ56nALVzR+fEiUndlTHtlU8GMk+0sMl
   pU5Znq7o7IAa5lLPhiVq2sd+8U2yR/N9NWTWV5xqZkd9lG2RquLyB9Lui
   VcmKgbe76M55xKofkBPMTdbLQ1yHwbSTQbZjZ0mHN2W1vvWf3cCiZeo7R
   cagKr1bsgTKr1J8Ipn4NKQ53EDQao55Jc+iNcnBBsGfXx4/QbrXGpjhJ9
   w==;
X-CSE-ConnectionGUID: 0yP8Qs8rRoi4GSlYzX7RWQ==
X-CSE-MsgGUID: GPM4rQpATa+kqfQ+vJ07qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84661000"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="84661000"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 02:29:48 -0700
X-CSE-ConnectionGUID: 1d3o9itwQreWmLNL0ySRzQ==
X-CSE-MsgGUID: AAmz5DgoQFGVN7zs5Q013Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="280231815"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.189])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 02:29:45 -0700
Date: Tue, 14 Jul 2026 12:29:43 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "A. Kalimov" <erqeon@gmail.com>
Cc: error27@gmail.com, gregkh@linuxfoundation.org, hansg@kernel.org,
	andy@kernel.org, mchehab@kernel.org, sakari.ailus@intel.com,
	linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] staging: media: atomisp: cleanups and style fixes
Message-ID: <alYBhyCJHFeFOQs_@ashevche-desk.local>
References: <20260712115925.79047-1-erqeon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712115925.79047-1-erqeon@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67550-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:erqeon@gmail.com,m:error27@gmail.com,m:gregkh@linuxfoundation.org,m:hansg@kernel.org,m:andy@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@intel.com,m:linux-staging@lists.linux.dev,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,kernel.org,intel.com,lists.linux.dev,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:from_mime,intel.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AAD30752ECA

On Sun, Jul 12, 2026 at 03:59:23PM +0400, A. Kalimov wrote:
> This series fixes a checkpatch warning regarding indentation and removes an
> unnecessary return statement in atomisp_cmd.c.
> 
> Changes in v3:
> - Added missing commit descriptions to pass Media CI checks and address Dan Carpenter's feedback.

Have you browsed the mailing list archives for the last ~6 months?
I believe there were contributions like this that were more comprehensive.
Please, double check that you update all the cases.

-- 
With Best Regards,
Andy Shevchenko



