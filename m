Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6539F764D84
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 10:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234386AbjG0IgG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jul 2023 04:36:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234335AbjG0Ifs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jul 2023 04:35:48 -0400
Received: from mgamail.intel.com (unknown [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 911501BC1
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 01:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690445955; x=1721981955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N6D3Z7WGditHoLQws1W+RFXG+wdqFs5MhCVLjURj05s=;
  b=PFWnh8XiBHiQkHPjP7+xYULFQNhxbjmXkXdHB2b+LdDPCSzn2LUqUCU/
   19VcFtC9SXVE0ttfQb3Z2ci9cz7FHF4zmbHbXs7WW3pgWo1tW+lxGaZ1Z
   mGB1Ulhu8PH4RiA6X52SIBkJbagUlaBabM15f/ZVvzpoDJridSVfrz2oz
   o0P99CtyUrq/IFyY1TwsZvc5ZrtmtqgYYvcBYZg45WL3mMYDqnbnT1+X/
   JiOkuUiW68G6pqIJHd4sm7k4gkZSFv4T5DpblFYulgF3Rfoiiboz/0Bgm
   vLrt5xYeOKnhO7f+GmdL9XXScPBfV5z9c8NKnsFL7x2UGR8c2d9bcVb6h
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="432040537"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="432040537"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 01:18:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="762091750"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="762091750"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 27 Jul 2023 01:18:48 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qOwB0-000255-2K;
        Thu, 27 Jul 2023 08:18:11 +0000
Date:   Thu, 27 Jul 2023 16:16:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [sailus-media-tree:master 10/20] drivers/media/i2c/imx290.c:1526:17:
 warning: incompatible integer to pointer conversion assigning to 'struct
 regmap *' from 'int'
Message-ID: <202307271639.6vSx9BOA-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   git://linuxtv.org/sailus/media_tree.git master
head:   215e4463b11d94668b841368cb6882f3a2968148
commit: 51b1f81e3b15a4cf6c5c1bfd6bb14ff8bc9951fb [10/20] media: imx290: Convert to new CCI register access helpers
config: arm-randconfig-r012-20230727 (https://download.01.org/0day-ci/archive/20230727/202307271639.6vSx9BOA-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307271639.6vSx9BOA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307271639.6vSx9BOA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/i2c/imx290.c:1526:19: error: implicit declaration of function 'devm_cci_regmap_init_i2c' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           imx290->regmap = devm_cci_regmap_init_i2c(client, 16);
                            ^
   drivers/media/i2c/imx290.c:1526:19: note: did you mean '__devm_regmap_init_i2c'?
   include/linux/regmap.h:660:16: note: '__devm_regmap_init_i2c' declared here
   struct regmap *__devm_regmap_init_i2c(struct i2c_client *i2c,
                  ^
>> drivers/media/i2c/imx290.c:1526:17: warning: incompatible integer to pointer conversion assigning to 'struct regmap *' from 'int' [-Wint-conversion]
           imx290->regmap = devm_cci_regmap_init_i2c(client, 16);
                          ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +1526 drivers/media/i2c/imx290.c

  1514	
  1515	static int imx290_probe(struct i2c_client *client)
  1516	{
  1517		struct device *dev = &client->dev;
  1518		struct imx290 *imx290;
  1519		int ret;
  1520	
  1521		imx290 = devm_kzalloc(dev, sizeof(*imx290), GFP_KERNEL);
  1522		if (!imx290)
  1523			return -ENOMEM;
  1524	
  1525		imx290->dev = dev;
> 1526		imx290->regmap = devm_cci_regmap_init_i2c(client, 16);
  1527		if (IS_ERR(imx290->regmap)) {
  1528			dev_err(dev, "Unable to initialize I2C\n");
  1529			return -ENODEV;
  1530		}
  1531	
  1532		ret = imx290_parse_dt(imx290);
  1533		if (ret)
  1534			return ret;
  1535	
  1536		/* Acquire resources. */
  1537		imx290->xclk = devm_clk_get(dev, "xclk");
  1538		if (IS_ERR(imx290->xclk))
  1539			return dev_err_probe(dev, PTR_ERR(imx290->xclk),
  1540					     "Could not get xclk\n");
  1541	
  1542		ret = imx290_get_regulators(dev, imx290);
  1543		if (ret < 0)
  1544			return dev_err_probe(dev, ret, "Cannot get regulators\n");
  1545	
  1546		imx290->rst_gpio = devm_gpiod_get_optional(dev, "reset",
  1547							   GPIOD_OUT_HIGH);
  1548		if (IS_ERR(imx290->rst_gpio))
  1549			return dev_err_probe(dev, PTR_ERR(imx290->rst_gpio),
  1550					     "Cannot get reset gpio\n");
  1551	
  1552		/* Initialize external clock frequency. */
  1553		ret = imx290_init_clk(imx290);
  1554		if (ret)
  1555			return ret;
  1556	
  1557		/*
  1558		 * Enable power management. The driver supports runtime PM, but needs to
  1559		 * work when runtime PM is disabled in the kernel. To that end, power
  1560		 * the sensor on manually here.
  1561		 */
  1562		ret = imx290_power_on(imx290);
  1563		if (ret < 0) {
  1564			dev_err(dev, "Could not power on the device\n");
  1565			return ret;
  1566		}
  1567	
  1568		/*
  1569		 * Enable runtime PM with autosuspend. As the device has been powered
  1570		 * manually, mark it as active, and increase the usage count without
  1571		 * resuming the device.
  1572		 */
  1573		pm_runtime_set_active(dev);
  1574		pm_runtime_get_noresume(dev);
  1575		pm_runtime_enable(dev);
  1576		pm_runtime_set_autosuspend_delay(dev, 1000);
  1577		pm_runtime_use_autosuspend(dev);
  1578	
  1579		/* Initialize the V4L2 subdev. */
  1580		ret = imx290_subdev_init(imx290);
  1581		if (ret)
  1582			goto err_pm;
  1583	
  1584		v4l2_i2c_subdev_set_name(&imx290->sd, client,
  1585					 imx290->model->name, NULL);
  1586	
  1587		/*
  1588		 * Finally, register the V4L2 subdev. This must be done after
  1589		 * initializing everything as the subdev can be used immediately after
  1590		 * being registered.
  1591		 */
  1592		ret = v4l2_async_register_subdev(&imx290->sd);
  1593		if (ret < 0) {
  1594			dev_err(dev, "Could not register v4l2 device\n");
  1595			goto err_subdev;
  1596		}
  1597	
  1598		/*
  1599		 * Decrease the PM usage count. The device will get suspended after the
  1600		 * autosuspend delay, turning the power off.
  1601		 */
  1602		pm_runtime_mark_last_busy(dev);
  1603		pm_runtime_put_autosuspend(dev);
  1604	
  1605		return 0;
  1606	
  1607	err_subdev:
  1608		imx290_subdev_cleanup(imx290);
  1609	err_pm:
  1610		pm_runtime_disable(dev);
  1611		pm_runtime_put_noidle(dev);
  1612		imx290_power_off(imx290);
  1613		return ret;
  1614	}
  1615	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
