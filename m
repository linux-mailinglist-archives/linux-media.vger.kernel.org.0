Return-Path: <linux-media+bounces-22748-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BB99E6047
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 22:56:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59CE8169D8E
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 21:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB9181CD208;
	Thu,  5 Dec 2024 21:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c3b1rWZ2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883721C07C8
	for <linux-media@vger.kernel.org>; Thu,  5 Dec 2024 21:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733435767; cv=none; b=hMTFkfIYNyelnlpQWED8QQ6+KnPdBVVK/fI5gKZqoRg0zzMSdGdI2tXQ559uDIbT+3N+36UrBG4WGhvZ2+s0AAlKXAD0oYtSqyI2KLF0CY4nD7pTuZ3dVtl3oCpq8NEVm+MbLKdxg7BlxrlvnCbIuezqm0bbi8MK/vBFEGWrlFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733435767; c=relaxed/simple;
	bh=WMf0tEohi52SxL4e8/4FzjGFk9lGLF3Ynw1IqIL8BJY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GK9EYlqBa1M1eL6hCib2PijOlmReupoTHVxkN6OcxnXvGiIcIHJdowjrt8mr+kq8LbmRszqQm1LXJEbjR6bs7m6LODkoreibFRxWE6cfZ+UgEf9zeiNotxQCgDaVk2zOiUtrLI0+KqFNTp1sMaQqDRzT/WJuMKdzWyDcmswfjeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c3b1rWZ2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733435765; x=1764971765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WMf0tEohi52SxL4e8/4FzjGFk9lGLF3Ynw1IqIL8BJY=;
  b=c3b1rWZ2ki4H/K/aj5yQUhW96HZHYHYq8nmbGoG68e8GpZAUgULZFMSw
   QPHiOO3Uzx2538wTZx8t/1OO7WRSVDYqHjIqHKRZLwdaypgKT6LCoudar
   XXHAsbAt2PTfBPFZNbQX1yT8VFu95xwHeqhxoQU9Zkh0yDJiRRbkh0oaz
   II1COufIKP77RwqvYyx3fXor/Z3C51ubYt7N59fP2wglxDvxdCFfZGQQl
   7c63gCOxjHfm/QTAA7kNAKN9g3bBrFIGROM3I9YzBtRtWYyfvMalB7mPW
   0oM9OehwWnxHpHOD/j85U/7DPq5PNFwAOwGFwyXhUFWwXixtl+M1MFM4C
   Q==;
X-CSE-ConnectionGUID: qEzwGagmQKaLkMizppxC5w==
X-CSE-MsgGUID: ZE6PTL48TJaESVSxZ4PTrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="44800685"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="44800685"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 13:56:05 -0800
X-CSE-ConnectionGUID: rrlAPAv7TbqiCZleDbLfYQ==
X-CSE-MsgGUID: Tc4iiMmGRhSWYx+OrlcrgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="99266088"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Dec 2024 13:56:04 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJJpJ-0000Qd-1j;
	Thu, 05 Dec 2024 21:56:01 +0000
Date: Fri, 6 Dec 2024 05:55:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [openeuler:openEuler-1.0-LTS 1324/1324]
 drivers/media/dvb-frontends/mn88443x.c:772:34: warning: unused variable
 'mn88443x_of_match'
Message-ID: <202412060518.kosCJlfK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e416567e80778667f6a949f0f19c32a3ee4cb06e
commit: 0f408ce8941fcb1b6e8431272cfc9337a0407d73 [1324/1324] media: dvb-frontends: add Socionext MN88443x ISDB-S/T demodulator driver
config: x86_64-buildonly-randconfig-006-20241206 (https://download.01.org/0day-ci/archive/20241206/202412060518.kosCJlfK-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412060518.kosCJlfK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412060518.kosCJlfK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/dvb-frontends/mn88443x.c:772:34: warning: unused variable 'mn88443x_of_match' [-Wunused-const-variable]
     772 | static const struct of_device_id mn88443x_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/mn88443x_of_match +772 drivers/media/dvb-frontends/mn88443x.c

   771	
 > 772	static const struct of_device_id mn88443x_of_match[] = {
   773		{ .compatible = "socionext,mn884433",   .data = &mn88443x_spec_pri, },
   774		{ .compatible = "socionext,mn884434-0", .data = &mn88443x_spec_pri, },
   775		{ .compatible = "socionext,mn884434-1", .data = &mn88443x_spec_sec, },
   776		{}
   777	};
   778	MODULE_DEVICE_TABLE(of, mn88443x_of_match);
   779	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

