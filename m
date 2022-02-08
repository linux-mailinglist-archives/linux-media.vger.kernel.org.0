Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE514AE3A8
	for <lists+linux-media@lfdr.de>; Tue,  8 Feb 2022 23:24:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387404AbiBHWXv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Feb 2022 17:23:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386272AbiBHT5K (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Feb 2022 14:57:10 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97878C0612C3
        for <linux-media@vger.kernel.org>; Tue,  8 Feb 2022 11:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644350229; x=1675886229;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xzTx4vda8rhB0dNjz2TiKmmUDpCPHFWdpUPOjxLgdu4=;
  b=BzlDzS90cWlA85U5NK+GWws6vvM+ipNDjLUEYBAynGuvP6xizOvnM4kJ
   eQESGpW+s8vnvyDUKoXlGs4jydwCMddw4lQCj7e1EXcljlvfIxbGnBSr+
   BwymjBspEfbJptK4J2SvQAX1kIJLWhOD9e8DzgHNMVU36wYDk1ljRLjWa
   wE3JojcIAvxtqBCwYvQnprkuQfomQGhnq4l7dHqTdMrJN/HdR4otcbgRJ
   7bstuqbDbgVqylWNvreaGfyq0lbK6uobSGkGzOFnFEbStMWyAaW3wfqRx
   dTBn1ppg4ceBI5NFrGbFm5dzYbTzjCpz6AS87WrzNiDWhCYQumEtUT5fq
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="335439815"
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; 
   d="scan'208";a="335439815"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2022 11:57:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; 
   d="scan'208";a="632961848"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Feb 2022 11:57:06 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nHWbp-0000gB-Jn; Tue, 08 Feb 2022 19:57:05 +0000
Date:   Wed, 9 Feb 2022 03:56:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     kbuild-all@lists.01.org,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v3 7/7] media: subdev: rename
 v4l2_subdev_pad_config.try_* fields
Message-ID: <202202090347.nNP3NUjy-lkp@intel.com>
References: <20220207161107.1166376-8-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207161107.1166376-8-tomi.valkeinen@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

I love your patch! Yet something to improve:

[auto build test ERROR on media-tree/master]
[also build test ERROR on tegra/for-next v5.17-rc3]
[cannot apply to next-20220208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Tomi-Valkeinen/v4l-subdev-active-state/20220208-002350
base:   git://linuxtv.org/media_tree.git master
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220209/202202090347.nNP3NUjy-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/8283dea08111c6a813e9340d735c158df3fcbe5f
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Tomi-Valkeinen/v4l-subdev-active-state/20220208-002350
        git checkout 8283dea08111c6a813e9340d735c158df3fcbe5f
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/staging/media/atomisp/pci/atomisp_file.c: In function 'file_input_set_fmt':
>> drivers/staging/media/atomisp/pci/atomisp_file.c:116:17: error: 'struct v4l2_subdev_pad_config' has no member named 'try_fmt'
     116 |   sd_state->pads->try_fmt = *fmt;
         |                 ^~
--
   drivers/staging/media/atomisp/pci/atomisp_tpg.c: In function 'tpg_set_fmt':
>> drivers/staging/media/atomisp/pci/atomisp_tpg.c:50:17: error: 'struct v4l2_subdev_pad_config' has no member named 'try_fmt'
      50 |   sd_state->pads->try_fmt = *fmt;
         |                 ^~
--
   drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c: In function 'mt9m114_set_fmt':
>> drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c:757:17: error: 'struct v4l2_subdev_pad_config' has no member named 'try_fmt'
     757 |   sd_state->pads->try_fmt = *fmt;
         |                 ^~
--
   drivers/staging/media/atomisp/i2c/atomisp-gc2235.c: In function 'gc2235_set_fmt':
>> drivers/staging/media/atomisp/i2c/atomisp-gc2235.c:735:17: error: 'struct v4l2_subdev_pad_config' has no member named 'try_fmt'
     735 |   sd_state->pads->try_fmt = *fmt;
         |                 ^~
--
   drivers/staging/media/atomisp/i2c/atomisp-ov2722.c: In function 'ov2722_set_fmt':
>> drivers/staging/media/atomisp/i2c/atomisp-ov2722.c:840:17: error: 'struct v4l2_subdev_pad_config' has no member named 'try_fmt'
     840 |   sd_state->pads->try_fmt = *fmt;
         |                 ^~
--
   drivers/staging/media/atomisp/i2c/atomisp-ov2680.c: In function 'ov2680_set_fmt':
>> drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:857:17: error: 'struct v4l2_subdev_pad_config' has no member named 'try_fmt'
     857 |   sd_state->pads->try_fmt = *fmt;
         |                 ^~
--
   drivers/staging/media/atomisp/i2c/atomisp-gc0310.c: In function 'gc0310_set_fmt':
>> drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:933:17: error: 'struct v4l2_subdev_pad_config' has no member named 'try_fmt'
     933 |   sd_state->pads->try_fmt = *fmt;
         |                 ^~
--
   drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c: In function 'ov5693_set_fmt':
>> drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c:1611:17: error: 'struct v4l2_subdev_pad_config' has no member named 'try_fmt'
    1611 |   sd_state->pads->try_fmt = *fmt;
         |                 ^~


vim +116 drivers/staging/media/atomisp/pci/atomisp_file.c

ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_file.c Mauro Carvalho Chehab 2020-04-19  105  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_file.c Mauro Carvalho Chehab 2020-04-19  106  static int file_input_set_fmt(struct v4l2_subdev *sd,
0d346d2a6f54f0 drivers/staging/media/atomisp/pci/atomisp_file.c          Tomi Valkeinen        2021-06-10  107  			      struct v4l2_subdev_state *sd_state,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_file.c Mauro Carvalho Chehab 2020-04-19  108  			      struct v4l2_subdev_format *format)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_file.c Mauro Carvalho Chehab 2020-04-19  109  {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_file.c Mauro Carvalho Chehab 2020-04-19  110  	struct v4l2_mbus_framefmt *fmt = &format->format;
bdfe0beb95eebc drivers/staging/media/atomisp/pci/atomisp2/atomisp_file.c Mauro Carvalho Chehab 2020-04-19  111  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_file.c Mauro Carvalho Chehab 2020-04-19  112  	if (format->pad)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_file.c Mauro Carvalho Chehab 2020-04-19  113  		return -EINVAL;
0d346d2a6f54f0 drivers/staging/media/atomisp/pci/atomisp_file.c          Tomi Valkeinen        2021-06-10  114  	file_input_get_fmt(sd, sd_state, format);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_file.c Mauro Carvalho Chehab 2020-04-19  115  	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
0d346d2a6f54f0 drivers/staging/media/atomisp/pci/atomisp_file.c          Tomi Valkeinen        2021-06-10 @116  		sd_state->pads->try_fmt = *fmt;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_file.c Mauro Carvalho Chehab 2020-04-19  117  	return 0;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_file.c Mauro Carvalho Chehab 2020-04-19  118  }
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_file.c Mauro Carvalho Chehab 2020-04-19  119  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
