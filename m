Return-Path: <linux-media+bounces-33248-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 089EBAC20C1
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 12:18:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A4681B6575B
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 10:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D29227B81;
	Fri, 23 May 2025 10:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="COkUbin6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C38225A47
	for <linux-media@vger.kernel.org>; Fri, 23 May 2025 10:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747995474; cv=none; b=NmE+Ni3ARiHFGk6IZSPEfOSD8z4pZrAZY/slAkJzblw9gLRN71nHDtptrJj5NlKLw5Pi1YmET+e5QRaR4iB/7KpXdlMPhYngLHWiJDhCx9iQ3z7+WaKc1LwprI1HTfFnF5JpddwPfZbED8nViBIEnmrVa0P3a6R5SYEoyhb0DdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747995474; c=relaxed/simple;
	bh=WS5Em/6Rn7/RETr7HbwL/7SvuWdK27Vl0KXmMThSYJk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=fZjt5YAdES92O2wwfx8A1kXxjDr3ztjO2rLbb3/tluFtPzkOH/rhB572Y4QQYx3bOt68cKwXseGW8E2tUC0nOXO/rYm6FokSHBjiYIKWMnGfMkvs/E/nE/R2p1RrYNh/WgFG2QcmuhLSXppZFeCuFqTVQT/EwcCZr1dyVC10K5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=COkUbin6; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-442eb5d143eso90734995e9.0
        for <linux-media@vger.kernel.org>; Fri, 23 May 2025 03:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747995471; x=1748600271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0JQxHOavWRYTHCuVw/pPJKDeceEg1P8xmDfVg3kuIMY=;
        b=COkUbin6J6w6ia5ul8e2hGzS7sV7X38nSeajEA4DaOVJImsjEfX/nveV76ormPjriE
         QO9cXNEVskd/GS2FYVBQCaQbYKjlEMYDfwm9IqrnesGkq17tthoTLEvdNvdyGkj8y4Oc
         TQg4gGENoX/LhdV0CcmPWHtI0gz3GZmbSZoLYY6yAy2hYIeDRpGiPI3Y6c6R4D5UIZNr
         /l86dyzxBBuHggfsXLdJACLfYNoDiVemCNzymjFEDGHzxrnV6Ey6TK5HKvEa/dm/nHmp
         /uhusSPJ8y+6pB3ORuw+ensY/sF/KGnHAmj943pC5woMjd27z8und2WdJGlUUy3oE7+K
         6rYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747995471; x=1748600271;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0JQxHOavWRYTHCuVw/pPJKDeceEg1P8xmDfVg3kuIMY=;
        b=iVNqjCvBGKRzVl8Ym9O4kusb+KiN/Xgk3PPGC9Q5Q5vBFqoCTcOv4U////ZEVhpE/X
         XJMt3HonamwrqxKCDgkV+MyzLsGYdqHZGA3OErJpdClg8cGWATj/OZ3aWbav4AU0uweP
         UJ7oLvlweoCMNjs4zVKve7GLUcLCJdTRTYpgoDkeR1BmjQEpNOSz0nepSFdgvKj1UmNE
         LmOkHesiWNMfeoL6ibP9Vc8zbsKBwXYzfduAofBFpN3XhLpw9/bz/RfSfE3T1bSjIJmA
         03dP2Daf7ZLxfv6bSd8wzG/XyxRvs89jIxCbcQStrs0MNaV87hrIq9HoWmQragP8x+XQ
         v3Ug==
X-Forwarded-Encrypted: i=1; AJvYcCXWidKigTW7wcCPR1J18SbJQse8v3JssfQADiibTrWPvuxKC7+AuX/rnBpgWhU5I8dscdSYCeReE6lwEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXb/Xd+6Ie7t2HAWHQ/ux6qNw6991LilahWpGEBLf+Tz32kggX
	Vz7qj+3dmVbU5dIbOuGXC9F+J9cXtKv94MrRMWyAPOcxP8QZOs+AjYPrkTYcbFyalc/G3wCdwui
	6L6Xk
X-Gm-Gg: ASbGncvZtsXgnddQnMCiMGkTa0cyWgNPJypeTeGJ0RayPmsPpEoLHoxnezFIR6zJfXU
	z+/SP0zEslFJSRlnbAu5L4Ay3bZleZ3RPyr+NxGTKfSQLu/C3Eg/HbhtZa5xVO4dBjJResmXqyX
	ePG4D9SeQNCYlRZuTe7RdVH5YEG9zKj5yAA2ahwP03cF36RookxvkvwC+3oGdiImJ3peeogZYEL
	aIV+XjSS3E3mm3gxlinQcoDMx7LvXPKNskqqUM7OUq13pRhp6N7zzWPpLeEmraAPHwSV5eMwvIt
	O35a6PXCG4NGSq5d1/v7/8foh++nXvg5HSpLkrmu5sE5JsD7/1Eta4cnBNFptvcdAS4=
X-Google-Smtp-Source: AGHT+IGBPED3AngN7Xq3k3f1GUZA+Fjf2Y44vIfBT9gi3tMob0OPV6QaRRNpu0BKQtoz7ZkErrF2Tg==
X-Received: by 2002:a05:6000:230a:b0:3a3:7749:9783 with SMTP id ffacd0b85a97d-3a4c23512f6mr1969678f8f.51.1747995470929;
        Fri, 23 May 2025 03:17:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a35ca4d204sm26364129f8f.10.2025.05.23.03.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:17:50 -0700 (PDT)
Date: Fri, 23 May 2025 13:17:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 23/23] media: Move gc0310 sensor drivers to
 drivers/media/i2c/
Message-ID: <202505220651.U5WqBCdF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517114106.43494-24-hdegoede@redhat.com>

Hi Hans,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/media-atomisp-gc0310-Rename-dev-function-variable-to-sensor/20250517-194501
base:   git://linuxtv.org/sailus/media_tree.git master
patch link:    https://lore.kernel.org/r/20250517114106.43494-24-hdegoede%40redhat.com
patch subject: [PATCH 23/23] media: Move gc0310 sensor drivers to drivers/media/i2c/
config: loongarch-randconfig-r073-20250522 (https://download.01.org/0day-ci/archive/20250522/202505220651.U5WqBCdF-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505220651.U5WqBCdF-lkp@intel.com/

New smatch warnings:
drivers/media/i2c/gc0310.c:462 gc0310_enable_streams() warn: pm_runtime_get_sync() also returns 1 on success

vim +462 drivers/media/i2c/gc0310.c

167e50747c4e3a drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  453  static int gc0310_enable_streams(struct v4l2_subdev *sd,
167e50747c4e3a drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  454  				 struct v4l2_subdev_state *state,
167e50747c4e3a drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  455  				 u32 pad, u64 streams_mask)
ad85094b293e40 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Mauro Carvalho Chehab 2020-04-19  456  {
1c468347b52136 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  457  	struct gc0310_device *sensor = to_gc0310_sensor(sd);
ad85094b293e40 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Mauro Carvalho Chehab 2020-04-19  458  	struct i2c_client *client = v4l2_get_subdevdata(sd);
167e50747c4e3a drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  459  	int ret;
ad85094b293e40 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Mauro Carvalho Chehab 2020-04-19  460  
2726c899fb6d57 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  461  	ret = pm_runtime_get_sync(&client->dev);
167e50747c4e3a drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17 @462  	if (ret)

pm_runtime_get_sync() can return 1.  Use pm_runtime_resume_and_get()
instead.

2726c899fb6d57 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  463  		goto error_power_down;
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  464  
a285ed79b23e6f drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  465  	ret = regmap_multi_reg_write(sensor->regmap,
a285ed79b23e6f drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  466  				     gc0310_reset_register,
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  467  				     ARRAY_SIZE(gc0310_reset_register));
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  468  	if (ret)
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  469  		goto error_power_down;
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  470  
a285ed79b23e6f drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  471  	ret = regmap_multi_reg_write(sensor->regmap,
a285ed79b23e6f drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  472  				     gc0310_VGA_30fps,
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  473  				     ARRAY_SIZE(gc0310_VGA_30fps));
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  474  	if (ret)
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  475  		goto error_power_down;
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  476  
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  477  	/* restore value of all ctrls */
1c468347b52136 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  478  	ret = __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  479  
ad85094b293e40 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Mauro Carvalho Chehab 2020-04-19  480  	/* enable per frame MIPI and sensor ctrl reset  */
a285ed79b23e6f drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  481  	cci_write(sensor->regmap, GC0310_RESET_RELATED_REG, 0x30, &ret);
ad85094b293e40 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Mauro Carvalho Chehab 2020-04-19  482  
a285ed79b23e6f drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  483  	cci_write(sensor->regmap, GC0310_RESET_RELATED_REG,
a285ed79b23e6f drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  484  		  GC0310_REGISTER_PAGE_3, &ret);
a285ed79b23e6f drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  485  	cci_write(sensor->regmap, GC0310_SW_STREAM_REG,
167e50747c4e3a drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  486  		  GC0310_START_STREAMING, &ret);
a285ed79b23e6f drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  487  	cci_write(sensor->regmap, GC0310_RESET_RELATED_REG,
a285ed79b23e6f drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  488  		  GC0310_REGISTER_PAGE_0, &ret);
b6763b2247ad43 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  489  
167e50747c4e3a drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  490  error_power_down:
167e50747c4e3a drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  491  	if (ret)
2726c899fb6d57 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  492  		pm_runtime_put(&client->dev);
2b2297b11bb506 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2023-02-05  493  
167e50747c4e3a drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  494  	return ret;
167e50747c4e3a drivers/staging/media/atomisp/i2c/atomisp-gc0310.c Hans de Goede         2025-05-17  495  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


