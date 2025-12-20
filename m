Return-Path: <linux-media+bounces-49240-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DA7CD3343
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 17:08:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EAC48300A9DB
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 16:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D73D2FBE12;
	Sat, 20 Dec 2025 16:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SLx5ZbdR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DFA2EDD50;
	Sat, 20 Dec 2025 16:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766246907; cv=none; b=ZoiNJ9bviMb4FkzYFR/RDVhbZAX6IDpCLu9zFmKdb370imTqaQ+Wql54YitkE+DcG5USPzy6yr5+z4fdOwSV7OhuMC3pTlGjYJb3lpx3Lz8OYG2X5fgq6nDJwe8HWHqbIpYn/tEI4Zufg11iO1+J0i2nMgcOmudryXAs+AYetO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766246907; c=relaxed/simple;
	bh=Zq48E7/RkkxWnHTjouQZZb0woKg+1ZxxOOM0dJYHgzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ki0OOLjWH1Q3jSMqp7ybUjula+xo0bkBqBASezKOVt4U1mIl3F6Udw4ts6JCA8+jZLoIXjs8oIY28lX7mvZV9NZZZ7iFAOnNVs30tLM+yLDraAolmUoOH+e4g5uCSbPeEFwU+0Vwew7lfotxMYW95mdDI6Y4qzMvCRSVJChy/NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SLx5ZbdR; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766246906; x=1797782906;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zq48E7/RkkxWnHTjouQZZb0woKg+1ZxxOOM0dJYHgzI=;
  b=SLx5ZbdRDUjQGoIT1uuFitwrtVZVnJOMF//r3o6Jh0TahgK41Eo7GabN
   QM1kdWH76CNps0FuLdoXakw7esl+Wpztt+O48dUih9WGdGxJfL/hf81+w
   hiGNMDBlAAwtAHkQMB1MASaRok64EpOUdqEVJFK2VVJKt4kc1lNcMmXSS
   n+AnxzzyekiOBD2T0LmUN7hgDftK/t8mK5oGuPpOsYI/E0pLhdlO2MP/+
   rlEkSxf65afQE7vJtgogIOeY8S0LMnyG8pS2EtYOY1xsDLIQW5WhUuQaf
   O9RleLfQRdYVjGl3KKUHZamYoZzooniJGbjfTDuTpdlwefgJYn2MsnsqS
   g==;
X-CSE-ConnectionGUID: 8JcT0NOOQpWx+WeYlrxtWg==
X-CSE-MsgGUID: jwcF4CNcRFehKlMomrwL/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="72037908"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="72037908"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 08:08:25 -0800
X-CSE-ConnectionGUID: csvr/LSASiSadPYzS8Q82A==
X-CSE-MsgGUID: MmOAGYziTE+ECbEczsS0tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199036385"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Dec 2025 08:08:23 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWzVF-000000004pt-0VMm;
	Sat, 20 Dec 2025 16:08:21 +0000
Date: Sun, 21 Dec 2025 00:07:50 +0800
From: kernel test robot <lkp@intel.com>
To: Brandon Brnich <b-brnich@ti.com>, Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Darren Etheridge <detheridge@ti.com>,
	Brandon Brnich <b-brnich@ti.com>
Subject: Re: [PATCH v2] media: chips-media: wave5: Fix Potential Probe
 Resource Leak
Message-ID: <202512202333.BCXFQsaR-lkp@intel.com>
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
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20251220/202512202333.BCXFQsaR-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202333.BCXFQsaR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202333.BCXFQsaR-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/chips-media/wave5/wave5-vpu.c: In function 'wave5_vpu_probe':
>> drivers/media/platform/chips-media/wave5/wave5-vpu.c:344:16: error: 'struct vpu_device' has no member named 'irq_thread'
     344 |         if (dev->irq_thread) {
         |                ^~
   drivers/media/platform/chips-media/wave5/wave5-vpu.c:345:33: error: 'struct vpu_device' has no member named 'irq_thread'
     345 |                 kthread_stop(dev->irq_thread);
         |                                 ^~
>> drivers/media/platform/chips-media/wave5/wave5-vpu.c:346:24: error: 'struct vpu_device' has no member named 'irq_sem'
     346 |                 up(&dev->irq_sem);
         |                        ^~
   drivers/media/platform/chips-media/wave5/wave5-vpu.c:347:20: error: 'struct vpu_device' has no member named 'irq_thread'
     347 |                 dev->irq_thread = NULL;
         |                    ^~


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

