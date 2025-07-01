Return-Path: <linux-media+bounces-36373-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4823AAEED25
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 06:00:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 319DF189FE0D
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 04:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FF871F2361;
	Tue,  1 Jul 2025 04:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iHnXND+u"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5BC450F2;
	Tue,  1 Jul 2025 04:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751342436; cv=none; b=s4LOwNd1uVz2QVE+b7JSenIGmOfEoQRHqee4EWBceVz8wjGElZEO1YkUW1YJOo9a0EorUBDax1txEhmO22AUTumJVDe+Mepjn+6FNrtuEi+naZvI/UM1oHzyQ7xNFnKPPmL+7O7qC2b5Quy7seCdb2zcbGDAwnPFIxuE/io1EPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751342436; c=relaxed/simple;
	bh=nOak2UHKJmAhkObOG0X7UeCC3tM0q7hmh+oEl7uimQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VyaljuDSFzgRc3sGscZYYYwbVz/Gfs8JK0IAotmtNSS0+4Ynv3hROCvpc9BW5NHhOsNL4byW5ZWQ907ia0Q3pTPHc9UeDbJZLueoe4njFj/5zYrHe1Uw3o97d73uaqv098dU2RiFjP8yXUN5PbfVRXARh4u+t1LM49OeyHzLU/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iHnXND+u; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751342434; x=1782878434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nOak2UHKJmAhkObOG0X7UeCC3tM0q7hmh+oEl7uimQc=;
  b=iHnXND+uw+RXkIfgxWSLR6OFNpmRxMfPTwKqOLyi7YpXlE2LDBWfyRE5
   cId7pfh1NbJDNx9bSfM/qzLP+TNDDrNDWOESrfgu15zIUNjl2VOJp+CV5
   YDGtfTewww+9qdzKEPBQvgFVV+GOeBCdia97ppn41JoIi8Ky1d7bvcFfH
   lucHscQMgwuSbFeYXIR24LpUBv5GoBygz0btbDMZ7QavW03DOmTmBHe5s
   rz1EeOQ91ejgPlw7EmuOEnTZbazVnyX+kp5/RmIHlqhln8hZEsWR3sGHV
   5CHEyX+y6fE8E5MWELSx1WnTt0Nf3DCIVAuvplyjOwI4zlEdVblR9BLOb
   A==;
X-CSE-ConnectionGUID: DOJUgQJETjeui478+7JmqQ==
X-CSE-MsgGUID: YW8dSbNYToqSq9rrPyjcZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64940208"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="64940208"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 21:00:33 -0700
X-CSE-ConnectionGUID: wSbanzIsThmljFOiDODUgQ==
X-CSE-MsgGUID: 9Vqnf2c6Qw6AtkuwUEzzmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153266860"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Jun 2025 21:00:29 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWSAV-000Zhk-1g;
	Tue, 01 Jul 2025 04:00:27 +0000
Date: Tue, 1 Jul 2025 11:59:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Devarsh Thakkar <devarsht@ti.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>,
	Vaishnav Achath <vaishnav.a@ti.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	linux-kernel@vger.kernel.org,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Subject: Re: [PATCH v3 5/6] media: cadence: cdns-csi2rx: Support multiple
 pixels per clock cycle
Message-ID: <202507011113.5XtoEqbV-lkp@intel.com>
References: <20250626-probe_fixes-v3-5-83e735ae466e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626-probe_fixes-v3-5-83e735ae466e@ideasonboard.com>

Hi Jai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 19272b37aa4f83ca52bdf9c16d5d81bdd1354494]

url:    https://github.com/intel-lab-lkp/linux/commits/Jai-Luthra/media-ti-j721e-csi2rx-Use-devm_of_platform_populate/20250627-091235
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20250626-probe_fixes-v3-5-83e735ae466e%40ideasonboard.com
patch subject: [PATCH v3 5/6] media: cadence: cdns-csi2rx: Support multiple pixels per clock cycle
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250701/202507011113.5XtoEqbV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507011113.5XtoEqbV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507011113.5XtoEqbV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/dvb-frontends/m88ds3103.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/m88rs2000.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/mb86a16.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/mb86a20s.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/mt312.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/mt352.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/mxl5xx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/nxt200x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/nxt6000.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/or51132.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/or51211.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/s5h1409.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/s5h1411.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/s5h1420.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/s5h1432.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/s921.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/si21xx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/sp887x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stb0899_drv.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stb6000.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stb6100.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stv0288.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stv0297.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stv0299.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stv0367.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stv0900_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stv090x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stv0910.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stv6110.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stv6110x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/stv6111.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/tda10021.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/tda10023.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/tda10048.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/tda1004x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/tda10086.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/tda18271c2dd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/tda665x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/tda8083.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/tda8261.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/tda826x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/ts2020.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/tua6100.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/ves1820.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/ves1x93.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/zd1301_demod.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/zl10036.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/zl10039.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/dvb-frontends/zl10353.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/i2c/aptina-pll.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/i2c/ccs-pll.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/i2c/max9271.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/mc/mc-dev-allocator.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/mc/mc-entity.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/mc/mc-request.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/b2c2/flexcop-dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/bt8xx/bt878.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/bt8xx/bttv-gpio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/bt8xx/bttv-if.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/bt8xx/dst.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/bt8xx/dst_ca.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx18/cx18-driver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx18/cx18-fileops.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx18/cx18-streams.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx23885/altera-ci.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx25821/cx25821-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx25821/cx25821-gpio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx88/cx88-cards.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx88/cx88-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx88/cx88-dsp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx88/cx88-input.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx88/cx88-mpeg.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx88/cx88-tvaudio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx88/cx88-video.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/cx88/cx88-vp3054-i2c.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/ddbridge/ddbridge-dummy-fe.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/intel/ipu-bridge.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/intel/ipu6/ipu6-buttress.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/intel/ipu6/ipu6-cpd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/intel/ipu6/ipu6-dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/intel/ipu6/ipu6-fw-com.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/intel/ipu6/ipu6-mmu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/intel/ipu6/ipu6.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/ivtv/ivtv-driver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/ivtv/ivtv-fileops.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/ivtv/ivtv-streams.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/mantis/mantis_ca.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/mantis/mantis_dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/mantis/mantis_dvb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/mantis/mantis_i2c.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/mantis/mantis_input.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/mantis/mantis_ioc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/mantis/mantis_pci.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/mantis/mantis_uart.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/saa7134/saa7134-cards.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/saa7134/saa7134-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/saa7134/saa7134-ts.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/saa7134/saa7134-tvaudio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/saa7134/saa7134-video.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/pci/ttpci/budget-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> drivers/media/platform/cadence/cdns-csi2rx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/chips-media/coda/imx-vdoa.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/marvell/mcam-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/mediatek/mdp/mtk_mdp_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_intr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_pm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/mediatek/vpu/mtk_vpu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/microchip/microchip-isc-base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/microchip/microchip-isc-clk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/microchip/microchip-isc-scaler.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/qcom/venus/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/qcom/venus/helpers.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/qcom/venus/hfi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/renesas/rcar-fcp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/renesas/vsp1/vsp1_drm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/samsung/exynos4-is/common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/ti/davinci/vpif.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/ti/omap/omap_voutlib.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/ti/vpe/csc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/ti/vpe/sc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/ti/vpe/vpdma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/platform/xilinx/xilinx-vtc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/radio/radio-isa.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/radio/radio-tea5777.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/radio/si470x/radio-si470x-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/radio/tea575x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/rc/lirc_dev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/rc/rc-main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/fc0011.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/fc0012.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/fc0013.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/max2165.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/mc44s803.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/mt2060.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/mt2063.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/mt20xx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/mt2131.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/mt2266.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/mxl5005s.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/mxl5007t.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/qt1010.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/r820t.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/tda18218.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/tda18271-fe.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/tda827x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/tda8290.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/tda9887.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/tea5761.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/tea5767.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/tuner-simple.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/tuner-types.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/xc2028.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/xc4000.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/xc5000.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/cx231xx/cx231xx-avcore.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/cx231xx/cx231xx-cards.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/cx231xx/cx231xx-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/cx231xx/cx231xx-i2c.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/cx231xx/cx231xx-vbi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/dvb-usb-v2/dvb_usb_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/dvb-usb-v2/dvb_usb_urb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/dvb-usb-v2/mxl111sf-demod.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/dvb-usb-v2/mxl111sf-tuner.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/dvb-usb/af9005-remote.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/dvb-usb/dibusb-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/dvb-usb/dibusb-mc-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/dvb-usb/dvb-usb-firmware.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/dvb-usb/dvb-usb-init.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/dvb-usb/dvb-usb-remote.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/dvb-usb/dvb-usb-urb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/em28xx/em28xx-camera.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/em28xx/em28xx-cards.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/em28xx/em28xx-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/go7007/go7007-driver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/go7007/snd-go7007.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/gspca/autogain_functions.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/gspca/gspca.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/ttusb-dec/ttusbdecfe.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-async.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-cci.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-compat-ioctl32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-dev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-device.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-dv-timings.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-flash-led-class.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-fwnode.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-h264.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-i2c.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-ioctl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-jpeg.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-mc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-mem2mem.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-spi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-vp9.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

