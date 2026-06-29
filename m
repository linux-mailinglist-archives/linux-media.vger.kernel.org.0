Return-Path: <linux-media+bounces-65983-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1dGvKXCNQmqF9gkAu9opvQ
	(envelope-from <linux-media+bounces-65983-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 17:21:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B786DC93E
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 17:21:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=jF8OeHg6;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65983-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65983-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE2FA3049510
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 15:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5513FD14D;
	Mon, 29 Jun 2026 15:12:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95A83E075F;
	Mon, 29 Jun 2026 15:12:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782745948; cv=none; b=C0uKNQeY/jDyHFRiiA45EIUral6Q99o59VRcZ3t7lp+afKly08m3Skd236/ivaxDrgfygV9vRDcY+v7We5TyuIw5gM35pamvG2OsF2bZ0B7Cr5Fx+QZPOXASavEVzROzatej54NxvNXmCsXBwy90ZDjX/ue0pXOiP5gqmEAIVzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782745948; c=relaxed/simple;
	bh=s0LduPkBHrB8/uCMsIDByziFpDHzfQMiG0Lrk+XuWzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bdLc7bdEbyjFeJr6RTJgLP4kI6d3EQL+znORIh6RkwW4YGHMqPWN2d/QURgytTvLx1PNlp4wl/jf2dE3zGaAjnrfPfgraIa/gcWKVPceSaKnn/z8mVP67xeBfdK8EXbEmZbzrE76vsGL9LsemrFKFMfQ8nv9H0TrslWw9LjR7yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jF8OeHg6; arc=none smtp.client-ip=198.175.65.16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782745945; x=1814281945;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s0LduPkBHrB8/uCMsIDByziFpDHzfQMiG0Lrk+XuWzo=;
  b=jF8OeHg6dYaG+eHcYXSMtgn+XPqcJMKy1VsC5aSlX+IWBypOgqjKOcto
   3vDdpcxDbL3wKbBYMmydHy+lA/i2raXdlyFkC0E0mWDMPgkeL39jre5xM
   IeCump6Uslo5cs10r2V+v7CfKU3IOHv7lqQ5ggP+JsWv9Vzv6/dRR9mv6
   FW6j0N3AH3yT3kdU9o+0aJHICoZQ3l65JpJncyvMZ4p6bf3LlOItD/9Ah
   3kNqOohyqP34l1VzDNwNNBTcisy0Jy6x4Er2h5BuvC5ilMoI4tGNpqhIP
   Eb0ljvzau6wVmJg3/84qE3kejPuhz3xL8xvtpMK8K/XdLjSKIKW94O5Yf
   w==;
X-CSE-ConnectionGUID: bVqqHQ/ESvS7DWvjZZYM/g==
X-CSE-MsgGUID: +XKo93P3QwOajB5cnFkcZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83637328"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="83637328"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 08:12:25 -0700
X-CSE-ConnectionGUID: YgE0NmjQS4ObXpy1kaj+Sw==
X-CSE-MsgGUID: m/CHLSzITTaCxwxWQvfSWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="255928492"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 08:12:23 -0700
Date: Mon, 29 Jun 2026 18:12:20 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/2] media: atomisp: Demote all broken kernel-doc comments
Message-ID: <akKLVFOSV9fdg6Wq@ashevche-desk.local>
References: <20260629-atomisp-kerneldoc-simple-v1-0-8ae282b85c5c@chromium.org>
 <20260629-atomisp-kerneldoc-simple-v1-1-8ae282b85c5c@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-atomisp-kerneldoc-simple-v1-1-8ae282b85c5c@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65983-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ribalda@chromium.org,m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:email,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 13B786DC93E

On Mon, Jun 29, 2026 at 11:48:28AM +0000, Ricardo Ribalda wrote:
> The atomisp code has been very heavily annotated in doxygen format.
> 
> Unfortunately, both doxygen and kernel-doc use the same mark for signify
> the beginning of a comment (/**).
> 
> As a result of this, kernel-doc gets confused when it parses atomisp and
> throws tons of warnings, which made us completely disable atomisp
> kernel-doc checks in Media-CI.
> 
> Demote all the broken comments so we can have 100% coverage.
> 
> Future patches can convert the doxygen annotations to kernel-doc if this
> is deemed useful.

I haven't checked carefully, but assuming this is just mechanical change of
/** to /* I am fine with it.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



