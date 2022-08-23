Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8368359D04E
	for <lists+linux-media@lfdr.de>; Tue, 23 Aug 2022 07:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237427AbiHWFCd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Aug 2022 01:02:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234556AbiHWFCc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Aug 2022 01:02:32 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D18C05A2D7
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 22:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661230951; x=1692766951;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3KSo9GP/9eMLtto2eY51dH/5DtAkp8mcjSnn4UaRPXY=;
  b=E8EUi4tRfZOtOIokEYStsy7HmXpWp0A+VroaJtx1VzC5Se9Cm/0osNfG
   4TD+NTcKo5lKXs9f3V2GY5icexDwMWYRVi96+x4u2Y96q5KqJTdN3wjVm
   BEoVQGc+z2sTz+w4E5OD8rwVwcap19Wbn+yYAeCdPRO+7S3OpJwjfWcTO
   Mlfq+SRI/wYgqt7twi9oNukexIfwVcOPMZA6/APePpjFQrouujW53ZF4B
   WyLTER9QOu+W7rYNt0DZh7Yx3bAIrWDylE+rSrfrK/gOHwADPSxo612Ku
   AC1hF6VCXuy4Ezn4OyQ2hUwYh2ssDFhk6TYw4lvUqiogeUPt6sDjqNK86
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="293590075"
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; 
   d="scan'208";a="293590075"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2022 22:02:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; 
   d="scan'208";a="669859323"
Received: from lkp-server01.sh.intel.com (HELO dd9b29378baa) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 22 Aug 2022 22:02:30 -0700
Received: from kbuild by dd9b29378baa with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oQM3a-0001Cd-04;
        Tue, 23 Aug 2022 05:02:30 +0000
Date:   Tue, 23 Aug 2022 13:01:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     martin.tuma@digiteqautomotive.com, linux-media@vger.kernel.org
Cc:     kbuild-all@lists.01.org,
        Martin =?utf-8?B?VMWvbWE=?= <martin.tuma@digiteqautomotive.com>
Subject: Re: [PATCH 2/3] Added Xilinx PCIe DMA IP core driver
Message-ID: <202208231217.IH8F0Jow-lkp@intel.com>
References: <20220822194721.1238-3-martin.tuma@digiteqautomotive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220822194721.1238-3-martin.tuma@digiteqautomotive.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on vkoul-dmaengine/next linus/master v6.0-rc2 next-20220822]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/martin-tuma-digiteqautomotive-com/Digiteq-Automotive-MGB4-driver/20220823-015724
base:   git://linuxtv.org/media_tree.git master
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/178e549c877b1d8919b6559be1d09a264c7e176a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review martin-tuma-digiteqautomotive-com/Digiteq-Automotive-MGB4-driver/20220823-015724
        git checkout 178e549c877b1d8919b6559be1d09a264c7e176a
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Warning: drivers/dma/xilinx/xdma_core.c references a file that doesn't exist: Documentation/DMA-mapping.txt

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
