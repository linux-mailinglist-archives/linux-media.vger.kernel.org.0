Return-Path: <linux-media+bounces-37186-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 704BFAFE59D
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 12:23:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6EF447B7336
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 10:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9E728C86C;
	Wed,  9 Jul 2025 10:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IeEC+s3X"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81328267B89;
	Wed,  9 Jul 2025 10:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752056598; cv=none; b=jiync6agpN1SP2LWVnzg6TA7Z3doj+rrtbejTsey668nTKH7hs1oVoo41ktTDrMyl97SLLLQtIhBTyTnOzWmZhu+kC9ZgM8Q2CzpMLZRNkUIhnJsXEIzuadQGNGXLV8YzBtHN1eBTCc/Jc+MvRWETv80I7bRRZZUzYSpZAfszes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752056598; c=relaxed/simple;
	bh=saN/d4gfnEw13D+prR8b8IdE3mlm76MqGHQUgKWmIVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rveliFiIsLet6RMiuBR7zT5+J+ryVQ1J7LQYt1uiBGci/uRL7CR/PMi6e96HwR8SaGVwxWzdx74gkNBU92qfdgm9kg03SKJRYZUIxQt4CLs/ra/DlrHVhdEdjLPzuw6gZvGDGY/T8Xwzd0B6siz5MCqEUHzMo1gcHm2GcpQoltc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IeEC+s3X; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752056597; x=1783592597;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=saN/d4gfnEw13D+prR8b8IdE3mlm76MqGHQUgKWmIVM=;
  b=IeEC+s3XfzBeXxRX6sHNh70TeJ6pGFSgvQSqxK+sMDGRJ9gEdUzTDuKz
   Ual7t+24TOp3y0v0EUdVQE3hOs8UUMdt2k9g8MDnPBeUyjkWieCfsvydA
   jOdSrgp+y4XyUPz/NZJjja95IcEI/zi2j7SR8nunOD1NAELX5tCjScbq8
   YNMvURlRpe3mVf9hN1LDr0HHLlexqkBegSLTU8/uEOwW8ZtR1NdZ/N3bA
   oAjCJJtxhB92nW+paRKQQx6Wb41ClW3MDAshsl2EJOqwDCKg5wsBVAHWA
   Cit1knUaxW0ReufMZDsHtgvq8P/jETglTbapfqc5eIhmG50Sa0mOHi8DP
   Q==;
X-CSE-ConnectionGUID: KS1rp88IQxmrxT2viSX29A==
X-CSE-MsgGUID: W/Qf2YTTRye0JP6nC37iAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="76860272"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="76860272"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 03:23:16 -0700
X-CSE-ConnectionGUID: 0H38jff9RYSTaPGDbHz5iw==
X-CSE-MsgGUID: P5tlRiFCQPi8zz6fhqvRcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="156221519"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Jul 2025 03:23:13 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZRxG-0003OR-0S;
	Wed, 09 Jul 2025 10:23:10 +0000
Date: Wed, 9 Jul 2025 18:22:37 +0800
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
Subject: Re: [PATCH 2/8] media: uapi: Convert RkISP1 to V4L2 extensible params
Message-ID: <202507091859.x8Yx8AZb-lkp@intel.com>
References: <20250708-extensible-parameters-validation-v1-2-9fc27c9c728c@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708-extensible-parameters-validation-v1-2-9fc27c9c728c@ideasonboard.com>

Hi Jacopo,

kernel test robot noticed the following build errors:

[auto build test ERROR on a8598c7de1bcd94461ca54c972efa9b4ea501fb9]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacopo-Mondi/media-uapi-Introduce-V4L2-extensible-params/20250708-184651
base:   a8598c7de1bcd94461ca54c972efa9b4ea501fb9
patch link:    https://lore.kernel.org/r/20250708-extensible-parameters-validation-v1-2-9fc27c9c728c%40ideasonboard.com
patch subject: [PATCH 2/8] media: uapi: Convert RkISP1 to V4L2 extensible params
config: i386-buildonly-randconfig-003-20250709 (https://download.01.org/0day-ci/archive/20250709/202507091859.x8Yx8AZb-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250709/202507091859.x8Yx8AZb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507091859.x8Yx8AZb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/rkisp1-config.h:10:10: fatal error: 'linux/build_bug.h' file not found
      10 | #include <linux/build_bug.h>
         |          ^~~~~~~~~~~~~~~~~~~
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

