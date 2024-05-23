Return-Path: <linux-media+bounces-11821-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C55D8CD360
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 15:14:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE8FDB21D42
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 13:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFADD14A4C1;
	Thu, 23 May 2024 13:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J1OLqoEL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BF413D2BD
	for <linux-media@vger.kernel.org>; Thu, 23 May 2024 13:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716470087; cv=none; b=YhGCyq+HLT2DK0ZXlS4KRH9zcqGNeYWbMy8QPYO9tPxTQfPAurzlUEXdX8aluKdMfF7IM3txry2Vf5bV/4Hvq7eMPXJZFBgIRCH/H0C27zrjOslEQVrsuGDMLE8ESE5o16Rj8hw8P88mkgtx2FZjMzKZPnoVwnxUcWiNQqd/xWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716470087; c=relaxed/simple;
	bh=nK1mhMR5sp2HGvlXVhonM9F6WZxXA/qiREN8Rf6H+4k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Vcy9n/6aLe18O4ZzWqzc6TvcBs1PeMKj/LMevQ3F+m8mRo1Wi4wKO0pLiw0fHsuTp2OT43+y87vhLnbRjgu06Maub7Dqomp+SCx5x3cVMdsOVr/fD6meprsTZHnj2y+FPz+NxHFMvd3HGiZrA/+oxRLaZRm6E8zKHe2l8O3zrrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J1OLqoEL; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-34d8d11a523so4252798f8f.2
        for <linux-media@vger.kernel.org>; Thu, 23 May 2024 06:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716470083; x=1717074883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SWD7CtUtkqXIzQoWrQh8FoeaevQYrYwYHAnr/5q6xaI=;
        b=J1OLqoEL6rdUGTznb1D3d0WKNa5feoaEwmijVZ+aSTKYewHVbLdDLMYH/XV83LkQBZ
         7OpbUVEs/nG0TcmsqgF/6+IqYf0cMtXRj4Eu4AxVkSkmO77trRrbP7fuANX8ZdhFF39k
         VtF8lCbw2Ai6wuCBiMxfW3bGZ0qYsYnNUb1v97bZC1070E36+S6RpCqCIOjdSy32wTdF
         J2LPUvdeohCAmBYeC1szHqgGJ5wOBxa8ebJU/hwvCgv/h0zDwznqKA+q9YvQ7RpbjU0i
         BpBQDASRWZ7UYEpR0pr3ypSszwW8d1Kt1zWQ3EcpuIbYF+v0JY+iaTj08HznYZFssaSL
         6kPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716470083; x=1717074883;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SWD7CtUtkqXIzQoWrQh8FoeaevQYrYwYHAnr/5q6xaI=;
        b=nCTYW/S0f/ixtnAxGV9ngEJK7r//FvSetu8Q+Ncdxt2Y+yrxAAfT9YSuoe6E3IsIxN
         1HDTQb4yJbatI5TycrLKONDpWnUwYGiYN70JE0lHHXcMKb3cZzuOJvkqbaNq/x9602Tv
         9jTmp32MvlIt7JMzaUx1mSQCTy25M6ysGE4/VNejRsLpTwdv2I8PQOTSbWhe5NmqUvKh
         3s9uBl1PZNIqIYHxQVkIU79R9WPySKY0droePYCuw/Cx7FhZJjcfKr3IYNf0PgJgXQEz
         RA0Dl0Lwb5NtRnd09IuC3Tl8i6c5yetodoJsfZ5SlFsOEFtnSo2mXfiW4XIAsQIWvaUW
         eBuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaauBsos0cOQhSK2zPTYoVIs459Ok1e6vUqi/d8iW7ntuKo9AhRk3+rFD+IYMK5KzbuyorzDHWvUAT2W0cAUsnq5MF6rZ5+UEvKfk=
X-Gm-Message-State: AOJu0YwfDF+skSbz8vZoD6tt1NETM1V+0CchJvjhs3tTm+fZM8AaKv16
	d72Qz/KarE9CRplvfMznuVcHMOYkDDfEZyakojww52Hl5EJzLOJ2vAAMPBoTgXw=
X-Google-Smtp-Source: AGHT+IFNQhgHCdHm4dC36MCqGkdYxgUj5wdX9du2Ncve17vPZJB8anwVgsBR/V0kkOoTM/uM20yPew==
X-Received: by 2002:adf:ec07:0:b0:354:f24f:aa4b with SMTP id ffacd0b85a97d-354f24fab45mr2710505f8f.3.1716470082525;
        Thu, 23 May 2024 06:14:42 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502baad037sm36523640f8f.71.2024.05.23.06.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 06:14:41 -0700 (PDT)
Date: Thu, 23 May 2024 16:14:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Volodymyr Kharuk <vkh@melexis.com>,
	linux-media@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Andrii Kyselov <ays@melexis.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Volodymyr Kharuk <vkh@melexis.com>
Subject: Re: [PATCH v6 10/10] media: i2c: Add driver for mlx7502x ToF sensor
Message-ID: <5a14400e-97e6-47a0-bac5-0e4c4db9b8d5@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f666d475da17b3469fd0471531bc615f6fd797a.1715871189.git.vkh@melexis.com>

Hi Volodymyr,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Volodymyr-Kharuk/media-uapi-ctrls-Add-camera-trigger-controls/20240517-004536
base:   8771b7f31b7fff91a998e6afdb60650d4bac59a5
patch link:    https://lore.kernel.org/r/6f666d475da17b3469fd0471531bc615f6fd797a.1715871189.git.vkh%40melexis.com
patch subject: [PATCH v6 10/10] media: i2c: Add driver for mlx7502x ToF sensor
config: mips-randconfig-r071-20240518 (https://download.01.org/0day-ci/archive/20240518/202405181557.HpbDJU4b-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fa9b1be45088dce1e4b602d451f118128b94237b)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202405181557.HpbDJU4b-lkp@intel.com/

smatch warnings:
drivers/media/i2c/mlx7502x.c:664 mlx7502x_runtime_resume() warn: 'sensor->xclk' from clk_prepare_enable() not released on lines: 664.
drivers/media/i2c/mlx7502x.c:1586 mlx7502x_link_freq_init() error: buffer overflow 'link_freq' 6 <= 6 (assuming for loop doesn't break)

vim +664 drivers/media/i2c/mlx7502x.c

93b22d3a235baf Volodymyr Kharuk 2024-05-16  620  static int __maybe_unused mlx7502x_runtime_resume(struct device *dev)
93b22d3a235baf Volodymyr Kharuk 2024-05-16  621  {
93b22d3a235baf Volodymyr Kharuk 2024-05-16  622  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
93b22d3a235baf Volodymyr Kharuk 2024-05-16  623  	struct mlx7502x *sensor = to_mlx7502x(sd);
93b22d3a235baf Volodymyr Kharuk 2024-05-16  624  	int ret;
93b22d3a235baf Volodymyr Kharuk 2024-05-16  625  
93b22d3a235baf Volodymyr Kharuk 2024-05-16  626  	gpiod_set_value_cansleep(sensor->reset, 0);
93b22d3a235baf Volodymyr Kharuk 2024-05-16  627  
93b22d3a235baf Volodymyr Kharuk 2024-05-16  628  	ret = regulator_bulk_enable(MLX7502X_NUM_SUPPLIES, sensor->supplies);
93b22d3a235baf Volodymyr Kharuk 2024-05-16  629  	if (ret) {
93b22d3a235baf Volodymyr Kharuk 2024-05-16  630  		dev_err(sensor->dev, "failed to enable supply: %d\n", ret);
93b22d3a235baf Volodymyr Kharuk 2024-05-16  631  		return ret;
93b22d3a235baf Volodymyr Kharuk 2024-05-16  632  	}
93b22d3a235baf Volodymyr Kharuk 2024-05-16  633  
93b22d3a235baf Volodymyr Kharuk 2024-05-16  634  	ret = clk_prepare_enable(sensor->xclk);
                                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

93b22d3a235baf Volodymyr Kharuk 2024-05-16  635  	if (ret) {
93b22d3a235baf Volodymyr Kharuk 2024-05-16  636  		dev_err(sensor->dev, "failed to enable external clock: %d\n",
93b22d3a235baf Volodymyr Kharuk 2024-05-16  637  			ret);
93b22d3a235baf Volodymyr Kharuk 2024-05-16  638  		goto fail_clk;
93b22d3a235baf Volodymyr Kharuk 2024-05-16  639  	}
93b22d3a235baf Volodymyr Kharuk 2024-05-16  640  
93b22d3a235baf Volodymyr Kharuk 2024-05-16  641  	gpiod_set_value_cansleep(sensor->reset, 1);
93b22d3a235baf Volodymyr Kharuk 2024-05-16  642  	msleep(MLX7502X_RESET_DELAY_MS);
93b22d3a235baf Volodymyr Kharuk 2024-05-16  643  
93b22d3a235baf Volodymyr Kharuk 2024-05-16  644  	dev_dbg(sensor->dev, "power on\n");
93b22d3a235baf Volodymyr Kharuk 2024-05-16  645  
93b22d3a235baf Volodymyr Kharuk 2024-05-16  646  	ret = mlx7502x_write_regval(sd, mlx7502x_common_init_cfg,
93b22d3a235baf Volodymyr Kharuk 2024-05-16  647  				    ARRAY_SIZE(mlx7502x_common_init_cfg));
93b22d3a235baf Volodymyr Kharuk 2024-05-16  648  	if (ret < 0) {
93b22d3a235baf Volodymyr Kharuk 2024-05-16  649  		dev_err(sensor->dev, "failed to write init_cfg\n");
93b22d3a235baf Volodymyr Kharuk 2024-05-16  650  		goto fail_clk;

Don't we need to disable the xclk on this path?

93b22d3a235baf Volodymyr Kharuk 2024-05-16  651  	}
93b22d3a235baf Volodymyr Kharuk 2024-05-16  652  
93b22d3a235baf Volodymyr Kharuk 2024-05-16  653  	ret = mlx7502x_write_regval(sd, sensor->cur_desc->init_cfg,
93b22d3a235baf Volodymyr Kharuk 2024-05-16  654  				    sensor->cur_desc->init_cfg_size);
93b22d3a235baf Volodymyr Kharuk 2024-05-16  655  	if (ret < 0) {
93b22d3a235baf Volodymyr Kharuk 2024-05-16  656  		dev_err(sensor->dev, "failed to write sensor specific init_cfg\n");
93b22d3a235baf Volodymyr Kharuk 2024-05-16  657  		goto fail_clk;

And here.

93b22d3a235baf Volodymyr Kharuk 2024-05-16  658  	}
93b22d3a235baf Volodymyr Kharuk 2024-05-16  659  
93b22d3a235baf Volodymyr Kharuk 2024-05-16  660  	return 0;
93b22d3a235baf Volodymyr Kharuk 2024-05-16  661  
93b22d3a235baf Volodymyr Kharuk 2024-05-16  662  fail_clk:
93b22d3a235baf Volodymyr Kharuk 2024-05-16  663  	regulator_bulk_disable(MLX7502X_NUM_SUPPLIES, sensor->supplies);
93b22d3a235baf Volodymyr Kharuk 2024-05-16 @664  	return ret;
93b22d3a235baf Volodymyr Kharuk 2024-05-16  665  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


