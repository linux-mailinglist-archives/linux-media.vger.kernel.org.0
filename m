Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F3595B1128
	for <lists+linux-media@lfdr.de>; Thu,  8 Sep 2022 02:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbiIHAar (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 20:30:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbiIHAaq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 20:30:46 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49486D0231
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 17:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662597045; x=1694133045;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l28QU1OI5mxmuhZxvIeFJCS6O6hrvLbBj9qVIE01py0=;
  b=PfDUyFOe097R/sY4hOFthjm/ZlPUmdQOUF0s+l8h9Nb6NYI82M+/FjSD
   m1SJlj4Qp991iGYNZ8aMt1Yq3yNodVmlEIpX9z1UF/p+D+2o0N/uXDDZt
   p+dfeVgVN+hnFKCz9OKvMVJ1aQhdLhHNnHtqcxmTk2WhKKp46Oi5EjJOO
   O3MNJEl3ViAOwWp3e/O8UsHZaIDlLZQZj4bRht95DCgJAq5DjW7xuU8MN
   sOazoynm6vrh97fmOaUgiKe3HvOqQgvh7Pbg88mpsjqwHVJ/AmM7BOFqo
   SHZZ+tFxnkjoLhH6+FVk0oNpcFkSmoUJzqJDVS4BnBvE+rVihAui6KpYt
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="297836649"
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; 
   d="scan'208";a="297836649"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2022 17:30:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; 
   d="scan'208";a="591935835"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 07 Sep 2022 17:30:40 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oW5RH-00079T-2C;
        Thu, 08 Sep 2022 00:30:39 +0000
Date:   Thu, 8 Sep 2022 08:30:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     kbuild-all@lists.01.org, linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [sailus-media-tree:streams 20/26]
 drivers/media/test-drivers/vimc/vimc-capture.c:249:44: error: 'vcap'
 undeclared
Message-ID: <202209080814.8csZ9uMJ-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   git://linuxtv.org/sailus/media_tree.git streams
head:   4a1af70e7350faee9c9c0a34e529f9e417eea467
commit: f612352ecd419db911f9441257a49da946041304 [20/26] media: drivers: use video device pipeline start/stop
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20220908/202209080814.8csZ9uMJ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add sailus-media-tree git://linuxtv.org/sailus/media_tree.git
        git fetch --no-tags sailus-media-tree streams
        git checkout f612352ecd419db911f9441257a49da946041304
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/media/test-drivers/vimc/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/media/test-drivers/vimc/vimc-capture.c: In function 'vimc_capture_start_streaming':
>> drivers/media/test-drivers/vimc/vimc-capture.c:249:44: error: 'vcap' undeclared (first use in this function)
     249 |         ret = video_device_pipeline_start(&vcap->vdev, &vcap->stream.pipe);
         |                                            ^~~~
   drivers/media/test-drivers/vimc/vimc-capture.c:249:44: note: each undeclared identifier is reported only once for each function it appears in


vim +/vcap +249 drivers/media/test-drivers/vimc/vimc-capture.c

   240	
   241	static int vimc_capture_start_streaming(struct vb2_queue *vq, unsigned int count)
   242	{
   243		struct vimc_capture_device *vcapture = vb2_get_drv_priv(vq);
   244		int ret;
   245	
   246		vcapture->sequence = 0;
   247	
   248		/* Start the media pipeline */
 > 249		ret = video_device_pipeline_start(&vcap->vdev, &vcap->stream.pipe);
   250		if (ret) {
   251			vimc_capture_return_all_buffers(vcapture, VB2_BUF_STATE_QUEUED);
   252			return ret;
   253		}
   254	
   255		ret = vimc_streamer_s_stream(&vcapture->stream, &vcapture->ved, 1);
   256		if (ret) {
   257			video_device_pipeline_stop(&vcap->vdev);
   258			vimc_capture_return_all_buffers(vcapture, VB2_BUF_STATE_QUEUED);
   259			return ret;
   260		}
   261	
   262		return 0;
   263	}
   264	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
