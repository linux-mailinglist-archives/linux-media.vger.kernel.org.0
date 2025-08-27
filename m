Return-Path: <linux-media+bounces-41144-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E52A6B37E7D
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 11:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E49C81897625
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 09:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162843431F5;
	Wed, 27 Aug 2025 09:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XSj2qdKi"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A55332142B
	for <linux-media@vger.kernel.org>; Wed, 27 Aug 2025 09:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756285962; cv=none; b=Gi4zJNWzyV1iuCF9s6uGESQgt3QZO9ndSwuoYCAuRH78xt2vNGieBMwWatKMiogRObV4wJWNNtrExHojQWLiZubz0Yd9pIyes8lukCgO9MsR8ye4zkyB/pZWJPdeJk9SBJUfXhuiMthPvYXqXVkNa2FwRKz40AOzkwMQegZrk6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756285962; c=relaxed/simple;
	bh=midLA1tBylRZ/Bpxj1+a/UHaGFNZfISkezuKzlJnt+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TGbiXdN3pLP9L4xkDcWTf1fmI7JfjzDFbgDAJdbataskLiTADSmKEHMVJvzRfQY3TJTl7izQEEMqsJOwCdPtG4zgw5vy+SIa5fe8/ABnYwvvWN6PrtacmHm0dLqnWnEI6c2xx+zoRzKiytieX1jS81gWMdFCuAftGp7t1f/Ezks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XSj2qdKi; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756285961; x=1787821961;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=midLA1tBylRZ/Bpxj1+a/UHaGFNZfISkezuKzlJnt+Y=;
  b=XSj2qdKi0SUB4QIbCDhQ23tCcw+/glLfEeKN2rJkp+PQX8YCFAOCeVzj
   dyeTxcvekOUOMD1gVk7ZyMDIj7YC690amQejyOViyGiYe14yKXdTKrE41
   RhEUAYtbm5okeE3dmDkniz6Bb9zdtbhB7FCT8BFo++fkM3HE8vbyoup/h
   o3A9CA1soeogNHnG8PyJav3CUd4/+tUpWlwPmcvQflbf0EpXeI1eI8FcB
   TykoGnBR7DYrd71g/5bUaJKZ11kgAV8dHM91HhJMGgG62RmTBG9OQPKsv
   7dhNijjksW4bMCetO3XWZukMa/4zp525ITABeo/hRQG/oiVia44XCWFeF
   Q==;
X-CSE-ConnectionGUID: JGU64C0fQtGGGgeFXYsqrw==
X-CSE-MsgGUID: I+F7SFttTMW+RKaGrLYQTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="62348839"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="62348839"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 02:12:39 -0700
X-CSE-ConnectionGUID: 8iQ+CVmGQ/mHdcC1nXxajw==
X-CSE-MsgGUID: oU6vww0gSIuL//kUMzHwZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169734773"
Received: from johunt-mobl9.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.86])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 02:12:37 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9D63311FBC0;
	Wed, 27 Aug 2025 12:12:34 +0300 (EEST)
Date: Wed, 27 Aug 2025 12:12:34 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [sailus-media-tree:cleanup 30/54]
 drivers/media/i2c/imx214.c:1109 imx214_ctrls_init() error: we previously
 assumed 'imx214->link_freq' could be null (see line 1017)
Message-ID: <aK7MAiDuq6tqEW7X@kekkonen.localdomain>
References: <202508270603.MDqIVFss-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202508270603.MDqIVFss-lkp@intel.com>

Hi Dan,

On Wed, Aug 27, 2025 at 10:17:26AM +0300, Dan Carpenter wrote:
> tree:   git://linuxtv.org/sailus/media_tree.git cleanup
> head:   9a8e7210e8e21ebba263affd0d7481ef0d6c323e
> commit: 7407c0acdb2ff0c1e3a962543db7d775b3b611c8 [30/54] media: i2c: imx214: Move imx214_pll_update to imx214_ctrls_init
> config: i386-randconfig-141-20250827 (https://download.01.org/0day-ci/archive/20250827/202508270603.MDqIVFss-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202508270603.MDqIVFss-lkp@intel.com/
> 
> smatch warnings:
> drivers/media/i2c/imx214.c:1109 imx214_ctrls_init() error: we previously assumed 'imx214->link_freq' could be null (see line 1017)
> 
> vim +1109 drivers/media/i2c/imx214.c
> 
> 4f302d004bd0fc André Apitzsch 2023-12-06   987  static int imx214_ctrls_init(struct imx214 *imx214)
> 4f302d004bd0fc André Apitzsch 2023-12-06   988  {
> 4f302d004bd0fc André Apitzsch 2023-12-06   989  	static const struct v4l2_area unit_size = {
> 4f302d004bd0fc André Apitzsch 2023-12-06   990  		.width = 1120,
> 4f302d004bd0fc André Apitzsch 2023-12-06   991  		.height = 1120,
> 4f302d004bd0fc André Apitzsch 2023-12-06   992  	};
> 0b57fcf81d32b8 André Apitzsch 2024-12-20   993  	const struct imx214_mode *mode = &imx214_modes[0];
> 2ae9f9780d8097 André Apitzsch 2023-12-06   994  	struct v4l2_fwnode_device_properties props;
> 4f302d004bd0fc André Apitzsch 2023-12-06   995  	struct v4l2_ctrl_handler *ctrl_hdlr;
> 0b57fcf81d32b8 André Apitzsch 2024-12-20   996  	int exposure_max, exposure_def;
> 0b57fcf81d32b8 André Apitzsch 2024-12-20   997  	int hblank;
> aac37a3a763d1f André Apitzsch 2024-12-20   998  	int i, ret;
> 4f302d004bd0fc André Apitzsch 2023-12-06   999  
> 2ae9f9780d8097 André Apitzsch 2023-12-06  1000  	ret = v4l2_fwnode_device_parse(imx214->dev, &props);
> 2ae9f9780d8097 André Apitzsch 2023-12-06  1001  	if (ret < 0)
> 2ae9f9780d8097 André Apitzsch 2023-12-06  1002  		return ret;
> 2ae9f9780d8097 André Apitzsch 2023-12-06  1003  
> 4f302d004bd0fc André Apitzsch 2023-12-06  1004  	ctrl_hdlr = &imx214->ctrls;
> aac37a3a763d1f André Apitzsch 2024-12-20  1005  	ret = v4l2_ctrl_handler_init(&imx214->ctrls, 13);
> 4f302d004bd0fc André Apitzsch 2023-12-06  1006  	if (ret)
> 4f302d004bd0fc André Apitzsch 2023-12-06  1007  		return ret;
> 4f302d004bd0fc André Apitzsch 2023-12-06  1008  
> b9b359662952ff André Apitzsch 2025-05-24  1009  	imx214->pixel_rate =
> b9b359662952ff André Apitzsch 2025-05-24  1010  		v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_PIXEL_RATE, 1,
> b9b359662952ff André Apitzsch 2025-05-24  1011  				  INT_MAX, 1, 1);
> 4f302d004bd0fc André Apitzsch 2023-12-06  1012  
> 4f302d004bd0fc André Apitzsch 2023-12-06  1013  	imx214->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, NULL,
> 4f302d004bd0fc André Apitzsch 2023-12-06  1014  						   V4L2_CID_LINK_FREQ,
> b9b359662952ff André Apitzsch 2025-05-24  1015  						   imx214->bus_cfg.nr_of_link_frequencies - 1,
> b9b359662952ff André Apitzsch 2025-05-24  1016  						   0, imx214->bus_cfg.link_frequencies);
> 4f302d004bd0fc André Apitzsch 2023-12-06 @1017  	if (imx214->link_freq)
>                                                             ^^^^^^^^^^^^^^^^^
> This assumes ->link_freq can be NULL.

This seems to be a false positive: the control handler's error is set if
adding the LINK_FREQ control isn't successful and that is checked for later
on, before calling imx214_pll_update(). Probably smatch can't figure that
out?

> 
> 4f302d004bd0fc André Apitzsch 2023-12-06  1018  		imx214->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> 4f302d004bd0fc André Apitzsch 2023-12-06  1019  
> 4f302d004bd0fc André Apitzsch 2023-12-06  1020  	/*
> 4f302d004bd0fc André Apitzsch 2023-12-06  1021  	 * WARNING!
> 4f302d004bd0fc André Apitzsch 2023-12-06  1022  	 * Values obtained reverse engineering blobs and/or devices.
> 4f302d004bd0fc André Apitzsch 2023-12-06  1023  	 * Ranges and functionality might be wrong.
> 4f302d004bd0fc André Apitzsch 2023-12-06  1024  	 *
> 4f302d004bd0fc André Apitzsch 2023-12-06  1025  	 * Sony, please release some register set documentation for the
> 4f302d004bd0fc André Apitzsch 2023-12-06  1026  	 * device.
> 4f302d004bd0fc André Apitzsch 2023-12-06  1027  	 *
> 4f302d004bd0fc André Apitzsch 2023-12-06  1028  	 * Yours sincerely, Ricardo.
> 4f302d004bd0fc André Apitzsch 2023-12-06  1029  	 */
> 0b57fcf81d32b8 André Apitzsch 2024-12-20  1030  
> 0b57fcf81d32b8 André Apitzsch 2024-12-20  1031  	/* Initial vblank/hblank/exposure parameters based on current mode */
> 0b57fcf81d32b8 André Apitzsch 2024-12-20  1032  	imx214->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
> 0b57fcf81d32b8 André Apitzsch 2024-12-20  1033  					   V4L2_CID_VBLANK, IMX214_VBLANK_MIN,
> 0b57fcf81d32b8 André Apitzsch 2024-12-20  1034  					   IMX214_VTS_MAX - mode->height, 2,
> 0b57fcf81d32b8 André Apitzsch 2024-12-20  1035  					   mode->vts_def - mode->height);
> 0b57fcf81d32b8 André Apitzsch 2024-12-20  1036  
> 0b57fcf81d32b8 André Apitzsch 2024-12-20  1037  	hblank = IMX214_PPL_DEFAULT - mode->width;
> 0b57fcf81d32b8 André Apitzsch 2024-12-20  1038  	imx214->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
> 0b57fcf81d32b8 André Apitzsch 2024-12-20  1039  					   V4L2_CID_HBLANK, hblank, hblank,
> 0b57fcf81d32b8 André Apitzsch 2024-12-20  1040  					   1, hblank);
> 0b57fcf81d32b8 André Apitzsch 2024-12-20  1041  	if (imx214->hblank)
> 0b57fcf81d32b8 André Apitzsch 2024-12-20  1042  		imx214->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> 0b57fcf81d32b8 André Apitzsch 2024-12-20  1043  
> 0b57fcf81d32b8 André Apitzsch 2024-12-20  1044  	exposure_max = mode->vts_def - IMX214_EXPOSURE_OFFSET;
> 0b57fcf81d32b8 André Apitzsch 2024-12-20  1045  	exposure_def = min(exposure_max, IMX214_EXPOSURE_DEFAULT);
> 4f302d004bd0fc André Apitzsch 2023-12-06  1046  	imx214->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
> 4f302d004bd0fc André Apitzsch 2023-12-06  1047  					     V4L2_CID_EXPOSURE,
> 4f302d004bd0fc André Apitzsch 2023-12-06  1048  					     IMX214_EXPOSURE_MIN,
> 0b57fcf81d32b8 André Apitzsch 2024-12-20  1049  					     exposure_max,
> 4f302d004bd0fc André Apitzsch 2023-12-06  1050  					     IMX214_EXPOSURE_STEP,
> 0b57fcf81d32b8 André Apitzsch 2024-12-20  1051  					     exposure_def);
> 4f302d004bd0fc André Apitzsch 2023-12-06  1052  
> dafbd1e960446e André Apitzsch 2024-12-20  1053  	v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
> dafbd1e960446e André Apitzsch 2024-12-20  1054  			  IMX214_ANA_GAIN_MIN, IMX214_ANA_GAIN_MAX,
> dafbd1e960446e André Apitzsch 2024-12-20  1055  			  IMX214_ANA_GAIN_STEP, IMX214_ANA_GAIN_DEFAULT);
> dafbd1e960446e André Apitzsch 2024-12-20  1056  
> dafbd1e960446e André Apitzsch 2024-12-20  1057  	v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
> dafbd1e960446e André Apitzsch 2024-12-20  1058  			  IMX214_DGTL_GAIN_MIN, IMX214_DGTL_GAIN_MAX,
> dafbd1e960446e André Apitzsch 2024-12-20  1059  			  IMX214_DGTL_GAIN_STEP, IMX214_DGTL_GAIN_DEFAULT);
> dafbd1e960446e André Apitzsch 2024-12-20  1060  
> 5f8d5fe0bd9471 André Apitzsch 2024-12-20  1061  	imx214->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
> 5f8d5fe0bd9471 André Apitzsch 2024-12-20  1062  					  V4L2_CID_HFLIP, 0, 1, 1, 0);
> 5f8d5fe0bd9471 André Apitzsch 2024-12-20  1063  	if (imx214->hflip)
> 5f8d5fe0bd9471 André Apitzsch 2024-12-20  1064  		imx214->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> 5f8d5fe0bd9471 André Apitzsch 2024-12-20  1065  
> 5f8d5fe0bd9471 André Apitzsch 2024-12-20  1066  	imx214->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
> 5f8d5fe0bd9471 André Apitzsch 2024-12-20  1067  					  V4L2_CID_VFLIP, 0, 1, 1, 0);
> 5f8d5fe0bd9471 André Apitzsch 2024-12-20  1068  	if (imx214->vflip)
> 5f8d5fe0bd9471 André Apitzsch 2024-12-20  1069  		imx214->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> 5f8d5fe0bd9471 André Apitzsch 2024-12-20  1070  
> 5f8d5fe0bd9471 André Apitzsch 2024-12-20  1071  	v4l2_ctrl_cluster(2, &imx214->hflip);
> 5f8d5fe0bd9471 André Apitzsch 2024-12-20  1072  
> aac37a3a763d1f André Apitzsch 2024-12-20  1073  	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &imx214_ctrl_ops,
> aac37a3a763d1f André Apitzsch 2024-12-20  1074  				     V4L2_CID_TEST_PATTERN,
> aac37a3a763d1f André Apitzsch 2024-12-20  1075  				     ARRAY_SIZE(imx214_test_pattern_menu) - 1,
> aac37a3a763d1f André Apitzsch 2024-12-20  1076  				     0, 0, imx214_test_pattern_menu);
> aac37a3a763d1f André Apitzsch 2024-12-20  1077  	for (i = 0; i < 4; i++) {
> aac37a3a763d1f André Apitzsch 2024-12-20  1078  		/*
> aac37a3a763d1f André Apitzsch 2024-12-20  1079  		 * The assumption is that
> aac37a3a763d1f André Apitzsch 2024-12-20  1080  		 * V4L2_CID_TEST_PATTERN_GREENR == V4L2_CID_TEST_PATTERN_RED + 1
> aac37a3a763d1f André Apitzsch 2024-12-20  1081  		 * V4L2_CID_TEST_PATTERN_BLUE   == V4L2_CID_TEST_PATTERN_RED + 2
> aac37a3a763d1f André Apitzsch 2024-12-20  1082  		 * V4L2_CID_TEST_PATTERN_GREENB == V4L2_CID_TEST_PATTERN_RED + 3
> aac37a3a763d1f André Apitzsch 2024-12-20  1083  		 */
> aac37a3a763d1f André Apitzsch 2024-12-20  1084  		v4l2_ctrl_new_std(ctrl_hdlr, &imx214_ctrl_ops,
> aac37a3a763d1f André Apitzsch 2024-12-20  1085  				  V4L2_CID_TEST_PATTERN_RED + i,
> aac37a3a763d1f André Apitzsch 2024-12-20  1086  				  IMX214_TESTP_COLOUR_MIN,
> aac37a3a763d1f André Apitzsch 2024-12-20  1087  				  IMX214_TESTP_COLOUR_MAX,
> aac37a3a763d1f André Apitzsch 2024-12-20  1088  				  IMX214_TESTP_COLOUR_STEP,
> aac37a3a763d1f André Apitzsch 2024-12-20  1089  				  IMX214_TESTP_COLOUR_MAX);
> aac37a3a763d1f André Apitzsch 2024-12-20  1090  		/* The "Solid color" pattern is white by default */
> aac37a3a763d1f André Apitzsch 2024-12-20  1091  	}
> aac37a3a763d1f André Apitzsch 2024-12-20  1092  
> 4f302d004bd0fc André Apitzsch 2023-12-06  1093  	imx214->unit_size = v4l2_ctrl_new_std_compound(ctrl_hdlr,
> 4f302d004bd0fc André Apitzsch 2023-12-06  1094  				NULL,
> 4f302d004bd0fc André Apitzsch 2023-12-06  1095  				V4L2_CID_UNIT_CELL_SIZE,
> a5bd42aafb0684 Hans Verkuil   2025-02-03  1096  				v4l2_ctrl_ptr_create((void *)&unit_size),
> a5bd42aafb0684 Hans Verkuil   2025-02-03  1097  				v4l2_ctrl_ptr_create(NULL),
> a5bd42aafb0684 Hans Verkuil   2025-02-03  1098  				v4l2_ctrl_ptr_create(NULL));
> 4f302d004bd0fc André Apitzsch 2023-12-06  1099  
> 2ae9f9780d8097 André Apitzsch 2023-12-06  1100  	v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx214_ctrl_ops, &props);
> 2ae9f9780d8097 André Apitzsch 2023-12-06  1101  
> 4f302d004bd0fc André Apitzsch 2023-12-06  1102  	ret = ctrl_hdlr->error;
> 4f302d004bd0fc André Apitzsch 2023-12-06  1103  	if (ret) {
> 4f302d004bd0fc André Apitzsch 2023-12-06  1104  		v4l2_ctrl_handler_free(ctrl_hdlr);
> 4f302d004bd0fc André Apitzsch 2023-12-06  1105  		dev_err(imx214->dev, "failed to add controls: %d\n", ret);
> 4f302d004bd0fc André Apitzsch 2023-12-06  1106  		return ret;
> 4f302d004bd0fc André Apitzsch 2023-12-06  1107  	}
> 4f302d004bd0fc André Apitzsch 2023-12-06  1108  
> 7407c0acdb2ff0 André Apitzsch 2025-06-30 @1109  	ret = imx214_pll_update(imx214);
>                                                                                 ^^^^^^
> This adds  an unchecked dereference.
> 
> 7407c0acdb2ff0 André Apitzsch 2025-06-30  1110  	if (ret < 0) {
> 7407c0acdb2ff0 André Apitzsch 2025-06-30  1111  		v4l2_ctrl_handler_free(ctrl_hdlr);
> 7407c0acdb2ff0 André Apitzsch 2025-06-30  1112  		dev_err(imx214->dev, "failed to update PLL\n");
> 7407c0acdb2ff0 André Apitzsch 2025-06-30  1113  		return ret;
> 7407c0acdb2ff0 André Apitzsch 2025-06-30  1114  	}
> 7407c0acdb2ff0 André Apitzsch 2025-06-30  1115  
> 4f302d004bd0fc André Apitzsch 2023-12-06  1116  	imx214->sd.ctrl_handler = ctrl_hdlr;
> 4f302d004bd0fc André Apitzsch 2023-12-06  1117  
> 4f302d004bd0fc André Apitzsch 2023-12-06  1118  	return 0;
> 4f302d004bd0fc André Apitzsch 2023-12-06  1119  };
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

-- 
Kind regards,

Sakari Ailus

