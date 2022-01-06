Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30AAE486467
	for <lists+linux-media@lfdr.de>; Thu,  6 Jan 2022 13:33:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238844AbiAFMdT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jan 2022 07:33:19 -0500
Received: from mga07.intel.com ([134.134.136.100]:28374 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238831AbiAFMdT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jan 2022 07:33:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641472399; x=1673008399;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R2t0uWiKyWHzhXO7ev+TM9S6IWHk4KPPixNVHQWHveU=;
  b=G1RNoEEtAsAj+2ouWOr/rqMU59cusIF2/unJTpYWANDtUgxSyQ5oGlBJ
   5aeQaiMDKR4L7Axp30hvZo9SMLT08c+zh4wWGmQ1IEbg9xulLin0R2Ezs
   W0Z/acgqubejK0kZUt/SNcupuMDsp+PJlDnp5EYvecYzlI+Mu210MUcXq
   +FPIWi8X1jR+zqf6Ox+/bpQQx+BCazSLYXhXtBgsiF0RXL6x0fcmhkxqD
   c56/PCIjs5z9GTTGwZtu9bz0gTZd5XvOxlUkW9hdI4bH25ivGva5a5RTg
   F2Om744Af8f3ni8WcWcrt90ytbFF1scorLJZ8KUeY6Khq6XxHP9BOtu/q
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="306000425"
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; 
   d="scan'208";a="306000425"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2022 04:33:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; 
   d="scan'208";a="488920424"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Jan 2022 04:33:15 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n5RxC-000He1-Ru; Thu, 06 Jan 2022 12:33:14 +0000
Date:   Thu, 6 Jan 2022 20:32:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Moudy Ho <moudy.ho@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     kbuild-all@lists.01.org, linux-media@vger.kernel.org,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Landley <rob@landley.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v11 3/3] media: platform: mtk-mdp3: add Mediatek MDP3
 driver
Message-ID: <202201062041.Yo7iIAXn-lkp@intel.com>
References: <20220105093758.6850-4-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220105093758.6850-4-moudy.ho@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Moudy,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on media-tree/master]
[also build test ERROR on robh/for-next v5.16-rc8 next-20220105]
[cannot apply to mbgg-mediatek/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Moudy-Ho/media-mediatek-support-mdp3-on-mt8183-platform/20220105-173918
base:   git://linuxtv.org/media_tree.git master
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20220106/202201062041.Yo7iIAXn-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/696f7ac402f9778a21202f2b889c3c30a6923b3d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Moudy-Ho/media-mediatek-support-mdp3-on-mt8183-platform/20220105-173918
        git checkout 696f7ac402f9778a21202f2b889c3c30a6923b3d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=ia64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h:14,
                    from drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c:15:
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:109:41: error: field 'id' has incomplete type
     109 |         enum mtk_mdp_comp_id            id;
         |                                         ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:123:59: warning: 'struct mmsys_cmdq_cmd' declared inside parameter list will not be visible outside of this definition or declaration
     123 |         int (*init_comp)(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd);
         |                                                           ^~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:124:62: warning: 'struct mmsys_cmdq_cmd' declared inside parameter list will not be visible outside of this definition or declaration
     124 |         int (*config_frame)(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd,
         |                                                              ^~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:127:37: warning: 'struct mmsys_cmdq_cmd' declared inside parameter list will not be visible outside of this definition or declaration
     127 |                              struct mmsys_cmdq_cmd *cmd, u32 index);
         |                                     ^~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:129:39: warning: 'struct mmsys_cmdq_cmd' declared inside parameter list will not be visible outside of this definition or declaration
     129 |                                struct mmsys_cmdq_cmd *cmd);
         |                                       ^~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:131:38: warning: 'struct mmsys_cmdq_cmd' declared inside parameter list will not be visible outside of this definition or declaration
     131 |                               struct mmsys_cmdq_cmd *cmd, u32 index);
         |                                      ^~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:132:62: warning: 'struct mmsys_cmdq_cmd' declared inside parameter list will not be visible outside of this definition or declaration
     132 |         int (*post_process)(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd);
         |                                                              ^~~~~~~~~~~~~~
   In file included from drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c:15:
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h:43:60: error: 'MDP_PIPE_MAX' undeclared here (not in a function); did you mean 'SCP_IPI_MAX'?
      43 |         struct mtk_mutex                        *mdp_mutex[MDP_PIPE_MAX];
         |                                                            ^~~~~~~~~~~~
         |                                                            SCP_IPI_MAX
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h:44:55: error: 'MDP_MAX_COMP_COUNT' undeclared here (not in a function); did you mean 'MDP_MAX_EVENT_COUNT'?
      44 |         struct mdp_comp                         *comp[MDP_MAX_COMP_COUNT];
         |                                                       ^~~~~~~~~~~~~~~~~~
         |                                                       MDP_MAX_EVENT_COUNT
   drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c: In function 'mdp_probe':
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c:192:37: error: implicit declaration of function 'mtk_mutex_mdp_get'; did you mean 'mtk_mutex_get'? [-Werror=implicit-function-declaration]
     192 |                 mdp->mdp_mutex[i] = mtk_mutex_mdp_get(&mm_pdev->dev, i);
         |                                     ^~~~~~~~~~~~~~~~~
         |                                     mtk_mutex_get
   cc1: some warnings being treated as errors
--
   In file included from drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h:14,
                    from drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c:10:
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:109:41: error: field 'id' has incomplete type
     109 |         enum mtk_mdp_comp_id            id;
         |                                         ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:123:59: warning: 'struct mmsys_cmdq_cmd' declared inside parameter list will not be visible outside of this definition or declaration
     123 |         int (*init_comp)(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd);
         |                                                           ^~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:124:62: warning: 'struct mmsys_cmdq_cmd' declared inside parameter list will not be visible outside of this definition or declaration
     124 |         int (*config_frame)(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd,
         |                                                              ^~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:127:37: warning: 'struct mmsys_cmdq_cmd' declared inside parameter list will not be visible outside of this definition or declaration
     127 |                              struct mmsys_cmdq_cmd *cmd, u32 index);
         |                                     ^~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:129:39: warning: 'struct mmsys_cmdq_cmd' declared inside parameter list will not be visible outside of this definition or declaration
     129 |                                struct mmsys_cmdq_cmd *cmd);
         |                                       ^~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:131:38: warning: 'struct mmsys_cmdq_cmd' declared inside parameter list will not be visible outside of this definition or declaration
     131 |                               struct mmsys_cmdq_cmd *cmd, u32 index);
         |                                      ^~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:132:62: warning: 'struct mmsys_cmdq_cmd' declared inside parameter list will not be visible outside of this definition or declaration
     132 |         int (*post_process)(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd);
         |                                                              ^~~~~~~~~~~~~~
   In file included from drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c:10:
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h:43:60: error: 'MDP_PIPE_MAX' undeclared here (not in a function); did you mean 'SCP_IPI_MAX'?
      43 |         struct mtk_mutex                        *mdp_mutex[MDP_PIPE_MAX];
         |                                                            ^~~~~~~~~~~~
         |                                                            SCP_IPI_MAX
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h:44:55: error: 'MDP_MAX_COMP_COUNT' undeclared here (not in a function); did you mean 'MDP_MAX_EVENT_COUNT'?
      44 |         struct mdp_comp                         *comp[MDP_MAX_COMP_COUNT];
         |                                                       ^~~~~~~~~~~~~~~~~~
         |                                                       MDP_MAX_EVENT_COUNT
--
   In file included from drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h:14,
                    from drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c:10:
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:109:41: error: field 'id' has incomplete type
     109 |         enum mtk_mdp_comp_id            id;
         |                                         ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:123:59: warning: 'struct mmsys_cmdq_cmd' declared inside parameter list will not be visible outside of this definition or declaration
     123 |         int (*init_comp)(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd);
         |                                                           ^~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:124:62: warning: 'struct mmsys_cmdq_cmd' declared inside parameter list will not be visible outside of this definition or declaration
     124 |         int (*config_frame)(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd,
         |                                                              ^~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:127:37: warning: 'struct mmsys_cmdq_cmd' declared inside parameter list will not be visible outside of this definition or declaration
     127 |                              struct mmsys_cmdq_cmd *cmd, u32 index);
         |                                     ^~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:129:39: warning: 'struct mmsys_cmdq_cmd' declared inside parameter list will not be visible outside of this definition or declaration
     129 |                                struct mmsys_cmdq_cmd *cmd);
         |                                       ^~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:131:38: warning: 'struct mmsys_cmdq_cmd' declared inside parameter list will not be visible outside of this definition or declaration
     131 |                               struct mmsys_cmdq_cmd *cmd, u32 index);
         |                                      ^~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:132:62: warning: 'struct mmsys_cmdq_cmd' declared inside parameter list will not be visible outside of this definition or declaration
     132 |         int (*post_process)(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd);
         |                                                              ^~~~~~~~~~~~~~
   In file included from drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c:10:
   drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h:43:60: error: 'MDP_PIPE_MAX' undeclared here (not in a function)
      43 |         struct mtk_mutex                        *mdp_mutex[MDP_PIPE_MAX];
         |                                                            ^~~~~~~~~~~~
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h:44:55: error: 'MDP_MAX_COMP_COUNT' undeclared here (not in a function); did you mean 'MDP_MAX_EVENT_COUNT'?
      44 |         struct mdp_comp                         *comp[MDP_MAX_COMP_COUNT];
         |                                                       ^~~~~~~~~~~~~~~~~~
         |                                                       MDP_MAX_EVENT_COUNT
--
   In file included from drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:11:
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:109:41: error: field 'id' has incomplete type
     109 |         enum mtk_mdp_comp_id            id;
         |                                         ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:123:59: warning: 'struct mmsys_cmdq_cmd' declared inside parameter list will not be visible outside of this definition or declaration
     123 |         int (*init_comp)(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd);
         |                                                           ^~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:124:62: warning: 'struct mmsys_cmdq_cmd' declared inside parameter list will not be visible outside of this definition or declaration
     124 |         int (*config_frame)(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd,
         |                                                              ^~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:127:37: warning: 'struct mmsys_cmdq_cmd' declared inside parameter list will not be visible outside of this definition or declaration
     127 |                              struct mmsys_cmdq_cmd *cmd, u32 index);
         |                                     ^~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:129:39: warning: 'struct mmsys_cmdq_cmd' declared inside parameter list will not be visible outside of this definition or declaration
     129 |                                struct mmsys_cmdq_cmd *cmd);
         |                                       ^~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:131:38: warning: 'struct mmsys_cmdq_cmd' declared inside parameter list will not be visible outside of this definition or declaration
     131 |                               struct mmsys_cmdq_cmd *cmd, u32 index);
         |                                      ^~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:132:62: warning: 'struct mmsys_cmdq_cmd' declared inside parameter list will not be visible outside of this definition or declaration
     132 |         int (*post_process)(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd);
         |                                                              ^~~~~~~~~~~~~~
   In file included from drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:12:
   drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h:43:60: error: 'MDP_PIPE_MAX' undeclared here (not in a function)
      43 |         struct mtk_mutex                        *mdp_mutex[MDP_PIPE_MAX];
         |                                                            ^~~~~~~~~~~~
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h:44:55: error: 'MDP_MAX_COMP_COUNT' undeclared here (not in a function); did you mean 'MDP_MAX_EVENT_COUNT'?
      44 |         struct mdp_comp                         *comp[MDP_MAX_COMP_COUNT];
         |                                                       ^~~~~~~~~~~~~~~~~~
         |                                                       MDP_MAX_EVENT_COUNT
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c: In function 'get_comp_flag':
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:35:38: error: 'MDP_COMP_RDMA0' undeclared (first use in this function)
      35 |                 if (ctx->comp->id == MDP_COMP_RDMA0)
         |                                      ^~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:35:38: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/bits.h:6,
                    from include/linux/bitops.h:6,
                    from include/linux/kernel.h:13,
                    from include/linux/clk.h:13,
                    from drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:7:
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:36:58: error: 'MDP_COMP_RSZ1' undeclared (first use in this function)
      36 |                         return BIT(MDP_COMP_RDMA0) | BIT(MDP_COMP_RSZ1);
         |                                                          ^~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c: At top level:
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:41:55: warning: 'struct mmsys_cmdq_cmd' declared inside parameter list will not be visible outside of this definition or declaration
      41 | static int init_rdma(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
         |                                                       ^~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c: In function 'init_rdma':
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:48:66: error: 'MDP_COMP_RSZ1' undeclared (first use in this function)
      48 |                 struct mdp_comp *prz1 = ctx->comp->mdp_dev->comp[MDP_COMP_RSZ1];
         |                                                                  ^~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:51:38: error: 'MDP_COMP_RDMA0' undeclared (first use in this function)
      51 |                 if (ctx->comp->id == MDP_COMP_RDMA0 && prz1)
         |                                      ^~~~~~~~~~~~~~
   In file included from drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:11:
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:14:34: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      14 |         cmdq_pkt_write_mask((cmd)->pkt, id, \
         |                                  ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:17:9: note: in expansion of macro 'MM_REG_WRITE_MASK'
      17 |         MM_REG_WRITE_MASK(cmd, id, base, ofst, val, \
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:52:25: note: in expansion of macro 'MM_REG_WRITE'
      52 |                         MM_REG_WRITE(cmd, subsys_id, prz1->reg_base, PRZ_ENABLE,
         |                         ^~~~~~~~~~~~
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:14:34: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      14 |         cmdq_pkt_write_mask((cmd)->pkt, id, \
         |                                  ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:17:9: note: in expansion of macro 'MM_REG_WRITE_MASK'
      17 |         MM_REG_WRITE_MASK(cmd, id, base, ofst, val, \
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:57:9: note: in expansion of macro 'MM_REG_WRITE'
      57 |         MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_RESET, BIT(0), BIT(0));
         |         ^~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:34:33: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      34 |         cmdq_pkt_poll_mask((cmd)->pkt, id, \
         |                                 ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:37:9: note: in expansion of macro 'MM_REG_POLL_MASK'
      37 |         MM_REG_POLL_MASK((cmd), id, base, ofst, val, \
         |         ^~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:58:9: note: in expansion of macro 'MM_REG_POLL'
      58 |         MM_REG_POLL(cmd, subsys_id, base, MDP_RDMA_MON_STA_1, BIT(8), BIT(8));
         |         ^~~~~~~~~~~
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:14:34: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      14 |         cmdq_pkt_write_mask((cmd)->pkt, id, \
         |                                  ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:17:9: note: in expansion of macro 'MM_REG_WRITE_MASK'
      17 |         MM_REG_WRITE_MASK(cmd, id, base, ofst, val, \
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:59:9: note: in expansion of macro 'MM_REG_WRITE'
      59 |         MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_RESET, 0x0, BIT(0));
         |         ^~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c: At top level:
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:64:37: warning: 'struct mmsys_cmdq_cmd' declared inside parameter list will not be visible outside of this definition or declaration
      64 |                              struct mmsys_cmdq_cmd *cmd,
         |                                     ^~~~~~~~~~~~~~
   In file included from drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:11:
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c: In function 'config_rdma_frame':
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:14:34: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      14 |         cmdq_pkt_write_mask((cmd)->pkt, id, \
         |                                  ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:17:9: note: in expansion of macro 'MM_REG_WRITE_MASK'
      17 |         MM_REG_WRITE_MASK(cmd, id, base, ofst, val, \
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:77:25: note: in expansion of macro 'MM_REG_WRITE'
      77 |                         MM_REG_WRITE(cmd, subsys_id, base,
         |                         ^~~~~~~~~~~~
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:14:34: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      14 |         cmdq_pkt_write_mask((cmd)->pkt, id, \
         |                                  ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:17:9: note: in expansion of macro 'MM_REG_WRITE_MASK'
      17 |         MM_REG_WRITE_MASK(cmd, id, base, ofst, val, \
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:80:25: note: in expansion of macro 'MM_REG_WRITE'
      80 |                         MM_REG_WRITE(cmd, subsys_id, base,
         |                         ^~~~~~~~~~~~
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:14:34: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      14 |         cmdq_pkt_write_mask((cmd)->pkt, id, \
         |                                  ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:17:9: note: in expansion of macro 'MM_REG_WRITE_MASK'
      17 |         MM_REG_WRITE_MASK(cmd, id, base, ofst, val, \
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:85:9: note: in expansion of macro 'MM_REG_WRITE'
      85 |         MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_GMCIF_CON,
         |         ^~~~~~~~~~~~
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:14:34: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      14 |         cmdq_pkt_write_mask((cmd)->pkt, id, \
         |                                  ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:17:9: note: in expansion of macro 'MM_REG_WRITE_MASK'
      17 |         MM_REG_WRITE_MASK(cmd, id, base, ofst, val, \
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:91:9: note: in expansion of macro 'MM_REG_WRITE'
      91 |         MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_CON, rdma->src_ctrl,
         |         ^~~~~~~~~~~~
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:14:34: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      14 |         cmdq_pkt_write_mask((cmd)->pkt, id, \
         |                                  ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:17:9: note: in expansion of macro 'MM_REG_WRITE_MASK'
      17 |         MM_REG_WRITE_MASK(cmd, id, base, ofst, val, \
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:97:25: note: in expansion of macro 'MM_REG_WRITE'
      97 |                         MM_REG_WRITE(cmd, subsys_id,
         |                         ^~~~~~~~~~~~
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:14:34: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      14 |         cmdq_pkt_write_mask((cmd)->pkt, id, \
         |                                  ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:17:9: note: in expansion of macro 'MM_REG_WRITE_MASK'
      17 |         MM_REG_WRITE_MASK(cmd, id, base, ofst, val, \
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:100:25: note: in expansion of macro 'MM_REG_WRITE'
     100 |                         MM_REG_WRITE(cmd, subsys_id,
         |                         ^~~~~~~~~~~~
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:14:34: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      14 |         cmdq_pkt_write_mask((cmd)->pkt, id, \
         |                                  ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:17:9: note: in expansion of macro 'MM_REG_WRITE_MASK'
      17 |         MM_REG_WRITE_MASK(cmd, id, base, ofst, val, \
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:105:33: note: in expansion of macro 'MM_REG_WRITE'
     105 |                                 MM_REG_WRITE(cmd, subsys_id,
         |                                 ^~~~~~~~~~~~
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:14:34: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      14 |         cmdq_pkt_write_mask((cmd)->pkt, id, \
         |                                  ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:17:9: note: in expansion of macro 'MM_REG_WRITE_MASK'
      17 |         MM_REG_WRITE_MASK(cmd, id, base, ofst, val, \
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:110:9: note: in expansion of macro 'MM_REG_WRITE'
     110 |         MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_CON, rdma->control,
         |         ^~~~~~~~~~~~
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:14:34: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      14 |         cmdq_pkt_write_mask((cmd)->pkt, id, \
         |                                  ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:17:9: note: in expansion of macro 'MM_REG_WRITE_MASK'
      17 |         MM_REG_WRITE_MASK(cmd, id, base, ofst, val, \
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:113:9: note: in expansion of macro 'MM_REG_WRITE'
     113 |         MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_BASE_0, rdma->iova[0],
         |         ^~~~~~~~~~~~
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:14:34: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      14 |         cmdq_pkt_write_mask((cmd)->pkt, id, \
         |                                  ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:17:9: note: in expansion of macro 'MM_REG_WRITE_MASK'
      17 |         MM_REG_WRITE_MASK(cmd, id, base, ofst, val, \
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:115:9: note: in expansion of macro 'MM_REG_WRITE'
     115 |         MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_BASE_1, rdma->iova[1],
         |         ^~~~~~~~~~~~
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:14:34: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      14 |         cmdq_pkt_write_mask((cmd)->pkt, id, \
         |                                  ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:17:9: note: in expansion of macro 'MM_REG_WRITE_MASK'
      17 |         MM_REG_WRITE_MASK(cmd, id, base, ofst, val, \
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:117:9: note: in expansion of macro 'MM_REG_WRITE'
     117 |         MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_BASE_2, rdma->iova[2],
         |         ^~~~~~~~~~~~
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:14:34: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      14 |         cmdq_pkt_write_mask((cmd)->pkt, id, \
         |                                  ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:17:9: note: in expansion of macro 'MM_REG_WRITE_MASK'
      17 |         MM_REG_WRITE_MASK(cmd, id, base, ofst, val, \
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:120:9: note: in expansion of macro 'MM_REG_WRITE'
     120 |         MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_END_0,
         |         ^~~~~~~~~~~~
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:14:34: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      14 |         cmdq_pkt_write_mask((cmd)->pkt, id, \
         |                                  ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:17:9: note: in expansion of macro 'MM_REG_WRITE_MASK'
      17 |         MM_REG_WRITE_MASK(cmd, id, base, ofst, val, \
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:122:9: note: in expansion of macro 'MM_REG_WRITE'
     122 |         MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_END_1,
         |         ^~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:14:34: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      14 |         cmdq_pkt_write_mask((cmd)->pkt, id, \
         |                                  ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:17:9: note: in expansion of macro 'MM_REG_WRITE_MASK'
      17 |         MM_REG_WRITE_MASK(cmd, id, base, ofst, val, \
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:124:9: note: in expansion of macro 'MM_REG_WRITE'
     124 |         MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_END_2,
         |         ^~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:14:34: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      14 |         cmdq_pkt_write_mask((cmd)->pkt, id, \
         |                                  ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:17:9: note: in expansion of macro 'MM_REG_WRITE_MASK'
      17 |         MM_REG_WRITE_MASK(cmd, id, base, ofst, val, \
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:127:9: note: in expansion of macro 'MM_REG_WRITE'
     127 |         MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_MF_BKGD_SIZE_IN_BYTE,
         |         ^~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:14:34: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      14 |         cmdq_pkt_write_mask((cmd)->pkt, id, \
         |                                  ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:17:9: note: in expansion of macro 'MM_REG_WRITE_MASK'
      17 |         MM_REG_WRITE_MASK(cmd, id, base, ofst, val, \
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:129:9: note: in expansion of macro 'MM_REG_WRITE'
     129 |         MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SF_BKGD_SIZE_IN_BYTE,
         |         ^~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:14:34: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      14 |         cmdq_pkt_write_mask((cmd)->pkt, id, \
         |                                  ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:17:9: note: in expansion of macro 'MM_REG_WRITE_MASK'
      17 |         MM_REG_WRITE_MASK(cmd, id, base, ofst, val, \
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:132:9: note: in expansion of macro 'MM_REG_WRITE'
     132 |         MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_TRANSFORM_0,
         |         ^~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c: At top level:
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:139:38: warning: 'struct mmsys_cmdq_cmd' declared inside parameter list will not be visible outside of this definition or declaration
     139 |                               struct mmsys_cmdq_cmd *cmd, u32 index)
         |                                      ^~~~~~~~~~~~~~
   In file included from drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:11:
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c: In function 'config_rdma_subfrm':
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:14:34: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      14 |         cmdq_pkt_write_mask((cmd)->pkt, id, \
         |                                  ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:17:9: note: in expansion of macro 'MM_REG_WRITE_MASK'
      17 |         MM_REG_WRITE_MASK(cmd, id, base, ofst, val, \
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:151:9: note: in expansion of macro 'MM_REG_WRITE'
     151 |         MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_EN, BIT(0), BIT(0));
         |         ^~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:14:34: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      14 |         cmdq_pkt_write_mask((cmd)->pkt, id, \
         |                                  ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:17:9: note: in expansion of macro 'MM_REG_WRITE_MASK'
      17 |         MM_REG_WRITE_MASK(cmd, id, base, ofst, val, \
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:154:9: note: in expansion of macro 'MM_REG_WRITE'
     154 |         MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_OFFSET_0,
         |         ^~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:14:34: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      14 |         cmdq_pkt_write_mask((cmd)->pkt, id, \
         |                                  ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:17:9: note: in expansion of macro 'MM_REG_WRITE_MASK'
      17 |         MM_REG_WRITE_MASK(cmd, id, base, ofst, val, \
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:160:25: note: in expansion of macro 'MM_REG_WRITE'
     160 |                         MM_REG_WRITE(cmd, subsys_id, base,
         |                         ^~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:14:34: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      14 |         cmdq_pkt_write_mask((cmd)->pkt, id, \
         |                                  ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:17:9: note: in expansion of macro 'MM_REG_WRITE_MASK'
      17 |         MM_REG_WRITE_MASK(cmd, id, base, ofst, val, \
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:165:9: note: in expansion of macro 'MM_REG_WRITE'
     165 |         MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_OFFSET_1,
         |         ^~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:14:34: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      14 |         cmdq_pkt_write_mask((cmd)->pkt, id, \
         |                                  ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:17:9: note: in expansion of macro 'MM_REG_WRITE_MASK'
      17 |         MM_REG_WRITE_MASK(cmd, id, base, ofst, val, \
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:168:9: note: in expansion of macro 'MM_REG_WRITE'
     168 |         MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_OFFSET_2,
         |         ^~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:14:34: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      14 |         cmdq_pkt_write_mask((cmd)->pkt, id, \
         |                                  ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:17:9: note: in expansion of macro 'MM_REG_WRITE_MASK'
      17 |         MM_REG_WRITE_MASK(cmd, id, base, ofst, val, \
..


vim +/id +109 drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h

    12	
    13	#define MM_REG_WRITE_MASK(cmd, id, base, ofst, val, mask, ...) \
  > 14		cmdq_pkt_write_mask((cmd)->pkt, id, \
    15			(base) + (ofst), (val), (mask), ##__VA_ARGS__)
    16	#define MM_REG_WRITE(cmd, id, base, ofst, val, mask, ...) \
    17		MM_REG_WRITE_MASK(cmd, id, base, ofst, val, \
    18			(((mask) & (ofst##_MASK)) == (ofst##_MASK)) ? \
    19				(0xffffffff) : (mask), ##__VA_ARGS__)
    20	
    21	#define MM_REG_WAIT(cmd, evt) \
    22		cmdq_pkt_wfe((cmd)->pkt, (cmd)->event[(evt)], true)
    23	
    24	#define MM_REG_WAIT_NO_CLEAR(cmd, evt) \
    25		cmdq_pkt_wfe((cmd)->pkt, (cmd)->event[(evt)], false)
    26	
    27	#define MM_REG_CLEAR(cmd, evt) \
    28		cmdq_pkt_clear_event((cmd)->pkt, (cmd)->event[(evt)])
    29	
    30	#define MM_REG_SET_EVENT(cmd, evt) \
    31		cmdq_pkt_set_event((cmd)->pkt, (cmd)->event[(evt)])
    32	
    33	#define MM_REG_POLL_MASK(cmd, id, base, ofst, val, mask, ...) \
    34		cmdq_pkt_poll_mask((cmd)->pkt, id, \
    35			(base) + (ofst), (val), (mask), ##__VA_ARGS__)
    36	#define MM_REG_POLL(cmd, id, base, ofst, val, mask, ...) \
    37		MM_REG_POLL_MASK((cmd), id, base, ofst, val, \
    38			(((mask) & (ofst##_MASK)) == (ofst##_MASK)) ? \
    39				(0xffffffff) : (mask), ##__VA_ARGS__)
    40	
    41	enum mdp_comp_type {
    42		MDP_COMP_TYPE_INVALID = 0,
    43	
    44		MDP_COMP_TYPE_RDMA,
    45		MDP_COMP_TYPE_RSZ,
    46		MDP_COMP_TYPE_WROT,
    47		MDP_COMP_TYPE_WDMA,
    48		MDP_COMP_TYPE_PATH1,
    49		MDP_COMP_TYPE_PATH2,
    50	
    51		MDP_COMP_TYPE_TDSHP,
    52		MDP_COMP_TYPE_COLOR,
    53		MDP_COMP_TYPE_DRE,
    54		MDP_COMP_TYPE_CCORR,
    55		MDP_COMP_TYPE_HDR,
    56	
    57		MDP_COMP_TYPE_IMGI,
    58		MDP_COMP_TYPE_WPEI,
    59		MDP_COMP_TYPE_EXTO,	/* External path */
    60		MDP_COMP_TYPE_DL_PATH1, /* Direct-link path1 */
    61		MDP_COMP_TYPE_DL_PATH2, /* Direct-link path2 */
    62	
    63		MDP_COMP_TYPE_COUNT	/* ALWAYS keep at the end */
    64	};
    65	
    66	enum mdp_comp_event {
    67		RDMA0_SOF,
    68		RDMA0_DONE,
    69		RSZ0_SOF,
    70		RSZ1_SOF,
    71		TDSHP0_SOF,
    72		WROT0_SOF,
    73		WROT0_DONE,
    74		WDMA0_SOF,
    75		WDMA0_DONE,
    76	
    77		ISP_P2_0_DONE,
    78		ISP_P2_1_DONE,
    79		ISP_P2_2_DONE,
    80		ISP_P2_3_DONE,
    81		ISP_P2_4_DONE,
    82		ISP_P2_5_DONE,
    83		ISP_P2_6_DONE,
    84		ISP_P2_7_DONE,
    85		ISP_P2_8_DONE,
    86		ISP_P2_9_DONE,
    87		ISP_P2_10_DONE,
    88		ISP_P2_11_DONE,
    89		ISP_P2_12_DONE,
    90		ISP_P2_13_DONE,
    91		ISP_P2_14_DONE,
    92	
    93		WPE_DONE,
    94		WPE_B_DONE,
    95	
    96		MDP_MAX_EVENT_COUNT	/* ALWAYS keep at the end */
    97	};
    98	
    99	struct mdp_comp_ops;
   100	
   101	struct mdp_comp {
   102		struct mdp_dev			*mdp_dev;
   103		void __iomem			*regs;
   104		phys_addr_t			reg_base;
   105		u8				subsys_id;
   106		struct clk			*clks[6];
   107		struct device			*comp_dev;
   108		enum mdp_comp_type		type;
 > 109		enum mtk_mdp_comp_id		id;
   110		u32				alias_id;
   111		const struct mdp_comp_ops	*ops;
   112	};
   113	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
