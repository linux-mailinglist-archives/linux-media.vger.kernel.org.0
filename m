Return-Path: <linux-media+bounces-1696-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 326368063F9
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 02:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 90F9BB21185
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 01:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3A8A48;
	Wed,  6 Dec 2023 01:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpdX5n1q"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B7D5181
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 17:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701825149; x=1733361149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NWyLRtZ1vJz+2UnovokBt3fM8qpxYepOlb5WmgU5ZvA=;
  b=fpdX5n1qQOh5ThElyMpQYL/MlfAsXGIOHRaC62j2hZs2oxit7v1C4tOB
   dMYFXoc6XHnX9RZIYKkaXta0J/diqFEzZ2lAOhIITSskpT6zllHZLpRj9
   c+TaTbBojRIb4o8s+QjrW8LAChmVAQD0p5EE9eHUnNIfFsJqGv+kIS9B2
   Tz2afb0f6LG0VoLDlGPXC4TReiLZWJgqyIXRAJy65HeLn050PPw46lAbw
   7maeiP721zNXkitdO77tdB/afgsFemq4NOIYCYfOnJ0xQqbuylK8IqmAB
   hwIeSSaJgLkac1HqvwLY1kUZkfct/5GgoM1CPaqseAc8qmv8ScWwrOqcF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="12701481"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="12701481"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 17:12:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="915002095"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="915002095"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 05 Dec 2023 17:12:26 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAgSd-000A0O-2Y;
	Wed, 06 Dec 2023 01:12:23 +0000
Date: Wed, 6 Dec 2023 09:11:12 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:cleanup 14/17]
 drivers/media/i2c/ccs/ccs-core.c:3310: undefined reference to
 `devm_cci_regmap_init_i2c'
Message-ID: <202312060941.CYiHppAp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git cleanup
head:   c44c7f880ba22a99424b556638a05c1c2bf2d3e8
commit: b72f6809088ccf255c62ba2f1ed707ee7dfa8112 [14/17] media: ccs: Use V4L2 CCI for accessing sensor registers
config: x86_64-randconfig-076-20231201 (https://download.01.org/0day-ci/archive/20231206/202312060941.CYiHppAp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060941.CYiHppAp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060941.CYiHppAp-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `ccs_probe':
>> drivers/media/i2c/ccs/ccs-core.c:3310: undefined reference to `devm_cci_regmap_init_i2c'
   ld: vmlinux.o: in function `__ccs_read_addr':
>> drivers/media/i2c/ccs/ccs-reg-access.c:103: undefined reference to `cci_read'
>> ld: drivers/media/i2c/ccs/ccs-reg-access.c:103: undefined reference to `cci_read'
   ld: vmlinux.o: in function `ccs_write_addr':
>> drivers/media/i2c/ccs/ccs-reg-access.c:224: undefined reference to `cci_write'


vim +3310 drivers/media/i2c/ccs/ccs-core.c

  3208	
  3209	static int ccs_probe(struct i2c_client *client)
  3210	{
  3211		static struct lock_class_key pixel_array_lock_key, binner_lock_key,
  3212			scaler_lock_key;
  3213		const struct ccs_device *ccsdev = device_get_match_data(&client->dev);
  3214		struct ccs_sensor *sensor;
  3215		const struct firmware *fw;
  3216		char filename[40];
  3217		unsigned int i;
  3218		int rval;
  3219	
  3220		sensor = devm_kzalloc(&client->dev, sizeof(*sensor), GFP_KERNEL);
  3221		if (sensor == NULL)
  3222			return -ENOMEM;
  3223	
  3224		rval = ccs_get_hwconfig(sensor, &client->dev);
  3225		if (rval)
  3226			return rval;
  3227	
  3228		sensor->src = &sensor->ssds[sensor->ssds_used];
  3229	
  3230		v4l2_i2c_subdev_init(&sensor->src->sd, client, &ccs_ops);
  3231		sensor->src->sd.internal_ops = &ccs_internal_src_ops;
  3232	
  3233		sensor->regulators = devm_kcalloc(&client->dev,
  3234						  ARRAY_SIZE(ccs_regulators),
  3235						  sizeof(*sensor->regulators),
  3236						  GFP_KERNEL);
  3237		if (!sensor->regulators)
  3238			return -ENOMEM;
  3239	
  3240		for (i = 0; i < ARRAY_SIZE(ccs_regulators); i++)
  3241			sensor->regulators[i].supply = ccs_regulators[i];
  3242	
  3243		rval = devm_regulator_bulk_get(&client->dev, ARRAY_SIZE(ccs_regulators),
  3244					       sensor->regulators);
  3245		if (rval) {
  3246			dev_err(&client->dev, "could not get regulators\n");
  3247			return rval;
  3248		}
  3249	
  3250		sensor->ext_clk = devm_clk_get(&client->dev, NULL);
  3251		if (PTR_ERR(sensor->ext_clk) == -ENOENT) {
  3252			dev_info(&client->dev, "no clock defined, continuing...\n");
  3253			sensor->ext_clk = NULL;
  3254		} else if (IS_ERR(sensor->ext_clk)) {
  3255			dev_err(&client->dev, "could not get clock (%ld)\n",
  3256				PTR_ERR(sensor->ext_clk));
  3257			return -EPROBE_DEFER;
  3258		}
  3259	
  3260		if (sensor->ext_clk) {
  3261			if (sensor->hwcfg.ext_clk) {
  3262				unsigned long rate;
  3263	
  3264				rval = clk_set_rate(sensor->ext_clk,
  3265						    sensor->hwcfg.ext_clk);
  3266				if (rval < 0) {
  3267					dev_err(&client->dev,
  3268						"unable to set clock freq to %u\n",
  3269						sensor->hwcfg.ext_clk);
  3270					return rval;
  3271				}
  3272	
  3273				rate = clk_get_rate(sensor->ext_clk);
  3274				if (rate != sensor->hwcfg.ext_clk) {
  3275					dev_err(&client->dev,
  3276						"can't set clock freq, asked for %u but got %lu\n",
  3277						sensor->hwcfg.ext_clk, rate);
  3278					return -EINVAL;
  3279				}
  3280			} else {
  3281				sensor->hwcfg.ext_clk = clk_get_rate(sensor->ext_clk);
  3282				dev_dbg(&client->dev, "obtained clock freq %u\n",
  3283					sensor->hwcfg.ext_clk);
  3284			}
  3285		} else if (sensor->hwcfg.ext_clk) {
  3286			dev_dbg(&client->dev, "assuming clock freq %u\n",
  3287				sensor->hwcfg.ext_clk);
  3288		} else {
  3289			dev_err(&client->dev, "unable to obtain clock freq\n");
  3290			return -EINVAL;
  3291		}
  3292	
  3293		if (!sensor->hwcfg.ext_clk) {
  3294			dev_err(&client->dev, "cannot work with xclk frequency 0\n");
  3295			return -EINVAL;
  3296		}
  3297	
  3298		sensor->reset = devm_gpiod_get_optional(&client->dev, "reset",
  3299							GPIOD_OUT_HIGH);
  3300		if (IS_ERR(sensor->reset))
  3301			return PTR_ERR(sensor->reset);
  3302		/* Support old users that may have used "xshutdown" property. */
  3303		if (!sensor->reset)
  3304			sensor->xshutdown = devm_gpiod_get_optional(&client->dev,
  3305								    "xshutdown",
  3306								    GPIOD_OUT_LOW);
  3307		if (IS_ERR(sensor->xshutdown))
  3308			return PTR_ERR(sensor->xshutdown);
  3309	
> 3310		sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
  3311		if (IS_ERR(sensor->regmap)) {
  3312			dev_err(&client->dev, "can't initialise CCI (%ld)\n",
  3313				PTR_ERR(sensor->regmap));
  3314			return PTR_ERR(sensor->regmap);
  3315		}
  3316	
  3317		rval = ccs_power_on(&client->dev);
  3318		if (rval < 0)
  3319			return rval;
  3320	
  3321		mutex_init(&sensor->mutex);
  3322	
  3323		rval = ccs_identify_module(sensor);
  3324		if (rval) {
  3325			rval = -ENODEV;
  3326			goto out_power_off;
  3327		}
  3328	
  3329		rval = ccs_firmware_name(client, sensor, filename, sizeof(filename),
  3330					 false);
  3331		if (rval >= sizeof(filename)) {
  3332			rval = -ENOMEM;
  3333			goto out_power_off;
  3334		}
  3335	
  3336		rval = request_firmware(&fw, filename, &client->dev);
  3337		if (!rval) {
  3338			ccs_data_parse(&sensor->sdata, fw->data, fw->size, &client->dev,
  3339				       true);
  3340			release_firmware(fw);
  3341		}
  3342	
  3343		if (!(ccsdev->flags & CCS_DEVICE_FLAG_IS_SMIA) ||
  3344		    sensor->minfo.smiapp_version) {
  3345			rval = ccs_firmware_name(client, sensor, filename,
  3346						 sizeof(filename), true);
  3347			if (rval >= sizeof(filename)) {
  3348				rval = -ENOMEM;
  3349				goto out_release_sdata;
  3350			}
  3351	
  3352			rval = request_firmware(&fw, filename, &client->dev);
  3353			if (!rval) {
  3354				ccs_data_parse(&sensor->mdata, fw->data, fw->size,
  3355					       &client->dev, true);
  3356				release_firmware(fw);
  3357			}
  3358		}
  3359	
  3360		rval = ccs_read_all_limits(sensor);
  3361		if (rval)
  3362			goto out_release_mdata;
  3363	
  3364		rval = ccs_read_frame_fmt(sensor);
  3365		if (rval) {
  3366			rval = -ENODEV;
  3367			goto out_free_ccs_limits;
  3368		}
  3369	
  3370		rval = ccs_update_phy_ctrl(sensor);
  3371		if (rval < 0)
  3372			goto out_free_ccs_limits;
  3373	
  3374		rval = ccs_call_quirk(sensor, limits);
  3375		if (rval) {
  3376			dev_err(&client->dev, "limits quirks failed\n");
  3377			goto out_free_ccs_limits;
  3378		}
  3379	
  3380		if (CCS_LIM(sensor, BINNING_CAPABILITY)) {
  3381			sensor->nbinning_subtypes =
  3382				min_t(u8, CCS_LIM(sensor, BINNING_SUB_TYPES),
  3383				      CCS_LIM_BINNING_SUB_TYPE_MAX_N);
  3384	
  3385			for (i = 0; i < sensor->nbinning_subtypes; i++) {
  3386				sensor->binning_subtypes[i].horizontal =
  3387					CCS_LIM_AT(sensor, BINNING_SUB_TYPE, i) >>
  3388					CCS_BINNING_SUB_TYPE_COLUMN_SHIFT;
  3389				sensor->binning_subtypes[i].vertical =
  3390					CCS_LIM_AT(sensor, BINNING_SUB_TYPE, i) &
  3391					CCS_BINNING_SUB_TYPE_ROW_MASK;
  3392	
  3393				dev_dbg(&client->dev, "binning %xx%x\n",
  3394					sensor->binning_subtypes[i].horizontal,
  3395					sensor->binning_subtypes[i].vertical);
  3396			}
  3397		}
  3398		sensor->binning_horizontal = 1;
  3399		sensor->binning_vertical = 1;
  3400	
  3401		if (device_create_file(&client->dev, &dev_attr_ident) != 0) {
  3402			dev_err(&client->dev, "sysfs ident entry creation failed\n");
  3403			rval = -ENOENT;
  3404			goto out_free_ccs_limits;
  3405		}
  3406	
  3407		if (sensor->minfo.smiapp_version &&
  3408		    CCS_LIM(sensor, DATA_TRANSFER_IF_CAPABILITY) &
  3409		    CCS_DATA_TRANSFER_IF_CAPABILITY_SUPPORTED) {
  3410			if (device_create_file(&client->dev, &dev_attr_nvm) != 0) {
  3411				dev_err(&client->dev, "sysfs nvm entry failed\n");
  3412				rval = -EBUSY;
  3413				goto out_cleanup;
  3414			}
  3415		}
  3416	
  3417		if (!CCS_LIM(sensor, MIN_OP_SYS_CLK_DIV) ||
  3418		    !CCS_LIM(sensor, MAX_OP_SYS_CLK_DIV) ||
  3419		    !CCS_LIM(sensor, MIN_OP_PIX_CLK_DIV) ||
  3420		    !CCS_LIM(sensor, MAX_OP_PIX_CLK_DIV)) {
  3421			/* No OP clock branch */
  3422			sensor->pll.flags |= CCS_PLL_FLAG_NO_OP_CLOCKS;
  3423		} else if (CCS_LIM(sensor, SCALING_CAPABILITY)
  3424			   != CCS_SCALING_CAPABILITY_NONE ||
  3425			   CCS_LIM(sensor, DIGITAL_CROP_CAPABILITY)
  3426			   == CCS_DIGITAL_CROP_CAPABILITY_INPUT_CROP) {
  3427			/* We have a scaler or digital crop. */
  3428			sensor->scaler = &sensor->ssds[sensor->ssds_used];
  3429			sensor->ssds_used++;
  3430		}
  3431		sensor->binner = &sensor->ssds[sensor->ssds_used];
  3432		sensor->ssds_used++;
  3433		sensor->pixel_array = &sensor->ssds[sensor->ssds_used];
  3434		sensor->ssds_used++;
  3435	
  3436		sensor->scale_m = CCS_LIM(sensor, SCALER_N_MIN);
  3437	
  3438		/* prepare PLL configuration input values */
  3439		sensor->pll.bus_type = CCS_PLL_BUS_TYPE_CSI2_DPHY;
  3440		sensor->pll.csi2.lanes = sensor->hwcfg.lanes;
  3441		if (CCS_LIM(sensor, CLOCK_CALCULATION) &
  3442		    CCS_CLOCK_CALCULATION_LANE_SPEED) {
  3443			sensor->pll.flags |= CCS_PLL_FLAG_LANE_SPEED_MODEL;
  3444			if (CCS_LIM(sensor, CLOCK_CALCULATION) &
  3445			    CCS_CLOCK_CALCULATION_LINK_DECOUPLED) {
  3446				sensor->pll.vt_lanes =
  3447					CCS_LIM(sensor, NUM_OF_VT_LANES) + 1;
  3448				sensor->pll.op_lanes =
  3449					CCS_LIM(sensor, NUM_OF_OP_LANES) + 1;
  3450				sensor->pll.flags |= CCS_PLL_FLAG_LINK_DECOUPLED;
  3451			} else {
  3452				sensor->pll.vt_lanes = sensor->pll.csi2.lanes;
  3453				sensor->pll.op_lanes = sensor->pll.csi2.lanes;
  3454			}
  3455		}
  3456		if (CCS_LIM(sensor, CLOCK_TREE_PLL_CAPABILITY) &
  3457		    CCS_CLOCK_TREE_PLL_CAPABILITY_EXT_DIVIDER)
  3458			sensor->pll.flags |= CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER;
  3459		if (CCS_LIM(sensor, CLOCK_TREE_PLL_CAPABILITY) &
  3460		    CCS_CLOCK_TREE_PLL_CAPABILITY_FLEXIBLE_OP_PIX_CLK_DIV)
  3461			sensor->pll.flags |= CCS_PLL_FLAG_FLEXIBLE_OP_PIX_CLK_DIV;
  3462		if (CCS_LIM(sensor, FIFO_SUPPORT_CAPABILITY) &
  3463		    CCS_FIFO_SUPPORT_CAPABILITY_DERATING)
  3464			sensor->pll.flags |= CCS_PLL_FLAG_FIFO_DERATING;
  3465		if (CCS_LIM(sensor, FIFO_SUPPORT_CAPABILITY) &
  3466		    CCS_FIFO_SUPPORT_CAPABILITY_DERATING_OVERRATING)
  3467			sensor->pll.flags |= CCS_PLL_FLAG_FIFO_DERATING |
  3468					     CCS_PLL_FLAG_FIFO_OVERRATING;
  3469		if (CCS_LIM(sensor, CLOCK_TREE_PLL_CAPABILITY) &
  3470		    CCS_CLOCK_TREE_PLL_CAPABILITY_DUAL_PLL) {
  3471			if (CCS_LIM(sensor, CLOCK_TREE_PLL_CAPABILITY) &
  3472			    CCS_CLOCK_TREE_PLL_CAPABILITY_SINGLE_PLL) {
  3473				u32 v;
  3474	
  3475				/* Use sensor default in PLL mode selection */
  3476				rval = ccs_read(sensor, PLL_MODE, &v);
  3477				if (rval)
  3478					goto out_cleanup;
  3479	
  3480				if (v == CCS_PLL_MODE_DUAL)
  3481					sensor->pll.flags |= CCS_PLL_FLAG_DUAL_PLL;
  3482			} else {
  3483				sensor->pll.flags |= CCS_PLL_FLAG_DUAL_PLL;
  3484			}
  3485			if (CCS_LIM(sensor, CLOCK_CALCULATION) &
  3486			    CCS_CLOCK_CALCULATION_DUAL_PLL_OP_SYS_DDR)
  3487				sensor->pll.flags |= CCS_PLL_FLAG_OP_SYS_DDR;
  3488			if (CCS_LIM(sensor, CLOCK_CALCULATION) &
  3489			    CCS_CLOCK_CALCULATION_DUAL_PLL_OP_PIX_DDR)
  3490				sensor->pll.flags |= CCS_PLL_FLAG_OP_PIX_DDR;
  3491		}
  3492		sensor->pll.op_bits_per_lane = CCS_LIM(sensor, OP_BITS_PER_LANE);
  3493		sensor->pll.ext_clk_freq_hz = sensor->hwcfg.ext_clk;
  3494		sensor->pll.scale_n = CCS_LIM(sensor, SCALER_N_MIN);
  3495	
  3496		rval = ccs_get_mbus_formats(sensor);
  3497		if (rval) {
  3498			rval = -ENODEV;
  3499			goto out_cleanup;
  3500		}
  3501	
  3502		rval = ccs_init_subdev(sensor, sensor->scaler, " scaler", 2,
  3503				       MEDIA_ENT_F_PROC_VIDEO_SCALER,
  3504				       "ccs scaler mutex", &scaler_lock_key);
  3505		if (rval)
  3506			goto out_cleanup;
  3507		rval = ccs_init_subdev(sensor, sensor->binner, " binner", 2,
  3508				       MEDIA_ENT_F_PROC_VIDEO_SCALER,
  3509				       "ccs binner mutex", &binner_lock_key);
  3510		if (rval)
  3511			goto out_cleanup;
  3512		rval = ccs_init_subdev(sensor, sensor->pixel_array, " pixel_array", 1,
  3513				       MEDIA_ENT_F_CAM_SENSOR, "ccs pixel array mutex",
  3514				       &pixel_array_lock_key);
  3515		if (rval)
  3516			goto out_cleanup;
  3517	
  3518		rval = ccs_init_controls(sensor);
  3519		if (rval < 0)
  3520			goto out_cleanup;
  3521	
  3522		rval = ccs_call_quirk(sensor, init);
  3523		if (rval)
  3524			goto out_cleanup;
  3525	
  3526		rval = ccs_init_late_controls(sensor);
  3527		if (rval) {
  3528			rval = -ENODEV;
  3529			goto out_cleanup;
  3530		}
  3531	
  3532		mutex_lock(&sensor->mutex);
  3533		rval = ccs_pll_blanking_update(sensor);
  3534		mutex_unlock(&sensor->mutex);
  3535		if (rval) {
  3536			dev_err(&client->dev, "update mode failed\n");
  3537			goto out_cleanup;
  3538		}
  3539	
  3540		sensor->streaming = false;
  3541		sensor->dev_init_done = true;
  3542		sensor->handler_setup_needed = true;
  3543	
  3544		rval = ccs_write_msr_regs(sensor);
  3545		if (rval)
  3546			goto out_cleanup;
  3547	
  3548		pm_runtime_set_active(&client->dev);
  3549		pm_runtime_get_noresume(&client->dev);
  3550		pm_runtime_enable(&client->dev);
  3551	
  3552		rval = v4l2_async_register_subdev_sensor(&sensor->src->sd);
  3553		if (rval < 0)
  3554			goto out_disable_runtime_pm;
  3555	
  3556		pm_runtime_set_autosuspend_delay(&client->dev, 1000);
  3557		pm_runtime_use_autosuspend(&client->dev);
  3558		pm_runtime_put_autosuspend(&client->dev);
  3559	
  3560		return 0;
  3561	
  3562	out_disable_runtime_pm:
  3563		pm_runtime_put_noidle(&client->dev);
  3564		pm_runtime_disable(&client->dev);
  3565	
  3566	out_cleanup:
  3567		ccs_cleanup(sensor);
  3568	
  3569	out_release_mdata:
  3570		kvfree(sensor->mdata.backing);
  3571	
  3572	out_release_sdata:
  3573		kvfree(sensor->sdata.backing);
  3574	
  3575	out_free_ccs_limits:
  3576		kfree(sensor->ccs_limits);
  3577	
  3578	out_power_off:
  3579		ccs_power_off(&client->dev);
  3580		mutex_destroy(&sensor->mutex);
  3581	
  3582		return rval;
  3583	}
  3584	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

