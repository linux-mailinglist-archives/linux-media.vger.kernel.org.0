Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2466C1F86BA
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2020 06:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725550AbgFNEbk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 00:31:40 -0400
Received: from mga17.intel.com ([192.55.52.151]:25540 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725267AbgFNEbk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 00:31:40 -0400
IronPort-SDR: gV/HuZpZs5PxpTKGeWpV0Afj18Z0cibcstWVzod5XlUzVuki6ZCbPq8NLybSu6Yi285sHBble6
 BEQpFWuELRnw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2020 21:31:39 -0700
IronPort-SDR: OjQ8DDwK0iA2EoiTid46gNYeZhXlP32WBFD/25jPPJFyx1zoakP2nC+7jXZzdiMvn2H3/iee1I
 NAprT1tz7d5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,509,1583222400"; 
   d="scan'208";a="260672064"
Received: from lkp-server02.sh.intel.com (HELO de5642daf266) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 13 Jun 2020 21:31:36 -0700
Received: from kbuild by de5642daf266 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jkKIx-0000Zj-3R; Sun, 14 Jun 2020 04:31:35 +0000
Date:   Sun, 14 Jun 2020 12:31:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com
Cc:     kbuild-all@lists.01.org, Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, linux-media@vger.kernel.org
Subject: Re: [PATCH v4 3/9] media: i2c: ov6650: Use new [get|set]_mbus_config
 ops
Message-ID: <202006141205.6pZgvwtN%lkp@intel.com>
References: <20200611161651.264633-4-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200611161651.264633-4-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linuxtv-media/master]
[also build test WARNING on v5.7]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Jacopo-Mondi/v4l2-subdev-Introduce-g-s-et_mbus_format-pad-op/20200612-001600
base:   git://linuxtv.org/media_tree.git master
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/media/i2c/ov6650.c:941:34: warning: Clarify calculation precedence for '&' and '?'. [clarifyCalculation]
        |  (comj & COMJ_VSYNC_HIGH  ? V4L2_MBUS_VSYNC_ACTIVE_HIGH
                                    ^
   drivers/media/i2c/ov6650.c:943:34: warning: Clarify calculation precedence for '&' and '?'. [clarifyCalculation]
        |  (comf & COMF_HREF_LOW    ? V4L2_MBUS_HSYNC_ACTIVE_LOW
                                    ^
   drivers/media/i2c/ov6650.c:945:34: warning: Clarify calculation precedence for '&' and '?'. [clarifyCalculation]
        |  (comj & COMJ_PCLK_RISING ? V4L2_MBUS_PCLK_SAMPLE_RISING
                                    ^
--
   In file included from fs/nfsd/trace.c:
>> fs/nfsd/trace.h:175:0: warning: There is an unknown macro here somewhere. Configuration is required. If DECLARE_EVENT_CLASS is a macro then please configure it. [unknownMacro]
   
   ^
>> fs/nfsd/nfsctl.c:1277:7: warning: Opposite inner 'if' condition leads to a dead code block. [oppositeInnerCondition]
     if (!files->name)
         ^
   fs/nfsd/nfsctl.c:1276:19: note: outer condition: files->name
    for (i = 0; files->name && files->name[0]; i++, files++) {
                     ^
   fs/nfsd/nfsctl.c:1277:7: note: opposite inner condition: !files->name
     if (!files->name)
         ^
>> fs/nfsd/nfsctl.c:524:5: warning: Variable 'rv' is reassigned a value before the old one has been used. [redundantAssignment]
    rv = nfsd_get_nrthreads(npools, nthreads, net);
       ^
   fs/nfsd/nfsctl.c:504:5: note: Variable 'rv' is reassigned a value before the old one has been used.
    rv = -ENOMEM;
       ^
   fs/nfsd/nfsctl.c:524:5: note: Variable 'rv' is reassigned a value before the old one has been used.
    rv = nfsd_get_nrthreads(npools, nthreads, net);
       ^
>> fs/nfsd/nfsctl.c:1201:6: warning: Variable 'ret' is reassigned a value before the old one has been used. [redundantAssignment]
    ret = __nfsd_mkdir(d_inode(parent), dentry, S_IFDIR | 0600, ncl);
        ^
   fs/nfsd/nfsctl.c:1195:0: note: Variable 'ret' is reassigned a value before the old one has been used.
    int ret = -ENOMEM;
   ^
   fs/nfsd/nfsctl.c:1201:6: note: Variable 'ret' is reassigned a value before the old one has been used.
    ret = __nfsd_mkdir(d_inode(parent), dentry, S_IFDIR | 0600, ncl);
        ^

vim +941 drivers/media/i2c/ov6650.c

   922	
   923	/* Request bus settings on camera side */
   924	static int ov6650_get_mbus_config(struct v4l2_subdev *sd,
   925					  unsigned int pad,
   926					  struct v4l2_mbus_config *cfg)
   927	{
   928		struct i2c_client *client = v4l2_get_subdevdata(sd);
   929		u8 comj, comf;
   930		int ret;
   931	
   932		ret = ov6650_reg_read(client, REG_COMJ, &comj);
   933		if (ret)
   934			return ret;
   935	
   936		ret = ov6650_reg_read(client, REG_COMF, &comf);
   937		if (ret)
   938			return ret;
   939	
   940		cfg->flags = V4L2_MBUS_MASTER
 > 941			   |  (comj & COMJ_VSYNC_HIGH  ? V4L2_MBUS_VSYNC_ACTIVE_HIGH
   942						       : V4L2_MBUS_VSYNC_ACTIVE_LOW)
   943			   |  (comf & COMF_HREF_LOW    ? V4L2_MBUS_HSYNC_ACTIVE_LOW
   944						       : V4L2_MBUS_HSYNC_ACTIVE_HIGH)
   945			   |  (comj & COMJ_PCLK_RISING ? V4L2_MBUS_PCLK_SAMPLE_RISING
   946						       : V4L2_MBUS_PCLK_SAMPLE_FALLING);
   947		cfg->type = V4L2_MBUS_PARALLEL;
   948	
   949		return 0;
   950	}
   951	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
