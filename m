Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95BD3485816
	for <lists+linux-media@lfdr.de>; Wed,  5 Jan 2022 19:22:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242846AbiAESV6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jan 2022 13:21:58 -0500
Received: from mga17.intel.com ([192.55.52.151]:24984 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242836AbiAESVy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 Jan 2022 13:21:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641406913; x=1672942913;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ky0K7GpHb5XE2P/bKHUIGMR1ZLzLyXA9t9zK2mCnYJc=;
  b=WelibLQ437LznlZ1YTnKamMMZuHmKGLIMucG1Zf//WbPxvulI7na7fv/
   zW1WRPCjXJ8K7dZUsD0P5rGBb6N7bjLZGq/1npW/q+x1NRfkakNUGn/7n
   KNcmxK258b0NRvGLB+2k3R/TAgXUOXLKNaYIuFkRdeS3uv3V0Z52SLG0e
   CudQuZjmIOdc/328XojuYmvsc7HhvzAz8T2gPQsMcY92bKPwqcu49SC5n
   OhIIDHkUDA+SdJdt9RhC81BzncE3akihqolDkEXazb8itW09+5QiJIT5q
   y+OOEYE1MAvxzTOTdQkYBdvVzky6NAXU6oG9++NLbhGEkv2hOPi005FYv
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="223188755"
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; 
   d="scan'208";a="223188755"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2022 10:21:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; 
   d="scan'208";a="689092818"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 05 Jan 2022 10:21:49 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n5Auy-000Gvc-Bk; Wed, 05 Jan 2022 18:21:48 +0000
Date:   Thu, 6 Jan 2022 02:21:13 +0800
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
Message-ID: <202201060241.t95Ra9LM-lkp@intel.com>
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

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on robh/for-next v5.16-rc8 next-20220105]
[cannot apply to mbgg-mediatek/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Moudy-Ho/media-mediatek-support-mdp3-on-mt8183-platform/20220105-173918
base:   git://linuxtv.org/media_tree.git master
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20220106/202201060241.t95Ra9LM-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/media/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h:14,
                    from drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c:15:
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:109:41: error: field 'id' has incomplete type
     109 |         enum mtk_mdp_comp_id            id;
         |                                         ^~
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:123:59: warning: 'struct mmsys_cmdq_cmd' declared inside parameter list will not be visible outside of this definition or declaration
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
   drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h:43:60: error: 'MDP_PIPE_MAX' undeclared here (not in a function); did you mean 'SCP_IPI_MAX'?
      43 |         struct mtk_mutex                        *mdp_mutex[MDP_PIPE_MAX];
         |                                                            ^~~~~~~~~~~~
         |                                                            SCP_IPI_MAX
   drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h:44:55: error: 'MDP_MAX_COMP_COUNT' undeclared here (not in a function); did you mean 'MDP_MAX_EVENT_COUNT'?
      44 |         struct mdp_comp                         *comp[MDP_MAX_COMP_COUNT];
         |                                                       ^~~~~~~~~~~~~~~~~~
         |                                                       MDP_MAX_EVENT_COUNT
   drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c: In function 'mdp_probe':
   drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c:192:37: error: implicit declaration of function 'mtk_mutex_mdp_get'; did you mean 'mtk_mutex_get'? [-Werror=implicit-function-declaration]
     192 |                 mdp->mdp_mutex[i] = mtk_mutex_mdp_get(&mm_pdev->dev, i);
         |                                     ^~~~~~~~~~~~~~~~~
         |                                     mtk_mutex_get
   cc1: some warnings being treated as errors
--
   In file included from drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h:14,
                    from drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c:10:
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:109:41: error: field 'id' has incomplete type
     109 |         enum mtk_mdp_comp_id            id;
         |                                         ^~
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:123:59: warning: 'struct mmsys_cmdq_cmd' declared inside parameter list will not be visible outside of this definition or declaration
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
   drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h:43:60: error: 'MDP_PIPE_MAX' undeclared here (not in a function); did you mean 'SCP_IPI_MAX'?
      43 |         struct mtk_mutex                        *mdp_mutex[MDP_PIPE_MAX];
         |                                                            ^~~~~~~~~~~~
         |                                                            SCP_IPI_MAX
   drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h:44:55: error: 'MDP_MAX_COMP_COUNT' undeclared here (not in a function); did you mean 'MDP_MAX_EVENT_COUNT'?
      44 |         struct mdp_comp                         *comp[MDP_MAX_COMP_COUNT];
         |                                                       ^~~~~~~~~~~~~~~~~~
         |                                                       MDP_MAX_EVENT_COUNT
--
   In file included from drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h:14,
                    from drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c:10:
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:109:41: error: field 'id' has incomplete type
     109 |         enum mtk_mdp_comp_id            id;
         |                                         ^~
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:123:59: warning: 'struct mmsys_cmdq_cmd' declared inside parameter list will not be visible outside of this definition or declaration
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
   drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h:44:55: error: 'MDP_MAX_COMP_COUNT' undeclared here (not in a function); did you mean 'MDP_MAX_EVENT_COUNT'?
      44 |         struct mdp_comp                         *comp[MDP_MAX_COMP_COUNT];
         |                                                       ^~~~~~~~~~~~~~~~~~
         |                                                       MDP_MAX_EVENT_COUNT
--
   In file included from drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:11:
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:109:41: error: field 'id' has incomplete type
     109 |         enum mtk_mdp_comp_id            id;
         |                                         ^~
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:123:59: warning: 'struct mmsys_cmdq_cmd' declared inside parameter list will not be visible outside of this definition or declaration
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
   drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h:44:55: error: 'MDP_MAX_COMP_COUNT' undeclared here (not in a function); did you mean 'MDP_MAX_EVENT_COUNT'?
      44 |         struct mdp_comp                         *comp[MDP_MAX_COMP_COUNT];
         |                                                       ^~~~~~~~~~~~~~~~~~
         |                                                       MDP_MAX_EVENT_COUNT
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c: In function 'get_comp_flag':
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:35:38: error: 'MDP_COMP_RDMA0' undeclared (first use in this function)
      35 |                 if (ctx->comp->id == MDP_COMP_RDMA0)
         |                                      ^~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:35:38: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/bits.h:6,
                    from include/linux/bitops.h:6,
                    from include/linux/kernel.h:13,
                    from include/linux/clk.h:13,
                    from drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:7:
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:36:58: error: 'MDP_COMP_RSZ1' undeclared (first use in this function)
      36 |                         return BIT(MDP_COMP_RDMA0) | BIT(MDP_COMP_RSZ1);
         |                                                          ^~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c: At top level:
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:41:55: warning: 'struct mmsys_cmdq_cmd' declared inside parameter list will not be visible outside of this definition or declaration
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
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:14:34: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      14 |         cmdq_pkt_write_mask((cmd)->pkt, id, \
         |                                  ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:17:9: note: in expansion of macro 'MM_REG_WRITE_MASK'
      17 |         MM_REG_WRITE_MASK(cmd, id, base, ofst, val, \
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:52:25: note: in expansion of macro 'MM_REG_WRITE'
      52 |                         MM_REG_WRITE(cmd, subsys_id, prz1->reg_base, PRZ_ENABLE,
         |                         ^~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:14:34: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
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
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:14:34: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
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
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:14:34: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      14 |         cmdq_pkt_write_mask((cmd)->pkt, id, \
         |                                  ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:17:9: note: in expansion of macro 'MM_REG_WRITE_MASK'
      17 |         MM_REG_WRITE_MASK(cmd, id, base, ofst, val, \
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:77:25: note: in expansion of macro 'MM_REG_WRITE'
      77 |                         MM_REG_WRITE(cmd, subsys_id, base,
         |                         ^~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:14:34: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      14 |         cmdq_pkt_write_mask((cmd)->pkt, id, \
         |                                  ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:17:9: note: in expansion of macro 'MM_REG_WRITE_MASK'
      17 |         MM_REG_WRITE_MASK(cmd, id, base, ofst, val, \
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:80:25: note: in expansion of macro 'MM_REG_WRITE'
      80 |                         MM_REG_WRITE(cmd, subsys_id, base,
         |                         ^~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:14:34: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      14 |         cmdq_pkt_write_mask((cmd)->pkt, id, \
         |                                  ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:17:9: note: in expansion of macro 'MM_REG_WRITE_MASK'
      17 |         MM_REG_WRITE_MASK(cmd, id, base, ofst, val, \
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:85:9: note: in expansion of macro 'MM_REG_WRITE'
      85 |         MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_GMCIF_CON,
         |         ^~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:14:34: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      14 |         cmdq_pkt_write_mask((cmd)->pkt, id, \
         |                                  ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:17:9: note: in expansion of macro 'MM_REG_WRITE_MASK'
      17 |         MM_REG_WRITE_MASK(cmd, id, base, ofst, val, \
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:91:9: note: in expansion of macro 'MM_REG_WRITE'
      91 |         MM_REG_WRITE(cmd, subsys_id, base, MDP_RDMA_SRC_CON, rdma->src_ctrl,
         |         ^~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:14:34: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      14 |         cmdq_pkt_write_mask((cmd)->pkt, id, \
         |                                  ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:17:9: note: in expansion of macro 'MM_REG_WRITE_MASK'
      17 |         MM_REG_WRITE_MASK(cmd, id, base, ofst, val, \
         |         ^~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c:97:25: note: in expansion of macro 'MM_REG_WRITE'
      97 |                         MM_REG_WRITE(cmd, subsys_id,
         |                         ^~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:14:34: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      14 |         cmdq_pkt_write_mask((cmd)->pkt, id, \
         |                                  ^~
--
   In file included from drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:9:
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:109:41: error: field 'id' has incomplete type
     109 |         enum mtk_mdp_comp_id            id;
         |                                         ^~
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:123:59: warning: 'struct mmsys_cmdq_cmd' declared inside parameter list will not be visible outside of this definition or declaration
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
   In file included from drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:10:
   drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h:43:60: error: 'MDP_PIPE_MAX' undeclared here (not in a function)
      43 |         struct mtk_mutex                        *mdp_mutex[MDP_PIPE_MAX];
         |                                                            ^~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h:44:55: error: 'MDP_MAX_COMP_COUNT' undeclared here (not in a function); did you mean 'MDP_MAX_EVENT_COUNT'?
      44 |         struct mdp_comp                         *comp[MDP_MAX_COMP_COUNT];
         |                                                       ^~~~~~~~~~~~~~~~~~
         |                                                       MDP_MAX_EVENT_COUNT
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:47:43: warning: 'struct mmsys_cmdq_cmd' declared inside parameter list will not be visible outside of this definition or declaration
      47 |                                    struct mmsys_cmdq_cmd *cmd, u32 count)
         |                                           ^~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c: In function 'mdp_path_subfrm_require':
   drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:62:14: error: 'MDP_COMP_RDMA0' undeclared (first use in this function)
      62 |         case MDP_COMP_RDMA0:
         |              ^~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:62:14: note: each undeclared identifier is reported only once for each function it appears in
   drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:63:28: error: 'MDP_PIPE_RDMA0' undeclared (first use in this function)
      63 |                 mutex_id = MDP_PIPE_RDMA0;
         |                            ^~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:65:14: error: 'MDP_COMP_ISP_IMGI' undeclared (first use in this function); did you mean 'MDP_COMP_TYPE_IMGI'?
      65 |         case MDP_COMP_ISP_IMGI:
         |              ^~~~~~~~~~~~~~~~~
         |              MDP_COMP_TYPE_IMGI
   drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:66:28: error: 'MDP_PIPE_IMGI' undeclared (first use in this function)
      66 |                 mutex_id = MDP_PIPE_IMGI;
         |                            ^~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:68:14: error: 'MDP_COMP_WPEI' undeclared (first use in this function); did you mean 'MDP_COMP_TYPE_WPEI'?
      68 |         case MDP_COMP_WPEI:
         |              ^~~~~~~~~~~~~
         |              MDP_COMP_TYPE_WPEI
   drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:69:28: error: 'MDP_PIPE_WPEI' undeclared (first use in this function)
      69 |                 mutex_id = MDP_PIPE_WPEI;
         |                            ^~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:71:14: error: 'MDP_COMP_WPEI2' undeclared (first use in this function); did you mean 'MDP_COMP_TYPE_WPEI'?
      71 |         case MDP_COMP_WPEI2:
         |              ^~~~~~~~~~~~~~
         |              MDP_COMP_TYPE_WPEI
   drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:72:28: error: 'MDP_PIPE_WPEI2' undeclared (first use in this function)
      72 |                 mutex_id = MDP_PIPE_WPEI2;
         |                            ^~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:87:22: error: 'MDP_COMP_AAL0' undeclared (first use in this function)
      87 |                 case MDP_COMP_AAL0:
         |                      ^~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:88:22: error: 'MDP_COMP_CCORR0' undeclared (first use in this function); did you mean 'MDP_COMP_TYPE_CCORR'?
      88 |                 case MDP_COMP_CCORR0:
         |                      ^~~~~~~~~~~~~~~
         |                      MDP_COMP_TYPE_CCORR
   drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:89:22: error: 'MDP_COMP_WDMA' undeclared (first use in this function); did you mean 'MDP_COMP_TYPE_WDMA'?
      89 |                 case MDP_COMP_WDMA:
         |                      ^~~~~~~~~~~~~
         |                      MDP_COMP_TYPE_WDMA
   drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:90:22: error: 'MDP_COMP_WROT0' undeclared (first use in this function)
      90 |                 case MDP_COMP_WROT0:
         |                      ^~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:91:22: error: 'MDP_COMP_TDSHP0' undeclared (first use in this function); did you mean 'MDP_COMP_TYPE_HDR'?
      91 |                 case MDP_COMP_TDSHP0:
         |                      ^~~~~~~~~~~~~~~
         |                      MDP_COMP_TYPE_HDR
   drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:92:22: error: 'MDP_COMP_RSZ1' undeclared (first use in this function)
      92 |                 case MDP_COMP_RSZ1:
         |                      ^~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:93:22: error: 'MDP_COMP_RSZ0' undeclared (first use in this function)
      93 |                 case MDP_COMP_RSZ0:
         |                      ^~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:95:37: error: implicit declaration of function 'mtk_mutex_get_mdp_mod' [-Werror=implicit-function-declaration]
      95 |                         mutex_bit = mtk_mutex_get_mdp_mod(mutex[mutex_id], id);
         |                                     ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:104:17: error: implicit declaration of function 'mtk_mutex_add_mod_by_cmdq'; did you mean 'mtk_mutex_add_comp'? [-Werror=implicit-function-declaration]
     104 |                 mtk_mutex_add_mod_by_cmdq(mutex[mutex_id], subfrm->mutex_mod, cmd);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                 mtk_mutex_add_comp
   drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c: At top level:
   drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:131:39: warning: 'struct mmsys_cmdq_cmd' declared inside parameter list will not be visible outside of this definition or declaration
     131 |                                struct mmsys_cmdq_cmd *cmd)
         |                                       ^~~~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c: In function 'mdp_path_subfrm_run':
   drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:149:30: error: 'MDP_COMP_RDMA0' undeclared (first use in this function)
     149 |                         case MDP_COMP_RDMA0:
         |                              ^~~~~~~~~~~~~~
   In file included from drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:9:
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:28:35: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      28 |         cmdq_pkt_clear_event((cmd)->pkt, (cmd)->event[(evt)])
         |                                   ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:150:33: note: in expansion of macro 'MM_REG_CLEAR'
     150 |                                 MM_REG_CLEAR(cmd, RDMA0_SOF);
         |                                 ^~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:28:47: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      28 |         cmdq_pkt_clear_event((cmd)->pkt, (cmd)->event[(evt)])
         |                                               ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:150:33: note: in expansion of macro 'MM_REG_CLEAR'
     150 |                                 MM_REG_CLEAR(cmd, RDMA0_SOF);
         |                                 ^~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:152:30: error: 'MDP_COMP_TDSHP0' undeclared (first use in this function); did you mean 'MDP_COMP_TYPE_HDR'?
     152 |                         case MDP_COMP_TDSHP0:
         |                              ^~~~~~~~~~~~~~~
         |                              MDP_COMP_TYPE_HDR
   In file included from drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:9:
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:28:35: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      28 |         cmdq_pkt_clear_event((cmd)->pkt, (cmd)->event[(evt)])
         |                                   ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:153:33: note: in expansion of macro 'MM_REG_CLEAR'
     153 |                                 MM_REG_CLEAR(cmd, TDSHP0_SOF);
         |                                 ^~~~~~~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h:28:47: error: invalid use of undefined type 'struct mmsys_cmdq_cmd'
      28 |         cmdq_pkt_clear_event((cmd)->pkt, (cmd)->event[(evt)])
         |                                               ^~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:153:33: note: in expansion of macro 'MM_REG_CLEAR'
     153 |                                 MM_REG_CLEAR(cmd, TDSHP0_SOF);
         |                                 ^~~~~~~~~~~~


vim +123 drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h

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
   114	struct mdp_comp_ctx {
   115		struct mdp_comp			*comp;
   116		const struct img_compparam	*param;
   117		const struct img_input		*input;
   118		const struct img_output		*outputs[IMG_MAX_HW_OUTPUTS];
   119	};
   120	
   121	struct mdp_comp_ops {
   122		s64 (*get_comp_flag)(const struct mdp_comp_ctx *ctx);
 > 123		int (*init_comp)(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd);
   124		int (*config_frame)(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd,
   125				    const struct v4l2_rect *compose);
   126		int (*config_subfrm)(struct mdp_comp_ctx *ctx,
   127				     struct mmsys_cmdq_cmd *cmd, u32 index);
   128		int (*wait_comp_event)(struct mdp_comp_ctx *ctx,
   129				       struct mmsys_cmdq_cmd *cmd);
   130		int (*advance_subfrm)(struct mdp_comp_ctx *ctx,
   131				      struct mmsys_cmdq_cmd *cmd, u32 index);
   132		int (*post_process)(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd);
   133	};
   134	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
