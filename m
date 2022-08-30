Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53B1E5A6CC1
	for <lists+linux-media@lfdr.de>; Tue, 30 Aug 2022 21:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231136AbiH3TFf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Aug 2022 15:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230469AbiH3TFc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Aug 2022 15:05:32 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FE632980C
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 12:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661886331; x=1693422331;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l0sltWLpbssIHX56vEWFZzvHjV30DJe44nZZulvkMp8=;
  b=BFSjqWUpu6zKbvZ8GB+WY0+H5nl+6LA76RlyZ7W4mqTIQURpMKIi0cNi
   y1zT3vmjx4L6pSjgbH6Fi4f9JNkzDb1JV8MMQVKSRA5paCExQgBJDQg3W
   UXbgyNkhTHnvtv733OJ4d2xxsoIELIglIU6/J2csASRDbgeSb3aJiuV9v
   5zjbsKyYz+oDNYixVGDgRfDDJEM8Fw9EC7B4CqN5jR033/EkuJg3evjdJ
   unFhtt+Ui4zX4cPxq0YhLySGR5ooyd4pRRy86jLpT3BzgZMJ8UVJsk4jq
   7yR9p9UvGj4cyxVsBiJiP/3/FxgaZHO3YmqK001fDxIirkBZeak958YWb
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="296556052"
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="296556052"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 12:05:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="940156451"
Received: from lkp-server02.sh.intel.com (HELO 77b6d4e16fc5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 30 Aug 2022 12:05:28 -0700
Received: from kbuild by 77b6d4e16fc5 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oT6YB-0000Vz-2x;
        Tue, 30 Aug 2022 19:05:27 +0000
Date:   Wed, 31 Aug 2022 03:04:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        linux-media@vger.kernel.org
Cc:     kbuild-all@lists.01.org, alain.volmat@foss.st.com,
        hugues.fruchet@foss.st.com, sylvain.petinot@foss.st.com,
        dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: Re: [PATCH v4 4/4] media: i2c: Add driver for ST VGXY61 camera sensor
Message-ID: <202208310250.RYcuxgtj-lkp@intel.com>
References: <20220830121608.12047-5-benjamin.mugnier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830121608.12047-5-benjamin.mugnier@foss.st.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.0-rc3 next-20220830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Mugnier/media-Add-ST-VGXY61-camera-sensor-driver/20220830-201917
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git dcf8e5633e2e69ad60b730ab5905608b756a032f
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20220831/202208310250.RYcuxgtj-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6d33c014e63aa7c096d2ea01dd5e356ffef719d5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Benjamin-Mugnier/media-Add-ST-VGXY61-camera-sensor-driver/20220830-201917
        git checkout 6d33c014e63aa7c096d2ea01dd5e356ffef719d5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/media/i2c/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/media/i2c/st-vgxy61.c: In function 'vgxy61_read_multiple':
>> drivers/media/i2c/st-vgxy61.c:543:16: error: implicit declaration of function 'get_unaligned_le32' [-Werror=implicit-function-declaration]
     543 |         return get_unaligned_le32(val);
         |                ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/get_unaligned_le32 +543 drivers/media/i2c/st-vgxy61.c

   511	
   512	static int vgxy61_read_multiple(struct vgxy61_dev *sensor, u32 reg,
   513					unsigned int len)
   514	{
   515		struct i2c_client *client = sensor->i2c_client;
   516		struct i2c_msg msg[2];
   517		u8 buf[2];
   518		u8 val[sizeof(u32)] = {0};
   519		int ret;
   520	
   521		if (len > sizeof(u32))
   522			return -EINVAL;
   523		buf[0] = reg >> 8;
   524		buf[1] = reg & 0xff;
   525	
   526		msg[0].addr = client->addr;
   527		msg[0].flags = client->flags;
   528		msg[0].buf = buf;
   529		msg[0].len = sizeof(buf);
   530	
   531		msg[1].addr = client->addr;
   532		msg[1].flags = client->flags | I2C_M_RD;
   533		msg[1].buf = val;
   534		msg[1].len = len;
   535	
   536		ret = i2c_transfer(client->adapter, msg, 2);
   537		if (ret < 0) {
   538			dev_dbg(&client->dev, "%s: %x i2c_transfer, reg: %x => %d\n",
   539				__func__, client->addr, reg, ret);
   540			return ret;
   541		}
   542	
 > 543		return get_unaligned_le32(val);
   544	}
   545	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
