Return-Path: <linux-media+bounces-29175-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE79A78411
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 23:34:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 986C718885B8
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 21:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53517214A8D;
	Tue,  1 Apr 2025 21:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jcm1eu9C"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5BD20F078;
	Tue,  1 Apr 2025 21:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743543261; cv=none; b=FaHr/STim9wBzqR52w4ppFpb7Uf19jGhksxDZCgQ714lR/oFfKVxnhLFXF75K5/CGqyugfUCFXOEP6LTxu5sDIeIvXikpfPqXZjEjwzqg3elfMMvU+rKQUWPoo8JARFpMClI1MJQctrr8lcmxMRwMuDrH9qxaFcC0bvbLyIZ1lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743543261; c=relaxed/simple;
	bh=uxEuMTnTnLQyuY/5/nABhOzyq2NytKQ9FMea/BjKrrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dP3AhnVDbPdtJRGxD00NvupThqYP008vftSuj8rOZufbxDqDrCwUArrqkObM3aC3YyxPgQE0wBBgCKMOfsh1AQOiDiZ0Aa5tPOwZ7X0tP+5pJyjvA4u2F/U8Ry2ArhtioMJAjOQH4lsF9wnWc70d3fGsV4iBB1Sa89AB0iw06z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jcm1eu9C; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743543260; x=1775079260;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uxEuMTnTnLQyuY/5/nABhOzyq2NytKQ9FMea/BjKrrc=;
  b=jcm1eu9CwbBKSnf+PFsSX60uXEQ8cQY9icoLc4y5g/yQ1IQ/yE4Fx3Uz
   99ujwvj5KHv3cSnuAzl7I6KE6oZdC+JQbEinPy4ZlEQggSDP0/hivrZz3
   ycOmFRdO67SrId30TPrkV4S0ahYzYb50uYuL7KfTXLtf1Wfe1U867srkq
   rCIS+Dcm+Pk+DpptaJxLPd/nNyzUYECRxRV7n3yqmqSPrGZDBjUB3kcf9
   X0MPM9Qhsu0DS5KJBGAHI9Nzb+v/JXq2c7MnFFPejcfjCp+O4IudOKIe3
   WRjoUmfxAnYqdpjgc3aC2knPc14fMVNp8CK9OWaYARIi4I66QE23mGdtL
   w==;
X-CSE-ConnectionGUID: Miw4kORrTXGYevlZ1Ygvvg==
X-CSE-MsgGUID: BiI9Y0HgR4C7lfiVf7/dGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="48677761"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="48677761"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 14:34:19 -0700
X-CSE-ConnectionGUID: zm39YvqXSJO8mMlsi9+ZAA==
X-CSE-MsgGUID: ufqPU0O4SU+eVSqPEO8/ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="126397890"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 01 Apr 2025 14:34:17 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzjFH-000A9G-1M;
	Tue, 01 Apr 2025 21:34:13 +0000
Date: Wed, 2 Apr 2025 05:33:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH v7 5/5] media: vsp1: Add VSPX support
Message-ID: <202504020532.rdq3yOcN-lkp@intel.com>
References: <20250401-v4h-iif-v7-5-cc547c0bddd5@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401-v4h-iif-v7-5-cc547c0bddd5@ideasonboard.com>

Hi Jacopo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f2151613e040973c868d28c8b00885dfab69eb75]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacopo-Mondi/media-vsp1-Add-support-IIF-ISP-Interface/20250401-222806
base:   f2151613e040973c868d28c8b00885dfab69eb75
patch link:    https://lore.kernel.org/r/20250401-v4h-iif-v7-5-cc547c0bddd5%40ideasonboard.com
patch subject: [PATCH v7 5/5] media: vsp1: Add VSPX support
config: i386-buildonly-randconfig-004-20250402 (https://download.01.org/0day-ci/archive/20250402/202504020532.rdq3yOcN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504020532.rdq3yOcN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504020532.rdq3yOcN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/renesas/vsp1/vsp1_vspx.c: In function 'vsp1_vspx_cleanup':
>> drivers/media/platform/renesas/vsp1/vsp1_vspx.c:599:36: warning: variable 'vspx_pipe' set but not used [-Wunused-but-set-variable]
     599 |         struct vsp1_vspx_pipeline *vspx_pipe;
         |                                    ^~~~~~~~~
--
>> drivers/media/platform/renesas/vsp1/vsp1_vspx.c:395: warning: Function parameter or struct member 'desc' not described in 'vsp1_isp_job_prepare'
>> drivers/media/platform/renesas/vsp1/vsp1_vspx.c:395: warning: expecting prototype for vsp1_vspx_job_prepare(). Prototype was for vsp1_isp_job_prepare() instead


vim +/vspx_pipe +599 drivers/media/platform/renesas/vsp1/vsp1_vspx.c

   596	
   597	void vsp1_vspx_cleanup(struct vsp1_device *vsp1)
   598	{
 > 599		struct vsp1_vspx_pipeline *vspx_pipe;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

