Return-Path: <linux-media+bounces-19917-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC959A4D2B
	for <lists+linux-media@lfdr.de>; Sat, 19 Oct 2024 13:38:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB8911C21110
	for <lists+linux-media@lfdr.de>; Sat, 19 Oct 2024 11:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918E41E0493;
	Sat, 19 Oct 2024 11:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GY9QP4Y5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A0B1DFDB6;
	Sat, 19 Oct 2024 11:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729337917; cv=none; b=Z2mYt+InSHZ/WSALTwuY18OpyphdIwURd1NFvPVerVv/0m2SbzgJKMU6FlmqF8iMpn+IEZRdfkmoYNU8maOtKPc/r/AWmJipSSFbNOvPemcNtUAX3o2iWpTZlf/58/uQVPWNfVZN2BLd+GLab/KcjLwzfZfQ/53wI5gMuIv4TPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729337917; c=relaxed/simple;
	bh=marhkCyYZCh3NCtWnDi9k3n1MPLfEDhO9JL7aJPEMs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oWM76UhvieZ0QjK7tbG0mFZfMsstb3I2pKV+Yu1WOTrEt5siL33+6EAt5ltctQZ2Ayb4mhy4GU6RYYAAYJWW+cnUWPGBOpyw97Ym4IwLy+Eivd8N/5pN7+rnzdUiwrgxbjHmF8/CcnTMdG6qQy+VXgqBmneqfVU1bTUsvRB4hVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GY9QP4Y5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729337914; x=1760873914;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=marhkCyYZCh3NCtWnDi9k3n1MPLfEDhO9JL7aJPEMs8=;
  b=GY9QP4Y5Em1tMCniss+5kCeBuCOonwc7nJTc2FD84q6YgujiDiwUUbxp
   iUDbVgbyF7LbdkCLYD5I5qBSEPfy/Ds5b8NdYTS/XxkzMxDDu4m/wS4eW
   +YYpV01ppFM7LNVEGqrbICjlsBf5xez9MkxHfE4pRlFWx3m2RSeyzaCM+
   jyRK0C+OQ5hTzdDLYD+J/ctJWTurIFrrR/tk5eYYANkP3ckgNDLZqwcyx
   KTnaz6Q5Se0MjT7zViKNA4Dki7KSiitOtnZQl7vSuG/sL/nXQu7A4SIE7
   ty6IznXxmNxhec1s1TFCL+Z31Ij82vyYs8vqJiXUz4fRujtTjl6th7khf
   g==;
X-CSE-ConnectionGUID: 2S8yN2zwQ8aRhTZOKZdIeA==
X-CSE-MsgGUID: Av5koOjxT5qmlreOVZoGNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46328538"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="46328538"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 04:38:34 -0700
X-CSE-ConnectionGUID: jknId/GiSzil637xYRnm0A==
X-CSE-MsgGUID: IKV8DZGdRXu0KWTBqrP/2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="79067264"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 Oct 2024 04:38:31 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t27mu-000OwT-0m;
	Sat, 19 Oct 2024 11:38:28 +0000
Date: Sat, 19 Oct 2024 19:38:02 +0800
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
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Vedang Nagar <quic_vnagar@quicinc.com>
Subject: Re: [PATCH v4 25/28] media: iris: implement power scaling for vpu2
 and vpu3
Message-ID: <202410191943.XTP992Za-lkp@intel.com>
References: <20241014-qcom-video-iris-v4-v4-25-c5eaa4e9ab9e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014-qcom-video-iris-v4-v4-25-c5eaa4e9ab9e@quicinc.com>

Hi Dikshita,

kernel test robot noticed the following build errors:

[auto build test ERROR on 67cefecf2a039b9ed0030b9213ceafcd45e6f9e3]

url:    https://github.com/intel-lab-lkp/linux/commits/Dikshita-Agarwal/dt-bindings-media-Add-video-support-for-QCOM-SM8550-SoC/20241014-171950
base:   67cefecf2a039b9ed0030b9213ceafcd45e6f9e3
patch link:    https://lore.kernel.org/r/20241014-qcom-video-iris-v4-v4-25-c5eaa4e9ab9e%40quicinc.com
patch subject: [PATCH v4 25/28] media: iris: implement power scaling for vpu2 and vpu3
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20241019/202410191943.XTP992Za-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410191943.XTP992Za-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410191943.XTP992Za-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: drivers/media/platform/qcom/iris/iris_vpu3.o: in function `iris_vpu3_calculate_frequency':
>> .tmp_gl_iris_vpu3.o:(.text+0x52c): undefined reference to `__divdi3'
>> microblaze-linux-ld: .tmp_gl_iris_vpu3.o:(.text+0x568): undefined reference to `__udivdi3'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

