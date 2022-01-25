Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63FDF49B40A
	for <lists+linux-media@lfdr.de>; Tue, 25 Jan 2022 13:34:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1451857AbiAYMd6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jan 2022 07:33:58 -0500
Received: from mga11.intel.com ([192.55.52.93]:54124 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348902AbiAYMai (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jan 2022 07:30:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643113837; x=1674649837;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AfTgs4UK3Xxs1r6TlRje9Ay3gSLv0PUzAabnTnYpScw=;
  b=koMQDKMW3gdIIqi7iK+39zVYcJnVscAyQgskFNCiavYFLDMdllqn/78/
   JpqoNF3qAzD9zRJ6LYV1VGpgXcXTYpg0YZKcgnvG1UyQCC1ilMn67ISip
   Hqa9uBMQq8hwyjHRyhvQFxDBkH6Xhz57UZIKO1t5oVimVUg6T2S4bgG6s
   gaWSO/PFBX1hfDq+ssOxKd0jqro7ydVykO2BKgOAjew0Poj/JGKlMWRzk
   IWpqtsP0VfiNzv5TdXQaaI1VAa6twhBB36h5wbMglhresTGTadjaFHiLx
   Veybkv0QNQt0IYp3WBFDdXjCS+eNc1dlIJkO+ta9a0VhWUOVYq3NvpJPd
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="243887684"
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; 
   d="scan'208";a="243887684"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2022 04:29:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; 
   d="scan'208";a="477089586"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 25 Jan 2022 04:29:53 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nCKxM-000JsN-N8; Tue, 25 Jan 2022 12:29:52 +0000
Date:   Tue, 25 Jan 2022 20:29:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Ming Qian <ming.qian@nxp.com>, mchehab@kernel.org,
        shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de
Cc:     kbuild-all@lists.01.org, hverkuil-cisco@xs4all.nl,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        aisheng.dong@nxp.com, linux-media@vger.kernel.org
Subject: Re: [PATCH v15 08/13] media: amphion: add v4l2 m2m vpu decoder
 stateful driver
Message-ID: <202201252054.hseJFdV8-lkp@intel.com>
References: <33db5d6269e6e85820062cfe81eb0fcededd96cc.1643077283.git.ming.qian@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33db5d6269e6e85820062cfe81eb0fcededd96cc.1643077283.git.ming.qian@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ming,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on e783362eb54cd99b2cac8b3a9aeac942e6f6ac07]

url:    https://github.com/0day-ci/linux/commits/Ming-Qian/amphion-video-decoder-encoder-driver/20220125-152112
base:   e783362eb54cd99b2cac8b3a9aeac942e6f6ac07
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20220125/202201252054.hseJFdV8-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/26fe84b0a51bd240210f39bfc5a2ed1c57ce8be0
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Ming-Qian/amphion-video-decoder-encoder-driver/20220125-152112
        git checkout 26fe84b0a51bd240210f39bfc5a2ed1c57ce8be0
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=alpha SHELL=/bin/bash drivers/media/platform/amphion/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/media/platform/amphion/vdec.c: In function 'vdec_cleanup':
   drivers/media/platform/amphion/vdec.c:1383:17: error: implicit declaration of function 'vfree'; did you mean 'kvfree'? [-Werror=implicit-function-declaration]
    1383 |                 vfree(vdec);
         |                 ^~~~~
         |                 kvfree
   drivers/media/platform/amphion/vdec.c: In function 'vdec_open':
   drivers/media/platform/amphion/vdec.c:1632:16: error: implicit declaration of function 'vzalloc'; did you mean 'kvzalloc'? [-Werror=implicit-function-declaration]
    1632 |         inst = vzalloc(sizeof(*inst));
         |                ^~~~~~~
         |                kvzalloc
>> drivers/media/platform/amphion/vdec.c:1632:14: warning: assignment to 'struct vpu_inst *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1632 |         inst = vzalloc(sizeof(*inst));
         |              ^
>> drivers/media/platform/amphion/vdec.c:1636:14: warning: assignment to 'struct vdec_t *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1636 |         vdec = vzalloc(sizeof(*vdec));
         |              ^
   cc1: some warnings being treated as errors


vim +1632 drivers/media/platform/amphion/vdec.c

  1625	
  1626	static int vdec_open(struct file *file)
  1627	{
  1628		struct vpu_inst *inst;
  1629		struct vdec_t *vdec;
  1630		int ret;
  1631	
> 1632		inst = vzalloc(sizeof(*inst));
  1633		if (!inst)
  1634			return -ENOMEM;
  1635	
> 1636		vdec = vzalloc(sizeof(*vdec));
  1637		if (!vdec) {
  1638			vfree(inst);
  1639			return -ENOMEM;
  1640		}
  1641	
  1642		inst->ops = &vdec_inst_ops;
  1643		inst->formats = vdec_formats;
  1644		inst->type = VPU_CORE_TYPE_DEC;
  1645		inst->priv = vdec;
  1646	
  1647		ret = vpu_v4l2_open(file, inst);
  1648		if (ret)
  1649			return ret;
  1650	
  1651		vdec->fixed_fmt = false;
  1652		inst->min_buffer_cap = VDEC_MIN_BUFFER_CAP;
  1653		vdec_init(file);
  1654	
  1655		return 0;
  1656	}
  1657	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
