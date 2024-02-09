Return-Path: <linux-media+bounces-4908-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4D084FE13
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 22:00:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D4991F23CD5
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 21:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142A616410;
	Fri,  9 Feb 2024 21:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SoLj9B99"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32C512B79
	for <linux-media@vger.kernel.org>; Fri,  9 Feb 2024 21:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707512445; cv=none; b=ZTpncQcHkSPB8wwTM0o0W8rvmskU1e3WxBmXjWuVDoGd2fka3XRR1p4rm76eErmzNSIPiRvbFSKfvW/0gmUmu3dWTCx8AeilzPcNYpC0/gdcb2mDxFe2cbqYhLrSmHS9y3tyccV/2x/b7aR70ZJJcDJ2ryd+AUIA4nkMKgH5QCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707512445; c=relaxed/simple;
	bh=BmrEcsGazqIKj3BBCVMFJ700llNXEqx+oUAX7Q1DBCY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HqKoh0ByrQ1aSQRwKoT3kgHYOJpNY7GXDKBsqVjEDOPNYVfNENKqEshqy3H7YfAm7KRFDb2n5XjmIOD8JEkmkT5UcycFxbuEUf7nElhhDogenz20oL7xKdIPndXCYUAtK4OaaVmoW7IsV27CtYPJJ/6Nr34qFBirroqJH7pUc7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SoLj9B99; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707512444; x=1739048444;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BmrEcsGazqIKj3BBCVMFJ700llNXEqx+oUAX7Q1DBCY=;
  b=SoLj9B99NcMg31N9Mwv+vVosPmfH/YDfcIfdu0juim6P97TCWAPq6eZL
   i9+HRJPE+IC4uySeIZBn2gWx+KUNWJXyM0vp8ZT9MPV14P0294PZvQBzt
   3jDbbZKPilxVMK2j2RuczodHKu23U4uxigGCNabOEp8r/9NX3vkf3r4+n
   lxq8Uyc2U9zx46+OOca+dZV+YxMklxPuDX+v2pgJjqt7NvDN3Kf+rqmaN
   +INMk6ZjTWjpi2jZ8OAEQCHD6DwwE+lsmhaXYNPnniHQ2m3WdVBczFCFq
   CkeCdXahb6LroBbrKS8IaPawskj+HjnQ5THsvPT+pbXLwqw8Nb4N7HZVQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="12068944"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="12068944"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 13:00:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="2023066"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Feb 2024 13:00:41 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYXzC-00056I-35;
	Fri, 09 Feb 2024 21:00:38 +0000
Date: Sat, 10 Feb 2024 05:00:32 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [sailus-media-tree:media-ref 16/39]
 drivers/media/mc/mc-devnode.c:63:15: error: no member named 'ref' in 'struct
 media_devnode'
Message-ID: <202402100414.5Q1MjYkT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git media-ref
head:   f94611d22fa335b7dabf2e7356b4486e5a1f8907
commit: a62c39d46e9076dc500bd9c2f35fcc5e557b4a88 [16/39] media: mc: Refcount the media device
config: i386-randconfig-054-20240208 (https://download.01.org/0day-ci/archive/20240210/202402100414.5Q1MjYkT-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402100414.5Q1MjYkT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402100414.5Q1MjYkT-lkp@intel.com/

Note: the sailus-media-tree/media-ref HEAD f94611d22fa335b7dabf2e7356b4486e5a1f8907 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/media/mc/mc-devnode.c:63:15: error: no member named 'ref' in 'struct media_devnode'
      63 |         if (devnode->ref)
         |             ~~~~~~~  ^
   1 error generated.


vim +63 drivers/media/mc/mc-devnode.c

    56	
    57	/* Called when the last user of the media device exits. */
    58	static void media_devnode_release(struct device *cd)
    59	{
    60		struct media_devnode *devnode = to_media_devnode(cd);
    61	
    62		/* If the devnode has a ref, it is simply released by the user. */
  > 63		if (devnode->ref)
    64			return;
    65	
    66		if (devnode->minor != -1)
    67			media_devnode_free_minor(devnode->minor);
    68	
    69		/* Release media_devnode and perform other cleanups as needed. */
    70		if (devnode->release)
    71			devnode->release(devnode);
    72	}
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

