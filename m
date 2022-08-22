Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FC3159CA76
	for <lists+linux-media@lfdr.de>; Mon, 22 Aug 2022 23:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237764AbiHVVDX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Aug 2022 17:03:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237202AbiHVVDT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Aug 2022 17:03:19 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A7AF1160
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 14:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661202198; x=1692738198;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HPLfb0ApsapKmQ8tvYj8MITizmFY4WByJqcmvgwMu80=;
  b=lOnMrcuJWhUWx9Gj7zzT8LeQTkUCTp8Lp0pENzssQ2KyHSOH01vRyoFx
   o7gbZoUv4VY5RiOSImM0zQaCWxBnrn2lWiepyDPBc6GSQoV34n2/OGcHB
   xFr8Bj7+TtTjXNUB/6/EzcCMr0UResTw2tuk+MkEkOCO9GLgpGNZSD4hu
   jLrcklYgniYTVBGuXlFFts3mFeGAlkL/J2i22laBeoGvKFgXfhTtjkvpU
   WzvSLfRljh8DIHtrjyzCHCfkY+TPwK3fGNOnscKttFxbLkmH/fr6yriIk
   7MCySAd4l31cCPQxLwgBztxYSYiMli/m317fndAs8R2LtX1EDTf9AxLkp
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="294804111"
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="294804111"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2022 14:03:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="698428400"
Received: from lkp-server01.sh.intel.com (HELO dd9b29378baa) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Aug 2022 14:03:08 -0700
Received: from kbuild by dd9b29378baa with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oQEZf-0000ij-2R;
        Mon, 22 Aug 2022 21:03:07 +0000
Date:   Tue, 23 Aug 2022 05:02:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     martin.tuma@digiteqautomotive.com, linux-media@vger.kernel.org
Cc:     kbuild-all@lists.01.org,
        Martin =?utf-8?B?VMWvbWE=?= <martin.tuma@digiteqautomotive.com>
Subject: Re: [PATCH 3/3] Added Digiteq Automotive MGB4 driver
Message-ID: <202208230454.wUB5ighv-lkp@intel.com>
References: <20220822194721.1238-4-martin.tuma@digiteqautomotive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220822194721.1238-4-martin.tuma@digiteqautomotive.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on vkoul-dmaengine/next linus/master v6.0-rc2 next-20220822]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/martin-tuma-digiteqautomotive-com/Digiteq-Automotive-MGB4-driver/20220823-015724
base:   git://linuxtv.org/media_tree.git master
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20220823/202208230454.wUB5ighv-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/54f06e839ff47e3223a38eb48ab44aee9866eb30
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review martin-tuma-digiteqautomotive-com/Digiteq-Automotive-MGB4-driver/20220823-015724
        git checkout 54f06e839ff47e3223a38eb48ab44aee9866eb30
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/media/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/pci/mgb4/mgb4_vout.c:202:5: warning: no previous prototype for 'vidioc_g_output' [-Wmissing-prototypes]
     202 | int vidioc_g_output(struct file *file, void *priv, unsigned int *i)
         |     ^~~~~~~~~~~~~~~
>> drivers/media/pci/mgb4/mgb4_vout.c:208:5: warning: no previous prototype for 'vidioc_s_output' [-Wmissing-prototypes]
     208 | int vidioc_s_output(struct file *file, void *priv, unsigned int i)
         |     ^~~~~~~~~~~~~~~
>> drivers/media/pci/mgb4/mgb4_vout.c:213:5: warning: no previous prototype for 'vidioc_enum_output' [-Wmissing-prototypes]
     213 | int vidioc_enum_output(struct file *file, void *priv, struct v4l2_output *out)
         |     ^~~~~~~~~~~~~~~~~~


vim +/vidioc_g_output +202 drivers/media/pci/mgb4/mgb4_vout.c

   201	
 > 202	int vidioc_g_output(struct file *file, void *priv, unsigned int *i)
   203	{
   204		*i = 0;
   205		return 0;
   206	}
   207	
 > 208	int vidioc_s_output(struct file *file, void *priv, unsigned int i)
   209	{
   210		return i ? -EINVAL : 0;
   211	}
   212	
 > 213	int vidioc_enum_output(struct file *file, void *priv, struct v4l2_output *out)
   214	{
   215		if (out->index != 0)
   216			return -EINVAL;
   217	
   218		out->type = V4L2_OUTPUT_TYPE_ANALOG;
   219		strscpy(out->name, "MGB4", sizeof(out->name));
   220	
   221		return 0;
   222	}
   223	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
