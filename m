Return-Path: <linux-media+bounces-60190-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GK4oJQIH92l7bQIAu9opvQ
	(envelope-from <linux-media+bounces-60190-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 03 May 2026 10:27:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD814B4E1D
	for <lists+linux-media@lfdr.de>; Sun, 03 May 2026 10:27:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42213300C922
	for <lists+linux-media@lfdr.de>; Sun,  3 May 2026 08:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E8F93AD535;
	Sun,  3 May 2026 08:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OQD3CjrZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6770383C93;
	Sun,  3 May 2026 08:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777796854; cv=none; b=KoFm2wOiBDa1FUBG4rPBAzBAqUhs+wynAGb9g934jSaTUjpWJx8ZrcUOQUA+cC/a+fStJ7uoq/UoYGxZFymtQvGhn9rNpXFatlVpTaEg/47evi0mGsAXo5AF/Sy5UVPgGb4dSAaaBVohzWrSBanapNPAEvWx8za5uvGLZCm70gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777796854; c=relaxed/simple;
	bh=aOJPRty6ZPD2MUyv+rgFs7MC2mTzB8Tb1pC83m3vXr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jbIJnN2/rmHT8KStjzJjrxNkozS7ejlhT4bSVBv9fHdDCneLnM0ANTp0D2orEsiGHuBw1imyvKaZAU99sR1xnvnQm89uLwm0FI9mQD0/LGmwFWfuRfOpAtLWyJTqejeyCLawFX9qkA/4rw33WY7cm4GQbB/7QP44F8ICi+4bNsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OQD3CjrZ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777796853; x=1809332853;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aOJPRty6ZPD2MUyv+rgFs7MC2mTzB8Tb1pC83m3vXr8=;
  b=OQD3CjrZAu3ZCa9Xv7YHs9k3dNZGnC7z8HPIq0QxBOKzWecv2O+xZ8Zw
   HWVJ4sl6r6WiNBbN9AZRwbpWFHHQ8qy0nTOTMx1vPMz7o2rjKg37B0gEv
   knhRXh7B45YZJOM8nJGeyfj+b29EAcc+W2gFiQK8ble43NBnaheyHhkPH
   CmjV7823QPkCfZcZBXKaQZosf0icuapLrG+mS9rfB86dwDD5dePvl5z2I
   gd4jR6fDhb/BhqCexnCIzlttD6fNSh0QFBk/W8eJimxBR4HUuWUgwuMxz
   BTdeRX7yDm7VID4wdWe18/BeonpEs51Rgzuuu4MFV7nDDZUndo35EyxiM
   Q==;
X-CSE-ConnectionGUID: C2vW/FdASGuLQHBHjxfkuQ==
X-CSE-MsgGUID: p3qrBruZRLG1CanGk83nNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="89379370"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="89379370"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 01:27:32 -0700
X-CSE-ConnectionGUID: uQnNaEeWSaeW3rZqP4a07A==
X-CSE-MsgGUID: v9e4KFUqSSWLdt2WOeSJcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="234215372"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 03 May 2026 01:27:29 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJSAg-000000002MD-3IUC;
	Sun, 03 May 2026 08:27:26 +0000
Date: Sun, 3 May 2026 16:26:54 +0800
From: kernel test robot <lkp@intel.com>
To: Guangshuo Li <lgs201920130244@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org,
	Guangshuo Li <lgs201920130244@gmail.com>
Subject: Re: [PATCH] media: staging/ipu7: Fix pdata double free in init error
 paths
Message-ID: <202605031607.jGN5iKun-lkp@intel.com>
References: <20260430053820.446080-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430053820.446080-1-lgs201920130244@gmail.com>
X-Rspamd-Queue-Id: 2AD814B4E1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60190-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,intel.com,kernel.org,linuxfoundation.org,lists.linux.dev,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,intel.com:email,intel.com:dkim,intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi Guangshuo,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Guangshuo-Li/media-staging-ipu7-Fix-pdata-double-free-in-init-error-paths/20260501-032323
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260430053820.446080-1-lgs201920130244%40gmail.com
patch subject: [PATCH] media: staging/ipu7: Fix pdata double free in init error paths
config: x86_64-randconfig-076-20260503 (https://download.01.org/0day-ci/archive/20260503/202605031607.jGN5iKun-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605031607.jGN5iKun-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605031607.jGN5iKun-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/media/ipu7/ipu7.c:2176:19: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const void *' [-Wint-conversion]
    2176 |                 return ERR_CAST(ret);
         |                                 ^~~
   include/linux/err.h:102:64: note: passing argument to parameter 'ptr' here
     102 | static inline void * __must_check ERR_CAST(__force const void *ptr)
         |                                                                ^
   drivers/staging/media/ipu7/ipu7.c:2221:19: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const void *' [-Wint-conversion]
    2221 |                 return ERR_CAST(ret);
         |                                 ^~~
   include/linux/err.h:102:64: note: passing argument to parameter 'ptr' here
     102 | static inline void * __must_check ERR_CAST(__force const void *ptr)
         |                                                                ^
   2 errors generated.


vim +2176 drivers/staging/media/ipu7/ipu7.c

  2125	
  2126	static struct ipu7_bus_device *
  2127	ipu7_isys_init(struct pci_dev *pdev, struct device *parent,
  2128		       const struct ipu_buttress_ctrl *ctrl, void __iomem *base,
  2129		       const struct ipu_isys_internal_pdata *ipdata,
  2130		       unsigned int nr)
  2131	{
  2132		struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);
  2133		struct ipu7_bus_device *isys_adev;
  2134		struct device *dev = &pdev->dev;
  2135		struct ipu7_isys_pdata *pdata;
  2136		int ret;
  2137	
  2138		ret = ipu7_isys_check_fwnode_graph(fwnode);
  2139		if (ret) {
  2140			if (fwnode && !IS_ERR_OR_NULL(fwnode->secondary)) {
  2141				dev_err(dev,
  2142					"fwnode graph has no endpoints connection\n");
  2143				return ERR_PTR(-EINVAL);
  2144			}
  2145	
  2146			ret = ipu_bridge_init(dev, ipu_bridge_parse_ssdb);
  2147			if (ret) {
  2148				dev_err_probe(dev, ret, "IPU bridge init failed\n");
  2149				return ERR_PTR(ret);
  2150			}
  2151		}
  2152	
  2153		pdata = kzalloc_obj(*pdata);
  2154		if (!pdata)
  2155			return ERR_PTR(-ENOMEM);
  2156	
  2157		pdata->base = base;
  2158		pdata->ipdata = ipdata;
  2159	
  2160		isys_adev = ipu7_bus_initialize_device(pdev, parent, pdata, ctrl,
  2161						       IPU_ISYS_NAME);
  2162		if (IS_ERR(isys_adev)) {
  2163			dev_err_probe(dev, PTR_ERR(isys_adev),
  2164				      "ipu7_bus_initialize_device isys failed\n");
  2165			kfree(pdata);
  2166			return ERR_CAST(isys_adev);
  2167		}
  2168	
  2169		isys_adev->mmu = ipu7_mmu_init(dev, base, ISYS_MMID,
  2170					       &ipdata->hw_variant);
  2171		if (IS_ERR(isys_adev->mmu)) {
  2172			ret = PTR_ERR(isys_adev->mmu);
  2173			dev_err_probe(dev, ret,
  2174				      "ipu7_mmu_init(isys_adev->mmu) failed\n");
  2175			put_device(&isys_adev->auxdev.dev);
> 2176			return ERR_CAST(ret);
  2177		}
  2178	
  2179		isys_adev->mmu->dev = &isys_adev->auxdev.dev;
  2180		isys_adev->subsys = IPU_IS;
  2181	
  2182		ret = ipu7_bus_add_device(isys_adev);
  2183		if (ret)
  2184			return ERR_PTR(ret);
  2185	
  2186		return isys_adev;
  2187	}
  2188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

