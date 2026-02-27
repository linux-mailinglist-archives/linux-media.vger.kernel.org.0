Return-Path: <linux-media+bounces-53802-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qG5YLJEvommQ0gQAu9opvQ
	(envelope-from <linux-media+bounces-53802-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 00:58:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED691BF445
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 00:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA84A30B65BC
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 23:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2237B315D23;
	Fri, 27 Feb 2026 23:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CwNrCM6l"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AFF2566F5;
	Fri, 27 Feb 2026 23:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772236427; cv=none; b=QS9/6yQ75U5NffJmdCPJaHD/SzfGvokFywp076vBx/QTvriehm8VB29s8yHtygDrLehfxaNHTEYNw9g5tDq3v1Khp5ACLB2OuXgcTEG9trVOFuSiPX2lPbQMH2aD70fpyadeaVYegfQGNvpvJcPNPzXo3l6h1sHJ2zwsP7eg+ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772236427; c=relaxed/simple;
	bh=gA2MKG1iTJHXz3CRORci8www8lxPSfk5IKJ1yGC+Mf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YKaZcK8kd0YzT/OZvkmXt1L7Gzj42O1liBXRB5flWjnYkh22atp1AhuUia6IcsOR3S5LlMSp/w50sig7ejUXasV0p/RjopjukI4oxhFdHf3VQBLFtiKUdCGRFGch6KVqWWVF38VeryRI1buFgF5iNkmjs3mkF48BaA19sTFeYwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CwNrCM6l; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772236424; x=1803772424;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gA2MKG1iTJHXz3CRORci8www8lxPSfk5IKJ1yGC+Mf0=;
  b=CwNrCM6lnO4Ia8o68MUh5IwvTUUKonkJss7jYOxmAXtexPvI4tUfFytc
   i22QmY9M8iT1/Ah0nHyIoWvuHkreI0KAunSoNIMsSpOFQXXs4RRa3rGeV
   Y0W2UUsjgB1olgjj8ki+20ZA5iG/nBwT+mZlPDOHOt+CpfaZ6QwrqHnY9
   3bhkmmPg9Or9QHQO7dskynPGhJKkyAj3D8ISQslVVSqWfSxXO0IcKBhLe
   gIaocO2+EA+0IIfvQHZnRQXDuL1amg56liAewoWDpp39NdaGWa00jfY0s
   pAx6gcI4m5DxN4bMAaQhUjNBtpYlh+Gli5VBPKVl/+c4fv8fg4jYO9vaP
   A==;
X-CSE-ConnectionGUID: fFFf2Al5R9W8sXD9Fcbxxg==
X-CSE-MsgGUID: NdmvFt6LRrOO1W3smHeNVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="84676073"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="84676073"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 15:53:44 -0800
X-CSE-ConnectionGUID: cMU7HguIQy6V5DhH6M82+Q==
X-CSE-MsgGUID: /TTA0KesQoSEu9A6Lwl++w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="247544482"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.205])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 15:53:42 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7183211FA45;
	Sat, 28 Feb 2026 01:54:09 +0200 (EET)
Date: Sat, 28 Feb 2026 01:54:09 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ethan Lam <ethanlxkernel@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	andy@kernel.org, hverkuil@kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: media: atomisp: fix block comment style
Message-ID: <aaIuocYuOMc-yOin@kekkonen.localdomain>
References: <20260210113557.71677-1-ethanlxkernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210113557.71677-1-ethanlxkernel@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-53802-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: 0ED691BF445
X-Rspamd-Action: no action

Hi Ethan,

On Tue, Feb 10, 2026 at 07:35:57PM +0800, Ethan Lam wrote:
> Fixed all block comment style warnings by checkpatch.pl.
> Kept original indentation in comments (requested by Andy Shevchenko)

This can still be improved.

Please see section "Describe your changes" in
Documentation/process/submitting-patches.rst . In particular:

	Describe your changes in imperative mood, e.g. "make xyzzy do
	frotz" instead of "[This patch] makes xyzzy do frotz" or "[I]
	changed xyzzy to do frotz", as if you are giving orders to the
	codebase to change its behaviour.

No need to mention original indentation is kept as it is correct.

Is atomisp_cmd.c the only file in the atomisp driver with checkpatch.pl
comment warnings?

> 
> Signed-off-by: Ethan Lam <ethanlxkernel@gmail.com>

-- 
Regards,

Sakari Ailus

