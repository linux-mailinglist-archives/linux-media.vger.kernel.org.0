Return-Path: <linux-media+bounces-35168-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC94DADEA9A
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 13:46:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2B49401023
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 11:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC2232C3247;
	Wed, 18 Jun 2025 11:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fr3kPzqg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899F22C08B5
	for <linux-media@vger.kernel.org>; Wed, 18 Jun 2025 11:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750246903; cv=none; b=Tg2nnTV8JztF3XUzucsxZ4t/pneH5z1YlBLcLguAN2ln+XkyQXa1i4xQ2NQSNf5PnDA0hBMEwqVaCe+OcjitWMJP8zghzfOK29N2Nh3DyrY/TYpEQ32MZ+fbrH/amIPnkjhz5AJaUOsMhvOUyoUXgoEkHhUWFcoqVZ+skyW7QXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750246903; c=relaxed/simple;
	bh=70k793h1xj1Z10eMRbjw8p2WjggxPF42IadHO2XETf4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l/H5krnUCjW9mEAyM0VjKQ0/q5PL2UewSFS57cxJ0tBuLeN0IdH7fG3ovNfrG/XViGBhyXQIYdusdp6iYe9FBUMrsndGyyh8xhX9bBY/vgLHVQcHR84WnesEZfEknkemDpZb2uJpSj6orlaRhah/9nkHScmHl8CfHpcJ+FfLeaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fr3kPzqg; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750246899; x=1781782899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=70k793h1xj1Z10eMRbjw8p2WjggxPF42IadHO2XETf4=;
  b=fr3kPzqg3/KdGuDtDHyD5zeBmMq4wSKun/Fh3YDI1tqAWitOZeBno6B7
   zplzeJYhZeS9mafogzxLcKkjYQxq25EG+GUw9oUH/RqezhW2cAQvAns7s
   4w0cnUDlxl05WTyFLD3manbqZvqH6V9xKZP41bNzFoklOT1QMP5itP0Yk
   RpUF+dsocl0GEVC0TGBBA/j3mDO+eki7MlK+/L5Wbwwb3aLWu5T2KrgfJ
   9yjW75Ugk6WZz9jVsHbbYOkij6eez7LEGTCyKU+m4jkArmNS0Z+9/qW36
   Fv/UoT0pHCvNtFLGVn1IPCXSlGaNjhpKRITndpocE5NlKAydqotRwIE7o
   w==;
X-CSE-ConnectionGUID: 3+XJxKDzTGmukHorLKo1Zw==
X-CSE-MsgGUID: NzjEM+V8S4izaSQtY03hxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63066695"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="63066695"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 04:41:39 -0700
X-CSE-ConnectionGUID: p9LksQx3QmGxf5wTJziFQw==
X-CSE-MsgGUID: 6JVnwYxNSbGPkonTL1mj7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="153439025"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Jun 2025 04:41:37 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRrAc-000Jiu-3C;
	Wed, 18 Jun 2025 11:41:34 +0000
Date: Wed, 18 Jun 2025 19:41:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [linuxtv-media-pending:next 41/41]
 drivers/media/platform/renesas/vsp1/vsp1_vspx.c: warning: EXPORT_SYMBOL() is
 used, but #include <linux/export.h> is missing
Message-ID: <202506181950.r9PRdV59-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.linuxtv.org/media-ci/media-pending.git next
head:   d06c1a9f348d22478c6bc5684f9c990e15ada1e9
commit: d06c1a9f348d22478c6bc5684f9c990e15ada1e9 [41/41] media: vsp1: Add VSPX support
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20250618/202506181950.r9PRdV59-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506181950.r9PRdV59-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506181950.r9PRdV59-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
>> drivers/media/platform/renesas/vsp1/vsp1_vspx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
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
   drivers/memory/fsl_ifc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/memory/jz4780-nemc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/memory/omap-gpmc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/memory/renesas-rpc-if.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/memory/ti-aemif.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/memory/ti-emif-pm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/memstick/core/memstick.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/message/fusion/mptbase.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/message/fusion/mptscsih.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/88pm80x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/88pm860x-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/88pm860x-i2c.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/adp5520.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/altera-sysmgr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/arizona-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/arizona-irq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/atc260x-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/atmel-smc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/axp20x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/cgbc-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

