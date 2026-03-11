Return-Path: <linux-media+bounces-55450-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBI8CtjpsWlxHAAAu9opvQ
	(envelope-from <linux-media+bounces-55450-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 23:16:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC9626AD6F
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 23:16:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E963302F240
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 22:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD3A38F652;
	Wed, 11 Mar 2026 22:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YgrCdD9N"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72E729ACFD;
	Wed, 11 Mar 2026 22:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773267393; cv=none; b=rrIFCy+l96tIvmSm8fdNT84qSUMxj8zU8DAW3l0Q3phV5Wi2Lm6vuwIcl64tWnGvo/nEaHFT0m8fSYBWQLcDebfA1X6OHXJLzvl0uM07Mcwmf/qAbaMsQl0Het6K3UkS2HP+5mu/iYLAGbUhIZFdE3HCld2oaXkugZdNiPtKH9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773267393; c=relaxed/simple;
	bh=yi+M36jj0YbiLRAVzTXkmt7FbbQdsM2frRLwH5/Lk54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L/x3VBdGR5rIIcAS1VkyBmR4QcrbVojAmkm2QO3bHwVYKSJP9LuD95zEXEewzzdF2DvFiBYvev7PS98ceoNeRXgrpz2/b8K6DepvP1qSJUeHwsyEQ0gshgP2vCDYQku/xAJ+ZzcZXbOhTVM/ji9BWqPk8DqL0ZAOThDEdPKAEOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YgrCdD9N; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773267391; x=1804803391;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yi+M36jj0YbiLRAVzTXkmt7FbbQdsM2frRLwH5/Lk54=;
  b=YgrCdD9Ns1/LNP3WaXCw7pmh1ee4Ep9pyT5xAGs8XOuwIHrZ2nOonk9U
   2DfwTP6PJkTNpixC1l4eiRHDecydrBLIiOfkHrdgIs7SLrFpHk4kBsbkX
   H90XZrZ06aFVv3I4BaPOLKY/dZC1zTgyu2H5UQ++ViX9vCUhWaAGSVH+Q
   Ck1wA+FmS6yQ/8hfIciQex6pP7lT2IctPT1fEwxyT4RCC5YF2+JbX5wbQ
   p99njRmWCAk+lyMAK7kB63GBNiJZEPStBLNckNbYw11tTHkXqVktGMfiM
   y2PBN0e3WxZB6xhoNcXFjfO6/GZVjpHReh0c0PZZjVORD5FXerr08b3vS
   A==;
X-CSE-ConnectionGUID: gHvmZU1+RKaY0vo72yx7lw==
X-CSE-MsgGUID: Q5uhxZzjTkCrEKbnG8UkwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="78203996"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="78203996"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 15:16:31 -0700
X-CSE-ConnectionGUID: 5X0awnAIRg6YeDB2TusBzA==
X-CSE-MsgGUID: /gEWpYu1Qdyv6Tu9DYoqBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="220788345"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.45])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 15:16:27 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 185AE120233;
	Thu, 12 Mar 2026 00:18:23 +0200 (EET)
Date: Thu, 12 Mar 2026 00:18:23 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bin Du <Bin.Du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	sultan@kerneltoast.com, pratap.nirujogi@amd.com,
	benjamin.chan@amd.com, king.li@amd.com, gjorgji.rosikopulos@amd.com,
	Phil.Jawich@amd.com, Dominic.Antony@amd.com,
	mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com
Subject: Re: [PATCH v9 0/7] Add AMD ISP4 driver
Message-ID: <abHqL-40c9TKQz17@kekkonen.localdomain>
References: <20260302073020.148277-1-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302073020.148277-1-Bin.Du@amd.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,ideasonboard.com,linaro.org,bp.renesas.com,vger.kernel.org,kerneltoast.com,amd.com];
	TAGGED_FROM(0.00)[bounces-55450-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ubuntu.com:url,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pages.freedesktop.org:url]
X-Rspamd-Queue-Id: 3DC9626AD6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bin,

On Mon, Mar 02, 2026 at 03:30:13PM +0800, Bin Du wrote:
> Hello,
> 
> AMD ISP4 is the AMD image processing gen 4 which can be found in HP ZBook Ultra G1a 14 inch Mobile Workstation PC (Ryzen AI Max 300 Series)
> (https://ubuntu.com/certified/202411-36043)
> This patch series introduces the initial driver support for the AMD ISP4.

This seems to fail to compile on LLVM. Could you check
<URL:https://linux-media.pages.freedesktop.org/-/users/sailus/-/jobs/94941990/artifacts/junit/llvm.err.txt>
and also the smatch warning here
<URL:https://linux-media.pages.freedesktop.org/-/users/sailus/-/jobs/94955201/artifacts/junit/test-smatch.err.txt>?

There may be other issues, the Media CI system right now isn't very vocal
about them.

-- 
Kind regards,

Sakari Ailus

