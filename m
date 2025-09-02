Return-Path: <linux-media+bounces-41596-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F841B40845
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 17:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5227B1B66AE5
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 14:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34873009EA;
	Tue,  2 Sep 2025 14:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lYUWFgUj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CE130EF7A
	for <linux-media@vger.kernel.org>; Tue,  2 Sep 2025 14:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756824976; cv=none; b=hkGn3U6Qq8lvRxsRazuhoEEAWa4YC/FIsv1bLFn/mdzIUh3r4i7Wy4+QLLI3L6QjEoL4Ng5Xx4vzP4dAPYN3JW/44fDP/r0EcAXtJ5XN6rCVExRu4ud81uQsF/8qSAtw+axfM9cgxCi0NBQ7O0IVGhJxPVSjU6w7gzy1tLX9+pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756824976; c=relaxed/simple;
	bh=qr5GJ5JPXH7dUytShZZTZKeTR7YJk/ZWJ1lrfaTaEoo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ivDZhs9mgamTxQB8MNynEB0Bk/NZ2ixiQRAENWdG04LICPa929rPr074xEusfYBTRA/rShB1O9uqE3nYarB8V9P9DhnzEB7FMmxBpv+uctpoo0iDZWiKPZrQ+L+FkJk7CbWFaCw9NpiFujd5LEEBHUBbW0cN55KUVVKDqa1nz9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lYUWFgUj; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756824974; x=1788360974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qr5GJ5JPXH7dUytShZZTZKeTR7YJk/ZWJ1lrfaTaEoo=;
  b=lYUWFgUjU7Qvn2bcR56r7vuGbfzFaqChjdfH/Amcbaecr15vYNrWMsTx
   DHdGfMRDLB5MTyKeToTmQADwlkZTV9TC1T7cPlIcSNqiCtj5/UOw9dN1t
   1bv0XSrQZSovPaf9dYo8Un2d06nIzr50L1C0TwWvixPsuiCDEEECAE8ni
   5RJCNo7Q7XvVK77Fe9Ljag3D7kRm38EojMDwezObYowOOY7BHLNvEWKXg
   mzo2GxpJCPzySTSTGr+XYWkBFiTu+jS9POgFgZbN/iss4k8xbjZhl13Mb
   WxCA+ih6SXiQvK53PWq/f9BGPdnwxwe19idJf1SbBEuHvuY1uU63E0eTG
   A==;
X-CSE-ConnectionGUID: wraNU5xvRcispvsuKIdWfg==
X-CSE-MsgGUID: OGpvaCUkQsSDKLTVzBVOUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="62744967"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="62744967"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 07:56:14 -0700
X-CSE-ConnectionGUID: J3+7ywyOQb2r2IGlLz0PXQ==
X-CSE-MsgGUID: KMaQhmC0R+GAuAxcgUXVmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="202246400"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 02 Sep 2025 07:56:13 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utSQc-0002e2-2M;
	Tue, 02 Sep 2025 14:56:10 +0000
Date: Tue, 2 Sep 2025 22:52:30 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 77/77] Warning:
 drivers/media/v4l2-core/v4l2-subdev.c:51 struct member 'streaming' not
 described in 'v4l2_subdev_stream_config'
Message-ID: <202509022246.qxiTeQrS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   dbb6c78ee163822abba87ee352b67b7cfec3a023
commit: dbb6c78ee163822abba87ee352b67b7cfec3a023 [77/77] count them
config: i386-buildonly-randconfig-003-20250902 (https://download.01.org/0day-ci/archive/20250902/202509022246.qxiTeQrS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509022246.qxiTeQrS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509022246.qxiTeQrS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/media/v4l2-core/v4l2-subdev.c:51 struct member 'streaming' not described in 'v4l2_subdev_stream_config'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

