Return-Path: <linux-media+bounces-65998-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fuIvLkedQmq4+gkAu9opvQ
	(envelope-from <linux-media+bounces-65998-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 18:28:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 459FF6DD552
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 18:28:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=TXE6Db7q;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65998-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65998-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9CD16301B001
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 16:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01A9244D696;
	Mon, 29 Jun 2026 16:28:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5D13EF654;
	Mon, 29 Jun 2026 16:28:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782750530; cv=none; b=FQVjmPIzpqSl0g29jt1mBQy5Mx3FxvjpY5tQq5KwgET3OsOSkk9m8z+ORlfqX2utzc8t+S9XiNKmlNDZNjX017YOUmzu8GjYgaxjbJpTcjxqZ7OH5kaXnKlr3X1e+OCtQpQ2XDMOnN9cKFuU9c08GMWYf0A+o4iDejFrH+rryg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782750530; c=relaxed/simple;
	bh=se7b240/rX82vU7s+UUPnwEkWL41iVnQ0fYlTD5vz9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hYJxFr86XmbNSxekQEzk80oPExYrdYW43MLSud/LJ+rKbdqkTvlGoRdwpo91FSYSTGgJhkNOhCpjeoC0OuY983OzFddlIriCUWk0ihCiEKBgLXZoFHBa3yMN//0HYJH9MrZx36gP+GNzNjH3Qrdant4v3IGLRwSM4uJVmiUoPag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TXE6Db7q; arc=none smtp.client-ip=192.198.163.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782750529; x=1814286529;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=se7b240/rX82vU7s+UUPnwEkWL41iVnQ0fYlTD5vz9w=;
  b=TXE6Db7qnIYhFH1ywj+GFMtSvAnY5QEvooLPP91xRmgNsa1Z9AuUbGm4
   gJAtexGmx/WvQldlevjCytNUK4zFtDQo9YknKdVu2haColz2vU8WtMnFd
   Pe1zaWFuAyImBNz/oQ26shujRwb9AuJRvilM3PbOabGdVsy8LDY7Xwl4M
   y14pJexh6TVS38Mk84otAjarYuGSFIXegGgF839DASqyV8UyyTZe7ZolP
   fyo6wGgvYHz2yjZRzUMnPiXPirgMysDuXQW09b1qyXX+q9Vw11b5FKv+j
   snzusdCPB7Z0HQ5iYhyzzrNI4ne/SwRolzZs/qO/rLp4UJrKeLJ3grG/p
   Q==;
X-CSE-ConnectionGUID: f9AnAUVvQECaP41FXOy43g==
X-CSE-MsgGUID: 3LMs7Ks4RxCVeB4JDkgGaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="94037640"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="94037640"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 09:28:49 -0700
X-CSE-ConnectionGUID: et20Ry6tR06RWRS2D84Llw==
X-CSE-MsgGUID: JXmhXpULQlStyhZjW0hpiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="276274022"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 09:28:46 -0700
Date: Mon, 29 Jun 2026 19:28:44 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Doruk Tan Ozturk <doruk@0sec.ai>
Cc: hansg@kernel.org, andy@kernel.org, mchehab@kernel.org,
	gregkh@linuxfoundation.org, error27@gmail.com,
	sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] media: atomisp: validate user-supplied buffer
 sizes in two ioctl paths
Message-ID: <akKdPGsvsMRqE1Hy@ashevche-desk.local>
References: <20260627100119.97650-1-doruk@0sec.ai>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260627100119.97650-1-doruk@0sec.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65998-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:doruk@0sec.ai,m:hansg@kernel.org,m:andy@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:error27@gmail.com,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,gmail.com,linux.intel.com,vger.kernel.org,lists.linux.dev];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:from_mime,ashevche-desk.local:mid,0sec.ai:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 459FF6DD552

On Sat, Jun 27, 2026 at 12:01:17PM +0200, Doruk Tan Ozturk wrote:
> Two ioctl paths in the Intel AtomISP staging driver share the same
> defect class: one user-controlled field sizes the destination buffer
> while a separate user-controlled field sizes the copy/store, with no
> cross-validation between them, so the store can overflow the allocation
> with attacker-controlled length (and contents).
> 
> Patch 1 (framebuffer-to-CSS, FPN / S_ISP_FPN_TABLE path) bounds
> arg->fmt.sizeimage to the frame allocated from width/height/format.
> 
> Patch 2 (S_DIS_VECTOR DVS 6-axis config) bounds the user-supplied
> width/height dimensions to the stream-grid-sized destination config in
> both the ISP2401 and ISP2400 branches.

> Reachability caveat: both paths are private ioctls, and private ioctls
> are currently disabled by 2b7eb2c5dc72 ("staging: media: atomisp:
> Disallow all private IOCTLs") -- atomisp_vidioc_default() returns
> -EINVAL for any non-zero cmd before the dispatch switch -- so neither is
> reachable from userspace today. These are hardening of the
> disabled-but-revivable private-ioctl paths rather than a live overflow.

This makes these patches low priority. Why do we need to spend time on them
at all? Nobody knows right now how the revival of the mentioned private IOCTLs
will look like. I'm pretty sure it will be some generic ones that this code
should morph to. Since it looks like your tool is useful, can you check the
rest and reachable parts of the driver first?

> Both were found by 0sec's autonomous vulnerability analysis
> (https://0sec.ai) via static analysis; neither is runtime-reproduced
> (Intel Baytrail/Cherrytrail ISP hardware required).

-- 
With Best Regards,
Andy Shevchenko



