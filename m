Return-Path: <linux-media+bounces-52421-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIcmKpQAimluFQAAu9opvQ
	(envelope-from <linux-media+bounces-52421-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 16:43:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC9A1120B8
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 16:43:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54735304CCE3
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 15:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E84E037FF5A;
	Mon,  9 Feb 2026 15:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BN24Wr4I"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CDC3793B1;
	Mon,  9 Feb 2026 15:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770651456; cv=none; b=enXssnBdkB4r1cRFYAQ8pYmu3GaZcGRNO6JOCsoWe3ubKTyLaJyWUSHs4dITf37vBar0weHfVQstwoVVWPlV2ZgCGo8tE+U5HH0QV7/mUvf12k8fSa4zAuC41969RKvvd58dz5a9zS18H7v4Fc+i5nEwWoLtofiq+9geK8nW2hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770651456; c=relaxed/simple;
	bh=XKO+N2UVDBx9x+fO+aV8KBa20HYvwagFgQoUHqh2mnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D5ZHQ2+kcWysW0nLntdrE6EDVxjPBUVzcgAge0ErSODSlXybD25TwzWKyYITI3N/JNR7doDLx3GJojnJh7sEWoLjs4vm+K7v9o/202jo9yNNdXCW1sdto37bHw2teQRFSQNheexkVKtGKwBCuR8CRDgD1OrAil2TVohSOKtxD44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BN24Wr4I; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770651455; x=1802187455;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XKO+N2UVDBx9x+fO+aV8KBa20HYvwagFgQoUHqh2mnA=;
  b=BN24Wr4I49vMNg72Y54pc6boZttANFdfaN6ypNp4xdYdav4Wucfanhk4
   qbXSbHzT9J/up08DSwy8mVeMwIsrNI9OrZmgYn79wEfwLgWAKUMBXVjbR
   N1L+mt1Ra16SdH8IPE7l1z/Hg5TeZcBlL/kKq5f6s2gGuH6fuWpNXLlxF
   X8YjEOZrebIPUnIDC8dfOJsB5zRr1pd1Uu48sB+R9w/Ter4lY2HT8N/UH
   7G7LktULSJdlloYjULoop4bThY7fbONMkcYsI+2yKcRfex6nu8FDnPCbU
   RYC4h6mqWXMTTR2KEgxGoMT/sVP+DdIQjqtC9l+WxqYFCQaniGvhdgq2s
   Q==;
X-CSE-ConnectionGUID: QfRPcVLfS8m276cSOw29SA==
X-CSE-MsgGUID: afFLDoLlRAehRkAts157pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="70780413"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="70780413"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 07:37:35 -0800
X-CSE-ConnectionGUID: jmdvnpRBRvW8Dea9bk0/UA==
X-CSE-MsgGUID: F4zSRn05R6CxyejFabytWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="242237670"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.128])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 07:37:32 -0800
Date: Mon, 9 Feb 2026 17:37:30 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Matt Wardle <matt@mattwardle.net>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] staging: media: atomisp: Remove braces for single
 statement blocks
Message-ID: <aYn_OncdaH6DWJfI@smile.fi.intel.com>
References: <20260209142820.650334-1-matt@mattwardle.net>
 <20260209142820.650334-3-matt@mattwardle.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209142820.650334-3-matt@mattwardle.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52421-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smile.fi.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,checkpatch.pl:url]
X-Rspamd-Queue-Id: 0DC9A1120B8
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 02:29:13PM +0000, Matt Wardle wrote:
> Fix checkpatch.pl warnings:
> 
> WARNING: braces {} are not necessary for single statement blocks
> WARNING: braces {} are not necessary for any arm of this statement

This should be the patch before the first one.


-- 
With Best Regards,
Andy Shevchenko



