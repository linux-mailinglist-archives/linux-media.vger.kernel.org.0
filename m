Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B6CF49B1F4
	for <lists+linux-media@lfdr.de>; Tue, 25 Jan 2022 11:45:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358122AbiAYKco (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jan 2022 05:32:44 -0500
Received: from mga05.intel.com ([192.55.52.43]:10127 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1355727AbiAYK3I (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jan 2022 05:29:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643106543; x=1674642543;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2R3DZV36aiJGj6333DSl6IxQRf+LOmclIxRWAZb98Po=;
  b=DgOgXnGKAhdbBAptTJICK3ZiJyv0t9/CoMGv7u8asINAK2/buzGzV1Iz
   AM1P27ThpFYE0GoJaNedPn/0ZMm+9QlnrtvMDgvcQSl3ecvabYa31Uwkn
   fPPpd1BIynEnHBOAIw1hhW9bZSMrmVFbhasKDWdpMscdzcGgHy6RNvjcV
   hsi0gujXcfEkbUjbtmZkn+Xqe4V5Yhsovw92OJqeyTnAYMecSoHmmtyOc
   y95d2XzZ20wLwoimrINFOWMOLpJCMwf8vUx1V7CJYF7Yl6e/yCev9YK3X
   PXfIi49NrIsySnfiD7yWQl+rpPVFb3lSstsKoCazDsohynw9YIFzMCneK
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="332626146"
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; 
   d="scan'208";a="332626146"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2022 02:23:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; 
   d="scan'208";a="580708360"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 25 Jan 2022 02:23:37 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nCIzA-000Jjq-Ab; Tue, 25 Jan 2022 10:23:36 +0000
Date:   Tue, 25 Jan 2022 18:22:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Ming Qian <ming.qian@nxp.com>, mchehab@kernel.org,
        shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de
Cc:     kbuild-all@lists.01.org, hverkuil-cisco@xs4all.nl,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        aisheng.dong@nxp.com, linux-media@vger.kernel.org
Subject: Re: [PATCH v15 05/13] media: amphion: implement vpu core
 communication based on mailbox
Message-ID: <202201251843.dnXV2QBt-lkp@intel.com>
References: <e79fdc909c88773516ef875bc07039af534ff182.1643077283.git.ming.qian@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e79fdc909c88773516ef875bc07039af534ff182.1643077283.git.ming.qian@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ming,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on e783362eb54cd99b2cac8b3a9aeac942e6f6ac07]

url:    https://github.com/0day-ci/linux/commits/Ming-Qian/amphion-video-decoder-encoder-driver/20220125-152112
base:   e783362eb54cd99b2cac8b3a9aeac942e6f6ac07
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20220125/202201251843.dnXV2QBt-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/0c5b974ccd2c9ad228d908facc5c73e93c750600
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Ming-Qian/amphion-video-decoder-encoder-driver/20220125-152112
        git checkout 0c5b974ccd2c9ad228d908facc5c73e93c750600
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=alpha SHELL=/bin/bash drivers/media/platform/amphion/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/media/platform/amphion/vpu_core.c: In function 'vpu_core_register':
   drivers/media/platform/amphion/vpu_core.c:246:28: error: implicit declaration of function 'vzalloc'; did you mean 'kvzalloc'? [-Werror=implicit-function-declaration]
     246 |         core->msg_buffer = vzalloc(core->msg_buffer_size);
         |                            ^~~~~~~
         |                            kvzalloc
>> drivers/media/platform/amphion/vpu_core.c:246:26: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     246 |         core->msg_buffer = vzalloc(core->msg_buffer_size);
         |                          ^
   drivers/media/platform/amphion/vpu_core.c:270:17: error: implicit declaration of function 'vfree'; did you mean 'kvfree'? [-Werror=implicit-function-declaration]
     270 |                 vfree(core->msg_buffer);
         |                 ^~~~~
         |                 kvfree
   cc1: some warnings being treated as errors


vim +246 drivers/media/platform/amphion/vpu_core.c

78cda8a2c04ed7f Ming Qian 2022-01-25  228  
78cda8a2c04ed7f Ming Qian 2022-01-25  229  static int vpu_core_register(struct device *dev, struct vpu_core *core)
78cda8a2c04ed7f Ming Qian 2022-01-25  230  {
78cda8a2c04ed7f Ming Qian 2022-01-25  231  	struct vpu_dev *vpu = dev_get_drvdata(dev);
78cda8a2c04ed7f Ming Qian 2022-01-25  232  	int ret = 0;
78cda8a2c04ed7f Ming Qian 2022-01-25  233  
78cda8a2c04ed7f Ming Qian 2022-01-25  234  	dev_dbg(core->dev, "register core %s\n", vpu_core_type_desc(core->type));
78cda8a2c04ed7f Ming Qian 2022-01-25  235  	if (vpu_core_is_exist(vpu, core))
78cda8a2c04ed7f Ming Qian 2022-01-25  236  		return 0;
78cda8a2c04ed7f Ming Qian 2022-01-25  237  
78cda8a2c04ed7f Ming Qian 2022-01-25  238  	core->workqueue = alloc_workqueue("vpu", WQ_UNBOUND | WQ_MEM_RECLAIM, 1);
78cda8a2c04ed7f Ming Qian 2022-01-25  239  	if (!core->workqueue) {
78cda8a2c04ed7f Ming Qian 2022-01-25  240  		dev_err(core->dev, "fail to alloc workqueue\n");
78cda8a2c04ed7f Ming Qian 2022-01-25  241  		return -ENOMEM;
78cda8a2c04ed7f Ming Qian 2022-01-25  242  	}
78cda8a2c04ed7f Ming Qian 2022-01-25  243  	INIT_WORK(&core->msg_work, vpu_msg_run_work);
78cda8a2c04ed7f Ming Qian 2022-01-25  244  	INIT_DELAYED_WORK(&core->msg_delayed_work, vpu_msg_delayed_work);
78cda8a2c04ed7f Ming Qian 2022-01-25  245  	core->msg_buffer_size = roundup_pow_of_two(VPU_MSG_BUFFER_SIZE);
78cda8a2c04ed7f Ming Qian 2022-01-25 @246  	core->msg_buffer = vzalloc(core->msg_buffer_size);
78cda8a2c04ed7f Ming Qian 2022-01-25  247  	if (!core->msg_buffer) {
78cda8a2c04ed7f Ming Qian 2022-01-25  248  		dev_err(core->dev, "failed allocate buffer for fifo\n");
78cda8a2c04ed7f Ming Qian 2022-01-25  249  		ret = -ENOMEM;
78cda8a2c04ed7f Ming Qian 2022-01-25  250  		goto error;
78cda8a2c04ed7f Ming Qian 2022-01-25  251  	}
78cda8a2c04ed7f Ming Qian 2022-01-25  252  	ret = kfifo_init(&core->msg_fifo, core->msg_buffer, core->msg_buffer_size);
78cda8a2c04ed7f Ming Qian 2022-01-25  253  	if (ret) {
78cda8a2c04ed7f Ming Qian 2022-01-25  254  		dev_err(core->dev, "failed init kfifo\n");
78cda8a2c04ed7f Ming Qian 2022-01-25  255  		goto error;
78cda8a2c04ed7f Ming Qian 2022-01-25  256  	}
78cda8a2c04ed7f Ming Qian 2022-01-25  257  
78cda8a2c04ed7f Ming Qian 2022-01-25  258  	list_add_tail(&core->list, &vpu->cores);
78cda8a2c04ed7f Ming Qian 2022-01-25  259  
78cda8a2c04ed7f Ming Qian 2022-01-25  260  	vpu_core_get_vpu(core);
78cda8a2c04ed7f Ming Qian 2022-01-25  261  
78cda8a2c04ed7f Ming Qian 2022-01-25  262  	if (vpu_iface_get_power_state(core))
78cda8a2c04ed7f Ming Qian 2022-01-25  263  		ret = vpu_core_restore(core);
78cda8a2c04ed7f Ming Qian 2022-01-25  264  	if (ret)
78cda8a2c04ed7f Ming Qian 2022-01-25  265  		goto error;
78cda8a2c04ed7f Ming Qian 2022-01-25  266  
78cda8a2c04ed7f Ming Qian 2022-01-25  267  	return 0;
78cda8a2c04ed7f Ming Qian 2022-01-25  268  error:
78cda8a2c04ed7f Ming Qian 2022-01-25  269  	if (core->msg_buffer) {
78cda8a2c04ed7f Ming Qian 2022-01-25  270  		vfree(core->msg_buffer);
78cda8a2c04ed7f Ming Qian 2022-01-25  271  		core->msg_buffer = NULL;
78cda8a2c04ed7f Ming Qian 2022-01-25  272  	}
78cda8a2c04ed7f Ming Qian 2022-01-25  273  	if (core->workqueue) {
78cda8a2c04ed7f Ming Qian 2022-01-25  274  		destroy_workqueue(core->workqueue);
78cda8a2c04ed7f Ming Qian 2022-01-25  275  		core->workqueue = NULL;
78cda8a2c04ed7f Ming Qian 2022-01-25  276  	}
78cda8a2c04ed7f Ming Qian 2022-01-25  277  	return ret;
78cda8a2c04ed7f Ming Qian 2022-01-25  278  }
78cda8a2c04ed7f Ming Qian 2022-01-25  279  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
