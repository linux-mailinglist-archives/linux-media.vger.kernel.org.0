Return-Path: <linux-media+bounces-2051-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C85F80B522
	for <lists+linux-media@lfdr.de>; Sat,  9 Dec 2023 16:54:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DB4C281007
	for <lists+linux-media@lfdr.de>; Sat,  9 Dec 2023 15:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD754168C5;
	Sat,  9 Dec 2023 15:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R8Q1uHRY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B439992;
	Sat,  9 Dec 2023 07:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702137285; x=1733673285;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cJAVYCTsvvg1pGHyApm68cNmhcwZTU4j+YwuPZIG6ko=;
  b=R8Q1uHRYiQp3dHzGzarC8IChBdwriDsfX02puif6koQ45OhQ32FtX2mO
   0Va7WRGieAbxVhacjaVdQ23wS0bNv2wW1DBKxDUfTjJAOZLh+OWO0FH1f
   gstmdTMJSCTJedpbBQ+gBpVAX4z9w31/KoqaOvX6G/jCqeanqRxT+Uihq
   BJioiGw0T9XK6oGVCunGADvqQvCqymkp0B88Ryq7YgRv84eF6nFM7E3YW
   L7IsVofrYGoM148fKqkyxBFFIwvGtP+7cHhfkL7EbVOnwQeDZpW30EEtp
   BWTlJjd4XoOMByN7xXiq2GKE13D2F9ADGvgd/R+2s3QLtTM9z2/Gu6ZpN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="1614681"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="1614681"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 07:54:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="842949695"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="842949695"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 09 Dec 2023 07:54:42 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBzf6-000FXv-0J;
	Sat, 09 Dec 2023 15:54:40 +0000
Date: Sat, 9 Dec 2023 23:54:25 +0800
From: kernel test robot <lkp@intel.com>
To: Julien Massot <julien.massot@collabora.com>, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, kernel@collabora.com,
	Julien Massot <julien.massot@collabora.com>
Subject: Re: [PATCH v2 3/4] media: i2c: add MAX96714 driver
Message-ID: <202312092303.ww5viNmZ-lkp@intel.com>
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
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20231209/202312092303.ww5viNmZ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231209/202312092303.ww5viNmZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312092303.ww5viNmZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/i2c/max96714.c: In function 'max96714_csi_status':
>> drivers/media/i2c/max96714.c:380:16: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
     380 |         freq = FIELD_GET(CSI_DPLL_FREQ_MASK, freq);
         |                ^~~~~~~~~
   drivers/media/i2c/max96714.c: In function 'max96714_init_tx_port':
>> drivers/media/i2c/max96714.c:600:15: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     600 |         val = FIELD_PREP(MAX96714_CSI2_LANE_CNT_MASK, mipi->num_data_lanes - 1);
         |               ^~~~~~~~~~
   cc1: some warnings being treated as errors


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

