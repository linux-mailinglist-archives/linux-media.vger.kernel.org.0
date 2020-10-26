Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C56A3299440
	for <lists+linux-media@lfdr.de>; Mon, 26 Oct 2020 18:48:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1788371AbgJZRsP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Oct 2020 13:48:15 -0400
Received: from mga03.intel.com ([134.134.136.65]:46339 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1788178AbgJZRsN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Oct 2020 13:48:13 -0400
IronPort-SDR: OoxCv8yZ/BtppnONhEVNUwdRfpC2Waz/iJGVW2PD6lWqf5DnCb4RIRAKR/3hFysX2yaPZMdQjB
 OhyFG+2DyxsQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9786"; a="168062870"
X-IronPort-AV: E=Sophos;i="5.77,420,1596524400"; 
   d="gz'50?scan'50,208,50";a="168062870"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2020 10:48:11 -0700
IronPort-SDR: h2EefMXONE0pRKjAllmoZKDS43S6pSZSjSFR+bumJmXgcvzuiCrTXIYa62+3KJtIIMkuWe8OSs
 +pyfz0a9qhXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,420,1596524400"; 
   d="gz'50?scan'50,208,50";a="317939657"
Received: from lkp-server01.sh.intel.com (HELO ca9e3ad0a302) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 26 Oct 2020 10:48:08 -0700
Received: from kbuild by ca9e3ad0a302 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kX6bH-00005G-AP; Mon, 26 Oct 2020 17:48:07 +0000
Date:   Tue, 27 Oct 2020 01:47:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH] venus: venc: Fix setting of profile and level
Message-ID: <202010270115.o3EXaiH4-lkp@intel.com>
References: <20201024163436.19638-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="tThc/1wpZn/ma/RB"
Content-Disposition: inline
In-Reply-To: <20201024163436.19638-1-stanimir.varbanov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stanimir,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linuxtv-media/master]
[also build test WARNING on linus/master v5.10-rc1 next-20201026]
[cannot apply to linux/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Stanimir-Varbanov/venus-venc-Fix-setting-of-profile-and-level/20201025-003549
base:   git://linuxtv.org/media_tree.git master
config: arm-randconfig-r023-20201026 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project f2c25c70791de95d2466e09b5b58fc37f6ccd7a4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/11157ae4c1a8ce951c7b93f2bd240b9d96779965
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Stanimir-Varbanov/venus-venc-Fix-setting-of-profile-and-level/20201025-003549
        git checkout 11157ae4c1a8ce951c7b93f2bd240b9d96779965
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/platform/qcom/venus/venc.c:713:2: warning: variable 'profile' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
           default:
           ^~~~~~~
   drivers/media/platform/qcom/venus/venc.c:717:45: note: uninitialized use occurs here
           ret = venus_helper_set_profile_level(inst, profile, level);
                                                      ^~~~~~~
   drivers/media/platform/qcom/venus/venc.c:540:13: note: initialize the variable 'profile' to silence this warning
           u32 profile, level;
                      ^
                       = 0
>> drivers/media/platform/qcom/venus/venc.c:713:2: warning: variable 'level' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
           default:
           ^~~~~~~
   drivers/media/platform/qcom/venus/venc.c:717:54: note: uninitialized use occurs here
           ret = venus_helper_set_profile_level(inst, profile, level);
                                                               ^~~~~
   drivers/media/platform/qcom/venus/venc.c:540:20: note: initialize the variable 'level' to silence this warning
           u32 profile, level;
                             ^
                              = 0
   2 warnings generated.

vim +/profile +713 drivers/media/platform/qcom/venus/venc.c

   529	
   530	static int venc_set_properties(struct venus_inst *inst)
   531	{
   532		struct venc_controls *ctr = &inst->controls.enc;
   533		struct hfi_intra_period intra_period;
   534		struct hfi_framerate frate;
   535		struct hfi_bitrate brate;
   536		struct hfi_idr_period idrp;
   537		struct hfi_quantization quant;
   538		struct hfi_quantization_range quant_range;
   539		u32 ptype, rate_control, bitrate;
   540		u32 profile, level;
   541		int ret;
   542	
   543		ret = venus_helper_set_work_mode(inst, VIDC_WORK_MODE_2);
   544		if (ret)
   545			return ret;
   546	
   547		ptype = HFI_PROPERTY_CONFIG_FRAME_RATE;
   548		frate.buffer_type = HFI_BUFFER_OUTPUT;
   549		frate.framerate = inst->fps * (1 << 16);
   550	
   551		ret = hfi_session_set_property(inst, ptype, &frate);
   552		if (ret)
   553			return ret;
   554	
   555		if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264) {
   556			struct hfi_h264_vui_timing_info info;
   557			struct hfi_h264_entropy_control entropy;
   558			struct hfi_h264_db_control deblock;
   559	
   560			ptype = HFI_PROPERTY_PARAM_VENC_H264_VUI_TIMING_INFO;
   561			info.enable = 1;
   562			info.fixed_framerate = 1;
   563			info.time_scale = NSEC_PER_SEC;
   564	
   565			ret = hfi_session_set_property(inst, ptype, &info);
   566			if (ret)
   567				return ret;
   568	
   569			ptype = HFI_PROPERTY_PARAM_VENC_H264_ENTROPY_CONTROL;
   570			entropy.entropy_mode = venc_v4l2_to_hfi(
   571						  V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE,
   572						  ctr->h264_entropy_mode);
   573			entropy.cabac_model = HFI_H264_CABAC_MODEL_0;
   574	
   575			ret = hfi_session_set_property(inst, ptype, &entropy);
   576			if (ret)
   577				return ret;
   578	
   579			ptype = HFI_PROPERTY_PARAM_VENC_H264_DEBLOCK_CONTROL;
   580			deblock.mode = venc_v4l2_to_hfi(
   581					      V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE,
   582					      ctr->h264_loop_filter_mode);
   583			deblock.slice_alpha_offset = ctr->h264_loop_filter_alpha;
   584			deblock.slice_beta_offset = ctr->h264_loop_filter_beta;
   585	
   586			ret = hfi_session_set_property(inst, ptype, &deblock);
   587			if (ret)
   588				return ret;
   589		}
   590	
   591		/* IDR periodicity, n:
   592		 * n = 0 - only the first I-frame is IDR frame
   593		 * n = 1 - all I-frames will be IDR frames
   594		 * n > 1 - every n-th I-frame will be IDR frame
   595		 */
   596		ptype = HFI_PROPERTY_CONFIG_VENC_IDR_PERIOD;
   597		idrp.idr_period = 0;
   598		ret = hfi_session_set_property(inst, ptype, &idrp);
   599		if (ret)
   600			return ret;
   601	
   602		if (ctr->num_b_frames) {
   603			u32 max_num_b_frames = NUM_B_FRAMES_MAX;
   604	
   605			ptype = HFI_PROPERTY_PARAM_VENC_MAX_NUM_B_FRAMES;
   606			ret = hfi_session_set_property(inst, ptype, &max_num_b_frames);
   607			if (ret)
   608				return ret;
   609		}
   610	
   611		ptype = HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD;
   612		intra_period.pframes = ctr->num_p_frames;
   613		intra_period.bframes = ctr->num_b_frames;
   614	
   615		ret = hfi_session_set_property(inst, ptype, &intra_period);
   616		if (ret)
   617			return ret;
   618	
   619		if (!ctr->rc_enable)
   620			rate_control = HFI_RATE_CONTROL_OFF;
   621		else if (ctr->bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_VBR)
   622			rate_control = ctr->frame_skip_mode ? HFI_RATE_CONTROL_VBR_VFR :
   623							      HFI_RATE_CONTROL_VBR_CFR;
   624		else if (ctr->bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)
   625			rate_control = ctr->frame_skip_mode ? HFI_RATE_CONTROL_CBR_VFR :
   626							      HFI_RATE_CONTROL_CBR_CFR;
   627		else if (ctr->bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_CQ)
   628			rate_control = HFI_RATE_CONTROL_CQ;
   629	
   630		ptype = HFI_PROPERTY_PARAM_VENC_RATE_CONTROL;
   631		ret = hfi_session_set_property(inst, ptype, &rate_control);
   632		if (ret)
   633			return ret;
   634	
   635		if (rate_control == HFI_RATE_CONTROL_CQ && ctr->const_quality) {
   636			struct hfi_heic_frame_quality quality = {};
   637	
   638			ptype = HFI_PROPERTY_CONFIG_HEIC_FRAME_QUALITY;
   639			quality.frame_quality = ctr->const_quality;
   640			ret = hfi_session_set_property(inst, ptype, &quality);
   641			if (ret)
   642				return ret;
   643		}
   644	
   645		if (!ctr->bitrate)
   646			bitrate = 64000;
   647		else
   648			bitrate = ctr->bitrate;
   649	
   650		ptype = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE;
   651		brate.bitrate = bitrate;
   652		brate.layer_id = 0;
   653	
   654		ret = hfi_session_set_property(inst, ptype, &brate);
   655		if (ret)
   656			return ret;
   657	
   658		if (!ctr->bitrate_peak)
   659			bitrate *= 2;
   660		else
   661			bitrate = ctr->bitrate_peak;
   662	
   663		ptype = HFI_PROPERTY_CONFIG_VENC_MAX_BITRATE;
   664		brate.bitrate = bitrate;
   665		brate.layer_id = 0;
   666	
   667		ret = hfi_session_set_property(inst, ptype, &brate);
   668		if (ret)
   669			return ret;
   670	
   671		ptype = HFI_PROPERTY_PARAM_VENC_SESSION_QP;
   672		quant.qp_i = ctr->h264_i_qp;
   673		quant.qp_p = ctr->h264_p_qp;
   674		quant.qp_b = ctr->h264_b_qp;
   675		quant.layer_id = 0;
   676		ret = hfi_session_set_property(inst, ptype, &quant);
   677		if (ret)
   678			return ret;
   679	
   680		ptype = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE;
   681		quant_range.min_qp = ctr->h264_min_qp;
   682		quant_range.max_qp = ctr->h264_max_qp;
   683		quant_range.layer_id = 0;
   684		ret = hfi_session_set_property(inst, ptype, &quant_range);
   685		if (ret)
   686			return ret;
   687	
   688		switch (inst->hfi_codec) {
   689		case HFI_VIDEO_CODEC_H264:
   690			profile = ctr->profile.h264;
   691			level = ctr->level.h264;
   692			break;
   693		case HFI_VIDEO_CODEC_MPEG2:
   694			profile = 0;
   695			level = 0;
   696			break;
   697		case HFI_VIDEO_CODEC_MPEG4:
   698			profile = ctr->profile.mpeg4;
   699			level = ctr->level.mpeg4;
   700			break;
   701		case HFI_VIDEO_CODEC_VP8:
   702			profile = ctr->profile.vp8;
   703			level = 0;
   704			break;
   705		case HFI_VIDEO_CODEC_VP9:
   706			profile = ctr->profile.vp9;
   707			level = ctr->level.vp9;
   708			break;
   709		case HFI_VIDEO_CODEC_HEVC:
   710			profile = ctr->profile.hevc;
   711			level = ctr->level.hevc;
   712			break;
 > 713		default:
   714			break;
   715		}
   716	
   717		ret = venus_helper_set_profile_level(inst, profile, level);
   718		if (ret)
   719			return ret;
   720	
   721		return 0;
   722	}
   723	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--tThc/1wpZn/ma/RB
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--tThc/1wpZn/ma/RB--
