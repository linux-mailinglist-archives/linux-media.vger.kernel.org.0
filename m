Return-Path: <linux-media+bounces-62974-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBD9D3J2GGo8kQgAu9opvQ
	(envelope-from <linux-media+bounces-62974-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 19:08:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B2C5F569C
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 19:08:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0FFE3300ACB3
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 17:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81DB83FBB5E;
	Thu, 28 May 2026 17:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZMSj3L4D"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91643F9F4D
	for <linux-media@vger.kernel.org>; Thu, 28 May 2026 17:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779988017; cv=none; b=C5nrlP944qd3NvSLGsMwJGAGYuBiuLQDPMmlbW+Ubrx7FRslmL+/5h3vLgBU1hm/MhUkTnoO7tH+CNZZp6nWhlBvKJQ3rSZeQ8KSDm5GJqA/T60je85z5KzbcnOmTcT6az3wqrdNqAxwWTTni4KvJGsBHcPRBC6x9URxHxjEG5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779988017; c=relaxed/simple;
	bh=Qf/V7HR1idk4/XxgOMTIcAUc/gQTjx4kFgzXdQo7Rmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nuoETgH/sLiCagcndfbfYYq0RAxY12ANbSlvtHna/bKMEdXwOQJHcM8FXO4usB6T4s2FNaxW86DCQ/MLPbMr8Q2rBDgnvzz5pCW2aE5CmGhUqIRgpL+gKygpSAvCS1tpTR96YkS9Js20hVnL/z33TgDYTICHnZSt0raARn/YKis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZMSj3L4D; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779988015; x=1811524015;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qf/V7HR1idk4/XxgOMTIcAUc/gQTjx4kFgzXdQo7Rmc=;
  b=ZMSj3L4Dchm5010RH7FQCwhxJhEh26Goc1XcEKN8rkIeZl2XGNseky9t
   Pw4VMADoXvFCJmLuPkUg16pqGubzByEQUsR+mHyBt1b87adf1CjkhF/vV
   niSpCfER8YEE69ZaoUDBG7QFhHlby3sg+sQgPf7UJvBLEYpgAsio4XA/C
   SIdNj9RGKDZR5OHqTZ42+nunlUfOGj9BbNI4Q/Bj9ALuxWxPtobOLqUcp
   8N8CBqjSIiPHtuzZSpGaJAe7jVlKpcOuRdWlALmbNv8Vp70+/MxpyVYNR
   IaLkUvq1xrpMHNqHuiEEMdjB2Wrkx5Vib7Y/WMKQdaB8kw6u4YvDl0NWk
   g==;
X-CSE-ConnectionGUID: 6UW4MmQDQBOU39G4VKkmqg==
X-CSE-MsgGUID: nxDY7LxITS+I8DTOytTzmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="91405943"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="91405943"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 10:06:55 -0700
X-CSE-ConnectionGUID: 59vqV+YDRIi1YHCLgfgLug==
X-CSE-MsgGUID: +h6SSr9sRnC4K+Vm2x/PKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="242703434"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.75])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 10:06:53 -0700
Date: Thu, 28 May 2026 19:06:44 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Miguel Vadillo <miguel.vadillo@intel.com>
Cc: linux-media@vger.kernel.org, wei.a.xu@intel.com, atul.raut@intel.com, 
	sakari.ailus@linux.intel.com, antti.laakso@linux.intel.com, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v5 3/3] ACPI: scan: Honor _DEP for Intel CVS devices
Message-ID: <ahh2DPQ1N-3zCtr3@mdjait-mobl>
References: <20260527170531.383871-1-miguel.vadillo@intel.com>
 <20260527170531.383871-4-miguel.vadillo@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527170531.383871-4-miguel.vadillo@intel.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62974-lists,linux-media=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mehdi.djait@linux.intel.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 73B2C5F569C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Miguel,

Thank you for the patch!

On Wed, May 27, 2026 at 10:05:31AM -0700, Miguel Vadillo wrote:
> CVS (Computer Vision Sensing) is an ACPI-enumerated device that sits
> inline in the CSI-2 path between the camera sensor and Intel IPU.
> On platforms where CVS is present, the camera sensor's ACPI node
> declares a _DEP dependency on the CVS device.
> 
> The CVS driver must be fully initialized before camera sensor drivers
> probe, because CVS controls the CSI-2 link ownership handshake (via
> GPIO REQ/RESP), the MIPI/CSI-2 lane configuration, and the camera
> power domain. Without CVS ready, the sensor driver can bind but the
> CSI-2 stream will not function correctly.
> 
> The CVS driver calls acpi_dev_clear_dependencies() at the end of its
> probe() to unblock waiting consumers once it is ready.
> 
> Move the CVS HIDs from acpi_ignore_dep_ids[] to acpi_honor_dep_ids[]
> so that camera sensor enumeration is deferred until the CVS driver has
> finished probing, matching the behavior already in place for IVSC.
> 
> Signed-off-by: Miguel Vadillo <miguel.vadillo@intel.com>

Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 13 9350 + IPU7
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

--
Kind Regards
Mehdi Djait

