Return-Path: <linux-media+bounces-54942-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGRxH4KwrmkSHwIAu9opvQ
	(envelope-from <linux-media+bounces-54942-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 12:35:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E9560237FE6
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 12:35:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F30D303F7DD
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 11:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 794CC39E192;
	Mon,  9 Mar 2026 11:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JXy+Cj/e"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F2E21FF23;
	Mon,  9 Mar 2026 11:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773056113; cv=none; b=tYBG8TNW1wBH4z8vDOHscICm3Jl7XuYkFYDvO9sX34AP3Gz1CpHNVoj4Dhn8w7duXRjJwKmg2PbXRV6+JIr8Gc51LlSmenK6Z2cG8PTkMl7qAwu+c8Qk3TFMUrM/+g4/M8nfoHuwFeI3KaEZsJ/cHApUUTttsKO4XDHK5fhRUo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773056113; c=relaxed/simple;
	bh=20BDI8MNZYGlUkJKadNeJI+OFMFKni2X0fAf1vQP6lw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ub9Kv2F/8FNK07g2ad1uyJoUmSCR1QV91L6eC5G/LANtLAK+4IBoQFg8juOtDnaxhHJwhv1ebQzgkl1XRw47QBnDeSlqy/2R9eMoLLKDiDh9Vp9g7wgWPkKyNp2+b1PO2JARdPCRp0WpuAqSALfVbrhQgJvUyvGhXgXhFV+Fpo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JXy+Cj/e; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773056112; x=1804592112;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=20BDI8MNZYGlUkJKadNeJI+OFMFKni2X0fAf1vQP6lw=;
  b=JXy+Cj/eip/PIJ3I351jXh9S7T39Q9ubkjqBC3M54Z02N+QeIB9gRL0f
   Jgq7pB+pzU+CRcWvWfzDcHMFwx1WFv8xVAjj5RhRik983tUFqyWZ+1Xv7
   rpDXf4bDALZmzsGCL/7w1GORsjJdtfeYtbBt93j50/dM//61j4mCaqUxN
   WzlTgXDx1DfT2S6F+1eMdHA/nzVZcWwH4a61Cq8B9Ku5IjiDRysOWUMlV
   N0kpgEu7VMbcNCl7EaaMxXZy+zvHf0MD0ClGy9QmF/pEZtMbHsgM5KCi1
   TzR38PMmCqU3hL/Y+oYYd7EE9LNYNtxHD3H8eNXwG4y77GiopV/zG9iTa
   w==;
X-CSE-ConnectionGUID: 1ZqNhk/HQ++5vaiolMxSbw==
X-CSE-MsgGUID: qmt9ptrdSL6uQAXrNukeMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="85426527"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="85426527"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 04:35:12 -0700
X-CSE-ConnectionGUID: f7z9x5jASde+Tcw/n5xEkg==
X-CSE-MsgGUID: rDY0osKET5uTuidhJqtJTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="219671527"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.181])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 04:35:08 -0700
Date: Mon, 9 Mar 2026 13:35:06 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: staging: atomisp: Remove unnecessary return
 statement in void function
Message-ID: <aa6wakTzH6ZjKrBA@ashevche-desk.local>
References: <20260305-atomisp-remove-void-return-v2b-v1-1-902e534ecb48.ref@yahoo.pl>
 <20260305-atomisp-remove-void-return-v2b-v1-1-902e534ecb48@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-atomisp-remove-void-return-v2b-v1-1-902e534ecb48@yahoo.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: E9560237FE6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-54942-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[yahoo.pl];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,yahoo.pl:email,ashevche-desk.local:mid,checkpatch.pl:url]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 02:45:27PM +0100, Tomasz Unger wrote:
> Remove redundant 'return;' at the end of void function
> ia_css_dvs_statistics_get(). Void functions do not need an explicit
> return statement at the end. No other occurrences in this file.
> 
> Found with checkpatch.pl --strict.
> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
> Changes since v1:

You forgot to update the version. Use `git format-patch -v<N> ...` to get it
automatically (where <N> is version number).

-- 
With Best Regards,
Andy Shevchenko



