Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 074DB4D46B2
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 13:20:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236822AbiCJMVP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 07:21:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233962AbiCJMVO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 07:21:14 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17B5E113D9E;
        Thu, 10 Mar 2022 04:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646914814; x=1678450814;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MWzcKCvUVuRUQ4LggPBE4UJ4remTjQgwraawsnkx+i8=;
  b=XnDA5j/tjFlxHB7mvJhRWLhChESTBOToRD2a0X8RscPbK0oA25KG/ACR
   +FP1UNZhava0kGA0R8uu75aI6tkGVsVOlpZiWjbkrmjp18KUkDPpPo+4Q
   /SWLKJ8kvK1R6qmWP5I3JMGLjxRikgKjXICHtrTrqywNXfPg+gLh6MA+t
   AhgRiVg6d0va2+nKQ9g57vWKyMq+VqObk/ctkeVr2ZrFpuiaJnBTA3lIf
   Pc1LV/+NW0QKAotx/87MyxrZBrHFJ278QHHBMM5OxZgS3HJxyc/P1rUnE
   RXOUh8/r1Gft7/PQFian5Tvhn4PpNT69qyv3536PiXIn55R7vNgLe0II1
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="341663978"
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; 
   d="scan'208";a="341663978"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2022 04:20:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; 
   d="scan'208";a="644425702"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 10 Mar 2022 04:20:11 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nSHm7-0004up-0F; Thu, 10 Mar 2022 12:20:11 +0000
Date:   Thu, 10 Mar 2022 20:19:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Petko Manolov <petko.manolov@konsulko.com>,
        linux-media@vger.kernel.org
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org, sakari.ailus@iki.fi,
        devicetree@vger.kernel.org,
        Petko Manolov <petko.manolov@konsulko.com>
Subject: Re: [PATCH v5 1/2] media: ovm6211: Adds support for OVM6211
Message-ID: <202203102030.LBUi85M1-lkp@intel.com>
References: <20220309102215.891001-2-petko.manolov@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220309102215.891001-2-petko.manolov@konsulko.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Petko,

I love your patch! Perhaps something to improve:

[auto build test WARNING on 2b891d3980f6c255459d0e1c29ce2152ec7cf678]

url:    https://github.com/0day-ci/linux/commits/Petko-Manolov/media-ovm6211-Adds-support-for-OVM6211/20220309-182333
base:   2b891d3980f6c255459d0e1c29ce2152ec7cf678
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20220310/202203102030.LBUi85M1-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/4894c38df725fcab9dc9ac03d8cffa97971279b7
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Petko-Manolov/media-ovm6211-Adds-support-for-OVM6211/20220309-182333
        git checkout 4894c38df725fcab9dc9ac03d8cffa97971279b7
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/media/i2c/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/ovm6211.c:993:35: warning: unused variable 'ovm6211_id' [-Wunused-const-variable]
   static const struct i2c_device_id ovm6211_id[] = {
                                     ^
   1 warning generated.


vim +/ovm6211_id +993 drivers/media/i2c/ovm6211.c

   992	
 > 993	static const struct i2c_device_id ovm6211_id[] = {
   994		{ "ovm6211", 0 },
   995		{},
   996	};
   997	MODULE_DEVICE_TABLE(i2c, ovm6211_id);
   998	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
