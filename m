Return-Path: <linux-media+bounces-65915-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oCUTKjRVQmrB4wkAu9opvQ
	(envelope-from <linux-media+bounces-65915-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 13:21:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1299F6D9538
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 13:21:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=f+tfWaMh;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65915-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65915-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2F709303876A
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 11:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 616D53955D0;
	Mon, 29 Jun 2026 11:16:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3A936CE10;
	Mon, 29 Jun 2026 11:16:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782731788; cv=none; b=WPSgSVvbTpA3Ndy+fznAgbtTJWt0oF0J8qIOPsVRsN7CT/0yo0MBt9OdTt/kh5b/AHzQCXmzNboh5XNUXcLuzDeeD56bfTSyryar+AzcY/Ol/MSvwD3cyWW9DnF4XRdt08bYQzmOMEvGuqB5mOTyjCHPBztAe1dyX1VvTqP7uLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782731788; c=relaxed/simple;
	bh=huqplC5tXzrHDNH78d4acpzt6EpbIyJkwstEQsjeJqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eYTLagzNua/MeDWQbzl5GleMC/lgrKsvZqNhJdPWpnRtg/gdA84zJvvJhyKwcyvTiO5ZlhJA+IBT+VwHaq4orYBeWbfx5MPYthr9OsRqRTIHcRdClOOIeyLBVB6AzGMv/cZypFA4vSm6Se6mLc0Jg3rYd31W/6ZL9QFXIwc2R3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f+tfWaMh; arc=none smtp.client-ip=192.198.163.15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782731787; x=1814267787;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=huqplC5tXzrHDNH78d4acpzt6EpbIyJkwstEQsjeJqU=;
  b=f+tfWaMh3eDUzzGGGsGsFHzr79UlIDfNCC+B+9kenNHupdDShe9ZLo6T
   osmQpwM4gWWacNRmMe5lr9/W5BUnVZWAo3cGt3ZNCAmihanSNKOM6uG6S
   tmrY4suGHUMYhA17wyh405rXcfV+Z2htBRy+0zxCo3MGLxJv6Gka+01T/
   ed1n/gaHYTtq/KqrdIgJ5Xq19r7rrS0EpnH3hX5/srOJ93UWV9YK5lcV9
   lDa5ygXlUP0KDpWRdW+hQpz1w8FfKBVnPQ9IwNirS5HqUriGtJNFj4mQO
   WT7wJijkCJN+0/+7O3WtoNLxI35XNSELUyJSlVbeNjxG3e1Fdwtis83y/
   Q==;
X-CSE-ConnectionGUID: 8aVIyv7IR/O1+LVrvnNZBA==
X-CSE-MsgGUID: wY/myde+S7i/ydI3tj7fuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="83554396"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="83554396"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 04:16:26 -0700
X-CSE-ConnectionGUID: w8E+t1XXTnySPc9VDI0rdA==
X-CSE-MsgGUID: bPf8VgK/SXmncBqwQ7MJCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="247950336"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 04:16:23 -0700
Date: Mon, 29 Jun 2026 14:16:21 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Dawei Feng <dawei.feng@seu.edu.cn>, hansg@kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com, andy@kernel.org,
	gregkh@linuxfoundation.org, azpijr@gmail.com, kees@kernel.org,
	arnd@arndb.de, pontescpedro@gmail.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	jianhao.xu@seu.edu.cn, zilin@seu.edu.cn
Subject: Re: [PATCH] media: atomisp: fix CAS scaler descriptor leaks
Message-ID: <akJUBYUpjIX0dvx7@ashevche-desk.local>
References: <20260627060151.2543613-1-dawei.feng@seu.edu.cn>
 <akItMNqgKTDBCGV0@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akItMNqgKTDBCGV0@stanley.mountain>
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
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65915-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:error27@gmail.com,m:dawei.feng@seu.edu.cn,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:azpijr@gmail.com,m:kees@kernel.org,m:arnd@arndb.de,m:pontescpedro@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-staging@lists.linux.dev,m:jianhao.xu@seu.edu.cn,m:zilin@seu.edu.cn,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[seu.edu.cn,kernel.org,linux.intel.com,linuxfoundation.org,gmail.com,arndb.de,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,intel.com:from_mime,vger.kernel.org:from_smtp,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1299F6D9538

On Mon, Jun 29, 2026 at 11:30:40AM +0300, Dan Carpenter wrote:
> On Sat, Jun 27, 2026 at 02:01:51PM +0800, Dawei Feng wrote:

...

> free_output_stage:
> 	if (need_scalar) {
> 		kfree(mycs->is_output_stage);
> 		mycs->is_output_stage = NULL;
> 	}
> free_scalar_binary:
> 	if (need_scalar) {
> 		kfree(mycs->yuv_scaler_binary);
> 		mycs->yuv_scaler_binary = NULL;
> 	}

If we go this way, double check that the checks are needed as we have kfree()
to be NULL-aware.

-- 
With Best Regards,
Andy Shevchenko



