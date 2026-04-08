Return-Path: <linux-media+bounces-58280-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPRqDJ+u1mkLHQgAu9opvQ
	(envelope-from <linux-media+bounces-58280-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 21:38:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4950B3C33AE
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 21:38:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 306E8301DAE8
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 19:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C9CC379ED6;
	Wed,  8 Apr 2026 19:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RVJaX/Sb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30E03783CE;
	Wed,  8 Apr 2026 19:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775676828; cv=none; b=iU0VDL36KW6gi+P6+qhIZyhkH7oudv+tTT5RyBdpW2Y+SbkvQR1kdOsnIIktvk00Cx0gWQReekK1gVyYi16Kjtuq7kZZFI1tlxgPm5MueFhdqH2O4gP7iMUFa96Bj1/TWOLixX1rCGJ1OCuOq7f6GLXTgZqh/b3dtpeHaLRvwQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775676828; c=relaxed/simple;
	bh=J+OytgHxkzlypM3SFNNsv30OKa5VWmiakpcJ8+gGdFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jdgo+5ljLUpMsgMFrvyJ2SoWqe+tyzIrFjNsV8r8x7bht6lRT0vccNYTzV8WHhp9HBhu2fvQg86+fBjggn7KGVDo5+PgeXhXS0NE5N7AHShip+aOY6gaNsWDMGATegs4VWpehv6DnI/GdTxAvpKdvLYvLdI0hxl4g4XNkQG8gUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RVJaX/Sb; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775676826; x=1807212826;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J+OytgHxkzlypM3SFNNsv30OKa5VWmiakpcJ8+gGdFI=;
  b=RVJaX/SbhZSNsEjprzE8c+6/2XvVVWaoJXkC5fW0aaKWlxsS9gKFp/ma
   Tr5WqIXNMAhKeaqCfjTq2kT+bE5GCT0MKfdpknoSUofASgHpySii09Kzz
   fJhbNbVZbcKam1prQsrRpbRhpRdrluuAd4oBHGFdbE3FLmNDBNpG1yyeQ
   dC5eKZgyQG71+na3PINgnG3wIasftJQh84PjHrEh3cg4l7YmRiepUg3qx
   OAmUlB998p8k5WT4lrhlottPUYoAMjNBAXSkgZw6B7JAzEP490Zqa3Gsu
   U5vSMLgTOjoAc29SVC0uUWfPP1kJBnm4fm5vH7IOSS2xnfRRTNFQnZLob
   w==;
X-CSE-ConnectionGUID: x/H2NUrcRjirTWMOtE/EkQ==
X-CSE-MsgGUID: NWJD6DFpQsKdQAYVCW7uAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="80266170"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="80266170"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 12:33:45 -0700
X-CSE-ConnectionGUID: EmvP+eINTb+Q4m1aUzXzqA==
X-CSE-MsgGUID: Tv8/XlYXTtW1LngWbSgmiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="233444262"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.124])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 12:33:43 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DB11612112E;
	Wed, 08 Apr 2026 22:33:57 +0300 (EEST)
Date: Wed, 8 Apr 2026 22:33:57 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Marco Nenciarini <mnencia@kcore.it>
Cc: linux-media@vger.kernel.org, bingbu.cao@intel.com,
	tian.shu.qiu@intel.com, mchehab@kernel.org,
	andriy.shevchenko@linux.intel.com, stable@vger.kernel.org
Subject: Re: [PATCH v3] media: intel/ipu6: Improve DWC PHY HSFREQRANGE band
 selection for overlapping ranges
Message-ID: <adatpTA0MVtaU-eD@kekkonen.localdomain>
References: <20260401162547.1597975-1-mnencia@kcore.it>
 <adVXNx8hW4CAY3O5@spark.kcore.it>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adVXNx8hW4CAY3O5@spark.kcore.it>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58280-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 4950B3C33AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Marco,

On Tue, Apr 07, 2026 at 09:12:55PM +0200, Marco Nenciarini wrote:
> Hi Sakari,
> 
> Gentle ping on this. v3 addresses all your feedback from v2 (u16 for
> best, dropped exact default_mbps match, early break when min exceeds
> the requested rate).
> 
> Andy also had a look and had no requested changes.
> 
> Do you have any further comments, or is this good to go?

The patch looks good to me. I'll take it once we have rc1 in the media
tree.

-- 
Kind regards,

Sakari Ailus

