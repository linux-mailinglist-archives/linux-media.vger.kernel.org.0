Return-Path: <linux-media+bounces-65984-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kWICDpuOQmra9gkAu9opvQ
	(envelope-from <linux-media+bounces-65984-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 17:26:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D146DCA1A
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 17:26:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=YmU09thu;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65984-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65984-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4597F301DB24
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 15:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E3CE426EAD;
	Mon, 29 Jun 2026 15:15:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9DF426691;
	Mon, 29 Jun 2026 15:15:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782746132; cv=none; b=DVYls4jbjbYQe3GLrnyHcisULInZLGDi/FCbe9TjIYpVEDpzA11aBqBdANayHGGgarfnBh8HTAgBHzlU4qhHguoyIQrijYMIL4wO9jUBtgMk82YCg6KQyFmnm6kAcUH9SROKwi+JDN/jpesMgC4KLej7PmW23IidcFuHlIScCAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782746132; c=relaxed/simple;
	bh=wdzGryGJXKi/hHuPN7L/AmS0QCPPOlS6W1rJcjiYE1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLoR/JqL4FR4H9Y4Y6zoIUFYCBSDTm/qANYb0VrprU77q8lP/VBOXSbRN+8x54xo7QfJJuM0DGDNH5N6H8X6TGD1q7O91E5ZIvfA5ETUKJGDbflZN7O3FhaWLN6KmI8ZnKrxaqo+QC0OT5qBszNCOhiKyWjuVy4ENzyvlrGsOIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YmU09thu; arc=none smtp.client-ip=198.175.65.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782746131; x=1814282131;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wdzGryGJXKi/hHuPN7L/AmS0QCPPOlS6W1rJcjiYE1s=;
  b=YmU09thu3zutn4upRj453+R5CxM/Y/AEJxC6xBKLv5ISlXrb9hSIbt2M
   jZrGUzdAf1QHPLMpMzmt0DvpSJg1hk83ok4pQu6rMbwriDlUH2X5+v/S+
   11Vzg8jqafWdNrkHBP8Lc3YV95a72sqw4WSGfl/oGdMxQmI6BgRDEzQNF
   lxYmZUM025i+fDfY8xntGOR5CuA8KWWUv9Vw1zDbOLqryW23Mw0B++vUF
   MuA0DufrA++QeDLJG4JTsSjnGLfXPmPcXlkI9yr26EOdqxKIYKRfI4Oxn
   DUux5+i3PFFugdLoHCQ8TUqAzrFWR1PWutMQcL8hbCvJgNoX57H9fDACD
   Q==;
X-CSE-ConnectionGUID: nxwKfY6mScuN+1cFj+CbkA==
X-CSE-MsgGUID: 7QSh7J9AThyaCjWRCE7Wcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="94591442"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="94591442"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 08:14:26 -0700
X-CSE-ConnectionGUID: CaeBuvTsRguVFv1TMfb2nQ==
X-CSE-MsgGUID: R72cGVW/T7KMySNl1UQU8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="282055689"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 08:14:24 -0700
Date: Mon, 29 Jun 2026 18:14:22 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/2] media: atomisp: Demote all kernel-doc comments
Message-ID: <akKLzsMmyIrSSxdl@ashevche-desk.local>
References: <20260629-atomisp-kerneldoc-simple-v1-0-8ae282b85c5c@chromium.org>
 <20260629-atomisp-kerneldoc-simple-v1-2-8ae282b85c5c@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-atomisp-kerneldoc-simple-v1-2-8ae282b85c5c@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65984-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:dkim,intel.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 28D146DCA1A

On Mon, Jun 29, 2026 at 11:48:29AM +0000, Ricardo Ribalda wrote:
> Despite the fact that kernel-doc does not emit warning for these
> comments, it is much more consistent if we keep the marker /**
> exclusively for kernel-doc.

I see valid kernel doc in many places, please reconsider touching only
controversial cases.

-- 
With Best Regards,
Andy Shevchenko



