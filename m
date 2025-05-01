Return-Path: <linux-media+bounces-31493-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FE3AA5C7B
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 11:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B20A3AE17F
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 09:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17379229B32;
	Thu,  1 May 2025 09:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B0skiOdA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE07211713;
	Thu,  1 May 2025 09:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746090317; cv=none; b=uL4fyFDikDfeBHhO6X3/fDq2iLdZicRSf1wNj9EGoVhCn0lQspt5RK2EIbSVy9neXEMNIP14W8kXj9Z8moNdsyeFXFq23XnT3vVdC3d3J4Dz0IxmyAUYB0h2ZSLBZCB6AsbvvTolYhoxnRzqcdQMlcUzN6WjoRWQ60a2kMxkr48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746090317; c=relaxed/simple;
	bh=jJ3F4gM4YJZadTUvKQftbhu43Hg+dCEKGKNWFuxIVJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dvG8hCqJ+CLWDzOl9B3IGjlEvSl2BBNrRSOGo5qh/DTN+Uyv7E6OSSIcjSjSb7ySXAywk2OmOrCT6MIGSx9AQEm1GM+c8sAlDlKhXBoO58ylSPk7kzlPf/hA4OigKCm9jSvEKBNkUlOYsvlTBQ5GCsmdvzyylrbkJSuZjHkLQIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B0skiOdA; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746090316; x=1777626316;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jJ3F4gM4YJZadTUvKQftbhu43Hg+dCEKGKNWFuxIVJU=;
  b=B0skiOdAjMX9JKECX0CdC2Bj61sPxHDs2MXagK47m3i9oIYVj7/OkvNu
   2sd++yWqRyKCuuKkLGeXy2XLNZarxyF0+kr+1g0M3mC1rc4PB1ku8+5Dn
   AwcAv4hogm0XVFQgG6UzV0BLnQxX7nVoBnHswW6R1EO+h/HIzCEhxg936
   hc1awL4Mq/bJ4kbAW4WKWmK4SUAjGYQrxjuXgKoKJhpGkoN7lEhCRQcwa
   xmNW7aJgd0Y46OzejR+g6RYWRuCo/YqWbWnAZLattS2mFRjzaDbo9CQaN
   rXuOOm9IZt04CZidi8QOa/BHnlcRkGGpAK4WyNJT7AF6TP6MGVEQa7Oyh
   g==;
X-CSE-ConnectionGUID: 0fCQxZh/TKuZIzQOOP5x/Q==
X-CSE-MsgGUID: rh7Lx0uGRp+A8tl0rw77hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="58423471"
X-IronPort-AV: E=Sophos;i="6.15,253,1739865600"; 
   d="scan'208";a="58423471"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 02:05:15 -0700
X-CSE-ConnectionGUID: TG3uqsBdTgCIgGcs/DsKGg==
X-CSE-MsgGUID: 4Vk331fnQHG4Glg4EM+ahQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,253,1739865600"; 
   d="scan'208";a="139527386"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 May 2025 02:05:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAPqt-00044L-19;
	Thu, 01 May 2025 09:05:07 +0000
Date: Thu, 1 May 2025 17:04:53 +0800
From: kernel test robot <lkp@intel.com>
To: oushixiong1025@163.com, Sumit Semwal <sumit.semwal@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
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
Message-ID: <202505011655.qTmh4UA7-lkp@intel.com>
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
[cannot apply to tegra/for-next drm-xe/drm-xe-next rmk-arm/drm-armada-devel rmk-arm/drm-armada-fixes next-20250430]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/oushixiong1025-163-com/drm-prime-Support-importing-DMA-BUF-without-sg_table/20250430-170136
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20250430085658.540746-2-oushixiong1025%40163.com
patch subject: [PATCH 2/3] drm/prime: Support importing DMA-BUF without sg_table
config: arm64-randconfig-003-20250501 (https://download.01.org/0day-ci/archive/20250501/202505011655.qTmh4UA7-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505011655.qTmh4UA7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505011655.qTmh4UA7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_prime.c:925:24: warning: no previous prototype for function 'drm_gem_prime_import_dev_skip_map' [-Wmissing-prototypes]
     925 | struct drm_gem_object *drm_gem_prime_import_dev_skip_map(struct drm_device *dev,
         |                        ^
   drivers/gpu/drm/drm_prime.c:925:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     925 | struct drm_gem_object *drm_gem_prime_import_dev_skip_map(struct drm_device *dev,
         | ^
         | static 
   1 warning generated.


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

