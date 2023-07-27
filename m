Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED246764905
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 09:42:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231700AbjG0Hl7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jul 2023 03:41:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233082AbjG0Hlo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jul 2023 03:41:44 -0400
Received: from mgamail.intel.com (unknown [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 194F359DE
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 00:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690443323; x=1721979323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m62EafBUUGnvw65JvFV5yDJjSwgYCCFo1q/imM6cWiA=;
  b=Un7QqIApzSSpsymRAKWX6sxP0hJAlSWzM0OW/9oM+qIye5pZ6rgTzl9z
   uNYUZH9NEkk6CkZ/gyu0rfdT1PQuMj8n/gUBFBUjldtsaWa8k9NekgJjs
   i8LUf6UJBJO1VaIV3LozHRKiNhLa+1JrAPPSzB8WaCLhpyKCZZpjUJBmU
   2YKKnF7WvYr/bFa2z8nSDRXOtNTVxytdqI0EaCjTq8zCHQpoAbggOwoO/
   lehzPHbpMVwuD7bHlWQSkIa3bcSE/qd89D9equxfyNd9IyuXg2rxFTXCQ
   Q3YTEFs04eW7qPbT3M8kFCRtUznD5FJXpE5s6mZiVahkZeuCgB7Cvso1Y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="454601935"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="454601935"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 00:34:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="756552160"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="756552160"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 27 Jul 2023 00:34:54 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qOvWG-00023X-2P;
        Thu, 27 Jul 2023 07:34:49 +0000
Date:   Thu, 27 Jul 2023 15:34:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [sailus-media-tree:master 9/20] drivers/media/i2c/ov5693.c:1280:17:
 warning: incompatible integer to pointer conversion assigning to 'struct
 regmap *' from 'int'
Message-ID: <202307271517.dPa1bTSi-lkp@intel.com>
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
commit: 6ca0d78da91133ec78ecfbdaa7d066849b1b0c0c [9/20] media: ov5693: Convert to new CCI register access helpers
config: arm-randconfig-r012-20230727 (https://download.01.org/0day-ci/archive/20230727/202307271517.dPa1bTSi-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307271517.dPa1bTSi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307271517.dPa1bTSi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/i2c/ov5693.c:1280:19: error: implicit declaration of function 'devm_cci_regmap_init_i2c' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           ov5693->regmap = devm_cci_regmap_init_i2c(client, 16);
                            ^
>> drivers/media/i2c/ov5693.c:1280:17: warning: incompatible integer to pointer conversion assigning to 'struct regmap *' from 'int' [-Wint-conversion]
           ov5693->regmap = devm_cci_regmap_init_i2c(client, 16);
                          ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +1280 drivers/media/i2c/ov5693.c

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
