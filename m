Return-Path: <linux-media+bounces-781-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C64CF7F4431
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 11:43:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D47AB21093
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 10:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED4F52511E;
	Wed, 22 Nov 2023 10:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IwTq2dcz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C8D0110
	for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 02:43:41 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3316a4bc37dso3448239f8f.2
        for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 02:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700649820; x=1701254620; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RxvYEiAdK16hEUnfnJJGpW9bKts3DPTjhH3GkFHM2Cc=;
        b=IwTq2dczAN+R0LMrB5fzJDFtr3VSHl4PUfLGEG0GhaJpPRK+3c3tM94q+ORw2OL9tr
         0uyvXFO9OYLDJQH6hO990ohLkxuRNneXNhOoLY4+BCyclfHfQIAv1Xz5ofkRv1o8EQsj
         AtZK1sSY99UfzlO4bF3F0bdfxrl2uhr9gHAdvnZmnVN6hkKexh7wqTCsexS/69FyIgzx
         k4q/iY+rNTVNQFfMdGSOH9WXxuYRroGRpjcvtQ4YQOfwXLE3DVCTdRYgxjOeoq6v7+9Y
         wS7WYz441iZl0dQpqrzFaocYiooaYUaKOVAB1HAa9jHPkTThfP8WSI1E+5NYuM3lTDxT
         d/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700649820; x=1701254620;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RxvYEiAdK16hEUnfnJJGpW9bKts3DPTjhH3GkFHM2Cc=;
        b=nQGsn2RXTKyhFCeKOU+US75b4uF9kUbLL2cG7jHyvpEKRXl6OJQu7pY1kK7JzP6oEA
         3wgMb+pq60NFQKMZclQw13DbNVZn/lXFOL9I6sEXuhGFC3wyIOISPxP6Sh6AukFsUiLw
         r7Ha8b2GArxpd8vLyYEv+T2AZWTIu32Liu6bG6PLZm95KRCjawev+lB/nl7/OnnZf1j/
         bMQoS8bXO5p4ydzmcEDtoHtKEmEyzP4ZNkHZdcnS2MnYODYEQ8ulyQVgNI0y0SST8SsM
         YdoA/+8+ciJcodnigoxxvTo0+Ui3eVub4U0wCZ22Wah7gsXAv1fRBnvd/TjfVVojFvph
         BEqg==
X-Gm-Message-State: AOJu0YxELUY7PRpRQWmispdnidmUz9Cbt/qYWo84Yi8o2EQ9Wpr0l9pR
	MRzGUgrd9kU4dobgmnodSqpkDw==
X-Google-Smtp-Source: AGHT+IEDZxTP8EA5UdKKS6Vae+fmnJaRF9SBb9RgsfEGdz5fZObyG7C0joEJetvcV0BPBtBITg6AdA==
X-Received: by 2002:a5d:6d8c:0:b0:332:c5f8:a082 with SMTP id l12-20020a5d6d8c000000b00332c5f8a082mr1469372wrs.13.1700649820030;
        Wed, 22 Nov 2023 02:43:40 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t16-20020adff610000000b0032da4c98ab2sm16796346wrp.35.2023.11.22.02.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 02:43:39 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 Nov 2023 05:43:37 -0500
To: oe-kbuild@lists.linux.dev, Mehdi Djait <mehdi.djait@bootlin.com>,
	mchehab@kernel.org, heiko@sntech.de, hverkuil-cisco@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	conor+dt@kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	alexandre.belloni@bootlin.com, maxime.chevallier@bootlin.com,
	paul.kocialkowski@bootlin.com,
	Mehdi Djait <mehdi.djait@bootlin.com>
Subject: Re: [PATCH v9 3/3] media: i2c: Introduce a driver for the Techwell
 TW9900 decoder
Message-ID: <f39cdd12-4be4-4a9b-9ec6-3704c84e12da@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc65a89e7803782a75bf663158e031356ef7cb1a.1700235276.git.mehdi.djait@bootlin.com>

Hi Mehdi,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mehdi-Djait/dt-bindings-vendor-prefixes-Add-techwell-vendor-prefix/20231117-234411
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/dc65a89e7803782a75bf663158e031356ef7cb1a.1700235276.git.mehdi.djait%40bootlin.com
patch subject: [PATCH v9 3/3] media: i2c: Introduce a driver for the Techwell TW9900 decoder
config: powerpc-randconfig-r071-20231122 (https://download.01.org/0day-ci/archive/20231122/202311221134.0i9KavRs-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231122/202311221134.0i9KavRs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311221134.0i9KavRs-lkp@intel.com/

New smatch warnings:
drivers/media/i2c/tw9900.c:628 tw9900_runtime_resume() warn: inconsistent returns '&tw9900->mutex'.

Old smatch warnings:
drivers/media/i2c/tw9900.c:348 tw9900_s_std() error: uninitialized symbol 'mode'.

vim +628 drivers/media/i2c/tw9900.c

cf24af11e0a74c Mehdi Djait 2023-11-17  597  static int tw9900_runtime_resume(struct device *dev)
cf24af11e0a74c Mehdi Djait 2023-11-17  598  {
cf24af11e0a74c Mehdi Djait 2023-11-17  599  	struct i2c_client *client = to_i2c_client(dev);
cf24af11e0a74c Mehdi Djait 2023-11-17  600  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
cf24af11e0a74c Mehdi Djait 2023-11-17  601  	struct tw9900 *tw9900 = to_tw9900(sd);
cf24af11e0a74c Mehdi Djait 2023-11-17  602  	int ret;
cf24af11e0a74c Mehdi Djait 2023-11-17  603  
cf24af11e0a74c Mehdi Djait 2023-11-17  604  	mutex_lock(&tw9900->mutex);
cf24af11e0a74c Mehdi Djait 2023-11-17  605  
cf24af11e0a74c Mehdi Djait 2023-11-17  606  	if (tw9900->reset_gpio)
cf24af11e0a74c Mehdi Djait 2023-11-17  607  		gpiod_set_value_cansleep(tw9900->reset_gpio, 1);
cf24af11e0a74c Mehdi Djait 2023-11-17  608  
cf24af11e0a74c Mehdi Djait 2023-11-17  609  	ret = regulator_enable(tw9900->regulator);
cf24af11e0a74c Mehdi Djait 2023-11-17  610  	if (ret < 0)
cf24af11e0a74c Mehdi Djait 2023-11-17  611  		return ret;

mutex_unlock(&tw9900->mutex) before returning.

cf24af11e0a74c Mehdi Djait 2023-11-17  612  
cf24af11e0a74c Mehdi Djait 2023-11-17  613  	usleep_range(50000, 52000);
cf24af11e0a74c Mehdi Djait 2023-11-17  614  
cf24af11e0a74c Mehdi Djait 2023-11-17  615  	if (tw9900->reset_gpio)
cf24af11e0a74c Mehdi Djait 2023-11-17  616  		gpiod_set_value_cansleep(tw9900->reset_gpio, 0);
cf24af11e0a74c Mehdi Djait 2023-11-17  617  
cf24af11e0a74c Mehdi Djait 2023-11-17  618  	usleep_range(1000, 2000);
cf24af11e0a74c Mehdi Djait 2023-11-17  619  
cf24af11e0a74c Mehdi Djait 2023-11-17  620  	ret = tw9900_write_array(tw9900->client, tw9900_init_regs,
cf24af11e0a74c Mehdi Djait 2023-11-17  621  				 ARRAY_SIZE(tw9900_init_regs));
cf24af11e0a74c Mehdi Djait 2023-11-17  622  
cf24af11e0a74c Mehdi Djait 2023-11-17  623  	mutex_unlock(&tw9900->mutex);
cf24af11e0a74c Mehdi Djait 2023-11-17  624  
cf24af11e0a74c Mehdi Djait 2023-11-17  625  	/* This sleep is needed for the Horizontal Sync PLL to lock. */
cf24af11e0a74c Mehdi Djait 2023-11-17  626  	msleep(300);
cf24af11e0a74c Mehdi Djait 2023-11-17  627  
cf24af11e0a74c Mehdi Djait 2023-11-17 @628  	return ret;
cf24af11e0a74c Mehdi Djait 2023-11-17  629  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


