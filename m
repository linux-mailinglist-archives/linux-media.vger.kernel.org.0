Return-Path: <linux-media+bounces-2056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A90F80B864
	for <lists+linux-media@lfdr.de>; Sun, 10 Dec 2023 03:14:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF9D41F20FF4
	for <lists+linux-media@lfdr.de>; Sun, 10 Dec 2023 02:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA1115AC;
	Sun, 10 Dec 2023 02:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZxMY94S"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01AD310C;
	Sat,  9 Dec 2023 18:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702174459; x=1733710459;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5Hoh8xC8QuCdZj3NU4XXc2R6BshZ5CNSyUaWRE/sbek=;
  b=iZxMY94SHx5KxYMXpGb+EqcjgODpt+3vUxsNr0JwOKqOOgUqUsLvosQl
   VycdiBLpwRmPAUlehNd7Dqns7+JvH9V5JALlEOJjXLrWIfc6Iz2o1MIf4
   90MO3R34KxvFLDHtspjG+U1WxQ1WgN6rPaWVSI2hd/li2VQDWe30yJ16G
   mxnqcjJW4n5mWf4f6pFj+dVwcc5MS1f4CPiA294sn1ZqabojxDkI/62wI
   zYIbZkafU3HjNkJpM18YQIMZRco4+/Z7yTKEP4JawPPiFFJCjk1rO4SHP
   W+qJ6K3g47V7WU4JWnadNz6a+3jISI/9pwqmxui1Y8MILt+NUJegX9EkH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="1351267"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="1351267"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 18:14:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="945819767"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="945819767"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 09 Dec 2023 18:14:15 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rC9Kf-000GH7-1a;
	Sun, 10 Dec 2023 02:14:13 +0000
Date: Sun, 10 Dec 2023 10:13:47 +0800
From: kernel test robot <lkp@intel.com>
To: Julien Massot <julien.massot@collabora.com>, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kernel@collabora.com, Julien Massot <julien.massot@collabora.com>
Subject: Re: [PATCH v2 3/4] media: i2c: add MAX96714 driver
Message-ID: <202312101007.RRCFzwfA-lkp@intel.com>
References: <20231208143359.469049-4-julien.massot@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208143359.469049-4-julien.massot@collabora.com>

Hi Julien,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linuxtv-media-stage/master linus/master v6.7-rc4 next-20231208]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Julien-Massot/dt-bindings-media-add-Maxim-MAX96714F-GMSL2-Deserializer/20231208-223758
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20231208143359.469049-4-julien.massot%40collabora.com
patch subject: [PATCH v2 3/4] media: i2c: add MAX96714 driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231210/202312101007.RRCFzwfA-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231210/202312101007.RRCFzwfA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312101007.RRCFzwfA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/max96714.c:380:9: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           freq = FIELD_GET(CSI_DPLL_FREQ_MASK, freq);
                  ^
>> drivers/media/i2c/max96714.c:600:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           val = FIELD_PREP(MAX96714_CSI2_LANE_CNT_MASK, mipi->num_data_lanes - 1);
                 ^
   2 errors generated.


vim +/FIELD_GET +380 drivers/media/i2c/max96714.c

   373	
   374	static void max96714_csi_status(struct max96714_priv *priv)
   375	{
   376		struct device *dev = &priv->client->dev;
   377		u8 freq;
   378	
   379		max96714_read(priv, MAX96714_BACKTOP25, &freq);
 > 380		freq = FIELD_GET(CSI_DPLL_FREQ_MASK, freq);
   381	
   382		dev_info(dev, "CSI controller DPLL freq:%u00MHz CSIPHY enabled:%d\n",
   383			 freq, max96714_tx_port_enabled(priv));
   384	}
   385	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

