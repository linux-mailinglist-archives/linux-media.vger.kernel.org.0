Return-Path: <linux-media+bounces-55487-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFUzEqCCsmm6NAAAu9opvQ
	(envelope-from <linux-media+bounces-55487-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 10:08:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3633426F60F
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 10:08:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 542FD30F8404
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 09:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B51F338836A;
	Thu, 12 Mar 2026 09:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XI0OWURs"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC10B3A7F7E
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 09:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773306301; cv=none; b=e3P2bpq9+5z2G3uFLheFQWsvIFUoHZUcRUwqkhwIrD4j4dsMLNd2OHykFOuCE6bG7fluRQCxLI/jy6fk2fe30GQYpOABvL/t/JAPGKZT4XUCsQ6dyY9v7YwsGvQ7B5dQU7eHqmTnOuRoxrjZMTYgFnfep7xNV7ZNYzR4B5dsgEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773306301; c=relaxed/simple;
	bh=ZaCuba5p70ATfTzwJmC3Kue0QPNh2OMgFSEpqVAc7wo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YGH8Ds1uekpC5xfIZYGNEMo/X8+9HFCZiGgpvzcrWhkW8XD7JUgP3p4jz59I0YB1+1QJuv4Z5cLGZRlNIuHQOmf6Y2N0K4MzgVLnqx+cvD73CiogGiAWICWv9yh5vxg8AiVHM3oHFCoxEgModEw36vbLNsvz8iB9ZbUPBSM6y0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XI0OWURs; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773306299; x=1804842299;
  h=date:from:to:cc:subject:message-id;
  bh=ZaCuba5p70ATfTzwJmC3Kue0QPNh2OMgFSEpqVAc7wo=;
  b=XI0OWURs/OGqY7lm98fxOApyMkPhiEB3eQASfssepnX020cqtl0ECyfw
   AfDlExaNgf16HzEs2BAVUU/k5U+lXYSAwWDGZfZRjZgcfMgXdRDCxUcm9
   h+1zQWK8rw4879R8j/5TOabsAr0lYO7Q3+Vh/74ebKAG+YYsGRTtn9fPV
   9yi7DJlUVQ1Q/+yaxjYW6VLZgr4uOkLhuVneTh1gBzxb+zwYGshxqlQSJ
   vwZP4H9zspezZOLEe0Oh8v6ZjXXnDkHrCnsUlmDHVqbtUcHISSiADvjfm
   9eOL5Rb8gUMkIqrg8Zvv+tTehfiBrVchNrcI0CIUYaVndpThu/i4D+HnL
   A==;
X-CSE-ConnectionGUID: rcCpeQhZR1aWrKLZv2Btbw==
X-CSE-MsgGUID: dHd7GWgXT5GTvMJ6KlVCwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="84709252"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="84709252"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 02:04:59 -0700
X-CSE-ConnectionGUID: YWR9pBotSb6ZYLS/Ua2wCg==
X-CSE-MsgGUID: sR/K61+bR1+U1eo2QNVjrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="223225157"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Mar 2026 02:04:57 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0byQ-000000002I7-28sx;
	Thu, 12 Mar 2026 09:04:54 +0000
Date: Thu, 12 Mar 2026 17:04:20 +0800
From: kernel test robot <lkp@intel.com>
To: Bin Du <Bin.Du@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sultan Alsawaf <sultan@kerneltoast.com>,
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Subject: [sailus-media-tree:amdisp4 5/7]
 drivers/media/platform/amd/isp4/isp4_video.c:89:17: error: initializer
 element is not a compile-time constant
Message-ID: <202603121658.qKXy376k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55487-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Queue-Id: 3633426F60F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   git://linuxtv.org/sailus/media_tree.git amdisp4
head:   352eeeb312305e93b09f387f0c3acbf64f255a2f
commit: 939f5d5b232e3e749dd54bbdb4d019254d216d03 [5/7] media: platform: amd: isp4 video node and buffers handling added
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260312/202603121658.qKXy376k-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603121658.qKXy376k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603121658.qKXy376k-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/amd/isp4/isp4_video.c:89:17: error: initializer element is not a compile-time constant
           .pixelformat = ISP4VID_DEFAULT_FMT,
                          ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/amd/isp4/isp4_video.c:16:29: note: expanded from macro 'ISP4VID_DEFAULT_FMT'
   #define ISP4VID_DEFAULT_FMT isp4vid_formats[0]
                               ^~~~~~~~~~~~~~~~~~
   1 error generated.


vim +89 drivers/media/platform/amd/isp4/isp4_video.c

    85	
    86	static const struct v4l2_pix_format isp4vid_fmt_default = {
    87		.width = 1920,
    88		.height = 1080,
  > 89		.pixelformat = ISP4VID_DEFAULT_FMT,
    90		.field = V4L2_FIELD_NONE,
    91		.colorspace = V4L2_COLORSPACE_SRGB,
    92	};
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

