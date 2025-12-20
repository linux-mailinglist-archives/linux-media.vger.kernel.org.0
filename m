Return-Path: <linux-media+bounces-49244-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A221CD3452
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 18:15:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 678C43013EE0
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 17:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7113826CE2B;
	Sat, 20 Dec 2025 17:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S8phQJ1J"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2ADA19B5A3;
	Sat, 20 Dec 2025 17:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766250936; cv=none; b=HONAN+5k9tbxe9XYfYIUjDC629T1vwlFxlmuBv47Y5DMtdju1lyNx/2qpZf0gxtndsMjV/wNizPNYb7fPpPRILnPxp5yFYhlek8F7NaBL+NUbipQXMk6zsbp179bUcsnWkKA7/NawGjzMhC8PXBCKRsN7adVolNbH7yItAM2Udg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766250936; c=relaxed/simple;
	bh=Hcqx9K9e2DdZM+fc4kG1hUDJm+AVPCZc+SF3IRp/b7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hWcrR9pxiSbK3aP5LXgO55IvZVBzgeJseIfJVzZMVmqG82tyE3ryN3bac9U1OWOFlUUqLISikcj0xVFqlykEJD7TrjnogHaMOw3EWnCm3yrNFTpQJu3B3Tu72SnF2nhQxvlIOUuSH9841MzWIK+KWEum3MI60vilk+M1seVGyQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S8phQJ1J; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766250935; x=1797786935;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hcqx9K9e2DdZM+fc4kG1hUDJm+AVPCZc+SF3IRp/b7A=;
  b=S8phQJ1JVVKq1xaksOH/tKV2tsSO/+vETjCCmZBLGdFae+MnrWF2/EoV
   6EdowpKCX4i+KrgK68Sv9wjaeZdynZgH0MX7MuNOQ5/WDS2GEymwq2+/x
   LZ81N27FirK8mVsLaxJq+GGNyWqLMGTNbQWWeQco1IYO4cq170R4NRipD
   +llU5z3E7c3Zv7HlI9fd7AcDq+B06oiqXzgm0fep6rVba8COMcWMCamr8
   8QmVDSYaKZoUQMBOAHETeI7q1AHJP70S9TCz1NKI4BGFmTsuDn1+7MxwN
   oo3SrtZ2kv0mRzlJJaGohS84ayMoARRWdKEjc7ai3XsPr8PcrxROquf0t
   A==;
X-CSE-ConnectionGUID: zSAf1TxTRPK0epPO6FoLjg==
X-CSE-MsgGUID: vre2GazjRKWShyHJHCdgPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="67931018"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="67931018"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 09:15:34 -0800
X-CSE-ConnectionGUID: xj9DdeaKSq6vz1gN+HADYg==
X-CSE-MsgGUID: upGwtnYiSQCeULUBwleOSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199046442"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Dec 2025 09:15:30 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX0YB-000000004vl-3lXj;
	Sat, 20 Dec 2025 17:15:27 +0000
Date: Sun, 21 Dec 2025 01:15:12 +0800
From: kernel test robot <lkp@intel.com>
To: Alain Volmat <alain.volmat@foss.st.com>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH 01/12] media: stm32: dcmi: Switch from __maybe_unused to
 pm_sleep_ptr()
Message-ID: <202512210044.xNNW6QJZ-lkp@intel.com>
References: <20251218-stm32-dcmi-dma-chaining-v1-1-39948ca6cbf6@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-stm32-dcmi-dma-chaining-v1-1-39948ca6cbf6@foss.st.com>

Hi Alain,

kernel test robot noticed the following build warnings:

[auto build test WARNING on atorgue-stm32/stm32-next]
[also build test WARNING on robh/for-next linus/master v6.19-rc1 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alain-Volmat/media-stm32-dcmi-Switch-from-__maybe_unused-to-pm_sleep_ptr/20251219-024836
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
patch link:    https://lore.kernel.org/r/20251218-stm32-dcmi-dma-chaining-v1-1-39948ca6cbf6%40foss.st.com
patch subject: [PATCH 01/12] media: stm32: dcmi: Switch from __maybe_unused to pm_sleep_ptr()
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20251221/202512210044.xNNW6QJZ-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210044.xNNW6QJZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210044.xNNW6QJZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/st/stm32/stm32-dcmi.c:2127:12: warning: 'dcmi_resume' defined but not used [-Wunused-function]
    2127 | static int dcmi_resume(struct device *dev)
         |            ^~~~~~~~~~~
>> drivers/media/platform/st/stm32/stm32-dcmi.c:2116:12: warning: 'dcmi_suspend' defined but not used [-Wunused-function]
    2116 | static int dcmi_suspend(struct device *dev)
         |            ^~~~~~~~~~~~


vim +/dcmi_resume +2127 drivers/media/platform/st/stm32/stm32-dcmi.c

  2115	
> 2116	static int dcmi_suspend(struct device *dev)
  2117	{
  2118		/* disable clock */
  2119		pm_runtime_force_suspend(dev);
  2120	
  2121		/* change pinctrl state */
  2122		pinctrl_pm_select_sleep_state(dev);
  2123	
  2124		return 0;
  2125	}
  2126	
> 2127	static int dcmi_resume(struct device *dev)
  2128	{
  2129		/* restore pinctl default state */
  2130		pinctrl_pm_select_default_state(dev);
  2131	
  2132		/* clock enable */
  2133		pm_runtime_force_resume(dev);
  2134	
  2135		return 0;
  2136	}
  2137	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

