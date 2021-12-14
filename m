Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55B1A4749F1
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 18:45:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230007AbhLNRpl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Dec 2021 12:45:41 -0500
Received: from mga06.intel.com ([134.134.136.31]:19236 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229593AbhLNRpl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Dec 2021 12:45:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639503941; x=1671039941;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qgQf1l1Sh+4Ghj/UNqaSyRA6jQeXlevpaLLEFSn73hM=;
  b=kWv5g8SHDHKeVNYluheSzyhyfwvBzKMGdOgj0p5kebPe8UJ2yoH17jio
   KQWFe/CiOYZVVMrUQBy8GQQj7LBZxDpO40HZYW+4UE/co5gUpmJw5Hrei
   5uEh4g/V3J4JavylL3+pShl+4Ax73KfnvtWXS3PRJuHdd6QIOV8h+TEUC
   3PuxcrqIzyeTUiHIgiqVBgnAXYt7PBM5fIzQVJJ67jyjmpaqCrnRjhddH
   yxnciS+23BtnTurHoZUG8XOY3pA/MrDeWxNnXUIYZddMFXk1iepuDGpX8
   rh0P+Oq1NX1WLaL0GI8lBqnB1agdl2CvBxGnaie4sPK0Ir/EJrEVVVssQ
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="299814416"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="299814416"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 09:45:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="463882597"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 14 Dec 2021 09:45:15 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mxBrW-0000a0-K1; Tue, 14 Dec 2021 17:45:14 +0000
Date:   Wed, 15 Dec 2021 01:44:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Michal Simek <monstr@monstr.eu>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [xilinx-xlnx:xlnx_rebase_v5.10 1566/1981]
 drivers/usb/cdns3/ep0.c:690: warning: expecting prototype for
 cdns3_gadget_ep0_queue Transfer data on endpoint zero(). Prototype was for
 cdns3_gadget_ep0_queue() instead
Message-ID: <202112150159.zq5SREqP-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.10
head:   87ec9a2d98a7a7dfc98b57348a0ec310fd170e4b
commit: d3328cb2dd0a2fb94a09587105c37299e296d4c6 [1566/1981] scripts: kernel-doc: validate kernel-doc markup with the actual names
config: x86_64-randconfig-a016-20211214 (https://download.01.org/0day-ci/archive/20211215/202112150159.zq5SREqP-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2ddb6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/d3328cb2dd0a2fb94a09587105c37299e296d4c6
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.10
        git checkout d3328cb2dd0a2fb94a09587105c37299e296d4c6
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/usb/cdns3/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/usb/cdns3/ep0.c:690: warning: expecting prototype for cdns3_gadget_ep0_queue Transfer data on endpoint zero(). Prototype was for cdns3_gadget_ep0_queue() instead
>> drivers/usb/cdns3/ep0.c:781: warning: expecting prototype for cdns3_gadget_ep_set_wedge Set wedge on selected endpoint(). Prototype was for cdns3_gadget_ep_set_wedge() instead
>> drivers/usb/cdns3/ep0.c:876: warning: expecting prototype for cdns3_init_ep0 Initializes software endpoint 0 of gadget(). Prototype was for cdns3_init_ep0() instead
--
>> drivers/usb/cdns3/gadget.c:162: warning: expecting prototype for select_ep(). Prototype was for cdns3_select_ep() instead
>> drivers/usb/cdns3/gadget.c:509: warning: expecting prototype for cdns3_wa2_descmiss_copy_data copy data from internal requests to(). Prototype was for cdns3_wa2_descmiss_copy_data() instead
>> drivers/usb/cdns3/gadget.c:2029: warning: expecting prototype for cdns3_ep_config Configure hardware endpoint(). Prototype was for cdns3_ep_config() instead
>> drivers/usb/cdns3/gadget.c:2233: warning: expecting prototype for cdns3_gadget_ep_alloc_request Allocates request(). Prototype was for cdns3_gadget_ep_alloc_request() instead
>> drivers/usb/cdns3/gadget.c:2254: warning: expecting prototype for cdns3_gadget_ep_free_request Free memory occupied by request(). Prototype was for cdns3_gadget_ep_free_request() instead
>> drivers/usb/cdns3/gadget.c:2273: warning: expecting prototype for cdns3_gadget_ep_enable Enable endpoint(). Prototype was for cdns3_gadget_ep_enable() instead
>> drivers/usb/cdns3/gadget.c:2406: warning: expecting prototype for cdns3_gadget_ep_disable Disable endpoint(). Prototype was for cdns3_gadget_ep_disable() instead
>> drivers/usb/cdns3/gadget.c:2500: warning: expecting prototype for cdns3_gadget_ep_queue Transfer data on endpoint(). Prototype was for __cdns3_gadget_ep_queue() instead
>> drivers/usb/cdns3/gadget.c:2598: warning: expecting prototype for cdns3_gadget_ep_dequeue Remove request from transfer queue(). Prototype was for cdns3_gadget_ep_dequeue() instead
>> drivers/usb/cdns3/gadget.c:2662: warning: expecting prototype for __cdns3_gadget_ep_set_halt Sets stall on selected endpoint(). Prototype was for __cdns3_gadget_ep_set_halt() instead
>> drivers/usb/cdns3/gadget.c:2683: warning: expecting prototype for __cdns3_gadget_ep_clear_halt Clears stall on selected endpoint(). Prototype was for __cdns3_gadget_ep_clear_halt() instead
>> drivers/usb/cdns3/gadget.c:2730: warning: expecting prototype for clears stall on selected endpoint(). Prototype was for cdns3_gadget_ep_set_halt() instead
>> drivers/usb/cdns3/gadget.c:2775: warning: expecting prototype for cdns3_gadget_get_frame Returns number of actual ITP frame(). Prototype was for cdns3_gadget_get_frame() instead
>> drivers/usb/cdns3/gadget.c:2886: warning: expecting prototype for cdns3_gadget_udc_start Gadget start(). Prototype was for cdns3_gadget_udc_start() instead
>> drivers/usb/cdns3/gadget.c:2930: warning: expecting prototype for cdns3_gadget_udc_stop Stops gadget(). Prototype was for cdns3_gadget_udc_stop() instead
>> drivers/usb/cdns3/gadget.c:2993: warning: expecting prototype for cdns3_init_eps Initializes software endpoints of gadget(). Prototype was for cdns3_init_eps() instead


vim +690 drivers/usb/cdns3/ep0.c

7733f6c32e36ff9 Pawel Laszczak 2019-08-26  678  
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  679  /**
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  680   * cdns3_gadget_ep0_queue Transfer data on endpoint zero
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  681   * @ep: pointer to endpoint zero object
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  682   * @request: pointer to request object
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  683   * @gfp_flags: gfp flags
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  684   *
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  685   * Returns 0 on success, error code elsewhere
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  686   */
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  687  static int cdns3_gadget_ep0_queue(struct usb_ep *ep,
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  688  				  struct usb_request *request,
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  689  				  gfp_t gfp_flags)
7733f6c32e36ff9 Pawel Laszczak 2019-08-26 @690  {
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  691  	struct cdns3_endpoint *priv_ep = ep_to_cdns3_ep(ep);
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  692  	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  693  	unsigned long flags;
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  694  	int ret = 0;
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  695  	u8 zlp = 0;
52d3967704aea6c Pawel Laszczak 2020-10-22  696  	int i;
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  697  
d0b78265cac9d8b Peter Chen     2020-06-23  698  	spin_lock_irqsave(&priv_dev->lock, flags);
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  699  	trace_cdns3_ep0_queue(priv_dev, request);
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  700  
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  701  	/* cancel the request if controller receive new SETUP packet. */
d0b78265cac9d8b Peter Chen     2020-06-23  702  	if (cdns3_check_new_setup(priv_dev)) {
d0b78265cac9d8b Peter Chen     2020-06-23  703  		spin_unlock_irqrestore(&priv_dev->lock, flags);
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  704  		return -ECONNRESET;
d0b78265cac9d8b Peter Chen     2020-06-23  705  	}
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  706  
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  707  	/* send STATUS stage. Should be called only for SET_CONFIGURATION */
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  708  	if (priv_dev->ep0_stage == CDNS3_STATUS_STAGE) {
b21cf9371c2e659 Peter Chen     2020-09-01  709  		u32 val;
b21cf9371c2e659 Peter Chen     2020-09-01  710  
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  711  		cdns3_select_ep(priv_dev, 0x00);
52d3967704aea6c Pawel Laszczak 2020-10-22  712  
52d3967704aea6c Pawel Laszczak 2020-10-22  713  		/*
52d3967704aea6c Pawel Laszczak 2020-10-22  714  		 * Configure all non-control EPs which are not enabled by class driver
52d3967704aea6c Pawel Laszczak 2020-10-22  715  		 */
52d3967704aea6c Pawel Laszczak 2020-10-22  716  		for (i = 0; i < CDNS3_ENDPOINTS_MAX_COUNT; i++) {
52d3967704aea6c Pawel Laszczak 2020-10-22  717  			priv_ep = priv_dev->eps[i];
52d3967704aea6c Pawel Laszczak 2020-10-22  718  			if (priv_ep && priv_ep->flags & EP_CLAIMED &&
52d3967704aea6c Pawel Laszczak 2020-10-22  719  			    !(priv_ep->flags & EP_ENABLED))
52d3967704aea6c Pawel Laszczak 2020-10-22  720  				cdns3_ep_config(priv_ep, 0);
52d3967704aea6c Pawel Laszczak 2020-10-22  721  		}
52d3967704aea6c Pawel Laszczak 2020-10-22  722  
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  723  		cdns3_set_hw_configuration(priv_dev);
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  724  		cdns3_ep0_complete_setup(priv_dev, 0, 1);
b21cf9371c2e659 Peter Chen     2020-09-01  725  		/* wait until configuration set */
b21cf9371c2e659 Peter Chen     2020-09-01  726  		ret = readl_poll_timeout_atomic(&priv_dev->regs->usb_sts, val,
b21cf9371c2e659 Peter Chen     2020-09-01  727  					  val & USB_STS_CFGSTS_MASK, 1, 100);
b21cf9371c2e659 Peter Chen     2020-09-01  728  		if (ret == -ETIMEDOUT)
b21cf9371c2e659 Peter Chen     2020-09-01  729  			dev_warn(priv_dev->dev, "timeout for waiting configuration set\n");
b21cf9371c2e659 Peter Chen     2020-09-01  730  
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  731  		request->actual = 0;
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  732  		priv_dev->status_completion_no_call = true;
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  733  		priv_dev->pending_status_request = request;
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  734  		spin_unlock_irqrestore(&priv_dev->lock, flags);
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  735  
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  736  		/*
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  737  		 * Since there is no completion interrupt for status stage,
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  738  		 * it needs to call ->completion in software after
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  739  		 * ep0_queue is back.
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  740  		 */
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  741  		queue_work(system_freezable_wq, &priv_dev->pending_status_wq);
b21cf9371c2e659 Peter Chen     2020-09-01  742  		return ret;
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  743  	}
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  744  
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  745  	if (!list_empty(&priv_ep->pending_req_list)) {
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  746  		dev_err(priv_dev->dev,
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  747  			"can't handle multiple requests for ep0\n");
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  748  		spin_unlock_irqrestore(&priv_dev->lock, flags);
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  749  		return -EBUSY;
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  750  	}
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  751  
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  752  	ret = usb_gadget_map_request_by_dev(priv_dev->sysdev, request,
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  753  					    priv_dev->ep0_data_dir);
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  754  	if (ret) {
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  755  		spin_unlock_irqrestore(&priv_dev->lock, flags);
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  756  		dev_err(priv_dev->dev, "failed to map request\n");
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  757  		return -EINVAL;
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  758  	}
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  759  
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  760  	request->status = -EINPROGRESS;
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  761  	list_add_tail(&request->list, &priv_ep->pending_req_list);
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  762  
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  763  	if (request->zero && request->length &&
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  764  	    (request->length % ep->maxpacket == 0))
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  765  		zlp = 1;
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  766  
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  767  	cdns3_ep0_run_transfer(priv_dev, request->dma, request->length, 1, zlp);
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  768  
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  769  	spin_unlock_irqrestore(&priv_dev->lock, flags);
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  770  
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  771  	return ret;
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  772  }
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  773  
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  774  /**
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  775   * cdns3_gadget_ep_set_wedge Set wedge on selected endpoint
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  776   * @ep: endpoint object
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  777   *
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  778   * Returns 0
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  779   */
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  780  int cdns3_gadget_ep_set_wedge(struct usb_ep *ep)
7733f6c32e36ff9 Pawel Laszczak 2019-08-26 @781  {
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  782  	struct cdns3_endpoint *priv_ep = ep_to_cdns3_ep(ep);
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  783  	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  784  
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  785  	dev_dbg(priv_dev->dev, "Wedge for %s\n", ep->name);
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  786  	cdns3_gadget_ep_set_halt(ep, 1);
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  787  	priv_ep->flags |= EP_WEDGE;
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  788  
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  789  	return 0;
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  790  }
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  791  
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  792  const struct usb_ep_ops cdns3_gadget_ep0_ops = {
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  793  	.enable = cdns3_gadget_ep0_enable,
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  794  	.disable = cdns3_gadget_ep0_disable,
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  795  	.alloc_request = cdns3_gadget_ep_alloc_request,
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  796  	.free_request = cdns3_gadget_ep_free_request,
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  797  	.queue = cdns3_gadget_ep0_queue,
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  798  	.dequeue = cdns3_gadget_ep_dequeue,
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  799  	.set_halt = cdns3_gadget_ep0_set_halt,
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  800  	.set_wedge = cdns3_gadget_ep_set_wedge,
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  801  };
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  802  
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  803  /**
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  804   * cdns3_ep0_config - Configures default endpoint
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  805   * @priv_dev: extended gadget object
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  806   *
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  807   * Functions sets parameters: maximal packet size and enables interrupts
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  808   */
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  809  void cdns3_ep0_config(struct cdns3_device *priv_dev)
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  810  {
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  811  	struct cdns3_usb_regs __iomem *regs;
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  812  	struct cdns3_endpoint *priv_ep;
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  813  	u32 max_packet_size = 64;
52d3967704aea6c Pawel Laszczak 2020-10-22  814  	u32 ep_cfg;
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  815  
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  816  	regs = priv_dev->regs;
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  817  
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  818  	if (priv_dev->gadget.speed == USB_SPEED_SUPER)
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  819  		max_packet_size = 512;
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  820  
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  821  	priv_ep = priv_dev->eps[0];
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  822  
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  823  	if (!list_empty(&priv_ep->pending_req_list)) {
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  824  		struct usb_request *request;
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  825  
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  826  		request = cdns3_next_request(&priv_ep->pending_req_list);
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  827  		list_del_init(&request->list);
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  828  	}
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  829  
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  830  	priv_dev->u1_allowed = 0;
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  831  	priv_dev->u2_allowed = 0;
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  832  
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  833  	priv_dev->gadget.ep0->maxpacket = max_packet_size;
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  834  	cdns3_gadget_ep0_desc.wMaxPacketSize = cpu_to_le16(max_packet_size);
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  835  
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  836  	/* init ep out */
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  837  	cdns3_select_ep(priv_dev, USB_DIR_OUT);
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  838  
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  839  	if (priv_dev->dev_ver >= DEV_VER_V3) {
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  840  		cdns3_set_register_bit(&priv_dev->regs->dtrans,
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  841  				       BIT(0) | BIT(16));
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  842  		cdns3_set_register_bit(&priv_dev->regs->tdl_from_trb,
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  843  				       BIT(0) | BIT(16));
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  844  	}
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  845  
52d3967704aea6c Pawel Laszczak 2020-10-22  846  	ep_cfg = EP_CFG_ENABLE | EP_CFG_MAXPKTSIZE(max_packet_size);
52d3967704aea6c Pawel Laszczak 2020-10-22  847  
52d3967704aea6c Pawel Laszczak 2020-10-22  848  	if (!(priv_ep->flags & EP_CONFIGURED))
52d3967704aea6c Pawel Laszczak 2020-10-22  849  		writel(ep_cfg, &regs->ep_cfg);
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  850  
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  851  	writel(EP_STS_EN_SETUPEN | EP_STS_EN_DESCMISEN | EP_STS_EN_TRBERREN,
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  852  	       &regs->ep_sts_en);
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  853  
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  854  	/* init ep in */
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  855  	cdns3_select_ep(priv_dev, USB_DIR_IN);
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  856  
52d3967704aea6c Pawel Laszczak 2020-10-22  857  	if (!(priv_ep->flags & EP_CONFIGURED))
52d3967704aea6c Pawel Laszczak 2020-10-22  858  		writel(ep_cfg, &regs->ep_cfg);
52d3967704aea6c Pawel Laszczak 2020-10-22  859  
52d3967704aea6c Pawel Laszczak 2020-10-22  860  	priv_ep->flags |= EP_CONFIGURED;
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  861  
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  862  	writel(EP_STS_EN_SETUPEN | EP_STS_EN_TRBERREN, &regs->ep_sts_en);
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  863  
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  864  	cdns3_set_register_bit(&regs->usb_conf, USB_CONF_U1DS | USB_CONF_U2DS);
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  865  }
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  866  
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  867  /**
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  868   * cdns3_init_ep0 Initializes software endpoint 0 of gadget
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  869   * @priv_dev: extended gadget object
9293b7db8c33b28 Lee Jones      2020-07-02  870   * @priv_ep: extended endpoint object
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  871   *
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  872   * Returns 0 on success else error code.
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  873   */
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  874  int cdns3_init_ep0(struct cdns3_device *priv_dev,
7733f6c32e36ff9 Pawel Laszczak 2019-08-26  875  		   struct cdns3_endpoint *priv_ep)
7733f6c32e36ff9 Pawel Laszczak 2019-08-26 @876  {

:::::: The code at line 690 was first introduced by commit
:::::: 7733f6c32e36ff9d7adadf40001039bf219b1cbe usb: cdns3: Add Cadence USB3 DRD Driver

:::::: TO: Pawel Laszczak <pawell@cadence.com>
:::::: CC: Felipe Balbi <felipe.balbi@linux.intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
