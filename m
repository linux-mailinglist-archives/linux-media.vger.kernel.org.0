Return-Path: <linux-media+bounces-28586-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9FEA6C02A
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 17:40:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4CA147AA442
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 16:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A86222CBF9;
	Fri, 21 Mar 2025 16:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K8prQpQw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B09222CBC4
	for <linux-media@vger.kernel.org>; Fri, 21 Mar 2025 16:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742575115; cv=none; b=N34zMyiOfXX5ud54VDsgBH4q7Se6w0DHVVaHae1hsqtZOZeRj8vlmruG56q+qY5G/WgFBmhAJ1vgcVIffnOssWy8MgKk9mAj13E+8apLMswgqCuREi2kRsDWYjCSsbbjf5c79CecJM4nlowzhMNjHmFTXZI8nJgA4hSG1MSXJjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742575115; c=relaxed/simple;
	bh=SGMyVxnZ+MzTdvrIj2s8i38Iq/iGKfsChbod70j0t28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=OtH0uo8HvGbZtGTlp1ub9Chj4tWn9kB9R7JiT/Ppoo13OuSqSGlurXw7Y+4ihJbl1WTvcPVjvdU6x2P+2KpWxA8JUd+j/VKesFU6EFbBNVGh5Xy5lgm1EP2dosLNYbZR+2M5KuXP7+YkCt+oizMvtqd4NgoNTW6U6T6fEUFsvSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K8prQpQw; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso16368265e9.1
        for <linux-media@vger.kernel.org>; Fri, 21 Mar 2025 09:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742575111; x=1743179911; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M66IomIzkzJINrakLHl9O9LuZS7ixOMTsWRGHpefK08=;
        b=K8prQpQw/msqvVuL7EOCuXMyrRzbuTYiIM8WuXSwVLs7xkIaonU2Aq7fcTFAzzaevY
         CMtl3YmN+N9AiZlp1nhIuO/KKGdAVufXQvS2lvis2VdNwoWHTWD3Cbeycq6qb6RNYk5f
         2c+Xcdwu+mAyRXqUTqTtnON9zT8mIiVh2k+RkBOCvhb84j9gg22/Vm01RQC3o/sLBsnl
         MZx64P+fPgU0xS3jeitj1seg+cWwXK4YDpPyblT/bLmRiAVQe7hUmPtXFHqtM1sQwKrm
         klBVxZKu4Vi+IGX3mSQmNU5D21bCr8qe9R+7OZTXwMVhE5EEU42LEyekdTr4vPRR5fxk
         uO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742575111; x=1743179911;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M66IomIzkzJINrakLHl9O9LuZS7ixOMTsWRGHpefK08=;
        b=KpAeS/A48vCaVescC3MpXPRrC5XSbU7vpiX3pLp3x9QZ+75kpy77urO2YyOO9yhOSG
         xJT1z82MVlVqhZHjI104AtpJS1ue51daJQPCgxyQkM+vw9NwWK3UHuXJvhDns6i+RYeZ
         7gg/pG3UuCjB9QqanIxcXw4MutXMoZj+mNFaakhql8uzeIsZw79MncQL0lr4zgD3hMUA
         6tJ4JZTR+ALXUg/hCFfvq0UFkJj2u8cN4jLmbwXEokf1TgdcNPk2oVeDWRvcfJ5Yxobx
         QPabY77D6gS1gUrV4BBDMyJuO4I2/rpn4zMzY3EUshbeslHTHOxEj1UHUMVqn1BMuKbG
         dE5g==
X-Forwarded-Encrypted: i=1; AJvYcCWmGQUUNOxriJoru5P1qcpUiw+NoOQRM/x0EEobrvlfsl/VB7/tXYfpwKizRAc3yK9wLbF92J9Un7thQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRXDcqjpLCPFh1pfgq5sny50lbtmdzprbRYAh/EXRIQFfzu6We
	jk9g1RNIQh36OqMc8FkNMCvURTGTqeT5XuRHddxYBeZtbHnceHA6+FTA9JmAHIg=
X-Gm-Gg: ASbGnctSinz3cTeMue28Z4Q+chEOUBkOGcPbO2IK5I1rZkE5EB51S/oYLOCpO1h+Zud
	/vtiupj37oEOc+OK5HqfVd8YHEMhHq63MpSl160BE3lTgIM3FocMTEIu/HPiB+wBqXTptOV3gfT
	FVp47tAd/LtK5Rf5IovQt67HPX06ZLrHapA3U7E0oZ+rg6G9Hx0l5TO8SCOXF3LDlJB4fyjQ0pl
	0BQ1bZ2fHD/eE8DdhL7RDYP8EC4aH3gprdigl0QKG4GjuMm3dQ55X52y7mPvPVMBTSnq00wY0EW
	eaVUXAG//rGgM3piFqZXLF1C9hJCEtGTaYu2eARAqKoU8U6oGA==
X-Google-Smtp-Source: AGHT+IGs2Xs5NA9UgDikP21BJ+dhSnlUUOV2e0GxK4LQKHW92AIbM5FNZTZmXDjI3Jxw+OyKtJ/5AQ==
X-Received: by 2002:a05:6000:401f:b0:391:22a9:4427 with SMTP id ffacd0b85a97d-3997f90f413mr3856367f8f.12.1742575111321;
        Fri, 21 Mar 2025 09:38:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3997f9efe61sm2829454f8f.97.2025.03.21.09.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 09:38:30 -0700 (PDT)
Date: Fri, 21 Mar 2025 19:38:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Hao Yao <hao.yao@intel.com>, Jim Lai <jim.lai@intel.com>,
	You-Sheng Yang <vicamo.yang@canonical.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH 1/8] media: i2c: add OV02E10 image sensor driver
Message-ID: <e1f7b80c-7b7f-40d1-ab0c-051198b245e3@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317-b4-media-comitters-next-25-03-13-ov02e10-v1-1-bd924634b889@linaro.org>

Hi Bryan,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Bryan-O-Donoghue/media-i2c-add-OV02E10-image-sensor-driver/20250317-084316
base:   f2151613e040973c868d28c8b00885dfab69eb75
patch link:    https://lore.kernel.org/r/20250317-b4-media-comitters-next-25-03-13-ov02e10-v1-1-bd924634b889%40linaro.org
patch subject: [PATCH 1/8] media: i2c: add OV02E10 image sensor driver
config: openrisc-randconfig-r073-20250321 (https://download.01.org/0day-ci/archive/20250322/202503220055.pt1r9P7M-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503220055.pt1r9P7M-lkp@intel.com/

smatch warnings:
drivers/media/i2c/ov02e10.c:903 ov02e10_probe() warn: missing unwind goto?

vim +903 drivers/media/i2c/ov02e10.c

62323d3b3c4dc1 Jingjing Xiong 2025-03-17  862  static int ov02e10_probe(struct i2c_client *client)
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  863  {
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  864  	struct ov02e10 *ov02e;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  865  	int ret;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  866  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  867  	/* Check HW config */
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  868  	ret = ov02e10_check_hwcfg(&client->dev);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  869  	if (ret)
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  870  		return ret;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  871  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  872  	ov02e = devm_kzalloc(&client->dev, sizeof(*ov02e), GFP_KERNEL);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  873  	if (!ov02e)
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  874  		return -ENOMEM;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  875  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  876  	/* Initialize subdev */
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  877  	ov02e->regmap = devm_cci_regmap_init_i2c(client, 8);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  878  	if (IS_ERR(ov02e->regmap))
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  879  		return PTR_ERR(ov02e->regmap);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  880  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  881  	v4l2_i2c_subdev_init(&ov02e->sd, client, &ov02e10_subdev_ops);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  882  	ov02e10_get_pm_resources(&client->dev);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  883  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  884  	ret = ov02e10_power_on(&client->dev);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  885  	if (ret) {
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  886  		dev_err_probe(&client->dev, ret, "failed to power on\n");
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  887  		goto error_power_off;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  888  	}
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  889  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  890  	/* Check module identity */
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  891  	ret = ov02e10_identify_module(ov02e);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  892  	if (ret) {
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  893  		dev_err(&client->dev, "failed to find sensor: %d\n", ret);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  894  		goto error_power_off;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  895  	}
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  896  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  897  	/* Set default mode to max resolution */
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  898  	ov02e->cur_mode = &supported_modes[0];
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  899  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  900  	dev_dbg(&client->dev, "will Init controls\n");
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  901  	ret = ov02e10_init_controls(ov02e);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  902  	if (ret)
62323d3b3c4dc1 Jingjing Xiong 2025-03-17 @903  		return ret;

goto error_power_off;?

62323d3b3c4dc1 Jingjing Xiong 2025-03-17  904  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  905  	/* Initialize subdev */
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  906  	ov02e->sd.internal_ops = &ov02e10_internal_ops;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  907  	ov02e->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  908  	ov02e->sd.entity.ops = &ov02e10_subdev_entity_ops;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  909  	ov02e->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  910  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  911  	/* Initialize source pad */
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  912  	ov02e->pad.flags = MEDIA_PAD_FL_SOURCE;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  913  	ret = media_entity_pads_init(&ov02e->sd.entity, 1, &ov02e->pad);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  914  	if (ret) {
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  915  		dev_err(&client->dev, "%s failed:%d\n", __func__, ret);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  916  		goto error_handler_free;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  917  	}
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  918  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  919  	ret = v4l2_async_register_subdev_sensor(&ov02e->sd);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  920  	if (ret < 0) {
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  921  		dev_err(&client->dev, "async reg subdev error\n");
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  922  		goto error_media_entity;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  923  	}
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  924  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  925  	/*
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  926  	 * Device is already turned on by i2c-core with ACPI domain PM.
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  927  	 * Enable runtime PM and turn off the device.
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  928  	 */
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  929  	pm_runtime_set_active(&client->dev);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  930  	pm_runtime_enable(&client->dev);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  931  	pm_runtime_idle(&client->dev);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  932  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  933  	return 0;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  934  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  935  error_media_entity:
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  936  	media_entity_cleanup(&ov02e->sd.entity);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  937  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  938  error_handler_free:
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  939  	v4l2_ctrl_handler_free(ov02e->sd.ctrl_handler);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  940  	mutex_destroy(&ov02e->mutex);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  941  	dev_err(&client->dev, "%s failed:%d\n", __func__, ret);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  942  error_power_off:
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  943  	ov02e10_power_off(&client->dev);
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  944  
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  945  	dev_dbg(&client->dev, "probe done\n");
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  946  	return ret;
62323d3b3c4dc1 Jingjing Xiong 2025-03-17  947  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


