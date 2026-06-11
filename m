Return-Path: <linux-media+bounces-64539-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GmZjBCJbKmoBoAMAu9opvQ
	(envelope-from <linux-media+bounces-64539-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 08:52:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A11166F2A9
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 08:52:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=NlWRyYyY;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64539-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64539-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A6123035269
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 06:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 919E33803D3;
	Thu, 11 Jun 2026 06:52:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84ECA37B40C;
	Thu, 11 Jun 2026 06:52:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781160730; cv=none; b=SyUszZ0QDpdzgUh5D802kBFEPqhnyT5c3DS1NBPjZPWJ7/B8BdgYJerKUBnvGcm+9XPd/AAhUC1fhJ4SIbxL1rHHj1pRBE5SbZq/9xQOMAvszgHm+QyXlEFYPzOjFPiySCgko+wxBXDhAseiIc01hj83ez5VmjVtirZaXt5LOKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781160730; c=relaxed/simple;
	bh=JyJ9GPwwjL3rQcl6LEEG7sapth2wNwe26hXONOupHAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EexNR/4NirW3eailzopYmWVj9dhboOzhp10azTt6RuDjz/uz2t4Dhx2Xw6MF/3eGMwrRc+GwLgFdMcKIQM9E+lF3luASKpU8+PDIFRTmPJ3Z3xP2ppwVRHiWuxj2/o5HIm43TW3rxY1z8jM9XQgHm2aY0X64Scuzm5cOLFHvOwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NlWRyYyY; arc=none smtp.client-ip=198.175.65.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781160723; x=1812696723;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JyJ9GPwwjL3rQcl6LEEG7sapth2wNwe26hXONOupHAo=;
  b=NlWRyYyYCjp8jn8G+1YBg1fjOGsdLYzPkTotEbVpG7Iylmi3X5qTGqUa
   RTtUsSYAJ4kKIaWjqkwmyDhGVDlTep1Ct+wakg+eiRm3Qbz3f2jJ9LB79
   JTSMsnBvmb8zhF5Jtt3JBq/Ymb1R2fMeFdO2pM1HmTs2A3Pxr4XejIp6d
   kCHJeZ62xMvy7TUTCB6PAtAqUBzRHOWn8wxzvpNQARIrJysGXttAp5C53
   d+c9UeIL95QDjGfOl/eleRxHflxH1nP1Rg4kbeoT8GxAKFfHmWBWlEnxR
   YCQa0nbmHhaNC9UNb8MX361u5QccRqctFUB+1fac8b4TQfD/Edw3rK8ff
   g==;
X-CSE-ConnectionGUID: +Bh12+DURxi42VzhsnVSSg==
X-CSE-MsgGUID: TjPRmnGkRnuk02W1MD5I8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92288691"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="92288691"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 23:52:02 -0700
X-CSE-ConnectionGUID: xWFHxS9fRJ6U04Bq/mjSTw==
X-CSE-MsgGUID: h6TKCF53TXC9oiudIRneUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="245274072"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.123])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 23:52:00 -0700
Date: Thu, 11 Jun 2026 09:51:57 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mert Seftali <mertsftl@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: atomisp: gmin: Use str_on_off() helper
Message-ID: <aipbDeEFbXam1WPN@ashevche-desk.local>
References: <aipI6J4kDWESZgtA@ashevche-desk.local>
 <20260611061417.11747-1-mertsftl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611061417.11747-1-mertsftl@gmail.com>
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
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mertsftl@gmail.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-64539-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ashevche-desk.local:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A11166F2A9

On Thu, Jun 11, 2026 at 08:14:17AM +0200, Mert Seftali wrote:
> Replace the open-coded "on" : "off" ternary with the standard
> str_on_off() helper from <linux/string_choices.h>. This improves
> readability and reuses the kernel's existing string helper instead of
> duplicating the literals.
> 
> No functional change intended.

First of all, do not chain a new version to the email thread with the old one.
Second, you forgot tag from Kees. Why did you not take it?

-- 
With Best Regards,
Andy Shevchenko



