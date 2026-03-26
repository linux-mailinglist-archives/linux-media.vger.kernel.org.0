Return-Path: <linux-media+bounces-57140-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLaXMFISxWkI6AQAu9opvQ
	(envelope-from <linux-media+bounces-57140-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 12:02:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1942A333F60
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 12:02:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60B5231A8838
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 10:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A4C43E6DD9;
	Thu, 26 Mar 2026 10:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UGbWLMrH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3FD3F0A8E;
	Thu, 26 Mar 2026 10:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774522122; cv=none; b=YpBqwotjfRgUgWXHJkYl7oYgghF8CeQDZBO5r1tJm7cehNJP1OEz6M4/eioo98ArlDa8ZHnQD3T1b1TMsyL5fzVzPslm6RSgoTsrMa00vgPcgtFlOkmqVdXKI349ccGtxZZtKwX/0tz3rsyMpknrXw5Gb+X7pXmaCb9N8+7pShs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774522122; c=relaxed/simple;
	bh=boew1voR+RqWMQHqDlRsgrsLVOMNSPD7NOVr/aN+gc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kFrJrkS7i2NaP/kZ6DJEJR6SNROp1vQCC2C+AJfuEmUi4Zztif5wjKwgM0TMWfggT+O7iaWX/YwHfsQqEb4pGIpOLX1OIhKE03s1ADBEWJ/IouNpqTXArbBTZRJmXALwj8szdmOLDuFVsiE3n0UPGSqQ8LM0+P428P3x8owrEXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UGbWLMrH; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774522120; x=1806058120;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=boew1voR+RqWMQHqDlRsgrsLVOMNSPD7NOVr/aN+gc0=;
  b=UGbWLMrHsyPVFRouxR1l+u0AdXis/38AYykGo+p1W/l/jkXtR+NyEQM+
   mkgW57dzozHHx5uZjM4d9W4INbfYssLtIbRZYZ71uU4bsuekXkM52ME8q
   N9ZGMlmuXgLBf50/psjnsRB1i7YrkT2BdH9tpkiyM2tibgeg656DNI1DA
   J/tUsnb/3bYoZWSbKCAEMS72z6EVy0a3xUQEXxw/hUp3Qh1zvkebJn3YT
   LmV4Ls+TpGJYeIvdisgJwmHYpdTBOevTOz6vwhDJenWYb+iR1cQkpsz7m
   peTL5FrUIzkXNL8W9PdLRc3LiuYqmxf0SVBFG8UJajjRaqqf1DQssO+lH
   g==;
X-CSE-ConnectionGUID: gw57gAKwQWaThXHGkmr40g==
X-CSE-MsgGUID: SQc6xm84TP26LE7jOAJToQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="74757874"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="74757874"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 03:48:39 -0700
X-CSE-ConnectionGUID: UjqT+Ni/QdayjTDTrIpQPQ==
X-CSE-MsgGUID: zG5nmWpQTuqbysC++8PH6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="225227272"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.216])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 03:48:37 -0700
Date: Thu, 26 Mar 2026 12:48:34 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Anushka Badhe <anushkabadhe@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, hansg@kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Re: [PATCH v4] staging: media: atomisp: pci: fix split GP_TIMER_BASE
 declaration
Message-ID: <acUPAphWdppMoFBw@ashevche-desk.local>
References: <acPQOplQWD_-saf9@ashevche-desk.local>
 <20260325132434.55775-1-anushkabadhe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325132434.55775-1-anushkabadhe@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-57140-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Queue-Id: 1942A333F60
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 06:54:34PM +0530, Anushka Badhe wrote:
> Merge declaration of const GP_TIMER_BASE split across 2 lines to improve
> readability.

Nice, but this constant is only used in one file, id est gp_timer.c.
Just move it there with the (fixed style of the) comment to there
and drop the mentioning in the rest of the files. With this being done,
the patch gains real value.

-- 
With Best Regards,
Andy Shevchenko



