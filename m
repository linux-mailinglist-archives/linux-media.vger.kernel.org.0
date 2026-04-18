Return-Path: <linux-media+bounces-59083-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPT6C9kA5GkmOgEAu9opvQ
	(envelope-from <linux-media+bounces-59083-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 00:08:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8702E422554
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 00:08:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91EDE30293D2
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 22:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 086F4346E7A;
	Sat, 18 Apr 2026 22:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ax1FZhY8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F44344DA4;
	Sat, 18 Apr 2026 22:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776550090; cv=none; b=gjE2pmBQmOqk13XHpzjjPAne04xbFhjkQ9zBvGAavlKf2jBq4Vb/AJ4oq8PyITTVsSNao4WKYyoylT9o2oqniynlooYNPMfyT3v7JbDDJWD/M1tY75HbAq/pdjijmcTOdSigh8wo9i5bO33CKn1PJzsqx2d3jgxNgiJLsh/0PJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776550090; c=relaxed/simple;
	bh=LHggFu5X6DQj1Y3ffsBiBSLPcKGHD+QJfDL4oUYMn1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dkUO9Ax0i1JC/9ntiJ8c50hInR3hrAvnr89/018kO29EVg5vmHnPNFmr+z0Ta6YDCpwKjSatTuWQL4c1EFULcjXsVX0ZjDTJUImejsQqQiVX/CrmmXyojOav/zI1darRTFdDIP8ufw0kfG+XGLxr8+dlEU9T4if18jJJVkBKGfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ax1FZhY8; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776550089; x=1808086089;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LHggFu5X6DQj1Y3ffsBiBSLPcKGHD+QJfDL4oUYMn1A=;
  b=Ax1FZhY8LpA0jUSqIVwWuEo4p1KoFxVylfW9o5jG2YJseerR+NvwhbJl
   wodFRz/R0SpPrO0/QiTuMIpZVZLtz9v5IFGzfy8wfiIF8XmYp8peRD7ua
   0Sg79O0H3AEKxA1pzYAOmo1G0Dp811UoH9XpJWc8iluQjj1ZiNZ7Tat3X
   p1GPWHxMm/PiD8bWXdLsJ5SeVWK4G278ShtwlntML8Fh2O8QxqT8XasFt
   YBH8c+gFY1n2KXMyY4Zu6LO3H/W07aGoP57X0HOwOtZZ+vgPXwD1fHk5C
   RVaRZS8PE6aeSXloQMTO4jpe4zk1ShOp7psoAKo7JtI6XsceJvfOLwwiq
   g==;
X-CSE-ConnectionGUID: lQpOFBa+QNSx6hdAjlDZ6A==
X-CSE-MsgGUID: aVS8koSKQRGoepjhQCcKmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77640124"
X-IronPort-AV: E=Sophos;i="6.23,187,1770624000"; 
   d="scan'208";a="77640124"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 15:08:08 -0700
X-CSE-ConnectionGUID: GMhyQXDMS9yYtrCgxN600Q==
X-CSE-MsgGUID: JfRdKs5rTxmwT4yrmLhf6A==
X-ExtLoop1: 1
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.248])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 15:08:06 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 790C812116F;
	Sun, 19 Apr 2026 01:08:02 +0300 (EEST)
Date: Sun, 19 Apr 2026 01:08:02 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Abhai Kollara <abhai@protonmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: media: atomisp: gc2235: prefer fsleep over
 msleep
Message-ID: <aeQAwiVqppOYy_5h@kekkonen.localdomain>
References: <20260318212645.2014561-1-abhai@protonmail.com>
 <20260418201755.2604188-1-abhai@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260418201755.2604188-1-abhai@protonmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-59083-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[protonmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonmail.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: 8702E422554
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Abhai,

On Sat, Apr 18, 2026 at 08:18:01PM +0000, Abhai Kollara wrote:
> The gc2235 driver uses msleep(5) during power-up. msleep() is often
> imprecise for durations under 20ms. Replace it with fsleep()
> to provide better precision.
> 
> Signed-off-by: Abhai Kollara <abhai@protonmail.com>
> ---
> v3:
>  - Use fsleep() instead of usleep_range() per Sakari Ailus's feedback.

The commit 968d8904c2f86996b0615a08ee4048bccac56758 apparently already does
this in my atomisp branch.

-- 
Kind regards,

Sakari Ailus

