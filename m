Return-Path: <linux-media+bounces-60773-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNLCBWVe/Gm7OwAAu9opvQ
	(envelope-from <linux-media+bounces-60773-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 11:41:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 768A54E628C
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 11:41:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5259305814D
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 09:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E85C3C5546;
	Thu,  7 May 2026 09:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kM+ePJPQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374F438E5C4;
	Thu,  7 May 2026 09:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778146450; cv=none; b=m4jF67QMNJmT6xrMJlO+IywV0vIjOAIQ7xc0i3rCRRU4UVHFuwy/73zcCQPzOzJtDcP4OT8EbSwS+7z9kplrVwjZRvYkepRVFB45pQi3+612ELtUv2MkFisV//fwxaFfdtnwdrRmFdxKxfRruN9xd9OJ/+wm10I3oO/ZWPQXO6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778146450; c=relaxed/simple;
	bh=+IsxBelrVscsrj/ZB3DL/7ohGnaZniFOEBK2aRoy74g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JvxZk7ooHyXgGGQUbVGHcXVWyRSF3oa7bdoGBZiYJaYM/hPPvrXTXydXa7VuVac5NUT4YqS/S7M4zHYklE4F5DhgL9NKTxXxsOlYK3DjjrYQgO0m4z3ZsB2j6wqCh+u33JP+uhwnpIG/XlmjtvZzoUX6MvOvWQE8e6vAm0gfnNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kM+ePJPQ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778146449; x=1809682449;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+IsxBelrVscsrj/ZB3DL/7ohGnaZniFOEBK2aRoy74g=;
  b=kM+ePJPQuN8IR4sSFw1VBzGuSUKl/1Wd6dbtUtmt3fySxUksBxlUKRha
   eQumLjGyOHZzP5MEP4VThiYw+GU9yr+rkqKMTvlr/nFYFXikkN67Ymy4Y
   +gpUnwXa4QevwYcRCAh3R+fzuOjxrXLErVEUaYUSGZFWovW6N5QA+DXV6
   LG8AzLcrBoSwpvex/2EIVAHITfVFZlWbME8X8EwMtptc0DvBwicpWNCv8
   Nya4ZZ5m/Mv+8ep0fAEeAT7g8NNX2QinvqrdRnSXn/K9TiRVjFSqqVglJ
   kc2gjUF8qNedLenZJ+cp6RI8kR3ebWinDMnwAgCR3n8tGhekdobRYtkQH
   g==;
X-CSE-ConnectionGUID: xQV+G35qQsy0egeel97gkA==
X-CSE-MsgGUID: oY31H1ibSWCUAxr+0e/D5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="101767994"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="101767994"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 02:34:08 -0700
X-CSE-ConnectionGUID: lHL32NqeS1ur1KHr/Hp3fQ==
X-CSE-MsgGUID: PXicovokRkeUd7amrg0uAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="241411414"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.99])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 02:34:04 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1E89C121CCD;
	Thu, 07 May 2026 12:34:02 +0300 (EEST)
Date: Thu, 7 May 2026 12:34:02 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
To: Bin Du <Bin.Du@amd.com>
Cc: "Limonciello, Mario" <Mario.Limonciello@amd.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	"laurent.pinchart+renesas@ideasonboard.com" <laurent.pinchart+renesas@ideasonboard.com>,
	"bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>,
	"prabhakar.mahadev-lad.rj@bp.renesas.com" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"sultan@kerneltoast.com" <sultan@kerneltoast.com>,
	"Nirujogi, Pratap" <Pratap.Nirujogi@amd.com>,
	"Chan, Benjamin (Koon Pan)" <Benjamin.Chan@amd.com>,
	"Li, King" <King.Li@amd.com>,
	"gjorgji.rosikopulos@amd.com" <gjorgji.rosikopulos@amd.com>,
	"Jawich, Phil" <Phil.Jawich@amd.com>,
	"Antony, Dominic" <Dominic.Antony@amd.com>,
	"Gong, Richard" <Richard.Gong@amd.com>,
	"Tsao, Anson" <anson.tsao@amd.com>
Subject: Re: [PATCH v10 0/7] Add AMD ISP4 driver
Message-ID: <afxcirtLHxeiaqF7@kekkonen.localdomain>
References: <20260320084146.200988-1-Bin.Du@amd.com>
 <7d5d52bf-b0dc-47d4-8cb8-d6099fd05c57@amd.com>
 <470a9fbc-c4c2-4bde-a91d-a22f1c730b31@amd.com>
 <LV9PR12MB982900FA14329B742FF64BBE875EA@LV9PR12MB9829.namprd12.prod.outlook.com>
 <adSlwqPVF81feLHx@kekkonen.localdomain>
 <21dfb3d2-d838-4325-8a6a-6024b851cbc5@amd.com>
 <afpSBiF8sUqulE-7@kekkonen.localdomain>
 <21140553-f207-468a-9357-a0ae08aa28c4@amd.com>
 <f68addf9-eb16-4c87-b281-b4f1dcc4cc63@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f68addf9-eb16-4c87-b281-b4f1dcc4cc63@amd.com>
X-Rspamd-Queue-Id: 768A54E628C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	FROM_DN_EQ_ADDR(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60773-lists,linux-media=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,kernel.org,xs4all.nl,ideasonboard.com,linaro.org,bp.renesas.com,vger.kernel.org,kerneltoast.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Action: no action

Hi Bin,

On Thu, May 07, 2026 at 02:44:32PM +0800, Bin Du wrote:
> Hi Sakari,
> 
> I'm not sure which Smatch version is used in Media CI. Here are some
> findings from my local tests for reference.
> 
> For v10, I could reproduce the false positive with an older Smatch snapshot
> built from upstream commit URL:https://repo.or.cz/smatch.git/commit/bc575c7a0c5c7a2d4fefd0e1d8b0dc9ccacdd1a6,
> which is a pre-1.74 snapshot.
> 
> I could not reproduce the same false positive with a newer Smatch snapshot
> based on upstream commit URL:https://repo.or.cz/smatch.git/commit/bcc58b9ccf06d28ab6be4f0992bc74f462aa12f8,
> which is a post-1.75 snapshot.
> 
> For v11, neither Smatch snapshot reports the warning.

That's nice. Smatch is updated weekly so we should get the new smatch in
soon and you could post a patch to remove the workaround. The code would be
nicer without that.

The patches themselves were merged earlier today to the media committers
tree.

-- 
Regards,

Sakari Ailus

