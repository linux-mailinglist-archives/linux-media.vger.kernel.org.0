Return-Path: <linux-media+bounces-45404-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E39C01ECF
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 16:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32F02189FF2C
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 14:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DBF84C85;
	Thu, 23 Oct 2025 14:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gKN02elx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010552EB85B;
	Thu, 23 Oct 2025 14:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761231414; cv=none; b=Kz+nyvNCyJO7yaYN2MVRsZD/YEnVgdpdFr9/WCwPLjTEnsuLBTasnDfHoCbro8fKeru9GATZdsq8nla+NVJjLMsUuZrsy5/yjUU+3T4hGziuonEzxqmqXEjvkJvJenMYI2b5+zDEr+AbuHZ61B4KW7c9KeS/DxlunwJQ8ARjfCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761231414; c=relaxed/simple;
	bh=7olidiH8q0/8G7O6FXsstzlHmmlLC9Q9UzleO0D6wfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XF+IaCcDy9AYB5VTzRGAHEMnAya6OqK8mc+bbkJyvhQGetXzU4Klc9d0E20TLtlDQ/+M1Kk4GSbsvHm6h0vvAqWL251fo+iJx1w95pweGKNVUP6izC5l8LWvXYJxQg9k59lJqf7/W7Y5cusjZLbtewFY1zJY+5g3hiqJ1BRT5Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gKN02elx; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761231414; x=1792767414;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7olidiH8q0/8G7O6FXsstzlHmmlLC9Q9UzleO0D6wfc=;
  b=gKN02elxjokCTxNNUeiY/KVSCJ8jMAJYjMipj9U1OUkdSjgwFiCTQ0vC
   3p8sHEdMbeeQeNfSAE3Hd2AbDaJscNrJsz/f4WaoIU8PWi6zXq9X2DQNg
   nnq5umR3A+MU89eDkqOk69YklzrBi0yIcbTAxZiKDYMJYQhzQsDLiUxHs
   bRxazR0FnLX4GFuMGHRZgtUFLGMQ41R5nHvUEscYvZdSrlfPPgmdpiUwJ
   MHL5kYFIl1kMe0mXapzsPebSiMmGj4zvl4HeDgjrDbolfI4aY1Ofq0Wxc
   Q0xxdxSIUX7605U19J40S0ULTk8vZ2BTFXU2MjyQy4HYT6VCTFuU0OH74
   A==;
X-CSE-ConnectionGUID: HJIurm0rRz2qfgk7gVe7WA==
X-CSE-MsgGUID: 8zEbro+BQh6y7KAKHgh0qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63295328"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="63295328"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 07:56:53 -0700
X-CSE-ConnectionGUID: KodoHCDJRZKJSKq8ykhktw==
X-CSE-MsgGUID: /JHLAy2LT7SuHvAPpPcTew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="214832508"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 23 Oct 2025 07:56:46 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBwk7-000DbD-1w;
	Thu, 23 Oct 2025 14:56:43 +0000
Date: Thu, 23 Oct 2025 22:56:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
	linux-cxl@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, "Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>, Hanjun Guo <guohanjun@huawei.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Shuai Xue <xueshuai@linux.alibaba.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Xiaofei Tan <tanxiaofei@huawei.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"Fabio M . De Francesco" <fabio.m.de.francesco@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Guo Weikang <guoweikang.kernel@gmail.com>, Xin Li <xin@zytor.com>
Subject: Re: [PATCH 3/6 v6] acpi/ghes: Make GHES select ACPI_APEI_PCIEAER
Message-ID: <202510232204.XIXgPWD7-lkp@intel.com>
References: <20251023122612.1326748-4-fabio.m.de.francesco@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023122612.1326748-4-fabio.m.de.francesco@linux.intel.com>

Hi Fabio,

kernel test robot noticed the following build errors:

[auto build test ERROR on 552c50713f273b494ac6c77052032a49bc9255e2]

url:    https://github.com/intel-lab-lkp/linux/commits/Fabio-M-De-Francesco/ACPI-extlog-Trace-CPER-Non-standard-Section-Body/20251023-202846
base:   552c50713f273b494ac6c77052032a49bc9255e2
patch link:    https://lore.kernel.org/r/20251023122612.1326748-4-fabio.m.de.francesco%40linux.intel.com
patch subject: [PATCH 3/6 v6] acpi/ghes: Make GHES select ACPI_APEI_PCIEAER
config: x86_64-buildonly-randconfig-004-20251023 (https://download.01.org/0day-ci/archive/20251023/202510232204.XIXgPWD7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510232204.XIXgPWD7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510232204.XIXgPWD7-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `ghes_handle_aer':
>> drivers/acpi/apei/ghes.c:626:(.text+0xf13e77): undefined reference to `cper_severity_to_aer'
>> ld: drivers/acpi/apei/ghes.c:642:(.text+0xf13f76): undefined reference to `aer_recover_queue'
   ld: vmlinux.o: in function `cxl_cper_post_prot_err':
   drivers/acpi/apei/ghes.c:753:(.text+0xf14cef): undefined reference to `cper_severity_to_aer'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ACPI_APEI_PCIEAER
   Depends on [n]: ACPI [=y] && ACPI_APEI [=y] && PCIEAER [=n]
   Selected by [y]:
   - ACPI_APEI_GHES [=y] && ACPI [=y] && ACPI_APEI [=y]


vim +626 drivers/acpi/apei/ghes.c

cf870c70a19444 Naveen N Rao 2013-07-10  599  
9852ce9ae213d3 Tyler Baicar 2017-11-28  600  /*
9852ce9ae213d3 Tyler Baicar 2017-11-28  601   * PCIe AER errors need to be sent to the AER driver for reporting and
9852ce9ae213d3 Tyler Baicar 2017-11-28  602   * recovery. The GHES severities map to the following AER severities and
9852ce9ae213d3 Tyler Baicar 2017-11-28  603   * require the following handling:
9852ce9ae213d3 Tyler Baicar 2017-11-28  604   *
9852ce9ae213d3 Tyler Baicar 2017-11-28  605   * GHES_SEV_CORRECTABLE -> AER_CORRECTABLE
9852ce9ae213d3 Tyler Baicar 2017-11-28  606   *     These need to be reported by the AER driver but no recovery is
9852ce9ae213d3 Tyler Baicar 2017-11-28  607   *     necessary.
9852ce9ae213d3 Tyler Baicar 2017-11-28  608   * GHES_SEV_RECOVERABLE -> AER_NONFATAL
9852ce9ae213d3 Tyler Baicar 2017-11-28  609   * GHES_SEV_RECOVERABLE && CPER_SEC_RESET -> AER_FATAL
9852ce9ae213d3 Tyler Baicar 2017-11-28  610   *     These both need to be reported and recovered from by the AER driver.
9852ce9ae213d3 Tyler Baicar 2017-11-28  611   * GHES_SEV_PANIC does not make it to this handling since the kernel must
9852ce9ae213d3 Tyler Baicar 2017-11-28  612   *     panic.
9852ce9ae213d3 Tyler Baicar 2017-11-28  613   */
9852ce9ae213d3 Tyler Baicar 2017-11-28  614  static void ghes_handle_aer(struct acpi_hest_generic_data *gdata)
d334a49113a4a3 Ying Huang   2010-05-18  615  {
bbcc2e7b642ed2 Tyler Baicar 2017-06-21  616  	struct cper_sec_pcie *pcie_err = acpi_hest_get_payload(gdata);
bbcc2e7b642ed2 Tyler Baicar 2017-06-21  617  
9852ce9ae213d3 Tyler Baicar 2017-11-28  618  	if (pcie_err->validation_bits & CPER_PCIE_VALID_DEVICE_ID &&
a654e5ee4f2213 Ying Huang   2011-12-08  619  	    pcie_err->validation_bits & CPER_PCIE_VALID_AER_INFO) {
a654e5ee4f2213 Ying Huang   2011-12-08  620  		unsigned int devfn;
a654e5ee4f2213 Ying Huang   2011-12-08  621  		int aer_severity;
e2abc47a5a1a9f Shiju Jose   2023-09-21  622  		u8 *aer_info;
0ba98ec9196746 Betty Dall   2013-06-06  623  
a654e5ee4f2213 Ying Huang   2011-12-08  624  		devfn = PCI_DEVFN(pcie_err->device_id.device,
a654e5ee4f2213 Ying Huang   2011-12-08  625  				  pcie_err->device_id.function);
2458d66b245e39 Tyler Baicar 2016-09-14 @626  		aer_severity = cper_severity_to_aer(gdata->error_severity);
0ba98ec9196746 Betty Dall   2013-06-06  627  
0ba98ec9196746 Betty Dall   2013-06-06  628  		/*
0ba98ec9196746 Betty Dall   2013-06-06  629  		 * If firmware reset the component to contain
0ba98ec9196746 Betty Dall   2013-06-06  630  		 * the error, we must reinitialize it before
0ba98ec9196746 Betty Dall   2013-06-06  631  		 * use, so treat it as a fatal AER error.
0ba98ec9196746 Betty Dall   2013-06-06  632  		 */
0ba98ec9196746 Betty Dall   2013-06-06  633  		if (gdata->flags & CPER_SEC_RESET)
0ba98ec9196746 Betty Dall   2013-06-06  634  			aer_severity = AER_FATAL;
0ba98ec9196746 Betty Dall   2013-06-06  635  
e2abc47a5a1a9f Shiju Jose   2023-09-21  636  		aer_info = (void *)gen_pool_alloc(ghes_estatus_pool,
e2abc47a5a1a9f Shiju Jose   2023-09-21  637  						  sizeof(struct aer_capability_regs));
e2abc47a5a1a9f Shiju Jose   2023-09-21  638  		if (!aer_info)
e2abc47a5a1a9f Shiju Jose   2023-09-21  639  			return;
e2abc47a5a1a9f Shiju Jose   2023-09-21  640  		memcpy(aer_info, pcie_err->aer_info, sizeof(struct aer_capability_regs));
e2abc47a5a1a9f Shiju Jose   2023-09-21  641  
a654e5ee4f2213 Ying Huang   2011-12-08 @642  		aer_recover_queue(pcie_err->device_id.segment,
a654e5ee4f2213 Ying Huang   2011-12-08  643  				  pcie_err->device_id.bus,
37448adfc7ce0d Lance Ortiz  2013-05-30  644  				  devfn, aer_severity,
37448adfc7ce0d Lance Ortiz  2013-05-30  645  				  (struct aer_capability_regs *)
e2abc47a5a1a9f Shiju Jose   2023-09-21  646  				  aer_info);
a654e5ee4f2213 Ying Huang   2011-12-08  647  	}
3c5b977f06b754 Tyler Baicar 2017-11-28  648  }
a654e5ee4f2213 Ying Huang   2011-12-08  649  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

