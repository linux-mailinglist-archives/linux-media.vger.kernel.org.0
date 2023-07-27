Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB7D0765012
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 11:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232172AbjG0Jng (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jul 2023 05:43:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233787AbjG0JnX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jul 2023 05:43:23 -0400
Received: from mgamail.intel.com (unknown [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95B7130FC
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 02:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690450967; x=1721986967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d+K0scrOmf7UQ815GWB56h6hLf/UpiBYm+EwNQoVCtU=;
  b=EoLaUVgM4cTPSLss/69VTT+kzwn3kQVisqDokYCBZNAgGsHJShBcsVPS
   BL0WU8+fHQrUEHQ3ehZ4IVdVdFMEbnbBm9KxON/7faeU/RqE7ACmsVEkI
   82s5epaorIQSmFnVoBgs/qfDRK6qc2FeZvlpW6HH1vGF6h5zNP5ACrkV6
   fJLdlgTcjUuHO841+Is4PPU/5h83PgScXpLR1b1BiftmUYlRMhPPYwxB6
   jFaGHxq2fUE7aLhbSrmuoJHXcWMN7WFtxHGZwTyKjBeplvbAZh2xaxQyC
   hG8Ew1HM13vcU73KZhKxBt9pqsFnMP4ybARq2BGn3bInKK8QJg9N0itGC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="353164697"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="353164697"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 02:42:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="677088052"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="677088052"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 27 Jul 2023 02:42:45 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qOxVC-00029B-2a;
        Thu, 27 Jul 2023 09:42:00 +0000
Date:   Thu, 27 Jul 2023 17:40:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [sailus-media-tree:master 10/20] drivers/media/i2c/imx290.c:1526:26:
 error: implicit declaration of function 'devm_cci_regmap_init_i2c'; did you
 mean 'devm_regmap_init_i2c'?
Message-ID: <202307271727.smfo1zYW-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   git://linuxtv.org/sailus/media_tree.git master
head:   215e4463b11d94668b841368cb6882f3a2968148
commit: 51b1f81e3b15a4cf6c5c1bfd6bb14ff8bc9951fb [10/20] media: imx290: Convert to new CCI register access helpers
config: mips-randconfig-r034-20230727 (https://download.01.org/0day-ci/archive/20230727/202307271727.smfo1zYW-lkp@intel.com/config)
compiler: mips64el-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307271727.smfo1zYW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307271727.smfo1zYW-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/media/i2c/imx290.c: In function 'imx290_probe':
>> drivers/media/i2c/imx290.c:1526:26: error: implicit declaration of function 'devm_cci_regmap_init_i2c'; did you mean 'devm_regmap_init_i2c'? [-Werror=implicit-function-declaration]
    1526 |         imx290->regmap = devm_cci_regmap_init_i2c(client, 16);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
         |                          devm_regmap_init_i2c
>> drivers/media/i2c/imx290.c:1526:24: warning: assignment to 'struct regmap *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1526 |         imx290->regmap = devm_cci_regmap_init_i2c(client, 16);
         |                        ^
   cc1: some warnings being treated as errors


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
