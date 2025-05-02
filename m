Return-Path: <linux-media+bounces-31620-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20916AA7629
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 17:36:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F584168929
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 15:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4A0A257AD8;
	Fri,  2 May 2025 15:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ThOk+f3A"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE26D23B0;
	Fri,  2 May 2025 15:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746200190; cv=none; b=OKrgATmpoASVt6cXBD73KRMMFE+HswvClsgGIy9rqL1zzcl8dkcJIUfkrOj7os4vcWifjDKb+VzfvAPDUxlJE0/LAjucakUzJEPKYmPrZqNP0RhQ8pMQQ0r1/C5vze4DlqvSX8FTnc8az9oixwDxwLzXGpgq1ITw/Gj4zW3FPjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746200190; c=relaxed/simple;
	bh=OpAQrB/oue+iEzkT/7L711k9l4b8H/6bGWPqCs/H+ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CFkZ/Of/rd7Mz8F0HI6LlMHP2P3BIhjKJ4ZrzhJZmOFwcca9bI35CEsBQymXpxjU706HFSunDvbbWi86kePRfdIdMYQI5gRED7L+t8Vwa6KLF7f8uyQRQejJ76niL2yFWUpOY/1LUwl+t4ZmC+pjV/TvdybA3cpPHlSyjHq6xHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ThOk+f3A; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746200188; x=1777736188;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OpAQrB/oue+iEzkT/7L711k9l4b8H/6bGWPqCs/H+ts=;
  b=ThOk+f3ApKHqPudWHa3pgadePwYzu4meKTcLmnDrdt55lXbGzXoM2QeQ
   RF/Sgc1IvP8a9dOJFY++QOinzervDdNezUUIeuBHDZKot+TE8ih8Q0HGZ
   XnrzOH1LWSLdpPOJIR9ogTEX59Go3LrmIHCZ7bzt9/64U79ZKlhv85YvP
   TcrSvwhnhIxYit2b4+Ahkx4NY2eN4v1HkDUEb4GA+3l5mYxeF1sGasIdY
   8Z3XW+n7NTkpQ6hAnEfhWVDdrH8dMTOgXpVNFqth33EsnXLiRchJ4fvW5
   n3QuOKAZh8VXOAPb+8Jr1mfuCx/d0GkEAw9AGlxalUDmIkAGQ5Fi/XREs
   Q==;
X-CSE-ConnectionGUID: RwDFfA9jS6CFXu69Ka7uzA==
X-CSE-MsgGUID: XNQ2+q+fSW2nP2N1KxQc6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="58508461"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="58508461"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 08:36:27 -0700
X-CSE-ConnectionGUID: 1Tr+RxKCS8W7df/mIMbyXw==
X-CSE-MsgGUID: O0M4VKRTRTSDLUzRmY6urA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="139843076"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 May 2025 08:36:23 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAsR1-0004px-30;
	Fri, 02 May 2025 15:36:19 +0000
Date: Fri, 2 May 2025 23:36:01 +0800
From: kernel test robot <lkp@intel.com>
To: oushixiong1025@163.com, Sumit Semwal <sumit.semwal@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
	Shixiong Ou <oushixiong@kylinos.cn>
Subject: Re: [PATCH 2/3] drm/prime: Support importing DMA-BUF without sg_table
Message-ID: <202505022224.FCDQ8TCB-lkp@intel.com>
References: <20250430085658.540746-2-oushixiong1025@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430085658.540746-2-oushixiong1025@163.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus usb/usb-testing usb/usb-next usb/usb-linus xen-tip/linux-next linus/master v6.15-rc4]
[cannot apply to tegra/for-next drm-xe/drm-xe-next rmk-arm/drm-armada-devel rmk-arm/drm-armada-fixes next-20250501]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/oushixiong1025-163-com/drm-prime-Support-importing-DMA-BUF-without-sg_table/20250430-170136
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20250430085658.540746-2-oushixiong1025%40163.com
patch subject: [PATCH 2/3] drm/prime: Support importing DMA-BUF without sg_table
config: arc-randconfig-002-20250501 (https://download.01.org/0day-ci/archive/20250502/202505022224.FCDQ8TCB-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505022224.FCDQ8TCB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505022224.FCDQ8TCB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_prime.c:925:24: warning: no previous prototype for 'drm_gem_prime_import_dev_skip_map' [-Wmissing-prototypes]
     925 | struct drm_gem_object *drm_gem_prime_import_dev_skip_map(struct drm_device *dev,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/drm_gem_prime_import_dev_skip_map +925 drivers/gpu/drm/drm_prime.c

   913	
   914	/**
   915	 * drm_gem_prime_import_dev_skip_map - core implementation of the import callback
   916	 * @dev: drm_device to import into
   917	 * @dma_buf: dma-buf object to import
   918	 * @attach_dev: struct device to dma_buf attach
   919	 *
   920	 * This function exports a dma-buf without get it's scatter/gather table.
   921	 *
   922	 * Drivers who need to get an scatter/gather table for objects need to call
   923	 * drm_gem_prime_import_dev() instead.
   924	 */
 > 925	struct drm_gem_object *drm_gem_prime_import_dev_skip_map(struct drm_device *dev,
   926								 struct dma_buf *dma_buf,
   927								 struct device *attach_dev)
   928	{
   929		struct dma_buf_attachment *attach;
   930		struct drm_gem_object *obj;
   931		int ret;
   932	
   933		if (dma_buf->ops == &drm_gem_prime_dmabuf_ops) {
   934			obj = dma_buf->priv;
   935			if (obj->dev == dev) {
   936				/*
   937				 * Importing dmabuf exported from our own gem increases
   938				 * refcount on gem itself instead of f_count of dmabuf.
   939				 */
   940				drm_gem_object_get(obj);
   941				return obj;
   942			}
   943		}
   944	
   945		attach = dma_buf_attach(dma_buf, attach_dev, true);
   946		if (IS_ERR(attach))
   947			return ERR_CAST(attach);
   948	
   949		get_dma_buf(dma_buf);
   950	
   951		obj = dev->driver->gem_prime_import_attachment(dev, attach);
   952		if (IS_ERR(obj)) {
   953			ret = PTR_ERR(obj);
   954			goto fail_detach;
   955		}
   956	
   957		obj->import_attach = attach;
   958		obj->resv = dma_buf->resv;
   959	
   960		return obj;
   961	
   962	fail_detach:
   963		dma_buf_detach(dma_buf, attach);
   964		dma_buf_put(dma_buf);
   965	
   966		return ERR_PTR(ret);
   967	}
   968	EXPORT_SYMBOL(drm_gem_prime_import_dev_skip_map);
   969	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

