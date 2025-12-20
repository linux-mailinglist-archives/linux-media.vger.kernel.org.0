Return-Path: <linux-media+bounces-49237-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64119CD3289
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 16:57:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 172DD3014A26
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 15:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ADB027F01B;
	Sat, 20 Dec 2025 15:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JILZeEA/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02572765ED;
	Sat, 20 Dec 2025 15:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766246245; cv=none; b=iy2eYGXckO/uEemeTg+Xt7IFbhc4oPdogvNcWGeyuyzeBUiZHViaQUsMwus+p/gVeX66K7ViYlbzQbtuj5SEyy0VZazKacj7Q/56vnoIWCdNYS5A7RtCfZNzxRx3N7NLv+9l4Hhs9qcMXe1GdinjMG6QnhmTvd10CpvNvQ8Zgv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766246245; c=relaxed/simple;
	bh=jA5bxh+GRkZj7og+mtLesOInt0AGzfsQjOpXAMZyscQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YBGkVWo19ARACaz2s9Nv6FwPEi9VG5rYk8lhIJxv7PDtRlYXTIOsW7M0TrZINH2DwaWhaO4COZU8VL6BXfR6BqAyBIPQyBpUbzErYItwl/YouXyPSjkYYZLPZQ2HutFMi+qP4YudDGif+LspW/VdK/7jwnXQ5MS8pvxquajLuzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JILZeEA/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766246244; x=1797782244;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jA5bxh+GRkZj7og+mtLesOInt0AGzfsQjOpXAMZyscQ=;
  b=JILZeEA/n40yQA00pz83yHSBGQFrlzi0CbkSUNUoazVyzqpleAMXg9CY
   SA5eA/n1HXhGI7Dql+hoirApN/ez10sVatRGCKCkMdknDRg3kpNeW/OYa
   U2NzV04owgZsxAwMzkcsl3++Us7J3cImOa8pdS3HebMEt9+9VwMCSEUig
   prN/wR/8YH0JXqwuDVWrEV8IkmA/gn+XxQUEbDtseaYY6NUGxf5mul7fK
   se6xTAO/eC+4k86q12FQMEshDs8PT/BRagjOJNIQ7/UeSf/kRCCRUk1s4
   jLknZgJs481n8lgx0/gQxxLOBrm/f3fHwxCw5DSFlmkxIGVk+w9XiODNW
   Q==;
X-CSE-ConnectionGUID: WE+S3sG8RCGLcj9R++50Mg==
X-CSE-MsgGUID: ATaaZ943QWqs3AhJ5sw2Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="72037343"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="72037343"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 07:57:23 -0800
X-CSE-ConnectionGUID: Sfi4MiTqTr+Jd97WSTFK8Q==
X-CSE-MsgGUID: +aoLJ/eSQkC3mLn3L03z8Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Dec 2025 07:57:20 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWzKY-000000004nu-2aof;
	Sat, 20 Dec 2025 15:57:18 +0000
Date: Sat, 20 Dec 2025 23:57:01 +0800
From: kernel test robot <lkp@intel.com>
To: Brandon Brnich <b-brnich@ti.com>, Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, Darren Etheridge <detheridge@ti.com>,
	Brandon Brnich <b-brnich@ti.com>
Subject: Re: [PATCH v2] media: chips-media: wave5: Fix Potential Probe
 Resource Leak
Message-ID: <202512202300.9OkWzU1c-lkp@intel.com>
References: <20251216213413.2799499-1-b-brnich@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216213413.2799499-1-b-brnich@ti.com>

Hi Brandon,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on media-tree/master linus/master v6.19-rc1 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Brandon-Brnich/media-chips-media-wave5-Fix-Potential-Probe-Resource-Leak/20251217-053600
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20251216213413.2799499-1-b-brnich%40ti.com
patch subject: [PATCH v2] media: chips-media: wave5: Fix Potential Probe Resource Leak
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20251220/202512202300.9OkWzU1c-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202300.9OkWzU1c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202300.9OkWzU1c-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/chips-media/wave5/wave5-vpu.c:344:11: error: no member named 'irq_thread' in 'struct vpu_device'
     344 |         if (dev->irq_thread) {
         |             ~~~  ^
   drivers/media/platform/chips-media/wave5/wave5-vpu.c:345:21: error: no member named 'irq_thread' in 'struct vpu_device'
     345 |                 kthread_stop(dev->irq_thread);
         |                              ~~~  ^
>> drivers/media/platform/chips-media/wave5/wave5-vpu.c:346:12: error: no member named 'irq_sem' in 'struct vpu_device'
     346 |                 up(&dev->irq_sem);
         |                     ~~~  ^
   drivers/media/platform/chips-media/wave5/wave5-vpu.c:347:8: error: no member named 'irq_thread' in 'struct vpu_device'
     347 |                 dev->irq_thread = NULL;
         |                 ~~~  ^
   4 errors generated.


vim +344 drivers/media/platform/chips-media/wave5/wave5-vpu.c

   195	
   196	static int wave5_vpu_probe(struct platform_device *pdev)
   197	{
   198		int ret;
   199		struct vpu_device *dev;
   200		const struct wave5_match_data *match_data;
   201		u32 fw_revision;
   202	
   203		match_data = device_get_match_data(&pdev->dev);
   204		if (!match_data) {
   205			dev_err(&pdev->dev, "missing device match data\n");
   206			return -EINVAL;
   207		}
   208	
   209		/* physical addresses limited to 32 bits */
   210		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
   211		if (ret) {
   212			dev_err(&pdev->dev, "Failed to set DMA mask: %d\n", ret);
   213			return ret;
   214		}
   215	
   216		dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
   217		if (!dev)
   218			return -ENOMEM;
   219	
   220		dev->vdb_register = devm_platform_ioremap_resource(pdev, 0);
   221		if (IS_ERR(dev->vdb_register))
   222			return PTR_ERR(dev->vdb_register);
   223		ida_init(&dev->inst_ida);
   224	
   225		mutex_init(&dev->dev_lock);
   226		mutex_init(&dev->hw_lock);
   227		dev_set_drvdata(&pdev->dev, dev);
   228		dev->dev = &pdev->dev;
   229	
   230		dev->resets = devm_reset_control_array_get_optional_exclusive(&pdev->dev);
   231		if (IS_ERR(dev->resets)) {
   232			return dev_err_probe(&pdev->dev, PTR_ERR(dev->resets),
   233					     "Failed to get reset control\n");
   234		}
   235	
   236		ret = reset_control_deassert(dev->resets);
   237		if (ret)
   238			return dev_err_probe(&pdev->dev, ret, "Failed to deassert resets\n");
   239	
   240		ret = devm_clk_bulk_get_all(&pdev->dev, &dev->clks);
   241	
   242		/* continue without clock, assume externally managed */
   243		if (ret < 0) {
   244			dev_warn(&pdev->dev, "Getting clocks, fail: %d\n", ret);
   245			ret = 0;
   246		}
   247		dev->num_clks = ret;
   248	
   249		ret = clk_bulk_prepare_enable(dev->num_clks, dev->clks);
   250		if (ret) {
   251			dev_err(&pdev->dev, "Enabling clocks, fail: %d\n", ret);
   252			goto err_reset_assert;
   253		}
   254	
   255		dev->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
   256		if (!dev->sram_pool)
   257			dev_warn(&pdev->dev, "sram node not found\n");
   258	
   259		dev->sram_size = match_data->sram_size;
   260	
   261		dev->product_code = wave5_vdi_read_register(dev, VPU_PRODUCT_CODE_REGISTER);
   262		ret = wave5_vdi_init(&pdev->dev);
   263		if (ret < 0) {
   264			dev_err(&pdev->dev, "wave5_vdi_init, fail: %d\n", ret);
   265			goto err_clk_dis;
   266		}
   267		dev->product = wave5_vpu_get_product_id(dev);
   268	
   269		dev->irq = platform_get_irq(pdev, 0);
   270		if (dev->irq < 0) {
   271			dev_err(&pdev->dev, "failed to get irq resource, falling back to polling\n");
   272			hrtimer_setup(&dev->hrtimer, &wave5_vpu_timer_callback, CLOCK_MONOTONIC,
   273				      HRTIMER_MODE_REL_PINNED);
   274			dev->worker = kthread_run_worker(0, "vpu_irq_thread");
   275			if (IS_ERR(dev->worker)) {
   276				dev_err(&pdev->dev, "failed to create vpu irq worker\n");
   277				ret = PTR_ERR(dev->worker);
   278				goto err_vdi_release;
   279			}
   280			dev->vpu_poll_interval = vpu_poll_interval;
   281			kthread_init_work(&dev->work, wave5_vpu_irq_work_fn);
   282		} else {
   283			ret = devm_request_threaded_irq(&pdev->dev, dev->irq, NULL,
   284							wave5_vpu_irq_thread, IRQF_ONESHOT, "vpu_irq", dev);
   285			if (ret) {
   286				dev_err(&pdev->dev, "Register interrupt handler, fail: %d\n", ret);
   287				goto err_enc_unreg;
   288			}
   289		}
   290	
   291		INIT_LIST_HEAD(&dev->instances);
   292		ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
   293		if (ret) {
   294			dev_err(&pdev->dev, "v4l2_device_register, fail: %d\n", ret);
   295			goto err_irq_release;
   296		}
   297	
   298		if (match_data->flags & WAVE5_IS_DEC) {
   299			ret = wave5_vpu_dec_register_device(dev);
   300			if (ret) {
   301				dev_err(&pdev->dev, "wave5_vpu_dec_register_device, fail: %d\n", ret);
   302				goto err_v4l2_unregister;
   303			}
   304		}
   305		if (match_data->flags & WAVE5_IS_ENC) {
   306			ret = wave5_vpu_enc_register_device(dev);
   307			if (ret) {
   308				dev_err(&pdev->dev, "wave5_vpu_enc_register_device, fail: %d\n", ret);
   309				goto err_dec_unreg;
   310			}
   311		}
   312	
   313		ret = wave5_vpu_load_firmware(&pdev->dev, match_data->fw_name, &fw_revision);
   314		if (ret) {
   315			dev_err(&pdev->dev, "wave5_vpu_load_firmware, fail: %d\n", ret);
   316			goto err_enc_unreg;
   317		}
   318	
   319		dev_info(&pdev->dev, "Added wave5 driver with caps: %s %s\n",
   320			 (match_data->flags & WAVE5_IS_ENC) ? "'ENCODE'" : "",
   321			 (match_data->flags & WAVE5_IS_DEC) ? "'DECODE'" : "");
   322		dev_info(&pdev->dev, "Product Code:      0x%x\n", dev->product_code);
   323		dev_info(&pdev->dev, "Firmware Revision: %u\n", fw_revision);
   324	
   325		pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
   326		pm_runtime_use_autosuspend(&pdev->dev);
   327		pm_runtime_enable(&pdev->dev);
   328		wave5_vpu_sleep_wake(&pdev->dev, true, NULL, 0);
   329	
   330		return 0;
   331	
   332	err_enc_unreg:
   333		if (match_data->flags & WAVE5_IS_ENC)
   334			wave5_vpu_enc_unregister_device(dev);
   335	err_dec_unreg:
   336		if (match_data->flags & WAVE5_IS_DEC)
   337			wave5_vpu_dec_unregister_device(dev);
   338	err_v4l2_unregister:
   339		v4l2_device_unregister(&dev->v4l2_dev);
   340	err_irq_release:
   341		if (dev->irq < 0)
   342			kthread_destroy_worker(dev->worker);
   343	err_vdi_release:
 > 344		if (dev->irq_thread) {
   345			kthread_stop(dev->irq_thread);
 > 346			up(&dev->irq_sem);
   347			dev->irq_thread = NULL;
   348		}
   349		wave5_vdi_release(&pdev->dev);
   350	err_clk_dis:
   351		clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
   352	err_reset_assert:
   353		reset_control_assert(dev->resets);
   354	
   355		return ret;
   356	}
   357	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

