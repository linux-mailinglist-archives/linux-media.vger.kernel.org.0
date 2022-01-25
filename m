Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56DC249B338
	for <lists+linux-media@lfdr.de>; Tue, 25 Jan 2022 12:49:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356250AbiAYLqt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jan 2022 06:46:49 -0500
Received: from mga01.intel.com ([192.55.52.88]:23799 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1382426AbiAYLjC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jan 2022 06:39:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643110742; x=1674646742;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1crJBsNkMAG/0BQ4hPNjEd25TkNlOtaGQ1ACRmLhDzg=;
  b=nq2FNrbLWp481Y/HzgmacHDS57Fqzdz4hFy6y1O138/wuuqv5vaYsjOn
   GbuBWq48VOKoc/FtuPw68EbmuYaa1MeL9etz80LlKqo71cgNH8OAonNNR
   Kw6GtTqdVRaxWdoXTfXmU3h/o2klQZ7LlzfTO1cZRU/wVK2pv5ISBOu2v
   42mXuRc3JObQGZFH76OYBWENF7a8rqtqUUO9cWQpBBb2Q1gISyBXjCkg5
   hAmvxzAFHB42HGxHRmB62cyjXbZaa1Q1WAp3QpVumLEfr1en6cvv+KSak
   4q0xhVFm3393BbIDnxLMvQsdAmyT3X/yhZtpGJzwYANm1nfpYpyW4vJBV
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="270726208"
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; 
   d="scan'208";a="270726208"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2022 03:34:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; 
   d="scan'208";a="695804699"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 25 Jan 2022 03:34:51 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nCK67-000Jp6-2s; Tue, 25 Jan 2022 11:34:51 +0000
Date:   Tue, 25 Jan 2022 19:34:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Ming Qian <ming.qian@nxp.com>, mchehab@kernel.org,
        shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de
Cc:     kbuild-all@lists.01.org, hverkuil-cisco@xs4all.nl,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        aisheng.dong@nxp.com, linux-media@vger.kernel.org
Subject: Re: [PATCH v15 07/13] media: amphion: add v4l2 m2m vpu encoder
 stateful driver
Message-ID: <202201251914.xAqudfEM-lkp@intel.com>
References: <b42d02b6572468483da10acb41807df8ed7ff8cd.1643077283.git.ming.qian@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b42d02b6572468483da10acb41807df8ed7ff8cd.1643077283.git.ming.qian@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ming,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on e783362eb54cd99b2cac8b3a9aeac942e6f6ac07]

url:    https://github.com/0day-ci/linux/commits/Ming-Qian/amphion-video-decoder-encoder-driver/20220125-152112
base:   e783362eb54cd99b2cac8b3a9aeac942e6f6ac07
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20220125/202201251914.xAqudfEM-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/0d6244aad6fd7e7c377163865a29319cb2a6df84
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Ming-Qian/amphion-video-decoder-encoder-driver/20220125-152112
        git checkout 0d6244aad6fd7e7c377163865a29319cb2a6df84
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=alpha SHELL=/bin/bash drivers/media/platform/amphion/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/media/platform/amphion/venc.c: In function 'venc_get_encoded_frames':
   drivers/media/platform/amphion/venc.c:832:17: error: implicit declaration of function 'vfree'; did you mean 'kvfree'? [-Werror=implicit-function-declaration]
     832 |                 vfree(frame);
         |                 ^~~~~
         |                 kvfree
   drivers/media/platform/amphion/venc.c: In function 'venc_frame_encoded':
   drivers/media/platform/amphion/venc.c:848:17: error: implicit declaration of function 'vzalloc'; did you mean 'kvzalloc'? [-Werror=implicit-function-declaration]
     848 |         frame = vzalloc(sizeof(*frame));
         |                 ^~~~~~~
         |                 kvzalloc
>> drivers/media/platform/amphion/venc.c:848:15: warning: assignment to 'struct venc_frame_t *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     848 |         frame = vzalloc(sizeof(*frame));
         |               ^
   drivers/media/platform/amphion/venc.c: In function 'venc_open':
>> drivers/media/platform/amphion/venc.c:1321:14: warning: assignment to 'struct vpu_inst *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1321 |         inst = vzalloc(sizeof(*inst));
         |              ^
>> drivers/media/platform/amphion/venc.c:1325:14: warning: assignment to 'struct venc_t *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1325 |         venc = vzalloc(sizeof(*venc));
         |              ^
   cc1: some warnings being treated as errors


vim +848 drivers/media/platform/amphion/venc.c

   837	
   838	static int venc_frame_encoded(struct vpu_inst *inst, void *arg)
   839	{
   840		struct vpu_enc_pic_info *info = arg;
   841		struct venc_frame_t *frame;
   842		struct venc_t *venc;
   843		int ret = 0;
   844	
   845		if (!inst || !info)
   846			return -EINVAL;
   847		venc = inst->priv;
 > 848		frame = vzalloc(sizeof(*frame));
   849		if (!frame)
   850			return -ENOMEM;
   851	
   852		memcpy(&frame->info, info, sizeof(frame->info));
   853		frame->bytesused = info->frame_size;
   854	
   855		vpu_inst_lock(inst);
   856		list_add_tail(&frame->list, &venc->frames);
   857		venc->encode_count++;
   858		venc_get_encoded_frames(inst);
   859		vpu_inst_unlock(inst);
   860	
   861		return ret;
   862	}
   863	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
