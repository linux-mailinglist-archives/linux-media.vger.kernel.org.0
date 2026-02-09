Return-Path: <linux-media+bounces-52432-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eM4OKGcCimluFQAAu9opvQ
	(envelope-from <linux-media+bounces-52432-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 16:51:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAF51122C1
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 16:51:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F8B43030994
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 15:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2523793D9;
	Mon,  9 Feb 2026 15:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NqsSnLlo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5550136BCDC;
	Mon,  9 Feb 2026 15:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770652154; cv=none; b=cJDbPPg4r3OA/WoHz8seJ7aVk4fNdo+FPkyARZ2VVhYwVM6Vyx3jZiGJ56n5H8C4nbn4pXqv8ykAAAcus6P+wS62pWCB7OtJprY38wadfxdxnvjza3vBUSA8EEjcBufo+D3rFXgLGZioXu+vGHp1NuDyHcMBIxc8Qnv9/EFhUF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770652154; c=relaxed/simple;
	bh=hYXjN3KJWcjO6uKbsWe5mhxvLHHrtVLA5GQ7+6Yr89s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Js49QCLvxC1UuZcBbUGfMfbQ2k7qmfstSqK79qnmnaEZArGH84FSxJ9CPQFPuTGVnsCfSvlmReciSP8CSY87VIAvLAnKR/uSCLytu2n7pWgzFhqQCInhckoAbocMlzVOpvCCLlzhAuKTRBxZXmKiH55dyiyRuvW0SrSHp/5Juz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NqsSnLlo; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770652155; x=1802188155;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hYXjN3KJWcjO6uKbsWe5mhxvLHHrtVLA5GQ7+6Yr89s=;
  b=NqsSnLlowTt3PjJdUiVoxkU79jrtEO14nEKHO/i6iiKe2g9YyyUXlhzz
   RaSSSze45J4SMbprAkAUnzrs8sN1wgJ/CcS9Saf9iqnzLaTX0X1ScGy8t
   fcBDXV8Akh6pvOcGotaY2juBHaOkyOwOD6EyqbgJquWMWBvl0UsQQZBap
   0c+By3FKpewMbpnegHcIVDq0VfjjjkIwF/i/DecQksdiG0JopeRnYPT3l
   HkQeqIRZzPL8Yr4w4sCJR/wfb4pZZSG1bxNNgmIHdguya6C4AdtZcZGl6
   ddLS+QfoLim4PohOjdR1G302M8UpxHmL3XCm/D5KZzabkMijeYlQNMW4k
   Q==;
X-CSE-ConnectionGUID: 2aduIzx0RF+A7dd2Pb8RGg==
X-CSE-MsgGUID: Z+tTFSE9REWY5S8XJ37o8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="75390620"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="75390620"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 07:46:55 -0800
X-CSE-ConnectionGUID: 7PpMWq0mTtG18T6TOIV5tA==
X-CSE-MsgGUID: Z5fv/KVXQGWc8P/YoX17Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="215806226"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.128])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 07:46:51 -0800
Date: Mon, 9 Feb 2026 17:46:48 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Ethan Lam <ethanlxkernel@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	sakari.ailus@linux.intel.com, andy@kernel.org, hverkuil@kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: fix block comment style
Message-ID: <aYoBaEAp6ByO98oE@smile.fi.intel.com>
References: <20260209135714.48216-1-ethanlxkernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209135714.48216-1-ethanlxkernel@gmail.com>
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
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-52432-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,checkpatch.pl:url,smile.fi.intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 3DAF51122C1
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 09:57:14PM +0800, Ethan Lam wrote:
> Fixed block comment style warning by checkpatch.pl

Missed period.

...

Is this the only single issue of a such in the whole (100kLoCs+) driver?

-- 
With Best Regards,
Andy Shevchenko



