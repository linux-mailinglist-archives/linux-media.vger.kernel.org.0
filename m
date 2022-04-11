Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C80E4FC4AC
	for <lists+linux-media@lfdr.de>; Mon, 11 Apr 2022 21:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349373AbiDKTIR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Apr 2022 15:08:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349696AbiDKTHx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Apr 2022 15:07:53 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5558435A9B
        for <linux-media@vger.kernel.org>; Mon, 11 Apr 2022 12:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649703918; x=1681239918;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=42RuRms9RenWEfGgBw6IyxZZldn8VXK+Tiajo3ELY64=;
  b=jUnm6gaQn2hFz+ouAxVXqzM2MMwe13pO+a0DHZ+/Ip5IocX1xO0lvAYr
   Xgii0RTl4ME0wiQSdIwqoslJVe2XTWK57R3d8yXLKjPY1+DkxV1vapEIG
   eeXZ4QvcGOhK4vM7Oklaolm5sKyi+wc/9jhl7H97Vf5N4AyA7Z7DOsK1G
   MkRlhOHB50lUCqV31U9+zTQiR79win4MkK1oee8F4uIEVkHshZJ2U/hFN
   PpR7TIfSIgljEpCAinKoA9wEtgRjv3A8imoKO0nLN+NNDnAAakGUZRVNt
   CJ6AKJvX8DNONO8qlPJXV5A9yv/OyUoH0KMN7TyXhFBOre0WKwOjAXsoU
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="322638758"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="322638758"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2022 12:05:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="644206206"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Apr 2022 12:05:16 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1ndzLf-00025g-Lw;
        Mon, 11 Apr 2022 19:05:15 +0000
Date:   Tue, 12 Apr 2022 03:05:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] media: video-mux: Use dev_err_probe()
Message-ID: <202204120223.QxnsaBfK-lkp@intel.com>
References: <20220411135314.1012346-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411135314.1012346-1-p.zabel@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on v5.18-rc2 next-20220411]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Philipp-Zabel/media-video-mux-Use-dev_err_probe/20220411-215408
base:   git://linuxtv.org/media_tree.git master
config: i386-randconfig-r004-20220411 (https://download.01.org/0day-ci/archive/20220412/202204120223.QxnsaBfK-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c6e83f560f06cdfe8aa47b248d8bdc58f947274b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/475ef9688294985534faa74b409355acb00c6873
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Philipp-Zabel/media-video-mux-Use-dev_err_probe/20220411-215408
        git checkout 475ef9688294985534faa74b409355acb00c6873
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/media/platform/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/platform/video-mux.c:444:29: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
                   return dev_err_probe(dev, ret, "Failed to get mux\n");
                                             ^~~
   drivers/media/platform/video-mux.c:413:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   1 warning generated.


vim +/ret +444 drivers/media/platform/video-mux.c

   404	
   405	static int video_mux_probe(struct platform_device *pdev)
   406	{
   407		struct device_node *np = pdev->dev.of_node;
   408		struct device *dev = &pdev->dev;
   409		struct device_node *ep;
   410		struct video_mux *vmux;
   411		unsigned int num_pads = 0;
   412		unsigned int i;
   413		int ret;
   414	
   415		vmux = devm_kzalloc(dev, sizeof(*vmux), GFP_KERNEL);
   416		if (!vmux)
   417			return -ENOMEM;
   418	
   419		platform_set_drvdata(pdev, vmux);
   420	
   421		v4l2_subdev_init(&vmux->subdev, &video_mux_subdev_ops);
   422		snprintf(vmux->subdev.name, sizeof(vmux->subdev.name), "%pOFn", np);
   423		vmux->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
   424		vmux->subdev.dev = dev;
   425	
   426		/*
   427		 * The largest numbered port is the output port. It determines
   428		 * total number of pads.
   429		 */
   430		for_each_endpoint_of_node(np, ep) {
   431			struct of_endpoint endpoint;
   432	
   433			of_graph_parse_endpoint(ep, &endpoint);
   434			num_pads = max(num_pads, endpoint.port + 1);
   435		}
   436	
   437		if (num_pads < 2) {
   438			dev_err(dev, "Not enough ports %d\n", num_pads);
   439			return -EINVAL;
   440		}
   441	
   442		vmux->mux = devm_mux_control_get(dev, NULL);
   443		if (IS_ERR(vmux->mux))
 > 444			return dev_err_probe(dev, ret, "Failed to get mux\n");
   445	
   446		mutex_init(&vmux->lock);
   447		vmux->active = -1;
   448		vmux->pads = devm_kcalloc(dev, num_pads, sizeof(*vmux->pads),
   449					  GFP_KERNEL);
   450		if (!vmux->pads)
   451			return -ENOMEM;
   452	
   453		vmux->format_mbus = devm_kcalloc(dev, num_pads,
   454						 sizeof(*vmux->format_mbus),
   455						 GFP_KERNEL);
   456		if (!vmux->format_mbus)
   457			return -ENOMEM;
   458	
   459		for (i = 0; i < num_pads; i++) {
   460			vmux->pads[i].flags = (i < num_pads - 1) ? MEDIA_PAD_FL_SINK
   461								 : MEDIA_PAD_FL_SOURCE;
   462			vmux->format_mbus[i] = video_mux_format_mbus_default;
   463		}
   464	
   465		vmux->subdev.entity.function = MEDIA_ENT_F_VID_MUX;
   466		ret = media_entity_pads_init(&vmux->subdev.entity, num_pads,
   467					     vmux->pads);
   468		if (ret < 0)
   469			return ret;
   470	
   471		vmux->subdev.entity.ops = &video_mux_ops;
   472	
   473		ret = video_mux_async_register(vmux, num_pads - 1);
   474		if (ret) {
   475			v4l2_async_nf_unregister(&vmux->notifier);
   476			v4l2_async_nf_cleanup(&vmux->notifier);
   477		}
   478	
   479		return ret;
   480	}
   481	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
