Return-Path: <linux-media+bounces-66577-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CAkBAdDwSGp+vgAAu9opvQ
	(envelope-from <linux-media+bounces-66577-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 13:38:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1967076E2
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 13:38:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=biMy3hbv;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66577-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66577-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 397A63015D3E
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2026 11:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ACFD37BE6A;
	Sat,  4 Jul 2026 11:38:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71BA347521
	for <linux-media@vger.kernel.org>; Sat,  4 Jul 2026 11:38:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783165131; cv=none; b=Wf9ai/oJ1gNOocmdC8fh5Em2pw28Lv+bDR2njabpLOiyOxHpRb0x6e+lPiBruqH4FNqy1w07Up21mcrFQfk/ISZZiUj61kXYW6/MxVPyJk1dCdeARTvATEslycYMJdqgYkikG6A23X8XDmc6PFebczWuOMSfmMBVnlo1DgZq42s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783165131; c=relaxed/simple;
	bh=rJgmvO5yrHXhnP9m8+37TjDLQtfJAY38lrtDMymzrWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iEZ/3ovflxJLZrbTP5aT1XrbHzNfhYsK5I393sByibV4kJdw8SBAsTrW97jnSBbLSyuaTmMINZ0A99mYqBEPUCrlg1/yc8/Hjz2gT5rXn+bF8amY+wDtW/QMs0jbs8xGk1Hvs3jHIB7U8KLM1QLh10w5EgEpgW8UNyX1wRL+KXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=biMy3hbv; arc=none smtp.client-ip=192.198.163.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783165130; x=1814701130;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rJgmvO5yrHXhnP9m8+37TjDLQtfJAY38lrtDMymzrWo=;
  b=biMy3hbvFrHKyDfCFkgYhYbgAeWlPsqAbq1OmbCuSG1fCViRrpgLpVJN
   fBHw0uHMmrX/pPy2othaYv2T4vlEdUoKanpt/vVRLR1e/itcRHEzteeRU
   32AUL1JS9BzhMn8/R/m449IkH/P+5vBYRVK0SJvPd44QTOpJdTbB0Wmfn
   JhRP0uItz014JYVzxjaf8u7crNtFZeMnybpTFWXgJt9nG0b1jQLCu+a7+
   MSC9/Puq5CGZooLLAQ4yYUtxAtqGUUYBPPfO2AwFfnfvt6oMFZoAeBHMF
   uDiG7vL0G+GaSEULodoEy4MEeofvrQESp4j1Qn2C+sT71G7L3rSy3BGrR
   Q==;
X-CSE-ConnectionGUID: eCv58E6yTzSBa+7zgKHlUg==
X-CSE-MsgGUID: qAnSmyZKQoagNhgvqTTZxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="94479273"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="94479273"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 04:38:48 -0700
X-CSE-ConnectionGUID: GdKt64CxQd+9K1BwLyFLgw==
X-CSE-MsgGUID: lP2z01HJTdqeViSB+aRwSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="253958243"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.237])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 04:38:46 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1E89F120221;
	Sat, 04 Jul 2026 14:38:45 +0300 (EEST)
Date: Sat, 4 Jul 2026 14:38:45 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	linux-media@vger.kernel.org, mchehab@kernel.org,
	daxing.li@intel.com, ong.hock.yu@intel.com
Subject: Re: [PATCH 00/41] media: ipu6: Add support for ipu7 hardware
Message-ID: <akjwxd3gcVN6WkVb@kekkonen.localdomain>
References: <20260703152451.1743132-1-antti.laakso@linux.intel.com>
 <2dd5cef71eb1ce5c246e64105ebd0d5cd593a0e0.camel@ndufresne.ca>
 <akgoiXheHnjrDtqW@kekkonen.localdomain>
 <178313979158.459445.3804729958099737941@ping.linuxembedded.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178313979158.459445.3804729958099737941@ping.linuxembedded.co.uk>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66577-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kieran.bingham@ideasonboard.com,m:nicolas@ndufresne.ca,m:antti.laakso@linux.intel.com,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:daxing.li@intel.com,m:ong.hock.yu@intel.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA1967076E2

Hi Kieran,

On Sat, Jul 04, 2026 at 05:36:31AM +0100, Kieran Bingham wrote:
> Quoting Sakari Ailus (2026-07-03 22:24:25)
> > Hi Nicolas,
> > 
> > On Fri, Jul 03, 2026 at 12:17:17PM -0400, Nicolas Dufresne wrote:
> > > Hi,
> > > 
> > > Le vendredi 03 juillet 2026 � 18:24 +0300, Antti Laakso a �crit�:
> > > > Hello,
> > > > 
> > > > The 7th Gen Intel Imaging Processing Unit is a PCI device including
> > > > input system and processing system. This set adds support for ISYS
> > > > in IPU7.
> > > > 
> > > > At this point only IPU7 is supported, not 7.5.
> > > 
> > > Is this implementation replacing the staging driver in
> > > ./drivers/staging/media/ipu7 ? Can you outline the plan ? Compare this
> > 
> > That's correct: there's no longer need for the staging driver once the ipu6
> > driver has support for both IPU7 and IPU7.5.
> 
> Only out of curiousity, but if this is generalising IPU6 to support 7
> and 7.5, is there a chance this could help IPU4 users which I understand
> is also firmware based?

IPU4 is somewhat similar in design to IPU6 but I the differences between
IPU4 and IPU6 are larger than those between IPU6 and later. Still,
feature-wise and in terms of how the hardware is controlled at a high level
it's very similar, so adding IPU4 support to the IPU6 driver would be the
best approach IMO.

-- 
Kind regards,

Sakari Ailus

