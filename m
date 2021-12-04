Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91708468481
	for <lists+linux-media@lfdr.de>; Sat,  4 Dec 2021 12:32:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384797AbhLDLgR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Dec 2021 06:36:17 -0500
Received: from mga11.intel.com ([192.55.52.93]:36265 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240942AbhLDLgQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 4 Dec 2021 06:36:16 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10187"; a="234624586"
X-IronPort-AV: E=Sophos;i="5.87,287,1631602800"; 
   d="scan'208";a="234624586"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2021 03:32:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,287,1631602800"; 
   d="scan'208";a="501506219"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 04 Dec 2021 03:32:48 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mtTHc-000IwD-3a; Sat, 04 Dec 2021 11:32:48 +0000
Date:   Sat, 4 Dec 2021 19:32:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Deborah Brouwer <deborahbrouwer3563@gmail.com>,
        linux-media@vger.kernel.org
Cc:     kbuild-all@lists.01.org, hverkuil@xs4all.nl,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: Re: [PATCH v2] media: vivid: fix timestamp and sequence wrapping
Message-ID: <202112041916.6eQfvskR-lkp@intel.com>
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
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20211204/202112041916.6eQfvskR-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/e6e5201f7b5b9718f318a5c3034b71fcc79aa47f
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Deborah-Brouwer/media-vivid-fix-timestamp-and-sequence-wrapping/20211204-141534
        git checkout e6e5201f7b5b9718f318a5c3034b71fcc79aa47f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=mips SHELL=/bin/bash drivers/media/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/media/test-drivers/vivid/vivid-ctrls.c: In function 'vivid_streaming_s_ctrl':
>> drivers/media/test-drivers/vivid/vivid-ctrls.c:1125:70: warning: integer overflow in expression of type 'long int' results in '-1179869184' [-Woverflow]
    1125 |                         dev->time_wrap = (1ULL << 63) - NSEC_PER_SEC * 16;
         |                                                                      ^


vim +1125 drivers/media/test-drivers/vivid/vivid-ctrls.c

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
