Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F1DC764E62
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 10:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234046AbjG0I7K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jul 2023 04:59:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234081AbjG0I6w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jul 2023 04:58:52 -0400
Received: from mgamail.intel.com (unknown [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4F217DA3
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 01:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690447129; x=1721983129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=875q4deKowZOgXcVZ0PGOQhpNTgtvcTIWp0/MmW4yhQ=;
  b=iBRycCbux0K+eH18X9nirPMZxNzOIWpBBiuwqmUXkdut20ikCGGapMOr
   8echirG4z2VumzA3mhBImA54u45oErE2KyyMWS960r7MzVjDbCoLk8r3e
   WO+85SrAhOsVkG2izBUS4UNVL5MBmL3w4Gm7RKQaBCJq3KW9yKIiQu2gP
   PfzJO/QXpAfrmwDZAZp8ngvYlyY56FAS9EOGXhGXIi2bJb5IBbtwNcquu
   VsA+52thDL2VAyOSUJBCD6Xt9tn6SUwDAB85ld3JVGK5UYbw2izCqEPOy
   Izy5qddIpf23f0oNL09+oej/bacM7QoQsITy93QjRgShpVhemEqiXznd4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="399188189"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="399188189"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 01:38:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="792292883"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="792292883"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 27 Jul 2023 01:38:16 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qOwVh-000263-0P;
        Thu, 27 Jul 2023 08:38:14 +0000
Date:   Thu, 27 Jul 2023 16:37:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [sailus-media-tree:master 9/20] drivers/media/i2c/ov5693.c:1280:26:
 error: implicit declaration of function 'devm_cci_regmap_init_i2c'
Message-ID: <202307271623.kiFptZRi-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   git://linuxtv.org/sailus/media_tree.git master
head:   215e4463b11d94668b841368cb6882f3a2968148
commit: 6ca0d78da91133ec78ecfbdaa7d066849b1b0c0c [9/20] media: ov5693: Convert to new CCI register access helpers
config: mips-randconfig-r034-20230727 (https://download.01.org/0day-ci/archive/20230727/202307271623.kiFptZRi-lkp@intel.com/config)
compiler: mips64el-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307271623.kiFptZRi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307271623.kiFptZRi-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/media/i2c/ov5693.c: In function 'ov5693_probe':
>> drivers/media/i2c/ov5693.c:1280:26: error: implicit declaration of function 'devm_cci_regmap_init_i2c' [-Werror=implicit-function-declaration]
    1280 |         ov5693->regmap = devm_cci_regmap_init_i2c(client, 16);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/ov5693.c:1280:24: warning: assignment to 'struct regmap *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1280 |         ov5693->regmap = devm_cci_regmap_init_i2c(client, 16);
         |                        ^
   cc1: some warnings being treated as errors


vim +/devm_cci_regmap_init_i2c +1280 drivers/media/i2c/ov5693.c

  1267	
  1268	static int ov5693_probe(struct i2c_client *client)
  1269	{
  1270		struct ov5693_device *ov5693;
  1271		u32 xvclk_rate;
  1272		int ret = 0;
  1273	
  1274		ov5693 = devm_kzalloc(&client->dev, sizeof(*ov5693), GFP_KERNEL);
  1275		if (!ov5693)
  1276			return -ENOMEM;
  1277	
  1278		ov5693->dev = &client->dev;
  1279	
> 1280		ov5693->regmap = devm_cci_regmap_init_i2c(client, 16);
  1281		if (IS_ERR(ov5693->regmap))
  1282			return PTR_ERR(ov5693->regmap);
  1283	
  1284		ret = ov5693_check_hwcfg(ov5693);
  1285		if (ret)
  1286			return ret;
  1287	
  1288		mutex_init(&ov5693->lock);
  1289	
  1290		v4l2_i2c_subdev_init(&ov5693->sd, client, &ov5693_ops);
  1291	
  1292		ov5693->xvclk = devm_clk_get_optional(&client->dev, "xvclk");
  1293		if (IS_ERR(ov5693->xvclk))
  1294			return dev_err_probe(&client->dev, PTR_ERR(ov5693->xvclk),
  1295					     "failed to get xvclk: %ld\n",
  1296					     PTR_ERR(ov5693->xvclk));
  1297	
  1298		if (ov5693->xvclk) {
  1299			xvclk_rate = clk_get_rate(ov5693->xvclk);
  1300		} else {
  1301			ret = fwnode_property_read_u32(dev_fwnode(&client->dev),
  1302					     "clock-frequency",
  1303					     &xvclk_rate);
  1304	
  1305			if (ret) {
  1306				dev_err(&client->dev, "can't get clock frequency");
  1307				return ret;
  1308			}
  1309		}
  1310	
  1311		if (xvclk_rate != OV5693_XVCLK_FREQ)
  1312			dev_warn(&client->dev, "Found clk freq %u, expected %u\n",
  1313				 xvclk_rate, OV5693_XVCLK_FREQ);
  1314	
  1315		ret = ov5693_configure_gpios(ov5693);
  1316		if (ret)
  1317			return ret;
  1318	
  1319		ret = ov5693_get_regulators(ov5693);
  1320		if (ret)
  1321			return dev_err_probe(&client->dev, ret,
  1322					     "Error fetching regulators\n");
  1323	
  1324		ov5693->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
  1325		ov5693->pad.flags = MEDIA_PAD_FL_SOURCE;
  1326		ov5693->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
  1327	
  1328		ov5693->mode.crop = ov5693_default_crop;
  1329		ov5693->mode.format = ov5693_default_fmt;
  1330		ov5693->mode.vts = __ov5693_calc_vts(ov5693->mode.format.height);
  1331	
  1332		ret = ov5693_init_controls(ov5693);
  1333		if (ret)
  1334			return ret;
  1335	
  1336		ret = media_entity_pads_init(&ov5693->sd.entity, 1, &ov5693->pad);
  1337		if (ret)
  1338			goto err_ctrl_handler_free;
  1339	
  1340		/*
  1341		 * We need the driver to work in the event that pm runtime is disable in
  1342		 * the kernel, so power up and verify the chip now. In the event that
  1343		 * runtime pm is disabled this will leave the chip on, so that streaming
  1344		 * will work.
  1345		 */
  1346	
  1347		ret = ov5693_sensor_powerup(ov5693);
  1348		if (ret)
  1349			goto err_media_entity_cleanup;
  1350	
  1351		ret = ov5693_detect(ov5693);
  1352		if (ret)
  1353			goto err_powerdown;
  1354	
  1355		pm_runtime_set_active(&client->dev);
  1356		pm_runtime_get_noresume(&client->dev);
  1357		pm_runtime_enable(&client->dev);
  1358	
  1359		ret = v4l2_async_register_subdev_sensor(&ov5693->sd);
  1360		if (ret) {
  1361			dev_err(&client->dev, "failed to register V4L2 subdev: %d",
  1362				ret);
  1363			goto err_pm_runtime;
  1364		}
  1365	
  1366		pm_runtime_set_autosuspend_delay(&client->dev, 1000);
  1367		pm_runtime_use_autosuspend(&client->dev);
  1368		pm_runtime_put_autosuspend(&client->dev);
  1369	
  1370		return ret;
  1371	
  1372	err_pm_runtime:
  1373		pm_runtime_disable(&client->dev);
  1374		pm_runtime_put_noidle(&client->dev);
  1375	err_powerdown:
  1376		ov5693_sensor_powerdown(ov5693);
  1377	err_media_entity_cleanup:
  1378		media_entity_cleanup(&ov5693->sd.entity);
  1379	err_ctrl_handler_free:
  1380		v4l2_ctrl_handler_free(&ov5693->ctrls.handler);
  1381	
  1382		return ret;
  1383	}
  1384	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
