Return-Path: <linux-media+bounces-67387-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g4FmIMZtU2pNawMAu9opvQ
	(envelope-from <linux-media+bounces-67387-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 12:34:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C975E744635
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 12:34:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=KPFlYVY5;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67387-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67387-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B1443019F3C
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 10:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E093A4267;
	Sun, 12 Jul 2026 10:34:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63FF175A81;
	Sun, 12 Jul 2026 10:34:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783852447; cv=none; b=BbCciBx4EF1tyTLW9Jsk1mg9YFgdsAJQ/NIu8qB28FFp6ZlHPd5+XxInaAI3zUGo+AO9GkWuEdiEWsTqobP1u1OPHcOnoDa56b1gVH3lB1Ucv0Mj0VjX+QVRJvkZ3PQp7TFCf/nUSGL3r1ALcoE6rS5KuZZ8iQLAOHFM72/UehM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783852447; c=relaxed/simple;
	bh=U95siTC8M97BycXakP/Qu+qDG2O/lS1PH7kT0iVl/os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VaZBMsTb1TH5Roo0f7LYTJD4dGqaDUleJ/4zS+4ejPkL4ss9RGuKWO3qQr0jI0aqkJ4QBC6basmRZt4FvXPX8E0GGU6Pi0ud107Ii5MQYloK31PjrGEHTOnv+Up+fKpJmko1tnZmMLFZozVtNn5BtlZB8pwyifnOGJspBudEB7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KPFlYVY5; arc=none smtp.client-ip=198.175.65.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783852445; x=1815388445;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U95siTC8M97BycXakP/Qu+qDG2O/lS1PH7kT0iVl/os=;
  b=KPFlYVY5wInhOjAPkWK67ov9+B7XAhgYinDipOhn+JlXwnBmqZ6CA2BC
   pKHT00hyth6u0K1L5l4m5Q6jeZS0h377WhQNbxblJy7WnCKhU7aVYOM1o
   eAv+7tfUuEQuum/zX+xcpP7VpoA/veflX1+qRQ/UsqiO5PqAzCc8k61hz
   REePNu9Zng73rKOoVkaXa3tpY/kUkYgU/k9YPtVk5IjddglednVe6801n
   Dj1bZvfrjRA3XcnlHMfvIHLiZLCGwsT0K/6PQS2lKPj+A7GtC6KpLf1nt
   w1nViJt+3wcjyNO1FQ9ISrWRJvHx64YgghqOSs2hXyUGvvAUjDbHumdBg
   Q==;
X-CSE-ConnectionGUID: f+oWuUpcTvevWTBnIXslLA==
X-CSE-MsgGUID: Lkk3VWpASQOErtNwTbR+AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84456648"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84456648"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 03:34:04 -0700
X-CSE-ConnectionGUID: R5lhQTbbR6C5rBcQKfPjjA==
X-CSE-MsgGUID: bcVg+fbYT6ajyKI3hKJCPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="258871487"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.24])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 03:34:03 -0700
Date: Sun, 12 Jul 2026 13:34:00 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Bohdan D. Marcus" <bohdandmarcus@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: media: atomisp: clean up block comment
 formatting in headers
Message-ID: <alNtmD6nYCZoOCaA@ashevche-desk.local>
References: <20260710120254.23565-1-bohdandmarcus@gmail.com>
 <20260710120254.23565-2-bohdandmarcus@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710120254.23565-2-bohdandmarcus@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:bohdandmarcus@gmail.com,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67387-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,intel.com:dkim,vger.kernel.org:from_smtp,linux.intel.com:from_mime,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C975E744635

On Fri, Jul 10, 2026 at 03:02:53PM +0300, Bohdan D. Marcus wrote:
> Fix block comment formatting issues in several header files to comply
> with the Linux kernel coding style. Specifically:
> - Move trailing '*/' to a separate line.
> - Align '*' on subsequent lines of block comments.
> - Reformat excessively long lines and remove Doxygen-style tags.

...

>  	/* Purpose of mutex is to protect and serialize use of isp data
> -	 * structures and css API calls. */
> +	 * structures and css API calls.
> +	 */

This still has a problem with the style.

...

Have you checked patches by Ricardo Ribalda?

...

Sakari, may you apply Ricardo's first two patches at least, please?

-- 
With Best Regards,
Andy Shevchenko



