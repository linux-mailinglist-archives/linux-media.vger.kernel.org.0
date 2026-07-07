Return-Path: <linux-media+bounces-66820-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lfvXLFzATGqrpAEAu9opvQ
	(envelope-from <linux-media+bounces-66820-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 11:01:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CED8719757
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 11:01:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=GJ1akSEh;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66820-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66820-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D2A383001F9F
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 09:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A0538E8BE;
	Tue,  7 Jul 2026 09:01:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14EB30BBB9;
	Tue,  7 Jul 2026 09:01:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783414865; cv=none; b=AL95Xyac8Fms96ilG9ms+gJGkn8uJ0mGZjef7DY1r6dC1zCgyo2XjUe3+nuMjt+VlR1FnEkxtCTkzRhmMiUyN8efsPPVR9nkBR3CgDC3jzP4KrSMA2y4jSw7wTTtOLvl5eioSSQHn67uYCdlxKxMlqS5etfzPMQfyjQT/OlKfgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783414865; c=relaxed/simple;
	bh=nPytIJ0z49V43dcUJjqtD4dHBw0wrx9/aoNavFQ4gr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H3SImk1b47B2GKsvOhrWfV2WRkSMjwz2ehkMMwdJq6IReqC6sTupN9trbd70QUdF12RiDkshByDKf5dAnhqlTJOWTxTa79e69gUNVlahruf6cdUIP3pRJYbCFjgL9394KPB9wxuXvVhQzHew2kNI+Hd9gP3/AT+kL2rb0W3kijY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GJ1akSEh; arc=none smtp.client-ip=192.198.163.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783414864; x=1814950864;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nPytIJ0z49V43dcUJjqtD4dHBw0wrx9/aoNavFQ4gr8=;
  b=GJ1akSEhbqvXGW6guIbqA8o+0JOfNA8GmJJlRBzCaisFplg+6QW5A0XU
   XNcnDp9SV8WKidX9OHpU0SqakLYhkeU6Bt4I4QVBYrWGI5Za27/gFuYVh
   4Yrh4RHjUiZmS0C8tFFPRKqnIJlFOwd2iKXxN2Kix/5GzdfiMFHJ1pFCu
   yElVkdQK8ik/OjZy6fAyHybJryGag+zctseko1W2Gz9PgmhnsUursEfSV
   RzRbINiu/unylljni9tmMHlbhjCylfyHOVE6Vrx4IorIGT6O1ddP/dFbH
   dWdW1YPqzHYH6y8fp21PrrU7VlcYLTt5EeXYafqRgVfemoOcmUDuyHATV
   Q==;
X-CSE-ConnectionGUID: cRGvGidfRkuyjUNb4nExhg==
X-CSE-MsgGUID: B/9C/UtXTiuESQcpOhjwrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="83928427"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="83928427"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 02:01:03 -0700
X-CSE-ConnectionGUID: +5x1GlqLR3a134x/sQOHPQ==
X-CSE-MsgGUID: 4c6bOT/sSj+Zza2MBWAR1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="284051600"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.178])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 02:01:01 -0700
Date: Tue, 7 Jul 2026 12:00:58 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Ziad Ali <zalshemy9@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	sakari.ailus@linux.intel.com, andy@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: atomisp: fix typo in atomisp_tables.h
Message-ID: <akzASmY2ztyo4x2k@ashevche-desk.local>
References: <20260707073604.11463-1-zalshemy9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707073604.11463-1-zalshemy9@gmail.com>
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
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zalshemy9@gmail.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:sakari.ailus@linux.intel.com,m:andy@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-staging@lists.linux.dev,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-66820-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:from_mime,intel.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2CED8719757

On Tue, Jul 07, 2026 at 10:36:04AM +0300, Ziad Ali wrote:

No need to dup, also read reply to your other mail.

-- 
With Best Regards,
Andy Shevchenko



