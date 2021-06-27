Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 575403B5525
	for <lists+linux-media@lfdr.de>; Sun, 27 Jun 2021 22:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231599AbhF0UnH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Jun 2021 16:43:07 -0400
Received: from mga01.intel.com ([192.55.52.88]:29991 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231473AbhF0UnG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Jun 2021 16:43:06 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10028"; a="229474017"
X-IronPort-AV: E=Sophos;i="5.83,304,1616482800"; 
   d="gz'50?scan'50,208,50";a="229474017"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2021 13:40:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,304,1616482800"; 
   d="gz'50?scan'50,208,50";a="418938771"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 27 Jun 2021 13:40:40 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lxba3-0008HL-Ch; Sun, 27 Jun 2021 20:40:39 +0000
Date:   Mon, 28 Jun 2021 04:40:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: drivers/staging/media/ipu3/ipu3-css-params.c:776:8: warning:
 variable 'pin_scale' set but not used
Message-ID: <202106280415.UWD8eBvS-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   625acffd7ae2c52898d249e6c5c39f348db0d8df
commit: 32a363d0b0b142f35512848dc646ee53e0926723 media: Kconfig files: use select for V4L2 subdevs and MC
date:   1 year, 2 months ago
config: x86_64-buildonly-randconfig-r002-20210628 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 59558129276098d62046c8cda92240d292cbfb1c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=32a363d0b0b142f35512848dc646ee53e0926723
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 32a363d0b0b142f35512848dc646ee53e0926723
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/staging/media/ipu3/ipu3-css-params.c:776:8: warning: variable 'pin_scale' set but not used [-Wunused-but-set-variable]
                           int pin_scale = 0;
                               ^
   1 warning generated.


vim +/pin_scale +776 drivers/staging/media/ipu3/ipu3-css-params.c

e11110a5b74487 Yong Zhi   2018-12-06  357  
e11110a5b74487 Yong Zhi   2018-12-06  358  /*
e11110a5b74487 Yong Zhi   2018-12-06  359   * frame_params - size IMGU_ABI_OSYS_PINS
e11110a5b74487 Yong Zhi   2018-12-06  360   * stripe_params - size IPU3_UAPI_MAX_STRIPES
e11110a5b74487 Yong Zhi   2018-12-06  361   */
27b795adb3c221 Yong Zhi   2019-02-07  362  static int imgu_css_osys_calc_frame_and_stripe_params(
27b795adb3c221 Yong Zhi   2019-02-07  363  		struct imgu_css *css, unsigned int stripes,
e11110a5b74487 Yong Zhi   2018-12-06  364  		struct imgu_abi_osys_config *osys,
27b795adb3c221 Yong Zhi   2019-02-07  365  		struct imgu_css_scaler_info *scaler_luma,
27b795adb3c221 Yong Zhi   2019-02-07  366  		struct imgu_css_scaler_info *scaler_chroma,
27b795adb3c221 Yong Zhi   2019-02-07  367  		struct imgu_css_frame_params frame_params[],
27b795adb3c221 Yong Zhi   2019-02-07  368  		struct imgu_css_stripe_params stripe_params[],
51abe041c5ed56 Bingbu Cao 2018-12-06  369  		unsigned int pipe)
e11110a5b74487 Yong Zhi   2018-12-06  370  {
27b795adb3c221 Yong Zhi   2019-02-07  371  	struct imgu_css_reso reso;
e11110a5b74487 Yong Zhi   2018-12-06  372  	unsigned int output_width, pin, s;
51abe041c5ed56 Bingbu Cao 2018-12-06  373  	u32 input_width, input_height, target_width, target_height;
51abe041c5ed56 Bingbu Cao 2018-12-06  374  	unsigned int procmode = 0;
27b795adb3c221 Yong Zhi   2019-02-07  375  	struct imgu_css_pipe *css_pipe = &css->pipes[pipe];
51abe041c5ed56 Bingbu Cao 2018-12-06  376  
51abe041c5ed56 Bingbu Cao 2018-12-06  377  	input_width = css_pipe->rect[IPU3_CSS_RECT_GDC].width;
51abe041c5ed56 Bingbu Cao 2018-12-06  378  	input_height = css_pipe->rect[IPU3_CSS_RECT_GDC].height;
51abe041c5ed56 Bingbu Cao 2018-12-06  379  	target_width = css_pipe->queue[IPU3_CSS_QUEUE_VF].fmt.mpix.width;
51abe041c5ed56 Bingbu Cao 2018-12-06  380  	target_height = css_pipe->queue[IPU3_CSS_QUEUE_VF].fmt.mpix.height;
e11110a5b74487 Yong Zhi   2018-12-06  381  
e11110a5b74487 Yong Zhi   2018-12-06  382  	/* Frame parameters */
e11110a5b74487 Yong Zhi   2018-12-06  383  
e11110a5b74487 Yong Zhi   2018-12-06  384  	/* Input width for Output System is output width of DVS (with GDC) */
51abe041c5ed56 Bingbu Cao 2018-12-06  385  	reso.input_width = css_pipe->rect[IPU3_CSS_RECT_GDC].width;
e11110a5b74487 Yong Zhi   2018-12-06  386  
e11110a5b74487 Yong Zhi   2018-12-06  387  	/* Input height for Output System is output height of DVS (with GDC) */
51abe041c5ed56 Bingbu Cao 2018-12-06  388  	reso.input_height = css_pipe->rect[IPU3_CSS_RECT_GDC].height;
e11110a5b74487 Yong Zhi   2018-12-06  389  
e11110a5b74487 Yong Zhi   2018-12-06  390  	reso.input_format =
51abe041c5ed56 Bingbu Cao 2018-12-06  391  		css_pipe->queue[IPU3_CSS_QUEUE_OUT].css_fmt->frame_format;
e11110a5b74487 Yong Zhi   2018-12-06  392  
e11110a5b74487 Yong Zhi   2018-12-06  393  	reso.pin_width[IMGU_ABI_OSYS_PIN_OUT] =
51abe041c5ed56 Bingbu Cao 2018-12-06  394  		css_pipe->queue[IPU3_CSS_QUEUE_OUT].fmt.mpix.width;
e11110a5b74487 Yong Zhi   2018-12-06  395  	reso.pin_height[IMGU_ABI_OSYS_PIN_OUT] =
51abe041c5ed56 Bingbu Cao 2018-12-06  396  		css_pipe->queue[IPU3_CSS_QUEUE_OUT].fmt.mpix.height;
e11110a5b74487 Yong Zhi   2018-12-06  397  	reso.pin_stride[IMGU_ABI_OSYS_PIN_OUT] =
51abe041c5ed56 Bingbu Cao 2018-12-06  398  		css_pipe->queue[IPU3_CSS_QUEUE_OUT].width_pad;
e11110a5b74487 Yong Zhi   2018-12-06  399  	reso.pin_format[IMGU_ABI_OSYS_PIN_OUT] =
51abe041c5ed56 Bingbu Cao 2018-12-06  400  		css_pipe->queue[IPU3_CSS_QUEUE_OUT].css_fmt->frame_format;
e11110a5b74487 Yong Zhi   2018-12-06  401  
e11110a5b74487 Yong Zhi   2018-12-06  402  	reso.pin_width[IMGU_ABI_OSYS_PIN_VF] =
51abe041c5ed56 Bingbu Cao 2018-12-06  403  		css_pipe->queue[IPU3_CSS_QUEUE_VF].fmt.mpix.width;
e11110a5b74487 Yong Zhi   2018-12-06  404  	reso.pin_height[IMGU_ABI_OSYS_PIN_VF] =
51abe041c5ed56 Bingbu Cao 2018-12-06  405  		css_pipe->queue[IPU3_CSS_QUEUE_VF].fmt.mpix.height;
e11110a5b74487 Yong Zhi   2018-12-06  406  	reso.pin_stride[IMGU_ABI_OSYS_PIN_VF] =
51abe041c5ed56 Bingbu Cao 2018-12-06  407  		css_pipe->queue[IPU3_CSS_QUEUE_VF].width_pad;
e11110a5b74487 Yong Zhi   2018-12-06  408  	reso.pin_format[IMGU_ABI_OSYS_PIN_VF] =
51abe041c5ed56 Bingbu Cao 2018-12-06  409  		css_pipe->queue[IPU3_CSS_QUEUE_VF].css_fmt->frame_format;
e11110a5b74487 Yong Zhi   2018-12-06  410  
e11110a5b74487 Yong Zhi   2018-12-06  411  	/* Configure the frame parameters for all output pins */
e11110a5b74487 Yong Zhi   2018-12-06  412  
e11110a5b74487 Yong Zhi   2018-12-06  413  	frame_params[IMGU_ABI_OSYS_PIN_OUT].width =
51abe041c5ed56 Bingbu Cao 2018-12-06  414  		css_pipe->queue[IPU3_CSS_QUEUE_OUT].fmt.mpix.width;
e11110a5b74487 Yong Zhi   2018-12-06  415  	frame_params[IMGU_ABI_OSYS_PIN_OUT].height =
51abe041c5ed56 Bingbu Cao 2018-12-06  416  		css_pipe->queue[IPU3_CSS_QUEUE_OUT].fmt.mpix.height;
e11110a5b74487 Yong Zhi   2018-12-06  417  	frame_params[IMGU_ABI_OSYS_PIN_VF].width =
51abe041c5ed56 Bingbu Cao 2018-12-06  418  		css_pipe->queue[IPU3_CSS_QUEUE_VF].fmt.mpix.width;
e11110a5b74487 Yong Zhi   2018-12-06  419  	frame_params[IMGU_ABI_OSYS_PIN_VF].height =
51abe041c5ed56 Bingbu Cao 2018-12-06  420  		css_pipe->queue[IPU3_CSS_QUEUE_VF].fmt.mpix.height;
e11110a5b74487 Yong Zhi   2018-12-06  421  	frame_params[IMGU_ABI_OSYS_PIN_VF].crop_top = 0;
e11110a5b74487 Yong Zhi   2018-12-06  422  	frame_params[IMGU_ABI_OSYS_PIN_VF].crop_left = 0;
e11110a5b74487 Yong Zhi   2018-12-06  423  
e11110a5b74487 Yong Zhi   2018-12-06  424  	for (pin = 0; pin < IMGU_ABI_OSYS_PINS; pin++) {
e11110a5b74487 Yong Zhi   2018-12-06  425  		int enable = 0;
e11110a5b74487 Yong Zhi   2018-12-06  426  		int scaled = 0;
e11110a5b74487 Yong Zhi   2018-12-06  427  		unsigned int format = 0;
e11110a5b74487 Yong Zhi   2018-12-06  428  		unsigned int tiling = 0;
e11110a5b74487 Yong Zhi   2018-12-06  429  
e11110a5b74487 Yong Zhi   2018-12-06  430  		frame_params[pin].flip = 0;
e11110a5b74487 Yong Zhi   2018-12-06  431  		frame_params[pin].mirror = 0;
e11110a5b74487 Yong Zhi   2018-12-06  432  		frame_params[pin].reduce_range = 0;
e11110a5b74487 Yong Zhi   2018-12-06  433  		if (reso.pin_width[pin] != 0 && reso.pin_height[pin] != 0) {
e11110a5b74487 Yong Zhi   2018-12-06  434  			enable = 1;
e11110a5b74487 Yong Zhi   2018-12-06  435  			if (pin == IMGU_ABI_OSYS_PIN_OUT) {
e11110a5b74487 Yong Zhi   2018-12-06  436  				if (reso.input_width < reso.pin_width[pin] ||
e11110a5b74487 Yong Zhi   2018-12-06  437  				    reso.input_height < reso.pin_height[pin])
e11110a5b74487 Yong Zhi   2018-12-06  438  					return -EINVAL;
e11110a5b74487 Yong Zhi   2018-12-06  439  				/*
e11110a5b74487 Yong Zhi   2018-12-06  440  				 * When input and output resolution is
e11110a5b74487 Yong Zhi   2018-12-06  441  				 * different instead of scaling, cropping
e11110a5b74487 Yong Zhi   2018-12-06  442  				 * should happen. Determine the crop factor
e11110a5b74487 Yong Zhi   2018-12-06  443  				 * to do the symmetric cropping
e11110a5b74487 Yong Zhi   2018-12-06  444  				 */
e11110a5b74487 Yong Zhi   2018-12-06  445  				frame_params[pin].crop_left = roundclosest_down(
e11110a5b74487 Yong Zhi   2018-12-06  446  						(reso.input_width -
e11110a5b74487 Yong Zhi   2018-12-06  447  						 reso.pin_width[pin]) / 2,
e11110a5b74487 Yong Zhi   2018-12-06  448  						 IMGU_OSYS_DMA_CROP_W_LIMIT);
e11110a5b74487 Yong Zhi   2018-12-06  449  				frame_params[pin].crop_top = roundclosest_down(
e11110a5b74487 Yong Zhi   2018-12-06  450  						(reso.input_height -
e11110a5b74487 Yong Zhi   2018-12-06  451  						 reso.pin_height[pin]) / 2,
e11110a5b74487 Yong Zhi   2018-12-06  452  						 IMGU_OSYS_DMA_CROP_H_LIMIT);
e11110a5b74487 Yong Zhi   2018-12-06  453  			} else {
e11110a5b74487 Yong Zhi   2018-12-06  454  				if (reso.pin_width[pin] != reso.input_width ||
e11110a5b74487 Yong Zhi   2018-12-06  455  				    reso.pin_height[pin] != reso.input_height) {
e11110a5b74487 Yong Zhi   2018-12-06  456  					/*
e11110a5b74487 Yong Zhi   2018-12-06  457  					 * If resolution is different at input
e11110a5b74487 Yong Zhi   2018-12-06  458  					 * and output of OSYS, scaling is
e11110a5b74487 Yong Zhi   2018-12-06  459  					 * considered except when pin is MAIN.
e11110a5b74487 Yong Zhi   2018-12-06  460  					 * Later it will be decide whether
e11110a5b74487 Yong Zhi   2018-12-06  461  					 * scaler factor is 1 or other
e11110a5b74487 Yong Zhi   2018-12-06  462  					 * and cropping has to be done or not.
e11110a5b74487 Yong Zhi   2018-12-06  463  					 */
e11110a5b74487 Yong Zhi   2018-12-06  464  					scaled = 1;
e11110a5b74487 Yong Zhi   2018-12-06  465  				}
e11110a5b74487 Yong Zhi   2018-12-06  466  			}
27b795adb3c221 Yong Zhi   2019-02-07  467  			imgu_css_osys_set_format(reso.pin_format[pin], &format,
e11110a5b74487 Yong Zhi   2018-12-06  468  						 &tiling);
e11110a5b74487 Yong Zhi   2018-12-06  469  		} else {
e11110a5b74487 Yong Zhi   2018-12-06  470  			enable = 0;
e11110a5b74487 Yong Zhi   2018-12-06  471  		}
e11110a5b74487 Yong Zhi   2018-12-06  472  		frame_params[pin].enable = enable;
e11110a5b74487 Yong Zhi   2018-12-06  473  		frame_params[pin].format = format;
e11110a5b74487 Yong Zhi   2018-12-06  474  		frame_params[pin].tiling = tiling;
e11110a5b74487 Yong Zhi   2018-12-06  475  		frame_params[pin].stride = reso.pin_stride[pin];
e11110a5b74487 Yong Zhi   2018-12-06  476  		frame_params[pin].scaled = scaled;
e11110a5b74487 Yong Zhi   2018-12-06  477  	}
e11110a5b74487 Yong Zhi   2018-12-06  478  
27b795adb3c221 Yong Zhi   2019-02-07  479  	imgu_css_scaler_calc(input_width, input_height, target_width,
e11110a5b74487 Yong Zhi   2018-12-06  480  			     target_height, osys, scaler_luma, scaler_chroma,
e11110a5b74487 Yong Zhi   2018-12-06  481  			     &reso.pin_width[IMGU_ABI_OSYS_PIN_VF],
e11110a5b74487 Yong Zhi   2018-12-06  482  			     &reso.pin_height[IMGU_ABI_OSYS_PIN_VF], &procmode);
e11110a5b74487 Yong Zhi   2018-12-06  483  	dev_dbg(css->dev, "osys scaler procmode is %u", procmode);
e11110a5b74487 Yong Zhi   2018-12-06  484  	output_width = reso.pin_width[IMGU_ABI_OSYS_PIN_VF];
e11110a5b74487 Yong Zhi   2018-12-06  485  
e11110a5b74487 Yong Zhi   2018-12-06  486  	if (output_width < reso.input_width / 2) {
e11110a5b74487 Yong Zhi   2018-12-06  487  		/* Scaling factor <= 0.5 */
e11110a5b74487 Yong Zhi   2018-12-06  488  		reso.chunk_width = IMGU_OSYS_BLOCK_WIDTH;
e11110a5b74487 Yong Zhi   2018-12-06  489  		reso.block_width = IMGU_OSYS_BLOCK_WIDTH;
e11110a5b74487 Yong Zhi   2018-12-06  490  	} else { /* 0.5 <= Scaling factor <= 1.0 */
e11110a5b74487 Yong Zhi   2018-12-06  491  		reso.chunk_width = IMGU_OSYS_BLOCK_WIDTH / 2;
e11110a5b74487 Yong Zhi   2018-12-06  492  		reso.block_width = IMGU_OSYS_BLOCK_WIDTH;
e11110a5b74487 Yong Zhi   2018-12-06  493  	}
e11110a5b74487 Yong Zhi   2018-12-06  494  
e11110a5b74487 Yong Zhi   2018-12-06  495  	if (output_width <= reso.input_width * 7 / 8) {
e11110a5b74487 Yong Zhi   2018-12-06  496  		/* Scaling factor <= 0.875 */
e11110a5b74487 Yong Zhi   2018-12-06  497  		reso.chunk_height = IMGU_OSYS_BLOCK_HEIGHT;
e11110a5b74487 Yong Zhi   2018-12-06  498  		reso.block_height = IMGU_OSYS_BLOCK_HEIGHT;
e11110a5b74487 Yong Zhi   2018-12-06  499  	} else { /* 1.0 <= Scaling factor <= 1.75 */
e11110a5b74487 Yong Zhi   2018-12-06  500  		reso.chunk_height = IMGU_OSYS_BLOCK_HEIGHT / 2;
e11110a5b74487 Yong Zhi   2018-12-06  501  		reso.block_height = IMGU_OSYS_BLOCK_HEIGHT;
e11110a5b74487 Yong Zhi   2018-12-06  502  	}
e11110a5b74487 Yong Zhi   2018-12-06  503  
e11110a5b74487 Yong Zhi   2018-12-06  504  	/*
e11110a5b74487 Yong Zhi   2018-12-06  505  	 * Calculate scaler configuration parameters based on input and output
e11110a5b74487 Yong Zhi   2018-12-06  506  	 * resolution.
e11110a5b74487 Yong Zhi   2018-12-06  507  	 */
e11110a5b74487 Yong Zhi   2018-12-06  508  
e11110a5b74487 Yong Zhi   2018-12-06  509  	if (frame_params[IMGU_ABI_OSYS_PIN_VF].enable) {
e11110a5b74487 Yong Zhi   2018-12-06  510  		/*
e11110a5b74487 Yong Zhi   2018-12-06  511  		 * When aspect ratio is different between target resolution and
e11110a5b74487 Yong Zhi   2018-12-06  512  		 * required resolution, determine the crop factor to do
e11110a5b74487 Yong Zhi   2018-12-06  513  		 * symmetric cropping
e11110a5b74487 Yong Zhi   2018-12-06  514  		 */
e11110a5b74487 Yong Zhi   2018-12-06  515  		u32 w = reso.pin_width[IMGU_ABI_OSYS_PIN_VF] -
e11110a5b74487 Yong Zhi   2018-12-06  516  			frame_params[IMGU_ABI_OSYS_PIN_VF].width;
e11110a5b74487 Yong Zhi   2018-12-06  517  		u32 h = reso.pin_height[IMGU_ABI_OSYS_PIN_VF] -
e11110a5b74487 Yong Zhi   2018-12-06  518  			frame_params[IMGU_ABI_OSYS_PIN_VF].height;
e11110a5b74487 Yong Zhi   2018-12-06  519  
e11110a5b74487 Yong Zhi   2018-12-06  520  		frame_params[IMGU_ABI_OSYS_PIN_VF].crop_left =
e11110a5b74487 Yong Zhi   2018-12-06  521  			roundclosest_down(w / 2, IMGU_OSYS_DMA_CROP_W_LIMIT);
e11110a5b74487 Yong Zhi   2018-12-06  522  		frame_params[IMGU_ABI_OSYS_PIN_VF].crop_top =
e11110a5b74487 Yong Zhi   2018-12-06  523  			roundclosest_down(h / 2, IMGU_OSYS_DMA_CROP_H_LIMIT);
e11110a5b74487 Yong Zhi   2018-12-06  524  
e11110a5b74487 Yong Zhi   2018-12-06  525  		if (reso.input_height % 4 || reso.input_width % 8) {
e11110a5b74487 Yong Zhi   2018-12-06  526  			dev_err(css->dev, "OSYS input width is not multiple of 8 or\n");
e11110a5b74487 Yong Zhi   2018-12-06  527  			dev_err(css->dev, "height is not multiple of 4\n");
e11110a5b74487 Yong Zhi   2018-12-06  528  			return -EINVAL;
e11110a5b74487 Yong Zhi   2018-12-06  529  		}
e11110a5b74487 Yong Zhi   2018-12-06  530  	}
e11110a5b74487 Yong Zhi   2018-12-06  531  
e11110a5b74487 Yong Zhi   2018-12-06  532  	/* Stripe parameters */
e11110a5b74487 Yong Zhi   2018-12-06  533  
e11110a5b74487 Yong Zhi   2018-12-06  534  	if (frame_params[IMGU_ABI_OSYS_PIN_VF].enable) {
e11110a5b74487 Yong Zhi   2018-12-06  535  		output_width = reso.pin_width[IMGU_ABI_OSYS_PIN_VF];
e11110a5b74487 Yong Zhi   2018-12-06  536  	} else {
e11110a5b74487 Yong Zhi   2018-12-06  537  		/*
e11110a5b74487 Yong Zhi   2018-12-06  538  		 * in case scaler output is not enabled
e11110a5b74487 Yong Zhi   2018-12-06  539  		 * take output width as input width since
e11110a5b74487 Yong Zhi   2018-12-06  540  		 * there is no scaling at main pin.
e11110a5b74487 Yong Zhi   2018-12-06  541  		 * Due to the fact that main pin can be different
e11110a5b74487 Yong Zhi   2018-12-06  542  		 * from input resolution to osys in the case of cropping,
e11110a5b74487 Yong Zhi   2018-12-06  543  		 * main pin resolution is not taken.
e11110a5b74487 Yong Zhi   2018-12-06  544  		 */
e11110a5b74487 Yong Zhi   2018-12-06  545  		output_width = reso.input_width;
e11110a5b74487 Yong Zhi   2018-12-06  546  	}
e11110a5b74487 Yong Zhi   2018-12-06  547  
e11110a5b74487 Yong Zhi   2018-12-06  548  	for (s = 0; s < stripes; s++) {
e11110a5b74487 Yong Zhi   2018-12-06  549  		int stripe_offset_inp_y = 0;
e11110a5b74487 Yong Zhi   2018-12-06  550  		int stripe_offset_inp_uv = 0;
e11110a5b74487 Yong Zhi   2018-12-06  551  		int stripe_offset_out_y = 0;
e11110a5b74487 Yong Zhi   2018-12-06  552  		int stripe_offset_out_uv = 0;
e11110a5b74487 Yong Zhi   2018-12-06  553  		int stripe_phase_init_y = scaler_luma->phase_init;
e11110a5b74487 Yong Zhi   2018-12-06  554  		int stripe_phase_init_uv = scaler_chroma->phase_init;
e11110a5b74487 Yong Zhi   2018-12-06  555  		int stripe_offset_blk_y = 0;
e11110a5b74487 Yong Zhi   2018-12-06  556  		int stripe_offset_blk_uv = 0;
e11110a5b74487 Yong Zhi   2018-12-06  557  		int stripe_offset_col_y = 0;
e11110a5b74487 Yong Zhi   2018-12-06  558  		int stripe_offset_col_uv = 0;
e11110a5b74487 Yong Zhi   2018-12-06  559  		int stripe_pad_left_y = scaler_luma->pad_left;
e11110a5b74487 Yong Zhi   2018-12-06  560  		int stripe_pad_left_uv = scaler_chroma->pad_left;
e11110a5b74487 Yong Zhi   2018-12-06  561  		int stripe_pad_right_y = scaler_luma->pad_right;
e11110a5b74487 Yong Zhi   2018-12-06  562  		int stripe_pad_right_uv = scaler_chroma->pad_right;
e11110a5b74487 Yong Zhi   2018-12-06  563  		int stripe_crop_left_y = scaler_luma->crop_left;
e11110a5b74487 Yong Zhi   2018-12-06  564  		int stripe_crop_left_uv = scaler_chroma->crop_left;
e11110a5b74487 Yong Zhi   2018-12-06  565  		int stripe_input_width_y = reso.input_width;
e11110a5b74487 Yong Zhi   2018-12-06  566  		int stripe_input_width_uv = 0;
e11110a5b74487 Yong Zhi   2018-12-06  567  		int stripe_output_width_y = output_width;
e11110a5b74487 Yong Zhi   2018-12-06  568  		int stripe_output_width_uv = 0;
e11110a5b74487 Yong Zhi   2018-12-06  569  		int chunk_floor_y = 0;
e11110a5b74487 Yong Zhi   2018-12-06  570  		int chunk_floor_uv = 0;
e11110a5b74487 Yong Zhi   2018-12-06  571  		int chunk_ceil_uv = 0;
e11110a5b74487 Yong Zhi   2018-12-06  572  
e11110a5b74487 Yong Zhi   2018-12-06  573  		if (stripes > 1) {
e11110a5b74487 Yong Zhi   2018-12-06  574  			if (s > 0) {
e11110a5b74487 Yong Zhi   2018-12-06  575  				/* Calculate stripe offsets */
e11110a5b74487 Yong Zhi   2018-12-06  576  				stripe_offset_out_y =
e11110a5b74487 Yong Zhi   2018-12-06  577  					output_width * s / stripes;
e11110a5b74487 Yong Zhi   2018-12-06  578  				stripe_offset_out_y =
e11110a5b74487 Yong Zhi   2018-12-06  579  					rounddown(stripe_offset_out_y,
e11110a5b74487 Yong Zhi   2018-12-06  580  						  IPU3_UAPI_ISP_VEC_ELEMS);
e11110a5b74487 Yong Zhi   2018-12-06  581  				stripe_offset_out_uv = stripe_offset_out_y /
e11110a5b74487 Yong Zhi   2018-12-06  582  						IMGU_LUMA_TO_CHROMA_RATIO;
e11110a5b74487 Yong Zhi   2018-12-06  583  				stripe_offset_inp_y =
27b795adb3c221 Yong Zhi   2019-02-07  584  					imgu_css_osys_calc_stripe_offset(
e11110a5b74487 Yong Zhi   2018-12-06  585  						stripe_offset_out_y,
e11110a5b74487 Yong Zhi   2018-12-06  586  						IMGU_OSYS_FIR_PHASES,
e11110a5b74487 Yong Zhi   2018-12-06  587  						scaler_luma->phase_init,
e11110a5b74487 Yong Zhi   2018-12-06  588  						scaler_luma->phase_step,
e11110a5b74487 Yong Zhi   2018-12-06  589  						scaler_luma->pad_left);
e11110a5b74487 Yong Zhi   2018-12-06  590  				stripe_offset_inp_uv =
27b795adb3c221 Yong Zhi   2019-02-07  591  					imgu_css_osys_calc_stripe_offset(
e11110a5b74487 Yong Zhi   2018-12-06  592  						stripe_offset_out_uv,
e11110a5b74487 Yong Zhi   2018-12-06  593  						IMGU_OSYS_FIR_PHASES,
e11110a5b74487 Yong Zhi   2018-12-06  594  						scaler_chroma->phase_init,
e11110a5b74487 Yong Zhi   2018-12-06  595  						scaler_chroma->phase_step,
e11110a5b74487 Yong Zhi   2018-12-06  596  						scaler_chroma->pad_left);
e11110a5b74487 Yong Zhi   2018-12-06  597  
e11110a5b74487 Yong Zhi   2018-12-06  598  				/* Calculate stripe phase init */
e11110a5b74487 Yong Zhi   2018-12-06  599  				stripe_phase_init_y =
27b795adb3c221 Yong Zhi   2019-02-07  600  					imgu_css_osys_calc_stripe_phase_init(
e11110a5b74487 Yong Zhi   2018-12-06  601  						stripe_offset_out_y,
e11110a5b74487 Yong Zhi   2018-12-06  602  						IMGU_OSYS_FIR_PHASES,
e11110a5b74487 Yong Zhi   2018-12-06  603  						scaler_luma->phase_init,
e11110a5b74487 Yong Zhi   2018-12-06  604  						scaler_luma->phase_step,
e11110a5b74487 Yong Zhi   2018-12-06  605  						scaler_luma->pad_left);
e11110a5b74487 Yong Zhi   2018-12-06  606  				stripe_phase_init_uv =
27b795adb3c221 Yong Zhi   2019-02-07  607  					imgu_css_osys_calc_stripe_phase_init(
e11110a5b74487 Yong Zhi   2018-12-06  608  						stripe_offset_out_uv,
e11110a5b74487 Yong Zhi   2018-12-06  609  						IMGU_OSYS_FIR_PHASES,
e11110a5b74487 Yong Zhi   2018-12-06  610  						scaler_chroma->phase_init,
e11110a5b74487 Yong Zhi   2018-12-06  611  						scaler_chroma->phase_step,
e11110a5b74487 Yong Zhi   2018-12-06  612  						scaler_chroma->pad_left);
e11110a5b74487 Yong Zhi   2018-12-06  613  
e11110a5b74487 Yong Zhi   2018-12-06  614  				/*
e11110a5b74487 Yong Zhi   2018-12-06  615  				 * Chunk boundary corner case - luma and chroma
e11110a5b74487 Yong Zhi   2018-12-06  616  				 * start from different input chunks.
e11110a5b74487 Yong Zhi   2018-12-06  617  				 */
e11110a5b74487 Yong Zhi   2018-12-06  618  				chunk_floor_y = rounddown(stripe_offset_inp_y,
e11110a5b74487 Yong Zhi   2018-12-06  619  							  reso.chunk_width);
e11110a5b74487 Yong Zhi   2018-12-06  620  				chunk_floor_uv =
e11110a5b74487 Yong Zhi   2018-12-06  621  					rounddown(stripe_offset_inp_uv,
e11110a5b74487 Yong Zhi   2018-12-06  622  						  reso.chunk_width /
e11110a5b74487 Yong Zhi   2018-12-06  623  						  IMGU_LUMA_TO_CHROMA_RATIO);
e11110a5b74487 Yong Zhi   2018-12-06  624  
e11110a5b74487 Yong Zhi   2018-12-06  625  				if (chunk_floor_y != chunk_floor_uv *
e11110a5b74487 Yong Zhi   2018-12-06  626  				    IMGU_LUMA_TO_CHROMA_RATIO) {
e11110a5b74487 Yong Zhi   2018-12-06  627  					/*
e11110a5b74487 Yong Zhi   2018-12-06  628  					 * Match starting luma/chroma chunks.
e11110a5b74487 Yong Zhi   2018-12-06  629  					 * Decrease offset for UV and add output
e11110a5b74487 Yong Zhi   2018-12-06  630  					 * cropping.
e11110a5b74487 Yong Zhi   2018-12-06  631  					 */
e11110a5b74487 Yong Zhi   2018-12-06  632  					stripe_offset_inp_uv -= 1;
e11110a5b74487 Yong Zhi   2018-12-06  633  					stripe_crop_left_uv += 1;
e11110a5b74487 Yong Zhi   2018-12-06  634  					stripe_phase_init_uv -=
e11110a5b74487 Yong Zhi   2018-12-06  635  						scaler_luma->phase_step;
e11110a5b74487 Yong Zhi   2018-12-06  636  					if (stripe_phase_init_uv < 0)
e11110a5b74487 Yong Zhi   2018-12-06  637  						stripe_phase_init_uv =
e11110a5b74487 Yong Zhi   2018-12-06  638  							stripe_phase_init_uv +
e11110a5b74487 Yong Zhi   2018-12-06  639  							IMGU_OSYS_FIR_PHASES;
e11110a5b74487 Yong Zhi   2018-12-06  640  				}
e11110a5b74487 Yong Zhi   2018-12-06  641  				/*
e11110a5b74487 Yong Zhi   2018-12-06  642  				 * FW workaround for a HW bug: if the first
e11110a5b74487 Yong Zhi   2018-12-06  643  				 * chroma pixel is generated exactly at the end
e11110a5b74487 Yong Zhi   2018-12-06  644  				 * of chunck scaler HW may not output the pixel
e11110a5b74487 Yong Zhi   2018-12-06  645  				 * for downscale factors smaller than 1.5
e11110a5b74487 Yong Zhi   2018-12-06  646  				 * (timing issue).
e11110a5b74487 Yong Zhi   2018-12-06  647  				 */
e11110a5b74487 Yong Zhi   2018-12-06  648  				chunk_ceil_uv =
e11110a5b74487 Yong Zhi   2018-12-06  649  					roundup(stripe_offset_inp_uv,
e11110a5b74487 Yong Zhi   2018-12-06  650  						reso.chunk_width /
e11110a5b74487 Yong Zhi   2018-12-06  651  						IMGU_LUMA_TO_CHROMA_RATIO);
e11110a5b74487 Yong Zhi   2018-12-06  652  
e11110a5b74487 Yong Zhi   2018-12-06  653  				if (stripe_offset_inp_uv ==
e11110a5b74487 Yong Zhi   2018-12-06  654  				    chunk_ceil_uv - IMGU_OSYS_TAPS_UV) {
e11110a5b74487 Yong Zhi   2018-12-06  655  					/*
e11110a5b74487 Yong Zhi   2018-12-06  656  					 * Decrease input offset and add
e11110a5b74487 Yong Zhi   2018-12-06  657  					 * output cropping
e11110a5b74487 Yong Zhi   2018-12-06  658  					 */
e11110a5b74487 Yong Zhi   2018-12-06  659  					stripe_offset_inp_uv -= 1;
e11110a5b74487 Yong Zhi   2018-12-06  660  					stripe_phase_init_uv -=
e11110a5b74487 Yong Zhi   2018-12-06  661  						scaler_luma->phase_step;
e11110a5b74487 Yong Zhi   2018-12-06  662  					if (stripe_phase_init_uv < 0) {
e11110a5b74487 Yong Zhi   2018-12-06  663  						stripe_phase_init_uv +=
e11110a5b74487 Yong Zhi   2018-12-06  664  							IMGU_OSYS_FIR_PHASES;
e11110a5b74487 Yong Zhi   2018-12-06  665  						stripe_crop_left_uv += 1;
e11110a5b74487 Yong Zhi   2018-12-06  666  					}
e11110a5b74487 Yong Zhi   2018-12-06  667  				}
e11110a5b74487 Yong Zhi   2018-12-06  668  
e11110a5b74487 Yong Zhi   2018-12-06  669  				/*
e11110a5b74487 Yong Zhi   2018-12-06  670  				 * Calculate block and column offsets for the
e11110a5b74487 Yong Zhi   2018-12-06  671  				 * input stripe
e11110a5b74487 Yong Zhi   2018-12-06  672  				 */
e11110a5b74487 Yong Zhi   2018-12-06  673  				stripe_offset_blk_y =
e11110a5b74487 Yong Zhi   2018-12-06  674  					rounddown(stripe_offset_inp_y,
e11110a5b74487 Yong Zhi   2018-12-06  675  						  IMGU_INPUT_BLOCK_WIDTH);
e11110a5b74487 Yong Zhi   2018-12-06  676  				stripe_offset_blk_uv =
e11110a5b74487 Yong Zhi   2018-12-06  677  					rounddown(stripe_offset_inp_uv,
e11110a5b74487 Yong Zhi   2018-12-06  678  						  IMGU_INPUT_BLOCK_WIDTH /
e11110a5b74487 Yong Zhi   2018-12-06  679  						  IMGU_LUMA_TO_CHROMA_RATIO);
e11110a5b74487 Yong Zhi   2018-12-06  680  				stripe_offset_col_y = stripe_offset_inp_y -
e11110a5b74487 Yong Zhi   2018-12-06  681  							stripe_offset_blk_y;
e11110a5b74487 Yong Zhi   2018-12-06  682  				stripe_offset_col_uv = stripe_offset_inp_uv -
e11110a5b74487 Yong Zhi   2018-12-06  683  							stripe_offset_blk_uv;
e11110a5b74487 Yong Zhi   2018-12-06  684  
e11110a5b74487 Yong Zhi   2018-12-06  685  				/* Left padding is only for the first stripe */
e11110a5b74487 Yong Zhi   2018-12-06  686  				stripe_pad_left_y = 0;
e11110a5b74487 Yong Zhi   2018-12-06  687  				stripe_pad_left_uv = 0;
e11110a5b74487 Yong Zhi   2018-12-06  688  			}
e11110a5b74487 Yong Zhi   2018-12-06  689  
e11110a5b74487 Yong Zhi   2018-12-06  690  			/* Right padding is only for the last stripe */
e11110a5b74487 Yong Zhi   2018-12-06  691  			if (s < stripes - 1) {
e11110a5b74487 Yong Zhi   2018-12-06  692  				int next_offset;
e11110a5b74487 Yong Zhi   2018-12-06  693  
e11110a5b74487 Yong Zhi   2018-12-06  694  				stripe_pad_right_y = 0;
e11110a5b74487 Yong Zhi   2018-12-06  695  				stripe_pad_right_uv = 0;
e11110a5b74487 Yong Zhi   2018-12-06  696  
e11110a5b74487 Yong Zhi   2018-12-06  697  				next_offset = output_width * (s + 1) / stripes;
e11110a5b74487 Yong Zhi   2018-12-06  698  				next_offset = rounddown(next_offset, 64);
e11110a5b74487 Yong Zhi   2018-12-06  699  				stripe_output_width_y = next_offset -
e11110a5b74487 Yong Zhi   2018-12-06  700  							stripe_offset_out_y;
e11110a5b74487 Yong Zhi   2018-12-06  701  			} else {
e11110a5b74487 Yong Zhi   2018-12-06  702  				stripe_output_width_y = output_width -
e11110a5b74487 Yong Zhi   2018-12-06  703  							stripe_offset_out_y;
e11110a5b74487 Yong Zhi   2018-12-06  704  			}
e11110a5b74487 Yong Zhi   2018-12-06  705  
e11110a5b74487 Yong Zhi   2018-12-06  706  			/* Calculate target output stripe width */
e11110a5b74487 Yong Zhi   2018-12-06  707  			stripe_output_width_uv = stripe_output_width_y /
e11110a5b74487 Yong Zhi   2018-12-06  708  						IMGU_LUMA_TO_CHROMA_RATIO;
e11110a5b74487 Yong Zhi   2018-12-06  709  			/* Calculate input stripe width */
e11110a5b74487 Yong Zhi   2018-12-06  710  			stripe_input_width_y = stripe_offset_col_y +
27b795adb3c221 Yong Zhi   2019-02-07  711  				imgu_css_osys_calc_inp_stripe_width(
e11110a5b74487 Yong Zhi   2018-12-06  712  						stripe_output_width_y,
e11110a5b74487 Yong Zhi   2018-12-06  713  						IMGU_OSYS_FIR_PHASES,
e11110a5b74487 Yong Zhi   2018-12-06  714  						stripe_phase_init_y,
e11110a5b74487 Yong Zhi   2018-12-06  715  						scaler_luma->phase_step,
e11110a5b74487 Yong Zhi   2018-12-06  716  						IMGU_OSYS_TAPS_Y,
e11110a5b74487 Yong Zhi   2018-12-06  717  						stripe_pad_left_y,
e11110a5b74487 Yong Zhi   2018-12-06  718  						stripe_pad_right_y);
e11110a5b74487 Yong Zhi   2018-12-06  719  
e11110a5b74487 Yong Zhi   2018-12-06  720  			stripe_input_width_uv = stripe_offset_col_uv +
27b795adb3c221 Yong Zhi   2019-02-07  721  				imgu_css_osys_calc_inp_stripe_width(
e11110a5b74487 Yong Zhi   2018-12-06  722  						stripe_output_width_uv,
e11110a5b74487 Yong Zhi   2018-12-06  723  						IMGU_OSYS_FIR_PHASES,
e11110a5b74487 Yong Zhi   2018-12-06  724  						stripe_phase_init_uv,
e11110a5b74487 Yong Zhi   2018-12-06  725  						scaler_chroma->phase_step,
e11110a5b74487 Yong Zhi   2018-12-06  726  						IMGU_OSYS_TAPS_UV,
e11110a5b74487 Yong Zhi   2018-12-06  727  						stripe_pad_left_uv,
e11110a5b74487 Yong Zhi   2018-12-06  728  						stripe_pad_right_uv);
e11110a5b74487 Yong Zhi   2018-12-06  729  
e11110a5b74487 Yong Zhi   2018-12-06  730  			stripe_input_width_uv = max(DIV_ROUND_UP(
e11110a5b74487 Yong Zhi   2018-12-06  731  						    stripe_input_width_y,
e11110a5b74487 Yong Zhi   2018-12-06  732  						    IMGU_LUMA_TO_CHROMA_RATIO),
e11110a5b74487 Yong Zhi   2018-12-06  733  						    stripe_input_width_uv);
e11110a5b74487 Yong Zhi   2018-12-06  734  
e11110a5b74487 Yong Zhi   2018-12-06  735  			stripe_input_width_y = stripe_input_width_uv *
e11110a5b74487 Yong Zhi   2018-12-06  736  						IMGU_LUMA_TO_CHROMA_RATIO;
e11110a5b74487 Yong Zhi   2018-12-06  737  
e11110a5b74487 Yong Zhi   2018-12-06  738  			if (s >= stripes - 1) {
e11110a5b74487 Yong Zhi   2018-12-06  739  				stripe_input_width_y = reso.input_width -
e11110a5b74487 Yong Zhi   2018-12-06  740  					stripe_offset_blk_y;
e11110a5b74487 Yong Zhi   2018-12-06  741  				/*
e11110a5b74487 Yong Zhi   2018-12-06  742  				 * The scaler requires that the last stripe
e11110a5b74487 Yong Zhi   2018-12-06  743  				 * spans at least two input blocks.
e11110a5b74487 Yong Zhi   2018-12-06  744  				 */
e11110a5b74487 Yong Zhi   2018-12-06  745  			}
e11110a5b74487 Yong Zhi   2018-12-06  746  
e11110a5b74487 Yong Zhi   2018-12-06  747  			/*
e11110a5b74487 Yong Zhi   2018-12-06  748  			 * Spec: input stripe width must be a multiple of 8.
e11110a5b74487 Yong Zhi   2018-12-06  749  			 * Increase the input width and recalculate the output
e11110a5b74487 Yong Zhi   2018-12-06  750  			 * width. This may produce an extra column of junk
e11110a5b74487 Yong Zhi   2018-12-06  751  			 * blocks which will be overwritten by the
e11110a5b74487 Yong Zhi   2018-12-06  752  			 * next stripe.
e11110a5b74487 Yong Zhi   2018-12-06  753  			 */
e11110a5b74487 Yong Zhi   2018-12-06  754  			stripe_input_width_y = ALIGN(stripe_input_width_y, 8);
e11110a5b74487 Yong Zhi   2018-12-06  755  			stripe_output_width_y =
27b795adb3c221 Yong Zhi   2019-02-07  756  				imgu_css_osys_out_stripe_width(
e11110a5b74487 Yong Zhi   2018-12-06  757  						stripe_input_width_y,
e11110a5b74487 Yong Zhi   2018-12-06  758  						IMGU_OSYS_FIR_PHASES,
e11110a5b74487 Yong Zhi   2018-12-06  759  						stripe_phase_init_y,
e11110a5b74487 Yong Zhi   2018-12-06  760  						scaler_luma->phase_step,
e11110a5b74487 Yong Zhi   2018-12-06  761  						IMGU_OSYS_TAPS_Y,
e11110a5b74487 Yong Zhi   2018-12-06  762  						stripe_pad_left_y,
e11110a5b74487 Yong Zhi   2018-12-06  763  						stripe_pad_right_y,
e11110a5b74487 Yong Zhi   2018-12-06  764  						stripe_offset_col_y);
e11110a5b74487 Yong Zhi   2018-12-06  765  
e11110a5b74487 Yong Zhi   2018-12-06  766  			stripe_output_width_y =
e11110a5b74487 Yong Zhi   2018-12-06  767  					rounddown(stripe_output_width_y,
e11110a5b74487 Yong Zhi   2018-12-06  768  						  IMGU_LUMA_TO_CHROMA_RATIO);
e11110a5b74487 Yong Zhi   2018-12-06  769  		}
e11110a5b74487 Yong Zhi   2018-12-06  770  		/*
e11110a5b74487 Yong Zhi   2018-12-06  771  		 * Following section executes and process parameters
e11110a5b74487 Yong Zhi   2018-12-06  772  		 * for both cases - Striping or No Striping.
e11110a5b74487 Yong Zhi   2018-12-06  773  		 */
e11110a5b74487 Yong Zhi   2018-12-06  774  		{
e11110a5b74487 Yong Zhi   2018-12-06  775  			unsigned int i;
e11110a5b74487 Yong Zhi   2018-12-06 @776  			int pin_scale = 0;
e11110a5b74487 Yong Zhi   2018-12-06  777  			/*Input resolution */
e11110a5b74487 Yong Zhi   2018-12-06  778  
e11110a5b74487 Yong Zhi   2018-12-06  779  			stripe_params[s].input_width = stripe_input_width_y;
e11110a5b74487 Yong Zhi   2018-12-06  780  			stripe_params[s].input_height = reso.input_height;
e11110a5b74487 Yong Zhi   2018-12-06  781  
e11110a5b74487 Yong Zhi   2018-12-06  782  			for (i = 0; i < IMGU_ABI_OSYS_PINS; i++) {
e11110a5b74487 Yong Zhi   2018-12-06  783  				if (frame_params[i].scaled) {
e11110a5b74487 Yong Zhi   2018-12-06  784  					/*
e11110a5b74487 Yong Zhi   2018-12-06  785  					 * Output stripe resolution and offset
e11110a5b74487 Yong Zhi   2018-12-06  786  					 * as produced by the scaler; actual
e11110a5b74487 Yong Zhi   2018-12-06  787  					 * output resolution may be slightly
e11110a5b74487 Yong Zhi   2018-12-06  788  					 * smaller.
e11110a5b74487 Yong Zhi   2018-12-06  789  					 */
e11110a5b74487 Yong Zhi   2018-12-06  790  					stripe_params[s].output_width[i] =
e11110a5b74487 Yong Zhi   2018-12-06  791  						stripe_output_width_y;
e11110a5b74487 Yong Zhi   2018-12-06  792  					stripe_params[s].output_height[i] =
e11110a5b74487 Yong Zhi   2018-12-06  793  						reso.pin_height[i];
e11110a5b74487 Yong Zhi   2018-12-06  794  					stripe_params[s].output_offset[i] =
e11110a5b74487 Yong Zhi   2018-12-06  795  						stripe_offset_out_y;
e11110a5b74487 Yong Zhi   2018-12-06  796  
e11110a5b74487 Yong Zhi   2018-12-06  797  					pin_scale += frame_params[i].scaled;
e11110a5b74487 Yong Zhi   2018-12-06  798  				} else {
e11110a5b74487 Yong Zhi   2018-12-06  799  					/* Unscaled pin */
e11110a5b74487 Yong Zhi   2018-12-06  800  					stripe_params[s].output_width[i] =
e11110a5b74487 Yong Zhi   2018-12-06  801  						stripe_params[s].input_width;
e11110a5b74487 Yong Zhi   2018-12-06  802  					stripe_params[s].output_height[i] =
e11110a5b74487 Yong Zhi   2018-12-06  803  						stripe_params[s].input_height;
e11110a5b74487 Yong Zhi   2018-12-06  804  					stripe_params[s].output_offset[i] =
e11110a5b74487 Yong Zhi   2018-12-06  805  						stripe_offset_blk_y;
e11110a5b74487 Yong Zhi   2018-12-06  806  				}
e11110a5b74487 Yong Zhi   2018-12-06  807  			}
e11110a5b74487 Yong Zhi   2018-12-06  808  
e11110a5b74487 Yong Zhi   2018-12-06  809  			/* If no pin use scale, we use BYPASS mode */
e11110a5b74487 Yong Zhi   2018-12-06  810  			stripe_params[s].processing_mode = procmode;
e11110a5b74487 Yong Zhi   2018-12-06  811  			stripe_params[s].phase_step = scaler_luma->phase_step;
e11110a5b74487 Yong Zhi   2018-12-06  812  			stripe_params[s].exp_shift = scaler_luma->exp_shift;
e11110a5b74487 Yong Zhi   2018-12-06  813  			stripe_params[s].phase_init_left_y =
e11110a5b74487 Yong Zhi   2018-12-06  814  				stripe_phase_init_y;
e11110a5b74487 Yong Zhi   2018-12-06  815  			stripe_params[s].phase_init_left_uv =
e11110a5b74487 Yong Zhi   2018-12-06  816  				stripe_phase_init_uv;
e11110a5b74487 Yong Zhi   2018-12-06  817  			stripe_params[s].phase_init_top_y =
e11110a5b74487 Yong Zhi   2018-12-06  818  				scaler_luma->phase_init;
e11110a5b74487 Yong Zhi   2018-12-06  819  			stripe_params[s].phase_init_top_uv =
e11110a5b74487 Yong Zhi   2018-12-06  820  				scaler_chroma->phase_init;
e11110a5b74487 Yong Zhi   2018-12-06  821  			stripe_params[s].pad_left_y = stripe_pad_left_y;
e11110a5b74487 Yong Zhi   2018-12-06  822  			stripe_params[s].pad_left_uv = stripe_pad_left_uv;
e11110a5b74487 Yong Zhi   2018-12-06  823  			stripe_params[s].pad_right_y = stripe_pad_right_y;
e11110a5b74487 Yong Zhi   2018-12-06  824  			stripe_params[s].pad_right_uv = stripe_pad_right_uv;
e11110a5b74487 Yong Zhi   2018-12-06  825  			stripe_params[s].pad_top_y = scaler_luma->pad_left;
e11110a5b74487 Yong Zhi   2018-12-06  826  			stripe_params[s].pad_top_uv = scaler_chroma->pad_left;
e11110a5b74487 Yong Zhi   2018-12-06  827  			stripe_params[s].pad_bottom_y = scaler_luma->pad_right;
e11110a5b74487 Yong Zhi   2018-12-06  828  			stripe_params[s].pad_bottom_uv =
e11110a5b74487 Yong Zhi   2018-12-06  829  				scaler_chroma->pad_right;
e11110a5b74487 Yong Zhi   2018-12-06  830  			stripe_params[s].crop_left_y = stripe_crop_left_y;
e11110a5b74487 Yong Zhi   2018-12-06  831  			stripe_params[s].crop_top_y = scaler_luma->crop_top;
e11110a5b74487 Yong Zhi   2018-12-06  832  			stripe_params[s].crop_left_uv = stripe_crop_left_uv;
e11110a5b74487 Yong Zhi   2018-12-06  833  			stripe_params[s].crop_top_uv = scaler_chroma->crop_top;
e11110a5b74487 Yong Zhi   2018-12-06  834  			stripe_params[s].start_column_y = stripe_offset_col_y;
e11110a5b74487 Yong Zhi   2018-12-06  835  			stripe_params[s].start_column_uv = stripe_offset_col_uv;
e11110a5b74487 Yong Zhi   2018-12-06  836  			stripe_params[s].chunk_width = reso.chunk_width;
e11110a5b74487 Yong Zhi   2018-12-06  837  			stripe_params[s].chunk_height = reso.chunk_height;
e11110a5b74487 Yong Zhi   2018-12-06  838  			stripe_params[s].block_width = reso.block_width;
e11110a5b74487 Yong Zhi   2018-12-06  839  			stripe_params[s].block_height = reso.block_height;
e11110a5b74487 Yong Zhi   2018-12-06  840  		}
e11110a5b74487 Yong Zhi   2018-12-06  841  	}
e11110a5b74487 Yong Zhi   2018-12-06  842  
e11110a5b74487 Yong Zhi   2018-12-06  843  	return 0;
e11110a5b74487 Yong Zhi   2018-12-06  844  }
e11110a5b74487 Yong Zhi   2018-12-06  845  

:::::: The code at line 776 was first introduced by commit
:::::: e11110a5b74487cfc99dad8a5744fe26782f5d9c media: staging/intel-ipu3: css: Compute and program ccs

:::::: TO: Yong Zhi <yong.zhi@intel.com>
:::::: CC: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--TB36FDmn/VVEgNH/
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
izRwkWjIPrh/ARJG16HJiQEA

--TB36FDmn/VVEgNH/--
