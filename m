Return-Path: <linux-media+bounces-41119-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BFDB37B5B
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 09:17:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E03E96821DB
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 07:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DCE1315785;
	Wed, 27 Aug 2025 07:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CDFQYj85"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C28B1A9FB8
	for <linux-media@vger.kernel.org>; Wed, 27 Aug 2025 07:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756279056; cv=none; b=WKiAkvdsZtWCbHMHL7Av/IX7ljFTcWCL/m+gsLja9Sc/+Chamwol0Sipug8TdSe90plNmsxCONHToOmO86AcrVcR6j2zKIXpo+yttmluNpItHWFu63rNkBhjddbqr5GBF0WQZ8Ai0ja5ndXY+noNO8XgBraZwPep71YWMD4b+UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756279056; c=relaxed/simple;
	bh=9v1/Yiz2XatZ9K3CI1RsRzz3V8svynxUwod8nUBT+8g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ih/M9QoUkmyVjKV3mzCGAgViwA182zYICW3AvwoQFd1hXrD823/h6ddwkoBc7UezLCKt15xwQlvj2y3UqOygB6pGHNrKTLdodtxnfldvKJM3wKzKwfEiApRtz2xddJI48ZaJy5GJhb+2+15gd4tn7h/gzI5+eTHobhlurws2jDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CDFQYj85; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45b6b5ccad6so3739015e9.2
        for <linux-media@vger.kernel.org>; Wed, 27 Aug 2025 00:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756279052; x=1756883852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7J0+fXrN8m0tdzhsj12TSvDI97zLU1GEJdoqhnHYOfE=;
        b=CDFQYj85KyDjRNWzfeQ0G1wiYM7xhc8yfztIJ/9vH8Y0LW9HaSAygZ7sP97eNxZc3+
         9XdlmdLtHDp/XsfY3/0tfgkkeHWWtIBMqbJzh8Jv13FnaNFlUQrxrPLEPD0SjUtWCVvE
         6Z9kcO6sYBkIcEfTPYeDbs0awK6orHmafpJYyLkgrbC3Yky+kxOPaUHviI8bmbYomHMz
         YP9ADXVwbN6Vr5WrMdR/muAf2zu/9aDAmgdxT/q/XabyK5clqStp2BODZOTpxQAGr2KC
         /B/+dwzAp90xJZP7FLwOlKqgqOA1JrBua0UJ22aQ6TPxjqIlQR5VSNqKXNSew47AiiyN
         /jBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756279052; x=1756883852;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7J0+fXrN8m0tdzhsj12TSvDI97zLU1GEJdoqhnHYOfE=;
        b=ISFXwO5cBSsyf8+VNEMGMvBpVuEdq638mFALfjdWU+NwlGA53RYdJ4uQuy0hdeTDxQ
         Te2AJi7tCQ3xjLH7RTAgFyyHgd3/r5NvuvZIafoWYu21/+lp54zi/Epf/QwyuQ3VBrk7
         WdgeMLdsIykFFkiLCiVqVB7GruPeop3gWfFPfbEnzR0h0QoYX3SSiqeHxznM6kt3rzE3
         o26U471h/WuAonMWkVUm21SkZjlEjLpAAvRF03yhcxEnp/3LpZJsDGIeuM41ptJxxeNY
         dE197TnGmyXOgzZWc1s2rnxkKHsFGMXCqIMPKkAzqQJ5JgGjh99aq6k/Z4og+eY6PbwD
         04EQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/4a9D1KbSJoPqqWtLWiE3Rz610Z5kbc9NUO3SK2NhD27h1CS4/NlcdH2WGqfeca4Oi1+xwzXOp3Xn3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yza5FKJDaYMMJJ/77h32klOy8ybgiP90PidED+hJP7t/dywjjx+
	IDtHMB2mcOOfHYO6v6zVGbkhpt+nGf3X6Q8KipkSVcf/pNMJFePEfcxE1RYvx02TkoUGrpijYn3
	nWuAL
X-Gm-Gg: ASbGncsoZ36h1dinPCTT3NqHw+Ed6ZwoM8PlOZUIlyAs+kIS8Dm2xh4ZjPFyrvBREsm
	6zsiYh8Ueo4C81xh9CqCeKAbV5UZnUFb3HT9eG4fCRY/soVcap345Y9JT/xoYymbPOE+rw8Sy0v
	k2/VysdqLVrBbZCycncz44/j5hsV85j0VaE5LhSYM38AEQDE66TV+te0JOGB2GVJakaIomCRzyf
	T0h6Qx7lC+CIVUrs9D/Aw99M6ai+rgkBBpYO92hlNf/lYeW0XnE3sF0v5x2QD/kHp6da+vJpUn1
	LGLCBwPaq/RWeMtO47U2SnqVocwfm1lKzP62GBzTBlKbFxHYpW+kMXyhmgJpEO/suxK2PveMFZD
	/+n4Sepa9NU6tg7tTFQeN3Xsx5/4=
X-Google-Smtp-Source: AGHT+IHRjbdZNyOMZ7kcnEdKJSQHLtwyvmjAzKkaTVzSUwE7dGmW1v3ZjCd/smhPzXk8kPLh9KAKjA==
X-Received: by 2002:a05:600c:1f95:b0:459:db80:c2ce with SMTP id 5b1f17b1804b1-45b51799428mr138601255e9.7.1756279051526;
        Wed, 27 Aug 2025 00:17:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b6b1cdf05sm14152765e9.1.2025.08.27.00.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 00:17:31 -0700 (PDT)
Date: Wed, 27 Aug 2025 10:17:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [sailus-media-tree:cleanup 30/54] drivers/media/i2c/imx214.c:1109
 imx214_ctrls_init() error: we previously assumed 'imx214->link_freq' could
 be null (see line 1017)
Message-ID: <202508270603.MDqIVFss-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   git://linuxtv.org/sailus/media_tree.git cleanup
head:   9a8e7210e8e21ebba263affd0d7481ef0d6c323e
commit: 7407c0acdb2ff0c1e3a962543db7d775b3b611c8 [30/54] media: i2c: imx214: Move imx214_pll_update to imx214_ctrls_init
config: i386-randconfig-141-20250827 (https://download.01.org/0day-ci/archive/20250827/202508270603.MDqIVFss-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508270603.MDqIVFss-lkp@intel.com/

smatch warnings:
drivers/media/i2c/imx214.c:1109 imx214_ctrls_init() error: we previously assumed 'imx214->link_freq' could be null (see line 1017)

vim +1109 drivers/media/i2c/imx214.c

4f302d004bd0fc André Apitzsch 2023-12-06   987  static int imx214_ctrls_init(struct imx214 *imx214)
4f302d004bd0fc André Apitzsch 2023-12-06   988  {
4f302d004bd0fc André Apitzsch 2023-12-06   989  	static const struct v4l2_area unit_size = {
4f302d004bd0fc André Apitzsch 2023-12-06   990  		.width = 1120,
4f302d004bd0fc André Apitzsch 2023-12-06   991  		.height = 1120,
4f302d004bd0fc André Apitzsch 2023-12-06   992  	};
0b57fcf81d32b8 André Apitzsch 2024-12-20   993  	const struct imx214_mode *mode = &imx214_modes[0];
2ae9f9780d8097 André Apitzsch 2023-12-06   994  	struct v4l2_fwnode_device_properties props;
4f302d004bd0fc André Apitzsch 2023-12-06   995  	struct v4l2_ctrl_handler *ctrl_hdlr;
0b57fcf81d32b8 André Apitzsch 2024-12-20   996  	int exposure_max, exposure_def;
0b57fcf81d32b8 André Apitzsch 2024-12-20   997  	int hblank;
aac37a3a763d1f André Apitzsch 2024-12-20   998  	int i, ret;
4f302d004bd0fc André Apitzsch 2023-12-06   999  
2ae9f9780d8097 André Apitzsch 2023-12-06  1000  	ret = v4l2_fwnode_device_parse(imx214->dev, &props);
2ae9f9780d8097 André Apitzsch 2023-12-06  1001  	if (ret < 0)
2ae9f9780d8097 André Apitzsch 2023-12-06  1002  		return ret;
2ae9f9780d8097 André Apitzsch 2023-12-06  1003  
4f302d004bd0fc André Apitzsch 2023-12-06  1004  	ctrl_hdlr = &imx214->ctrls;
aac37a3a763d1f André Apitzsch 2024-12-20  1005  	ret = v4l2_ctrl_handler_init(&imx214->ctrls, 13);
4f302d004bd0fc André Apitzsch 2023-12-06  1006  	if (ret)
4f302d004bd0fc André Apitzsch 2023-12-06  1007  		return ret;
4f302d004bd0fc André Apitzsch 2023-12-06  1008  
b9b359662952ff André Apitzsch 2025-05-24  1009  	imx214->pixel_rate =
b9b359662952ff André Apitzsch 2025-05-24  1010  		v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_PIXEL_RATE, 1,
b9b359662952ff André Apitzsch 2025-05-24  1011  				  INT_MAX, 1, 1);
4f302d004bd0fc André Apitzsch 2023-12-06  1012  
4f302d004bd0fc André Apitzsch 2023-12-06  1013  	imx214->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, NULL,
4f302d004bd0fc André Apitzsch 2023-12-06  1014  						   V4L2_CID_LINK_FREQ,
b9b359662952ff André Apitzsch 2025-05-24  1015  						   imx214->bus_cfg.nr_of_link_frequencies - 1,
b9b359662952ff André Apitzsch 2025-05-24  1016  						   0, imx214->bus_cfg.link_frequencies);
4f302d004bd0fc André Apitzsch 2023-12-06 @1017  	if (imx214->link_freq)
                                                            ^^^^^^^^^^^^^^^^^
This assumes ->link_freq can be NULL.

4f302d004bd0fc André Apitzsch 2023-12-06  1018  		imx214->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
4f302d004bd0fc André Apitzsch 2023-12-06  1019  
4f302d004bd0fc André Apitzsch 2023-12-06  1020  	/*
4f302d004bd0fc André Apitzsch 2023-12-06  1021  	 * WARNING!
4f302d004bd0fc André Apitzsch 2023-12-06  1022  	 * Values obtained reverse engineering blobs and/or devices.
4f302d004bd0fc André Apitzsch 2023-12-06  1023  	 * Ranges and functionality might be wrong.
4f302d004bd0fc André Apitzsch 2023-12-06  1024  	 *
4f302d004bd0fc André Apitzsch 2023-12-06  1025  	 * Sony, please release some register set documentation for the
4f302d004bd0fc André Apitzsch 2023-12-06  1026  	 * device.
4f302d004bd0fc André Apitzsch 2023-12-06  1027  	 *
4f302d004bd0fc André Apitzsch 2023-12-06  1028  	 * Yours sincerely, Ricardo.
4f302d004bd0fc André Apitzsch 2023-12-06  1029  	 */
0b57fcf81d32b8 André Apitzsch 2024-12-20  1030  
0b57fcf81d32b8 André Apitzsch 2024-12-20  1031  	/* Initial vblank/hblank/exposure parameters based on current mode */
0b57fcf81d32b8 André Apitzsch 2024-12-20  1032  	imx214->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
0b57fcf81d32b8 André Apitzsch 2024-12-20  1033  					   V4L2_CID_VBLANK, IMX214_VBLANK_MIN,
0b57fcf81d32b8 André Apitzsch 2024-12-20  1034  					   IMX214_VTS_MAX - mode->height, 2,
0b57fcf81d32b8 André Apitzsch 2024-12-20  1035  					   mode->vts_def - mode->height);
0b57fcf81d32b8 André Apitzsch 2024-12-20  1036  
0b57fcf81d32b8 André Apitzsch 2024-12-20  1037  	hblank = IMX214_PPL_DEFAULT - mode->width;
0b57fcf81d32b8 André Apitzsch 2024-12-20  1038  	imx214->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
0b57fcf81d32b8 André Apitzsch 2024-12-20  1039  					   V4L2_CID_HBLANK, hblank, hblank,
0b57fcf81d32b8 André Apitzsch 2024-12-20  1040  					   1, hblank);
0b57fcf81d32b8 André Apitzsch 2024-12-20  1041  	if (imx214->hblank)
0b57fcf81d32b8 André Apitzsch 2024-12-20  1042  		imx214->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
0b57fcf81d32b8 André Apitzsch 2024-12-20  1043  
0b57fcf81d32b8 André Apitzsch 2024-12-20  1044  	exposure_max = mode->vts_def - IMX214_EXPOSURE_OFFSET;
0b57fcf81d32b8 André Apitzsch 2024-12-20  1045  	exposure_def = min(exposure_max, IMX214_EXPOSURE_DEFAULT);
4f302d004bd0fc André Apitzsch 2023-12-06  1046  	imx214->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
4f302d004bd0fc André Apitzsch 2023-12-06  1047  					     V4L2_CID_EXPOSURE,
4f302d004bd0fc André Apitzsch 2023-12-06  1048  					     IMX214_EXPOSURE_MIN,
0b57fcf81d32b8 André Apitzsch 2024-12-20  1049  					     exposure_max,
4f302d004bd0fc André Apitzsch 2023-12-06  1050  					     IMX214_EXPOSURE_STEP,
0b57fcf81d32b8 André Apitzsch 2024-12-20  1051  					     exposure_def);
4f302d004bd0fc André Apitzsch 2023-12-06  1052  
dafbd1e960446e André Apitzsch 2024-12-20  1053  	v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
dafbd1e960446e André Apitzsch 2024-12-20  1054  			  IMX214_ANA_GAIN_MIN, IMX214_ANA_GAIN_MAX,
dafbd1e960446e André Apitzsch 2024-12-20  1055  			  IMX214_ANA_GAIN_STEP, IMX214_ANA_GAIN_DEFAULT);
dafbd1e960446e André Apitzsch 2024-12-20  1056  
dafbd1e960446e André Apitzsch 2024-12-20  1057  	v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
dafbd1e960446e André Apitzsch 2024-12-20  1058  			  IMX214_DGTL_GAIN_MIN, IMX214_DGTL_GAIN_MAX,
dafbd1e960446e André Apitzsch 2024-12-20  1059  			  IMX214_DGTL_GAIN_STEP, IMX214_DGTL_GAIN_DEFAULT);
dafbd1e960446e André Apitzsch 2024-12-20  1060  
5f8d5fe0bd9471 André Apitzsch 2024-12-20  1061  	imx214->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
5f8d5fe0bd9471 André Apitzsch 2024-12-20  1062  					  V4L2_CID_HFLIP, 0, 1, 1, 0);
5f8d5fe0bd9471 André Apitzsch 2024-12-20  1063  	if (imx214->hflip)
5f8d5fe0bd9471 André Apitzsch 2024-12-20  1064  		imx214->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
5f8d5fe0bd9471 André Apitzsch 2024-12-20  1065  
5f8d5fe0bd9471 André Apitzsch 2024-12-20  1066  	imx214->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
5f8d5fe0bd9471 André Apitzsch 2024-12-20  1067  					  V4L2_CID_VFLIP, 0, 1, 1, 0);
5f8d5fe0bd9471 André Apitzsch 2024-12-20  1068  	if (imx214->vflip)
5f8d5fe0bd9471 André Apitzsch 2024-12-20  1069  		imx214->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
5f8d5fe0bd9471 André Apitzsch 2024-12-20  1070  
5f8d5fe0bd9471 André Apitzsch 2024-12-20  1071  	v4l2_ctrl_cluster(2, &imx214->hflip);
5f8d5fe0bd9471 André Apitzsch 2024-12-20  1072  
aac37a3a763d1f André Apitzsch 2024-12-20  1073  	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &imx214_ctrl_ops,
aac37a3a763d1f André Apitzsch 2024-12-20  1074  				     V4L2_CID_TEST_PATTERN,
aac37a3a763d1f André Apitzsch 2024-12-20  1075  				     ARRAY_SIZE(imx214_test_pattern_menu) - 1,
aac37a3a763d1f André Apitzsch 2024-12-20  1076  				     0, 0, imx214_test_pattern_menu);
aac37a3a763d1f André Apitzsch 2024-12-20  1077  	for (i = 0; i < 4; i++) {
aac37a3a763d1f André Apitzsch 2024-12-20  1078  		/*
aac37a3a763d1f André Apitzsch 2024-12-20  1079  		 * The assumption is that
aac37a3a763d1f André Apitzsch 2024-12-20  1080  		 * V4L2_CID_TEST_PATTERN_GREENR == V4L2_CID_TEST_PATTERN_RED + 1
aac37a3a763d1f André Apitzsch 2024-12-20  1081  		 * V4L2_CID_TEST_PATTERN_BLUE   == V4L2_CID_TEST_PATTERN_RED + 2
aac37a3a763d1f André Apitzsch 2024-12-20  1082  		 * V4L2_CID_TEST_PATTERN_GREENB == V4L2_CID_TEST_PATTERN_RED + 3
aac37a3a763d1f André Apitzsch 2024-12-20  1083  		 */
aac37a3a763d1f André Apitzsch 2024-12-20  1084  		v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
aac37a3a763d1f André Apitzsch 2024-12-20  1085  				  V4L2_CID_TEST_PATTERN_RED + i,
aac37a3a763d1f André Apitzsch 2024-12-20  1086  				  IMX214_TESTP_COLOUR_MIN,
aac37a3a763d1f André Apitzsch 2024-12-20  1087  				  IMX214_TESTP_COLOUR_MAX,
aac37a3a763d1f André Apitzsch 2024-12-20  1088  				  IMX214_TESTP_COLOUR_STEP,
aac37a3a763d1f André Apitzsch 2024-12-20  1089  				  IMX214_TESTP_COLOUR_MAX);
aac37a3a763d1f André Apitzsch 2024-12-20  1090  		/* The "Solid color" pattern is white by default */
aac37a3a763d1f André Apitzsch 2024-12-20  1091  	}
aac37a3a763d1f André Apitzsch 2024-12-20  1092  
4f302d004bd0fc André Apitzsch 2023-12-06  1093  	imx214->unit_size = v4l2_ctrl_new_std_compound(ctrl_hdlr,
4f302d004bd0fc André Apitzsch 2023-12-06  1094  				NULL,
4f302d004bd0fc André Apitzsch 2023-12-06  1095  				V4L2_CID_UNIT_CELL_SIZE,
a5bd42aafb0684 Hans Verkuil   2025-02-03  1096  				v4l2_ctrl_ptr_create((void *)&unit_size),
a5bd42aafb0684 Hans Verkuil   2025-02-03  1097  				v4l2_ctrl_ptr_create(NULL),
a5bd42aafb0684 Hans Verkuil   2025-02-03  1098  				v4l2_ctrl_ptr_create(NULL));
4f302d004bd0fc André Apitzsch 2023-12-06  1099  
2ae9f9780d8097 André Apitzsch 2023-12-06  1100  	v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx214_ctrl_ops, &props);
2ae9f9780d8097 André Apitzsch 2023-12-06  1101  
4f302d004bd0fc André Apitzsch 2023-12-06  1102  	ret = ctrl_hdlr->error;
4f302d004bd0fc André Apitzsch 2023-12-06  1103  	if (ret) {
4f302d004bd0fc André Apitzsch 2023-12-06  1104  		v4l2_ctrl_handler_free(ctrl_hdlr);
4f302d004bd0fc André Apitzsch 2023-12-06  1105  		dev_err(imx214->dev, "failed to add controls: %d\n", ret);
4f302d004bd0fc André Apitzsch 2023-12-06  1106  		return ret;
4f302d004bd0fc André Apitzsch 2023-12-06  1107  	}
4f302d004bd0fc André Apitzsch 2023-12-06  1108  
7407c0acdb2ff0 André Apitzsch 2025-06-30 @1109  	ret = imx214_pll_update(imx214);
                                                                                ^^^^^^
This adds  an unchecked dereference.

7407c0acdb2ff0 André Apitzsch 2025-06-30  1110  	if (ret < 0) {
7407c0acdb2ff0 André Apitzsch 2025-06-30  1111  		v4l2_ctrl_handler_free(ctrl_hdlr);
7407c0acdb2ff0 André Apitzsch 2025-06-30  1112  		dev_err(imx214->dev, "failed to update PLL\n");
7407c0acdb2ff0 André Apitzsch 2025-06-30  1113  		return ret;
7407c0acdb2ff0 André Apitzsch 2025-06-30  1114  	}
7407c0acdb2ff0 André Apitzsch 2025-06-30  1115  
4f302d004bd0fc André Apitzsch 2023-12-06  1116  	imx214->sd.ctrl_handler = ctrl_hdlr;
4f302d004bd0fc André Apitzsch 2023-12-06  1117  
4f302d004bd0fc André Apitzsch 2023-12-06  1118  	return 0;
4f302d004bd0fc André Apitzsch 2023-12-06  1119  };

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


