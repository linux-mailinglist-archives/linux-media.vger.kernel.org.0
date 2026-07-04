Return-Path: <linux-media+bounces-66599-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5N/WBm5ZSWpm0gAAu9opvQ
	(envelope-from <linux-media+bounces-66599-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 21:05:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6814270837D
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 21:05:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=MG2Wb5Ob;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66599-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66599-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EED293021E9D
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2026 19:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC6443769F4;
	Sat,  4 Jul 2026 19:05:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2AB372EF5;
	Sat,  4 Jul 2026 19:04:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783191901; cv=none; b=Zw+WKEzKAHY20LOB1R7V7eSGe4oeOXb8ZdwSqgCJjE5iTjeQOXY7dvb0jgmzeqRh0ujnpOwgSeEPErZtHwbii0z8qY0/xyyffRE9SV1Z0iB67pyyb9q9LPoSGKjHIeCKyu2/KYpNi5vpomL1yj87SN8fpm63Kq5WaJFbciaoVgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783191901; c=relaxed/simple;
	bh=NxgWlRo1WekT/E7VOaafBTlkXH3NCkoFD5s+Dn450f4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bBfMX23C2CP3rrxnus3yjLd8W7IPrdWEA5xT6PllkpdEd9sstzbSEzLUs5pw+F1N/99DW+4WKqO9V/iUisoJ1lzXuPTwSxhP/B76joYwi6QPG7OOqkr1XgOzC4f/gSHt2zhD3bh3QdyWnMln+C66oPY2liMkjlumAx2nlx4YSMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MG2Wb5Ob; arc=none smtp.client-ip=192.198.163.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783191899; x=1814727899;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NxgWlRo1WekT/E7VOaafBTlkXH3NCkoFD5s+Dn450f4=;
  b=MG2Wb5ObW6kogeo456/6MmkWr6DesJv7l9ZdNhexwxjrxkcXxZHP4aBh
   7WRiXrntvOpXVw4TrgyzcR2oYQ6YozbEwOL7ksYDi68UFbdGpbKH0nvMy
   iwF4TjX7FR01Xy7INIQjypP0lTUM5DKNEJrWqiAp34WNzqFIehOu5SkQg
   pNbp4dZutw6t9Rx//IP+NfMhnsOEKGe8uQUWDBZ7TzkzCtIHkYX7L+Lha
   745mYdkKtt4BT5s7Y9vju8a0TPa+oB/6VROQ0mYgj/3eZdryGOg8z11cl
   8+y9y6LiEK1GPYD3GUB9i4E+C80jGSDhu+XbDeIPqfC93/3Se/L6eTTt/
   A==;
X-CSE-ConnectionGUID: G6flq9FHQSiN1EIxzdChhg==
X-CSE-MsgGUID: i0c84W4YRnu4jnJ77S+xZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11837"; a="82995092"
X-IronPort-AV: E=Sophos;i="6.25,148,1779174000"; 
   d="scan'208";a="82995092"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 12:04:58 -0700
X-CSE-ConnectionGUID: YbbpujWFTXaPMsm8myaHnA==
X-CSE-MsgGUID: 8fNguPQPQ+29FmLrBHu6+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,148,1779174000"; 
   d="scan'208";a="257232737"
Received: from slindbla-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.246])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 12:04:55 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B146B120DF0;
	Sat, 04 Jul 2026 22:04:33 +0300 (EEST)
Date: Sat, 4 Jul 2026 22:04:33 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Arun T <arun.t@intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Miguel Vadillo <miguel.vadillo@intel.com>,
	Len Brown <lenb@kernel.org>, Mehdi Djait <mehdi.djait@intel.com>,
	linux-acpi@vger.kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] Add NVL CVS/IPU8 camera support
Message-ID: <aklZQdKb2NxkzrYe@kekkonen.localdomain>
References: <20260704171855.1462214-1-arun.t@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704171855.1462214-1-arun.t@intel.com>
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
	TAGGED_FROM(0.00)[bounces-66599-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arun.t@intel.com,m:rafael@kernel.org,m:mchehab@kernel.org,m:miguel.vadillo@intel.com,m:lenb@kernel.org,m:mehdi.djait@intel.com,m:linux-acpi@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:from_mime,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6814270837D

Hi Arun,

On Sat, Jul 04, 2026 at 10:48:51PM +0530, Arun T wrote:
> This series adds NVL CVS support to the ACPI dependency handling,
> the IPU bridge, and the CVS driver. It also adds the IPU8 PCI device
> ID needed for the CVS driver to bind on NVL camera hardware.
> 
> Changes in v2:
> - Add a cover letter for the multi-patch series.
> - Add Reviewed-by from Sakari Ailus to patch 1.

There's no need to send further versions of these patches; patches 2--4 are
already in my tree.

-- 
Regards,

Sakari Ailus

