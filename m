Return-Path: <linux-media+bounces-42840-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EC7B8DA79
	for <lists+linux-media@lfdr.de>; Sun, 21 Sep 2025 14:02:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A821A17361E
	for <lists+linux-media@lfdr.de>; Sun, 21 Sep 2025 12:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E19632C324E;
	Sun, 21 Sep 2025 12:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/Ls5If8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C8A34BA39;
	Sun, 21 Sep 2025 12:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758456169; cv=none; b=Nfq8EElEpyn33zSSlkqWWh/sLNOZT2qGxQt7nBWS5PYwC+W0G7F+1setGKcpUTRwqESVyxuvArOwbo+4UjYIlZvndHeOdhoMCGpidqZjoKVau1S+5Z8XXafO/pRRast4Kktas7hcgiSpP9UKh8Sb+V5l2J8HVGlgDYLcPYr1soU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758456169; c=relaxed/simple;
	bh=5IQlyYmqYaYIRSexLmhO6aiLRDVa4NoqpEv0Gr5FZOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iBoUZ9RntvEM1/N5wt8FjqOwR6ofyjGH4Sl5jJN+bf47GJpD5cSZndZtXVh8v0wX7RyO75e04vAi0n2zepfww3tkQxMTm49tACreNfLimUr/FuK949wHLaanx22OgGttvynJ8EvvshFz24JBvA4r7cXhc6iRw7VuI3pee7e1+9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/Ls5If8; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758456166; x=1789992166;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5IQlyYmqYaYIRSexLmhO6aiLRDVa4NoqpEv0Gr5FZOc=;
  b=K/Ls5If8VWd5AWpl+8AXwR/j/VRRH8H+QUaR8IPK50sBQABSimLs2luk
   +D1EPLyAjY41qyl56/f9MzxWyoJ+z1gJPJKL76s1of4zVN4CoCMoqKDVW
   36INbF0oaro9VuhFFv5NBJYi9WkhHAcvlttZNtqGxxju8q0E4XmsJiCs1
   DdS3Gt0klFYqSdBeGZZp28BCvl/D0mvs5iBetcwx4usk0IprrEZmGjkke
   lgE5vyMs2EfHhKYFYw0fWniHdol2LA93OMGphnETAmoejS+5C6eeGvZq7
   VWR5szE1O5yhu38kYpLikg+AaF9TYAtBaooPD3cqmqpzv/sdrpBaq5UdJ
   w==;
X-CSE-ConnectionGUID: QLpeOB5DSSW6rDvjh8npiQ==
X-CSE-MsgGUID: Cqa0B5CFQq+kbyhNKCUG1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11559"; a="60669017"
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="60669017"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 05:02:44 -0700
X-CSE-ConnectionGUID: rHuhnbv3RFGRPrlcYPuCeQ==
X-CSE-MsgGUID: q68WrYn/R+eVSGWv9RHJXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="175380558"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 21 Sep 2025 05:02:41 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0Im7-0000hx-1H;
	Sun, 21 Sep 2025 12:02:39 +0000
Date: Sun, 21 Sep 2025 20:02:01 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Tran <alex.t.tran@gmail.com>, mchehab@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, laurent.pinchart@ideasonboard.com,
	hansg@kernel.org, hverkuil+cisco@kernel.org, cascardo@igalia.com,
	ribalda@chromium.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Alex Tran <alex.t.tran@gmail.com>
Subject: Re: [PATCH v3] media: i2c: wm8775: parameterize wm8775_platform_data
 based on config
Message-ID: <202509211953.3uP6gmSx-lkp@intel.com>
References: <20250921005635.949377-1-alex.t.tran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250921005635.949377-1-alex.t.tran@gmail.com>

Hi Alex,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on linus/master v6.17-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Tran/media-i2c-wm8775-parameterize-wm8775_platform_data-based-on-config/20250921-104257
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250921005635.949377-1-alex.t.tran%40gmail.com
patch subject: [PATCH v3] media: i2c: wm8775: parameterize wm8775_platform_data based on config
config: sparc-randconfig-002-20250921 (https://download.01.org/0day-ci/archive/20250921/202509211953.3uP6gmSx-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509211953.3uP6gmSx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509211953.3uP6gmSx-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "wm8775_standard_cfg" [drivers/media/pci/cx88/cx8800.ko] undefined!
>> ERROR: modpost: "wm8775_nova_s_cfg" [drivers/media/pci/cx88/cx8800.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

