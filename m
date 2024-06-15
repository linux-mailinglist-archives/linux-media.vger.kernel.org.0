Return-Path: <linux-media+bounces-13303-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE31B90988F
	for <lists+linux-media@lfdr.de>; Sat, 15 Jun 2024 15:55:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74C1CB217B7
	for <lists+linux-media@lfdr.de>; Sat, 15 Jun 2024 13:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E9F49627;
	Sat, 15 Jun 2024 13:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ai/hAGqb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D425944F;
	Sat, 15 Jun 2024 13:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718459725; cv=none; b=I59QbSQhJbKbMMs0hvoRz8YFOBWyivRo5kKB38SeVKE5iKO0FfmrJVnrGAySN3Sj93JmLtrqqrQkdFdWLY5K/KToI2byE3cPe6iC4RSY5SBN7JSWFIBbY3WKfgQsB4xY0dWLdLZ+ArBYg3LbsiJu7BYc6FZlRVaHoQoYS3yGXZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718459725; c=relaxed/simple;
	bh=o2zni6lmU6brxTe62oPbpr/wNnVyUniYuEMKpQZnOmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TyThjsJbVeGzzov0u1EcC3EPJJjZtaS1ygsYdAKVOI32eMwj4Zrj4lKz6cqFn7VrKQ+jxrblm0TQZ3aGXjrV78kNqyMp2vNErLTUzKdO7Mv0tgdsWQiS4MoAMXzySxY50eQgxbPvR5Lg5mzoaWu+haCXmylZws2k0awHKdzsTWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ai/hAGqb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718459723; x=1749995723;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o2zni6lmU6brxTe62oPbpr/wNnVyUniYuEMKpQZnOmQ=;
  b=ai/hAGqbww4RcVptOnfayU1o+TDDLZZsSD2kJGDZKhDLB381oDeJrkzX
   /X+23SO772j7Bhb/uSk5N2TfYq2OZeqUZNCYEf6avaIMDxC5j2yY7khBI
   TEoguSNFzTUIOSUxHstQqeXAkyvCT3oGYjtMKL27mJ0oVCz3ehHHLOQzQ
   EpC8ZK7M+9JY+xZTLh2u0QLa+yW676bMXriI/Ic9QdXDY5ZH2sD9uzUR3
   JwEVBoqveeKeSX1FYlDjEVvakSJhpVsx22UfuxQfpg4mYSJ7NT7kN5agM
   T2WNla0s0Nb5wYzo7nyHk6FVWW9JuhPJwDnASgQcYOMsHlLt18Krle/FM
   Q==;
X-CSE-ConnectionGUID: ebqFZ+r4QYuAPFkovE2KeA==
X-CSE-MsgGUID: NR3OeXq0TT2okG3fNIxdjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="40760307"
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="40760307"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 06:55:22 -0700
X-CSE-ConnectionGUID: Z1nASWauRT2SWTLC7u9Yow==
X-CSE-MsgGUID: AAqhFvwAQbO9qsOphaSZhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="40630041"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Jun 2024 06:55:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sITsC-00005N-21;
	Sat, 15 Jun 2024 13:55:16 +0000
Date: Sat, 15 Jun 2024 21:55:03 +0800
From: kernel test robot <lkp@intel.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Alexey Charkov <alchark@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
Message-ID: <202406152129.dV4K8R5k-lkp@intel.com>
References: <20240615015734.1612108-2-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240615015734.1612108-2-detlev.casanova@collabora.com>

Hi Detlev,

kernel test robot noticed the following build errors:

[auto build test ERROR on rockchip/for-next]
[also build test ERROR on robh/for-next linus/master v6.10-rc3 next-20240613]
[cannot apply to media-tree/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Detlev-Casanova/media-rockchip-Introduce-the-rkvdec2-driver/20240615-100124
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20240615015734.1612108-2-detlev.casanova%40collabora.com
patch subject: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240615/202406152129.dV4K8R5k-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406152129.dV4K8R5k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406152129.dV4K8R5k-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/media/rkvdec2/rkvdec2-h264.c: In function 'rkvdec2_write_regs':
>> drivers/staging/media/rkvdec2/rkvdec2-h264.c:563:9: error: implicit declaration of function '__iowrite32_copy_full'; did you mean '__iowrite32_copy'? [-Werror=implicit-function-declaration]
     563 |         __iowrite32_copy_full(rkvdec->regs + OFFSET_COMMON_REGS,
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         __iowrite32_copy
   cc1: some warnings being treated as errors


vim +563 drivers/staging/media/rkvdec2/rkvdec2-h264.c

   557	
   558	static void rkvdec2_write_regs(struct rkvdec2_ctx *ctx)
   559	{
   560		struct rkvdec2_dev *rkvdec = ctx->dev;
   561		struct rkvdec2_h264_ctx *h264_ctx = ctx->priv;
   562	
 > 563		__iowrite32_copy_full(rkvdec->regs + OFFSET_COMMON_REGS,
   564				      &h264_ctx->regs.common,
   565				      sizeof(h264_ctx->regs.common));
   566		__iowrite32_copy_full(rkvdec->regs + OFFSET_CODEC_PARAMS_REGS,
   567				      &h264_ctx->regs.h264_param,
   568				      sizeof(h264_ctx->regs.h264_param));
   569		__iowrite32_copy_full(rkvdec->regs + OFFSET_COMMON_ADDR_REGS,
   570				      &h264_ctx->regs.common_addr,
   571				      sizeof(h264_ctx->regs.common_addr));
   572		__iowrite32_copy_full(rkvdec->regs + OFFSET_CODEC_ADDR_REGS,
   573				      &h264_ctx->regs.h264_addr,
   574				      sizeof(h264_ctx->regs.h264_addr));
   575		__iowrite32_copy_full(rkvdec->regs + OFFSET_POC_HIGHBIT_REGS,
   576				      &h264_ctx->regs.h264_highpoc,
   577				      sizeof(h264_ctx->regs.h264_highpoc));
   578	}
   579	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

