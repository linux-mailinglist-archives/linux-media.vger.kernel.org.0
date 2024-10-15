Return-Path: <linux-media+bounces-19665-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6313099E598
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 13:27:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10AE71F24B2F
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 11:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D4FF174ED0;
	Tue, 15 Oct 2024 11:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gF4Jiud4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4151D89F8;
	Tue, 15 Oct 2024 11:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728991623; cv=none; b=cUR6siFRF8TsBT7Op1Resi0VICNxglsZ8xex8knXmIpKBeY3un44Cr9cglpYnLVShYE/mF4pR7u+yUhFeAgbVd+WnSHirvU4bOxIe4cVcc7pzaBpV2gOkTJCG6IOqw7lXV4uAG1hOe6uErgBUzQ84ezc26ILwhyxAPLDzcBCV9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728991623; c=relaxed/simple;
	bh=CU5Ivy8Z00Cv051dEKbRz2VOtggkLM1An6ezy/8TD6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KWYFPdnvKGyqlSXjfh5/AT4y9ZVcUi+mx9bCrtkVpnvOvFSn/ScMGw39btM41GOy7nEBfIJdYPbxnJjdR7UXlRV8evcMT4vaaaP9YA9xJZaZjD5H/lBOoZ6dBrnrYbkH51r/gquTiAX1f4Mwp3jzHR3+U72Nhwx19HYndQCiM14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gF4Jiud4; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728991620; x=1760527620;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CU5Ivy8Z00Cv051dEKbRz2VOtggkLM1An6ezy/8TD6I=;
  b=gF4Jiud4EQ0nGn6RHyKTMukoiLfxymkgNV3AeP0bO0FqMvvRCH8F60V2
   uUqo/yeAZqsB9FBt+D3EJTfpqq3gOZ6R9hgKahKkgSGk+FU1Hg0tDSIaz
   bHcO33iBckEfscz1QvGrYOhTI5Q4EE8uywyaPG7q+SYqcEMIaUcE07CnL
   Pzyd3l3kf2FYC/dJewKgRAe9Afc3xBCfScvUcdeBtI5NzpQXnbVIbm4Dt
   ufOWpQktQ7d6GfMZhY4OmpHjaC4lA+fERRls0EUqir8cwMi7G58AF2tmn
   85tMpIUoprxveCgP2VZzyE9jXwfCUReQmJYyxWxgHBW3Dhr3C8w9vQ4tw
   w==;
X-CSE-ConnectionGUID: pB1IadCmQimfQZ/ElAHqTQ==
X-CSE-MsgGUID: CD1fs7D+Ti+wnhZ1yheFJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39768517"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="39768517"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 04:26:54 -0700
X-CSE-ConnectionGUID: SVYhPXiBT5SLyftBMZcMKA==
X-CSE-MsgGUID: ncKQkyxCRaeSGbYGnAeclg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="108592278"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Oct 2024 04:26:49 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0fhP-000I2R-08;
	Tue, 15 Oct 2024 11:26:47 +0000
Date: Tue, 15 Oct 2024 19:25:56 +0800
From: kernel test robot <lkp@intel.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: Re: [PATCH v4 08/28] media: iris: implement power management
Message-ID: <202410151929.iJzD1Wez-lkp@intel.com>
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
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241015/202410151929.iJzD1Wez-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410151929.iJzD1Wez-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410151929.iJzD1Wez-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/qcom/iris/iris_probe.c:292:12: warning: 'iris_pm_resume' defined but not used [-Wunused-function]
     292 | static int iris_pm_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~
>> drivers/media/platform/qcom/iris/iris_probe.c:273:12: warning: 'iris_pm_suspend' defined but not used [-Wunused-function]
     273 | static int iris_pm_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~


vim +/iris_pm_resume +292 drivers/media/platform/qcom/iris/iris_probe.c

   272	
 > 273	static int iris_pm_suspend(struct device *dev)
   274	{
   275		struct iris_core *core;
   276		int ret;
   277	
   278		core = dev_get_drvdata(dev);
   279	
   280		mutex_lock(&core->lock);
   281		if (core->state != IRIS_CORE_INIT)
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
 > 292	static int iris_pm_resume(struct device *dev)
   293	{
   294		struct iris_core *core;
   295		int ret = 0;
   296	
   297		core = dev_get_drvdata(dev);
   298	
   299		mutex_lock(&core->lock);
   300		if (core->state != IRIS_CORE_INIT)
   301			goto exit;
   302	
   303		ret = iris_hfi_pm_resume(core);
   304		pm_runtime_mark_last_busy(core->dev);
   305	
   306	exit:
   307		mutex_unlock(&core->lock);
   308	
   309		return ret;
   310	}
   311	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

