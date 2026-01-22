Return-Path: <linux-media+bounces-51350-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WENuMlomcmkVdwAAu9opvQ
	(envelope-from <linux-media+bounces-51350-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 14:30:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAAE674B0
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 14:30:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1CBC376A712
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 12:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE53E37B402;
	Thu, 22 Jan 2026 12:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BWaD91bJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C98359701
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 12:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769085384; cv=none; b=YxgPhoSO/Y/J7kWr5vJl3SedXxxoPwYmgIs4bHWQgwVDL6QmmNBq+J54vLz8S0ICfh2OFUfA/vMZVIwCs3d/nXWOMsEUB4zjRcd47uYuGU020J8vnNG6XkoZWXYnX16zzzJ4fmAfJGZIhJnjZJ5ifHq5hHAqGSt+ni2qO1M71iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769085384; c=relaxed/simple;
	bh=ryTF3WRcP24UHat034lLFn5dXog2SMwZZDZhjOrYWm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I17DyZ+jkNbjhghNdRrYHhh+AaF3vqpJug+0ekKA32iZ/XJ6Xe8TwA+d4jSwcH0Uny3Gb3gQeIu7bQF3lhIrBAcsVkP1510TAY5dG6hwya42LkL0T0xLRl0dlQD4f+tuqhPZgNP/KiUT72mw1EfPoytbuMAyVZYMOenESnEUs9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BWaD91bJ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769085383; x=1800621383;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ryTF3WRcP24UHat034lLFn5dXog2SMwZZDZhjOrYWm8=;
  b=BWaD91bJY9uKEsmU/Ru6pp0z4JcgH4Sswl9XH+qIxIIEoDGZ4U2obnkz
   tb6rIGzuOMjSQq4Wc/orjJ+0cKPP3/wxygJtEvBe9JWQH+tRWwU8Ib0fu
   GxkoI1bVBryRg8YOar6axsbeUjL9YT0K7P+uGu92aDrNkmH6UHFLQbwOJ
   HFJvCpVE2psVmlzfTOeHtSY9DdBcHnM7tMAv9OaVeUQl+OOxvlQZfmGRJ
   vWsPg0DT4lXnbdKvFn4Qg/sqf0uyE9p6CdwUoQOd+0r+HF3eh26QxFgdR
   svYJvNRFZYzOsvUi6yxLA11Vs29ZkQrHBetqu026NfhlyZXKocNnc2Lo7
   A==;
X-CSE-ConnectionGUID: F+Msa5yJTjSTzgUB7FBvEg==
X-CSE-MsgGUID: epA3+97nS7S0OIVi0hDzQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70045937"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="70045937"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 04:36:22 -0800
X-CSE-ConnectionGUID: rFBjAsx+SluCgfirqOMSPA==
X-CSE-MsgGUID: trgQozQbRpGmBZNV5LFJQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="205974205"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.231])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 04:36:22 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9C702121D5F;
	Thu, 22 Jan 2026 14:36:23 +0200 (EET)
Date: Thu, 22 Jan 2026 14:36:23 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: Re: [raw2rgbpnm,PATCH] Add support for all RAW memory layouts
Message-ID: <aXIZx1S7Q0f77VCB@kekkonen.localdomain>
References: <20250511154659.778725-1-niklas.soderlund@ragnatech.se>
 <20260122092004.GA239742@killaraus>
 <20260122092834.GC2316109@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260122092834.GC2316109@ragnatech.se>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	TAGGED_FROM(0.00)[bounces-51350-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6AAAE674B0
X-Rspamd-Action: no action

Hej Niklas,

On Thu, Jan 22, 2026 at 10:28:34AM +0100, Niklas Söderlund wrote:
> Hi Laurent,
> 
> On 2026-01-22 11:20:04 +0200, Laurent Pinchart wrote:
> > Hi Niklas,
> > 
> > I know this has been merged already, but it only came to my attention
> > now.
> > 
> > On Sun, May 11, 2025 at 05:46:59PM +0200, Niklas Söderlund wrote:
> > > Convert all supported RAW input images to GRBG memory layout before
> > > feeding it to the RAW to RGB conversion algorithms. This way all layouts
> > > can produced good colors in the output image.
> > 
> > I don't think the result will be accurate. It does produce better
> > colours, but all liens and columns in the output image end up being
> > swapped in groups of two. I would have kept printing a warning message.
> 
> Thinking about it now, yes having kept or updated the warning message to 
> make the user aware of the result not being pixel perfect would likely 
> have been a good idea.

Kunde du skicka en lappa för detta? :-)

-- 
Med trevliga hälsningar,

Sakari Ailus

