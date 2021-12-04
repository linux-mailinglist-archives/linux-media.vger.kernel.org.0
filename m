Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5581468532
	for <lists+linux-media@lfdr.de>; Sat,  4 Dec 2021 14:56:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355115AbhLDOAU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Dec 2021 09:00:20 -0500
Received: from mga06.intel.com ([134.134.136.31]:20964 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344839AbhLDOAT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 4 Dec 2021 09:00:19 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10187"; a="297920377"
X-IronPort-AV: E=Sophos;i="5.87,287,1631602800"; 
   d="scan'208";a="297920377"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2021 05:56:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,287,1631602800"; 
   d="scan'208";a="501539698"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 04 Dec 2021 05:56:51 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mtVX1-000J4I-7Q; Sat, 04 Dec 2021 13:56:51 +0000
Date:   Sat, 4 Dec 2021 21:56:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Deborah Brouwer <deborahbrouwer3563@gmail.com>,
        linux-media@vger.kernel.org
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org, hverkuil@xs4all.nl,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: Re: [PATCH v2] media: vivid: fix timestamp and sequence wrapping
Message-ID: <202112042134.zRpYtrRg-lkp@intel.com>
References: <20211204061351.53611-1-deborahbrouwer3563@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211204061351.53611-1-deborahbrouwer3563@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Deborah,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on v5.16-rc3 next-20211203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Deborah-Brouwer/media-vivid-fix-timestamp-and-sequence-wrapping/20211204-141534
base:   git://linuxtv.org/media_tree.git master
config: i386-randconfig-a013-20211203 (https://download.01.org/0day-ci/archive/20211204/202112042134.zRpYtrRg-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5f1d1854eb1450d352663ee732235893c5782237)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/e6e5201f7b5b9718f318a5c3034b71fcc79aa47f
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Deborah-Brouwer/media-vivid-fix-timestamp-and-sequence-wrapping/20211204-141534
        git checkout e6e5201f7b5b9718f318a5c3034b71fcc79aa47f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/media/test-drivers/vivid/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/test-drivers/vivid/vivid-ctrls.c:1125:49: warning: overflow in expression; result is -1179869184 with type 'long' [-Winteger-overflow]
                           dev->time_wrap = (1ULL << 63) - NSEC_PER_SEC * 16;
                                                                        ^
   1 warning generated.


vim +/long +1125 drivers/media/test-drivers/vivid/vivid-ctrls.c

  1083	
  1084	static int vivid_streaming_s_ctrl(struct v4l2_ctrl *ctrl)
  1085	{
  1086		struct vivid_dev *dev = container_of(ctrl->handler, struct vivid_dev, ctrl_hdl_streaming);
  1087	
  1088		switch (ctrl->id) {
  1089		case VIVID_CID_DQBUF_ERROR:
  1090			dev->dqbuf_error = true;
  1091			break;
  1092		case VIVID_CID_PERC_DROPPED:
  1093			dev->perc_dropped_buffers = ctrl->val;
  1094			break;
  1095		case VIVID_CID_QUEUE_SETUP_ERROR:
  1096			dev->queue_setup_error = true;
  1097			break;
  1098		case VIVID_CID_BUF_PREPARE_ERROR:
  1099			dev->buf_prepare_error = true;
  1100			break;
  1101		case VIVID_CID_START_STR_ERROR:
  1102			dev->start_streaming_error = true;
  1103			break;
  1104		case VIVID_CID_REQ_VALIDATE_ERROR:
  1105			dev->req_validate_error = true;
  1106			break;
  1107		case VIVID_CID_QUEUE_ERROR:
  1108			if (vb2_start_streaming_called(&dev->vb_vid_cap_q))
  1109				vb2_queue_error(&dev->vb_vid_cap_q);
  1110			if (vb2_start_streaming_called(&dev->vb_vbi_cap_q))
  1111				vb2_queue_error(&dev->vb_vbi_cap_q);
  1112			if (vb2_start_streaming_called(&dev->vb_vid_out_q))
  1113				vb2_queue_error(&dev->vb_vid_out_q);
  1114			if (vb2_start_streaming_called(&dev->vb_vbi_out_q))
  1115				vb2_queue_error(&dev->vb_vbi_out_q);
  1116			if (vb2_start_streaming_called(&dev->vb_sdr_cap_q))
  1117				vb2_queue_error(&dev->vb_sdr_cap_q);
  1118			break;
  1119		case VIVID_CID_SEQ_WRAP:
  1120			dev->seq_wrap = ctrl->val;
  1121			break;
  1122		case VIVID_CID_TIME_WRAP:
  1123			dev->time_wrap = ctrl->val;
  1124			if (dev->time_wrap == 1)
> 1125				dev->time_wrap = (1ULL << 63) - NSEC_PER_SEC * 16;
  1126			else if (dev->time_wrap == 2)
  1127				dev->time_wrap = ((1ULL << 31) - 16) * NSEC_PER_SEC;
  1128			break;
  1129		}
  1130		return 0;
  1131	}
  1132	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
