Return-Path: <linux-media+bounces-20063-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CA19AB9D9
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 01:10:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10E611C22C59
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 23:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C892B1CEAA6;
	Tue, 22 Oct 2024 23:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m0MRTff/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6801A174EFC
	for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 23:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729638614; cv=none; b=kIjQ9sKaEsPeZd0/osAMJeiQMXqnlWHsre87HsZSMbq24vsvFtqnjcVjKfLNt8GKJmgzg/e3t/4Nj7JMez9cqVzgC0ffFBtdx17XO8LzdhPV7UmxWQQeZBa2/a75AGOXqgHUo8ZJw5T+kYSOEeZYGc9WgS2gMXcgRFO+MMyf6L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729638614; c=relaxed/simple;
	bh=/9YrD5LpHK5gnoTpGzdU9uKix+1nU1xm/igNCQo2fIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YPgPP2VZiHncTYZD2UuCZXWRBoKekd2GdEshjjViYl4C73bhVYm7zcojbnyjjaP2aO0N0nWJ9e4VcbGJ2Ut2BeospT5n7nLP7XnzjxabB/TJRdaNEMCpLIENAmnvD+jg9BD1l4tbIV6/F1eYi4v3HYNAqYxAawX2LgLBZIq9SX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m0MRTff/; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729638613; x=1761174613;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/9YrD5LpHK5gnoTpGzdU9uKix+1nU1xm/igNCQo2fIU=;
  b=m0MRTff/ziAwnfpnwGu7ae2EsgLWcYtVhVyhZf5HgI3kBa0lFflLmrSp
   lC3ZVE4n52kh33IxCMJPrd6AbARd43pp7aY7Ij0x0vF16bpNGc5vsYBFg
   sP8JpAB/e6FHJC02h1LxAUXTzqKvMzJlmaost4cAX1RQhFCGOPyUJFTY3
   IFq5da0C4Qr8FOjCcQ88WlazIaHuFqvxa7ddiRSZE0+EXFTV0yvdOUbD9
   hIftyMABnZHi+SrXGx+FqUPHZx3liiN3U+Nd5VCXkjNH4tOHMJZa2UIf4
   mfswjQEr+dGD6ZoF+0vAQPF/Tb2QSzOjbgXCD80mfdC7/35Xt01zslCnB
   A==;
X-CSE-ConnectionGUID: /EbKruYaSIqKZwLui8s7yQ==
X-CSE-MsgGUID: LUN3APBjTZqnq2xehglwPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29144121"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29144121"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 16:10:12 -0700
X-CSE-ConnectionGUID: h7Oh7qSTTY29e+S+lslw2g==
X-CSE-MsgGUID: u9lMVZ/1T3qh8XoBgRgybw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="84630016"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Oct 2024 16:10:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3O0t-000UCo-10;
	Tue, 22 Oct 2024 23:10:07 +0000
Date: Wed, 23 Oct 2024 07:09:45 +0800
From: kernel test robot <lkp@intel.com>
To: Umang Jain <umang.jain@ideasonboard.com>, linux-media@vger.kernel.org,
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: Re: [PATCH] media: dw100: Enable dynamic vertex map
Message-ID: <202410230647.fPoPRh2O-lkp@intel.com>
References: <20241022063155.506191-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022063155.506191-1-umang.jain@ideasonboard.com>

Hi Umang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linuxtv-media-stage/master]
[also build test WARNING on media-tree/master sailus-media-tree/streams sailus-media-tree/master linus/master v6.12-rc4 next-20241022]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Umang-Jain/media-dw100-Enable-dynamic-vertex-map/20241022-143315
base:   https://git.linuxtv.org/media_stage.git master
patch link:    https://lore.kernel.org/r/20241022063155.506191-1-umang.jain%40ideasonboard.com
patch subject: [PATCH] media: dw100: Enable dynamic vertex map
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241023/202410230647.fPoPRh2O-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410230647.fPoPRh2O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410230647.fPoPRh2O-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/nxp/dw100/dw100.c:369:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     369 |                 u32 *user_map = ctrl->p_new.p_u32;
         |                 ^
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +369 drivers/media/platform/nxp/dw100/dw100.c

   361	
   362	static int dw100_s_ctrl(struct v4l2_ctrl *ctrl)
   363	{
   364		struct dw100_ctx *ctx =
   365			container_of(ctrl->handler, struct dw100_ctx, hdl);
   366	
   367		switch (ctrl->id) {
   368		case V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP:
 > 369			u32 *user_map = ctrl->p_new.p_u32;
   370			unsigned int id;
   371	
   372			mutex_lock(&ctx->maps_mutex);
   373			id = ctx->applied_map_id ? 0 : 1;
   374			memcpy(ctx->maps[id].map, user_map, ctx->map_size);
   375			ctx->user_map_is_updated = true;
   376			mutex_unlock(&ctx->maps_mutex);
   377	
   378			ctx->user_map_is_set = true;
   379			break;
   380		}
   381	
   382		return 0;
   383	}
   384	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

