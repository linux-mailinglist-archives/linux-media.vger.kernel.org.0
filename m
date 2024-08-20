Return-Path: <linux-media+bounces-16509-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 650FE957CE0
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2024 07:48:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4AEEB2220E
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2024 05:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B81D714A0A7;
	Tue, 20 Aug 2024 05:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g7SBBy+j"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86927132103;
	Tue, 20 Aug 2024 05:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724132905; cv=none; b=X2z0QZ7/e3KM7m833YXg0E/x0yvnJNRB44fCJLOVF+nbi/kVwGye02ETmTHrL+orEMhab52L7roPJkoUeHltUZORdyvFMBldxb9kq1MuUvqsnpN2C1mFibawq1rbD1u++DEHjJvtSAm0hNkq5jv9wWDpCTZhbiwsnMwmQGDQF/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724132905; c=relaxed/simple;
	bh=kioHVavi4eJx3pXSFgQY5R+2SmG3W8PhoaqTGAwxUVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VHkzLx5AsfYZiuj2E6/Q0Ed6/MD6tXeiUvaShfR5PpsxwbOyaulU9Ov0CaUnlcXSqw3YY1Tunuk2vwF4BYIh4obKXv3qQax0qEqVgO//lDH6yFvri+f0hOcJS86zqOI6L0Ydvr9a7o7a7rkUoEq3uQhop+I3+o0Gr0BH4ktKBaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g7SBBy+j; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724132904; x=1755668904;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kioHVavi4eJx3pXSFgQY5R+2SmG3W8PhoaqTGAwxUVc=;
  b=g7SBBy+j5HXez4gH+7vGqNDCrjUv5fbv+9ujiyudAa8JIHoX762uM3bm
   +G333LsZ6B8UxgzXh7xWQujHvIIc3QsovUuuAtcPTnBAbaQRgfQxeJnvO
   Ot8pzeLZP3ff9dxjDVSXMfFMMQi9wtIz7zVV5O2o7+UuTeDE/Mp4o25SO
   9s/C8IGCM7qReaucYUBejU2eJ6GEaFoO1BpC3aZDRlrldCPyNsC82XLPE
   7w7PEj+SiO29bIbNJ0aoVdvpYS64go5bQi9TfcZOFINtyL/oMz3YmgaQI
   6+nHMZWpxXvKnEnA7CzX1ZUHNxc5zW8z9tMiS3aHKfcStMql5lNnfAB3A
   g==;
X-CSE-ConnectionGUID: gzeJs1AFR8mg03pQ/RKPLA==
X-CSE-MsgGUID: sKIhO3YiQVeerkTGaYdO2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="26162701"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="26162701"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 22:48:22 -0700
X-CSE-ConnectionGUID: PgarJjMXQLS1/fA8vVZ+Dg==
X-CSE-MsgGUID: ZOASBjw8SIibnKhxYvaaRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="60759314"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Aug 2024 22:48:18 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgHj5-0009lq-2t;
	Tue, 20 Aug 2024 05:48:15 +0000
Date: Tue, 20 Aug 2024 13:47:27 +0800
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
Subject: Re: [PATCH v2 2/2] mtd: rawnand: nuvoton: add new driver for the
 Nuvoton MA35 SoC
Message-ID: <202408201329.v0SoF3eS-lkp@intel.com>
References: <20240819092037.110260-3-hpchen0nvt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819092037.110260-3-hpchen0nvt@gmail.com>

Hi Hui-Ping,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mtd/nand/next]
[also build test WARNING on linus/master v6.11-rc4 next-20240820]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hui-Ping-Chen/dt-bindings-mtd-nuvoton-ma35d1-nand-add-new-bindings/20240819-172155
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/20240819092037.110260-3-hpchen0nvt%40gmail.com
patch subject: [PATCH v2 2/2] mtd: rawnand: nuvoton: add new driver for the Nuvoton MA35 SoC
config: parisc-randconfig-r123-20240820 (https://download.01.org/0day-ci/archive/20240820/202408201329.v0SoF3eS-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240820/202408201329.v0SoF3eS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408201329.v0SoF3eS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:231:20: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:736:20: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned char [usertype] *ptr @@     got unsigned char [noderef] [usertype] __iomem * @@
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:736:20: sparse:     expected unsigned char [usertype] *ptr
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:736:20: sparse:     got unsigned char [noderef] [usertype] __iomem *
>> drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:764:22: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char *ptr @@     got char [noderef] __iomem * @@
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:764:22: sparse:     expected char *ptr
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:764:22: sparse:     got char [noderef] __iomem *
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:803:22: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char *ptr @@     got char [noderef] __iomem * @@
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:803:22: sparse:     expected char *ptr
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:803:22: sparse:     got char [noderef] __iomem *
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:506:28: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned char [usertype] *ptr @@     got unsigned char [noderef] [usertype] __iomem * @@
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:506:28: sparse:     expected unsigned char [usertype] *ptr
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:506:28: sparse:     got unsigned char [noderef] [usertype] __iomem *
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:506:28: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned char [usertype] *ptr @@     got unsigned char [noderef] [usertype] __iomem * @@
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:506:28: sparse:     expected unsigned char [usertype] *ptr
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:506:28: sparse:     got unsigned char [noderef] [usertype] __iomem *
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:506:28: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned char [usertype] *ptr @@     got unsigned char [noderef] [usertype] __iomem * @@
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:506:28: sparse:     expected unsigned char [usertype] *ptr
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:506:28: sparse:     got unsigned char [noderef] [usertype] __iomem *
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:506:28: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned char [usertype] *ptr @@     got unsigned char [noderef] [usertype] __iomem * @@
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:506:28: sparse:     expected unsigned char [usertype] *ptr
   drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c:506:28: sparse:     got unsigned char [noderef] [usertype] __iomem *

vim +736 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c

   731	
   732	static int ma35_nand_write_page_hwecc(struct nand_chip *chip, const u8 *buf,
   733					      int oob_required, int page)
   734	{
   735		struct ma35_nand_info *nand = nand_get_controller_data(chip);
 > 736		u8 *ptr = (u8 __iomem *)(nand->regs + MA35_NFI_REG_NANDRA0);
   737		struct mtd_info *mtd = nand_to_mtd(chip);
   738		u8 *ecc_calc = chip->ecc.calc_buf;
   739	
   740		memset((void *)ptr, 0xFF, mtd->oobsize);
   741		memcpy((void *)ptr, (void *)chip->oob_poi, mtd->oobsize - chip->ecc.total);
   742	
   743		ma35_nand_command(chip, NAND_CMD_SEQIN, 0, page);
   744		ma35_nand_dma_transfer(chip, buf, mtd->writesize, 0x1);
   745		ma35_nand_command(chip, NAND_CMD_PAGEPROG, -1, -1);
   746		ma35_waitfunc(chip);
   747	
   748		/* Copy parity code in NANDRA to calc */
   749		memcpy((void *)ecc_calc,
   750			(void *)(ptr + (mtd->oobsize - chip->ecc.total)),
   751			chip->ecc.total);
   752	
   753		/* Copy parity code in calc to oob_poi */
   754		memcpy((void *)(chip->oob_poi + (mtd->oobsize - chip->ecc.total)),
   755			(void *)ecc_calc, chip->ecc.total);
   756	
   757		return 0;
   758	}
   759	
   760	static int ma35_nand_read_page_hwecc_oob_first(struct nand_chip *chip, u8 *buf,
   761							int oob_required, int page)
   762	{
   763		struct ma35_nand_info *nand = nand_get_controller_data(chip);
 > 764		char *ptr = (char __iomem *)(nand->regs + MA35_NFI_REG_NANDRA0);
   765		struct mtd_info *mtd = nand_to_mtd(chip);
   766	
   767		/* 1. read the OOB area  */
   768		ma35_nand_command(chip, NAND_CMD_READOOB, 0, page);
   769		ma35_nand_read_buf(chip, chip->oob_poi, mtd->oobsize);
   770	
   771		/* 2. copy OOB data to NANDRA for page read */
   772		memcpy((void *)ptr, (void *)chip->oob_poi, mtd->oobsize);
   773	
   774		if ((*(ptr+2) != 0) && (*(ptr+3) != 0))
   775			memset((void *)buf, 0xff, mtd->writesize);
   776		else {
   777			/* 3. read data from nand */
   778			ma35_nand_command(chip, NAND_CMD_READ0, 0, page);
   779			ma35_nand_dma_transfer(chip, buf, mtd->writesize, 0x0);
   780	
   781			/* 4. restore OOB data from SMRA */
   782			memcpy((void *)chip->oob_poi, (void *)ptr, mtd->oobsize);
   783		}
   784	
   785		return 0;
   786	}
   787	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

