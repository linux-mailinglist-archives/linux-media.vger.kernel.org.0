Return-Path: <linux-media+bounces-40835-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C19B32C88
	for <lists+linux-media@lfdr.de>; Sun, 24 Aug 2025 01:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC2B09E597C
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 23:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AAC82EC56B;
	Sat, 23 Aug 2025 23:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mzrxf0lh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333981E260C;
	Sat, 23 Aug 2025 23:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755991042; cv=none; b=nnkCE8rlMoFVYcvjfiKsBILskv5Byi4e6hxCv+t69kclG6yTzPqjjUhurxq5ipgrpmwdj3S6UngRN3GFEBd7XgevHIH/NJrTegWFXPWd9DYRKa5aJ4Qbs7nxnaQ8smlG+AvmgDrhZ0Hf2r89sUhtifnRWSAeFu95pOe/tSoRKGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755991042; c=relaxed/simple;
	bh=XtKM7eiCxZ0XFcJHdyLW+a+x0++34f9wWFWwximPqJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CSz0y6FGKvIxRrLQ3HjdssjRJGMutqeIYrWkWLmvDxtaUGyIH+Af2PRjTUIruP+TC8PWfxCblaBr62nVIG+Ra/869CCmkskehyqAiL4maa1+7kOqvu+qSawW67vcpxv7bb4kYbcfPKZAyIO+77WP8vmeF4YwSVRfYt6m9wF4gek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mzrxf0lh; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755991041; x=1787527041;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XtKM7eiCxZ0XFcJHdyLW+a+x0++34f9wWFWwximPqJI=;
  b=Mzrxf0lhRcdKUVg0KhbWEt5UE8ZiWQfbewkHIgWmqS9E9J8NdjQm9yaP
   DCLpcGHK1T+XGnc38G0R7Tu6nB6xUHDCVEXjxptQQ5U2D9GqqFcUhB2Ih
   tXE7LvTO3QmwN6nuMAuLMxOB7x61UC2D8KXztf6UHnXowyKRmvyPQR6rI
   Xh/uT1/2kr9f+CzEcmJ/1a1scGhL6yOpp7A3xmzrcry/FiwCcVXsju/DW
   6SdI4xy4qG50jUrlPbuBWKW+b2OZ/CwH/awt2eYuNP/zRWocdAIwOmTik
   nse0ru1UbAS5Hxbm7TtBZyyOwN15Jl3CnQ76PMaqHKPS/b+h3Nd6EUYIl
   Q==;
X-CSE-ConnectionGUID: h24IHC7/TBG56uXd3Qz7Pg==
X-CSE-MsgGUID: KOn82bjNTISRLL04a1CZIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58320860"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58320860"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 16:17:21 -0700
X-CSE-ConnectionGUID: IhBAIPK8QTOmrL+ANuUlfQ==
X-CSE-MsgGUID: wyxIHYRASsy7bwvCYPlLrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173258707"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 23 Aug 2025 16:17:18 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upxU3-000MeD-2L;
	Sat, 23 Aug 2025 23:17:15 +0000
Date: Sun, 24 Aug 2025 07:16:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Keke Li <keke.li@amlogic.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v4 5/8] media: v4l2-core: Introduce v4l2-params.c
Message-ID: <202508240704.AZwGXBaw-lkp@intel.com>
References: <20250820-extensible-parameters-validation-v4-5-30fe5a99cb1f@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-extensible-parameters-validation-v4-5-30fe5a99cb1f@ideasonboard.com>

Hi Jacopo,

kernel test robot noticed the following build errors:

[auto build test ERROR on a75b8d198c55e9eb5feb6f6e155496305caba2dc]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacopo-Mondi/media-uapi-Introduce-V4L2-extensible-params/20250820-210503
base:   a75b8d198c55e9eb5feb6f6e155496305caba2dc
patch link:    https://lore.kernel.org/r/20250820-extensible-parameters-validation-v4-5-30fe5a99cb1f%40ideasonboard.com
patch subject: [PATCH v4 5/8] media: v4l2-core: Introduce v4l2-params.c
config: nios2-randconfig-002-20250824 (https://download.01.org/0day-ci/archive/20250824/202508240704.AZwGXBaw-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508240704.AZwGXBaw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508240704.AZwGXBaw-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/media/v4l2-core/v4l2-params.o: in function `v4l2_params_buffer_validate':
   v4l2-params.c:(.text+0x124): undefined reference to `vb2_plane_vaddr'
>> v4l2-params.c:(.text+0x124): relocation truncated to fit: R_NIOS2_CALL26 against `vb2_plane_vaddr'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

