Return-Path: <linux-media+bounces-16388-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB36795496D
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 14:55:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C0B01F235A1
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 12:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A3FF1B5821;
	Fri, 16 Aug 2024 12:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ccqst9i5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4840D45026;
	Fri, 16 Aug 2024 12:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723812899; cv=none; b=eOzbRBVb/JLKgVy7XddMbvslahxh7yMWLBC4aIirGSyeVu+q+yNJPQ0tj5kbtzhPQRhWvNBxrYG42FWu7ZJEZBqeBPtJCkrAIJsvpPls98QxjEFZeMcLxEpKbv1rPgt/vELZ/Erq7PuB+WjMGSrZfzERm4JkAxwKQy7Hp6aJSMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723812899; c=relaxed/simple;
	bh=OSCzB+p00nSVW/dHRk7hsNkN+RR7Pek+A4z85VZMYuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gsxAhs7sszGGxjqfL2982xjotfOpsa2/6hEqV9yOAjaI+O0x8c3kn0NxXmP/ThjilyHrSvCiUVHi75rcz9oW6jrv5BJOzN3MkKBkW24zvCUZxPil+QpqoHiDMsCG4fcHBVwwGldeZtXk8aV3i8ZK0NlnDxRhYyzl7n7sdS/NuMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ccqst9i5; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723812899; x=1755348899;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OSCzB+p00nSVW/dHRk7hsNkN+RR7Pek+A4z85VZMYuU=;
  b=ccqst9i548UGMuEgqqoGlKB6DJ1xnfGu6cc2xDgTaZ5dFCb73wVoGCJj
   RbazYnVEZ15B2oCqSDJFMKAYfRVW0AhzvDbSb9bteZtcsmxuGQuVbx/Un
   tYKEcxyUBdp+yHJFbeVyBKdlcNAptzl1ndKi+3Mgic8uCG9Qpz12BD9LC
   yhk/L83BXqPbboA3/mRdRlPJKyKo4tr6FLME8scAwWfHbkGq8M0dvWF4x
   z6ioI3u53ED50KFoYG0Slqk7/MIzh6k5ZptuEXAzx6+BLWDL0vevKXnFz
   RQcfoDBR61ed2XFzh+V76k+XlYnE1Q/acQsa7pB+8YgzBznc8AdW7bw1s
   Q==;
X-CSE-ConnectionGUID: 2tZsFIBJSf+vXEyHD7p+lA==
X-CSE-MsgGUID: b2/5FrpDRiaHfIVsLAU94A==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="33259274"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="33259274"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 05:54:58 -0700
X-CSE-ConnectionGUID: QDVynEIoRQ270siWOnAKdw==
X-CSE-MsgGUID: m3JGk3tFT6SARvoiCDI1VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="90440914"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Aug 2024 05:54:54 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sewTk-0006Qs-2B;
	Fri, 16 Aug 2024 12:54:52 +0000
Date: Fri, 16 Aug 2024 20:54:51 +0800
From: kernel test robot <lkp@intel.com>
To: Huan Yang <link@vivo.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: Re: [PATCH v3 5/5] udmabuf: remove udmabuf_folio
Message-ID: <202408162012.cL9pnFSm-lkp@intel.com>
References: <20240813090518.3252469-6-link@vivo.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813090518.3252469-6-link@vivo.com>

Hi Huan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 033a4691702cdca3a613256b0623b8eeacb4985e]

url:    https://github.com/intel-lab-lkp/linux/commits/Huan-Yang/udmabuf-cancel-mmap-page-fault-direct-map-it/20240814-231504
base:   033a4691702cdca3a613256b0623b8eeacb4985e
patch link:    https://lore.kernel.org/r/20240813090518.3252469-6-link%40vivo.com
patch subject: [PATCH v3 5/5] udmabuf: remove udmabuf_folio
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240816/202408162012.cL9pnFSm-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240816/202408162012.cL9pnFSm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408162012.cL9pnFSm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/udmabuf.c:175: warning: Function parameter or struct member 'ubuf' not described in 'unpin_all_folios'


vim +175 drivers/dma-buf/udmabuf.c

17a7ce20349045 Gurchetan Singh 2019-12-02  165  
d934739404652b Huan Yang       2024-08-13  166  /**
d934739404652b Huan Yang       2024-08-13  167   * unpin_all_folios:		unpin each folio we pinned in create
d934739404652b Huan Yang       2024-08-13  168   * The udmabuf set all folio in folios and pinned it, but for large folio,
d934739404652b Huan Yang       2024-08-13  169   * We may have only used a small portion of the physical in the folio.
d934739404652b Huan Yang       2024-08-13  170   * we will repeatedly, sequentially set the folio into the array to ensure
d934739404652b Huan Yang       2024-08-13  171   * that the offset can index the correct folio at the corresponding index.
d934739404652b Huan Yang       2024-08-13  172   * Hence, we only need to unpin the first iterred folio.
d934739404652b Huan Yang       2024-08-13  173   */
d934739404652b Huan Yang       2024-08-13  174  static void unpin_all_folios(struct udmabuf *ubuf)
c6a3194c05e7e6 Vivek Kasireddy 2024-06-23 @175  {
d934739404652b Huan Yang       2024-08-13  176  	pgoff_t pg;
d934739404652b Huan Yang       2024-08-13  177  	struct folio *last = NULL;
c6a3194c05e7e6 Vivek Kasireddy 2024-06-23  178  
d934739404652b Huan Yang       2024-08-13  179  	for (pg = 0; pg < ubuf->pagecount; pg++) {
d934739404652b Huan Yang       2024-08-13  180  		struct folio *tmp = ubuf->folios[pg];
c6a3194c05e7e6 Vivek Kasireddy 2024-06-23  181  
d934739404652b Huan Yang       2024-08-13  182  		if (tmp == last)
d934739404652b Huan Yang       2024-08-13  183  			continue;
c6a3194c05e7e6 Vivek Kasireddy 2024-06-23  184  
d934739404652b Huan Yang       2024-08-13  185  		last = tmp;
d934739404652b Huan Yang       2024-08-13  186  		unpin_folio(tmp);
d934739404652b Huan Yang       2024-08-13  187  	}
c6a3194c05e7e6 Vivek Kasireddy 2024-06-23  188  }
c6a3194c05e7e6 Vivek Kasireddy 2024-06-23  189  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

