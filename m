Return-Path: <linux-media+bounces-28178-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C69A60A2E
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 08:42:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E57117FA82
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 07:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F3E718A6D2;
	Fri, 14 Mar 2025 07:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OzIvzIb0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7961898ED
	for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 07:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741938129; cv=none; b=c3oR8lqgYUdsNM3hFqWR/TQEUUdnYmC72iJNvB/65S0EfuZR8ygWqe6puQVCOQSrCXeAGKOBGar4kpG4MMqU4I72du59SM+gNVcu8zl3Sq3e8HoRK/0s5Un0Td2YosUyBvZtFdWUD8nBa18skq94AistK1CPnZfPMBnFbuTBZpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741938129; c=relaxed/simple;
	bh=TFKMPnY7DyEVxOFjIJ3Z/VwODwE5uOu6Wfsj5MAkP4o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=WejD2/F4VjzMi7cx0jOw4wONzT61sPrZskMTdn4yZAk8trRJi80m1BRpL2DEIOkWTdJ9/zT+Pgp7ShPsDL4KTIf5u6oCVOH2xiAPsCYQJgmieL0Io9HDaVYeQ0e6TJEGZq2Wi9agB6tridQqsU9tLkAjv94ESr/S9NheiEK4uAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OzIvzIb0; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3913958ebf2so1394005f8f.3
        for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 00:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741938126; x=1742542926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5VICj1mgoxCCVFexS9kMcpPesi2AHSs3Nxw6/os/EPE=;
        b=OzIvzIb0KYFmvWdXuhgW4qaB2KVhEg4YZTTGMebrWrmvLzOYL2OU9/eK4CxZQfeGBJ
         W/sHKrL5ppQuHkxEZPB5mbhggggCqbxu/ze2Zv4LNG7YVylU7AOBBwP0+MvoCB77w/u3
         oPQUB50IL0jwtVXWt8z4nJ5vX84G5+6cPMK2uOubW1RZk0W9Rh4ay97iiloHF+6Citf2
         Xkk95S4iFR21ZyhzlOjUBlcTjjyfezNoRQ41x/eGCIKRbT9J0c9UT1lpeCrJJ+zwrGNc
         Ret2TlTUkMWFrTxtXrBPfBhttPUH159Rar8zAu0KZTbAQwTZBMJdv4SQAI9EnKlWApwf
         nTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741938126; x=1742542926;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5VICj1mgoxCCVFexS9kMcpPesi2AHSs3Nxw6/os/EPE=;
        b=eb9gFu9e9DEOISc/AzhYC7R81UXm9svK9czrfGepAF1/00gfXjHrTQu37Hqxf5y778
         55zOVS2C+lmnpyc3iF3To+ESX49lfK3ou6yrGf4ZgWmsSJKffvTFDw2D7v7v1nEW+uOv
         S3xAJ1chT+/QgRJ61q7W0ZM0tDMoeq8997LTWTSmD9npjmT5LvBMTi/ZnG+tVWkYj6pS
         4w1j7CAevMZRrQYxfNl6whiIXArl5G0U4cGdPpWw9mODt9AOgsEk1OXDkoRLvXn74p+M
         GoDXio56ss8qyOizYKXNYKMzkGLGIyLniMNXVjyQAeaEzK0ZahAM2JOb7KodJ4Vw8iDC
         5QMg==
X-Forwarded-Encrypted: i=1; AJvYcCWb5MznIHLk8h+mJJbnliHLthUxqT3JPvvDVFeISiH9vcwq5pziDylCdjOi/rlc8tOSalRV5vegut5o8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6p/ZILIbdSdsrYKbLRgy1Ux6oFCIDReirU0BBlISvsHT5O0/q
	5m+Z/wO1sUxLldLhsnK6CBExVcsVBNFjJ3Xscr7dHrMJIyGCrZyAAKouzr9zkEk=
X-Gm-Gg: ASbGncvNLZ4WCNcUUt4IWYgjjC3BTXM9xF+3tkEAEXZXfvs4iMY0aQeBFyNkVSvCP7j
	cjTvfIBmFafNLYDA/s2uOW4q/W40JW5KNUmoaLycloBN2LFVrkkKNmLLavxuIngUezMMCpt8yHI
	zg6x7A/2FBlAIDUfojt4UCLEhWN4E0jM+1c9TQDpe9fnEnlgQ8Hs1b4udMZJQLkYH8LLOKgnFtn
	8ETSYxXr8ViJ/zcctYPgc6lYBoOGeHDnk9n9PfMp2hJavmijxvHlVH9+13DBzJr8LZzqlpFgeWt
	zWTDSGNj1NmAbeMv8gq4uwinZLZMo6mUSRwgCClU+mKL+ALhm+Acmtf9Vk8s
X-Google-Smtp-Source: AGHT+IFm7E17nEcoSOxY7Tw6+e0xDZ8rnIFbb6oMH7ZJtR8SbLPv6jsqnXgR/epND77bkL5mfCoWCw==
X-Received: by 2002:a5d:598b:0:b0:38d:badf:9df5 with SMTP id ffacd0b85a97d-3971d2378a8mr1262317f8f.17.1741938125641;
        Fri, 14 Mar 2025 00:42:05 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-395cb7ebe4bsm4738082f8f.98.2025.03.14.00.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 00:42:05 -0700 (PDT)
Date: Fri, 14 Mar 2025 10:42:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Pratap Nirujogi <pratap.nirujogi@amd.com>,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
	dave.stevenson@raspberrypi.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.chan@amd.com, Pratap Nirujogi <pratap.nirujogi@amd.com>
Subject: Re: [PATCH] media: i2c: Add OV05C camera sensor driver
Message-ID: <237cb63f-6cfa-4a66-8bc7-21cf48c8e760@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228165317.3468075-1-pratap.nirujogi@amd.com>

Hi Pratap,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pratap-Nirujogi/media-i2c-Add-OV05C-camera-sensor-driver/20250301-005638
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250228165317.3468075-1-pratap.nirujogi%40amd.com
patch subject: [PATCH] media: i2c: Add OV05C camera sensor driver
config: arm64-randconfig-r071-20250312 (https://download.01.org/0day-ci/archive/20250314/202503140559.3mp2n2oI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503140559.3mp2n2oI-lkp@intel.com/

smatch warnings:
drivers/media/i2c/ov05c.c:936 ov05c_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +936 drivers/media/i2c/ov05c.c

6da03431f4f1e18 Pratap Nirujogi 2025-02-28  922  static int ov05c_probe(struct i2c_client *client)
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  923  {
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  924  	struct ov05c *ov05c;
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  925  	int i, ret;
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  926  
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  927  	ov05c = devm_kzalloc(&client->dev, sizeof(*ov05c), GFP_KERNEL);
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  928  	if (!ov05c)
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  929  		return -ENOMEM;
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  930  
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  931  	client->dev.init_name = DRV_NAME;
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  932  
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  933  	/* create sensor enable gpio control */
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  934  	ov05c->enable_gpio = devm_gpiod_get(&client->dev, "sensor0_enable", GPIOD_OUT_LOW);
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  935  	if (IS_ERR_OR_NULL(ov05c->enable_gpio))
6da03431f4f1e18 Pratap Nirujogi 2025-02-28 @936  		return PTR_ERR(ov05c->enable_gpio);

If devm_gpiod_get() returns NULL then we'd return success, but actually
devm_gpiod_get() can't return NULL.  Only error pointers.

6da03431f4f1e18 Pratap Nirujogi 2025-02-28  937  
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  938  	/* Initialize subdev */
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  939  	v4l2_i2c_subdev_init(&ov05c->sd, client, &ov05c_subdev_ops);
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  940  
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  941  	/* Initialize CCI */
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  942  	ov05c->regmap = devm_cci_regmap_init_i2c(client, 8);
6da03431f4f1e18 Pratap Nirujogi 2025-02-28  943  	if (IS_ERR(ov05c->regmap)) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


