Return-Path: <linux-media+bounces-44191-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBA3BCF01E
	for <lists+linux-media@lfdr.de>; Sat, 11 Oct 2025 07:33:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A3D4D4E3461
	for <lists+linux-media@lfdr.de>; Sat, 11 Oct 2025 05:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 231E12153ED;
	Sat, 11 Oct 2025 05:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vk+03wve"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E99D4C97;
	Sat, 11 Oct 2025 05:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760160802; cv=none; b=ELVsUhG+ICeFYsvidkHO+L6nK/u/Xr4yIG6yikJ2V+0SB4AsNo/tduc/s4kxFiLqNkcwhVNqNW/f+61e5EbXahT2q4h70z8LXaGndMvklMw/TkSxM+2dKMO8WHNW1+Uw60ys9bRHPEWStl40C8tbnuSH2ZvIz/APJW8P8/mMyes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760160802; c=relaxed/simple;
	bh=tICeZKtlPTGn6MN+AocuuzSNU12FNBC7lzLtzqfGuwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJZ5HEiMYNygs2J1e5pSyTgz4eE2/EGjZXiFD4S/V5+5hL6+E+I94Ndy9MwGgX86DUw+276fRj9TdzaPcYJVbENjiSpHY0U0nvEpZqCuB4GndFvbV7uQmeqZzsZwUKiJ6HWCK4h9atqBViJIurQB4YV6/lZhQkluXGeSnIOsR+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vk+03wve; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760160801; x=1791696801;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tICeZKtlPTGn6MN+AocuuzSNU12FNBC7lzLtzqfGuwQ=;
  b=Vk+03wvenVJslzJufj+yYpmkYn0JVZ/nEPuJbKUbJK3Z0fKdgb48oLKJ
   /T1HpInqBmky9zJf+zAUItkquPt4cwOi/fc2OsRHiJkdl/14SCGZnmbUH
   8ag9SYYDk6STR3Wguy7Ok+uXvLZf+X5ILO++TC95G0OAcA62bhBcIbFg7
   FHjfklxaU88v+414PYatXXsuIe/i6GsZM0QsVV2rEmmhxroMDWAeZNkr/
   R5OLCmec5J42zYVkvQGZtzBps1AjLUVnk70Y3P9gt1UuXKke6OTS1o6Hb
   MgGQa5umARsOep/s34WF+QSKEUQ5xjV1lbdhBesBAJ438O67OXDKTWo/n
   Q==;
X-CSE-ConnectionGUID: 5umLwW28TQqDSy6DWzWGRQ==
X-CSE-MsgGUID: 85Uuk/EKSpSa5nrHsZwUwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="62416212"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="62416212"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 22:33:20 -0700
X-CSE-ConnectionGUID: IPZXp56TS/iOLDMQYGX7lQ==
X-CSE-MsgGUID: C0av3SMDRfSz2cMTpx53hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="212094623"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Oct 2025 22:33:16 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7SEE-0003Xj-04;
	Sat, 11 Oct 2025 05:33:14 +0000
Date: Sat, 11 Oct 2025 13:32:51 +0800
From: kernel test robot <lkp@intel.com>
To: Sven =?iso-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@pengutronix.de,
	Sven =?iso-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>
Subject: Re: [PATCH 16/16] media: rockchip: rga: add rga3 support
Message-ID: <202510111354.QeqIltfU-lkp@intel.com>
References: <20251007-spu-rga3-v1-16-36ad85570402@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007-spu-rga3-v1-16-36ad85570402@pengutronix.de>

Hi Sven,

kernel test robot noticed the following build warnings:

[auto build test WARNING on afb100a5ea7a13d7e6937dcd3b36b19dc6cc9328]

url:    https://github.com/intel-lab-lkp/linux/commits/Sven-P-schel/media-rockchip-rga-use-clk_bulk-api/20251010-104411
base:   afb100a5ea7a13d7e6937dcd3b36b19dc6cc9328
patch link:    https://lore.kernel.org/r/20251007-spu-rga3-v1-16-36ad85570402%40pengutronix.de
patch subject: [PATCH 16/16] media: rockchip: rga: add rga3 support
config: riscv-randconfig-002-20251011 (https://download.01.org/0day-ci/archive/20251011/202510111354.QeqIltfU-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510111354.QeqIltfU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510111354.QeqIltfU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/rockchip/rga/rga3-hw.c:144:15: warning: variable 'src_h' set but not used [-Wunused-but-set-variable]
     144 |         unsigned int src_h, src_w, dst_h, dst_w;
         |                      ^
>> drivers/media/platform/rockchip/rga/rga3-hw.c:144:22: warning: variable 'src_w' set but not used [-Wunused-but-set-variable]
     144 |         unsigned int src_h, src_w, dst_h, dst_w;
         |                             ^
>> drivers/media/platform/rockchip/rga/rga3-hw.c:144:29: warning: variable 'dst_h' set but not used [-Wunused-but-set-variable]
     144 |         unsigned int src_h, src_w, dst_h, dst_w;
         |                                    ^
>> drivers/media/platform/rockchip/rga/rga3-hw.c:144:36: warning: variable 'dst_w' set but not used [-Wunused-but-set-variable]
     144 |         unsigned int src_h, src_w, dst_h, dst_w;
         |                                           ^
   4 warnings generated.


vim +/src_h +144 drivers/media/platform/rockchip/rga/rga3-hw.c

   137	
   138	static void rga3_cmd_set_win0_format(struct rga_ctx *ctx)
   139	{
   140		u32 *cmd = ctx->rga->cmdbuf_virt;
   141		const struct rga3_fmt *in = ctx->in.fmt;
   142		const struct rga3_fmt *out = ctx->out.fmt;
   143		const struct v4l2_format_info *in_fmt, *out_fmt;
 > 144		unsigned int src_h, src_w, dst_h, dst_w;
   145		bool r2y, y2r;
   146		u8 rd_format;
   147		unsigned int reg;
   148	
   149		src_h = ctx->in.crop.height;
   150		src_w = ctx->in.crop.width;
   151		dst_h = ctx->out.crop.height;
   152		dst_w = ctx->out.crop.width;
   153	
   154		in_fmt = v4l2_format_info(in->fourcc);
   155		out_fmt = v4l2_format_info(out->fourcc);
   156		r2y = v4l2_is_format_rgb(in_fmt) && v4l2_is_format_yuv(out_fmt);
   157		y2r = v4l2_is_format_yuv(in_fmt) && v4l2_is_format_rgb(out_fmt);
   158	
   159		if (in->semi_planar)
   160			rd_format = RGA3_RDWR_FORMAT_SEMI_PLANAR;
   161		else
   162			rd_format = RGA3_RDWR_FORMAT_INTERLEAVED;
   163	
   164		reg = RGA3_WIN0_RD_CTRL - RGA3_FIRST_CMD_REG;
   165		cmd[reg >> 2] |= FIELD_PREP(RGA3_WIN_PIC_FORMAT, in->hw_format)
   166			      |  FIELD_PREP(RGA3_WIN_YC_SWAP, in->yc_swap)
   167			      |  FIELD_PREP(RGA3_WIN_RBUV_SWAP, in->rbuv_swap)
   168			      |  FIELD_PREP(RGA3_WIN_RD_FORMAT, rd_format)
   169			      |  FIELD_PREP(RGA3_WIN_R2Y, r2y)
   170			      |  FIELD_PREP(RGA3_WIN_Y2R, y2r)
   171			      |  FIELD_PREP(RGA3_WIN_CSC_MODE, RGA3_WIN_CSC_MODE_BT601_F);
   172	}
   173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

