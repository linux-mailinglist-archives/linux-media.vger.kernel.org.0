Return-Path: <linux-media+bounces-37172-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C684AFDFBE
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 08:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A486A4E797A
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 05:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368E526B2C8;
	Wed,  9 Jul 2025 05:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W2L8ieow"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5A71B6D08;
	Wed,  9 Jul 2025 05:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752040796; cv=none; b=i4AgIrM4/s/Cu5Np+pF0VxzzMtTBotLNT3vb1o/+GRN2jP5EE4pyjbs0npehGl/lQ5cfTWzwGIteUY1NPAF5nMCRoKilS3gh+yNzBPQvqFimVjdcXmebxxolEkwlXtXIoCqChgE4tT4ZrHSgCwYlMtO+vLGKnt/MSBojjkZNkD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752040796; c=relaxed/simple;
	bh=LzYB6pw/2+1lvLXdkdXCIJm1qBGvJhF76UZJym27mtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aSiOAF8DXK2fPw6SAaM9CQS3qh/Mlovee/3R7TuUCZItPo8GJUs87M+QcQDXC2X6XTYTElQI1GNRMzHuTE9m51RdvYI15EhTYc9cE4qLDPnjqtIDdisZw1lAulxiZJ2x81z4rZNFcVeVA+UXxuefAhyFWKGkQctDaw62lWGm9/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W2L8ieow; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752040794; x=1783576794;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LzYB6pw/2+1lvLXdkdXCIJm1qBGvJhF76UZJym27mtI=;
  b=W2L8ieowE66nAGiudrY1KzZNbz5+EKIfkXbRRjilRDRP9YKFDfGfse8z
   0IDapfgfVIEfUpA04CQMunCAwkgR2ERFW3qz31PTkQQsJjlbd5Z1ltnGL
   Qi7PRdGmSWshlioGE8e0gR/duWZjf6Yn9fd+8HlrFvQ6CY13IphRXDWna
   n/LCYsdIDsgTbDiBd5hACSbkkyTuwOGAcGt2K+k6hjt/gMIA5gREjxVKW
   TSBg5VQPAbJN1th3hJwVt72ggEIltbEQh498ki23Cn6krKvQu+1M+6afN
   +ncX7Tkq/FexLX+aTEBNxDph7xYVDqBGEYi/IU0cp2mAgXsvJ/UjfA12K
   g==;
X-CSE-ConnectionGUID: hXuzE9aFSbm43FeQHlOoxA==
X-CSE-MsgGUID: ZFo3x4fFQSS3kdNuBH2wGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54009937"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54009937"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 22:59:50 -0700
X-CSE-ConnectionGUID: A6UhJEe2QCS4oMRU34mFqw==
X-CSE-MsgGUID: L/VUNKizQfG5E89QG7KNzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="156414304"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Jul 2025 22:59:47 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZNqL-00039P-06;
	Wed, 09 Jul 2025 05:59:45 +0000
Date: Wed, 9 Jul 2025 13:59:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Keke Li <keke.li@amlogic.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH 1/8] media: uapi: Introduce V4L2 extensible params
Message-ID: <202507091305.hPkKkWZJ-lkp@intel.com>
References: <20250708-extensible-parameters-validation-v1-1-9fc27c9c728c@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708-extensible-parameters-validation-v1-1-9fc27c9c728c@ideasonboard.com>

Hi Jacopo,

kernel test robot noticed the following build errors:

[auto build test ERROR on a8598c7de1bcd94461ca54c972efa9b4ea501fb9]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacopo-Mondi/media-uapi-Introduce-V4L2-extensible-params/20250708-184651
base:   a8598c7de1bcd94461ca54c972efa9b4ea501fb9
patch link:    https://lore.kernel.org/r/20250708-extensible-parameters-validation-v1-1-9fc27c9c728c%40ideasonboard.com
patch subject: [PATCH 1/8] media: uapi: Introduce V4L2 extensible params
config: i386-buildonly-randconfig-003-20250709 (https://download.01.org/0day-ci/archive/20250709/202507091305.hPkKkWZJ-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250709/202507091305.hPkKkWZJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507091305.hPkKkWZJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/media/v4l2-extensible-params.h:23:2: error: "This file should not be included directly by applications"
      23 | #error "This file should not be included directly by applications"
         |  ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

