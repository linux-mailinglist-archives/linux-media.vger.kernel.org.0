Return-Path: <linux-media+bounces-60015-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKUcLfJQ8mlGpgEAu9opvQ
	(envelope-from <linux-media+bounces-60015-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 20:41:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D5E499409
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 20:41:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C60E430E82E3
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 18:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D553441C2F4;
	Wed, 29 Apr 2026 18:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bxXpW4gr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3062EFDA4;
	Wed, 29 Apr 2026 18:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777487857; cv=none; b=VFhwpULYHhF5ZzI8t23ER+QyA/Uy0G6IVupdEMZmWMQ9KfpBOz28R+KviBB1QEY8y9aJUWNxTKqHymsKlLpaodtmybGV5YeoDcS4I1za3sWRdWQ1E2O/WZmQFJ1rrSoIj4mkZPZ0f1BSNL/df5AkijHk/D7VZOfA/AdMG9uOqjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777487857; c=relaxed/simple;
	bh=fdqydFr6UgwZlUmyu9L7iYW2nMDkUiabLOY4TYmgGAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PizEMZn8k9SpVhJ5UMjkSltoQRqqHsg779zkT1MNmjmVtBg8o36pqyljH+KnUhqUJashFvSZlzvJ0AICEEmx3mOtGskBOnXc6d+/7YGaNfor24JaGPfXNF9SuNEOkeAHMgzWILT1xRYoMUxmEnNLc2gS091+yAoz4m0Yjw0E32E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bxXpW4gr; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777487856; x=1809023856;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fdqydFr6UgwZlUmyu9L7iYW2nMDkUiabLOY4TYmgGAI=;
  b=bxXpW4grkORA2bNiIrAMIPbHMaY+Yj0QEskQgf9xJewi4bofLkJd4YQD
   LCwtntMXfo/RcMmi4n/SkFvP5qyynM11SMEeq9PLhL+B9ZZ2uW74SM/gj
   24zHoIk0t8xzA1r00fwkQmdpjcK93rP2OilyHHcMp1BPFpQ6RFTdQ2QKU
   aCdKIxqFZhC8bY0G16f/59AZP16j8Y9K/zlYeE7Xrp4JaI0wnmWPugC1v
   OsUDvs5ncz6lOEGh4SuvCkV5YdEVpLPUKuH4O/xdt/9COpO2xQnyD06mv
   WPpAeNltWJ9oY3TwVPHR1J/sAH64/uWKKXBllwWt8cCl8P3lez9nmjmJD
   g==;
X-CSE-ConnectionGUID: R89z6Ts7Si25fpuDV2P2zw==
X-CSE-MsgGUID: qKzMIHOaSYOzmnxutOz6Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="95992199"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="95992199"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 11:37:36 -0700
X-CSE-ConnectionGUID: kf3AeNhRSs6SkjgsP8Pb+g==
X-CSE-MsgGUID: zs8heGNrSIeKK5EAoNSGlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="231208079"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.141])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 11:37:33 -0700
Date: Wed, 29 Apr 2026 21:37:31 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, andy@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: sh_css_mmu: fix typo in sh_css_mmu.c
Message-ID: <afJP6wT3CvIfob5g@ashevche-desk.local>
References: <20260429175509.6306-1-mahamaryamjavaid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429175509.6306-1-mahamaryamjavaid@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 16D5E499409
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-60015-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ashevche-desk.local:mid,intel.com:dkim]

On Wed, Apr 29, 2026 at 01:55:09PM -0400, Maha Maryam Javaid wrote:
> Fix spelling mistake: Suppres -> Suppress

NAK.
Already explained why in the similar patches.

-- 
With Best Regards,
Andy Shevchenko



