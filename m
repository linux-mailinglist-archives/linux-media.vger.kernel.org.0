Return-Path: <linux-media+bounces-58552-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPhYGDj72Gk5kggAu9opvQ
	(envelope-from <linux-media+bounces-58552-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 15:29:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1FD3D81EA
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 15:29:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48967303DA1D
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 13:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF973C197A;
	Fri, 10 Apr 2026 13:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Js2QkJxS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6CF38F240
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 13:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775827725; cv=none; b=U+8xsyyklalzBai2C8WUlV9oS+P89fHWb6KTNg7Ih+OkBC0nX938fiGaHqJd+4FUWkcT3+ts5dpz/L6LnfVFiFHYWLv7JDLgWA242xgPZKsiP41W+0DfXgD2j+C5pnrd40MGkzAjaE0ODnm2wiBcBfsQ+BBDgVyL2ZPutJ1R1rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775827725; c=relaxed/simple;
	bh=IJ8pn+Y4Ce/sFJWWyEUO+tHkvmgSteawUrYqdh6cVgM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jvz8XsTXAZj1aZf9blaElLfl9vPhv0kHDDAX2T8NJvGrPw0jSNiYMjYsjiBGsC3gMldGkxkfaNpJe/97Ma+uertrW1qZAMbPJKS9QWyCBydB+42c0OzXchu+kkWgI/6GaLxjtsz+WSm+07BCpwR9a7+6LxAx33vbfIsAFlS6ayY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Js2QkJxS; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775827724; x=1807363724;
  h=date:from:to:cc:subject:message-id;
  bh=IJ8pn+Y4Ce/sFJWWyEUO+tHkvmgSteawUrYqdh6cVgM=;
  b=Js2QkJxS807zUlmnP8l5m8FNRtrw4XmKS5ZkgfZ01zzXbYkQwbTstk3E
   Lm2Q4cpaJcjrI6tSetJe8iiTW8RufiHrH+UHQdHJ4sbcTf3fwdbJVIARP
   RQsbo2ijvkvjFFtDtqSIcpkqwiWFu/Ffmoks7L4MEOYgEoVV24MCA7ns0
   vteoccojKvOStmjwwmZvnAMb/hp5ZHWvW+WUpcJqT9rie1xMoKyYY9xa5
   n/riHqAtgQvIBqtI1y/97AY32LOAcmCK68XOw02YeDVSqxj0CGtZ3pqwr
   WcYmTjpwfJVaDHJfjN5X7ANueM5EXPRKZn4+ggeS7xR8+oJ2123qE6HdH
   w==;
X-CSE-ConnectionGUID: U3T8i++TRiauNM7n0aWlyA==
X-CSE-MsgGUID: 8u6+W1zFQ/iMc7qEcpgUqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76724183"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76724183"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 06:28:44 -0700
X-CSE-ConnectionGUID: bhshlMYtQEKKQyGn+Y1UUw==
X-CSE-MsgGUID: rtJVnKtrT8CRXWBkWrfIjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="230809254"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Apr 2026 06:28:41 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBBuZ-000000003m3-1Vfi;
	Fri, 10 Apr 2026 13:28:39 +0000
Date: Fri, 10 Apr 2026 21:28:32 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 93/115] ERROR: modpost:
 "__aeabi_ldivmod" [drivers/media/i2c/imx219.ko] undefined!
Message-ID: <202604102137.3ve9nLmE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58552-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	SUBJECT_ENDS_EXCLAIM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.934];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: BB1FD3D81EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   ace2f872475ed78b708d667f1b2d004b192eeeb1
commit: e7e6aacc616a0a6f74793f3a4172d14a37ee432f [93/115] media: imx219: Support LINE_LENGTH_PIXELS and FRAME_LENGTH_LINES controls
config: arm-randconfig-004-20260408 (https://download.01.org/0day-ci/archive/20260410/202604102137.3ve9nLmE-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c80443cd37b2e2788cba67ffa180a6331e5f0791)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604102137.3ve9nLmE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604102137.3ve9nLmE-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__aeabi_ldivmod" [drivers/media/i2c/imx219.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

