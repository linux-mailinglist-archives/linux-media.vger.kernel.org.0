Return-Path: <linux-media+bounces-19669-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E16EB99E8A3
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 14:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CC96282D71
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 12:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B97641EBA1F;
	Tue, 15 Oct 2024 12:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hF6TsX5T"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CBC1D4154;
	Tue, 15 Oct 2024 12:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728994092; cv=none; b=bV64tb8gx1d4MhSXVZn5+8xm3f3dvTeiNt9PfzKVZ6geasMuxeagjxC4/PAP0SPSPlXUU8Ijiy1ImAfCAOAMpvn60fg3FEV++MvlCUMyBKY+6gkCRQ31XjcgZ5Q3xZyU5/292P/i9oKaKxuUt9msQAIybIvpPJQvvxeL32515SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728994092; c=relaxed/simple;
	bh=prcWaevsNJkB7b1NJvXK8hYUAEJ/OhWYpq8lsaV3Gvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQylgJSGglfdKNzILX4RyNaTDUeIJgQ1w8P9cgYUt8DNonvPL3u4U+ur4KarOuo7dBweaUz2WVjhmKemeOvEBuR3r/Ge2ufymD3B53kpOHrQPw3qhOMOQVaXu+mrC3e4bnVjrmVH11v907v3vynQP6ZSLEX70U0s7UsiOXWKarQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hF6TsX5T; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728994091; x=1760530091;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=prcWaevsNJkB7b1NJvXK8hYUAEJ/OhWYpq8lsaV3Gvw=;
  b=hF6TsX5T7QoPw1DBMJKhqqkvMkO1Zt7Hn6J0j7ebuQmmIN8Ps4PWE/Z+
   nKDLO3CVBi6ZTL0aBjLDV50eE7XVtC7q4oWxsJTUfRXihvGDeWs+vPLh4
   DNzJXd8JuXi51V4QT2g3Yr3F/NNqQip4kv3CCa455wXizB8804VhCF/MZ
   fwnl8KH4wy8qHhTSX/fOp00ZERRBSezCsHrITLEtTt/iD2JYRGrpT5o5X
   sUceeQ5db6vBNZ/u8I5Ec04NjCtSfhOB1rCdVjsNdW7sxhgHuLcLqzaMu
   1qnlyqmEaKXz4XTLnZHTiTEZztECV5EmuYe/BRSlEUPdzj41fKjccR/6n
   Q==;
X-CSE-ConnectionGUID: MVfpoHxnRvSPRiax096THw==
X-CSE-MsgGUID: 61SaygMBQiyYroaW/0MjTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28172402"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28172402"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 05:08:10 -0700
X-CSE-ConnectionGUID: NyU+83L1TIG+d/TFC7lO8Q==
X-CSE-MsgGUID: pePk9I4fS3yWDCgNVJ+rYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="82663378"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Oct 2024 05:08:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0gLL-000Idh-28;
	Tue, 15 Oct 2024 12:08:03 +0000
Date: Tue, 15 Oct 2024 20:07:24 +0800
From: kernel test robot <lkp@intel.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: Re: [PATCH v4 08/28] media: iris: implement power management
Message-ID: <202410151938.Q3kFJFnO-lkp@intel.com>
References: <20241014-qcom-video-iris-v4-v4-8-c5eaa4e9ab9e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014-qcom-video-iris-v4-v4-8-c5eaa4e9ab9e@quicinc.com>

Hi Dikshita,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 67cefecf2a039b9ed0030b9213ceafcd45e6f9e3]

url:    https://github.com/intel-lab-lkp/linux/commits/Dikshita-Agarwal/dt-bindings-media-Add-video-support-for-QCOM-SM8550-SoC/20241014-171950
base:   67cefecf2a039b9ed0030b9213ceafcd45e6f9e3
patch link:    https://lore.kernel.org/r/20241014-qcom-video-iris-v4-v4-8-c5eaa4e9ab9e%40quicinc.com
patch subject: [PATCH v4 08/28] media: iris: implement power management
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241015/202410151938.Q3kFJFnO-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410151938.Q3kFJFnO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410151938.Q3kFJFnO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/qcom/iris/iris_probe.c:281:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     281 |         if (core->state != IRIS_CORE_INIT)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/iris/iris_probe.c:289:9: note: uninitialized use occurs here
     289 |         return ret;
         |                ^~~
   drivers/media/platform/qcom/iris/iris_probe.c:281:2: note: remove the 'if' if its condition is always false
     281 |         if (core->state != IRIS_CORE_INIT)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     282 |                 goto exit;
         |                 ~~~~~~~~~
   drivers/media/platform/qcom/iris/iris_probe.c:276:9: note: initialize the variable 'ret' to silence this warning
     276 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +281 drivers/media/platform/qcom/iris/iris_probe.c

   272	
   273	static int iris_pm_suspend(struct device *dev)
   274	{
   275		struct iris_core *core;
   276		int ret;
   277	
   278		core = dev_get_drvdata(dev);
   279	
   280		mutex_lock(&core->lock);
 > 281		if (core->state != IRIS_CORE_INIT)
   282			goto exit;
   283	
   284		ret = iris_hfi_pm_suspend(core);
   285	
   286	exit:
   287		mutex_unlock(&core->lock);
   288	
   289		return ret;
   290	}
   291	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

