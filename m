Return-Path: <linux-media+bounces-19776-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8229A1A85
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 08:09:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 69153B25347
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 06:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B472717C9B6;
	Thu, 17 Oct 2024 06:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gkSuFnwq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354281791ED;
	Thu, 17 Oct 2024 06:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729145347; cv=none; b=HV1CrHVHO9CGqZ9XZUZMJrQfMUSNRlIT5b1kBksseQ+kXabFrgo5r5yveWsd73CiiC60laptbTuRLkb60QH83LCdxuxxBDfcAc5q4C71ixN8SJri7HZBtNfhm1G+v72m1uX4jzQXpyKCmvcHX7byWZ6YSHWmfcfWqAWeNaWbz9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729145347; c=relaxed/simple;
	bh=zzviSHXex8TPLDdrZJqN5fZayjpTt4dWNyEM/M8atPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YQIHX2A5WcZv5n5LFQaryJuuFuD2ucJw4wDBdnvQ8wPYlOO1pSH4rYhx88NsfDX9Il7pVjdf9jfiJWjVnuREa9d9Zoi/DhgNpj8UPja8OEh2ZbQli0FBuAJo8UiX1IJTTo90VAr/tTJuKJjJy8Cno/QN7PpqRTgw3D0WvcjOm7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gkSuFnwq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729145344; x=1760681344;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zzviSHXex8TPLDdrZJqN5fZayjpTt4dWNyEM/M8atPo=;
  b=gkSuFnwq4TUUdvmlJ73Fzuif3pEngJO+UlJMq1SUzAen86tCJrOPLwFQ
   HqUR+iF4FUvlUvGGHgmCPrsZWRAbQHztAkbxC4LTIL2JttFFsH6vE26jx
   tnfh8fmylKXUdQpcZqukaBi4YcB9NMRjDjaqI3H+I1Ei/Pqf5LYIzPb58
   2voTL8EyCX5WlluShDlIJ/Ip1/zyvAAH0d1mayGi3EoNtYjG1LXDVhOkr
   eXOd1RcD7fYQsmrzoWIPCjmyWFuF50Ua5P9gn62kg7bKFbQp9PZ6K1bEU
   7CYJRoEi5a4JELObz3paxVSuRWZXrCzLq1fHiNsxYA+716iJrrRCxr48H
   Q==;
X-CSE-ConnectionGUID: /poa9g1nTYKygCWngMrj/A==
X-CSE-MsgGUID: hngsHGvETIapa4ejZPSIcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28405746"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28405746"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 23:09:03 -0700
X-CSE-ConnectionGUID: ZzgtjC7GShOjBNwP2TOfKA==
X-CSE-MsgGUID: +iO2538wT/ymUYtHNPEhZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="83275367"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Oct 2024 23:08:59 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1Jgu-000LnB-24;
	Thu, 17 Oct 2024 06:08:56 +0000
Date: Thu, 17 Oct 2024 14:08:00 +0800
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
Message-ID: <202410171314.IZGQN4kN-lkp@intel.com>
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
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20241017/202410171314.IZGQN4kN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241017/202410171314.IZGQN4kN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410171314.IZGQN4kN-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/media/platform/qcom/iris/iris_vpu3.o: in function `iris_vpu3_calculate_frequency':
>> iris_vpu3.c:(.text.iris_vpu3_calculate_frequency+0x114): undefined reference to `__aeabi_ldivmod'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

