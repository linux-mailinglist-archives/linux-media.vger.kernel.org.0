Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FD803E5302
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 07:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236374AbhHJFnb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 01:43:31 -0400
Received: from mga07.intel.com ([134.134.136.100]:41475 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234808AbhHJFnb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 01:43:31 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="278587781"
X-IronPort-AV: E=Sophos;i="5.84,309,1620716400"; 
   d="scan'208";a="278587781"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 22:43:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,309,1620716400"; 
   d="scan'208";a="671550992"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 09 Aug 2021 22:43:07 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mDKXa-000KFj-Op; Tue, 10 Aug 2021 05:43:06 +0000
Date:   Tue, 10 Aug 2021 13:42:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [linux-next:master 5146/6223]
 drivers/media/platform/rcar-vin/rcar-core.c:220:18: warning: Same value in
 both branches of ternary operator. [duplicateValueTernary]
Message-ID: <202108101353.VuDfxbHo-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   da454ebf578f6c542ba9f5b3ddb98db3ede109c1
commit: 0c56f9597adc870e6761822668868fe2930f08bd [5146/6223] media: rcar-vin: Add r8a779a0 support
compiler: riscv64-linux-gcc (GCC) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> drivers/media/platform/rcar-vin/rcar-core.c:220:18: warning: Same value in both branches of ternary operator. [duplicateValueTernary]
    for (i = 0; i < RVIN_REMOTES_MAX; i++)
                    ^

vim +220 drivers/media/platform/rcar-vin/rcar-core.c

3bb4c3bc85bf77 Niklas Söderlund 2018-04-14  210  
87932605cce9cd Niklas Söderlund 2021-07-09  211  /* group lock should be held when calling this function. */
87932605cce9cd Niklas Söderlund 2021-07-09  212  static int rvin_group_entity_to_remote_id(struct rvin_group *group,
87932605cce9cd Niklas Söderlund 2021-07-09  213  					  struct media_entity *entity)
87932605cce9cd Niklas Söderlund 2021-07-09  214  {
87932605cce9cd Niklas Söderlund 2021-07-09  215  	struct v4l2_subdev *sd;
87932605cce9cd Niklas Söderlund 2021-07-09  216  	unsigned int i;
87932605cce9cd Niklas Söderlund 2021-07-09  217  
87932605cce9cd Niklas Söderlund 2021-07-09  218  	sd = media_entity_to_v4l2_subdev(entity);
87932605cce9cd Niklas Söderlund 2021-07-09  219  
87932605cce9cd Niklas Söderlund 2021-07-09 @220  	for (i = 0; i < RVIN_REMOTES_MAX; i++)
87932605cce9cd Niklas Söderlund 2021-07-09  221  		if (group->remotes[i].subdev == sd)
87932605cce9cd Niklas Söderlund 2021-07-09  222  			return i;
87932605cce9cd Niklas Söderlund 2021-07-09  223  
87932605cce9cd Niklas Söderlund 2021-07-09  224  	return -ENODEV;
87932605cce9cd Niklas Söderlund 2021-07-09  225  }
87932605cce9cd Niklas Söderlund 2021-07-09  226  

:::::: The code at line 220 was first introduced by commit
:::::: 87932605cce9cd2a7c986abcbf73666855a2ebc7 media: rcar-vin: Move and rename CSI-2 link notifications

:::::: TO: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
