Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57FE971799B
	for <lists+linux-media@lfdr.de>; Wed, 31 May 2023 10:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235085AbjEaIHY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 May 2023 04:07:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235164AbjEaIHI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 May 2023 04:07:08 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3201010F;
        Wed, 31 May 2023 01:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685520427; x=1717056427;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sD8tR7xGr11GazEnG0zFetQQVWo03MeIslB1MED6PzY=;
  b=XiuIWkBg3acc5Hxb5QfUl4HA/2xmmdXzL06Inx7OwLhQDf25O9dtlElL
   GNuWjI9cwjOzStFFJopEKOznHohHBYOU6tDco3EyFNKS1OAAT8pGhWlfW
   ZT9mkLZM3rfcBBRwCZtHIxmtUTjKCwqTJ+TVtjDUmoUIAOwa8+gTMCISc
   rNm6S/nen1RquGRMxaxR7YQBonxUhQucPWOEK8q/hf9RwQAirTgMKpsWa
   dZ67P6nwyYgiVw+clU3yoSnBl4mv0ti8lQH+3BD4r6nA+qML83CpXIhRP
   hwQzOJzM137qYv6JsRsvsajPUZPVZWu0JWEGtily8kA97V2Fb24s+fSju
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="441526409"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="441526409"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 01:07:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="776679916"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="776679916"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 31 May 2023 01:07:04 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q4GrI-0001Ax-0h;
        Wed, 31 May 2023 08:07:04 +0000
Date:   Wed, 31 May 2023 16:07:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     oe-kbuild-all@lists.linux.dev,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 09/21] media: i2c: imx258: Add support for running on 2
 CSI data lanes
Message-ID: <202305311525.0POx1Mzk-lkp@intel.com>
References: <20230530173000.3060865-10-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530173000.3060865-10-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linus/master v6.4-rc4 next-20230531]
[cannot apply to robh/for-next sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Stevenson/media-i2c-imx258-Remove-unused-defines/20230531-013342
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230530173000.3060865-10-dave.stevenson%40raspberrypi.com
patch subject: [PATCH 09/21] media: i2c: imx258: Add support for running on 2 CSI data lanes
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230531/202305311525.0POx1Mzk-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e3fbe7eaf1c1b9f3b031308dbd3433a982bd3fe6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dave-Stevenson/media-i2c-imx258-Remove-unused-defines/20230531-013342
        git checkout e3fbe7eaf1c1b9f3b031308dbd3433a982bd3fe6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/media/i2c/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305311525.0POx1Mzk-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/i2c/imx258.c: In function 'imx258_probe':
>> drivers/media/i2c/imx258.c:1417:35: error: passing argument 1 of 'v4l2_fwnode_endpoint_free' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1417 |         v4l2_fwnode_endpoint_free(&endpoint);
         |                                   ^~~~~~~~~
         |                                   |
         |                                   struct fwnode_handle **
   In file included from drivers/media/i2c/imx258.c:13:
   include/media/v4l2-fwnode.h:239:61: note: expected 'struct v4l2_fwnode_endpoint *' but argument is of type 'struct fwnode_handle **'
     239 | void v4l2_fwnode_endpoint_free(struct v4l2_fwnode_endpoint *vep);
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   cc1: some warnings being treated as errors


vim +/v4l2_fwnode_endpoint_free +1417 drivers/media/i2c/imx258.c

  1303	
  1304	static int imx258_probe(struct i2c_client *client)
  1305	{
  1306		struct imx258 *imx258;
  1307		struct fwnode_handle *endpoint;
  1308		struct v4l2_fwnode_endpoint ep = {
  1309			.bus_type = V4L2_MBUS_CSI2_DPHY
  1310		};
  1311		int ret;
  1312		u32 val = 0;
  1313	
  1314		imx258 = devm_kzalloc(&client->dev, sizeof(*imx258), GFP_KERNEL);
  1315		if (!imx258)
  1316			return -ENOMEM;
  1317	
  1318		ret = imx258_get_regulators(imx258, client);
  1319		if (ret)
  1320			return ret;
  1321	
  1322		imx258->clk = devm_clk_get_optional(&client->dev, NULL);
  1323		if (IS_ERR(imx258->clk))
  1324			return dev_err_probe(&client->dev, PTR_ERR(imx258->clk),
  1325					     "error getting clock\n");
  1326		if (!imx258->clk) {
  1327			dev_dbg(&client->dev,
  1328				"no clock provided, using clock-frequency property\n");
  1329	
  1330			device_property_read_u32(&client->dev, "clock-frequency", &val);
  1331		} else if (IS_ERR(imx258->clk)) {
  1332			return dev_err_probe(&client->dev, PTR_ERR(imx258->clk),
  1333					     "error getting clock\n");
  1334		} else {
  1335			val = clk_get_rate(imx258->clk);
  1336		}
  1337	
  1338		switch (val) {
  1339		case 19200000:
  1340			imx258->link_freq_configs = link_freq_configs_19_2;
  1341			imx258->link_freq_menu_items = link_freq_menu_items_19_2;
  1342			break;
  1343		case 24000000:
  1344			imx258->link_freq_configs = link_freq_configs_24;
  1345			imx258->link_freq_menu_items = link_freq_menu_items_24;
  1346			break;
  1347		default:
  1348			dev_err(&client->dev, "input clock frequency of %u not supported\n",
  1349				val);
  1350			return -EINVAL;
  1351		}
  1352	
  1353		endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev), NULL);
  1354		if (!endpoint) {
  1355			dev_err(&client->dev, "Endpoint node not found\n");
  1356			return -EINVAL;
  1357		}
  1358	
  1359		ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep);
  1360		fwnode_handle_put(endpoint);
  1361		if (ret == -ENXIO) {
  1362			dev_err(&client->dev, "Unsupported bus type, should be CSI2\n");
  1363			goto error_endpoint_poweron;
  1364		} else if (ret) {
  1365			dev_err(&client->dev, "Parsing endpoint node failed\n");
  1366			goto error_endpoint_poweron;
  1367		}
  1368	
  1369		/* Get number of data lanes */
  1370		imx258->nlanes = ep.bus.mipi_csi2.num_data_lanes;
  1371		if (imx258->nlanes != 2 && imx258->nlanes != 4) {
  1372			dev_err(&client->dev, "Invalid data lanes: %u\n",
  1373				imx258->nlanes);
  1374			ret = -EINVAL;
  1375			goto error_endpoint_poweron;
  1376		}
  1377	
  1378		/* Initialize subdev */
  1379		v4l2_i2c_subdev_init(&imx258->sd, client, &imx258_subdev_ops);
  1380	
  1381		/* Will be powered off via pm_runtime_idle */
  1382		ret = imx258_power_on(&client->dev);
  1383		if (ret)
  1384			goto error_endpoint_poweron;
  1385	
  1386		/* Check module identity */
  1387		ret = imx258_identify_module(imx258);
  1388		if (ret)
  1389			goto error_identify;
  1390	
  1391		/* Set default mode to max resolution */
  1392		imx258->cur_mode = &supported_modes[0];
  1393	
  1394		ret = imx258_init_controls(imx258);
  1395		if (ret)
  1396			goto error_identify;
  1397	
  1398		/* Initialize subdev */
  1399		imx258->sd.internal_ops = &imx258_internal_ops;
  1400		imx258->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
  1401		imx258->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
  1402	
  1403		/* Initialize source pad */
  1404		imx258->pad.flags = MEDIA_PAD_FL_SOURCE;
  1405	
  1406		ret = media_entity_pads_init(&imx258->sd.entity, 1, &imx258->pad);
  1407		if (ret)
  1408			goto error_handler_free;
  1409	
  1410		ret = v4l2_async_register_subdev_sensor(&imx258->sd);
  1411		if (ret < 0)
  1412			goto error_media_entity;
  1413	
  1414		pm_runtime_set_active(&client->dev);
  1415		pm_runtime_enable(&client->dev);
  1416		pm_runtime_idle(&client->dev);
> 1417		v4l2_fwnode_endpoint_free(&endpoint);
  1418	
  1419		return 0;
  1420	
  1421	error_media_entity:
  1422		media_entity_cleanup(&imx258->sd.entity);
  1423	
  1424	error_handler_free:
  1425		imx258_free_controls(imx258);
  1426	
  1427	error_identify:
  1428		imx258_power_off(&client->dev);
  1429	
  1430	error_endpoint_poweron:
  1431		v4l2_fwnode_endpoint_free(&ep);
  1432	
  1433		return ret;
  1434	}
  1435	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
