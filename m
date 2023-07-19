Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AD49758B86
	for <lists+linux-media@lfdr.de>; Wed, 19 Jul 2023 04:47:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbjGSCrj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jul 2023 22:47:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbjGSCrf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jul 2023 22:47:35 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BBD31BE4
        for <linux-media@vger.kernel.org>; Tue, 18 Jul 2023 19:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689734851; x=1721270851;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9r48n9dvMuyhp3ilAFRYXip4U0G99S3EWxnewwlAWaA=;
  b=JYmhTkYMKypKvbIi3Gji35g3bd7xHptiYWMpJER5Ea+E+USifGMhS424
   vy28KJ1BlDeheKo7j5DciGq/hh6DmfgQTC3eDzVEm+MocgLw1wzJtJviF
   MuU2CaUcKpttz2ERuaChOMSZ4kjM1PxaXrlp3ZoJcojRAJs1Bc2xKhyLQ
   RSQMVpl/ClMrsAsrpFyVHfFDWg9b7lIj3Y4lObWUXJthKqV3sy3nSR0br
   MgppATqlGdPlv68ourYJx0SVts0Tf4CvuxbTsDobngiLkEUIpEGR3p4XU
   uY4dgpMRhGqysGm9MCy5/HuO3YrK9HXmq73t13Kx0aexhKaYMQAX06Rx8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="366400736"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="366400736"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 19:47:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="847907103"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="847907103"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 18 Jul 2023 19:47:26 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qLxDp-00045H-1A;
        Wed, 19 Jul 2023 02:47:25 +0000
Date:   Wed, 19 Jul 2023 10:46:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-media@vger.kernel.org
Subject: [sailus-media-tree:async-multi 37/43]
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c:1511:47: error: too many
 arguments to function call, expected single argument 'notifier', have 2
 arguments
Message-ID: <202307191046.kAlYPKXg-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   git://linuxtv.org/sailus/media_tree.git async-multi
head:   fc1105d215634df27a5ff95ce8505d999e40d8b6
commit: 9604ccba9f23532d101b6fe34f95fa47b232317e [37/43] media: v4l: async: Set v4l2_device and subdev in async notifier init
config: i386-randconfig-i011-20230718 (https://download.01.org/0day-ci/archive/20230719/202307191046.kAlYPKXg-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191046.kAlYPKXg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191046.kAlYPKXg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/media/atomisp/pci/atomisp_v4l2.c:1511:47: error: too many arguments to function call, expected single argument 'notifier', have 2 arguments
           err = v4l2_async_nf_register(&isp->v4l2_dev, &isp->notifier);
                 ~~~~~~~~~~~~~~~~~~~~~~                 ^~~~~~~~~~~~~~
   include/media/v4l2-async.h:281:5: note: 'v4l2_async_nf_register' declared here
   int v4l2_async_nf_register(struct v4l2_async_notifier *notifier);
       ^
   1 error generated.
--
>> drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c:828:35: error: too few arguments to function call, expected 2, have 1
           v4l2_async_nf_init(&isp->notifier);
           ~~~~~~~~~~~~~~~~~~               ^
   include/media/v4l2-async.h:159:6: note: 'v4l2_async_nf_init' declared here
   void v4l2_async_nf_init(struct v4l2_async_notifier *notifier,
        ^
   1 error generated.


vim +/notifier +1511 drivers/staging/media/atomisp/pci/atomisp_v4l2.c

ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1235  
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1236  static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1237  {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1238  	const struct atomisp_platform_data *pdata;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1239  	struct atomisp_device *isp;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1240  	unsigned int start;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1241  	int err, val;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1242  	u32 irq;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1243  
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1244  	if (!is_valid_device(pdev, id))
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1245  		return -ENODEV;
ca133c395f2f6c drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Mauro Carvalho Chehab         2020-05-08  1246  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1247  	/* Pointer to struct device. */
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1248  	atomisp_dev = &pdev->dev;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1249  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1250  	pdata = atomisp_get_platform_data();
bdfe0beb95eebc drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1251  	if (!pdata)
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1252  		dev_warn(&pdev->dev, "no platform data available\n");
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1253  
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1254  	err = pcim_enable_device(pdev);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1255  	if (err) {
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1256  		dev_err(&pdev->dev, "Failed to enable CI ISP device (%d)\n", err);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1257  		return err;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1258  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1259  
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1260  	start = pci_resource_start(pdev, ATOM_ISP_PCI_BAR);
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1261  	dev_dbg(&pdev->dev, "start: 0x%x\n", start);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1262  
64288aa9e41990 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Moses Christopher Bollavarapu 2022-02-06  1263  	err = pcim_iomap_regions(pdev, BIT(ATOM_ISP_PCI_BAR), pci_name(pdev));
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1264  	if (err) {
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1265  		dev_err(&pdev->dev, "Failed to I/O memory remapping (%d)\n", err);
25bccb98ae05c0 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Mauro Carvalho Chehab         2020-05-08  1266  		goto ioremap_fail;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1267  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1268  
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1269  	isp = devm_kzalloc(&pdev->dev, sizeof(*isp), GFP_KERNEL);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1270  	if (!isp) {
25bccb98ae05c0 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Mauro Carvalho Chehab         2020-05-08  1271  		err = -ENOMEM;
25bccb98ae05c0 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Mauro Carvalho Chehab         2020-05-08  1272  		goto atomisp_dev_alloc_fail;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1273  	}
1cfc8593f42085 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1274  
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1275  	isp->dev = &pdev->dev;
71aecd5d63eea4 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1276  	isp->base = pcim_iomap_table(pdev)[ATOM_ISP_PCI_BAR];
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1277  	isp->saved_regs.ispmmadr = start;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1278  
71aecd5d63eea4 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1279  	dev_dbg(&pdev->dev, "atomisp mmio base: %p\n", isp->base);
71aecd5d63eea4 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1280  
f10fc1790d5ecd drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Hans de Goede                 2022-09-02  1281  	mutex_init(&isp->mutex);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1282  	spin_lock_init(&isp->lock);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1283  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1284  	/* This is not a true PCI device on SoC, so the delay is not needed. */
3789af9a13e556 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Krzysztof Wilczyński          2020-07-30  1285  	pdev->d3hot_delay = 0;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1286  
71aecd5d63eea4 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1287  	pci_set_drvdata(pdev, isp);
71aecd5d63eea4 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1288  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1289  	switch (id->device & ATOMISP_PCI_DEVICE_SOC_MASK) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1290  	case ATOMISP_PCI_DEVICE_SOC_MRFLD:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1291  		isp->media_dev.hw_revision =
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1292  		    (ATOMISP_HW_REVISION_ISP2400
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1293  		     << ATOMISP_HW_REVISION_SHIFT) |
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1294  		    ATOMISP_HW_STEPPING_B0;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1295  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1296  		switch (id->device) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1297  		case ATOMISP_PCI_DEVICE_SOC_MRFLD_1179:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1298  			isp->dfs = &dfs_config_merr_1179;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1299  			break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1300  		case ATOMISP_PCI_DEVICE_SOC_MRFLD_117A:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1301  			isp->dfs = &dfs_config_merr_117a;
268ff5bf6b2b4b drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-20  1302  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1303  			break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1304  		default:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1305  			isp->dfs = &dfs_config_merr;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1306  			break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1307  		}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1308  		isp->hpll_freq = HPLL_FREQ_1600MHZ;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1309  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1310  	case ATOMISP_PCI_DEVICE_SOC_BYT:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1311  		isp->media_dev.hw_revision =
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1312  		    (ATOMISP_HW_REVISION_ISP2400
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1313  		     << ATOMISP_HW_REVISION_SHIFT) |
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1314  		    ATOMISP_HW_STEPPING_B0;
c371af686972ee drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Mauro Carvalho Chehab         2020-06-01  1315  
c371af686972ee drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Mauro Carvalho Chehab         2020-06-01  1316  		/*
c371af686972ee drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Mauro Carvalho Chehab         2020-06-01  1317  		 * Note: some Intel-based tablets with Android use a different
c371af686972ee drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Mauro Carvalho Chehab         2020-06-01  1318  		 * DFS table. Based on the comments at the Yocto Aero meta
c371af686972ee drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Mauro Carvalho Chehab         2020-06-01  1319  		 * version of this driver (at the ssid.h header), they're
c371af686972ee drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Mauro Carvalho Chehab         2020-06-01  1320  		 * identified via a "spid" var:
c371af686972ee drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Mauro Carvalho Chehab         2020-06-01  1321  		 *
c371af686972ee drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Mauro Carvalho Chehab         2020-06-01  1322  		 *	androidboot.spid=vend:cust:manu:plat:prod:hard
c371af686972ee drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Mauro Carvalho Chehab         2020-06-01  1323  		 *
c371af686972ee drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Mauro Carvalho Chehab         2020-06-01  1324  		 * As we don't have this upstream, nor we know enough details
c371af686972ee drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Mauro Carvalho Chehab         2020-06-01  1325  		 * to use a DMI or PCI match table, the old code was just
c371af686972ee drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Mauro Carvalho Chehab         2020-06-01  1326  		 * removed, but let's keep a note here as a reminder that,
c371af686972ee drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Mauro Carvalho Chehab         2020-06-01  1327  		 * for certain devices, we may need to limit the max DFS
c371af686972ee drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Mauro Carvalho Chehab         2020-06-01  1328  		 * frequency to be below certain values, adjusting the
c371af686972ee drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Mauro Carvalho Chehab         2020-06-01  1329  		 * resolution accordingly.
c371af686972ee drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Mauro Carvalho Chehab         2020-06-01  1330  		 */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1331  		isp->dfs = &dfs_config_byt;
17c3827b4c5744 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Mauro Carvalho Chehab         2020-06-01  1332  
17c3827b4c5744 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Mauro Carvalho Chehab         2020-06-01  1333  		/*
17c3827b4c5744 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Mauro Carvalho Chehab         2020-06-01  1334  		 * HPLL frequency is known to be device-specific, but we don't
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1335  		 * have specs yet for exactly how it varies.  Default to
17c3827b4c5744 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Mauro Carvalho Chehab         2020-06-01  1336  		 * BYT-CR but let provisioning set it via EFI variable
17c3827b4c5744 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Mauro Carvalho Chehab         2020-06-01  1337  		 */
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1338  		isp->hpll_freq = gmin_get_var_int(&pdev->dev, false, "HpllFreq", HPLL_FREQ_2000MHZ);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1339  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1340  		/*
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1341  		 * for BYT/CHT we are put isp into D3cold to avoid pci registers access
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1342  		 * in power off. Set d3cold_delay to 0 since default 100ms is not
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1343  		 * necessary.
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1344  		 */
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1345  		pdev->d3cold_delay = 0;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1346  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1347  	case ATOMISP_PCI_DEVICE_SOC_ANN:
4a62b5cca5f048 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Mauro Carvalho Chehab         2021-11-05  1348  		isp->media_dev.hw_revision = (	 ATOMISP_HW_REVISION_ISP2401
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1349  						 << ATOMISP_HW_REVISION_SHIFT);
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1350  		isp->media_dev.hw_revision |= pdev->revision < 2 ?
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1351  					      ATOMISP_HW_STEPPING_A0 : ATOMISP_HW_STEPPING_B0;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1352  		isp->dfs = &dfs_config_merr;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1353  		isp->hpll_freq = HPLL_FREQ_1600MHZ;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1354  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1355  	case ATOMISP_PCI_DEVICE_SOC_CHT:
4a62b5cca5f048 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Mauro Carvalho Chehab         2021-11-05  1356  		isp->media_dev.hw_revision = (	 ATOMISP_HW_REVISION_ISP2401
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1357  						 << ATOMISP_HW_REVISION_SHIFT);
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1358  		isp->media_dev.hw_revision |= pdev->revision < 2 ?
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1359  					      ATOMISP_HW_STEPPING_A0 : ATOMISP_HW_STEPPING_B0;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1360  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1361  		isp->dfs = &dfs_config_cht;
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1362  		pdev->d3cold_delay = 0;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1363  
5f55dd54994a59 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1364  		iosf_mbi_read(BT_MBI_UNIT_CCK, MBI_REG_READ, CCK_FUSE_REG_0, &val);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1365  		switch (val & CCK_FUSE_HPLL_FREQ_MASK) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1366  		case 0x00:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1367  			isp->hpll_freq = HPLL_FREQ_800MHZ;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1368  			break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1369  		case 0x01:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1370  			isp->hpll_freq = HPLL_FREQ_1600MHZ;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1371  			break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1372  		case 0x02:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1373  			isp->hpll_freq = HPLL_FREQ_2000MHZ;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1374  			break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1375  		default:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1376  			isp->hpll_freq = HPLL_FREQ_1600MHZ;
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1377  			dev_warn(&pdev->dev, "read HPLL from cck failed. Default to 1600 MHz.\n");
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1378  		}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1379  		break;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1380  	default:
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1381  		dev_err(&pdev->dev, "un-supported IUNIT device\n");
25bccb98ae05c0 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Mauro Carvalho Chehab         2020-05-08  1382  		err = -ENODEV;
25bccb98ae05c0 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Mauro Carvalho Chehab         2020-05-08  1383  		goto atomisp_dev_alloc_fail;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1384  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1385  
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1386  	dev_info(&pdev->dev, "ISP HPLL frequency base = %d MHz\n", isp->hpll_freq);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1387  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1388  	isp->max_isr_latency = ATOMISP_MAX_ISR_LATENCY;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1389  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1390  	/* Load isp firmware from user space */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1391  	isp->firmware = atomisp_load_firmware(isp);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1392  	if (!isp->firmware) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1393  		err = -ENOENT;
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1394  		dev_dbg(&pdev->dev, "Firmware load failed\n");
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1395  		goto load_fw_fail;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1396  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1397  
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1398  	err = sh_css_check_firmware_version(isp->dev, isp->firmware->data);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1399  	if (err) {
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1400  		dev_dbg(&pdev->dev, "Firmware version check failed\n");
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1401  		goto fw_validation_fail;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1402  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1403  
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1404  	pci_set_master(pdev);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1405  
02900a49a43b7f drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Suraj Upadhyay                2020-07-19  1406  	err = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI);
02900a49a43b7f drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Suraj Upadhyay                2020-07-19  1407  	if (err < 0) {
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1408  		dev_err(&pdev->dev, "Failed to enable msi (%d)\n", err);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1409  		goto enable_msi_fail;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1410  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1411  
1cfc8593f42085 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1412  	atomisp_msi_irq_init(isp);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1413  
ac378c94c7c6b2 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Mauro Carvalho Chehab         2020-05-01  1414  	cpu_latency_qos_add_request(&isp->pm_qos, PM_QOS_DEFAULT_VALUE);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1415  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1416  	/*
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1417  	 * for MRFLD, Software/firmware needs to write a 1 to bit 0 of
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1418  	 * the register at CSI_RECEIVER_SELECTION_REG to enable SH CSI
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1419  	 * backend write 0 will enable Arasan CSI backend, which has
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1420  	 * bugs(like sighting:4567697 and 4567699) and will be removed
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1421  	 * in B0
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1422  	 */
1a16d54539785d drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Mauro Carvalho Chehab         2020-05-28  1423  	atomisp_css2_hw_store_32(MRFLD_CSI_RECEIVER_SELECTION_REG, 1);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1424  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1425  	if ((id->device & ATOMISP_PCI_DEVICE_SOC_MASK) ==
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1426  	    ATOMISP_PCI_DEVICE_SOC_MRFLD) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1427  		u32 csi_afe_trim;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1428  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1429  		/*
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1430  		 * Workaround for imbalance data eye issue which is observed
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1431  		 * on TNG B0.
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1432  		 */
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1433  		pci_read_config_dword(pdev, MRFLD_PCI_CSI_AFE_TRIM_CONTROL, &csi_afe_trim);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1434  		csi_afe_trim &= ~((MRFLD_PCI_CSI_HSRXCLKTRIM_MASK <<
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1435  				   MRFLD_PCI_CSI1_HSRXCLKTRIM_SHIFT) |
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1436  				  (MRFLD_PCI_CSI_HSRXCLKTRIM_MASK <<
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1437  				   MRFLD_PCI_CSI2_HSRXCLKTRIM_SHIFT) |
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1438  				  (MRFLD_PCI_CSI_HSRXCLKTRIM_MASK <<
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1439  				   MRFLD_PCI_CSI3_HSRXCLKTRIM_SHIFT));
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1440  		csi_afe_trim |= (MRFLD_PCI_CSI1_HSRXCLKTRIM <<
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1441  				 MRFLD_PCI_CSI1_HSRXCLKTRIM_SHIFT) |
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1442  				(MRFLD_PCI_CSI2_HSRXCLKTRIM <<
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1443  				 MRFLD_PCI_CSI2_HSRXCLKTRIM_SHIFT) |
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1444  				(MRFLD_PCI_CSI3_HSRXCLKTRIM <<
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1445  				 MRFLD_PCI_CSI3_HSRXCLKTRIM_SHIFT);
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1446  		pci_write_config_dword(pdev, MRFLD_PCI_CSI_AFE_TRIM_CONTROL, csi_afe_trim);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1447  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1448  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1449  	err = atomisp_initialize_modules(isp);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1450  	if (err < 0) {
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1451  		dev_err(&pdev->dev, "atomisp_initialize_modules (%d)\n", err);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1452  		goto initialize_modules_fail;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1453  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1454  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1455  	err = atomisp_register_entities(isp);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1456  	if (err < 0) {
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1457  		dev_err(&pdev->dev, "atomisp_register_entities failed (%d)\n", err);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1458  		goto register_entities_fail;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1459  	}
93d3fb35aa10a8 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Hans de Goede                 2022-09-03  1460  
93d3fb35aa10a8 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Hans de Goede                 2022-09-03  1461  	INIT_WORK(&isp->assert_recovery_work, atomisp_assert_recovery_work);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1462  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1463  	/* save the iunit context only once after all the values are init'ed. */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1464  	atomisp_save_iunit_reg(isp);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1465  
553a64b7e7cef7 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Hans de Goede                 2022-11-26  1466  	/*
553a64b7e7cef7 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Hans de Goede                 2022-11-26  1467  	 * The atomisp does not use standard PCI power-management through the
553a64b7e7cef7 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Hans de Goede                 2022-11-26  1468  	 * PCI config space. Instead this driver directly tells the P-Unit to
553a64b7e7cef7 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Hans de Goede                 2022-11-26  1469  	 * disable the ISP over the IOSF. The standard PCI subsystem pm_ops will
553a64b7e7cef7 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Hans de Goede                 2022-11-26  1470  	 * try to access the config space before (resume) / after (suspend) this
553a64b7e7cef7 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Hans de Goede                 2022-11-26  1471  	 * driver has turned the ISP on / off, resulting in the following errors:
553a64b7e7cef7 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Hans de Goede                 2022-11-26  1472  	 *
553a64b7e7cef7 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Hans de Goede                 2022-11-26  1473  	 * "Unable to change power state from D0 to D3hot, device inaccessible"
553a64b7e7cef7 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Hans de Goede                 2022-11-26  1474  	 * "Unable to change power state from D3cold to D0, device inaccessible"
553a64b7e7cef7 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Hans de Goede                 2022-11-26  1475  	 *
553a64b7e7cef7 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Hans de Goede                 2022-11-26  1476  	 * To avoid these errors override the pm_domain so that all the PCI
553a64b7e7cef7 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Hans de Goede                 2022-11-26  1477  	 * subsys suspend / resume handling is skipped.
553a64b7e7cef7 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Hans de Goede                 2022-11-26  1478  	 */
553a64b7e7cef7 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Hans de Goede                 2022-11-26  1479  	isp->pm_domain.ops.runtime_suspend = atomisp_power_off;
553a64b7e7cef7 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Hans de Goede                 2022-11-26  1480  	isp->pm_domain.ops.runtime_resume = atomisp_power_on;
553a64b7e7cef7 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Hans de Goede                 2022-11-26  1481  	isp->pm_domain.ops.suspend = atomisp_suspend;
553a64b7e7cef7 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Hans de Goede                 2022-11-26  1482  	isp->pm_domain.ops.resume = atomisp_resume;
553a64b7e7cef7 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Hans de Goede                 2022-11-26  1483  
553a64b7e7cef7 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Hans de Goede                 2022-11-26  1484  	dev_pm_domain_set(&pdev->dev, &isp->pm_domain);
553a64b7e7cef7 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Hans de Goede                 2022-11-26  1485  
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1486  	pm_runtime_put_noidle(&pdev->dev);
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1487  	pm_runtime_allow(&pdev->dev);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1488  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1489  	/* Init ISP memory management */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1490  	hmm_init();
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1491  
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1492  	err = devm_request_threaded_irq(&pdev->dev, pdev->irq,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1493  					atomisp_isr, atomisp_isr_thread,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1494  					IRQF_SHARED, "isp_irq", isp);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1495  	if (err) {
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1496  		dev_err(&pdev->dev, "Failed to request irq (%d)\n", err);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1497  		goto request_irq_fail;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1498  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1499  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1500  	/* Load firmware into ISP memory */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1501  	err = atomisp_css_load_firmware(isp);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1502  	if (err) {
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1503  		dev_err(&pdev->dev, "Failed to init css.\n");
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1504  		goto css_init_fail;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1505  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1506  	/* Clear FW image from memory */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1507  	release_firmware(isp->firmware);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1508  	isp->firmware = NULL;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1509  	isp->css_env.isp_css_fw.data = NULL;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1510  
8d28ec7e9145ef drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Hans de Goede                 2023-05-25 @1511  	err = v4l2_async_nf_register(&isp->v4l2_dev, &isp->notifier);
8d28ec7e9145ef drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Hans de Goede                 2023-05-25  1512  	if (err) {
8d28ec7e9145ef drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Hans de Goede                 2023-05-25  1513  		dev_err(isp->dev, "failed to register async notifier : %d\n", err);
eb81065b9322d6 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Hans de Goede                 2022-08-29  1514  		goto css_init_fail;
8d28ec7e9145ef drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Hans de Goede                 2023-05-25  1515  	}
eb81065b9322d6 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Hans de Goede                 2022-08-29  1516  
0697fd92e7f1fc drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1517  	atomisp_drvfs_init(isp);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1518  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1519  	return 0;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1520  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1521  css_init_fail:
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1522  	devm_free_irq(&pdev->dev, pdev->irq, isp);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1523  request_irq_fail:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1524  	hmm_cleanup();
672fe1cf145ab9 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Dinghao Liu                   2021-04-08  1525  	pm_runtime_get_noresume(&pdev->dev);
553a64b7e7cef7 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Hans de Goede                 2022-11-26  1526  	dev_pm_domain_set(&pdev->dev, NULL);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1527  	atomisp_unregister_entities(isp);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1528  register_entities_fail:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1529  	atomisp_uninitialize_modules(isp);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1530  initialize_modules_fail:
8d564cd28cfcbe drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1531  	cpu_latency_qos_remove_request(&isp->pm_qos);
1cfc8593f42085 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1532  	atomisp_msi_irq_uninit(isp);
02900a49a43b7f drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Suraj Upadhyay                2020-07-19  1533  	pci_free_irq_vectors(pdev);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1534  enable_msi_fail:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1535  fw_validation_fail:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1536  	release_firmware(isp->firmware);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1537  load_fw_fail:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1538  	/*
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1539  	 * Switch off ISP, as keeping it powered on would prevent
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1540  	 * reaching S0ix states.
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1541  	 *
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1542  	 * The following lines have been copied from atomisp suspend path
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1543  	 */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1544  
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1545  	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
64288aa9e41990 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Moses Christopher Bollavarapu 2022-02-06  1546  	irq &= BIT(INTR_IIR);
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1547  	pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, irq);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1548  
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1549  	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
64288aa9e41990 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Moses Christopher Bollavarapu 2022-02-06  1550  	irq &= ~BIT(INTR_IER);
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1551  	pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, irq);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1552  
1cfc8593f42085 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1553  	atomisp_msi_irq_uninit(isp);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1554  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1555  	/* Address later when we worry about the ...field chips */
10f2b0a3a12e36 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Hans de Goede                 2022-11-11  1556  	if (IS_ENABLED(CONFIG_PM) && atomisp_mrfld_power(isp, false))
89027fea0d0414 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Andy Shevchenko               2020-06-26  1557  		dev_err(&pdev->dev, "Failed to switch off ISP\n");
25bccb98ae05c0 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Mauro Carvalho Chehab         2020-05-08  1558  
25bccb98ae05c0 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Mauro Carvalho Chehab         2020-05-08  1559  atomisp_dev_alloc_fail:
64288aa9e41990 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Moses Christopher Bollavarapu 2022-02-06  1560  	pcim_iounmap_regions(pdev, BIT(ATOM_ISP_PCI_BAR));
25bccb98ae05c0 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Mauro Carvalho Chehab         2020-05-08  1561  
25bccb98ae05c0 drivers/staging/media/atomisp/pci/atomisp_v4l2.c          Mauro Carvalho Chehab         2020-05-08  1562  ioremap_fail:
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1563  	return err;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1564  }
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_v4l2.c Mauro Carvalho Chehab         2020-04-19  1565  

:::::: The code at line 1511 was first introduced by commit
:::::: 8d28ec7e9145ef6308ab3438d73308ec6ea14360 media: atomisp: Add support for v4l2-async sensor registration

:::::: TO: Hans de Goede <hdegoede@redhat.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
