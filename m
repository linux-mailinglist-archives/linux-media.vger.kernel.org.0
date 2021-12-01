Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 529584653A8
	for <lists+linux-media@lfdr.de>; Wed,  1 Dec 2021 18:10:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234353AbhLARN2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Dec 2021 12:13:28 -0500
Received: from mga09.intel.com ([134.134.136.24]:19038 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231379AbhLARN1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Dec 2021 12:13:27 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10185"; a="236323072"
X-IronPort-AV: E=Sophos;i="5.87,279,1631602800"; 
   d="scan'208";a="236323072"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2021 09:08:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,279,1631602800"; 
   d="scan'208";a="560538743"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 01 Dec 2021 09:08:39 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1msT5z-000FB7-3m; Wed, 01 Dec 2021 17:08:39 +0000
Date:   Thu, 2 Dec 2021 01:08:07 +0800
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
Subject: Re: [PATCH v9 7/7] media: platform: mtk-mdp3: add Mediatek MDP3
 driver
Message-ID: <202112020126.zBCAihfa-lkp@intel.com>
References: <20211201095031.31606-8-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211201095031.31606-8-moudy.ho@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Moudy,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on robh/for-next linus/master v5.16-rc3 next-20211201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Moudy-Ho/media-mediatek-support-mdp3-on-mt8183-platform/20211201-175258
base:   git://linuxtv.org/media_tree.git master
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20211202/202112020126.zBCAihfa-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/f6f2b079ebc64ba1d7f0f73b0cfcfe8b98124ec3
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Moudy-Ho/media-mediatek-support-mdp3-on-mt8183-platform/20211201-175258
        git checkout f6f2b079ebc64ba1d7f0f73b0cfcfe8b98124ec3
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arc SHELL=/bin/bash drivers/media/platform/mtk-mdp3/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:7:
   drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c: In function 'mdp_cmdq_send':
>> drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:435:30: warning: format '%s' expects a matching 'char *' argument [-Wformat=]
     435 |                 dev_err(dev, "%s mdp_path_ctx_init error\n");
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:435:17: note: in expansion of macro 'dev_err'
     435 |                 dev_err(dev, "%s mdp_path_ctx_init error\n");
         |                 ^~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:435:32: note: format string is defined here
     435 |                 dev_err(dev, "%s mdp_path_ctx_init error\n");
         |                               ~^
         |                                |
         |                                char *
   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:7:
   drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:445:30: warning: format '%s' expects a matching 'char *' argument [-Wformat=]
     445 |                 dev_err(dev, "%s mdp_path_config error\n");
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:445:17: note: in expansion of macro 'dev_err'
     445 |                 dev_err(dev, "%s mdp_path_config error\n");
         |                 ^~~~~~~
   drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c:445:32: note: format string is defined here
     445 |                 dev_err(dev, "%s mdp_path_config error\n");
         |                               ~^
         |                                |
         |                                char *


vim +435 drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c

   390	
   391	int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
   392	{
   393		struct mmsys_cmdq_cmd cmd;
   394		struct mdp_path *path = NULL;
   395		struct mdp_cmdq_cb_param *cb_param = NULL;
   396		struct mdp_comp *comps = NULL;
   397		struct device *dev = &mdp->pdev->dev;
   398		int i, ret;
   399	
   400		if (atomic_read(&mdp->suspended))
   401			return -ECANCELED;
   402	
   403		atomic_inc(&mdp->job_count);
   404	
   405		cmd.pkt = cmdq_pkt_create(mdp->cmdq_clt, SZ_16K);
   406		if (IS_ERR(cmd.pkt)) {
   407			atomic_dec(&mdp->job_count);
   408			wake_up(&mdp->callback_wq);
   409			return PTR_ERR(cmd.pkt);
   410		}
   411		cmd.event = &mdp->event[0];
   412	
   413		path = kzalloc(sizeof(*path), GFP_KERNEL);
   414		if (!path) {
   415			ret = -ENOMEM;
   416			goto err_destroy_pkt;
   417		}
   418	
   419		path->mdp_dev = mdp;
   420		path->config = param->config;
   421		path->param = param->param;
   422		for (i = 0; i < param->param->num_outputs; i++) {
   423			path->bounds[i].left = 0;
   424			path->bounds[i].top = 0;
   425			path->bounds[i].width =
   426				param->param->outputs[i].buffer.format.width;
   427			path->bounds[i].height =
   428				param->param->outputs[i].buffer.format.height;
   429			path->composes[i] = param->composes[i] ?
   430				param->composes[i] : &path->bounds[i];
   431		}
   432	
   433		ret = mdp_path_ctx_init(mdp, path);
   434		if (ret) {
 > 435			dev_err(dev, "%s mdp_path_ctx_init error\n");
   436			goto err_destroy_pkt;
   437		}
   438	
   439		mtk_mutex_prepare(mdp->mdp_mutex[MDP_PIPE_RDMA0]);
   440		for (i = 0; i < param->config->num_components; i++)
   441			mdp_comp_clock_on(&mdp->pdev->dev, path->comps[i].comp);
   442	
   443		ret = mdp_path_config(mdp, &cmd, path);
   444		if (ret) {
   445			dev_err(dev, "%s mdp_path_config error\n");
   446			goto err_destroy_pkt;
   447		}
   448	
   449		cb_param = kzalloc(sizeof(*cb_param), GFP_KERNEL);
   450		if (!cb_param) {
   451			ret = -ENOMEM;
   452			goto err_destroy_pkt;
   453		}
   454	
   455		comps = kcalloc(param->config->num_components, sizeof(*comps),
   456				GFP_KERNEL);
   457		if (!comps) {
   458			ret = -ENOMEM;
   459			goto err_destroy_pkt;
   460		}
   461	
   462		for (i = 0; i < param->config->num_components; i++)
   463			memcpy(&comps[i], path->comps[i].comp,
   464			       sizeof(struct mdp_comp));
   465		cb_param->mdp = mdp;
   466		cb_param->user_cmdq_cb = param->cmdq_cb;
   467		cb_param->user_cb_data = param->cb_data;
   468		cb_param->pkt = cmd.pkt;
   469		cb_param->comps = comps;
   470		cb_param->num_comps = param->config->num_components;
   471		cb_param->mdp_ctx = param->mdp_ctx;
   472	
   473		cmdq_pkt_finalize(cmd.pkt);
   474		ret = cmdq_pkt_flush_async(cmd.pkt,
   475					   mdp_handle_cmdq_callback,
   476					   (void *)cb_param);
   477		if (ret) {
   478			dev_err(dev, "cmdq_pkt_flush_async fail!\n");
   479			goto err_clock_off;
   480		}
   481		return 0;
   482	
   483	err_clock_off:
   484		mtk_mutex_unprepare(mdp->mdp_mutex[MDP_PIPE_RDMA0]);
   485		mdp_comp_clocks_off(&mdp->pdev->dev, cb_param->comps,
   486				    cb_param->num_comps);
   487	err_destroy_pkt:
   488		cmdq_pkt_destroy(cmd.pkt);
   489		atomic_dec(&mdp->job_count);
   490		wake_up(&mdp->callback_wq);
   491		kfree(comps);
   492		kfree(cb_param);
   493		kfree(path);
   494	
   495		return ret;
   496	}
   497	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
