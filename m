Return-Path: <linux-media+bounces-56577-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMtGGe6+vWkbBQMAu9opvQ
	(envelope-from <linux-media+bounces-56577-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 22:41:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D32312E1762
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 22:41:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5A4A308A425
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 21:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DADE3DB63D;
	Fri, 20 Mar 2026 21:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AIGucESq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF45313277;
	Fri, 20 Mar 2026 21:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774042814; cv=none; b=RpC8OuF8acell+f07eI+mG3Hp4nDyURI7tr8HqlCskrisb3GH1P6fmw1+4A0fEa7OFl/ZcnvX9V+56DQV4tmYrNDjcpUtDRCcyRIzLN9vtJilJknfZ7YTzTI+YWuzVbk6oB4hWsRZj8agxj+lcGdfC2iP/eYzG4RAc9Qe0GY+5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774042814; c=relaxed/simple;
	bh=/8b/KSnZdDHhaR3EpS5CHM8VpqTf15ov/0PyTSO8vo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QAcHtEEZi3B9uQqAJdeHVQB4fSqu+D1a7mBa5qQ5zmRZGgyN/C9zzoOmAablHEUqD5p/ruh4RnLObPt7dgFou6cGdUWm/ZVm8zWNJ9EUi/g6WoJtbKdi3BkyEilqhQSxbjJVTjQNYLdJN5gFO4h0bt0iLMdXJWAcotBC8O+hr2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AIGucESq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774042814; x=1805578814;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/8b/KSnZdDHhaR3EpS5CHM8VpqTf15ov/0PyTSO8vo8=;
  b=AIGucESqAjeIAYwJhq2l9eeLqb5rLU2J4BpLu97vkdrH9+Wx5Iync2Dq
   ZswkqmHz93kitcBSjLvWSpyyYTxn7xtkDlgM9ANoAdskbjvMWR0golCNB
   URIFCXpYOCjaAt8fFWZZZ3srsk+XngEMGxjfnQrAc433CzCRY2YgZwkAd
   +joziBroFjhp9SoK/i+WvOpkzZ/F5MhEWl95AmFESDr0SSnXw9Ormkfw4
   o/LnUSn5+opd/GgFazn6WDXIPzjqHSjyTaFWGQFIfuSiXO0KsWahrxLYX
   bJ0IR5hfUPPVQUBquulHh3y3rHxrhMbrdpvHstEstU9djDFIEEBVDdxtZ
   g==;
X-CSE-ConnectionGUID: j3m486aaTdWcRt37qzsSBQ==
X-CSE-MsgGUID: N0P7kpAkRP6817vYNi0ySg==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="74837898"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="74837898"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 14:40:13 -0700
X-CSE-ConnectionGUID: +c/Pnq+vTAGf9ZWSqOCYcA==
X-CSE-MsgGUID: 8l6BsR0WRReDJwMjACSJeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="253894023"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.171])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 14:40:09 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C6EE612033A;
	Fri, 20 Mar 2026 23:40:09 +0200 (EET)
Date: Fri, 20 Mar 2026 23:40:09 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Antoine Bernard <zalnir@proton.me>
Cc: Arec Kao <arec.kao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"~postmarketos/upstreaming@lists.sr.ht" <~postmarketos/upstreaming@lists.sr.ht>
Subject: Re: [PATCH 2/3] media: dt-bindings: Add OmniVision OV13B10
Message-ID: <ab2-uW0Q6dLKz8qK@kekkonen.localdomain>
References: <cTZxBKdzN37cy_eGcCK3hocAgzwzdfBnsqWXpJnNYFZb6Odl4FspR5333ZBJIJG5dRunnVBB3fWiRJL_pq3SmykhDKxaGPRl_T5_BShJIng=@proton.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cTZxBKdzN37cy_eGcCK3hocAgzwzdfBnsqWXpJnNYFZb6Odl4FspR5333ZBJIJG5dRunnVBB3fWiRJL_pq3SmykhDKxaGPRl_T5_BShJIng=@proton.me>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-56577-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,gmail.com,vger.kernel.org,lists.sr.ht];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kekkonen.localdomain:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: D32312E1762
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

One more thing...

On Fri, Mar 20, 2026 at 09:27:18AM +0000, Antoine Bernard wrote:
> +maintainers:
> +  - Arec Kao <arec.kao@intel.com>

I think you should put your own name here unless you have agreed
something else with Arec.

-- 
Sakari Ailus

