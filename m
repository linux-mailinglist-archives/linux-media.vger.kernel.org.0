Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0977576725E
	for <lists+linux-media@lfdr.de>; Fri, 28 Jul 2023 18:49:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232365AbjG1Qtr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jul 2023 12:49:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231578AbjG1Qt0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jul 2023 12:49:26 -0400
Received: from mgamail.intel.com (unknown [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA9FD4C1F
        for <linux-media@vger.kernel.org>; Fri, 28 Jul 2023 09:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690562873; x=1722098873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mseWZlNtJGRrbvOrNZCSIZzeAppJMxwlXbNI4EI0PqM=;
  b=B16j76ERxl0VZg7ZcI8m4hU2gMh349wickZzei6MiG45Tf5SdvXxJUg8
   EqAKfgKYsSJ5WmUwZTtzJ2a4tsDPIjqHq3ZPrqvUnbmJqeHvquhDntNNG
   A0uyIxq22prX8lOvrPu8LV4T+YDGMLixQR6OOKXVT1fxB8CzG2ejTKMgA
   q/m+q4xtppAVZlsjoac32D1sKC2JoyxmgRl6C9pImMHN9sJ6Yu8izgRYW
   PE86snsT2VYmhaNdcGxZYv2ym8DTSoWSxFoNB0IeoJtzYzh9QRn4dnavK
   oKzV4laQlpfko/nBn3aZLRu1t596UDNBNrS9tGVHDHpCe7dDM6t9DoFeV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="372258683"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="372258683"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 09:44:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="841378018"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="841378018"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 28 Jul 2023 09:44:26 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qPQZc-0003OF-2b;
        Fri, 28 Jul 2023 16:44:25 +0000
Date:   Sat, 29 Jul 2023 00:44:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [sailus-media-tree:master 10/20] ld.lld: error: undefined symbol:
 devm_cci_regmap_init_i2c
Message-ID: <202307290010.Xjbdp5kg-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   git://linuxtv.org/sailus/media_tree.git master
head:   78b5f6f940f213e4139b0c8dbd1499a564f1ea89
commit: 1bb2f576bc647eff694047bb03b52998221657a6 [10/20] media: imx290: Convert to new CCI register access helpers
config: i386-randconfig-i012-20230728 (https://download.01.org/0day-ci/archive/20230729/202307290010.Xjbdp5kg-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307290010.Xjbdp5kg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307290010.Xjbdp5kg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_cci_regmap_init_i2c
   >>> referenced by imx290.c:1526 (drivers/media/i2c/imx290.c:1526)
   >>>               drivers/media/i2c/imx290.o:(imx290_probe) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: cci_multi_reg_write
   >>> referenced by imx290.c:614 (drivers/media/i2c/imx290.c:614)
   >>>               drivers/media/i2c/imx290.o:(imx290_set_stream) in archive vmlinux.a
   >>> referenced by imx290.c:614 (drivers/media/i2c/imx290.c:614)
   >>>               drivers/media/i2c/imx290.o:(imx290_set_stream) in archive vmlinux.a
   >>> referenced by imx290.c:614 (drivers/media/i2c/imx290.c:614)
   >>>               drivers/media/i2c/imx290.o:(imx290_set_stream) in archive vmlinux.a
   >>> referenced 2 more times
--
>> ld.lld: error: undefined symbol: cci_write
   >>> referenced by imx290.c:634 (drivers/media/i2c/imx290.c:634)
   >>>               drivers/media/i2c/imx290.o:(imx290_set_stream) in archive vmlinux.a
   >>> referenced by imx290.c:635 (drivers/media/i2c/imx290.c:635)
   >>>               drivers/media/i2c/imx290.o:(imx290_set_stream) in archive vmlinux.a
   >>> referenced by imx290.c:636 (drivers/media/i2c/imx290.c:636)
   >>>               drivers/media/i2c/imx290.o:(imx290_set_stream) in archive vmlinux.a
   >>> referenced 24 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
