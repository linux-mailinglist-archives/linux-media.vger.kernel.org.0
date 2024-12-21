Return-Path: <linux-media+bounces-23973-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2179F9FE5
	for <lists+linux-media@lfdr.de>; Sat, 21 Dec 2024 10:43:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35595166BC1
	for <lists+linux-media@lfdr.de>; Sat, 21 Dec 2024 09:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A99141F191F;
	Sat, 21 Dec 2024 09:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lm/kN2bs"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19B41F0E44;
	Sat, 21 Dec 2024 09:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734774089; cv=none; b=H2hIDShOLmnv4g9dnE6qyzSx6b1g9Ie8ivIMdZrC09EhQEBGm87BDBP85+ll/9IaZ96BAwClgCAnGonOp/m+5BR9nrLU1vTaMPZ1gX8q2hcYETXjkYMYlWo52bbjMyjplzo8gnJl4KySOp0e+QjLHSvjvdufSw8i8UF7XP4icRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734774089; c=relaxed/simple;
	bh=9eM/1Gwvqw9NFasQx8+TbXTknoD5E3yJoT0gay2E3b4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pV1JS70gAbRwMnB3PuBB8r5IYddwLVlMdLy1Hb244QZkFWw1q7OWkEd8czY9BRSZ4J15qzdo8e8IaPT/9FX9RTxzVQsuYQ9JjtCjlhaofYUvCvOnWxND93BjSebKDPgPd/q7bph13SmJwRDVhGPNRw/Xr+5FoKsSQdadLQ4VC24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lm/kN2bs; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734774085; x=1766310085;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9eM/1Gwvqw9NFasQx8+TbXTknoD5E3yJoT0gay2E3b4=;
  b=lm/kN2bsJqwF0qz6c8b/xL5kIQxVD0DTqNeP0w2Z8Bi124iSkPszaIgm
   pkpDjnlV3napqP7k+WFKeEq+anLxG6YBva+Y7EqdOzM7UYGVrjjjq5rLP
   gaE7q32XIY9i6x6VmpKFHwPde0ngJgTOTFU7QJU6rx2qDo07vXpHymCJg
   98vfSfdqcqgbNaiA1/Hkg3OAT/mfeOcAl9v2n0Sn1zEo++ziBzUCL5N/i
   ltNc9Qnv1g1sOebeNMVvMh2dg7vzUdZkPMWkvDdcQ9yEEhRnz0qYm4Ffx
   O1klC1aGlQxV2eAzuwCoZNWshcxGs9Y8mUG7uuiWmE+TucVakCF+n8Ffd
   Q==;
X-CSE-ConnectionGUID: t8ETG3G/TW2ZeB1DkL/G1w==
X-CSE-MsgGUID: w1n44OAbSZyvJ3HPUWovfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="34591743"
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="34591743"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 01:41:25 -0800
X-CSE-ConnectionGUID: IQY7nnjrRhChZ3O5MRg0Kw==
X-CSE-MsgGUID: U9hk4K7xQCueEJK+xwO6Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="98798584"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Dec 2024 01:41:19 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOvz3-00027L-12;
	Sat, 21 Dec 2024 09:41:17 +0000
Date: Sat, 21 Dec 2024 17:40:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Sumit Garg <sumit.garg@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [PATCH v4 5/6] optee: FF-A: dynamic restricted memory allocation
Message-ID: <202412211952.LOCC8Lbo-lkp@intel.com>
References: <20241217100809.3962439-6-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217100809.3962439-6-jens.wiklander@linaro.org>

Hi Jens,

kernel test robot noticed the following build errors:

[auto build test ERROR on fac04efc5c793dccbd07e2d59af9f90b7fc0dca4]

url:    https://github.com/intel-lab-lkp/linux/commits/Jens-Wiklander/tee-add-restricted-memory-allocation/20241217-181101
base:   fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
patch link:    https://lore.kernel.org/r/20241217100809.3962439-6-jens.wiklander%40linaro.org
patch subject: [PATCH v4 5/6] optee: FF-A: dynamic restricted memory allocation
config: arm64-randconfig-r112-20241221 (https://download.01.org/0day-ci/archive/20241221/202412211952.LOCC8Lbo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241221/202412211952.LOCC8Lbo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412211952.LOCC8Lbo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tee/optee/rstmem.c:311:67: error: expected ';', ',' or ')' before '__unused'
     311 | static struct tee_shm_pool *alloc_rstmem_pool(struct optee *optee __unused,
         |                                                                   ^~~~~~~~
   drivers/tee/optee/rstmem.c: In function 'optee_rstmem_alloc':
>> drivers/tee/optee/rstmem.c:332:24: error: implicit declaration of function 'alloc_rstmem_pool' [-Wimplicit-function-declaration]
     332 |                 pool = alloc_rstmem_pool(optee, use_case);
         |                        ^~~~~~~~~~~~~~~~~
>> drivers/tee/optee/rstmem.c:332:22: error: assignment to 'struct tee_shm_pool *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     332 |                 pool = alloc_rstmem_pool(optee, use_case);
         |                      ^


vim +311 drivers/tee/optee/rstmem.c

   268	
   269	static struct tee_shm_pool *alloc_rstmem_pool(struct optee *optee, u32 use_case)
   270	{
   271		struct optee_rstmem_cma_pool *rp;
   272		size_t min_size;
   273		int rc;
   274	
   275		rp = kzalloc(sizeof(*rp), GFP_KERNEL);
   276		if (!rp)
   277			return ERR_PTR(-ENOMEM);
   278		rp->rstmem.use_case = use_case;
   279	
   280		rc = get_rstmem_config(optee, use_case, &min_size, &rp->align, NULL,
   281				       &rp->end_point_count);
   282		if (rc) {
   283			if (rc != -ENOSPC)
   284				goto err;
   285			rp->end_points = kcalloc(rp->end_point_count,
   286						 sizeof(*rp->end_points), GFP_KERNEL);
   287			if (!rp->end_points) {
   288				rc = -ENOMEM;
   289				goto err;
   290			}
   291			rc = get_rstmem_config(optee, use_case, &min_size, &rp->align,
   292					       rp->end_points, &rp->end_point_count);
   293			if (rc)
   294				goto err_kfree_eps;
   295		}
   296	
   297		rp->pool.ops = &rstmem_pool_ops_cma;
   298		rp->optee = optee;
   299		rp->page_count = min_size / PAGE_SIZE;
   300		mutex_init(&rp->mutex);
   301	
   302		return &rp->pool;
   303	
   304	err_kfree_eps:
   305		kfree(rp->end_points);
   306	err:
   307		kfree(rp);
   308		return ERR_PTR(rc);
   309	}
   310	#else /*CONFIG_CMA*/
 > 311	static struct tee_shm_pool *alloc_rstmem_pool(struct optee *optee __unused,
   312						      u32 use_case __unused)
   313	{
   314		return ERR_PTR(-EINVAL);
   315	}
   316	#endif /*CONFIG_CMA*/
   317	
   318	int optee_rstmem_alloc(struct tee_context *ctx, struct tee_shm *shm,
   319			       u32 flags, u32 use_case, size_t size)
   320	{
   321		struct optee *optee = tee_get_drvdata(ctx->teedev);
   322		struct tee_shm_pool *pool;
   323		int rc;
   324	
   325		if (!optee->rstmem_pools)
   326			return -EINVAL;
   327		if (flags)
   328			return -EINVAL;
   329	
   330		pool = xa_load(&optee->rstmem_pools->xa, use_case);
   331		if (!pool) {
 > 332			pool = alloc_rstmem_pool(optee, use_case);
   333			if (IS_ERR(pool))
   334				return PTR_ERR(pool);
   335			rc = xa_insert(&optee->rstmem_pools->xa, use_case, pool,
   336				       GFP_KERNEL);
   337			if (rc) {
   338				pool->ops->destroy_pool(pool);
   339				return rc;
   340			}
   341		}
   342	
   343		return pool->ops->alloc(pool, shm, size, 0);
   344	}
   345	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

