Return-Path: <linux-media+bounces-30180-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DDBA8844A
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 16:17:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 151F21665C7
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 14:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D59CD18B0F;
	Mon, 14 Apr 2025 13:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FOl4WQpN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCE62749EC;
	Mon, 14 Apr 2025 13:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637952; cv=none; b=TdBq+L4u5ClSt7ARuXIaGXtbKRHQxmlR+vU2562QqSLyNyMnCpNL+8YVMHjllhMmVioYkYpf8ekCh4/2ew7ZQHdbNrRwNavbMav5ykNKRDes5DjzkM53Up/H9y0X5Wxtfm3j7FRBo0+8iyI1w+u37YGkrU1e53QuYcCbVqMp3pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637952; c=relaxed/simple;
	bh=BnjCiRheLd50KZFZ6NJW6u2NJG2oMLt7fJoUT9IgrY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TospO6QT83QlEI4L7sgbim5YXgZuyTBiJRZIRiGdjWaqGKY2s+uct0+9y3S55w2nSsc7wVcWkZthT3FhNruhOI9reh6NtiHtpbyAk6cFVWIAqYwTp7AXwq3hqojVn82g5y3KivdWKJClXfpeczR3fWIhDH9GoRiJkKAZyg8mXCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FOl4WQpN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744637950; x=1776173950;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=BnjCiRheLd50KZFZ6NJW6u2NJG2oMLt7fJoUT9IgrY4=;
  b=FOl4WQpNVqKcTguntsfdVOtogemmrfcyaBZlad+Rbo+AmnprVLfcXoHY
   XX6C5zr/ljpGzzmLzMdsGHAU+se2bCfXSEf311sVXaaX5uBjLkVr78F9Q
   RduLqoZIyIkicgMHvAtgXNv8RTNqjK2wCatQsL3Cnqscxerl45I9w4ncy
   uDeuEE+SFmB7pUYVX7HoWo1d7Ux8Qldz4n72DM7P50zR6h7xpm3aRqixp
   KafgXK2ed/4tu0q+4w69CqelwXpQz03yPQjn5io8CSPSp1BYrbieSFSEg
   f6oUY/wTrAMR+fYFap8RRjvVGfL3uDkODdmOrcB0IK9WoKIKTHDfaHSOZ
   Q==;
X-CSE-ConnectionGUID: Q1Wrkf7eSPGvPNtmnB0b9Q==
X-CSE-MsgGUID: lAKALSvyR6C458NeWeHL9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="57097818"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="57097818"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 06:39:10 -0700
X-CSE-ConnectionGUID: xDzeAt+nTdGpMdjqU1KNyQ==
X-CSE-MsgGUID: 5ddJHiVxSV6ucBpJq22FuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="160778914"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Apr 2025 06:39:05 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4K1e-000EGs-2b;
	Mon, 14 Apr 2025 13:39:02 +0000
Date: Mon, 14 Apr 2025 21:38:20 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
	"To : Boris Brezillon" <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, kernel@collabora.com,
	=?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v7 3/4] drm/panthor: Label all kernel BO's
Message-ID: <202504142148.NBAyzLuE-lkp@intel.com>
References: <20250411150357.3308921-4-adrian.larumbe@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250411150357.3308921-4-adrian.larumbe@collabora.com>

Hi Adrián,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.15-rc2 next-20250414]
[cannot apply to drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Adri-n-Larumbe/drm-panthor-Introduce-BO-labeling/20250414-101541
base:   linus/master
patch link:    https://lore.kernel.org/r/20250411150357.3308921-4-adrian.larumbe%40collabora.com
patch subject: [PATCH v7 3/4] drm/panthor: Label all kernel BO's
config: i386-buildonly-randconfig-006-20250414 (https://download.01.org/0day-ci/archive/20250414/202504142148.NBAyzLuE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250414/202504142148.NBAyzLuE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504142148.NBAyzLuE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/panthor/panthor_gem.c:86: warning: Function parameter or struct member 'name' not described in 'panthor_kernel_bo_create'


vim +86 drivers/gpu/drm/panthor/panthor_gem.c

8a1cc07578bf42 Boris Brezillon 2024-02-29   67  
8a1cc07578bf42 Boris Brezillon 2024-02-29   68  /**
8a1cc07578bf42 Boris Brezillon 2024-02-29   69   * panthor_kernel_bo_create() - Create and map a GEM object to a VM
8a1cc07578bf42 Boris Brezillon 2024-02-29   70   * @ptdev: Device.
8a1cc07578bf42 Boris Brezillon 2024-02-29   71   * @vm: VM to map the GEM to. If NULL, the kernel object is not GPU mapped.
8a1cc07578bf42 Boris Brezillon 2024-02-29   72   * @size: Size of the buffer object.
8a1cc07578bf42 Boris Brezillon 2024-02-29   73   * @bo_flags: Combination of drm_panthor_bo_flags flags.
8a1cc07578bf42 Boris Brezillon 2024-02-29   74   * @vm_map_flags: Combination of drm_panthor_vm_bind_op_flags (only those
8a1cc07578bf42 Boris Brezillon 2024-02-29   75   * that are related to map operations).
8a1cc07578bf42 Boris Brezillon 2024-02-29   76   * @gpu_va: GPU address assigned when mapping to the VM.
8a1cc07578bf42 Boris Brezillon 2024-02-29   77   * If gpu_va == PANTHOR_VM_KERNEL_AUTO_VA, the virtual address will be
8a1cc07578bf42 Boris Brezillon 2024-02-29   78   * automatically allocated.
8a1cc07578bf42 Boris Brezillon 2024-02-29   79   *
8a1cc07578bf42 Boris Brezillon 2024-02-29   80   * Return: A valid pointer in case of success, an ERR_PTR() otherwise.
8a1cc07578bf42 Boris Brezillon 2024-02-29   81   */
8a1cc07578bf42 Boris Brezillon 2024-02-29   82  struct panthor_kernel_bo *
8a1cc07578bf42 Boris Brezillon 2024-02-29   83  panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
8a1cc07578bf42 Boris Brezillon 2024-02-29   84  			 size_t size, u32 bo_flags, u32 vm_map_flags,
f48f05d54f7696 Adrián Larumbe  2025-04-11   85  			 u64 gpu_va, const char *name)
8a1cc07578bf42 Boris Brezillon 2024-02-29  @86  {
8a1cc07578bf42 Boris Brezillon 2024-02-29   87  	struct drm_gem_shmem_object *obj;
8a1cc07578bf42 Boris Brezillon 2024-02-29   88  	struct panthor_kernel_bo *kbo;
8a1cc07578bf42 Boris Brezillon 2024-02-29   89  	struct panthor_gem_object *bo;
8a1cc07578bf42 Boris Brezillon 2024-02-29   90  	int ret;
8a1cc07578bf42 Boris Brezillon 2024-02-29   91  
8a1cc07578bf42 Boris Brezillon 2024-02-29   92  	if (drm_WARN_ON(&ptdev->base, !vm))
8a1cc07578bf42 Boris Brezillon 2024-02-29   93  		return ERR_PTR(-EINVAL);
8a1cc07578bf42 Boris Brezillon 2024-02-29   94  
8a1cc07578bf42 Boris Brezillon 2024-02-29   95  	kbo = kzalloc(sizeof(*kbo), GFP_KERNEL);
8a1cc07578bf42 Boris Brezillon 2024-02-29   96  	if (!kbo)
8a1cc07578bf42 Boris Brezillon 2024-02-29   97  		return ERR_PTR(-ENOMEM);
8a1cc07578bf42 Boris Brezillon 2024-02-29   98  
8a1cc07578bf42 Boris Brezillon 2024-02-29   99  	obj = drm_gem_shmem_create(&ptdev->base, size);
8a1cc07578bf42 Boris Brezillon 2024-02-29  100  	if (IS_ERR(obj)) {
8a1cc07578bf42 Boris Brezillon 2024-02-29  101  		ret = PTR_ERR(obj);
8a1cc07578bf42 Boris Brezillon 2024-02-29  102  		goto err_free_bo;
8a1cc07578bf42 Boris Brezillon 2024-02-29  103  	}
8a1cc07578bf42 Boris Brezillon 2024-02-29  104  
8a1cc07578bf42 Boris Brezillon 2024-02-29  105  	bo = to_panthor_bo(&obj->base);
8a1cc07578bf42 Boris Brezillon 2024-02-29  106  	kbo->obj = &obj->base;
8a1cc07578bf42 Boris Brezillon 2024-02-29  107  	bo->flags = bo_flags;
8a1cc07578bf42 Boris Brezillon 2024-02-29  108  
f48f05d54f7696 Adrián Larumbe  2025-04-11  109  	panthor_gem_kernel_bo_set_label(kbo, name);
f48f05d54f7696 Adrián Larumbe  2025-04-11  110  
5d01b56f0518d8 Boris Brezillon 2024-10-30  111  	/* The system and GPU MMU page size might differ, which becomes a
5d01b56f0518d8 Boris Brezillon 2024-10-30  112  	 * problem for FW sections that need to be mapped at explicit address
5d01b56f0518d8 Boris Brezillon 2024-10-30  113  	 * since our PAGE_SIZE alignment might cover a VA range that's
5d01b56f0518d8 Boris Brezillon 2024-10-30  114  	 * expected to be used for another section.
5d01b56f0518d8 Boris Brezillon 2024-10-30  115  	 * Make sure we never map more than we need.
5d01b56f0518d8 Boris Brezillon 2024-10-30  116  	 */
5d01b56f0518d8 Boris Brezillon 2024-10-30  117  	size = ALIGN(size, panthor_vm_page_size(vm));
8a1cc07578bf42 Boris Brezillon 2024-02-29  118  	ret = panthor_vm_alloc_va(vm, gpu_va, size, &kbo->va_node);
8a1cc07578bf42 Boris Brezillon 2024-02-29  119  	if (ret)
8a1cc07578bf42 Boris Brezillon 2024-02-29  120  		goto err_put_obj;
8a1cc07578bf42 Boris Brezillon 2024-02-29  121  
8a1cc07578bf42 Boris Brezillon 2024-02-29  122  	ret = panthor_vm_map_bo_range(vm, bo, 0, size, kbo->va_node.start, vm_map_flags);
8a1cc07578bf42 Boris Brezillon 2024-02-29  123  	if (ret)
8a1cc07578bf42 Boris Brezillon 2024-02-29  124  		goto err_free_va;
8a1cc07578bf42 Boris Brezillon 2024-02-29  125  
ff60c8da0aaf7e Boris Brezillon 2024-05-02  126  	kbo->vm = panthor_vm_get(vm);
8a1cc07578bf42 Boris Brezillon 2024-02-29  127  	bo->exclusive_vm_root_gem = panthor_vm_root_gem(vm);
8a1cc07578bf42 Boris Brezillon 2024-02-29  128  	drm_gem_object_get(bo->exclusive_vm_root_gem);
8a1cc07578bf42 Boris Brezillon 2024-02-29  129  	bo->base.base.resv = bo->exclusive_vm_root_gem->resv;
8a1cc07578bf42 Boris Brezillon 2024-02-29  130  	return kbo;
8a1cc07578bf42 Boris Brezillon 2024-02-29  131  
8a1cc07578bf42 Boris Brezillon 2024-02-29  132  err_free_va:
8a1cc07578bf42 Boris Brezillon 2024-02-29  133  	panthor_vm_free_va(vm, &kbo->va_node);
8a1cc07578bf42 Boris Brezillon 2024-02-29  134  
8a1cc07578bf42 Boris Brezillon 2024-02-29  135  err_put_obj:
8a1cc07578bf42 Boris Brezillon 2024-02-29  136  	drm_gem_object_put(&obj->base);
8a1cc07578bf42 Boris Brezillon 2024-02-29  137  
8a1cc07578bf42 Boris Brezillon 2024-02-29  138  err_free_bo:
8a1cc07578bf42 Boris Brezillon 2024-02-29  139  	kfree(kbo);
8a1cc07578bf42 Boris Brezillon 2024-02-29  140  	return ERR_PTR(ret);
8a1cc07578bf42 Boris Brezillon 2024-02-29  141  }
8a1cc07578bf42 Boris Brezillon 2024-02-29  142  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

