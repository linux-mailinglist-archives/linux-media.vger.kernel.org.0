Return-Path: <linux-media+bounces-16247-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D89950F73
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 00:00:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C57A1B24CCE
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 21:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F23A21AAE30;
	Tue, 13 Aug 2024 21:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m8vm42l5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75151A7062;
	Tue, 13 Aug 2024 21:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723586387; cv=none; b=cxTLurdbiKOoWVK0qzqr0No7i/tmEJBjiCLOVCsEcNHc18Qw4L/WU11aNvwa+LQpbW8ebq33EbsitNb9ywhZ3hbHljQ6D/UdEkwn/pdiyHOkr1Ws/P73B+SOuyZtPGdsBi8QhMj3vQ80TMNM8vcMJOid+f8rzkIcH7YDg/NOYig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723586387; c=relaxed/simple;
	bh=smDF0r7mvpJmOBP+6nWfU55YrbMwWFuJ1tY+3DSe/84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTdXC+tLzhtHlyWS3lJ7xdB2LlkAjGVyFA+a2NlSOeX9x9iCPzpxO1mZCoxgM2qonQZqxzhIb5lGQdBh282RgZpyjz3tHPOUCs2v8efk4NPISsSK1SF7T9eGRyNdSoHDQHpunZuwZRAmMrGTvgr1TBn2StKnk9ULXHpng4O36rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m8vm42l5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723586386; x=1755122386;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=smDF0r7mvpJmOBP+6nWfU55YrbMwWFuJ1tY+3DSe/84=;
  b=m8vm42l5ddhRTLPa9UUzhGCtYZjYC/5haVGXggF1h1gr8Tk++gwPDQfv
   gsYu28GRARuVSqXOFZ8ao/BZJHrBX98QvKzV09OqP/jS++CTReBG0hrrl
   7HVNh3G4faKGYI3sc9qG2DpOdN3xDNLSuSp5mPgg0CaFpxiZRKhDG1ZtB
   l6F/zoImg1XiF0NdEaeKlINpoEMeuXHdhhqgZKwg1OmKNKo0LXTmFOOAk
   g2CM2DqrDS2/iHCdx5HMAdbE/vzjkj6YGS6ucDewmpO6ZSMbH/ODwkFmd
   GJSOWWFzZfmZLh8c8g9dzX4VyHkJ6VsgR2W15dKTcHpp5/XZYcTTruDXd
   Q==;
X-CSE-ConnectionGUID: kzC8W+ssTBu1VdBDr78HOg==
X-CSE-MsgGUID: LUJ6TVsgRfamhawVT2cuIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="33185787"
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; 
   d="scan'208";a="33185787"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 14:59:45 -0700
X-CSE-ConnectionGUID: czxnPOqVQaaAwqDB554ucw==
X-CSE-MsgGUID: ho2IFztlTnWPog2fiZlSQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; 
   d="scan'208";a="58737265"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Aug 2024 14:59:40 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdzYH-0000kA-2n;
	Tue, 13 Aug 2024 21:59:37 +0000
Date: Wed, 14 Aug 2024 05:59:05 +0800
From: kernel test robot <lkp@intel.com>
To: Hui-Ping Chen <hpchen0nvt@gmail.com>, miquel.raynal@bootlin.com,
	richard@nod.at, vigneshr@ti.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, sumit.semwal@linaro.org,
	christian.koenig@amd.com, esben@geanix.com
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	Hui-Ping Chen <hpchen0nvt@gmail.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: nuvoton: add new driver for the
 Nuvoton MA35 SoC
Message-ID: <202408140515.pbHkvxZD-lkp@intel.com>
References: <20240812030045.20831-3-hpchen0nvt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812030045.20831-3-hpchen0nvt@gmail.com>

Hi Hui-Ping,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mtd/nand/next]
[also build test WARNING on linus/master v6.11-rc3 next-20240813]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hui-Ping-Chen/dt-bindings-mtd-nuvoton-ma35d1-nand-add-new-bindings/20240812-110259
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/20240812030045.20831-3-hpchen0nvt%40gmail.com
patch subject: [PATCH 2/2] mtd: rawnand: nuvoton: add new driver for the Nuvoton MA35 SoC
config: arc-randconfig-r133-20240813 (https://download.01.org/0day-ci/archive/20240814/202408140515.pbHkvxZD-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240814/202408140515.pbHkvxZD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408140515.pbHkvxZD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:119:3: sparse: sparse: symbol 'E_BCHALGORITHM' was not declared. Should it be static?
>> drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:333:28: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:348:39: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:746:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char *register ptr @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:746:41: sparse:     expected char *register ptr
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:746:41: sparse:     got void [noderef] __iomem *
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:760:18: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:774:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char *ptr @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:774:32: sparse:     expected char *ptr
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:774:32: sparse:     got void [noderef] __iomem *
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:813:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char *ptr @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:813:32: sparse:     expected char *ptr
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:813:32: sparse:     got void [noderef] __iomem *
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char *register ptr @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse:     expected char *register ptr
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse:     got void [noderef] __iomem *
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char *register ptr @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse:     expected char *register ptr
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse:     got void [noderef] __iomem *
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char *register ptr @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse:     expected char *register ptr
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse:     got void [noderef] __iomem *
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char *register ptr @@     got void [noderef] __iomem * @@
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse:     expected char *register ptr
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:516:49: sparse:     got void [noderef] __iomem *

vim +/E_BCHALGORITHM +119 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c

   111	
   112	/* BCH algorithm related constants and variables */
   113	enum {
   114		eBCH_NONE = 0,
   115		eBCH_T8,
   116		eBCH_T12,
   117		eBCH_T24,
   118		eBCH_CNT
 > 119	} E_BCHALGORITHM;
   120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

