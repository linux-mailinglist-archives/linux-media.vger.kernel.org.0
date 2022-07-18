Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 958F4577AE4
	for <lists+linux-media@lfdr.de>; Mon, 18 Jul 2022 08:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231547AbiGRGWE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jul 2022 02:22:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233276AbiGRGVb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jul 2022 02:21:31 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 911D313F06;
        Sun, 17 Jul 2022 23:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658125290; x=1689661290;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UP1Su1i03iUE3Ltwaesy575ZNYed5sPxqxMLM14ke8E=;
  b=WqO8/pzP/zmEdRCc/GEirDg4xLA5hN0XQXTpcyItJhTII0qg/A3A1ekM
   PIxoSDqDH0wzaL1rEDdD5Arodq8VnmnJpKVRZRcjxmzMpePpZH9w0TLto
   YLHbJaht86gmBnWF0iLRP9SIgLGybBpH1weoD/QQrWb73l/t2jTsAtRnc
   11ncfy20XVReNrMyaxhtxPGn8HQlK2Yi2NDsfM5dZP06wnFdmH3/7+y+a
   aSZaWVza7XO0AQJXvluJFSdmLTImtUDl1X34KnneP2SRhJqcT8lBvRh9i
   CCG4rQH6MovIXx0w8DcHPav6lX6PUBLEJtM4xo57UYenqopAEYUfuu+Pr
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10411"; a="311824147"
X-IronPort-AV: E=Sophos;i="5.92,280,1650956400"; 
   d="scan'208";a="311824147"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2022 23:21:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,280,1650956400"; 
   d="scan'208";a="629801821"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 17 Jul 2022 23:21:27 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oDK8E-00045i-C6;
        Mon, 18 Jul 2022 06:21:26 +0000
Date:   Mon, 18 Jul 2022 14:20:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Volodymyr Kharuk <vkh@melexis.com>, linux-media@vger.kernel.org
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Volodymyr Kharuk <vkh@melexis.com>,
        Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michal Simek <monstr@monstr.eu>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 6/6] media: i2c: Add driver for mlx7502x ToF sensor
Message-ID: <202207181432.DwoL0GPb-lkp@intel.com>
References: <6f9b20bb1946d8a50170963b84e32abfdee14ba7.1657786765.git.vkh@melexis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f9b20bb1946d8a50170963b84e32abfdee14ba7.1657786765.git.vkh@melexis.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Volodymyr,

I love your patch! Perhaps something to improve:

[auto build test WARNING on d8e8aa866ed8636fd6c1017c3d9453eab2922496]

url:    https://github.com/intel-lab-lkp/linux/commits/Volodymyr-Kharuk/media-i2c-mlx7502x-ToF-camera-support/20220714-163709
base:   d8e8aa866ed8636fd6c1017c3d9453eab2922496
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20220718/202207181432.DwoL0GPb-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 07022e6cf9b5b3baa642be53d0b3c3f1c403dbfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/59a691c2f449518699a328ea663098aa3ae038b9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Volodymyr-Kharuk/media-i2c-mlx7502x-ToF-camera-support/20220714-163709
        git checkout 59a691c2f449518699a328ea663098aa3ae038b9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/media/i2c/ drivers/net/pcs/ kernel/trace/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/mlx7502x.c:981:13: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           } else if (!on && sensor->streaming) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/mlx7502x.c:993:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/media/i2c/mlx7502x.c:981:9: note: remove the 'if' if its condition is always true
           } else if (!on && sensor->streaming) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/mlx7502x.c:981:13: warning: variable 'ret' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
           } else if (!on && sensor->streaming) {
                      ^~~
   drivers/media/i2c/mlx7502x.c:993:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/media/i2c/mlx7502x.c:981:13: note: remove the '&&' if its condition is always true
           } else if (!on && sensor->streaming) {
                      ^~~~~~
   drivers/media/i2c/mlx7502x.c:945:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   2 warnings generated.


vim +981 drivers/media/i2c/mlx7502x.c

   941	
   942	static int mlx7502x_s_stream(struct v4l2_subdev *sd, int on)
   943	{
   944		struct mlx7502x *sensor = to_mlx7502x(sd);
   945		int ret;
   946	
   947		mutex_lock(&sensor->lock);
   948	
   949		if (on && !sensor->streaming) {
   950			ret = pm_runtime_resume_and_get(sensor->dev);
   951			if (ret < 0) {
   952				mutex_unlock(&sensor->lock);
   953				return ret;
   954			}
   955	
   956			ret = __v4l2_ctrl_handler_setup(sd->ctrl_handler);
   957			if (ret < 0)
   958				goto error_stream;
   959			/* the registers below depends on hmax, which is configured in controls */
   960			ret = mlx7502x_set_link_freq(sensor);
   961			if (ret < 0)
   962				goto error_stream;
   963			ret = mlx7502x_update_output_format(sensor);
   964			if (ret < 0)
   965				goto error_stream;
   966			ret = mlx7502x_set_trigger_mode(sensor);
   967			if (ret < 0)
   968				goto error_stream;
   969	
   970			ret = mlx7502x_write8(sd, MLX7502X_STREAM_EN_REG, 1u);
   971			if (ret < 0)
   972				goto error_stream;
   973	
   974			sensor->streaming = 1u;
   975			dev_dbg(sensor->dev, "stream enabled\n");
   976	
   977			/* we need to wait to stabilize the system after streaming on */
   978			usleep_range(MLX7502X_STREAMING_DELAY_US, MLX7502X_STREAMING_DELAY_US + 10);
   979	
   980			gpiod_set_value_cansleep(sensor->leden, 1);
 > 981		} else if (!on && sensor->streaming) {
   982			gpiod_set_value_cansleep(sensor->leden, 0);
   983	
   984			sensor->streaming = 0u;
   985			ret = mlx7502x_write8(sd, MLX7502X_STREAM_EN_REG, 0u);
   986			dev_dbg(sensor->dev, "stream disabled\n");
   987	
   988			pm_runtime_mark_last_busy(sensor->dev);
   989			pm_runtime_put_autosuspend(sensor->dev);
   990		}
   991	
   992		mutex_unlock(&sensor->lock);
   993		return ret;
   994	
   995	error_stream:
   996		pm_runtime_put(sensor->dev);
   997		mutex_unlock(&sensor->lock);
   998		return ret;
   999	}
  1000	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
