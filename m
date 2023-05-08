Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68DEC6FAE76
	for <lists+linux-media@lfdr.de>; Mon,  8 May 2023 13:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236258AbjEHLpC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 May 2023 07:45:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236311AbjEHLoj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 May 2023 07:44:39 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77D4E10A02
        for <linux-media@vger.kernel.org>; Mon,  8 May 2023 04:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683546249; x=1715082249;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EaeXkgnPAHHr24wExW0Qm/7g9X9Q0JsJ6bCN3Imb+NQ=;
  b=PwZtesYa3GZ1VATeLoITkcayMbSRJhZAh92h6qHMPNW7rkzHh3+MBWMl
   mf8m0vgygMvDq2x7RR7hwtABeMfNlaRl6QuYFrjCjm8hPCW+mxsqDEV1K
   q8MblT5juVloyYdp7dn7W38Z2WDTouy4+91dLFfcgBYiGDH4KhaoQ4eXf
   0vB84jGsAlqDYz/Rjiaa7tJkNsOscbG+dGoByp9qm4YMcKEoWur/bryby
   zf1aQ9aJ3WaTqq5TsX79VH73ctgXGwT+J5NT45ssl9yHhydAd7dURtHou
   iYEgzhIjjvadV7RYKQAaZHzS9ApuIYB88B+TQr272JEPe1eOBXXpLlzO9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="329245179"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="329245179"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 04:43:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="788065041"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="788065041"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 08 May 2023 04:43:32 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pvzH9-0001DV-0T;
        Mon, 08 May 2023 11:43:31 +0000
Date:   Mon, 8 May 2023 19:42:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     oe-kbuild-all@lists.linux.dev, laurent.pinchart@ideasonboard.com,
        bingbu.cao@intel.com
Subject: Re: [PATCH 3/3] media: uapi: Use _BITUL macro for assigning bits in
 u32 fields
Message-ID: <202305081924.hCNE42mH-lkp@intel.com>
References: <20230508091753.80803-4-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508091753.80803-4-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linus/master sailus-media-tree/streams v6.4-rc1 next-20230508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-mc-Make-media_get_pad_index-use-pad-type-flag/20230508-173012
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230508091753.80803-4-sakari.ailus%40linux.intel.com
patch subject: [PATCH 3/3] media: uapi: Use _BITUL macro for assigning bits in u32 fields
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230508/202305081924.hCNE42mH-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1462451478f4e2ce6cc6364c2c8aacdb2db57d6b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sakari-Ailus/media-mc-Make-media_get_pad_index-use-pad-type-flag/20230508-173012
        git checkout 1462451478f4e2ce6cc6364c2c8aacdb2db57d6b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/media/i2c/ drivers/media/platform/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305081924.hCNE42mH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:15,
                    from include/linux/i2c.h:13,
                    from drivers/media/i2c/tvp5150.c:8:
   drivers/media/i2c/tvp5150.c: In function 'tvp5150_link_setup':
>> drivers/media/i2c/tvp5150.c:1332:40: warning: format '%d' expects argument of type 'int', but argument 8 has type 'long unsigned int' [-Wformat=]
    1332 |         dev_dbg_lvl(sd->dev, 1, debug, "link setup '%s':%d->'%s':%d[%d]",
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:129:41: note: in definition of macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                         ^~~
   drivers/media/i2c/tvp5150.c:1332:9: note: in expansion of macro 'dev_dbg_lvl'
    1332 |         dev_dbg_lvl(sd->dev, 1, debug, "link setup '%s':%d->'%s':%d[%d]",
         |         ^~~~~~~~~~~
   drivers/media/i2c/tvp5150.c:1332:70: note: format string is defined here
    1332 |         dev_dbg_lvl(sd->dev, 1, debug, "link setup '%s':%d->'%s':%d[%d]",
         |                                                                     ~^
         |                                                                      |
         |                                                                      int
         |                                                                     %ld
   drivers/media/i2c/tvp5150.c:1338:29: warning: format '%d' expects argument of type 'int', but argument 8 has type 'long unsigned int' [-Wformat=]
    1338 |                             "link setup '%s':%d->'%s':%d[%d]",
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:129:41: note: in definition of macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                         ^~~
   drivers/media/i2c/tvp5150.c:1337:17: note: in expansion of macro 'dev_dbg_lvl'
    1337 |                 dev_dbg_lvl(sd->dev, 1, debug,
         |                 ^~~~~~~~~~~
   drivers/media/i2c/tvp5150.c:1338:59: note: format string is defined here
    1338 |                             "link setup '%s':%d->'%s':%d[%d]",
         |                                                          ~^
         |                                                           |
         |                                                           int
         |                                                          %ld
--
   In file included from include/linux/printk.h:564,
                    from include/asm-generic/bug.h:22,
                    from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:16,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/mm_types_task.h:13,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from drivers/media/platform/video-mux.c:10:
   drivers/media/platform/video-mux.c: In function 'video_mux_link_setup':
>> drivers/media/platform/video-mux.c:67:26: warning: format '%d' expects argument of type 'int', but argument 8 has type 'long unsigned int' [-Wformat=]
      67 |         dev_dbg(sd->dev, "link setup '%s':%d->'%s':%d[%d]",
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:223:29: note: in definition of macro '__dynamic_func_call_cls'
     223 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:272:9: note: in expansion of macro '_dynamic_func_call'
     272 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/media/platform/video-mux.c:67:9: note: in expansion of macro 'dev_dbg'
      67 |         dev_dbg(sd->dev, "link setup '%s':%d->'%s':%d[%d]",
         |         ^~~~~~~
   drivers/media/platform/video-mux.c:67:56: note: format string is defined here
      67 |         dev_dbg(sd->dev, "link setup '%s':%d->'%s':%d[%d]",
         |                                                       ~^
         |                                                        |
         |                                                        int
         |                                                       %ld


vim +1332 drivers/media/i2c/tvp5150.c

0556f1d580d4c1 Marco Felsch 2020-03-12  1299  
0556f1d580d4c1 Marco Felsch 2020-03-12  1300  static int tvp5150_s_routing(struct v4l2_subdev *sd, u32 input, u32 output,
0556f1d580d4c1 Marco Felsch 2020-03-12  1301  			     u32 config);
0556f1d580d4c1 Marco Felsch 2020-03-12  1302  
0556f1d580d4c1 Marco Felsch 2020-03-12  1303  static int tvp5150_link_setup(struct media_entity *entity,
0556f1d580d4c1 Marco Felsch 2020-03-12  1304  			      const struct media_pad *tvp5150_pad,
0556f1d580d4c1 Marco Felsch 2020-03-12  1305  			      const struct media_pad *remote, u32 flags)
0556f1d580d4c1 Marco Felsch 2020-03-12  1306  {
0556f1d580d4c1 Marco Felsch 2020-03-12  1307  	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
0556f1d580d4c1 Marco Felsch 2020-03-12  1308  	struct tvp5150 *decoder = to_tvp5150(sd);
0556f1d580d4c1 Marco Felsch 2020-03-12  1309  	struct media_pad *other_tvp5150_pad =
0556f1d580d4c1 Marco Felsch 2020-03-12  1310  		&decoder->pads[tvp5150_pad->index ^ 1];
0556f1d580d4c1 Marco Felsch 2020-03-12  1311  	struct v4l2_fwnode_connector *v4l2c;
0556f1d580d4c1 Marco Felsch 2020-03-12  1312  	bool is_svideo = false;
0556f1d580d4c1 Marco Felsch 2020-03-12  1313  	unsigned int i;
0556f1d580d4c1 Marco Felsch 2020-03-12  1314  	int err;
0556f1d580d4c1 Marco Felsch 2020-03-12  1315  
0556f1d580d4c1 Marco Felsch 2020-03-12  1316  	/*
0556f1d580d4c1 Marco Felsch 2020-03-12  1317  	 * The TVP5150 state is determined by the enabled sink pad link(s).
0556f1d580d4c1 Marco Felsch 2020-03-12  1318  	 * Enabling or disabling the source pad link has no effect.
0556f1d580d4c1 Marco Felsch 2020-03-12  1319  	 */
0556f1d580d4c1 Marco Felsch 2020-03-12  1320  	if (tvp5150_pad->flags & MEDIA_PAD_FL_SOURCE)
0556f1d580d4c1 Marco Felsch 2020-03-12  1321  		return 0;
0556f1d580d4c1 Marco Felsch 2020-03-12  1322  
0556f1d580d4c1 Marco Felsch 2020-03-12  1323  	/* Check if the svideo connector should be enabled */
0556f1d580d4c1 Marco Felsch 2020-03-12  1324  	for (i = 0; i < decoder->connectors_num; i++) {
0556f1d580d4c1 Marco Felsch 2020-03-12  1325  		if (remote->entity == &decoder->connectors[i].ent) {
0556f1d580d4c1 Marco Felsch 2020-03-12  1326  			v4l2c = &decoder->connectors[i].base;
0556f1d580d4c1 Marco Felsch 2020-03-12  1327  			is_svideo = v4l2c->type == V4L2_CONN_SVIDEO;
0556f1d580d4c1 Marco Felsch 2020-03-12  1328  			break;
0556f1d580d4c1 Marco Felsch 2020-03-12  1329  		}
0556f1d580d4c1 Marco Felsch 2020-03-12  1330  	}
0556f1d580d4c1 Marco Felsch 2020-03-12  1331  
0556f1d580d4c1 Marco Felsch 2020-03-12 @1332  	dev_dbg_lvl(sd->dev, 1, debug, "link setup '%s':%d->'%s':%d[%d]",
0556f1d580d4c1 Marco Felsch 2020-03-12  1333  		    remote->entity->name, remote->index,
0556f1d580d4c1 Marco Felsch 2020-03-12  1334  		    tvp5150_pad->entity->name, tvp5150_pad->index,
0556f1d580d4c1 Marco Felsch 2020-03-12  1335  		    flags & MEDIA_LNK_FL_ENABLED);
0556f1d580d4c1 Marco Felsch 2020-03-12  1336  	if (is_svideo)
0556f1d580d4c1 Marco Felsch 2020-03-12  1337  		dev_dbg_lvl(sd->dev, 1, debug,
0556f1d580d4c1 Marco Felsch 2020-03-12  1338  			    "link setup '%s':%d->'%s':%d[%d]",
0556f1d580d4c1 Marco Felsch 2020-03-12  1339  			    remote->entity->name, remote->index,
0556f1d580d4c1 Marco Felsch 2020-03-12  1340  			    other_tvp5150_pad->entity->name,
0556f1d580d4c1 Marco Felsch 2020-03-12  1341  			    other_tvp5150_pad->index,
0556f1d580d4c1 Marco Felsch 2020-03-12  1342  			    flags & MEDIA_LNK_FL_ENABLED);
0556f1d580d4c1 Marco Felsch 2020-03-12  1343  
0556f1d580d4c1 Marco Felsch 2020-03-12  1344  	/*
0556f1d580d4c1 Marco Felsch 2020-03-12  1345  	 * The TVP5150 has an internal mux which allows the following setup:
0556f1d580d4c1 Marco Felsch 2020-03-12  1346  	 *
0556f1d580d4c1 Marco Felsch 2020-03-12  1347  	 * comp-connector1  --\
0556f1d580d4c1 Marco Felsch 2020-03-12  1348  	 *		       |---> AIP1A
0556f1d580d4c1 Marco Felsch 2020-03-12  1349  	 *		      /
0556f1d580d4c1 Marco Felsch 2020-03-12  1350  	 * svideo-connector -|
0556f1d580d4c1 Marco Felsch 2020-03-12  1351  	 *		      \
0556f1d580d4c1 Marco Felsch 2020-03-12  1352  	 *		       |---> AIP1B
0556f1d580d4c1 Marco Felsch 2020-03-12  1353  	 * comp-connector2  --/
0556f1d580d4c1 Marco Felsch 2020-03-12  1354  	 *
0556f1d580d4c1 Marco Felsch 2020-03-12  1355  	 * We can't rely on user space that the current connector gets disabled
0556f1d580d4c1 Marco Felsch 2020-03-12  1356  	 * first before enabling the new connector. Disable all active
0556f1d580d4c1 Marco Felsch 2020-03-12  1357  	 * connector links to be on the safe side.
0556f1d580d4c1 Marco Felsch 2020-03-12  1358  	 */
0556f1d580d4c1 Marco Felsch 2020-03-12  1359  	err = tvp5150_disable_all_input_links(decoder);
0556f1d580d4c1 Marco Felsch 2020-03-12  1360  	if (err)
0556f1d580d4c1 Marco Felsch 2020-03-12  1361  		return err;
0556f1d580d4c1 Marco Felsch 2020-03-12  1362  
0556f1d580d4c1 Marco Felsch 2020-03-12  1363  	tvp5150_s_routing(sd, is_svideo ? TVP5150_SVIDEO : tvp5150_pad->index,
0556f1d580d4c1 Marco Felsch 2020-03-12  1364  			  flags & MEDIA_LNK_FL_ENABLED ? TVP5150_NORMAL :
0556f1d580d4c1 Marco Felsch 2020-03-12  1365  			  TVP5150_BLACK_SCREEN, 0);
0556f1d580d4c1 Marco Felsch 2020-03-12  1366  
0556f1d580d4c1 Marco Felsch 2020-03-12  1367  	if (flags & MEDIA_LNK_FL_ENABLED) {
baf178219478c2 Marco Felsch 2020-03-12  1368  		struct v4l2_fwnode_connector_analog *v4l2ca;
baf178219478c2 Marco Felsch 2020-03-12  1369  		u32 new_norm;
baf178219478c2 Marco Felsch 2020-03-12  1370  
0556f1d580d4c1 Marco Felsch 2020-03-12  1371  		/*
0556f1d580d4c1 Marco Felsch 2020-03-12  1372  		 * S-Video connector is conneted to both ports AIP1A and AIP1B.
0556f1d580d4c1 Marco Felsch 2020-03-12  1373  		 * Both links must be enabled in one-shot regardless which link
0556f1d580d4c1 Marco Felsch 2020-03-12  1374  		 * the user requests.
0556f1d580d4c1 Marco Felsch 2020-03-12  1375  		 */
0556f1d580d4c1 Marco Felsch 2020-03-12  1376  		if (is_svideo) {
0556f1d580d4c1 Marco Felsch 2020-03-12  1377  			err = tvp5150_set_link((struct media_pad *)remote,
0556f1d580d4c1 Marco Felsch 2020-03-12  1378  					       other_tvp5150_pad, flags);
0556f1d580d4c1 Marco Felsch 2020-03-12  1379  			if (err)
0556f1d580d4c1 Marco Felsch 2020-03-12  1380  				return err;
0556f1d580d4c1 Marco Felsch 2020-03-12  1381  		}
baf178219478c2 Marco Felsch 2020-03-12  1382  
baf178219478c2 Marco Felsch 2020-03-12  1383  		if (!decoder->connectors_num)
baf178219478c2 Marco Felsch 2020-03-12  1384  			return 0;
baf178219478c2 Marco Felsch 2020-03-12  1385  
baf178219478c2 Marco Felsch 2020-03-12  1386  		/* Update the current connector */
baf178219478c2 Marco Felsch 2020-03-12  1387  		decoder->cur_connector =
baf178219478c2 Marco Felsch 2020-03-12  1388  			container_of(remote, struct tvp5150_connector, pad);
baf178219478c2 Marco Felsch 2020-03-12  1389  
baf178219478c2 Marco Felsch 2020-03-12  1390  		/*
baf178219478c2 Marco Felsch 2020-03-12  1391  		 * Do nothing if the new connector supports the same tv-norms as
baf178219478c2 Marco Felsch 2020-03-12  1392  		 * the old one.
baf178219478c2 Marco Felsch 2020-03-12  1393  		 */
baf178219478c2 Marco Felsch 2020-03-12  1394  		v4l2ca = &decoder->cur_connector->base.connector.analog;
baf178219478c2 Marco Felsch 2020-03-12  1395  		new_norm = decoder->norm & v4l2ca->sdtv_stds;
baf178219478c2 Marco Felsch 2020-03-12  1396  		if (decoder->norm == new_norm)
baf178219478c2 Marco Felsch 2020-03-12  1397  			return 0;
baf178219478c2 Marco Felsch 2020-03-12  1398  
baf178219478c2 Marco Felsch 2020-03-12  1399  		/*
baf178219478c2 Marco Felsch 2020-03-12  1400  		 * Fallback to the new connector tv-norms if we can't find any
baf178219478c2 Marco Felsch 2020-03-12  1401  		 * common between the current tv-norm and the new one.
baf178219478c2 Marco Felsch 2020-03-12  1402  		 */
baf178219478c2 Marco Felsch 2020-03-12  1403  		tvp5150_s_std(sd, new_norm ? new_norm : v4l2ca->sdtv_stds);
0556f1d580d4c1 Marco Felsch 2020-03-12  1404  	}
0556f1d580d4c1 Marco Felsch 2020-03-12  1405  
0556f1d580d4c1 Marco Felsch 2020-03-12  1406  	return 0;
0556f1d580d4c1 Marco Felsch 2020-03-12  1407  }
0556f1d580d4c1 Marco Felsch 2020-03-12  1408  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
