Return-Path: <linux-media+bounces-53462-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KiCEygXoGlifgQAu9opvQ
	(envelope-from <linux-media+bounces-53462-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:49:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D68831A3BB2
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:49:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 408C9301A783
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 09:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50D42313E32;
	Thu, 26 Feb 2026 09:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KZ+Q4uvT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87D6309EF2
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 09:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772099362; cv=none; b=FiWGfLCsaprlZ+IQjmQqf43fBr0KQfAXNbrQoApCbolwjbOahcZ8EbTv0PK2V+9H12HHKZW2AkzV2CVkDgb+zBsLbZAPM/HkuUzd+Z+r6Yp/e0lYQCyBf/RwVqUvuVSBqQUFmjYNO9+y1gZ7wveDj+5zn6WtL9RhdqoVE+r4AGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772099362; c=relaxed/simple;
	bh=5LxrDUiTWb3lYbAjHa2TP4M+9YeZUu3TK1A/DINGCq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jnzn5b55VSufXksG5nHDurZBPIIKxJW65PwreolfR49auTHsLHeyR3wqk5r9EEYQ02Y2ypYHgaWv5pJA/9uHGagYOyG41TjEUGWnRGqSL4E+eMamIp4+Cyw78PVsjWvh5eCEFlAzEBCFOGDPRbI3HWgdelQLEx4y6FYA2hLrikI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KZ+Q4uvT; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772099361; x=1803635361;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5LxrDUiTWb3lYbAjHa2TP4M+9YeZUu3TK1A/DINGCq8=;
  b=KZ+Q4uvTFY5jFeU4bvG2UKBtaGxiuCCKHc9+jS6WrxozdS+s4NOqTnu2
   F4v1RI29qWwwuEDmKZKUEEx2gNHV1TE2gU84YMxokx8lTzmcL1/8DuZMp
   67k46nnx0IbOl3fEcBYl5k4Y1guwHZo+bl8aNgHQK8+RFSBZhjzJ18i7Y
   ZjfM5gwn2r9vRk6OxpAESnMsnKI+ErqAhhJkwkxKZeL4et/xoJuz21y63
   vbyZUusVyCUZ6mYbZskUQh2itDhH/vnQZTITYWHevotNf9PQ/5xQm9Gka
   Vim//VPkPf47bu6MN4YAq0g9UMb8NppxaKSKeS5EbnHm+rQemX8M8XpGw
   A==;
X-CSE-ConnectionGUID: e6JCNo8tST2PDAtQ64XvBA==
X-CSE-MsgGUID: tzqH1JLaSaauhBAWzPLTPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="84511840"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="84511840"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 01:49:20 -0800
X-CSE-ConnectionGUID: tEu3kINASW23OkahsFhwCA==
X-CSE-MsgGUID: OFPDT3otQuCI8BgGHcxehg==
X-ExtLoop1: 1
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.244.167])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 01:49:18 -0800
Date: Thu, 26 Feb 2026 11:49:15 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: tomasz.unger@yahoo.pl
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] staging: media: atomisp: replace sprintf() with
 strscpy()
Message-ID: <aaAXG3KCmKufRgBB@smile.fi.intel.com>
References: <20260226085510.65038-1-tomasz.unger.ref@yahoo.pl>
 <20260226085510.65038-1-tomasz.unger@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226085510.65038-1-tomasz.unger@yahoo.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53462-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[yahoo.pl];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smile.fi.intel.com:mid,intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D68831A3BB2
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 09:55:10AM +0100, tomasz.unger@yahoo.pl wrote:

> Auditing calls to sprintf(). This code is fine because we are
> copying 9 characters into a 52 character buffer. But it would
> be cleaner to use strscpy() instead.

Not only cleaner, the strscpy() 2-argument version has an additional check for
dst to be an array.

Is it the only place in the whole driver like this?

-- 
With Best Regards,
Andy Shevchenko



