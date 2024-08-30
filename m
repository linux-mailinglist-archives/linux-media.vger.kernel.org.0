Return-Path: <linux-media+bounces-17181-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DFD9653F5
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 02:21:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 421CC1C22104
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 00:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D61933C5;
	Fri, 30 Aug 2024 00:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="apqD0HMz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4600520EB;
	Fri, 30 Aug 2024 00:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724977307; cv=none; b=k1748axKpHZ56CWnWB/9rd0zI8xmTBETwriRW29UJzu3B8FEcsGdk2D1AGXa5l4SusUHuGuuYKoW+vsyqjyac1c5mWSsqRx23pn/ECYAlS7no6oHNvTFvlqmZl+HXRvegowuT+e+WKrBxIpIOIMrnKPGb106nSPq3x8Yn5xwX5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724977307; c=relaxed/simple;
	bh=w+yKiDpRWvKzQEAGuCGuIqf/9HVfNpoSKRtblk0n09A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDD+b0frqjBYyWjPcwHrQJxU80rr3/hVF6RAM8rdZhG0HzsY5AWFCexlmft+iY5Ztea5LAbUcQTimgeyLQXAvIx78TilHkZmHMAwflBcWuPTlmFPIAsf9JWmy35A3oKKGqssOEZ3FU7EBYHi/fcZ4uhgKq0zp0DDu3Z0CpBP5YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=apqD0HMz; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724977307; x=1756513307;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w+yKiDpRWvKzQEAGuCGuIqf/9HVfNpoSKRtblk0n09A=;
  b=apqD0HMzscltWkdz3KAwSAHfGYhQDfmsOfjuJbtmbrmQWQemZZmw8gG8
   hqSKiNf1m/pcH19DB0dHy9bUgUU8uqSPFkP7d3yy+nO/qXGwnyD2cQE3P
   gWGql2pRa/bAI5c872lUjR/0ECb+0GSzhjUZZZS57vg5CGm9NtDt7a6/l
   XAmpebtpkrd1aZC4qcZqMdMSps/GjollYrqAfGuBjt6T4ZblUG5Tb9bpg
   OIu5ApEndGWYSJ6LhzKHQCkNIH7IvQeBfAzXcTN0fAEitXcziiQd4PD8J
   bmRTqX7FmVYR+WjCykLLvro15hSBEBVe4bCHbTf6dePMn2onQjt0qdUr8
   Q==;
X-CSE-ConnectionGUID: A33CmxBNRWmM/BSDUw6vIw==
X-CSE-MsgGUID: ZyUGiDM4Q2Wahf4Fq4NFOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23407090"
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; 
   d="scan'208";a="23407090"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 17:21:46 -0700
X-CSE-ConnectionGUID: JuAvQF4QREifpbm53DR3bQ==
X-CSE-MsgGUID: 3gWQbgCWSwGNsijAXnO5OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; 
   d="scan'208";a="94559556"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Aug 2024 17:21:42 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjpOW-0000pS-0E;
	Fri, 30 Aug 2024 00:21:40 +0000
Date: Fri, 30 Aug 2024 08:21:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jammy Huang <jammy_huang@aspeedtech.com>, robh@kernel.org,
	conor+dt@kernel.org, eajames@linux.ibm.com, mchehab@kernel.org,
	joel@jms.id.au, andrew@aj.id.au, hverkuil@xs4all.nl,
	pmenzel@molgen.mpg.de, krzk+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: media: convert aspeed-video.txt to
 dt-schema
Message-ID: <202408300813.2RN73Kn4-lkp@intel.com>
References: <20240829064508.3706672-2-jammy_huang@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829064508.3706672-2-jammy_huang@aspeedtech.com>

Hi Jammy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 47ac09b91befbb6a235ab620c32af719f8208399]

url:    https://github.com/intel-lab-lkp/linux/commits/Jammy-Huang/dt-bindings-media-convert-aspeed-video-txt-to-dt-schema/20240829-144721
base:   47ac09b91befbb6a235ab620c32af719f8208399
patch link:    https://lore.kernel.org/r/20240829064508.3706672-2-jammy_huang%40aspeedtech.com
patch subject: [PATCH v6 1/2] dt-bindings: media: convert aspeed-video.txt to dt-schema
reproduce: (https://download.01.org/0day-ci/archive/20240830/202408300813.2RN73Kn4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408300813.2RN73Kn4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/aspeed-video.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/exynos/
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

