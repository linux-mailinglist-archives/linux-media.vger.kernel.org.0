Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A4D959C97F
	for <lists+linux-media@lfdr.de>; Mon, 22 Aug 2022 22:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231322AbiHVUCb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Aug 2022 16:02:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232315AbiHVUCP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Aug 2022 16:02:15 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB52F54640
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 13:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661198528; x=1692734528;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wwIOa1pNLjjWkbuTgKvLaWRKOvgYWwl7UQiB4kD0ntg=;
  b=UPPDmrC1F1NUvd3VSR3s8cOoRx29gGqyGcthDhcDcEOdSyFJhApTB65H
   IhJM22BddMRl/QBaC8u3OliAfe+YBtdH4Nof8pj4f8FZpbKq/RXPJU4Ki
   kieCJF4GnCI6U2SBbBiDOiMEgSvy/E7z54uMHM9EtYmqxP0qBFhVzVauM
   49AXB1/JvTPmwUi+Y5mXt95emPfRZScE61D3kTGVKmt4qEYFOfKlUOzBm
   7A+X7QL0KbzJ6IbHeifstN9FPnAI2ZaSAo6/8yfRr6FFnnjz8Q4hQxvlz
   BiVl8tZDLMS0IBud+qGiyc3DtIwcJyDm3krvi8bqgsQTu2aTtfnEc5CRX
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="379800404"
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="379800404"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2022 13:02:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="937173184"
Received: from lkp-server01.sh.intel.com (HELO dd9b29378baa) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 22 Aug 2022 13:02:06 -0700
Received: from kbuild by dd9b29378baa with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oQDcb-0000g9-34;
        Mon, 22 Aug 2022 20:02:05 +0000
Date:   Tue, 23 Aug 2022 04:01:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     martin.tuma@digiteqautomotive.com, linux-media@vger.kernel.org
Cc:     kbuild-all@lists.01.org,
        Martin =?utf-8?B?VMWvbWE=?= <martin.tuma@digiteqautomotive.com>
Subject: Re: [PATCH 2/3] Added Xilinx PCIe DMA IP core driver
Message-ID: <202208230332.Ou2XawTv-lkp@intel.com>
References: <20220822194721.1238-3-martin.tuma@digiteqautomotive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220822194721.1238-3-martin.tuma@digiteqautomotive.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on vkoul-dmaengine/next linus/master v6.0-rc2 next-20220822]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/martin-tuma-digiteqautomotive-com/Digiteq-Automotive-MGB4-driver/20220823-015724
base:   git://linuxtv.org/media_tree.git master
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20220823/202208230332.Ou2XawTv-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/178e549c877b1d8919b6559be1d09a264c7e176a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review martin-tuma-digiteqautomotive-com/Digiteq-Automotive-MGB4-driver/20220823-015724
        git checkout 178e549c877b1d8919b6559be1d09a264c7e176a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/dma/xilinx/ drivers/media/pci/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/dma/xilinx/xdma_core.c: In function 'enable_msi_msix':
>> drivers/dma/xilinx/xdma_core.c:1628:73: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
    1628 |                         dbg_init("Couldn't enable MSI-X mode: %d\n", rv);
         |                                                                         ^
   drivers/dma/xilinx/xdma_core.c:1639:71: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
    1639 |                         dbg_init("Couldn't enable MSI mode: %d\n", rv);
         |                                                                       ^
   drivers/dma/xilinx/xdma_core.c: In function 'irq_msi_channel_setup':
>> drivers/dma/xilinx/xdma_core.c:1829:83: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
    1829 |                 dbg_init("engine using IRQ#%d with 0x%p\n", xdev->pdev->irq, xdev);
         |                                                                                   ^
--
>> drivers/dma/xilinx/xdma_thread.c:123:5: warning: no previous prototype for 'xdma_kthread_start' [-Wmissing-prototypes]
     123 | int xdma_kthread_start(struct xdma_kthread *thp, char *name, int id)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/dma/xilinx/xdma_thread.c:166:5: warning: no previous prototype for 'xdma_kthread_stop' [-Wmissing-prototypes]
     166 | int xdma_kthread_stop(struct xdma_kthread *thp)
         |     ^~~~~~~~~~~~~~~~~
--
   drivers/dma/xilinx/xdma_core.c:410: warning: Function parameter or member 'engine' not described in 'engine_status_read'
   drivers/dma/xilinx/xdma_core.c:410: warning: Function parameter or member 'clear' not described in 'engine_status_read'
   drivers/dma/xilinx/xdma_core.c:410: warning: Function parameter or member 'dump' not described in 'engine_status_read'
   drivers/dma/xilinx/xdma_core.c:443: warning: Function parameter or member 'engine' not described in 'xdma_engine_stop'
   drivers/dma/xilinx/xdma_core.c:534: warning: Function parameter or member 'remaining' not described in 'xdma_get_next_adj'
   drivers/dma/xilinx/xdma_core.c:534: warning: Function parameter or member 'next_lo' not described in 'xdma_get_next_adj'
   drivers/dma/xilinx/xdma_core.c:568: warning: Function parameter or member 'engine' not described in 'engine_start'
   drivers/dma/xilinx/xdma_core.c:669: warning: Function parameter or member 'engine' not described in 'engine_service_shutdown'
>> drivers/dma/xilinx/xdma_core.c:669: warning: expecting prototype for engine_service(). Prototype was for engine_service_shutdown() instead
   drivers/dma/xilinx/xdma_core.c:949: warning: Function parameter or member 'engine' not described in 'engine_service'
   drivers/dma/xilinx/xdma_core.c:949: warning: Function parameter or member 'desc_writeback' not described in 'engine_service'


vim +/if +1628 drivers/dma/xilinx/xdma_core.c

  1605	
  1606	static int enable_msi_msix(struct xdma_dev *xdev, struct pci_dev *pdev)
  1607	{
  1608		int rv = 0;
  1609	
  1610		if (!xdev) {
  1611			pr_err("Invalid xdev\n");
  1612			return -EINVAL;
  1613		}
  1614	
  1615		if (!pdev) {
  1616			pr_err("Invalid pdev\n");
  1617			return -EINVAL;
  1618		}
  1619	
  1620		if ((interrupt_mode == 2 || !interrupt_mode)
  1621		    && msi_msix_capable(pdev, PCI_CAP_ID_MSIX)) {
  1622			int req_nvec = xdev->c2h_channel_max + xdev->h2c_channel_max +
  1623				       xdev->user_max;
  1624	
  1625			dbg_init("Enabling MSI-X\n");
  1626			rv = pci_alloc_irq_vectors(pdev, req_nvec, req_nvec, PCI_IRQ_MSIX);
  1627			if (rv < 0)
> 1628				dbg_init("Couldn't enable MSI-X mode: %d\n", rv);
  1629	
  1630			xdev->msix_enabled = 1;
  1631	
  1632		} else if ((interrupt_mode == 1 || !interrupt_mode)
  1633			    && msi_msix_capable(pdev, PCI_CAP_ID_MSI)) {
  1634			int req_nvec = xdev->user_max + 1;
  1635	
  1636			dbg_init("Enabling MSI\n");
  1637			rv = pci_alloc_irq_vectors(pdev, req_nvec, req_nvec, PCI_IRQ_MSI);
  1638			if (rv < 0)
  1639				dbg_init("Couldn't enable MSI mode: %d\n", rv);
  1640			xdev->msi_enabled = 1;
  1641	
  1642		} else {
  1643			dbg_init("MSI/MSI-X not detected\n");
  1644			rv = -EINVAL;
  1645		}
  1646	
  1647		return rv;
  1648	}
  1649	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
