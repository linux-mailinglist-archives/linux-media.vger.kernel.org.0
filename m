Return-Path: <linux-media+bounces-58143-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKODHI9/1GlLugcAu9opvQ
	(envelope-from <linux-media+bounces-58143-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 05:52:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C733C3A9842
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 05:52:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F1AB302EEE0
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 03:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE244374E67;
	Tue,  7 Apr 2026 03:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ha+QXgTQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6DC37475C;
	Tue,  7 Apr 2026 03:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775533945; cv=none; b=syN9/5XBtuYc2bxqeYl4bvCXRZXlhNx1qFeg7vOy9rm656zLpl1W9eth3SwBCRpxWsimYaNPXtzOwDaBvlU3SbIOMQHVYPBSX4VRRajnaCJ5Td3blN4g7l5brujIDgOn9k/4FT8QR+uOv1h40b8BIoRiHTO51Wm/njztRtJQgJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775533945; c=relaxed/simple;
	bh=0lN4yvvRpwTXY2M1bwHOQwP2uh5x8JoHbQMLCwhGqQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=plsBFOHJ4OlXzKycccv0Xk4Hn90SB4uLpLo99FJ+AP6DJ+pFKVo4Yv/gGi3DkYGt2xa+iUoIUWV2gLFdzyycGQfMvJZS2wmZL1xA+/z+86sMpJLAHYD9QbSUYQuPUrBKEj9wJbug36TzALAKjB4xOGCrdBb1WEBOr3ObgazOjas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ha+QXgTQ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775533944; x=1807069944;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0lN4yvvRpwTXY2M1bwHOQwP2uh5x8JoHbQMLCwhGqQI=;
  b=ha+QXgTQsseMgwQZBURyG0CHzxFdxdoLuZamNbbkOZUKKIwJhB/pCC2l
   b1kAAHf6x8+d7BkPJB169Qxg4DgTnCOHONzZBuXlroHJZbTuMZA6PXWZn
   pur+qQhwaHokjP5695FmP6FqOfLzPcgTbdPzKNsYnphOzXDytPud0dra7
   Ig+/60xI4g+6EvHfojSVFRR48dXL7W/fP9nY3w27TaCV74XQ0QHsTVjMO
   kLb7i08JmPXGLVTM+SBX5FoKK/mDjTbKeyANUINp2iVG4QtAwA+08OsY9
   jv/ZXony8sBWA+jAT6xyVXT8LO3Ng7GLVZje0JdZlONL0L5Kh3spFU5i+
   w==;
X-CSE-ConnectionGUID: +erGSAdLRB68vzRyjr0QhA==
X-CSE-MsgGUID: XNTbBeSyR6a2fYVIdO8SFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80080613"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="80080613"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:52:23 -0700
X-CSE-ConnectionGUID: KeuGLJQMSY6nFuMkgm/B1w==
X-CSE-MsgGUID: cqh0b/B8SgqnhZyszROKxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="227994504"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Apr 2026 20:52:21 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xUA-0000000002b-2vov;
	Tue, 07 Apr 2026 03:52:18 +0000
Date: Tue, 7 Apr 2026 11:51:33 +0800
From: kernel test robot <lkp@intel.com>
To: hoff.benjamin.k@gmail.com, linux-media@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	mchehab@kernel.org, hverkuil+cisco@kernel.org
Subject: Re: [PATCH v4] media: pci: add AVMatrix HWS capture driver
Message-ID: <202604040632.A5adPnXu-lkp@intel.com>
References: <20260330233636.381969-1-hoff.benjamin.k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330233636.381969-1-hoff.benjamin.k@gmail.com>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58143-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,intel.com:mid,git-scm.com:url,01.org:url,linuxtv.org:url]
X-Rspamd-Queue-Id: C733C3A9842
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on media-tree/master sailus-media-tree/master linus/master v7.0-rc6 next-20260402]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/hoff-benjamin-k-gmail-com/media-pci-add-AVMatrix-HWS-capture-driver/20260401-020513
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20260330233636.381969-1-hoff.benjamin.k%40gmail.com
patch subject: [PATCH v4] media: pci: add AVMatrix HWS capture driver
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20260404/202604040632.A5adPnXu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604040632.A5adPnXu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604040632.A5adPnXu-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/media/pci/hws/hws_pci.o: in function `hws_stop_kthread_action':
>> hws_pci.c:(.text+0x273): undefined reference to `__udivdi3'
   ld: drivers/media/pci/hws/hws_pci.o: in function `hws_stop_device':
   hws_pci.c:(.text+0x9b3): undefined reference to `__udivdi3'
>> ld: hws_pci.c:(.text+0xa43): undefined reference to `__udivdi3'
   ld: drivers/media/pci/hws/hws_pci.o: in function `hws_quiesce_for_transition':
   hws_pci.c:(.text+0x1321): undefined reference to `__udivdi3'
   ld: hws_pci.c:(.text+0x136b): undefined reference to `__udivdi3'
   ld: drivers/media/pci/hws/hws_pci.o:hws_pci.c:(.text+0x13c1): more undefined references to `__udivdi3' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

