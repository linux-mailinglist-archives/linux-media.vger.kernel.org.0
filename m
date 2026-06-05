Return-Path: <linux-media+bounces-63927-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3rchOXDcImodegEAu9opvQ
	(envelope-from <linux-media+bounces-63927-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 16:25:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8D4648D3D
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 16:25:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="j6XOuu/G";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63927-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63927-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 146A63046FE8
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 14:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24A4330B2E;
	Fri,  5 Jun 2026 14:18:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F7A36CDF3
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 14:18:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780669135; cv=none; b=vEOu3WL+GOwAyyUl9PLXyFZ0MlCUvpTXOiJECN2mEvGL1KUCvOIBMiH7xmUpZwSnPvOijy2JUtxOMzpPVVEBMbgtrcmW4qpZuZ2rnPPjrTdou/hfPwOvRaKr05dUgyQQA290fppp/T2KcLSSRY/OV307Mimr3/bxaawiS7gxiJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780669135; c=relaxed/simple;
	bh=6j6Kbr3PTBz4Ce08nM4gCYJRDe0clylusP7FpmuwSPQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XvOV7Ae0Wgv58SVIYeCjMDQM/CjmnrPyZK6JJuO8GUEeSNfz2NJQfOAs7ZnHCGEu1iPd/byRPLl1du+ZiE0BtbX+3nEdlWuaTszEjk349xj9XPrJQ2azlRRZ8AUAds25SEDn1r6Kj0qX80sWpd95cHus1Xg7ga0KikYKGPGI930=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j6XOuu/G; arc=none smtp.client-ip=198.175.65.21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780669128; x=1812205128;
  h=date:from:to:cc:subject:message-id;
  bh=6j6Kbr3PTBz4Ce08nM4gCYJRDe0clylusP7FpmuwSPQ=;
  b=j6XOuu/GWlc8KgxWujNIcYWgRGSmUe8q1AWkGBUbzYYKxbYKeAWArepQ
   N2NjHFenEQd9s7hjJohtG1jmzefFvHPNX/bmBU0eL5eiKYY9DCPHOaD5W
   UBidY2mUtsgNY14kqCpLE80D2FdktwOToyiHb1X7LCnFzwdVezqXUcq/s
   90SERWkd9maNFF1+g+Rv/z13ZShAGhtvNdjRj2H2b/G4SrJRu8CP54Gst
   OwcLa+Bs4luTe4kU0pKd5UZ19ahHNTVggqhoq3FkNmPyVSBMmOfGXIP7A
   TkH5zgqN4fgtFNEiJ+Zsu6+v6ZFEKySHKAoylN7Cpz8vic5b5TKR9G8tB
   Q==;
X-CSE-ConnectionGUID: 80JmApH7QkKBfd3mhxddcQ==
X-CSE-MsgGUID: GEd9D104Rz6CcDQTi2FBeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81411663"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="81411663"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 07:18:48 -0700
X-CSE-ConnectionGUID: GPiRgkVvRLqU/obW3K9mGw==
X-CSE-MsgGUID: /3+SwIOpTQCe212hiyW2LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="249960226"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Jun 2026 07:18:46 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVVNj-00000000G78-3I2t;
	Fri, 05 Jun 2026 14:18:43 +0000
Date: Fri, 05 Jun 2026 22:18:13 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org
Subject: [sailus-media-tree:partial-reg 5/9]
 drivers/media/v4l2-core/v4l2-event.c:81:41: warning: variable 'evspec' is
 uninitialized when used within its own initialization
Message-ID: <202606052235.rM24ifzS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63927-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim,intel.com:from_mime,intel.com:email,vger.kernel.org:from_smtp,01.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A8D4648D3D

tree:   git://linuxtv.org/sailus/media_tree.git partial-reg
head:   b7d01dab7d47849d483b459ff2abf50497b52149
commit: 0258a2c8b5c7b9a6a0adce2059f2ecd12046776d [5/9] v4l: event: Split the event framework into generic and V4L2 bits
config: arm64-randconfig-004-20260605 (https://download.01.org/0day-ci/archive/20260605/202606052235.rM24ifzS-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 7917772d7d61384696c61102c08c2ea158e610fa)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606052235.rM24ifzS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606052235.rM24ifzS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/v4l2-core/v4l2-event.c:81:41: warning: variable 'evspec' is uninitialized when used within its own initialization [-Wuninitialized]
      81 |         const struct v4l2_event_spec *evspec = evspec;
         |                                       ~~~~~~   ^~~~~~
   1 warning generated.


vim +/evspec +81 drivers/media/v4l2-core/v4l2-event.c

    77	
    78	static bool v4l2_evop_is_subscribed(struct media_subscribed_evbase *mse,
    79					    const void *__evspec)
    80	{
  > 81		const struct v4l2_event_spec *evspec = evspec;
    82		struct v4l2_subscribed_event *sev = to_v4l2_subscribed_event(mse);
    83	
    84		return sev->evspec.type == evspec->type &&
    85			sev->evspec.id == evspec->id;
    86	}
    87	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

