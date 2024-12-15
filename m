Return-Path: <linux-media+bounces-23428-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFF29F237A
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 12:34:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB6341885CDC
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 11:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5A5156231;
	Sun, 15 Dec 2024 11:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gydJdPFI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0DB1E492;
	Sun, 15 Dec 2024 11:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734262475; cv=none; b=gw8bTwl7zDIhrxzvgQnpXm2118P6xulQM3/O9aha83zJWZM41IZLlCwp36RQxcNw2WZz25IqGtd0XqPYcoWgRfM5Kc6UGK3adlmXOLbx4K1GhVYa9lNs31CCKX+GwDHQ7IerP6oCGxiW5gCEWGi4nKabxhg5N0O7lM6yK1xwTM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734262475; c=relaxed/simple;
	bh=QlZ7dlbPppbHfRwXJMn8PVLcYyVkTt0U8E+MbByJ44A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JcPskW3toXtmsX7FRpSl8JoJDrJ9Evv1kQMdqNmPaHR22eiyz4FDQZp6Tyu31RndTil5/pDc97tCZpcPmfdLhxCSjWfTeaUlyoARHy/YFimWy54xGh6FxoJHiFEHS8b7XMlcf39E2hayBqzwXaPWEuonmzjIF70th6zS2TOZECk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gydJdPFI; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734262474; x=1765798474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QlZ7dlbPppbHfRwXJMn8PVLcYyVkTt0U8E+MbByJ44A=;
  b=gydJdPFIlFvKOHLHmb4k8D8i5jKgaVWnzRto+ZvZZkyIsaWO0m40MC1L
   l1af0NFuDWiKiGEagQMT9+j84LcRZUaIH1MvqFyB6khwBtuFneX1qx1wt
   hz0l4ymC/pCFBhs7B5Z4VCVJYv5dqDm4TP5xg37RMJVW1fq0+19NkaFXY
   Q/8pITMoVlMIi4mPfVoNJLJMtstCovBdB8ybNLb7uW8SmZrVxwv1LHxEw
   3lnrc6aE2pKsnLaftHMlCM9aCSP+h8aDjEdxWn2+nbV4harSijU+mVKw0
   OKPFw+wBbONv/X+JAoMNkaD29NwHpVWpnzK32IC0a2rTT6ehLhgbMK5y0
   A==;
X-CSE-ConnectionGUID: PTVeBNKGQqCZ1jQw+Z59eA==
X-CSE-MsgGUID: p22heXbPSnOH7smUqXARLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="45265064"
X-IronPort-AV: E=Sophos;i="6.12,236,1728975600"; 
   d="scan'208";a="45265064"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 03:34:33 -0800
X-CSE-ConnectionGUID: hyL9W2oIQtKJGQGsMaYmYw==
X-CSE-MsgGUID: kwK7BQKEQ3qTRPkEmGDbdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101524644"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 Dec 2024 03:34:31 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMmtJ-000DaU-17;
	Sun, 15 Dec 2024 11:34:29 +0000
Date: Sun, 15 Dec 2024 19:34:16 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: lib/hweight.c:14: warning: expecting prototype for hweightN().
 Prototype was for __sw_hweight32() instead
Message-ID: <202412151922.P70dxEDk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mauro,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2d8308bf5b67dff50262d8a9260a50113b3628c6
commit: 52042e2db45290f6a512d525518488b7bf143531 scripts: kernel-doc: validate kernel-doc markup with the actual names
date:   3 years, 11 months ago
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20241215/202412151922.P70dxEDk-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412151922.P70dxEDk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412151922.P70dxEDk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/hweight.c:14: warning: Function parameter or member 'w' not described in '__sw_hweight32'
>> lib/hweight.c:14: warning: expecting prototype for hweightN(). Prototype was for __sw_hweight32() instead


vim +14 lib/hweight.c

3b9ed1a5d2d121f Akinobu Mita    2006-03-26   5  
3b9ed1a5d2d121f Akinobu Mita    2006-03-26   6  /**
3b9ed1a5d2d121f Akinobu Mita    2006-03-26   7   * hweightN - returns the hamming weight of a N-bit word
3b9ed1a5d2d121f Akinobu Mita    2006-03-26   8   * @x: the word to weigh
3b9ed1a5d2d121f Akinobu Mita    2006-03-26   9   *
3b9ed1a5d2d121f Akinobu Mita    2006-03-26  10   * The Hamming Weight of a number is the total number of bits set in it.
3b9ed1a5d2d121f Akinobu Mita    2006-03-26  11   */
3b9ed1a5d2d121f Akinobu Mita    2006-03-26  12  
d61931d89be5063 Borislav Petkov 2010-03-05  13  unsigned int __sw_hweight32(unsigned int w)
3b9ed1a5d2d121f Akinobu Mita    2006-03-26 @14  {
72d931046030beb Linus Torvalds  2014-09-13  15  #ifdef CONFIG_ARCH_HAS_FAST_MULTIPLIER
39d997b514e12d5 Akinobu Mita    2009-12-21  16  	w -= (w >> 1) & 0x55555555;
39d997b514e12d5 Akinobu Mita    2009-12-21  17  	w =  (w & 0x33333333) + ((w >> 2) & 0x33333333);
39d997b514e12d5 Akinobu Mita    2009-12-21  18  	w =  (w + (w >> 4)) & 0x0f0f0f0f;
39d997b514e12d5 Akinobu Mita    2009-12-21  19  	return (w * 0x01010101) >> 24;
39d997b514e12d5 Akinobu Mita    2009-12-21  20  #else
f9b4192923fa6e3 Akinobu Mita    2006-03-26  21  	unsigned int res = w - ((w >> 1) & 0x55555555);
3b9ed1a5d2d121f Akinobu Mita    2006-03-26  22  	res = (res & 0x33333333) + ((res >> 2) & 0x33333333);
f9b4192923fa6e3 Akinobu Mita    2006-03-26  23  	res = (res + (res >> 4)) & 0x0F0F0F0F;
f9b4192923fa6e3 Akinobu Mita    2006-03-26  24  	res = res + (res >> 8);
f9b4192923fa6e3 Akinobu Mita    2006-03-26  25  	return (res + (res >> 16)) & 0x000000FF;
39d997b514e12d5 Akinobu Mita    2009-12-21  26  #endif
3b9ed1a5d2d121f Akinobu Mita    2006-03-26  27  }
d61931d89be5063 Borislav Petkov 2010-03-05  28  EXPORT_SYMBOL(__sw_hweight32);
3b9ed1a5d2d121f Akinobu Mita    2006-03-26  29  

:::::: The code at line 14 was first introduced by commit
:::::: 3b9ed1a5d2d121f32d2cb4f2b05f1fc57c99c946 [PATCH] bitops: generic hweight{64,32,16,8}()

:::::: TO: Akinobu Mita <mita@miraclelinux.com>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

