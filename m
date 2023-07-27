Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA8B4764EA3
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 11:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233092AbjG0JIn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jul 2023 05:08:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233421AbjG0JIW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jul 2023 05:08:22 -0400
Received: from mgamail.intel.com (unknown [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CA45AD39
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 01:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690447780; x=1721983780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=thgfgq9LM0wo6rOSTfSpv96E/Jl8XjqiVjbwuIp009E=;
  b=A1L2OAO2C79TRlxzAB3tsL4ju9OtYvUT98ubZtvVKlfhwg57p/7PnoLH
   ppxyYi3K1ziWXZ0OPdQpBbUWhN1cDU+8+UMRdeL1oYKovtgFPMGudtR9h
   TrGJZToqMf8QxDyT8G7jIZ/zruwpuQvLtrxmr2AA2ljc+0qFvU8Kn2FOI
   fvZmYijOLawT2pc4JA9ooPecGKaWfHLp13IQdTTucb2UksXR/WnzIYGvc
   XzjpyrT8zbcHBFxMOldriG5/XQ55ggNQZ/L+UtmLkaDvtEJMNN7wPexUf
   3nUiTlTGEV9qgAAUR/T+cvQskoEFcN+YrFNGHm952u7Ky0i04R65+Ilyu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="432049166"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="432049166"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 01:49:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="756576655"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="756576655"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 27 Jul 2023 01:49:37 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qOwgf-00026f-0x;
        Thu, 27 Jul 2023 08:49:34 +0000
Date:   Thu, 27 Jul 2023 16:47:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [sailus-media-tree:master 9/20] drivers/media/i2c/ov5693.c:616:
 undefined reference to `cci_write'
Message-ID: <202307271602.UaRdCl4a-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   git://linuxtv.org/sailus/media_tree.git master
head:   215e4463b11d94668b841368cb6882f3a2968148
commit: 6ca0d78da91133ec78ecfbdaa7d066849b1b0c0c [9/20] media: ov5693: Convert to new CCI register access helpers
config: i386-randconfig-i016-20230727 (https://download.01.org/0day-ci/archive/20230727/202307271602.UaRdCl4a-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307271602.UaRdCl4a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307271602.UaRdCl4a-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/media/i2c/ov5693.o: in function `ov5693_enable_streaming':
>> drivers/media/i2c/ov5693.c:616: undefined reference to `cci_write'
   ld: drivers/media/i2c/ov5693.o: in function `ov5693_digital_gain_configure':
   drivers/media/i2c/ov5693.c:438: undefined reference to `cci_write'
>> ld: drivers/media/i2c/ov5693.c:439: undefined reference to `cci_write'
   ld: drivers/media/i2c/ov5693.c:440: undefined reference to `cci_write'
   ld: drivers/media/i2c/ov5693.o: in function `ov5693_flip_vert_configure':
>> drivers/media/i2c/ov5693.c:365: undefined reference to `cci_update_bits'
   ld: drivers/media/i2c/ov5693.o: in function `ov5693_test_pattern_configure':
   drivers/media/i2c/ov5693.c:470: undefined reference to `cci_write'
   ld: drivers/media/i2c/ov5693.o: in function `ov5693_get_gain':
>> drivers/media/i2c/ov5693.c:421: undefined reference to `cci_read'
   ld: drivers/media/i2c/ov5693.o: in function `ov5693_probe':
>> drivers/media/i2c/ov5693.c:1280: undefined reference to `devm_cci_regmap_init_i2c'
   ld: drivers/media/i2c/ov5693.o: in function `ov5693_detect':
   drivers/media/i2c/ov5693.c:744: undefined reference to `cci_read'


vim +616 drivers/media/i2c/ov5693.c

   415	
   416	static int ov5693_get_gain(struct ov5693_device *ov5693, u32 *gain)
   417	{
   418		u64 value;
   419		int ret;
   420	
 > 421		ret = cci_read(ov5693->regmap, OV5693_GAIN_CTRL_REG, &value, NULL);
   422		if (ret)
   423			return ret;
   424	
   425		/* As with exposure, the lowest 4 bits are fractional bits. */
   426		*gain = value >> 4;
   427	
   428		return ret;
   429	}
   430	
   431	static int ov5693_digital_gain_configure(struct ov5693_device *ov5693,
   432						 u32 gain)
   433	{
   434		int ret = 0;
   435	
   436		gain &= OV5693_MWB_GAIN_MASK;
   437	
 > 438		cci_write(ov5693->regmap, OV5693_MWB_RED_GAIN_REG, gain, &ret);
 > 439		cci_write(ov5693->regmap, OV5693_MWB_GREEN_GAIN_REG, gain, &ret);
   440		cci_write(ov5693->regmap, OV5693_MWB_BLUE_GAIN_REG, gain, &ret);
   441	
   442		return ret;
   443	}
   444	
   445	static int ov5693_analog_gain_configure(struct ov5693_device *ov5693, u32 gain)
   446	{
   447		int ret = 0;
   448	
   449		gain = (gain << 4) & OV5693_GAIN_CTRL_MASK;
   450	
   451		cci_write(ov5693->regmap, OV5693_GAIN_CTRL_REG, gain, &ret);
   452	
   453		return ret;
   454	}
   455	
   456	static int ov5693_vts_configure(struct ov5693_device *ov5693, u32 vblank)
   457	{
   458		u16 vts = ov5693->mode.format.height + vblank;
   459		int ret = 0;
   460	
   461		cci_write(ov5693->regmap, OV5693_TIMING_VTS_REG, vts, &ret);
   462	
   463		return ret;
   464	}
   465	
   466	static int ov5693_test_pattern_configure(struct ov5693_device *ov5693, u32 idx)
   467	{
   468		int ret = 0;
   469	
   470		cci_write(ov5693->regmap, OV5693_TEST_PATTERN_REG,
   471			  ov5693_test_pattern_bits[idx], &ret);
   472	
   473		return ret;
   474	}
   475	
   476	static int ov5693_s_ctrl(struct v4l2_ctrl *ctrl)
   477	{
   478		struct ov5693_device *ov5693 =
   479		    container_of(ctrl->handler, struct ov5693_device, ctrls.handler);
   480		int ret = 0;
   481	
   482		/* If VBLANK is altered we need to update exposure to compensate */
   483		if (ctrl->id == V4L2_CID_VBLANK) {
   484			int exposure_max;
   485	
   486			exposure_max = ov5693->mode.format.height + ctrl->val -
   487				       OV5693_INTEGRATION_TIME_MARGIN;
   488			__v4l2_ctrl_modify_range(ov5693->ctrls.exposure,
   489						 ov5693->ctrls.exposure->minimum,
   490						 exposure_max,
   491						 ov5693->ctrls.exposure->step,
   492						 min(ov5693->ctrls.exposure->val,
   493						     exposure_max));
   494		}
   495	
   496		/* Only apply changes to the controls if the device is powered up */
   497		if (!pm_runtime_get_if_in_use(ov5693->dev))
   498			return 0;
   499	
   500		switch (ctrl->id) {
   501		case V4L2_CID_EXPOSURE:
   502			ret = ov5693_exposure_configure(ov5693, ctrl->val);
   503			break;
   504		case V4L2_CID_ANALOGUE_GAIN:
   505			ret = ov5693_analog_gain_configure(ov5693, ctrl->val);
   506			break;
   507		case V4L2_CID_DIGITAL_GAIN:
   508			ret = ov5693_digital_gain_configure(ov5693, ctrl->val);
   509			break;
   510		case V4L2_CID_HFLIP:
   511			ret = ov5693_flip_horz_configure(ov5693, !!ctrl->val);
   512			break;
   513		case V4L2_CID_VFLIP:
   514			ret = ov5693_flip_vert_configure(ov5693, !!ctrl->val);
   515			break;
   516		case V4L2_CID_VBLANK:
   517			ret = ov5693_vts_configure(ov5693, ctrl->val);
   518			break;
   519		case V4L2_CID_TEST_PATTERN:
   520			ret = ov5693_test_pattern_configure(ov5693, ctrl->val);
   521			break;
   522		default:
   523			ret = -EINVAL;
   524		}
   525	
   526		pm_runtime_put(ov5693->dev);
   527	
   528		return ret;
   529	}
   530	
   531	static int ov5693_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
   532	{
   533		struct ov5693_device *ov5693 = container_of(ctrl->handler,
   534							    struct ov5693_device,
   535							    ctrls.handler);
   536	
   537		switch (ctrl->id) {
   538		case V4L2_CID_EXPOSURE_ABSOLUTE:
   539			return ov5693_get_exposure(ov5693, &ctrl->val);
   540		case V4L2_CID_AUTOGAIN:
   541			return ov5693_get_gain(ov5693, &ctrl->val);
   542		default:
   543			return -EINVAL;
   544		}
   545	}
   546	
   547	static const struct v4l2_ctrl_ops ov5693_ctrl_ops = {
   548		.s_ctrl = ov5693_s_ctrl,
   549		.g_volatile_ctrl = ov5693_g_volatile_ctrl
   550	};
   551	
   552	/* System Control Functions */
   553	
   554	static int ov5693_mode_configure(struct ov5693_device *ov5693)
   555	{
   556		const struct ov5693_mode *mode = &ov5693->mode;
   557		int ret = 0;
   558	
   559		/* Crop Start X */
   560		cci_write(ov5693->regmap, OV5693_CROP_START_X_REG, mode->crop.left,
   561			  &ret);
   562	
   563		/* Offset X */
   564		cci_write(ov5693->regmap, OV5693_OFFSET_START_X_REG, 0, &ret);
   565	
   566		/* Output Size X */
   567		cci_write(ov5693->regmap, OV5693_OUTPUT_SIZE_X_REG, mode->format.width,
   568			  &ret);
   569	
   570		/* Crop End X */
   571		cci_write(ov5693->regmap, OV5693_CROP_END_X_REG,
   572			  mode->crop.left + mode->crop.width, &ret);
   573	
   574		/* Horizontal Total Size */
   575		cci_write(ov5693->regmap, OV5693_TIMING_HTS_REG, OV5693_FIXED_PPL,
   576			  &ret);
   577	
   578		/* Crop Start Y */
   579		cci_write(ov5693->regmap, OV5693_CROP_START_Y_REG, mode->crop.top,
   580			  &ret);
   581	
   582		/* Offset Y */
   583		cci_write(ov5693->regmap, OV5693_OFFSET_START_Y_REG, 0, &ret);
   584	
   585		/* Output Size Y */
   586		cci_write(ov5693->regmap, OV5693_OUTPUT_SIZE_Y_REG, mode->format.height,
   587			  &ret);
   588	
   589		/* Crop End Y */
   590		cci_write(ov5693->regmap, OV5693_CROP_END_Y_REG,
   591			  mode->crop.top + mode->crop.height, &ret);
   592	
   593		/* Subsample X increase */
   594		cci_write(ov5693->regmap, OV5693_SUB_INC_X_REG,
   595			  ((mode->inc_x_odd << 4) & 0xf0) | 0x01, &ret);
   596		/* Subsample Y increase */
   597		cci_write(ov5693->regmap, OV5693_SUB_INC_Y_REG,
   598			  ((mode->inc_y_odd << 4) & 0xf0) | 0x01, &ret);
   599	
   600		/* Binning */
   601		cci_update_bits(ov5693->regmap, OV5693_FORMAT1_REG,
   602				OV5693_FORMAT1_VBIN_EN,
   603				mode->binning_y ? OV5693_FORMAT1_VBIN_EN : 0, &ret);
   604	
   605		cci_update_bits(ov5693->regmap, OV5693_FORMAT2_REG,
   606				OV5693_FORMAT2_HBIN_EN,
   607				mode->binning_x ? OV5693_FORMAT2_HBIN_EN : 0, &ret);
   608	
   609		return ret;
   610	}
   611	
   612	static int ov5693_enable_streaming(struct ov5693_device *ov5693, bool enable)
   613	{
   614		int ret = 0;
   615	
 > 616		cci_write(ov5693->regmap, OV5693_SW_STREAM_REG,
   617			  enable ? OV5693_START_STREAMING : OV5693_STOP_STREAMING,
   618			  &ret);
   619	
   620		return ret;
   621	}
   622	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
