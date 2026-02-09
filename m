Return-Path: <linux-media+bounces-52442-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECZPIBUbimmtHAAAu9opvQ
	(envelope-from <linux-media+bounces-52442-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 18:36:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4E9113168
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 18:36:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91706303182C
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 17:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00DB3803E1;
	Mon,  9 Feb 2026 17:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T02fuz74"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11435306483;
	Mon,  9 Feb 2026 17:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770658558; cv=none; b=RSHSoDN6lxv69aRNZRqoMokU0rV5un75XqMiaqwTQqNgBviy/fLvkq/cTVR/LCN8CAOQ8U2m/TF+ueAXhjd/cr9BW7m/KZWFdUABuqFn7tnBYbkEJszkFflMD5eClJ9HizdQwyP3pRL5MmPAL+1jgLtsO0eA/72jy+KZaOdv8k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770658558; c=relaxed/simple;
	bh=B2YVgP4mFdoni9nlw/4P6Z0xbqKQZpcmZgr3bEBb7Do=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jmrukpo4I5VfASV9esZwDWDABBb24zur2qXJA0nBucce53w7qu+2kma0JUDG+u/rTxNFYq1PDSkZBwDBM+k5KhooA+aS4Y1j4L257sJoRy8DBJHqdY6jOrCyfp2eph+/+M2P33TCFQnlQMkfuyLXV3Zva47WIXe+uoPsVmPXdmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T02fuz74; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770658558; x=1802194558;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B2YVgP4mFdoni9nlw/4P6Z0xbqKQZpcmZgr3bEBb7Do=;
  b=T02fuz744TBgQPOcbua1T+THnIq5Fu16smMsO1uAVaMyMNSZh4axTpXk
   J/N3rJCsOWg4jSliwvtgNrBBdiPZIqY+w1/97tz6CcaOUErLh+ktbOO4b
   RxMVmqW/w5Tz4LS5YpPCzeYjTfBmcOxrtl3ZzCAgaPKMjIQ1VWNAlK7Zu
   55xfiUgek/5D8u4JcwnEfCFfYeFR+jAuTMO06/QxGivOobE5yL2Lswsdb
   joDV8ftjfsGTL16or6LA1DXnKYQ8gHazXZC42QWnJs+9/y98Dkk9oX5aO
   wNdN79urgz+4mXFfpIQgtY5o3KGwieghkZ1f0lmNXnnj9yrCqHt8f9L9Q
   A==;
X-CSE-ConnectionGUID: MZp68MhoQRaH6gs3zhlVhw==
X-CSE-MsgGUID: z6aLxNS3SV6VzZu7dUJpcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="74375257"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="74375257"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 09:35:57 -0800
X-CSE-ConnectionGUID: CtqmFnAcQqyVF+9CkbvHlg==
X-CSE-MsgGUID: HQWyyw96QNGH/S8O8Rg9bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="216622493"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Feb 2026 09:35:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpVAp-00000000oB7-3Hr0;
	Mon, 09 Feb 2026 17:35:47 +0000
Date: Tue, 10 Feb 2026 01:35:08 +0800
From: kernel test robot <lkp@intel.com>
To: toast1599 <swizzguy76@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Bingbu Cao <bingbu.cao@intel.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, toast1599 <swizzguy76@gmail.com>
Subject: Re: [PATCH] staging: media: ipu7: refine PHY, ABI and add metadata
 support
Message-ID: <202602100115.jslcyiY6-lkp@intel.com>
References: <20260209081025.100080-1-swizzguy76@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209081025.100080-1-swizzguy76@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52442-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,linuxfoundation.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,01.org:url]
X-Rspamd-Queue-Id: AE4E9113168
X-Rspamd-Action: no action

Hi toast1599,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/toast1599/staging-media-ipu7-refine-PHY-ABI-and-add-metadata-support/20260209-161453
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260209081025.100080-1-swizzguy76%40gmail.com
patch subject: [PATCH] staging: media: ipu7: refine PHY, ABI and add metadata support
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260210/202602100115.jslcyiY6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100115.jslcyiY6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100115.jslcyiY6-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/staging/media/ipu7/ipu7.c:2047:24: error: 'IPU_FREQ_CTL_RATIO_SHIFT' undeclared here (not in a function)
    2047 |         .ratio_shift = IPU_FREQ_CTL_RATIO_SHIFT,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/ipu7/ipu7.c:2048:17: error: 'IPU_FREQ_CTL_CDYN' undeclared here (not in a function)
    2048 |         .cdyn = IPU_FREQ_CTL_CDYN,
         |                 ^~~~~~~~~~~~~~~~~
>> drivers/staging/media/ipu7/ipu7.c:2049:23: error: 'IPU_FREQ_CTL_CDYN_SHIFT' undeclared here (not in a function); did you mean 'IPU7_BUTTRESS_FREQ_CTL_CDYN_SHIFT'?
    2049 |         .cdyn_shift = IPU_FREQ_CTL_CDYN_SHIFT,
         |                       ^~~~~~~~~~~~~~~~~~~~~~~
         |                       IPU7_BUTTRESS_FREQ_CTL_CDYN_SHIFT
>> drivers/staging/media/ipu7/ipu7.c:2050:21: error: 'BUTTRESS_REG_IS_WORKPOINT_REQ' undeclared here (not in a function); did you mean 'IPU7_BUTTRESS_REG_IS_WORKPOINT_REQ'?
    2050 |         .freq_ctl = BUTTRESS_REG_IS_WORKPOINT_REQ,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                     IPU7_BUTTRESS_REG_IS_WORKPOINT_REQ
>> drivers/staging/media/ipu7/ipu7.c:2051:26: error: 'IPU_BUTTRESS_PWR_STATE_IS_PWR_SHIFT' undeclared here (not in a function); did you mean 'IPU7_BUTTRESS_PWR_STATE_IS_PWR_SHIFT'?
    2051 |         .pwr_sts_shift = IPU_BUTTRESS_PWR_STATE_IS_PWR_SHIFT,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                          IPU7_BUTTRESS_PWR_STATE_IS_PWR_SHIFT
>> drivers/staging/media/ipu7/ipu7.c:2052:25: error: 'IPU_BUTTRESS_PWR_STATE_IS_PWR_MASK' undeclared here (not in a function); did you mean 'IPU7_BUTTRESS_PWR_STATE_IS_PWR_MASK'?
    2052 |         .pwr_sts_mask = IPU_BUTTRESS_PWR_STATE_IS_PWR_MASK,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         IPU7_BUTTRESS_PWR_STATE_IS_PWR_MASK
>> drivers/staging/media/ipu7/ipu7.c:2053:23: error: 'IPU_BUTTRESS_PWR_STATE_UP_DONE' undeclared here (not in a function); did you mean 'IPU7_BUTTRESS_PWR_STATE_UP_DONE'?
    2053 |         .pwr_sts_on = IPU_BUTTRESS_PWR_STATE_UP_DONE,
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                       IPU7_BUTTRESS_PWR_STATE_UP_DONE
>> drivers/staging/media/ipu7/ipu7.c:2054:24: error: 'IPU_BUTTRESS_PWR_STATE_DN_DONE' undeclared here (not in a function); did you mean 'IPU7_BUTTRESS_PWR_STATE_DN_DONE'?
    2054 |         .pwr_sts_off = IPU_BUTTRESS_PWR_STATE_DN_DONE,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        IPU7_BUTTRESS_PWR_STATE_DN_DONE
>> drivers/staging/media/ipu7/ipu7.c:2055:21: error: 'BUTTRESS_OVERRIDE_IS_CLK' undeclared here (not in a function); did you mean 'IPU7_BUTTRESS_OVERRIDE_IS_CLK'?
    2055 |         .ovrd_clk = BUTTRESS_OVERRIDE_IS_CLK,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
         |                     IPU7_BUTTRESS_OVERRIDE_IS_CLK
>> drivers/staging/media/ipu7/ipu7.c:2056:24: error: 'BUTTRESS_OWN_ACK_IS_CLK' undeclared here (not in a function); did you mean 'IPU7_BUTTRESS_OWN_ACK_IS_CLK'?
    2056 |         .own_clk_ack = BUTTRESS_OWN_ACK_IS_CLK,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~
         |                        IPU7_BUTTRESS_OWN_ACK_IS_CLK
>> drivers/staging/media/ipu7/ipu7.c:2065:21: error: 'BUTTRESS_REG_PS_WORKPOINT_REQ' undeclared here (not in a function); did you mean 'IPU7_BUTTRESS_REG_PS_WORKPOINT_REQ'?
    2065 |         .freq_ctl = BUTTRESS_REG_PS_WORKPOINT_REQ,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                     IPU7_BUTTRESS_REG_PS_WORKPOINT_REQ
>> drivers/staging/media/ipu7/ipu7.c:2066:26: error: 'IPU_BUTTRESS_PWR_STATE_PS_PWR_SHIFT' undeclared here (not in a function); did you mean 'IPU7_BUTTRESS_PWR_STATE_PS_PWR_SHIFT'?
    2066 |         .pwr_sts_shift = IPU_BUTTRESS_PWR_STATE_PS_PWR_SHIFT,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                          IPU7_BUTTRESS_PWR_STATE_PS_PWR_SHIFT
>> drivers/staging/media/ipu7/ipu7.c:2067:25: error: 'IPU_BUTTRESS_PWR_STATE_PS_PWR_MASK' undeclared here (not in a function); did you mean 'IPU7_BUTTRESS_PWR_STATE_PS_PWR_MASK'?
    2067 |         .pwr_sts_mask = IPU_BUTTRESS_PWR_STATE_PS_PWR_MASK,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         IPU7_BUTTRESS_PWR_STATE_PS_PWR_MASK
>> drivers/staging/media/ipu7/ipu7.c:2070:21: error: 'BUTTRESS_OVERRIDE_PS_CLK' undeclared here (not in a function); did you mean 'IPU7_BUTTRESS_OVERRIDE_PS_CLK'?
    2070 |         .ovrd_clk = BUTTRESS_OVERRIDE_PS_CLK,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
         |                     IPU7_BUTTRESS_OVERRIDE_PS_CLK
>> drivers/staging/media/ipu7/ipu7.c:2071:24: error: 'BUTTRESS_OWN_ACK_PS_CLK' undeclared here (not in a function); did you mean 'IPU7_BUTTRESS_OWN_ACK_PS_CLK'?
    2071 |         .own_clk_ack = BUTTRESS_OWN_ACK_PS_CLK,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~
         |                        IPU7_BUTTRESS_OWN_ACK_PS_CLK
>> drivers/staging/media/ipu7/ipu7.c:2098:24: error: 'BUTTRESS_OWN_ACK_PS_PLL' undeclared here (not in a function); did you mean 'IPU7_BUTTRESS_OWN_ACK_PS_PLL'?
    2098 |         .own_clk_ack = BUTTRESS_OWN_ACK_PS_PLL,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~
         |                        IPU7_BUTTRESS_OWN_ACK_PS_PLL
   drivers/staging/media/ipu7/ipu7.c: In function 'ipu7_dump_fw_error_log':
>> drivers/staging/media/ipu7/ipu7.c:2242:48: error: 'BUTTRESS_REG_FW_GP24' undeclared (first use in this function); did you mean 'IPU7_BUTTRESS_REG_FW_GP24'?
    2242 |                                                BUTTRESS_REG_FW_GP24 :
         |                                                ^~~~~~~~~~~~~~~~~~~~
         |                                                IPU7_BUTTRESS_REG_FW_GP24
   drivers/staging/media/ipu7/ipu7.c:2242:48: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/staging/media/ipu7/ipu7.c:2243:48: error: 'BUTTRESS_REG_FW_GP8' undeclared (first use in this function); did you mean 'IPU7_BUTTRESS_REG_FW_GP8'?
    2243 |                                                BUTTRESS_REG_FW_GP8);
         |                                                ^~~~~~~~~~~~~~~~~~~
         |                                                IPU7_BUTTRESS_REG_FW_GP8
--
   In file included from include/linux/device.h:15,
                    from drivers/staging/media/ipu7/ipu7-mmu.c:14:
   drivers/staging/media/ipu7/ipu7-mmu.c: In function 'mmu_irq_handler':
>> drivers/staging/media/ipu7/ipu7-mmu.c:63:32: error: 'struct ipu7_mmu' has no member named 'adev'; did you mean 'dev'?
      63 |                 dev_info(&mmu->adev->auxdev.dev, "mmu %s irq_cause = 0x%x", mmu->mmu_hw[i].name,
         |                                ^~~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/staging/media/ipu7/ipu7-mmu.c:63:17: note: in expansion of macro 'dev_info'
      63 |                 dev_info(&mmu->adev->auxdev.dev, "mmu %s irq_cause = 0x%x", mmu->mmu_hw[i].name,
         |                 ^~~~~~~~
--
   drivers/staging/media/ipu7/ipu7-buttress.c: In function 'ipu_buttress_isr':
>> drivers/staging/media/ipu7/ipu7-buttress.c:348:39: error: 'INTERRUPT_STATUS' undeclared (first use in this function)
     348 |         pb_irq = readl(isp->pb_base + INTERRUPT_STATUS);
         |                                       ^~~~~~~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-buttress.c:348:39: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/staging/media/ipu7/ipu7-buttress.c:352:45: error: 'BTRS_LOCAL_INTERRUPT_MASK' undeclared (first use in this function)
     352 |         pb_local_irq = readl(isp->pb_base + BTRS_LOCAL_INTERRUPT_MASK);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/device.h:15,
                    from drivers/staging/media/ipu7/ipu7-buttress.c:10:
>> drivers/staging/media/ipu7/ipu7-buttress.c:357:47: error: 'ATS_ERROR_LOG1' undeclared (first use in this function)
     357 |                          readl(isp->pb_base + ATS_ERROR_LOG1),
         |                                               ^~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-buttress.c:356:17: note: in expansion of macro 'dev_warn'
     356 |                 dev_warn(dev, "Details: %x %x %x %x %x %x %x %x\n",
         |                 ^~~~~~~~
>> drivers/staging/media/ipu7/ipu7-buttress.c:358:47: error: 'ATS_ERROR_LOG2' undeclared (first use in this function)
     358 |                          readl(isp->pb_base + ATS_ERROR_LOG2),
         |                                               ^~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-buttress.c:356:17: note: in expansion of macro 'dev_warn'
     356 |                 dev_warn(dev, "Details: %x %x %x %x %x %x %x %x\n",
         |                 ^~~~~~~~
>> drivers/staging/media/ipu7/ipu7-buttress.c:359:47: error: 'CFI_0_ERROR_LOG' undeclared (first use in this function)
     359 |                          readl(isp->pb_base + CFI_0_ERROR_LOG),
         |                                               ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-buttress.c:356:17: note: in expansion of macro 'dev_warn'
     356 |                 dev_warn(dev, "Details: %x %x %x %x %x %x %x %x\n",
         |                 ^~~~~~~~
>> drivers/staging/media/ipu7/ipu7-buttress.c:360:47: error: 'CFI_1_ERROR_LOGGING' undeclared (first use in this function)
     360 |                          readl(isp->pb_base + CFI_1_ERROR_LOGGING),
         |                                               ^~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-buttress.c:356:17: note: in expansion of macro 'dev_warn'
     356 |                 dev_warn(dev, "Details: %x %x %x %x %x %x %x %x\n",
         |                 ^~~~~~~~
>> drivers/staging/media/ipu7/ipu7-buttress.c:361:47: error: 'IMR_ERROR_LOGGING_LOW' undeclared (first use in this function)
     361 |                          readl(isp->pb_base + IMR_ERROR_LOGGING_LOW),
         |                                               ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-buttress.c:356:17: note: in expansion of macro 'dev_warn'
     356 |                 dev_warn(dev, "Details: %x %x %x %x %x %x %x %x\n",
         |                 ^~~~~~~~
>> drivers/staging/media/ipu7/ipu7-buttress.c:362:47: error: 'IMR_ERROR_LOGGING_HIGH' undeclared (first use in this function)
     362 |                          readl(isp->pb_base + IMR_ERROR_LOGGING_HIGH),
         |                                               ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-buttress.c:356:17: note: in expansion of macro 'dev_warn'
     356 |                 dev_warn(dev, "Details: %x %x %x %x %x %x %x %x\n",
         |                 ^~~~~~~~
>> drivers/staging/media/ipu7/ipu7-buttress.c:363:47: error: 'IMR_ERROR_LOGGING_CFI_1_LOW' undeclared (first use in this function)
     363 |                          readl(isp->pb_base + IMR_ERROR_LOGGING_CFI_1_LOW),
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-buttress.c:356:17: note: in expansion of macro 'dev_warn'
     356 |                 dev_warn(dev, "Details: %x %x %x %x %x %x %x %x\n",
         |                 ^~~~~~~~
>> drivers/staging/media/ipu7/ipu7-buttress.c:364:47: error: 'IMR_ERROR_LOGGING_CFI_1_HIGH' undeclared (first use in this function)
     364 |                          readl(isp->pb_base + IMR_ERROR_LOGGING_CFI_1_HIGH));
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-buttress.c:356:17: note: in expansion of macro 'dev_warn'
     356 |                 dev_warn(dev, "Details: %x %x %x %x %x %x %x %x\n",
         |                 ^~~~~~~~
   drivers/staging/media/ipu7/ipu7-buttress.c: In function 'isys_nde_control':
>> drivers/staging/media/ipu7/ipu7-buttress.c:494:42: error: 'IPU8_IPU7_BUTTRESS_REG_NDE_CONTROL' undeclared (first use in this function); did you mean 'IPU8_BUTTRESS_REG_NDE_CONTROL'?
     494 |         nde_reg = is_ipu8(isp->hw_ver) ? IPU8_IPU7_BUTTRESS_REG_NDE_CONTROL :
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                          IPU8_BUTTRESS_REG_NDE_CONTROL
>> drivers/staging/media/ipu7/ipu7-buttress.c:495:17: error: 'IPU7_IPU7_BUTTRESS_REG_NDE_CONTROL' undeclared (first use in this function); did you mean 'IPU7_BUTTRESS_REG_NDE_CONTROL'?
     495 |                 IPU7_IPU7_BUTTRESS_REG_NDE_CONTROL;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 IPU7_BUTTRESS_REG_NDE_CONTROL
   In file included from <command-line>:
>> drivers/staging/media/ipu7/ipu7-buttress.c:497:26: error: 'NDE_VAL_MASK' undeclared (first use in this function)
     497 |         val = FIELD_PREP(NDE_VAL_MASK, value) |
         |                          ^~~~~~~~~~~~
   include/linux/compiler_types.h:610:23: note: in definition of macro '__compiletime_assert'
     610 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:630:9: note: in expansion of macro '_compiletime_assert'
     630 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:78:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      78 |         BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
         |         ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:62:43: note: in expansion of macro '__unsigned_scalar_typeof'
      62 | #define __bf_cast_unsigned(type, x)     ((__unsigned_scalar_typeof(type))(x))
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:78:26: note: in expansion of macro '__bf_cast_unsigned'
      78 |         BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
         |                          ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:136:17: note: in expansion of macro '__BF_FIELD_CHECK_REG'
     136 |                 __BF_FIELD_CHECK_REG(_mask, 0ULL, "FIELD_PREP: ");      \
         |                 ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-buttress.c:497:15: note: in expansion of macro 'FIELD_PREP'
     497 |         val = FIELD_PREP(NDE_VAL_MASK, value) |
         |               ^~~~~~~~~~
>> drivers/staging/media/ipu7/ipu7-buttress.c:498:28: error: 'NDE_SCALE_MASK' undeclared (first use in this function)
     498 |                 FIELD_PREP(NDE_SCALE_MASK, scale) |
         |                            ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:610:23: note: in definition of macro '__compiletime_assert'
     610 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:630:9: note: in expansion of macro '_compiletime_assert'
     630 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:78:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      78 |         BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
         |         ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:62:43: note: in expansion of macro '__unsigned_scalar_typeof'
      62 | #define __bf_cast_unsigned(type, x)     ((__unsigned_scalar_typeof(type))(x))
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:78:26: note: in expansion of macro '__bf_cast_unsigned'
      78 |         BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
         |                          ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:136:17: note: in expansion of macro '__BF_FIELD_CHECK_REG'
     136 |                 __BF_FIELD_CHECK_REG(_mask, 0ULL, "FIELD_PREP: ");      \
         |                 ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-buttress.c:498:17: note: in expansion of macro 'FIELD_PREP'
     498 |                 FIELD_PREP(NDE_SCALE_MASK, scale) |
         |                 ^~~~~~~~~~
>> drivers/staging/media/ipu7/ipu7-buttress.c:499:28: error: 'NDE_VALID_MASK' undeclared (first use in this function); did you mean 'CAP_VALID_MASK'?
     499 |                 FIELD_PREP(NDE_VALID_MASK, valid) |
         |                            ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:610:23: note: in definition of macro '__compiletime_assert'
     610 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:630:9: note: in expansion of macro '_compiletime_assert'
     630 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:78:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      78 |         BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
         |         ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:62:43: note: in expansion of macro '__unsigned_scalar_typeof'
      62 | #define __bf_cast_unsigned(type, x)     ((__unsigned_scalar_typeof(type))(x))
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:78:26: note: in expansion of macro '__bf_cast_unsigned'
      78 |         BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
         |                          ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:136:17: note: in expansion of macro '__BF_FIELD_CHECK_REG'
     136 |                 __BF_FIELD_CHECK_REG(_mask, 0ULL, "FIELD_PREP: ");      \
         |                 ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-buttress.c:499:17: note: in expansion of macro 'FIELD_PREP'
     499 |                 FIELD_PREP(NDE_VALID_MASK, valid) |
         |                 ^~~~~~~~~~
>> drivers/staging/media/ipu7/ipu7-buttress.c:500:28: error: 'NDE_RESVEC_MASK' undeclared (first use in this function)
     500 |                 FIELD_PREP(NDE_RESVEC_MASK, resvec);
         |                            ^~~~~~~~~~~~~~~
   include/linux/compiler_types.h:610:23: note: in definition of macro '__compiletime_assert'
     610 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:630:9: note: in expansion of macro '_compiletime_assert'
     630 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:78:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      78 |         BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
         |         ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:62:43: note: in expansion of macro '__unsigned_scalar_typeof'
      62 | #define __bf_cast_unsigned(type, x)     ((__unsigned_scalar_typeof(type))(x))
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:78:26: note: in expansion of macro '__bf_cast_unsigned'
      78 |         BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
         |                          ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:136:17: note: in expansion of macro '__BF_FIELD_CHECK_REG'
     136 |                 __BF_FIELD_CHECK_REG(_mask, 0ULL, "FIELD_PREP: ");      \
         |                 ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-buttress.c:500:17: note: in expansion of macro 'FIELD_PREP'
     500 |                 FIELD_PREP(NDE_RESVEC_MASK, resvec);
         |                 ^~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-buttress.c: In function 'ipu_buttress_wakeup_is_uc':
>> drivers/staging/media/ipu7/ipu7-buttress.c:1055:16: error: 'UCX_CTL_WAKEUP' undeclared (first use in this function)
    1055 |         val |= UCX_CTL_WAKEUP;
         |                ^~~~~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-buttress.c: In function 'ipu_buttress_wakeup_ps_uc':
   drivers/staging/media/ipu7/ipu7-buttress.c:1065:16: error: 'UCX_CTL_WAKEUP' undeclared (first use in this function)
    1065 |         val |= UCX_CTL_WAKEUP;
         |                ^~~~~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-buttress.c: In function 'ipu_buttress_setup':
>> drivers/staging/media/ipu7/ipu7-buttress.c:1082:34: error: 'GLOBAL_INTERRUPT_MASK' undeclared (first use in this function)
    1082 |         writel(0, isp->pb_base + GLOBAL_INTERRUPT_MASK);
         |                                  ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/ipu7/ipu7-buttress.c:1083:36: error: 'BAR2_MISC_CONFIG' undeclared (first use in this function); did you mean 'MSR_RMID_SNC_CONFIG'?
    1083 |         val = readl(isp->pb_base + BAR2_MISC_CONFIG);
         |                                    ^~~~~~~~~~~~~~~~
         |                                    MSR_RMID_SNC_CONFIG
>> drivers/staging/media/ipu7/ipu7-buttress.c:1094:48: error: 'TLBID_HASH_ENABLE_63_32' undeclared (first use in this function)
    1094 |                 writel(BIT(13), isp->pb_base + TLBID_HASH_ENABLE_63_32);
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-buttress.c:1095:47: error: 'TLBID_HASH_ENABLE_95_64' undeclared (first use in this function)
    1095 |                 writel(BIT(9), isp->pb_base + TLBID_HASH_ENABLE_95_64);
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-buttress.c:1107:47: error: 'TLBID_HASH_ENABLE_127_96' undeclared (first use in this function)
    1107 |                 writel(BIT(1), isp->pb_base + TLBID_HASH_ENABLE_127_96);
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/ipu7/ipu7-buttress.c:1117:16: error: 'PS_FSM_CG' undeclared (first use in this function)
    1117 |         writel(PS_FSM_CG, isp->base + IPU7_BUTTRESS_REG_CG_CTRL_BITS);
         |                ^~~~~~~~~
..


vim +/IPU_FREQ_CTL_RATIO_SHIFT +2047 drivers/staging/media/ipu7/ipu7.c

b7fe4c0019b12d Bingbu Cao 2025-05-29  2043  
b7fe4c0019b12d Bingbu Cao 2025-05-29  2044  static const struct ipu_buttress_ctrl ipu7_isys_buttress_ctrl = {
b7fe4c0019b12d Bingbu Cao 2025-05-29  2045  	.subsys_id = IPU_IS,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2046  	.ratio = IPU7_IS_FREQ_CTL_DEFAULT_RATIO,
b7fe4c0019b12d Bingbu Cao 2025-05-29 @2047  	.ratio_shift = IPU_FREQ_CTL_RATIO_SHIFT,
b7fe4c0019b12d Bingbu Cao 2025-05-29 @2048  	.cdyn = IPU_FREQ_CTL_CDYN,
b7fe4c0019b12d Bingbu Cao 2025-05-29 @2049  	.cdyn_shift = IPU_FREQ_CTL_CDYN_SHIFT,
b7fe4c0019b12d Bingbu Cao 2025-05-29 @2050  	.freq_ctl = BUTTRESS_REG_IS_WORKPOINT_REQ,
b7fe4c0019b12d Bingbu Cao 2025-05-29 @2051  	.pwr_sts_shift = IPU_BUTTRESS_PWR_STATE_IS_PWR_SHIFT,
b7fe4c0019b12d Bingbu Cao 2025-05-29 @2052  	.pwr_sts_mask = IPU_BUTTRESS_PWR_STATE_IS_PWR_MASK,
b7fe4c0019b12d Bingbu Cao 2025-05-29 @2053  	.pwr_sts_on = IPU_BUTTRESS_PWR_STATE_UP_DONE,
b7fe4c0019b12d Bingbu Cao 2025-05-29 @2054  	.pwr_sts_off = IPU_BUTTRESS_PWR_STATE_DN_DONE,
b7fe4c0019b12d Bingbu Cao 2025-05-29 @2055  	.ovrd_clk = BUTTRESS_OVERRIDE_IS_CLK,
b7fe4c0019b12d Bingbu Cao 2025-05-29 @2056  	.own_clk_ack = BUTTRESS_OWN_ACK_IS_CLK,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2057  };
b7fe4c0019b12d Bingbu Cao 2025-05-29  2058  
b7fe4c0019b12d Bingbu Cao 2025-05-29  2059  static const struct ipu_buttress_ctrl ipu7_psys_buttress_ctrl = {
b7fe4c0019b12d Bingbu Cao 2025-05-29  2060  	.subsys_id = IPU_PS,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2061  	.ratio = IPU7_PS_FREQ_CTL_DEFAULT_RATIO,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2062  	.ratio_shift = IPU_FREQ_CTL_RATIO_SHIFT,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2063  	.cdyn = IPU_FREQ_CTL_CDYN,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2064  	.cdyn_shift = IPU_FREQ_CTL_CDYN_SHIFT,
b7fe4c0019b12d Bingbu Cao 2025-05-29 @2065  	.freq_ctl = BUTTRESS_REG_PS_WORKPOINT_REQ,
b7fe4c0019b12d Bingbu Cao 2025-05-29 @2066  	.pwr_sts_shift = IPU_BUTTRESS_PWR_STATE_PS_PWR_SHIFT,
b7fe4c0019b12d Bingbu Cao 2025-05-29 @2067  	.pwr_sts_mask = IPU_BUTTRESS_PWR_STATE_PS_PWR_MASK,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2068  	.pwr_sts_on = IPU_BUTTRESS_PWR_STATE_UP_DONE,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2069  	.pwr_sts_off = IPU_BUTTRESS_PWR_STATE_DN_DONE,
b7fe4c0019b12d Bingbu Cao 2025-05-29 @2070  	.ovrd_clk = BUTTRESS_OVERRIDE_PS_CLK,
b7fe4c0019b12d Bingbu Cao 2025-05-29 @2071  	.own_clk_ack = BUTTRESS_OWN_ACK_PS_CLK,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2072  };
b7fe4c0019b12d Bingbu Cao 2025-05-29  2073  
b7fe4c0019b12d Bingbu Cao 2025-05-29  2074  static const struct ipu_buttress_ctrl ipu8_isys_buttress_ctrl = {
b7fe4c0019b12d Bingbu Cao 2025-05-29  2075  	.subsys_id = IPU_IS,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2076  	.ratio = IPU8_IS_FREQ_CTL_DEFAULT_RATIO,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2077  	.ratio_shift = IPU_FREQ_CTL_RATIO_SHIFT,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2078  	.cdyn = IPU_FREQ_CTL_CDYN,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2079  	.cdyn_shift = IPU_FREQ_CTL_CDYN_SHIFT,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2080  	.freq_ctl = BUTTRESS_REG_IS_WORKPOINT_REQ,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2081  	.pwr_sts_shift = IPU_BUTTRESS_PWR_STATE_IS_PWR_SHIFT,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2082  	.pwr_sts_mask = IPU_BUTTRESS_PWR_STATE_IS_PWR_MASK,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2083  	.pwr_sts_on = IPU_BUTTRESS_PWR_STATE_UP_DONE,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2084  	.pwr_sts_off = IPU_BUTTRESS_PWR_STATE_DN_DONE,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2085  };
b7fe4c0019b12d Bingbu Cao 2025-05-29  2086  
b7fe4c0019b12d Bingbu Cao 2025-05-29  2087  static const struct ipu_buttress_ctrl ipu8_psys_buttress_ctrl = {
b7fe4c0019b12d Bingbu Cao 2025-05-29  2088  	.subsys_id = IPU_PS,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2089  	.ratio = IPU8_PS_FREQ_CTL_DEFAULT_RATIO,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2090  	.ratio_shift = IPU_FREQ_CTL_RATIO_SHIFT,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2091  	.cdyn = IPU_FREQ_CTL_CDYN,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2092  	.cdyn_shift = IPU_FREQ_CTL_CDYN_SHIFT,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2093  	.freq_ctl = BUTTRESS_REG_PS_WORKPOINT_REQ,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2094  	.pwr_sts_shift = IPU_BUTTRESS_PWR_STATE_PS_PWR_SHIFT,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2095  	.pwr_sts_mask = IPU_BUTTRESS_PWR_STATE_PS_PWR_MASK,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2096  	.pwr_sts_on = IPU_BUTTRESS_PWR_STATE_UP_DONE,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2097  	.pwr_sts_off = IPU_BUTTRESS_PWR_STATE_DN_DONE,
b7fe4c0019b12d Bingbu Cao 2025-05-29 @2098  	.own_clk_ack = BUTTRESS_OWN_ACK_PS_PLL,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2099  };
b7fe4c0019b12d Bingbu Cao 2025-05-29  2100  
b7fe4c0019b12d Bingbu Cao 2025-05-29  2101  void ipu_internal_pdata_init(struct ipu_isys_internal_pdata *isys_ipdata,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2102  			     struct ipu_psys_internal_pdata *psys_ipdata)
b7fe4c0019b12d Bingbu Cao 2025-05-29  2103  {
b7fe4c0019b12d Bingbu Cao 2025-05-29  2104  	isys_ipdata->csi2.nports = ARRAY_SIZE(ipu7_csi_offsets);
b7fe4c0019b12d Bingbu Cao 2025-05-29  2105  	isys_ipdata->csi2.offsets = ipu7_csi_offsets;
b7fe4c0019b12d Bingbu Cao 2025-05-29  2106  	isys_ipdata->num_parallel_streams = IPU7_ISYS_NUM_STREAMS;
b7fe4c0019b12d Bingbu Cao 2025-05-29  2107  	psys_ipdata->hw_variant.spc_offset = IPU7_PSYS_SPC_OFFSET;
b7fe4c0019b12d Bingbu Cao 2025-05-29  2108  }
b7fe4c0019b12d Bingbu Cao 2025-05-29  2109  
b7fe4c0019b12d Bingbu Cao 2025-05-29  2110  static int ipu7_isys_check_fwnode_graph(struct fwnode_handle *fwnode)
b7fe4c0019b12d Bingbu Cao 2025-05-29  2111  {
b7fe4c0019b12d Bingbu Cao 2025-05-29  2112  	struct fwnode_handle *endpoint;
b7fe4c0019b12d Bingbu Cao 2025-05-29  2113  
b7fe4c0019b12d Bingbu Cao 2025-05-29  2114  	if (IS_ERR_OR_NULL(fwnode))
b7fe4c0019b12d Bingbu Cao 2025-05-29  2115  		return -EINVAL;
b7fe4c0019b12d Bingbu Cao 2025-05-29  2116  
b7fe4c0019b12d Bingbu Cao 2025-05-29  2117  	endpoint = fwnode_graph_get_next_endpoint(fwnode, NULL);
b7fe4c0019b12d Bingbu Cao 2025-05-29  2118  	if (endpoint) {
b7fe4c0019b12d Bingbu Cao 2025-05-29  2119  		fwnode_handle_put(endpoint);
b7fe4c0019b12d Bingbu Cao 2025-05-29  2120  		return 0;
b7fe4c0019b12d Bingbu Cao 2025-05-29  2121  	}
b7fe4c0019b12d Bingbu Cao 2025-05-29  2122  
b7fe4c0019b12d Bingbu Cao 2025-05-29  2123  	return ipu7_isys_check_fwnode_graph(fwnode->secondary);
b7fe4c0019b12d Bingbu Cao 2025-05-29  2124  }
b7fe4c0019b12d Bingbu Cao 2025-05-29  2125  
b7fe4c0019b12d Bingbu Cao 2025-05-29  2126  static struct ipu7_bus_device *
b7fe4c0019b12d Bingbu Cao 2025-05-29  2127  ipu7_isys_init(struct pci_dev *pdev, struct device *parent,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2128  	       const struct ipu_buttress_ctrl *ctrl, void __iomem *base,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2129  	       const struct ipu_isys_internal_pdata *ipdata,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2130  	       unsigned int nr)
b7fe4c0019b12d Bingbu Cao 2025-05-29  2131  {
b7fe4c0019b12d Bingbu Cao 2025-05-29  2132  	struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);
b7fe4c0019b12d Bingbu Cao 2025-05-29  2133  	struct ipu7_bus_device *isys_adev;
b7fe4c0019b12d Bingbu Cao 2025-05-29  2134  	struct device *dev = &pdev->dev;
b7fe4c0019b12d Bingbu Cao 2025-05-29  2135  	struct ipu7_isys_pdata *pdata;
b7fe4c0019b12d Bingbu Cao 2025-05-29  2136  	int ret;
b7fe4c0019b12d Bingbu Cao 2025-05-29  2137  
b7fe4c0019b12d Bingbu Cao 2025-05-29  2138  	ret = ipu7_isys_check_fwnode_graph(fwnode);
b7fe4c0019b12d Bingbu Cao 2025-05-29  2139  	if (ret) {
b7fe4c0019b12d Bingbu Cao 2025-05-29  2140  		if (fwnode && !IS_ERR_OR_NULL(fwnode->secondary)) {
b7fe4c0019b12d Bingbu Cao 2025-05-29  2141  			dev_err(dev,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2142  				"fwnode graph has no endpoints connection\n");
b7fe4c0019b12d Bingbu Cao 2025-05-29  2143  			return ERR_PTR(-EINVAL);
b7fe4c0019b12d Bingbu Cao 2025-05-29  2144  		}
b7fe4c0019b12d Bingbu Cao 2025-05-29  2145  
b7fe4c0019b12d Bingbu Cao 2025-05-29  2146  		ret = ipu_bridge_init(dev, ipu_bridge_parse_ssdb);
b7fe4c0019b12d Bingbu Cao 2025-05-29  2147  		if (ret) {
b7fe4c0019b12d Bingbu Cao 2025-05-29  2148  			dev_err_probe(dev, ret, "IPU bridge init failed\n");
b7fe4c0019b12d Bingbu Cao 2025-05-29  2149  			return ERR_PTR(ret);
b7fe4c0019b12d Bingbu Cao 2025-05-29  2150  		}
b7fe4c0019b12d Bingbu Cao 2025-05-29  2151  	}
b7fe4c0019b12d Bingbu Cao 2025-05-29  2152  
b7fe4c0019b12d Bingbu Cao 2025-05-29  2153  	pdata = kzalloc(sizeof(*pdata), GFP_KERNEL);
b7fe4c0019b12d Bingbu Cao 2025-05-29  2154  	if (!pdata)
b7fe4c0019b12d Bingbu Cao 2025-05-29  2155  		return ERR_PTR(-ENOMEM);
b7fe4c0019b12d Bingbu Cao 2025-05-29  2156  
b7fe4c0019b12d Bingbu Cao 2025-05-29  2157  	pdata->base = base;
b7fe4c0019b12d Bingbu Cao 2025-05-29  2158  	pdata->ipdata = ipdata;
b7fe4c0019b12d Bingbu Cao 2025-05-29  2159  
b7fe4c0019b12d Bingbu Cao 2025-05-29  2160  	isys_adev = ipu7_bus_initialize_device(pdev, parent, pdata, ctrl,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2161  					       IPU_ISYS_NAME);
b7fe4c0019b12d Bingbu Cao 2025-05-29  2162  	if (IS_ERR(isys_adev)) {
b7fe4c0019b12d Bingbu Cao 2025-05-29  2163  		dev_err_probe(dev, PTR_ERR(isys_adev),
b7fe4c0019b12d Bingbu Cao 2025-05-29  2164  			      "ipu7_bus_initialize_device isys failed\n");
b7fe4c0019b12d Bingbu Cao 2025-05-29  2165  		kfree(pdata);
b7fe4c0019b12d Bingbu Cao 2025-05-29  2166  		return ERR_CAST(isys_adev);
b7fe4c0019b12d Bingbu Cao 2025-05-29  2167  	}
b7fe4c0019b12d Bingbu Cao 2025-05-29  2168  
b7fe4c0019b12d Bingbu Cao 2025-05-29  2169  	isys_adev->mmu = ipu7_mmu_init(dev, base, ISYS_MMID,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2170  				       &ipdata->hw_variant);
b7fe4c0019b12d Bingbu Cao 2025-05-29  2171  	if (IS_ERR(isys_adev->mmu)) {
b7fe4c0019b12d Bingbu Cao 2025-05-29  2172  		dev_err_probe(dev, PTR_ERR(isys_adev->mmu),
b7fe4c0019b12d Bingbu Cao 2025-05-29  2173  			      "ipu7_mmu_init(isys_adev->mmu) failed\n");
b7fe4c0019b12d Bingbu Cao 2025-05-29  2174  		put_device(&isys_adev->auxdev.dev);
b7fe4c0019b12d Bingbu Cao 2025-05-29  2175  		kfree(pdata);
b7fe4c0019b12d Bingbu Cao 2025-05-29  2176  		return ERR_CAST(isys_adev->mmu);
b7fe4c0019b12d Bingbu Cao 2025-05-29  2177  	}
b7fe4c0019b12d Bingbu Cao 2025-05-29  2178  
b7fe4c0019b12d Bingbu Cao 2025-05-29  2179  	isys_adev->mmu->dev = &isys_adev->auxdev.dev;
b7fe4c0019b12d Bingbu Cao 2025-05-29  2180  	isys_adev->subsys = IPU_IS;
b7fe4c0019b12d Bingbu Cao 2025-05-29  2181  
b7fe4c0019b12d Bingbu Cao 2025-05-29  2182  	ret = ipu7_bus_add_device(isys_adev);
b7fe4c0019b12d Bingbu Cao 2025-05-29  2183  	if (ret) {
b7fe4c0019b12d Bingbu Cao 2025-05-29  2184  		kfree(pdata);
b7fe4c0019b12d Bingbu Cao 2025-05-29  2185  		return ERR_PTR(ret);
b7fe4c0019b12d Bingbu Cao 2025-05-29  2186  	}
b7fe4c0019b12d Bingbu Cao 2025-05-29  2187  
b7fe4c0019b12d Bingbu Cao 2025-05-29  2188  	return isys_adev;
b7fe4c0019b12d Bingbu Cao 2025-05-29  2189  }
b7fe4c0019b12d Bingbu Cao 2025-05-29  2190  
b7fe4c0019b12d Bingbu Cao 2025-05-29  2191  static struct ipu7_bus_device *
b7fe4c0019b12d Bingbu Cao 2025-05-29  2192  ipu7_psys_init(struct pci_dev *pdev, struct device *parent,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2193  	       const struct ipu_buttress_ctrl *ctrl, void __iomem *base,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2194  	       const struct ipu_psys_internal_pdata *ipdata, unsigned int nr)
b7fe4c0019b12d Bingbu Cao 2025-05-29  2195  {
b7fe4c0019b12d Bingbu Cao 2025-05-29  2196  	struct ipu7_bus_device *psys_adev;
b7fe4c0019b12d Bingbu Cao 2025-05-29  2197  	struct ipu7_psys_pdata *pdata;
b7fe4c0019b12d Bingbu Cao 2025-05-29  2198  	int ret;
b7fe4c0019b12d Bingbu Cao 2025-05-29  2199  
b7fe4c0019b12d Bingbu Cao 2025-05-29  2200  	pdata = kzalloc(sizeof(*pdata), GFP_KERNEL);
b7fe4c0019b12d Bingbu Cao 2025-05-29  2201  	if (!pdata)
b7fe4c0019b12d Bingbu Cao 2025-05-29  2202  		return ERR_PTR(-ENOMEM);
b7fe4c0019b12d Bingbu Cao 2025-05-29  2203  
b7fe4c0019b12d Bingbu Cao 2025-05-29  2204  	pdata->base = base;
b7fe4c0019b12d Bingbu Cao 2025-05-29  2205  	pdata->ipdata = ipdata;
b7fe4c0019b12d Bingbu Cao 2025-05-29  2206  
b7fe4c0019b12d Bingbu Cao 2025-05-29  2207  	psys_adev = ipu7_bus_initialize_device(pdev, parent, pdata, ctrl,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2208  					       IPU_PSYS_NAME);
b7fe4c0019b12d Bingbu Cao 2025-05-29  2209  	if (IS_ERR(psys_adev)) {
b7fe4c0019b12d Bingbu Cao 2025-05-29  2210  		dev_err_probe(&pdev->dev, PTR_ERR(psys_adev),
b7fe4c0019b12d Bingbu Cao 2025-05-29  2211  			      "ipu7_bus_initialize_device psys failed\n");
b7fe4c0019b12d Bingbu Cao 2025-05-29  2212  		kfree(pdata);
b7fe4c0019b12d Bingbu Cao 2025-05-29  2213  		return ERR_CAST(psys_adev);
b7fe4c0019b12d Bingbu Cao 2025-05-29  2214  	}
b7fe4c0019b12d Bingbu Cao 2025-05-29  2215  
b7fe4c0019b12d Bingbu Cao 2025-05-29  2216  	psys_adev->mmu = ipu7_mmu_init(&pdev->dev, base, PSYS_MMID,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2217  				       &ipdata->hw_variant);
b7fe4c0019b12d Bingbu Cao 2025-05-29  2218  	if (IS_ERR(psys_adev->mmu)) {
b7fe4c0019b12d Bingbu Cao 2025-05-29  2219  		dev_err_probe(&pdev->dev, PTR_ERR(psys_adev->mmu),
b7fe4c0019b12d Bingbu Cao 2025-05-29  2220  			      "ipu7_mmu_init(psys_adev->mmu) failed\n");
b7fe4c0019b12d Bingbu Cao 2025-05-29  2221  		put_device(&psys_adev->auxdev.dev);
b7fe4c0019b12d Bingbu Cao 2025-05-29  2222  		kfree(pdata);
b7fe4c0019b12d Bingbu Cao 2025-05-29  2223  		return ERR_CAST(psys_adev->mmu);
b7fe4c0019b12d Bingbu Cao 2025-05-29  2224  	}
b7fe4c0019b12d Bingbu Cao 2025-05-29  2225  
b7fe4c0019b12d Bingbu Cao 2025-05-29  2226  	psys_adev->mmu->dev = &psys_adev->auxdev.dev;
b7fe4c0019b12d Bingbu Cao 2025-05-29  2227  	psys_adev->subsys = IPU_PS;
b7fe4c0019b12d Bingbu Cao 2025-05-29  2228  
b7fe4c0019b12d Bingbu Cao 2025-05-29  2229  	ret = ipu7_bus_add_device(psys_adev);
b7fe4c0019b12d Bingbu Cao 2025-05-29  2230  	if (ret) {
b7fe4c0019b12d Bingbu Cao 2025-05-29  2231  		kfree(pdata);
b7fe4c0019b12d Bingbu Cao 2025-05-29  2232  		return ERR_PTR(ret);
b7fe4c0019b12d Bingbu Cao 2025-05-29  2233  	}
b7fe4c0019b12d Bingbu Cao 2025-05-29  2234  
b7fe4c0019b12d Bingbu Cao 2025-05-29  2235  	return psys_adev;
b7fe4c0019b12d Bingbu Cao 2025-05-29  2236  }
b7fe4c0019b12d Bingbu Cao 2025-05-29  2237  
b7fe4c0019b12d Bingbu Cao 2025-05-29  2238  static struct ia_gofo_msg_log_info_ts fw_error_log[IPU_SUBSYS_NUM];
b7fe4c0019b12d Bingbu Cao 2025-05-29  2239  void ipu7_dump_fw_error_log(const struct ipu7_bus_device *adev)
b7fe4c0019b12d Bingbu Cao 2025-05-29  2240  {
b7fe4c0019b12d Bingbu Cao 2025-05-29  2241  	void __iomem *reg = adev->isp->base + ((adev->subsys == IPU_IS) ?
b7fe4c0019b12d Bingbu Cao 2025-05-29 @2242  					       BUTTRESS_REG_FW_GP24 :
b7fe4c0019b12d Bingbu Cao 2025-05-29 @2243  					       BUTTRESS_REG_FW_GP8);
b7fe4c0019b12d Bingbu Cao 2025-05-29  2244  
b7fe4c0019b12d Bingbu Cao 2025-05-29  2245  	memcpy_fromio(&fw_error_log[adev->subsys], reg,
b7fe4c0019b12d Bingbu Cao 2025-05-29  2246  		      sizeof(fw_error_log[adev->subsys]));
b7fe4c0019b12d Bingbu Cao 2025-05-29  2247  }
b7fe4c0019b12d Bingbu Cao 2025-05-29  2248  EXPORT_SYMBOL_NS_GPL(ipu7_dump_fw_error_log, "INTEL_IPU7");
b7fe4c0019b12d Bingbu Cao 2025-05-29  2249  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

