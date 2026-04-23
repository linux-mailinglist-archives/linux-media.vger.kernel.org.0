Return-Path: <linux-media+bounces-59426-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBzsLwQq6mnfvgIAu9opvQ
	(envelope-from <linux-media+bounces-59426-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 16:17:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D494538EC
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 16:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 35BDF3014A1C
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 14:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9940E3164A9;
	Thu, 23 Apr 2026 14:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EWWwm9HS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6859D2DC77F;
	Thu, 23 Apr 2026 14:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776953858; cv=none; b=GN0CqZ5wJi5RRX+XTYBBqODf0+2amzBg18fKGDHWLvTtyK6rfqQk8M/DKtauTNynkjFtC+/Dt/etYysgG9QQzjca626wpEKJlTwaOFm1EBQABKx2Jhpd9mPiu97LUweZA5/Xto22bIJe7F5+GKiQFVBVggt5IbXifkch1beEU78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776953858; c=relaxed/simple;
	bh=VETspyH98064NNYkXWMMd4D5+ynedMe0AN4U3TeIW40=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZsbJeAu+KRdJpdHr23oXbq3p2p2QHgMerqs/1Uwkb1QyE6a80JdNno44cVA23P5y1pR3nT0tEYhJUzuPsePHeSiw2WtcyyToqzbldisV/tdgag1Zzveo8w/x17pVa9X6SLCyTvZ4VWivwdFJkhl5H17AJwr+AEBJapCObfXhhXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EWWwm9HS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776953856; x=1808489856;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VETspyH98064NNYkXWMMd4D5+ynedMe0AN4U3TeIW40=;
  b=EWWwm9HSNnVmvvxOQMwyQaNW0jZP3OR8WybgqqVA3P/3f52YPAd8AaNo
   75iK5ZirhcoFzd/5dOphatA4qocY3iXdH8p3A5B/aZzrWyN6I8XAYU/CH
   ZD4DzqHlIIU1yOkuMyAxjNh4g5P/EIkXM4OR/lB3IuESHLZUsMo5oCas/
   Zyvo1n/Ka+c3309CypRzZUM+ubp/t6g4D/fvwr3frOIsjX2HbO7e83xU7
   Kg0+jy8z+r6xpXqG92lQGwpqtsVpTtCPsafhYcV8uVnpYBmG2+TsKISlD
   0laGryPHacgh1+LKjf9A8tAUIxQlSnXLkcfwNwUE9f3zO3JDhb0veGcC1
   A==;
X-CSE-ConnectionGUID: FnmfllMsTA6Su+2vnHoWiA==
X-CSE-MsgGUID: hHqC6bnOQqqjWEu7BBv1GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="88533657"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="88533657"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 07:17:34 -0700
X-CSE-ConnectionGUID: 1uXB3uhYT8e8RQqNsGl4Sg==
X-CSE-MsgGUID: srVysri8Qza8LI2KYs73zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="232509039"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.163])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 07:17:33 -0700
Date: Thu, 23 Apr 2026 17:17:30 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mark Brown <broonie@kernel.org>, sakari.ailus@linux.intel.com,
	hansg@kernel.org
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: AtomISP tree for Linux Next
Message-ID: <aeop-rkoHOgF2OgQ@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59426-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linuxtv.org:url,intel.com:dkim]
X-Rspamd-Queue-Id: C2D494538EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi, Mark!

I think I will express the thought hanging in the air that AtomISP driver needs
to be exposed in Linux Next tree. Currently it's being stored on linuxtv.org
servers [1] which I think is not often appear in the Linux Next. So, for now
can you add that tree to Linux next

Also note, that one of the reasons behind this is a flow of patches against
the driver that basically repeat each other or unapplicable due to newcomers
have a hard time to realise that they need to be based on a niche tree.

[1]: https://git.linuxtv.org/sailus/media_tree.git/log/?h=atomisp

Tree: git://linuxtv.org/sailus/media_tree.git
      https://git.linuxtv.org/sailus/media_tree.git
Branch: atomisp

-- 
With Best Regards,
Andy Shevchenko



