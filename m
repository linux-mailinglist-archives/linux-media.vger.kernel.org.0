Return-Path: <linux-media+bounces-63938-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cM6+IorvImrCfQEAu9opvQ
	(envelope-from <linux-media+bounces-63938-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 17:47:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D2269649718
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 17:47:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=Pcv5wqaG;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63938-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63938-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAE813109873
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 15:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB3DD368D74;
	Fri,  5 Jun 2026 15:32:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEE7358379
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 15:32:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780673572; cv=none; b=iy94UP7iV7k6ar5l+N/pRP4mDyQZ7XrJjP42QBXT13oZPBwPtw9ARigLI1vuNfZIx3E0zGTRW/2ivGfGWQukhuaHCovwwRW0MPqdABJERLg3CUNSbfE1Qdp/53h/9+HJyKmsb6EPVHnmwtZ6GHnrFGFed8ov5bOq9t8hazpTpOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780673572; c=relaxed/simple;
	bh=W4RLOFk/TGhtttGUfrWkm6V8KHWc1BAYySAVpaloJYg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nXsDVw5uyhps/Z1ehWm3BWJf9NXZoXeHWF+DiDgm+4zqACN8Y7acx9n2AJ9CdP6xYOUTJ1eaB3AQ6CNNTK6OAhmtWT/BtMXiSy764fIyI+r1JUAFk2HNsacweWoO4BcXrWJD2TGpipsGTBlQ33EI7OUuQcE4uQpBhMRDsFepNpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pcv5wqaG; arc=none smtp.client-ip=198.175.65.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780673571; x=1812209571;
  h=date:from:to:cc:subject:message-id;
  bh=W4RLOFk/TGhtttGUfrWkm6V8KHWc1BAYySAVpaloJYg=;
  b=Pcv5wqaGlvhLecbuE8BjyAMMAdrFC59szDkMhFTV0hILrUHIU1Z7SpZW
   SLJjl7XeKQYKUDYehtbLo9ylousNGiv5tDHzWIlf6+7f6rj8DUiFIxLOW
   zxslj/nrDDPynknrREzwqdLY/sGM2DHC/031fO8AHVuwKyC9HK+DmxYEl
   06VwG2y8k+ELFbePsWz8+Kv7RrJhPvXj7RgEL1PTTFlxsZ8fwk/WE2tID
   aHkg7L1Mj1BM1e1Ds1LE+3R+XkxJIEAwLpQkPylgLl217lVVYLq5nJNLO
   DHXFabWLDQLgo453sABLEaYDxlO7F9pT6xqG4O2R3wvXQZkQDYGFAdPpP
   w==;
X-CSE-ConnectionGUID: La/U4M+YSWm7Q4kLAq41HQ==
X-CSE-MsgGUID: 5nKcg21wRRyq6QAAvw29qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="92995756"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="92995756"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 08:32:50 -0700
X-CSE-ConnectionGUID: kfhIEy5KTKOei+uF+IYvmg==
X-CSE-MsgGUID: 9Nl5ZRXZSu2+po6zlr9ZnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="242399376"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Jun 2026 08:32:48 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVWXO-00000000GAo-27vO;
	Fri, 05 Jun 2026 15:32:46 +0000
Date: Fri, 05 Jun 2026 23:32:25 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org
Subject: [sailus-media-tree:partial-reg 7/9]
 drivers/media/mc/mc-event.c:17:10: fatal error: 'media/media-event.h' file
 not found
Message-ID: <202606052349.bOSyAnNd-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-63938-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D2269649718

tree:   git://linuxtv.org/sailus/media_tree.git partial-reg
head:   b7d01dab7d47849d483b459ff2abf50497b52149
commit: 4d67653aa3bd15cbaf60bbe6f4d0dce10d0dccbc [7/9] media: mc: Add MEDIA_IOC_DQEVENT
config: arm64-randconfig-004-20260605 (https://download.01.org/0day-ci/archive/20260605/202606052349.bOSyAnNd-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 7917772d7d61384696c61102c08c2ea158e610fa)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606052349.bOSyAnNd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606052349.bOSyAnNd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/mc/mc-event.c:17:10: fatal error: 'media/media-event.h' file not found
      17 | #include <media/media-event.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> drivers/media/mc/mc-device.c:26:10: fatal error: 'media/media-event.h' file not found
      26 | #include <media/media-event.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +17 drivers/media/mc/mc-event.c

    15	
    16	#include <media/media-device.h>
  > 17	#include <media/media-event.h>
    18	#include <media/media-fh.h>
    19	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

