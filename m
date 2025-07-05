Return-Path: <linux-media+bounces-36876-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2FCAF9E40
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 06:17:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D7D84A849A
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 04:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3E891AF0BB;
	Sat,  5 Jul 2025 04:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QOsSwzzm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD9D2E370A
	for <linux-media@vger.kernel.org>; Sat,  5 Jul 2025 04:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751689040; cv=none; b=LQIgmavHIkdeqGovgPsYXJXPC+TTYGk37EeV4DL4uLX9A392/uL3WPCbmhKLhRqwgpFD11pAupDpnnrI6SBOD82UTNm5tNufG3994edFq/IIGBzkBE6ow30BDa95gNQCkj/0NeLMlc6gA284fWF2Zfhv5yonm5olg7I1quWqnyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751689040; c=relaxed/simple;
	bh=pf3FLykR1D7vqlUiSWCGpTAnMFgFxNKm14Bj1Cab4wE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H33qUKuZckcJO4reRcqZcrPA1KhH0fjeirAVxM+Z0OBc5TyDrjvP560cYar0iXfojz7eSwYPl8TVJrrjeiuhjwdfb2e/mbiBh7crGoKZrrnpn4yRyxozO0f16wBwd+9evB3VUO46OiQ+sqEw2w1VIrPje5oMDYLojCv4En2LggQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QOsSwzzm; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751689038; x=1783225038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pf3FLykR1D7vqlUiSWCGpTAnMFgFxNKm14Bj1Cab4wE=;
  b=QOsSwzzm06G1qEllynHRK3V9x/IutIRTJ4ZhgiMUd815q++TtFG1elHS
   rWHuM03Uuh3TdZXMdAzdQPo1zEKzySB5H1JrMluqZa/pdrfmIcpv4GYNk
   /VT9Y8MB/PzVFjc8+XSdV5Z96MWO5SC0joOqU3LvdzUPKUgR67NIIOv56
   SEAl/SZUv5vkSj5omytNVC+wxaGTu5Db6AmBX/7OUpP3hnfPNV6QtWyty
   V75Hc2nqfyItYG1FY3T2yMRhV35wEZaCCpq40UfkcZyVMGd7TRx4fTClB
   MdouEmtSwYye6In+XDedJkHGN/S8AKMR+D9lXKhoTPuK4JfNmJiq/mQXP
   A==;
X-CSE-ConnectionGUID: kdTpbIqSR3S1SktN4ULcsw==
X-CSE-MsgGUID: sNgAilisTaaCXjrlxjZN8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="71436425"
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="71436425"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 21:17:18 -0700
X-CSE-ConnectionGUID: W5Ei9zPVT0SMwET4f5Qkfg==
X-CSE-MsgGUID: tosJzfgDQkeUVV6Ag7JmqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="155242804"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Jul 2025 21:17:17 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXuKw-0004HH-11;
	Sat, 05 Jul 2025 04:17:14 +0000
Date: Sat, 5 Jul 2025 12:16:15 +0800
From: kernel test robot <lkp@intel.com>
To: Bingbu Cao <bingbu.cao@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [linuxtv-media-pending:next 189/190] ERROR: modpost: "__udivdi3"
 [drivers/staging/media/ipu7/intel-ipu7-isys.ko] undefined!
Message-ID: <202507051239.cb4TkmuW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.linuxtv.org/media-ci/media-pending.git next
head:   a8598c7de1bcd94461ca54c972efa9b4ea501fb9
commit: c5ddd03bc5c4ac92703060001d8912cacb3c2765 [189/190] media: staging/ipu7: add Makefile, Kconfig and to-do file for IPU7
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250705/202507051239.cb4TkmuW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507051239.cb4TkmuW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507051239.cb4TkmuW-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [drivers/staging/media/ipu7/intel-ipu7-isys.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

