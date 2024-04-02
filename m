Return-Path: <linux-media+bounces-8404-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B718956A3
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 16:29:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 987401F22B1E
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 14:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FC0886AE2;
	Tue,  2 Apr 2024 14:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C7LyuR4M"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793B58662E
	for <linux-media@vger.kernel.org>; Tue,  2 Apr 2024 14:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712068135; cv=none; b=m0JUsjIttOFGcDWnKG+0fZ6aDdbL7UDkJBm1yIxn89oce+3rkmElSdRa6nsBBAg80wjyK789T04Rq7xnTjsfeizEbxxkmZ7G8XiGK5i9JLw6UGi8o/X1kI1LgtbKvHIGI4XwsOQ+7POmgh+nEwOVWPcxYEcxzITH7LR7KbIHlLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712068135; c=relaxed/simple;
	bh=fRHOq+mWZPSalcGiLvnJcNAakk7ykW7S34Y0J2V0d1U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Qi2ZOI4bb+//SH1zcZXj1lK/Jtnj7lfhi197HvZg1RiqzeOLigaC53V82GBQBy19lPH+TpxLjoKhJGO/fOsqVZyEdqZe8jqYL7UdhGzVyYk4SdEBzVeqvAvYmxM6FBw08Sm+jnCFyP7wUy3jskX335GyFEx0wXoCx9jtNJw2cO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C7LyuR4M; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-56c1922096cso6683404a12.0
        for <linux-media@vger.kernel.org>; Tue, 02 Apr 2024 07:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712068132; x=1712672932; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pSKxf0IIEUwyutNpDWLf0ZVVUCmfh34i9H8sYjRga6I=;
        b=C7LyuR4M9c8ztSbfWVDJTH2WDOYr0BMJ/wV7coY7IddWAd8MeeNMi2ZaKR+EvQ/3U9
         D2bR22FBMKD8Dfbh6Mb/pnAJtpgisbda3KRZrH6LxbQkrNbV1e6c1DGYjeDa+bOupB6D
         Tu20HUJXTZDVos1ZVNBSx1WHen+GUiVaoMKMmE95mYa6mGz/byXFRJMnSjItjETnpVWM
         yGNMY81wNPhcTOIZyIXIKBkjSbY3TVhOkpgB7lWDf949EwSQmrf5YJ52y+tb1fcZzvKM
         H2bilAD3qw/R+VLOXsHavn0G5Uaob9VTL7KykanNV/DN/jqqjUbnRa07oqaYljLP6YY+
         clEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712068132; x=1712672932;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pSKxf0IIEUwyutNpDWLf0ZVVUCmfh34i9H8sYjRga6I=;
        b=nfdOUJc3GCm/ioKOzjzVLn53VTkJkqzec6DHMj1dlFev267PGIVlVjDOHDYsPHrBPd
         SNtpcydQuryI6+JcHad4JfUac4i9mxMl1tIzYAZJKsD5TuMYHyh8XR11FoDJ7wx8YwKG
         eB65gJGSiYXhSM/JEAi7fPyU6H5IhWlJwzPnsv3zJwBJzOByScCYB37IIFsWStyNrOtU
         zlArpEH4h8pCwyeGqTNte7fUTzfMdxwod5GnWCJILowqjwl29JxbtlkOtPKEe9mwzwmD
         X0XWc2fHmYIF3OOJSlxYUZixQHSjpEVQ+hNPxXuhT/aPmeMr2ZQUk5rKbcDTqVWC55+b
         RuKA==
X-Forwarded-Encrypted: i=1; AJvYcCXVpWaXZKHJ2pLe0Qd0G1NhkVgsz49BOQ14bdISS4ASEGe8iYO6ZnMhKD1K0EJoTHSJZarMehhp5JpS3LnMWL7JpMMQ7k2bnB1iPG0=
X-Gm-Message-State: AOJu0YyqoDe9asxIBN1rjJvVMdarEtAvAP/6idQU0LfhWN2AC31H8Rhb
	9ZVIebpsk/yaOwS0D3gvpc3cYb10vqZPXxGRZ5mUDO2w6W9RhJy/NIYZTWqsOkg=
X-Google-Smtp-Source: AGHT+IGg3KQKWJHw4XuJFppAkBsb9cAouGb9m1ZHLRR8XQFwuIhpnlS9HkKPOad2YoSJ8s/R871tqQ==
X-Received: by 2002:a17:907:7ea8:b0:a4e:5abe:3832 with SMTP id qb40-20020a1709077ea800b00a4e5abe3832mr5567936ejc.72.1712068131602;
        Tue, 02 Apr 2024 07:28:51 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id qf31-20020a1709077f1f00b00a4df4243473sm6556183ejc.4.2024.04.02.07.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 07:28:50 -0700 (PDT)
Date: Tue, 2 Apr 2024 17:28:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, git@luigi311.com,
	linux-media@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	dave.stevenson@raspberrypi.com, jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, sakari.ailus@linux.intel.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Luigi311 <git@luigi311.com>, Ondrej Jirman <megi@xff.cz>
Subject: Re: [PATCH 22/23] drivers: media: i2c: imx258: Add support for
 powerdown gpio
Message-ID: <fae1ba7c-2f74-42f9-a79e-ce2a04f5d6da@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327231710.53188-23-git@luigi311.com>

Hi,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/git-luigi311-com/media-i2c-imx258-Remove-unused-defines/20240328-072629
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20240327231710.53188-23-git%40luigi311.com
patch subject: [PATCH 22/23] drivers: media: i2c: imx258: Add support for powerdown gpio
config: x86_64-randconfig-161-20240331 (https://download.01.org/0day-ci/archive/20240401/202404011425.PVKV9Lf1-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202404011425.PVKV9Lf1-lkp@intel.com/

smatch warnings:
drivers/media/i2c/imx258.c:1562 imx258_probe() warn: missing unwind goto?

vim +1562 drivers/media/i2c/imx258.c

d3773094af21c9 Dave Stevenson      2024-03-27  1476  
e4802cb00bfe3d Jason Chen          2018-05-02  1477  static int imx258_probe(struct i2c_client *client)
e4802cb00bfe3d Jason Chen          2018-05-02  1478  {
e4802cb00bfe3d Jason Chen          2018-05-02  1479  	struct imx258 *imx258;
786d2ad50b9b49 Dave Stevenson      2024-03-27  1480  	struct fwnode_handle *endpoint;
786d2ad50b9b49 Dave Stevenson      2024-03-27  1481  	struct v4l2_fwnode_endpoint ep = {
786d2ad50b9b49 Dave Stevenson      2024-03-27  1482  		.bus_type = V4L2_MBUS_CSI2_DPHY
786d2ad50b9b49 Dave Stevenson      2024-03-27  1483  	};
e4802cb00bfe3d Jason Chen          2018-05-02  1484  	int ret;
e4802cb00bfe3d Jason Chen          2018-05-02  1485  	u32 val = 0;
e4802cb00bfe3d Jason Chen          2018-05-02  1486  
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1487  	imx258 = devm_kzalloc(&client->dev, sizeof(*imx258), GFP_KERNEL);
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1488  	if (!imx258)
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1489  		return -ENOMEM;
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1490  
d3773094af21c9 Dave Stevenson      2024-03-27  1491  	ret = imx258_get_regulators(imx258, client);
d3773094af21c9 Dave Stevenson      2024-03-27  1492  	if (ret)
d3773094af21c9 Dave Stevenson      2024-03-27  1493  		return dev_err_probe(&client->dev, ret,
d3773094af21c9 Dave Stevenson      2024-03-27  1494  				     "failed to get regulators\n");
d3773094af21c9 Dave Stevenson      2024-03-27  1495  
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1496  	imx258->clk = devm_clk_get_optional(&client->dev, NULL);
d170b0ea176098 Sakari Ailus        2021-08-16  1497  	if (IS_ERR(imx258->clk))
d170b0ea176098 Sakari Ailus        2021-08-16  1498  		return dev_err_probe(&client->dev, PTR_ERR(imx258->clk),
d170b0ea176098 Sakari Ailus        2021-08-16  1499  				     "error getting clock\n");
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1500  	if (!imx258->clk) {
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1501  		dev_dbg(&client->dev,
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1502  			"no clock provided, using clock-frequency property\n");
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1503  
e4802cb00bfe3d Jason Chen          2018-05-02  1504  		device_property_read_u32(&client->dev, "clock-frequency", &val);
d170b0ea176098 Sakari Ailus        2021-08-16  1505  	} else {
d170b0ea176098 Sakari Ailus        2021-08-16  1506  		val = clk_get_rate(imx258->clk);
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1507  	}
8bde18cb296d0e Dave Stevenson      2024-03-27  1508  
8bde18cb296d0e Dave Stevenson      2024-03-27  1509  	switch (val) {
8bde18cb296d0e Dave Stevenson      2024-03-27  1510  	case 19200000:
8bde18cb296d0e Dave Stevenson      2024-03-27  1511  		imx258->link_freq_configs = link_freq_configs_19_2;
8bde18cb296d0e Dave Stevenson      2024-03-27  1512  		imx258->link_freq_menu_items = link_freq_menu_items_19_2;
8bde18cb296d0e Dave Stevenson      2024-03-27  1513  		break;
8bde18cb296d0e Dave Stevenson      2024-03-27  1514  	case 24000000:
8bde18cb296d0e Dave Stevenson      2024-03-27  1515  		imx258->link_freq_configs = link_freq_configs_24;
8bde18cb296d0e Dave Stevenson      2024-03-27  1516  		imx258->link_freq_menu_items = link_freq_menu_items_24;
8bde18cb296d0e Dave Stevenson      2024-03-27  1517  		break;
8bde18cb296d0e Dave Stevenson      2024-03-27  1518  	default:
8bde18cb296d0e Dave Stevenson      2024-03-27  1519  		dev_err(&client->dev, "input clock frequency of %u not supported\n",
8bde18cb296d0e Dave Stevenson      2024-03-27  1520  			val);
e4802cb00bfe3d Jason Chen          2018-05-02  1521  		return -EINVAL;
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1522  	}
e4802cb00bfe3d Jason Chen          2018-05-02  1523  
786d2ad50b9b49 Dave Stevenson      2024-03-27  1524  	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev), NULL);
786d2ad50b9b49 Dave Stevenson      2024-03-27  1525  	if (!endpoint) {
786d2ad50b9b49 Dave Stevenson      2024-03-27  1526  		dev_err(&client->dev, "Endpoint node not found\n");
786d2ad50b9b49 Dave Stevenson      2024-03-27  1527  		return -EINVAL;
786d2ad50b9b49 Dave Stevenson      2024-03-27  1528  	}
786d2ad50b9b49 Dave Stevenson      2024-03-27  1529  
786d2ad50b9b49 Dave Stevenson      2024-03-27  1530  	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep);
786d2ad50b9b49 Dave Stevenson      2024-03-27  1531  	fwnode_handle_put(endpoint);
786d2ad50b9b49 Dave Stevenson      2024-03-27  1532  	if (ret) {
786d2ad50b9b49 Dave Stevenson      2024-03-27  1533  		dev_err(&client->dev, "Parsing endpoint node failed\n");
786d2ad50b9b49 Dave Stevenson      2024-03-27  1534  		return ret;
786d2ad50b9b49 Dave Stevenson      2024-03-27  1535  	}
786d2ad50b9b49 Dave Stevenson      2024-03-27  1536  
786d2ad50b9b49 Dave Stevenson      2024-03-27  1537  	/* Get number of data lanes */
a42d61a239fac8 Dave Stevenson      2024-03-27  1538  	switch (ep.bus.mipi_csi2.num_data_lanes) {
a42d61a239fac8 Dave Stevenson      2024-03-27  1539  	case 2:
a42d61a239fac8 Dave Stevenson      2024-03-27  1540  		imx258->lane_mode_idx = IMX258_2_LANE_MODE;
a42d61a239fac8 Dave Stevenson      2024-03-27  1541  		break;
a42d61a239fac8 Dave Stevenson      2024-03-27  1542  	case 4:
a42d61a239fac8 Dave Stevenson      2024-03-27  1543  		imx258->lane_mode_idx = IMX258_4_LANE_MODE;
a42d61a239fac8 Dave Stevenson      2024-03-27  1544  		break;
a42d61a239fac8 Dave Stevenson      2024-03-27  1545  	default:
786d2ad50b9b49 Dave Stevenson      2024-03-27  1546  		dev_err(&client->dev, "Invalid data lanes: %u\n",
a42d61a239fac8 Dave Stevenson      2024-03-27  1547  			ep.bus.mipi_csi2.num_data_lanes);
786d2ad50b9b49 Dave Stevenson      2024-03-27  1548  		ret = -EINVAL;
786d2ad50b9b49 Dave Stevenson      2024-03-27  1549  		goto error_endpoint_free;
786d2ad50b9b49 Dave Stevenson      2024-03-27  1550  	}
786d2ad50b9b49 Dave Stevenson      2024-03-27  1551  
7db096053387db Dave Stevenson      2024-03-27  1552  	imx258->csi2_flags = ep.bus.mipi_csi2.flags;
7db096053387db Dave Stevenson      2024-03-27  1553  
a8bb93eeccfa73 Dave Stevenson      2024-03-27  1554  	imx258->variant_cfg = of_device_get_match_data(&client->dev);
a8bb93eeccfa73 Dave Stevenson      2024-03-27  1555  	if (!imx258->variant_cfg)
a8bb93eeccfa73 Dave Stevenson      2024-03-27  1556  		imx258->variant_cfg = &imx258_cfg;
a8bb93eeccfa73 Dave Stevenson      2024-03-27  1557  
8a1906e91c0093 Luigi311            2024-03-27  1558  	/* request optional power down pin */
8a1906e91c0093 Luigi311            2024-03-27  1559  	imx258->powerdown_gpio = devm_gpiod_get_optional(&client->dev, "powerdown",
8a1906e91c0093 Luigi311            2024-03-27  1560  						    GPIOD_OUT_HIGH);
8a1906e91c0093 Luigi311            2024-03-27  1561  	if (IS_ERR(imx258->powerdown_gpio))
8a1906e91c0093 Luigi311            2024-03-27 @1562  		return PTR_ERR(imx258->powerdown_gpio);

	ret = PTR_ERR(imx258->powerdown_gpio);
	goto error_endpoint_free;

8a1906e91c0093 Luigi311            2024-03-27  1563  
e4802cb00bfe3d Jason Chen          2018-05-02  1564  	/* Initialize subdev */
e4802cb00bfe3d Jason Chen          2018-05-02  1565  	v4l2_i2c_subdev_init(&imx258->sd, client, &imx258_subdev_ops);
e4802cb00bfe3d Jason Chen          2018-05-02  1566  
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1567  	/* Will be powered off via pm_runtime_idle */
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1568  	ret = imx258_power_on(&client->dev);
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1569  	if (ret)
786d2ad50b9b49 Dave Stevenson      2024-03-27  1570  		goto error_endpoint_free;
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1571  
e4802cb00bfe3d Jason Chen          2018-05-02  1572  	/* Check module identity */
e4802cb00bfe3d Jason Chen          2018-05-02  1573  	ret = imx258_identify_module(imx258);
e4802cb00bfe3d Jason Chen          2018-05-02  1574  	if (ret)
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1575  		goto error_identify;
e4802cb00bfe3d Jason Chen          2018-05-02  1576  
e4802cb00bfe3d Jason Chen          2018-05-02  1577  	/* Set default mode to max resolution */
e4802cb00bfe3d Jason Chen          2018-05-02  1578  	imx258->cur_mode = &supported_modes[0];
e4802cb00bfe3d Jason Chen          2018-05-02  1579  
e4802cb00bfe3d Jason Chen          2018-05-02  1580  	ret = imx258_init_controls(imx258);
e4802cb00bfe3d Jason Chen          2018-05-02  1581  	if (ret)
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1582  		goto error_identify;
e4802cb00bfe3d Jason Chen          2018-05-02  1583  
e4802cb00bfe3d Jason Chen          2018-05-02  1584  	/* Initialize subdev */
e4802cb00bfe3d Jason Chen          2018-05-02  1585  	imx258->sd.internal_ops = &imx258_internal_ops;
e4802cb00bfe3d Jason Chen          2018-05-02  1586  	imx258->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
e4802cb00bfe3d Jason Chen          2018-05-02  1587  	imx258->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
e4802cb00bfe3d Jason Chen          2018-05-02  1588  
e4802cb00bfe3d Jason Chen          2018-05-02  1589  	/* Initialize source pad */
e4802cb00bfe3d Jason Chen          2018-05-02  1590  	imx258->pad.flags = MEDIA_PAD_FL_SOURCE;
e4802cb00bfe3d Jason Chen          2018-05-02  1591  
e4802cb00bfe3d Jason Chen          2018-05-02  1592  	ret = media_entity_pads_init(&imx258->sd.entity, 1, &imx258->pad);
e4802cb00bfe3d Jason Chen          2018-05-02  1593  	if (ret)
e4802cb00bfe3d Jason Chen          2018-05-02  1594  		goto error_handler_free;
e4802cb00bfe3d Jason Chen          2018-05-02  1595  
15786f7b564eff Sakari Ailus        2021-03-05  1596  	ret = v4l2_async_register_subdev_sensor(&imx258->sd);
e4802cb00bfe3d Jason Chen          2018-05-02  1597  	if (ret < 0)
e4802cb00bfe3d Jason Chen          2018-05-02  1598  		goto error_media_entity;
e4802cb00bfe3d Jason Chen          2018-05-02  1599  
e4802cb00bfe3d Jason Chen          2018-05-02  1600  	pm_runtime_set_active(&client->dev);
e4802cb00bfe3d Jason Chen          2018-05-02  1601  	pm_runtime_enable(&client->dev);
e4802cb00bfe3d Jason Chen          2018-05-02  1602  	pm_runtime_idle(&client->dev);
786d2ad50b9b49 Dave Stevenson      2024-03-27  1603  	v4l2_fwnode_endpoint_free(&ep);
e4802cb00bfe3d Jason Chen          2018-05-02  1604  
e4802cb00bfe3d Jason Chen          2018-05-02  1605  	return 0;
e4802cb00bfe3d Jason Chen          2018-05-02  1606  
e4802cb00bfe3d Jason Chen          2018-05-02  1607  error_media_entity:
e4802cb00bfe3d Jason Chen          2018-05-02  1608  	media_entity_cleanup(&imx258->sd.entity);
e4802cb00bfe3d Jason Chen          2018-05-02  1609  
e4802cb00bfe3d Jason Chen          2018-05-02  1610  error_handler_free:
e4802cb00bfe3d Jason Chen          2018-05-02  1611  	imx258_free_controls(imx258);
e4802cb00bfe3d Jason Chen          2018-05-02  1612  
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1613  error_identify:
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1614  	imx258_power_off(&client->dev);
9fda25332c4b9e Krzysztof Kozlowski 2021-01-27  1615  
786d2ad50b9b49 Dave Stevenson      2024-03-27  1616  error_endpoint_free:
786d2ad50b9b49 Dave Stevenson      2024-03-27  1617  	v4l2_fwnode_endpoint_free(&ep);
786d2ad50b9b49 Dave Stevenson      2024-03-27  1618  
e4802cb00bfe3d Jason Chen          2018-05-02  1619  	return ret;
e4802cb00bfe3d Jason Chen          2018-05-02  1620  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


