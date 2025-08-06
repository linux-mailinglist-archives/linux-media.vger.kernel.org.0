Return-Path: <linux-media+bounces-38985-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64049B1CF5D
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 01:20:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4841B18968E7
	for <lists+linux-media@lfdr.de>; Wed,  6 Aug 2025 23:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC6626A0EE;
	Wed,  6 Aug 2025 23:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KjTF9vFf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B8F26A1C1;
	Wed,  6 Aug 2025 23:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754522408; cv=none; b=G+MBGud79ZWxKNOhoT7PU6DFwgVFV3xQDEyhRi+xaKcCHK1x+v4iDL+NetppLdsAPJRk5+JRFoRIXjitYySv8gD2yDwz81TqouhNC110t6VRrniAsscg2cBh/2+JD4yctSg/tqa5+4LbnDqNPx2jNeJTw+3xeVmR7OzEk2yb63I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754522408; c=relaxed/simple;
	bh=JfQFotiwf+YIiGXEHoH00+B6mobuy7IsAEk1M1OZK8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DwXd7jbb0kWI+FSc0CUJLe9glbgw5jujBIs5qbrq4rAXqGawAi9KU+9HIPLbUG4KFNhkDU/ArMcnqDfJ73XzqRDr2HWlztOvE3SJNgedqyp6W7KZ6Xfk8S0HoYYViayCJ+qEOFMonZVJURkjyZLw9g8094s7GrFVZO5o5Iuzg34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KjTF9vFf; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754522408; x=1786058408;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JfQFotiwf+YIiGXEHoH00+B6mobuy7IsAEk1M1OZK8o=;
  b=KjTF9vFfWqt7EYPWDSoiPJomRpdfTn9biINXKqEm0CRVw9pdux6OA5ZS
   ShMxhK4Q55NkIZppNiZwsfAroMC/N4X7IGoWARUkXBbG0Yc9uIrow9aLA
   bk1J3mDIXFKedGCvcV8GbL2fOk3yMb261Zs13KT6P1ExF/WYZK4WO6cAT
   /ZDGFWfFkzLJ/5+OywuaVVULPWoDBX6W9Mink5ooVlZYGlxqSaOV0FnjQ
   sc/RB+gX/klzum0ZVhsziDq58tfndW6LqsGCWJiYM5Axs71Uv9+udq4pZ
   WIhq+9+FjP3D9GEbW/bQZ+sYEnnIi8OxTlzbGw+WQh6LjnA9YSDc6wrfA
   g==;
X-CSE-ConnectionGUID: aT4ebjBhSHCDK4855MhtYA==
X-CSE-MsgGUID: 4cxDgSmjQe6Jubkca8fMkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67929243"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="67929243"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 16:20:05 -0700
X-CSE-ConnectionGUID: cxDPklwGSZKPfPAa877EuA==
X-CSE-MsgGUID: b8MQ1i4CSjaj0V4yn9qNWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="202061048"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 06 Aug 2025 16:20:01 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujnQL-0002Ao-2E;
	Wed, 06 Aug 2025 23:19:57 +0000
Date: Thu, 7 Aug 2025 07:19:41 +0800
From: kernel test robot <lkp@intel.com>
To: Ling Xu <quic_lxu5@quicinc.com>, srini@kernel.org,
	amahesh@qti.qualcomm.com, arnd@arndb.de, gregkh@linuxfoundation.org,
	sumit.semwal@linaro.org, christian.koenig@amd.com,
	thierry.escande@linaro.org, quic_vgattupa@quicinc.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org, Ling Xu <quic_lxu5@quicinc.com>,
	stable@kernel.org
Subject: Re: [PATCH v2 4/4] misc: fastrpc: Skip reference for DMA handles
Message-ID: <202508070731.S30957lV-lkp@intel.com>
References: <20250806115114.688814-5-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806115114.688814-5-quic_lxu5@quicinc.com>

Hi Ling,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.16 next-20250806]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ling-Xu/misc-fastrpc-Save-actual-DMA-size-in-fastrpc_map-structure/20250806-200133
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20250806115114.688814-5-quic_lxu5%40quicinc.com
patch subject: [PATCH v2 4/4] misc: fastrpc: Skip reference for DMA handles
config: hexagon-randconfig-002-20250807 (https://download.01.org/0day-ci/archive/20250807/202508070731.S30957lV-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508070731.S30957lV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508070731.S30957lV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/fastrpc.c:368:30: warning: unused variable 'sess' [-Wunused-variable]
     368 |         struct fastrpc_session_ctx *sess = fl->sctx;
         |                                     ^~~~
   1 warning generated.


vim +/sess +368 drivers/misc/fastrpc.c

c68cfb718c8f97 Srinivas Kandagatla      2019-02-08  363  
8f6c1d8c4f0cc3 Vamsi Krishna Gattupalli 2022-02-14  364  
8f6c1d8c4f0cc3 Vamsi Krishna Gattupalli 2022-02-14  365  static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
1922c68c56c660 Ling Xu                  2025-08-06  366  			    struct fastrpc_map **ppmap)
c68cfb718c8f97 Srinivas Kandagatla      2019-02-08  367  {
9446fa1683a7e3 Abel Vesa                2022-11-24 @368  	struct fastrpc_session_ctx *sess = fl->sctx;
c68cfb718c8f97 Srinivas Kandagatla      2019-02-08  369  	struct fastrpc_map *map = NULL;
d259063578ed76 Ling Xu                  2025-08-06  370  	struct dma_buf *buf;
9446fa1683a7e3 Abel Vesa                2022-11-24  371  	int ret = -ENOENT;
c68cfb718c8f97 Srinivas Kandagatla      2019-02-08  372  
d259063578ed76 Ling Xu                  2025-08-06  373  	buf = dma_buf_get(fd);
d259063578ed76 Ling Xu                  2025-08-06  374  	if (IS_ERR(buf))
d259063578ed76 Ling Xu                  2025-08-06  375  		return PTR_ERR(buf);
d259063578ed76 Ling Xu                  2025-08-06  376  
9446fa1683a7e3 Abel Vesa                2022-11-24  377  	spin_lock(&fl->lock);
c68cfb718c8f97 Srinivas Kandagatla      2019-02-08  378  	list_for_each_entry(map, &fl->maps, node) {
d259063578ed76 Ling Xu                  2025-08-06  379  		if (map->fd != fd || map->buf != buf)
9446fa1683a7e3 Abel Vesa                2022-11-24  380  			continue;
9446fa1683a7e3 Abel Vesa                2022-11-24  381  
9446fa1683a7e3 Abel Vesa                2022-11-24  382  		*ppmap = map;
9446fa1683a7e3 Abel Vesa                2022-11-24  383  		ret = 0;
9446fa1683a7e3 Abel Vesa                2022-11-24  384  		break;
c68cfb718c8f97 Srinivas Kandagatla      2019-02-08  385  	}
9446fa1683a7e3 Abel Vesa                2022-11-24  386  	spin_unlock(&fl->lock);
8f6c1d8c4f0cc3 Vamsi Krishna Gattupalli 2022-02-14  387  
8f6c1d8c4f0cc3 Vamsi Krishna Gattupalli 2022-02-14  388  	return ret;
8f6c1d8c4f0cc3 Vamsi Krishna Gattupalli 2022-02-14  389  }
8f6c1d8c4f0cc3 Vamsi Krishna Gattupalli 2022-02-14  390  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

