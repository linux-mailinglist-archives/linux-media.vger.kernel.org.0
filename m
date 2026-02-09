Return-Path: <linux-media+bounces-52431-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKZzKR0BimluFQAAu9opvQ
	(envelope-from <linux-media+bounces-52431-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 16:45:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1B911215C
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 16:45:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2E6513036EBE
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 15:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 062FC37FF60;
	Mon,  9 Feb 2026 15:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b3deW3ZI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6FC37F119;
	Mon,  9 Feb 2026 15:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770651847; cv=none; b=BpsvJeKouW9SCsgD5cBBImnzZLyIOneZ5F448OMF5krc6k5j0T5xTU+XyVOGWn8/k/8imxGAcpo5kwhj2IvVSSjPQ1oaYpKOiN+cBDmCnMbsCWJLVbDNiIXTn9C09mNxbEveue4f/WkzEAl72BNPa3yneFSWu/BdRgXe+GqOkiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770651847; c=relaxed/simple;
	bh=OYUuRf5bsJv/v+H06ZtJEDxn4NzbZm6q5ByduQSKWDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTQcEdGjZmwLwKFLiaxnvFuTRE+jr8RdBKGuFiJtQhRZNcPSgwpnq++x3B5ymLmELA/JC8ZQPUNLL+wJ1pjVJAVynP9lCoyBRmdceDHFRLbZ43O6tO6Ui0EfmOwdkpiFpdZspz8gfLunzWiyazrgE3Ch7i5xLpHCQAWIgcEtCqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b3deW3ZI; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770651847; x=1802187847;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OYUuRf5bsJv/v+H06ZtJEDxn4NzbZm6q5ByduQSKWDg=;
  b=b3deW3ZINnwaZrFmcj3RyDhtWtQIk021oXoAnsKiP8VKy6QCDqC5dj8I
   kLpK6eVGMLPjkMmvNU5JVCzLVQIUakrxVHMkxaJS85MIvzmUmOMyXNQSI
   P5QNbEisF5pCm9OXeIb9xlgDGFBJQg9TNhrgY00/4ogJ0joVKeISQLZB3
   n1hSyudn+ZrTx2CEGfadUpzhrhrCFW5fzB8E7gnkASJwYD+ha6ZrweW0R
   dhq74qw4VajHECE4pM44lkWwGDnIgIM3d1LYgTsVdQBIo2gB8W/fzim6/
   /TEWCQJktfiwYbPcH2DpC1P8W9ZzpN0gSOm4KebpAS4vrjeHomthfx1Jx
   A==;
X-CSE-ConnectionGUID: ljo9sIHXQ1qZbF4cwYdOLQ==
X-CSE-MsgGUID: FL+AHFTCSMe+ammKOYL+5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71664355"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="71664355"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 07:44:07 -0800
X-CSE-ConnectionGUID: rFDQ90I3Qx+cRnerUmTueg==
X-CSE-MsgGUID: Z/Knezb5TFm+l50Em3YZqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="210780087"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.128])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 07:44:04 -0800
Date: Mon, 9 Feb 2026 17:44:02 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Matt Wardle <matt@mattwardle.net>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] staging: media: atomisp: Fix missing braces for
 statement blocks
Message-ID: <aYoAwhiT5kD7aJ86@smile.fi.intel.com>
References: <20260209142820.650334-1-matt@mattwardle.net>
 <20260209142820.650334-4-matt@mattwardle.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209142820.650334-4-matt@mattwardle.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52431-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,smile.fi.intel.com:mid,checkpatch.pl:url]
X-Rspamd-Queue-Id: 1F1B911215C
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 02:29:28PM +0000, Matt Wardle wrote:
> Fix checkpatch.pl checks:
> 
> CHECK: Unbalanced braces around else statement
> CHECK: braces {} should be used on all arms of this statement
> CHECK: Blank lines aren't necessary before a close brace '}'

OK, but I think this one can wait. This most likely doesn't affect readability
in any better way (so, w/o this patch it's not worse than after).

-- 
With Best Regards,
Andy Shevchenko



