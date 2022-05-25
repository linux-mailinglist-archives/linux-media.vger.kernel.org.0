Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E95DA5344CF
	for <lists+linux-media@lfdr.de>; Wed, 25 May 2022 22:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344964AbiEYU03 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 May 2022 16:26:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344653AbiEYU02 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 May 2022 16:26:28 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 050B9193D1
        for <linux-media@vger.kernel.org>; Wed, 25 May 2022 13:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653510382; x=1685046382;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fqdAWsgzZsTFfcUr+PoRBMIzaJ/laIhwN19nb0RCDHI=;
  b=JQnb172pxLAFF7x3UVRCDdCqlsTfxN/SyobuR+szoaMASr2zbZ/2fDO9
   vwoMQcOh9Nwr4EqehQiXs96u47rwEt6CUB7MA8+BQjP5kg/shuGn1I1D9
   ZuWDvfeJj8R51cFPfaDKCl1oUMg9ZIxUFljJC8QCZHoqAZcxVVCVbLW7w
   jEfVJUqSbYPIjjNqG64NFsbVQTFrVCbRzoouR61X0afiLRwi90Sgd81CF
   CB05kTYro5EPPGZGiGikUdmCQaNv/+Jsqbdd44EWQmdvekF3j6TxuXDL/
   h80rsIRWVZOge1eNmwx3oFfU1a0HWcrHCmg75XyihlUCQfPr+wG6PxK9y
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="299264298"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; 
   d="scan'208";a="299264298"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2022 13:26:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; 
   d="scan'208";a="559854672"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 25 May 2022 13:26:16 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1ntxaB-0003IO-79;
        Wed, 25 May 2022 20:26:15 +0000
Date:   Thu, 26 May 2022 04:26:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Yunke Cao <yunkec@google.com>, Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, Yunke Cao <yunkec@google.com>
Subject: Re: [PATCH v4 2/4] media: v4l2_ctrl: Add V4L2_CTRL_WHICH_MIN/MAX_VAL
Message-ID: <202205260458.5bfyANVz-lkp@intel.com>
References: <20220524044507.1696012-3-yunkec@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220524044507.1696012-3-yunkec@google.com>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yunke,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linus/master v5.18 next-20220525]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunke-Cao/media-Implement-UVC-v1-5-ROI/20220524-124718
base:   git://linuxtv.org/media_tree.git master
config: hexagon-randconfig-r041-20220524 (https://download.01.org/0day-ci/archive/20220526/202205260458.5bfyANVz-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d52a6e75b0c402c7f3b42a2b1b2873f151220947)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/25bdce0e26cdd486b08cbca11412dbfc5a1469eb
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yunke-Cao/media-Implement-UVC-v1-5-ROI/20220524-124718
        git checkout 25bdce0e26cdd486b08cbca11412dbfc5a1469eb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/media/platform/qcom/venus/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/media/platform/qcom/venus/venc_ctrls.c:582:34: error: too few arguments to function call, expected 6, have 4
                                      v4l2_ctrl_ptr_create(NULL));
                                                                ^
   include/media/v4l2-ctrls.h:726:19: note: 'v4l2_ctrl_new_std_compound' declared here
   struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
                     ^
   drivers/media/platform/qcom/venus/venc_ctrls.c:586:34: error: too few arguments to function call, expected 6, have 4
                                      v4l2_ctrl_ptr_create(NULL));
                                                                ^
   include/media/v4l2-ctrls.h:726:19: note: 'v4l2_ctrl_new_std_compound' declared here
   struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
                     ^
   2 errors generated.


vim +582 drivers/media/platform/qcom/venus/venc_ctrls.c

aaaa93eda64b00 Stanimir Varbanov   2017-06-15  354  
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  355  int venc_ctrl_init(struct venus_inst *inst)
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  356  {
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  357  	int ret;
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  358  
bfee75f73c37a2 Mansur Alisha Shaik 2021-07-29  359  	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 58);
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  360  	if (ret)
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  361  		return ret;
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  362  
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  363  	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  364  		V4L2_CID_MPEG_VIDEO_BITRATE_MODE,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  365  		V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  366  		~((1 << V4L2_MPEG_VIDEO_BITRATE_MODE_VBR) |
69ff4b2caa95e1 Stanimir Varbanov   2020-06-16  367  		  (1 << V4L2_MPEG_VIDEO_BITRATE_MODE_CBR) |
69ff4b2caa95e1 Stanimir Varbanov   2020-06-16  368  		  (1 << V4L2_MPEG_VIDEO_BITRATE_MODE_CQ)),
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  369  		V4L2_MPEG_VIDEO_BITRATE_MODE_VBR);
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  370  
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  371  	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  372  		V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  373  		V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  374  		0, V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC);
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  375  
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  376  	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  377  		V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  378  		V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_CODING_EFFICIENCY,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  379  		~((1 << V4L2_MPEG_VIDEO_MPEG4_PROFILE_SIMPLE) |
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  380  		  (1 << V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_SIMPLE)),
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  381  		V4L2_MPEG_VIDEO_MPEG4_PROFILE_SIMPLE);
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  382  
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  383  	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  384  		V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  385  		V4L2_MPEG_VIDEO_MPEG4_LEVEL_5,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  386  		0, V4L2_MPEG_VIDEO_MPEG4_LEVEL_0);
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  387  
cd396c8cbfcdd7 Kelvin Lawson       2018-12-10  388  	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
cd396c8cbfcdd7 Kelvin Lawson       2018-12-10  389  		V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
cd396c8cbfcdd7 Kelvin Lawson       2018-12-10  390  		V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
cd396c8cbfcdd7 Kelvin Lawson       2018-12-10  391  		~((1 << V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
cd396c8cbfcdd7 Kelvin Lawson       2018-12-10  392  		  (1 << V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE) |
cd396c8cbfcdd7 Kelvin Lawson       2018-12-10  393  		  (1 << V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10)),
cd396c8cbfcdd7 Kelvin Lawson       2018-12-10  394  		V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN);
cd396c8cbfcdd7 Kelvin Lawson       2018-12-10  395  
cd396c8cbfcdd7 Kelvin Lawson       2018-12-10  396  	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
cd396c8cbfcdd7 Kelvin Lawson       2018-12-10  397  		V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
cd396c8cbfcdd7 Kelvin Lawson       2018-12-10  398  		V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2,
cd396c8cbfcdd7 Kelvin Lawson       2018-12-10  399  		0, V4L2_MPEG_VIDEO_HEVC_LEVEL_1);
cd396c8cbfcdd7 Kelvin Lawson       2018-12-10  400  
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  401  	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  402  		V4L2_CID_MPEG_VIDEO_H264_PROFILE,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  403  		V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  404  		~((1 << V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  405  		  (1 << V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  406  		  (1 << V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  407  		  (1 << V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  408  		  (1 << V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH) |
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  409  		  (1 << V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH)),
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  410  		V4L2_MPEG_VIDEO_H264_PROFILE_HIGH);
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  411  
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  412  	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  413  		V4L2_CID_MPEG_VIDEO_H264_LEVEL,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  414  		V4L2_MPEG_VIDEO_H264_LEVEL_5_1,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  415  		0, V4L2_MPEG_VIDEO_H264_LEVEL_1_0);
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  416  
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  417  	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  418  		V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  419  		AT_SLICE_BOUNDARY,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  420  		0, V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED);
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  421  
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  422  	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  423  		V4L2_CID_MPEG_VIDEO_HEADER_MODE,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  424  		V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
002c22bd360e07 Dikshita Agarwal    2021-01-08  425  		~((1 << V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE) |
002c22bd360e07 Dikshita Agarwal    2021-01-08  426  		(1 << V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME)),
39a6b9185d305d Stanimir Varbanov   2021-03-06  427  		V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME);
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  428  
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  429  	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  430  		V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE,
4914425e28fb90 Hans Verkuil        2019-04-24  431  		V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  432  		0, V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE);
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  433  
5520b9467a39d5 Keiichi Watanabe    2018-06-18  434  	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
5520b9467a39d5 Keiichi Watanabe    2018-06-18  435  		V4L2_CID_MPEG_VIDEO_VP8_PROFILE,
5520b9467a39d5 Keiichi Watanabe    2018-06-18  436  		V4L2_MPEG_VIDEO_VP8_PROFILE_3,
5520b9467a39d5 Keiichi Watanabe    2018-06-18  437  		0, V4L2_MPEG_VIDEO_VP8_PROFILE_0);
5520b9467a39d5 Keiichi Watanabe    2018-06-18  438  
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  439  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  440  		V4L2_CID_MPEG_VIDEO_BITRATE, BITRATE_MIN, BITRATE_MAX,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  441  		BITRATE_STEP, BITRATE_DEFAULT);
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  442  
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  443  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  444  		V4L2_CID_MPEG_VIDEO_BITRATE_PEAK, BITRATE_MIN, BITRATE_MAX,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  445  		BITRATE_STEP, BITRATE_DEFAULT_PEAK);
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  446  
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  447  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  448  			  V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP, 1, 51, 1, 26);
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  449  
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  450  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  451  			  V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP, 1, 51, 1, 28);
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  452  
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  453  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  454  			  V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP, 1, 51, 1, 30);
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  455  
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  456  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  457  			  V4L2_CID_MPEG_VIDEO_H264_MIN_QP, 1, 51, 1, 1);
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  458  
74c895974fd356 Dikshita Agarwal    2020-12-24  459  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
74c895974fd356 Dikshita Agarwal    2020-12-24  460  			  V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MIN_QP, 1, 51, 1, 1);
74c895974fd356 Dikshita Agarwal    2020-12-24  461  
bfee75f73c37a2 Mansur Alisha Shaik 2021-07-29  462  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
61b3317dd424a3 Stanimir Varbanov   2022-02-08  463  			  V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM, 0, 1, 1, 1);
bfee75f73c37a2 Mansur Alisha Shaik 2021-07-29  464  
74c895974fd356 Dikshita Agarwal    2020-12-24  465  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
74c895974fd356 Dikshita Agarwal    2020-12-24  466  			  V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP, 1, 51, 1, 1);
74c895974fd356 Dikshita Agarwal    2020-12-24  467  
74c895974fd356 Dikshita Agarwal    2020-12-24  468  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
74c895974fd356 Dikshita Agarwal    2020-12-24  469  			  V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MIN_QP, 1, 51, 1, 1);
74c895974fd356 Dikshita Agarwal    2020-12-24  470  
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  471  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  472  			  V4L2_CID_MPEG_VIDEO_H264_MAX_QP, 1, 51, 1, 51);
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  473  
74c895974fd356 Dikshita Agarwal    2020-12-24  474  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
74c895974fd356 Dikshita Agarwal    2020-12-24  475  			  V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MAX_QP, 1, 51, 1, 51);
74c895974fd356 Dikshita Agarwal    2020-12-24  476  
74c895974fd356 Dikshita Agarwal    2020-12-24  477  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
74c895974fd356 Dikshita Agarwal    2020-12-24  478  			  V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MAX_QP, 1, 51, 1, 51);
74c895974fd356 Dikshita Agarwal    2020-12-24  479  
74c895974fd356 Dikshita Agarwal    2020-12-24  480  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
74c895974fd356 Dikshita Agarwal    2020-12-24  481  			  V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MAX_QP, 1, 51, 1, 51);
74c895974fd356 Dikshita Agarwal    2020-12-24  482  
74c895974fd356 Dikshita Agarwal    2020-12-24  483  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
74c895974fd356 Dikshita Agarwal    2020-12-24  484  			  V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP, 1, 63, 1, 26);
74c895974fd356 Dikshita Agarwal    2020-12-24  485  
74c895974fd356 Dikshita Agarwal    2020-12-24  486  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
74c895974fd356 Dikshita Agarwal    2020-12-24  487  			  V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_QP, 1, 63, 1, 28);
74c895974fd356 Dikshita Agarwal    2020-12-24  488  
74c895974fd356 Dikshita Agarwal    2020-12-24  489  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
74c895974fd356 Dikshita Agarwal    2020-12-24  490  			  V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP, 1, 63, 1, 30);
74c895974fd356 Dikshita Agarwal    2020-12-24  491  
74c895974fd356 Dikshita Agarwal    2020-12-24  492  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
74c895974fd356 Dikshita Agarwal    2020-12-24  493  			  V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP, 1, 63, 1, 1);
74c895974fd356 Dikshita Agarwal    2020-12-24  494  
74c895974fd356 Dikshita Agarwal    2020-12-24  495  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
74c895974fd356 Dikshita Agarwal    2020-12-24  496  			  V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MIN_QP, 1, 63, 1, 1);
74c895974fd356 Dikshita Agarwal    2020-12-24  497  
74c895974fd356 Dikshita Agarwal    2020-12-24  498  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
74c895974fd356 Dikshita Agarwal    2020-12-24  499  			  V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MIN_QP, 1, 63, 1, 1);
74c895974fd356 Dikshita Agarwal    2020-12-24  500  
74c895974fd356 Dikshita Agarwal    2020-12-24  501  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
74c895974fd356 Dikshita Agarwal    2020-12-24  502  			  V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MIN_QP, 1, 63, 1, 1);
74c895974fd356 Dikshita Agarwal    2020-12-24  503  
74c895974fd356 Dikshita Agarwal    2020-12-24  504  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
74c895974fd356 Dikshita Agarwal    2020-12-24  505  			  V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP, 1, 63, 1, 63);
74c895974fd356 Dikshita Agarwal    2020-12-24  506  
74c895974fd356 Dikshita Agarwal    2020-12-24  507  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
74c895974fd356 Dikshita Agarwal    2020-12-24  508  			  V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MAX_QP, 1, 63, 1, 63);
74c895974fd356 Dikshita Agarwal    2020-12-24  509  
74c895974fd356 Dikshita Agarwal    2020-12-24  510  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
74c895974fd356 Dikshita Agarwal    2020-12-24  511  			  V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MAX_QP, 1, 63, 1, 63);
74c895974fd356 Dikshita Agarwal    2020-12-24  512  
74c895974fd356 Dikshita Agarwal    2020-12-24  513  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
74c895974fd356 Dikshita Agarwal    2020-12-24  514  			  V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MAX_QP, 1, 63, 1, 63);
74c895974fd356 Dikshita Agarwal    2020-12-24  515  
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  516  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  517  		V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES, SLICE_BYTE_SIZE_MIN,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  518  		SLICE_BYTE_SIZE_MAX, 1, SLICE_BYTE_SIZE_MIN);
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  519  
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  520  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  521  		V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB, 1,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  522  		SLICE_MB_SIZE_MAX, 1, 1);
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  523  
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  524  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  525  		V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_ALPHA, -6, 6, 1, 0);
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  526  
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  527  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  528  		V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA, -6, 6, 1, 0);
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  529  
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  530  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
f8e5b2f3903ce1 Malathi Gottam      2018-11-12  531  		V4L2_CID_MPEG_VIDEO_GOP_SIZE, 0, (1 << 16) - 1, 1, 30);
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  532  
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  533  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  534  		V4L2_CID_MPEG_VIDEO_VPX_MIN_QP, 1, 128, 1, 1);
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  535  
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  536  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  537  		V4L2_CID_MPEG_VIDEO_VPX_MAX_QP, 1, 128, 1, 128);
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  538  
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  539  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  540  		V4L2_CID_MPEG_VIDEO_B_FRAMES, 0, 4, 1, 0);
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  541  
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  542  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  543  		V4L2_CID_MPEG_VIDEO_H264_I_PERIOD, 0, (1 << 16) - 1, 1, 0);
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  544  
c35f0b16537c15 Malathi Gottam      2018-11-02  545  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
c35f0b16537c15 Malathi Gottam      2018-11-02  546  			  V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME, 0, 0, 0, 0);
c35f0b16537c15 Malathi Gottam      2018-11-02  547  
6f704b2fbbde0c Jeffrey Kardatzke   2020-02-22  548  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
6f704b2fbbde0c Jeffrey Kardatzke   2020-02-22  549  			  V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE, 0, 1, 1, 1);
6f704b2fbbde0c Jeffrey Kardatzke   2020-02-22  550  
69ff4b2caa95e1 Stanimir Varbanov   2020-06-16  551  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
69ff4b2caa95e1 Stanimir Varbanov   2020-06-16  552  			  V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY, 0, 100, 1, 0);
69ff4b2caa95e1 Stanimir Varbanov   2020-06-16  553  
94dfb1689c25ed Stanimir Varbanov   2020-07-05  554  	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
94dfb1689c25ed Stanimir Varbanov   2020-07-05  555  			       V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE,
94dfb1689c25ed Stanimir Varbanov   2020-07-05  556  			       V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
94dfb1689c25ed Stanimir Varbanov   2020-07-05  557  			       ~((1 << V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED) |
94dfb1689c25ed Stanimir Varbanov   2020-07-05  558  			       (1 << V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT)),
94dfb1689c25ed Stanimir Varbanov   2020-07-05  559  			       V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED);
94dfb1689c25ed Stanimir Varbanov   2020-07-05  560  
e98ce77b57530a Dikshita Agarwal    2021-01-04  561  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
e98ce77b57530a Dikshita Agarwal    2021-01-04  562  			  V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID, 0,
e98ce77b57530a Dikshita Agarwal    2021-01-04  563  			  6, 1, 0);
e98ce77b57530a Dikshita Agarwal    2021-01-04  564  
08c06797627935 Stanimir Varbanov   2020-11-24  565  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
08c06797627935 Stanimir Varbanov   2020-11-24  566  			  V4L2_CID_MPEG_VIDEO_AU_DELIMITER, 0, 1, 1, 0);
08c06797627935 Stanimir Varbanov   2020-11-24  567  
f2fb3f02abe2e6 Dikshita Agarwal    2021-03-24  568  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
f2fb3f02abe2e6 Dikshita Agarwal    2021-03-24  569  			  V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES, 0,
f2fb3f02abe2e6 Dikshita Agarwal    2021-03-24  570  			  ((1 << MAX_LTR_FRAME_COUNT) - 1), 0, 0);
f2fb3f02abe2e6 Dikshita Agarwal    2021-03-24  571  
f2fb3f02abe2e6 Dikshita Agarwal    2021-03-24  572  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
f2fb3f02abe2e6 Dikshita Agarwal    2021-03-24  573  			  V4L2_CID_MPEG_VIDEO_LTR_COUNT, 0,
f2fb3f02abe2e6 Dikshita Agarwal    2021-03-24  574  			  MAX_LTR_FRAME_COUNT, 1, 0);
f2fb3f02abe2e6 Dikshita Agarwal    2021-03-24  575  
f2fb3f02abe2e6 Dikshita Agarwal    2021-03-24  576  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
f2fb3f02abe2e6 Dikshita Agarwal    2021-03-24  577  			  V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX, 0,
f2fb3f02abe2e6 Dikshita Agarwal    2021-03-24  578  			  (MAX_LTR_FRAME_COUNT - 1), 1, 0);
f2fb3f02abe2e6 Dikshita Agarwal    2021-03-24  579  
9172652d72f8e9 Stanimir Varbanov   2020-04-23  580  	v4l2_ctrl_new_std_compound(&inst->ctrl_handler, &venc_ctrl_ops,
9172652d72f8e9 Stanimir Varbanov   2020-04-23  581  				   V4L2_CID_COLORIMETRY_HDR10_CLL_INFO,
9172652d72f8e9 Stanimir Varbanov   2020-04-23 @582  				   v4l2_ctrl_ptr_create(NULL));
9172652d72f8e9 Stanimir Varbanov   2020-04-23  583  
9172652d72f8e9 Stanimir Varbanov   2020-04-23  584  	v4l2_ctrl_new_std_compound(&inst->ctrl_handler, &venc_ctrl_ops,
9172652d72f8e9 Stanimir Varbanov   2020-04-23  585  				   V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY,
9172652d72f8e9 Stanimir Varbanov   2020-04-23  586  				   v4l2_ctrl_ptr_create(NULL));
9172652d72f8e9 Stanimir Varbanov   2020-04-23  587  
fc503c8a3f12af Dikshita Agarwal    2022-04-19  588  	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
fc503c8a3f12af Dikshita Agarwal    2022-04-19  589  			       V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE,
fc503c8a3f12af Dikshita Agarwal    2022-04-19  590  			       V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC,
fc503c8a3f12af Dikshita Agarwal    2022-04-19  591  			       0, V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM);
fc503c8a3f12af Dikshita Agarwal    2022-04-19  592  
f7a3d3dc5831df Stanimir Varbanov   2021-06-22  593  	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
f7a3d3dc5831df Stanimir Varbanov   2021-06-22  594  			  V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD, 0,
f7a3d3dc5831df Stanimir Varbanov   2021-06-22  595  			  ((4096 * 2304) >> 8), 1, 0);
f7a3d3dc5831df Stanimir Varbanov   2021-06-22  596  
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  597  	ret = inst->ctrl_handler.error;
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  598  	if (ret)
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  599  		goto err;
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  600  
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  601  	ret = v4l2_ctrl_handler_setup(&inst->ctrl_handler);
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  602  	if (ret)
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  603  		goto err;
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  604  
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  605  	return 0;
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  606  err:
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  607  	v4l2_ctrl_handler_free(&inst->ctrl_handler);
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  608  	return ret;
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  609  }
aaaa93eda64b00 Stanimir Varbanov   2017-06-15  610  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
