Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C72A04D9345
	for <lists+linux-media@lfdr.de>; Tue, 15 Mar 2022 05:19:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344758AbiCOEVB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Mar 2022 00:21:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344757AbiCOEVA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Mar 2022 00:21:00 -0400
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 064C612A9A
        for <linux-media@vger.kernel.org>; Mon, 14 Mar 2022 21:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647317989; x=1678853989;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sTo6PU9R8lKF+wt+TYuU6VTbgthWolvytxspI7I0grA=;
  b=StOLaeyEyjUwE3DrXbkUpb45x5zRfQMfTrC+VMRCf+5aK0sdaKhRHqeS
   mxT3a1GJzyIVRv7BexE+SL7uJYE7QRCF87AqRP3HG6F4r8GtAvlKDslI2
   hAN0jq9I2KGstiyXPRNtTW3qb2t8228yaGwZqFUyGoO8A2jmTo0EbH1wN
   pB7BN7hXd3cO+ULzcn3svjtRr77E0jci9dk0W3NGFSIat7V9hbTJBCgyX
   kxC4yNyFlWQ96hXLXg2PT3E2J+gcuqhpOIX9yaKPxZHxG1GWNcf9uWmSh
   gYtCkGsrHxrvSLsR+PuJQ+0HyFGD7cHCRSPAdNNDYxD1h7hTV34L5Ps54
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="316929161"
X-IronPort-AV: E=Sophos;i="5.90,182,1643702400"; 
   d="scan'208";a="316929161"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2022 21:19:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,182,1643702400"; 
   d="scan'208";a="512467514"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 14 Mar 2022 21:19:45 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nTyeu-000AXB-PA; Tue, 15 Mar 2022 04:19:44 +0000
Date:   Tue, 15 Mar 2022 12:18:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        krzysztof.kozlowski@canonical.com,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
        sakari.ailus@iki.fi, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 8/8] media: i2c: ov5670: Add .get_selection() support
Message-ID: <202203151238.pCKNarov-lkp@intel.com>
References: <20220314162714.153970-9-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220314162714.153970-9-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linus/master v5.17-rc8 next-20220310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jacopo-Mondi/media-i2c-ov5670-OF-support-runtime_pm-regulators/20220315-003034
base:   git://linuxtv.org/media_tree.git master
config: i386-randconfig-a012-20220314 (https://download.01.org/0day-ci/archive/20220315/202203151238.pCKNarov-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 3e4950d7fa78ac83f33bbf1658e2f49a73719236)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/c619a8eee6477517dfaa05511344d0bddc4e1c55
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jacopo-Mondi/media-i2c-ov5670-OF-support-runtime_pm-regulators/20220315-003034
        git checkout c619a8eee6477517dfaa05511344d0bddc4e1c55
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/media/i2c/ov5670.c:1787:18: error: initializer element is not a compile-time constant
                   .analog_crop = ov5670_analog_crop,
                                  ^~~~~~~~~~~~~~~~~~
   1 error generated.


vim +1787 drivers/media/i2c/ov5670.c

  1774	
  1775	/*
  1776	 * OV5670 sensor supports following resolutions with full FOV:
  1777	 * 4:3  ==> {2592x1944, 1296x972, 648x486}
  1778	 * 16:9 ==> {2560x1440, 1280x720, 640x360}
  1779	 */
  1780	static const struct ov5670_mode supported_modes[] = {
  1781		{
  1782			.width = 2592,
  1783			.height = 1944,
  1784			.vts_def = OV5670_VTS_30FPS,
  1785			.vts_min = OV5670_VTS_30FPS,
  1786			.link_freq_index = OV5670_LINK_FREQ_422MHZ_INDEX,
> 1787			.analog_crop = ov5670_analog_crop,
  1788			.reg_list = {
  1789				.num_of_regs = ARRAY_SIZE(mode_2592x1944_regs),
  1790				.regs = mode_2592x1944_regs,
  1791			},
  1792		},
  1793		{
  1794			.width = 1296,
  1795			.height = 972,
  1796			.vts_def = OV5670_VTS_30FPS,
  1797			.vts_min = 996,
  1798			.link_freq_index = OV5670_LINK_FREQ_422MHZ_INDEX,
  1799			.analog_crop = ov5670_analog_crop,
  1800			.reg_list = {
  1801				.num_of_regs = ARRAY_SIZE(mode_1296x972_regs),
  1802				.regs = mode_1296x972_regs,
  1803			},
  1804		},
  1805		{
  1806			.width = 648,
  1807			.height = 486,
  1808			.vts_def = OV5670_VTS_30FPS,
  1809			.vts_min = 516,
  1810			.link_freq_index = OV5670_LINK_FREQ_422MHZ_INDEX,
  1811			.analog_crop = ov5670_analog_crop,
  1812			.reg_list = {
  1813				.num_of_regs = ARRAY_SIZE(mode_648x486_regs),
  1814				.regs = mode_648x486_regs,
  1815			},
  1816		},
  1817		{
  1818			.width = 2560,
  1819			.height = 1440,
  1820			.vts_def = OV5670_VTS_30FPS,
  1821			.vts_min = OV5670_VTS_30FPS,
  1822			.link_freq_index = OV5670_LINK_FREQ_422MHZ_INDEX,
  1823			.analog_crop = ov5670_analog_crop,
  1824			.reg_list = {
  1825				.num_of_regs = ARRAY_SIZE(mode_2560x1440_regs),
  1826				.regs = mode_2560x1440_regs,
  1827			},
  1828		},
  1829		{
  1830			.width = 1280,
  1831			.height = 720,
  1832			.vts_def = OV5670_VTS_30FPS,
  1833			.vts_min = 1020,
  1834	
  1835			.link_freq_index = OV5670_LINK_FREQ_422MHZ_INDEX,
  1836			.analog_crop = ov5670_analog_crop,
  1837			.reg_list = {
  1838				.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
  1839				.regs = mode_1280x720_regs,
  1840			},
  1841		},
  1842		{
  1843			.width = 640,
  1844			.height = 360,
  1845			.vts_def = OV5670_VTS_30FPS,
  1846			.vts_min = 510,
  1847			.link_freq_index = OV5670_LINK_FREQ_422MHZ_INDEX,
  1848			.analog_crop = ov5670_analog_crop,
  1849			.reg_list = {
  1850				.num_of_regs = ARRAY_SIZE(mode_640x360_regs),
  1851				.regs = mode_640x360_regs,
  1852			},
  1853		}
  1854	};
  1855	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
