Return-Path: <linux-media+bounces-57966-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGWjA1p3zmk6nwYAu9opvQ
	(envelope-from <linux-media+bounces-57966-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 16:04:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F3538A2DD
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 16:04:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7BB7430102F4
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 13:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C0E13D9DA9;
	Thu,  2 Apr 2026 13:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mg6xYm9t"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B111B19F115;
	Thu,  2 Apr 2026 13:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775137813; cv=none; b=hvwu8uvdpzgYkypRVAkYC7alrQJXrtuxJYyF2B6MPR81kNEeV/mr3z4Nk8rXpt1s1QF/4KZba4QmxD0gEhzDIwip+lQ3mckDwZ8Svvnw+XpAVpSlNwYIq2XwCdbhmh/GV0pou6E5qu3YnlMia8bexyFvwiO52/pL2eax661yjBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775137813; c=relaxed/simple;
	bh=Dmndvs2MFjQ3SAIaC7g32e7CcDen/0rO3NkMInu/JRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A772FwafezVdlfCE4rqbwWkYCXPHU2jpbpsR+Le73mM1ycb8G9kdtGCOdijwpextUbf44Gg16UPX4uQDOY4jM+ow50OKOb2pIW9EaP3xWicrGCV3GUWqUQ35bHe9AdBRiERhxeE3EVzRi1hU5OKOWz4AQvMSua7FmICRHpwwkbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mg6xYm9t; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775137811; x=1806673811;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Dmndvs2MFjQ3SAIaC7g32e7CcDen/0rO3NkMInu/JRo=;
  b=mg6xYm9tuKyynAhyhMQZA0iKAt1VDERbElFZKhAB+hvTuBYZe5GxNX+G
   8XSLZdXm5WH4DYpJVG0R64Orf/gJVnRF9QRYZHn9qzFMy0M/KISGR82Bq
   tTrFdlpRDjYB7V2yw3vNKpWi4Dy47s1mK/a8XdjwzGVo5GFoWKAXch+F0
   bCltJxy8ohwEQ3iRAZ59uUm3k39beBtrtOfUzOVLkuWb5L8mYAXP9azYi
   F9RmLVs/OC+RpXUu1SXDvqbuWC0js9JKO9ij24dyW6yJUSShqdcAAvU9F
   YQtuz1z4wc7fmgQPyfTKYMwW2MM7sAEh9fJTobLHLqSBdwYpUpkbHen0o
   w==;
X-CSE-ConnectionGUID: qd9mkumBRCiiFZcM52pdiw==
X-CSE-MsgGUID: a+MQ+MvKT8qwAbXHF8J+PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="93779407"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="93779407"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:50:11 -0700
X-CSE-ConnectionGUID: m4gb3qwKShi9Vy26gS3Xsw==
X-CSE-MsgGUID: b2kTs0IFRR61XDk7VjzMSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="223707598"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.31])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:50:09 -0700
Date: Thu, 2 Apr 2026 16:50:07 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Daniil Bulgar <bulgardaniil18@gmail.com>
Cc: gregkh@linuxfoundation.org, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, andy@kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: fix indentation and spacing in
 sh_css.c
Message-ID: <ac50D2dnXceZqtV8@ashevche-desk.local>
References: <20260402133005.288643-1-bulgardaniil18@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402133005.288643-1-bulgardaniil18@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-57966-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ashevche-desk.local:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 88F3538A2DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 03:30:05PM +0200, Daniil Bulgar wrote:
> Fix several coding style errors reported by checkpatch.pl.
> Use tabs for indentation instead of spaces.
> Fix alignment of function arguments to match the opening parenthesis.
> Remove trailing whitespaces and fix blank lines.

Split to the fix per type of the issues.

...

> -/**
> +/*

Huh?!

...

Also, if you are doing that, do it on the set of files or against the entire
driver. No need to have 1000+ patches like this.

-- 
With Best Regards,
Andy Shevchenko



