Return-Path: <linux-media+bounces-26029-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F077AA31B30
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 02:31:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A008916535E
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 01:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9B94AEE2;
	Wed, 12 Feb 2025 01:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kfJS5Tkx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296E72868B;
	Wed, 12 Feb 2025 01:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739323897; cv=none; b=Dnh1sMM/hrqFxqnT4vXjndSXqV+sW5a6Q4BCpDpCwKhQQaapc/oRrvZ+GEwcIq/AXcOSKJesBE9jAhCpxyWDxQlyMWlgb0siTd1OKs0rMB2z2Vyfgmm09HilppvO9tT/Im0qA04/yx8dx+tDaWhGxesDl6aA2oK7Ixn898/c3Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739323897; c=relaxed/simple;
	bh=2P9OIohU3wD9oOGB9eNAVlkpx3MFF4NEtZDybI+Itwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f45XtH/QD5xs8qx7LDj2VvJPCcAPUnbv0eE0MqSkn6euPXwX4+wlv3qe+DJmDB5O27vYISpGj9fV4VXkLAALXd+O+c5SI++INjYd4dljl3PIvDjx1i7DIzBtGIxGMpIXZ7lYl4MECV8JKwI0jTJEfmO56Ui4MALOz3PpqmC5jAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kfJS5Tkx; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739323897; x=1770859897;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2P9OIohU3wD9oOGB9eNAVlkpx3MFF4NEtZDybI+Itwc=;
  b=kfJS5TkxG3v8D9m/OauKAhwQXSlkZtMPqIvG8An47fdjz/02weK2CLNt
   lFoErbt20fk7xQBj4wfQ4flKqIEbM+HfTIAtEngILSmWzEVoFr19HWzzr
   FKIyV2HMFDvRGL4JiqxrxbSnv5K8ydtcaXtYP9llkEs930rldUbsmyF3F
   99e+C7UfDuPsm9IcmGMUEU7czmVikb8H0eBaNXjlKA1lJyNtQpwru9slB
   rghFHx8UTad933QTdBQCTJEZGOrnv9+iIBD4oul7MQSCZqPCxONHEIjqH
   RlI1LHaSxMKeVQPmQsH2rqg+8fKqvqF4FowZ4kbFqWkJqsqzfr1EtpfAb
   g==;
X-CSE-ConnectionGUID: IgxNime7R4SQxeBOostMaQ==
X-CSE-MsgGUID: LttPDhRDSdShjmIaS5Pm7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="57373635"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="57373635"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 17:31:36 -0800
X-CSE-ConnectionGUID: NsmMaeFAR+qZuqttuSstfQ==
X-CSE-MsgGUID: J6ybvcBxQWeW6pWDcUMKfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="112430138"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Feb 2025 17:31:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti1b7-0014wT-15;
	Wed, 12 Feb 2025 01:31:29 +0000
Date: Wed, 12 Feb 2025 09:31:02 +0800
From: kernel test robot <lkp@intel.com>
To: Nas Chung <nas.chung@chipsnmedia.com>, mchehab@kernel.org,
	hverkuil@xs4all.nl, sebastian.fricke@collabora.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org, jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com, Nas Chung <nas.chung@chipsnmedia.com>
Subject: Re: [PATCH 7/8] media: chips-media: wave6: Add Wave6 control driver
Message-ID: <202502120928.wbtfGrUk-lkp@intel.com>
References: <20250210090725.4580-8-nas.chung@chipsnmedia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210090725.4580-8-nas.chung@chipsnmedia.com>

Hi Nas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linuxtv-media-pending/master]
[also build test WARNING on arm64/for-next/core robh/for-next linus/master v6.14-rc2 next-20250210]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nas-Chung/media-platform-chips-media-wave5-Rename-Kconfig-parameter/20250210-171144
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250210090725.4580-8-nas.chung%40chipsnmedia.com
patch subject: [PATCH 7/8] media: chips-media: wave6: Add Wave6 control driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250212/202502120928.wbtfGrUk-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120928.wbtfGrUk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120928.wbtfGrUk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/chips-media/wave6/wave6-vpu-ctrl.c:384:4: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     383 |                 dev_err(ctrl->dev, "firmware size (%ld > %zd) is too big\n",
         |                                                    ~~~
         |                                                    %zu
     384 |                         fw->size, ctrl->boot_mem.size);
         |                         ^~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
>> drivers/media/platform/chips-media/wave6/wave6-vpu-ctrl.c:929:58: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     928 |                 dev_info(&pdev->dev, "sram 0x%pad, 0x%pad, size 0x%lx\n",
         |                                                                   ~~~
         |                                                                   %zx
     929 |                          &ctrl->sram_buf.phys_addr, &ctrl->sram_buf.dma_addr, ctrl->sram_buf.size);
         |                                                                               ^~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   2 warnings generated.


vim +384 drivers/media/platform/chips-media/wave6/wave6-vpu-ctrl.c

   357	
   358	static void wave6_vpu_ctrl_load_firmware(const struct firmware *fw, void *context)
   359	{
   360		struct vpu_ctrl *ctrl = context;
   361		struct wave6_vpu_entity *entity = ctrl->current_entity;
   362		u32 product_code;
   363		int ret;
   364	
   365		ret = pm_runtime_resume_and_get(ctrl->dev);
   366		if (ret) {
   367			dev_err(ctrl->dev, "pm runtime resume fail, ret = %d\n", ret);
   368			mutex_lock(&ctrl->ctrl_lock);
   369			wave6_vpu_ctrl_set_state(ctrl, WAVE6_VPU_STATE_OFF);
   370			ctrl->current_entity = NULL;
   371			mutex_unlock(&ctrl->ctrl_lock);
   372			release_firmware(fw);
   373			return;
   374		}
   375	
   376		if (!fw || !fw->data) {
   377			dev_err(ctrl->dev, "No firmware.\n");
   378			ret = -EINVAL;
   379			goto exit;
   380		}
   381	
   382		if (fw->size + WAVE6_EXTRA_CODE_BUF_SIZE > wave6_vpu_ctrl_get_code_buf_size(ctrl)) {
   383			dev_err(ctrl->dev, "firmware size (%ld > %zd) is too big\n",
 > 384				fw->size, ctrl->boot_mem.size);
   385			ret = -EINVAL;
   386			goto exit;
   387		}
   388	
   389		product_code = entity->read_reg(entity->dev, W6_VPU_RET_PRODUCT_VERSION);
   390		if (!PRODUCT_CODE_W_SERIES(product_code)) {
   391			dev_err(ctrl->dev, "unknown product : %08x\n", product_code);
   392			ret = -EINVAL;
   393			goto exit;
   394		}
   395	
   396		memcpy(ctrl->boot_mem.vaddr, fw->data, fw->size);
   397	
   398	exit:
   399		mutex_lock(&ctrl->ctrl_lock);
   400		if (!ret && wave6_vpu_ctrl_find_entity(ctrl, ctrl->current_entity)) {
   401			wave6_vpu_ctrl_remap_code_buffer(ctrl);
   402			ret = wave6_vpu_ctrl_init_vpu(ctrl);
   403		} else {
   404			ret = -EINVAL;
   405		}
   406		mutex_unlock(&ctrl->ctrl_lock);
   407	
   408		pm_runtime_put_sync(ctrl->dev);
   409		release_firmware(fw);
   410	
   411		mutex_lock(&ctrl->ctrl_lock);
   412		ctrl->current_entity = NULL;
   413		if (ret)
   414			wave6_vpu_ctrl_set_state(ctrl, WAVE6_VPU_STATE_OFF);
   415		else
   416			wave6_vpu_ctrl_boot_done(ctrl, 0);
   417		mutex_unlock(&ctrl->ctrl_lock);
   418	
   419		wake_up_interruptible_all(&ctrl->load_fw_wq);
   420	}
   421	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

