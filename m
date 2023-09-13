Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80E9D79DD57
	for <lists+linux-media@lfdr.de>; Wed, 13 Sep 2023 03:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233532AbjIMBDZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Sep 2023 21:03:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjIMBDY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Sep 2023 21:03:24 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFBDEC3
        for <linux-media@vger.kernel.org>; Tue, 12 Sep 2023 18:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694567000; x=1726103000;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e5BXdJPwcd/vIMgFc5nzRVqTN17OjXkuhh42cC3Wpa4=;
  b=UZ/pJZ3ttyOiClunIDXXO9XO18f/fcLEJ+tmedsGz2ffdY2dzx4ZoiAr
   ngrpViW2a0kM/J4PcXeOAf4NtaD+jo/HwPiMAtaJm64k9xwz1eBSBlJco
   qlKg3eSMxoNZyoAYVRhKWdposOqSAepyRrIq2LR4cvP4Gce7LG/rKX3s+
   2BJZoA+H8rfEZV/NURWt1r4uYW8thmkAozY8DA+MBkDiiVg/oDb28vxRK
   jqcVeLzfmMTdI4yvwyKR2AIOuyMnhssYB4FhSmaMav2PD7A30Btc8Yoxi
   dtJ1J36N3uCH7WXAKFS2ktcmU1W1w5PQxNzU1xJdjDvCn1ZYh/cOPnk5+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="442562620"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="442562620"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 18:03:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="859045473"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="859045473"
Received: from lkp-server02.sh.intel.com (HELO 47e905db7d2b) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 12 Sep 2023 18:03:19 -0700
Received: from kbuild by 47e905db7d2b with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qgEHl-0000Xl-0Q;
        Wed, 13 Sep 2023 01:03:17 +0000
Date:   Wed, 13 Sep 2023 09:02:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 18/24]
 drivers/media/i2c/ccs/ccs-core.c:2059:1: warning: 'static' is not at
 beginning of declaration
Message-ID: <202309130842.vMagrOma-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   677e6a2139a965fa6eee306d4b015a95b427ef34
commit: 1cba6f4ce24282a593d6121260660c112739a063 [18/24] media: ccs: Add support for embedded data stream
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230913/202309130842.vMagrOma-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309130842.vMagrOma-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309130842.vMagrOma-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/ccs/ccs-core.c:2059:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    2059 | } static const ccs_embedded_codes[] = {
         | ^


vim +/static +2059 drivers/media/i2c/ccs/ccs-core.c

  2043	
  2044	#define CCS_EMBEDDED_CODE_DEPTH(depth, half_depth)			\
  2045		depth,								\
  2046		CCS_EMB_DATA_CAPABILITY_TWO_BYTES_PER_RAW##depth,		\
  2047		CCS_EMB_DATA_CAPABILITY_NO_ONE_BYTE_PER_RAW##depth,		\
  2048		CCS_EMB_DATA_CTRL_RAW##half_depth##_PACKING_FOR_RAW##depth,	\
  2049		MEDIA_BUS_FMT_CCS_EMBEDDED_##half_depth,			\
  2050		MEDIA_BUS_FMT_CCS_EMBEDDED_##depth,				\
  2051	
  2052	struct ccs_embedded_code {
  2053		u8 depth;
  2054		u8 cap_two_bytes_per_sample;
  2055		u8 cap_no_legacy;
  2056		u8 ctrl;
  2057		u32 ccs_code_two_bytes;
  2058		u32 ccs_code_legacy;
> 2059	} static const ccs_embedded_codes[] = {
  2060		{ CCS_EMBEDDED_CODE_DEPTH(16, 8) },
  2061		{ CCS_EMBEDDED_CODE_DEPTH(20, 10) },
  2062		{ CCS_EMBEDDED_CODE_DEPTH(24, 12) },
  2063	};
  2064	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
