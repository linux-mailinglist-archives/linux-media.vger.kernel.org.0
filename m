Return-Path: <linux-media+bounces-3610-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 584D082BB22
	for <lists+linux-media@lfdr.de>; Fri, 12 Jan 2024 07:03:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0CF9286B41
	for <lists+linux-media@lfdr.de>; Fri, 12 Jan 2024 06:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F39C95C8E5;
	Fri, 12 Jan 2024 06:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OuTcyKl5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD4DBE42
	for <linux-media@vger.kernel.org>; Fri, 12 Jan 2024 06:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40e6296636fso11096725e9.2
        for <linux-media@vger.kernel.org>; Thu, 11 Jan 2024 22:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705039422; x=1705644222; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ywmI/tG6PGjLugPlncHNh/C8Y7NuXCRr0z+zVLWGR40=;
        b=OuTcyKl5wo6BE2uJt3MIoo9EavPE+TcP03E8pUMfGuhaWcJGQ2d8gAtgoWWsBbukng
         QYj/8keAlr4grUill5kpCTP4hn00Z0+KGz2MGAq7XFs1GPOluX/XbZVNkFo0Pu31I7ns
         iM2AvBnIaT+E17YQCYgFgSfPT6/pkDEwzI2PulMZ2IjgteO0zvJ5nsFia+8D5RDP2LMJ
         wNGfboiMmOi58UP4VctCiNe7oL/iTIfcDRVUazYYZsu4uHzPMi47VkKWpew/4oyz9BHg
         8q+SbVugpeAWCP5yM4+qmZKg4eLpBDePCpyW98TZOG418QlZ5v3lp6czgYka2rq0fsLE
         WuHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705039422; x=1705644222;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ywmI/tG6PGjLugPlncHNh/C8Y7NuXCRr0z+zVLWGR40=;
        b=ASVNOMAYzI47pvyl5xYak68c88FyLCUmpy7ZRqqavuvZkOcQcpXMm1QvzyphPko+q0
         cEZm+eyT+rr36LulHCluSUre2tVEdGcq8PK+fDBQGCbSpkdzZMViNe8BRhdK/934HImF
         IEE6jGCaoRN+WUxz2Vyx08cas9mAGvv+9kfFISLHaXdSV9N2jbr3R5qseKoXAM0rbVA2
         Qae2VKJR8XD8ohaRqVbO/z2lWSUQeKDkUF77jzJYPr5o6y+nfkhBG5hOHHOJHXQ/SFb3
         +lH7htlBjd8VWtLgjqaG6CFDSqwgnxDMYAYCY1NgYaDbAB6njGSjVSrdB5RX2uFZygzI
         Ln4Q==
X-Gm-Message-State: AOJu0Yxh/DwhiBZiJ4VBQxrWiG9VEb910F3VsR9b7IDLPIrYADi5JLHv
	I88pKvPNFCZ60rzbiRNE82ibl7VNFMH45rj0sEw92kJ3KtE=
X-Google-Smtp-Source: AGHT+IFkScJg/CAdcptAYmzfUO0QdYfAmuv2l9yWUHfX4Sr+Eu+IfngBH7WsodOy3Znh6EhVcpYtdg==
X-Received: by 2002:a05:600c:42c1:b0:40e:52c3:47f9 with SMTP id j1-20020a05600c42c100b0040e52c347f9mr438260wme.67.1705039421699;
        Thu, 11 Jan 2024 22:03:41 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id d14-20020a05600c34ce00b0040e60c00d2csm4340165wmq.12.2024.01.11.22.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 22:03:41 -0800 (PST)
Date: Fri, 12 Jan 2024 09:03:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 34/36] drivers/media/i2c/ov2740.c:947
 ov2740_enable_streams() warn: missing unwind goto?
Message-ID: <b2fca27d-9e2f-4d4e-a6c7-06a35befe4c2@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   77a04fb9d17b29287728b8fe1da7a196b3364e44
commit: 575405277b30f2459e65cd2a1e6176f34d2440b3 [34/36] media: ov2740: Switch to {enable,disable}_streams
config: i386-randconfig-141-20240111 (https://download.01.org/0day-ci/archive/20240111/202401112346.2nUZ8Jyd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202401112346.2nUZ8Jyd-lkp@intel.com/

smatch warnings:
drivers/media/i2c/ov2740.c:947 ov2740_enable_streams() warn: missing unwind goto?

vim +947 drivers/media/i2c/ov2740.c

575405277b30f2 Sakari Ailus    2023-10-03  922  static int ov2740_enable_streams(struct v4l2_subdev *sd,
575405277b30f2 Sakari Ailus    2023-10-03  923  				 struct v4l2_subdev_state *state, u32 pad,
575405277b30f2 Sakari Ailus    2023-10-03  924  				 u64 streams_mask)
866edc895171f1 Bingbu Cao      2020-05-11  925  {
575405277b30f2 Sakari Ailus    2023-10-03  926  	struct i2c_client *client = v4l2_get_subdevdata(sd);
575405277b30f2 Sakari Ailus    2023-10-03  927  	struct ov2740 *ov2740 = to_ov2740(sd);
866edc895171f1 Bingbu Cao      2020-05-11  928  	const struct ov2740_reg_list *reg_list;
866edc895171f1 Bingbu Cao      2020-05-11  929  	int link_freq_index;
3b0d0f33795403 Andy Shevchenko 2022-07-26  930  	int ret;
866edc895171f1 Bingbu Cao      2020-05-11  931  
575405277b30f2 Sakari Ailus    2023-10-03  932  	ret = pm_runtime_resume_and_get(&client->dev);
575405277b30f2 Sakari Ailus    2023-10-03  933  	if (ret < 0)
575405277b30f2 Sakari Ailus    2023-10-03  934  		return ret;
575405277b30f2 Sakari Ailus    2023-10-03  935  
ada2c4f54d0ae9 Bingbu Cao      2021-12-15  936  	ret = ov2740_identify_module(ov2740);
ada2c4f54d0ae9 Bingbu Cao      2021-12-15  937  	if (ret)
575405277b30f2 Sakari Ailus    2023-10-03  938  		goto out_pm_put;
ada2c4f54d0ae9 Bingbu Cao      2021-12-15  939  
39cc0f20d1bc2b Andy Shevchenko 2022-07-26  940  	if (ov2740->nvm)
39cc0f20d1bc2b Andy Shevchenko 2022-07-26  941  		ov2740_load_otp_data(ov2740->nvm);
5e6fd339b68df8 Bingbu Cao      2020-11-13  942  
efff0a80bc66dc Hans de Goede   2023-12-04  943  	/* Reset the sensor */
efff0a80bc66dc Hans de Goede   2023-12-04  944  	ret = ov2740_write_reg(ov2740, 0x0103, 1, 0x01);
efff0a80bc66dc Hans de Goede   2023-12-04  945  	if (ret) {
efff0a80bc66dc Hans de Goede   2023-12-04  946  		dev_err(&client->dev, "failed to reset\n");
efff0a80bc66dc Hans de Goede   2023-12-04 @947  		return ret;

goto out_pm_put;?

efff0a80bc66dc Hans de Goede   2023-12-04  948  	}
efff0a80bc66dc Hans de Goede   2023-12-04  949  
efff0a80bc66dc Hans de Goede   2023-12-04  950  	usleep_range(10000, 15000);
efff0a80bc66dc Hans de Goede   2023-12-04  951  
866edc895171f1 Bingbu Cao      2020-05-11  952  	link_freq_index = ov2740->cur_mode->link_freq_index;
866edc895171f1 Bingbu Cao      2020-05-11  953  	reg_list = &link_freq_configs[link_freq_index].reg_list;
866edc895171f1 Bingbu Cao      2020-05-11  954  	ret = ov2740_write_reg_list(ov2740, reg_list);
866edc895171f1 Bingbu Cao      2020-05-11  955  	if (ret) {
6919695f0616e2 Andy Shevchenko 2022-07-26  956  		dev_err(&client->dev, "failed to set plls\n");
575405277b30f2 Sakari Ailus    2023-10-03  957  		goto out_pm_put;
866edc895171f1 Bingbu Cao      2020-05-11  958  	}
866edc895171f1 Bingbu Cao      2020-05-11  959  
866edc895171f1 Bingbu Cao      2020-05-11  960  	reg_list = &ov2740->cur_mode->reg_list;
866edc895171f1 Bingbu Cao      2020-05-11  961  	ret = ov2740_write_reg_list(ov2740, reg_list);
866edc895171f1 Bingbu Cao      2020-05-11  962  	if (ret) {
6919695f0616e2 Andy Shevchenko 2022-07-26  963  		dev_err(&client->dev, "failed to set mode\n");
575405277b30f2 Sakari Ailus    2023-10-03  964  		goto out_pm_put;
866edc895171f1 Bingbu Cao      2020-05-11  965  	}
866edc895171f1 Bingbu Cao      2020-05-11  966  
866edc895171f1 Bingbu Cao      2020-05-11  967  	ret = __v4l2_ctrl_handler_setup(ov2740->sd.ctrl_handler);
866edc895171f1 Bingbu Cao      2020-05-11  968  	if (ret)
575405277b30f2 Sakari Ailus    2023-10-03  969  		goto out_pm_put;
866edc895171f1 Bingbu Cao      2020-05-11  970  
866edc895171f1 Bingbu Cao      2020-05-11  971  	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
866edc895171f1 Bingbu Cao      2020-05-11  972  			       OV2740_MODE_STREAMING);
575405277b30f2 Sakari Ailus    2023-10-03  973  	if (ret) {
6919695f0616e2 Andy Shevchenko 2022-07-26  974  		dev_err(&client->dev, "failed to start streaming\n");
575405277b30f2 Sakari Ailus    2023-10-03  975  		goto out_pm_put;
866edc895171f1 Bingbu Cao      2020-05-11  976  	}
866edc895171f1 Bingbu Cao      2020-05-11  977  
575405277b30f2 Sakari Ailus    2023-10-03  978  	return 0;
575405277b30f2 Sakari Ailus    2023-10-03  979  
575405277b30f2 Sakari Ailus    2023-10-03  980  out_pm_put:
575405277b30f2 Sakari Ailus    2023-10-03  981  	pm_runtime_put_noidle(&client->dev);
866edc895171f1 Bingbu Cao      2020-05-11  982  
575405277b30f2 Sakari Ailus    2023-10-03  983  	return ret;
866edc895171f1 Bingbu Cao      2020-05-11  984  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


