Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A1697D3A2B
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 16:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233589AbjJWO6d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 10:58:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233387AbjJWO6K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 10:58:10 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D6E110CE
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 07:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698073086; x=1729609086;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GpHT7dwhiaAIVi8GEzhv627UCbAEOtNA77azwhuFGes=;
  b=NXB74zWnpg1XC4q6jRTQ0vOFq8XYJm6x+qdVaA23DmXTq8UGH8jun30u
   WIsFmcOeIz+EdabptAhieYOXQicStCjj91qJH6IK3COZjuM46IG9X+vNe
   ZuOyEOVmIEN7mTn96yVC1X9WrB8aiNYOubFqOBp3GiSrq9aDraMZgUzu1
   xNYwT8knUuTCSVWnBWSSxMbOvMahxiuC7GmnFSJ1uhEUBI2XlEY/7FrHJ
   zvwNLbbbI6JGxObGjQXkKhyqpT5odaGiaB9tlqHlo8usqbYjcLz0NTzzT
   cOtZGAobJ/ditzNDtM899cAw4evrfNHkE3njJwXQq5gVW6nIV4b9py0VN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="417989509"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="417989509"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 07:58:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="707978086"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="707978086"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 23 Oct 2023 07:57:57 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1quwNO-00070P-26;
        Mon, 23 Oct 2023 14:57:54 +0000
Date:   Mon, 23 Oct 2023 22:56:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     oe-kbuild-all@lists.linux.dev, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
        jacopo.mondi@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com
Subject: Re: [PATCH v2 5/6] media: v4l: subdev: Switch to stream-aware state
 functions
Message-ID: <202310232249.qOLKJuzq-lkp@intel.com>
References: <20231023123308.782592-6-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023123308.782592-6-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on next-20231023]
[cannot apply to rockchip/for-next sailus-media-tree/streams linus/master v6.6-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-v4l-subdev-Also-return-pads-array-information-on-stream-functions/20231023-203626
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20231023123308.782592-6-sakari.ailus%40linux.intel.com
patch subject: [PATCH v2 5/6] media: v4l: subdev: Switch to stream-aware state functions
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231023/202310232249.qOLKJuzq-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231023/202310232249.qOLKJuzq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310232249.qOLKJuzq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/i2c/imx319.c: In function 'imx319_do_get_pad_format':
>> drivers/media/i2c/imx319.c:2004:29: warning: unused variable 'sd' [-Wunused-variable]
    2004 |         struct v4l2_subdev *sd = &imx319->sd;
         |                             ^~
--
   drivers/media/i2c/imx355.c: In function 'imx355_do_get_pad_format':
>> drivers/media/i2c/imx355.c:1302:29: warning: unused variable 'sd' [-Wunused-variable]
    1302 |         struct v4l2_subdev *sd = &imx355->sd;
         |                             ^~
--
   drivers/media/i2c/ov08x40.c: In function 'ov08x40_do_get_pad_format':
>> drivers/media/i2c/ov08x40.c:2777:29: warning: unused variable 'sd' [-Wunused-variable]
    2777 |         struct v4l2_subdev *sd = &ov08x->sd;
         |                             ^~
--
   drivers/media/i2c/ov13858.c: In function 'ov13858_do_get_pad_format':
>> drivers/media/i2c/ov13858.c:1319:29: warning: unused variable 'sd' [-Wunused-variable]
    1319 |         struct v4l2_subdev *sd = &ov13858->sd;
         |                             ^~
--
   drivers/media/i2c/ov13b10.c: In function 'ov13b10_do_get_pad_format':
>> drivers/media/i2c/ov13b10.c:1004:29: warning: unused variable 'sd' [-Wunused-variable]
    1004 |         struct v4l2_subdev *sd = &ov13b->sd;
         |                             ^~
--
   drivers/media/i2c/s5c73m3/s5c73m3-core.c: In function 's5c73m3_oif_try_format':
>> drivers/media/i2c/s5c73m3/s5c73m3-core.c:822:29: warning: unused variable 'sd' [-Wunused-variable]
     822 |         struct v4l2_subdev *sd = &state->sensor_sd;
         |                             ^~


vim +/sd +2004 drivers/media/i2c/imx319.c

8a89dc62f28c48 Bingbu Cao     2018-09-25  1998  
8a89dc62f28c48 Bingbu Cao     2018-09-25  1999  static int imx319_do_get_pad_format(struct imx319 *imx319,
0d346d2a6f54f0 Tomi Valkeinen 2021-06-10  2000  				    struct v4l2_subdev_state *sd_state,
8a89dc62f28c48 Bingbu Cao     2018-09-25  2001  				    struct v4l2_subdev_format *fmt)
8a89dc62f28c48 Bingbu Cao     2018-09-25  2002  {
8a89dc62f28c48 Bingbu Cao     2018-09-25  2003  	struct v4l2_mbus_framefmt *framefmt;
8a89dc62f28c48 Bingbu Cao     2018-09-25 @2004  	struct v4l2_subdev *sd = &imx319->sd;
8a89dc62f28c48 Bingbu Cao     2018-09-25  2005  
8a89dc62f28c48 Bingbu Cao     2018-09-25  2006  	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
e3851498f6c205 Sakari Ailus   2023-10-23  2007  		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
8a89dc62f28c48 Bingbu Cao     2018-09-25  2008  		fmt->format = *framefmt;
8a89dc62f28c48 Bingbu Cao     2018-09-25  2009  	} else {
8a89dc62f28c48 Bingbu Cao     2018-09-25  2010  		imx319_update_pad_format(imx319, imx319->cur_mode, fmt);
8a89dc62f28c48 Bingbu Cao     2018-09-25  2011  	}
8a89dc62f28c48 Bingbu Cao     2018-09-25  2012  
8a89dc62f28c48 Bingbu Cao     2018-09-25  2013  	return 0;
8a89dc62f28c48 Bingbu Cao     2018-09-25  2014  }
8a89dc62f28c48 Bingbu Cao     2018-09-25  2015  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
