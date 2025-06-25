Return-Path: <linux-media+bounces-35866-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 814F1AE8367
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 14:57:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5EA537B626F
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 12:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517102620FC;
	Wed, 25 Jun 2025 12:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xf48z7zJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A8E25B315
	for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 12:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750856142; cv=none; b=UY4jvZgNqMPZ3vQcilomQz1REp1wn4aInbMmmbdNMkuH7G++l3HdKqAp5heUE3SdW37yLj1Au0JNKPsaofNud0amG1+tLVcQ9Iid+2/1tNcYgzXpz6w+eGAmFNYqstT3iYvkOzKc0U6Kxl3xOf51B0E33BkiW5lnxRbzMNfaSIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750856142; c=relaxed/simple;
	bh=sxWdRd7NNHQBYD0wslE+kbhQa09Z/lUVHM/puqjrtTI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nrz2q/uJYneIieP3FYADJOIIMCgORUeNX5elkB1Nxs6e1OtHkCqkSxSmfHICY5MwH47/YHC5sBsAfeMJ1hJtqfQBZr5QdpIwKUq17Ovyi1dLEVmTa46rDU/Ck8/ljAQ8e1how/Mg6NjJaZgWRMLyGy2HT8sfSGsRx3KcAH77TTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xf48z7zJ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750856140; x=1782392140;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sxWdRd7NNHQBYD0wslE+kbhQa09Z/lUVHM/puqjrtTI=;
  b=Xf48z7zJ3Sf6DGv8yvFDW8ynmwhvLOAicmLhUaGBZeHUonKA+vPF1UAL
   k0zPZxnx2HCXYnzxK/NtPc8Z1mF4GUPkgOKd+YHZldUTiDPilzCfPi0Wb
   nd4F5wulyaxkYi5IqQd8OrIx5EvaKjgYR+A07wsqz+urtJUF3kVzhFNi0
   qV7qzPLomiUbd2uW6T2RykhCJ1a3o4jYBuCNNoANoOwdrj4YAZnz/jyLK
   PfITZ9k4hYntw89tjBHaWfMDpM8PEsyOaZFY3YjfOvQIm47of86VfS54+
   vX2F2ieNAqqZe5XvOGybxoNkYImbfCIFig/cacCZooqSdKwD9XN3mygzr
   Q==;
X-CSE-ConnectionGUID: 0QK4CXBETViw2RjqmgLVMg==
X-CSE-MsgGUID: An7DHP/FSH+jKLsdoU1Bbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="53264024"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="53264024"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 05:55:40 -0700
X-CSE-ConnectionGUID: SGeEDwZCTCSjjY9v71D/lw==
X-CSE-MsgGUID: /iCJ1ejkTFmr3O9v8L4yoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="156603503"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Jun 2025 05:55:37 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUPf5-000T7C-2d;
	Wed, 25 Jun 2025 12:55:35 +0000
Date: Wed, 25 Jun 2025 20:55:32 +0800
From: kernel test robot <lkp@intel.com>
To: Bingbu Cao <bingbu.cao@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [sailus-media-tree:ipu7 1/7]
 drivers/staging/media/ipu7/ipu7-buttress.c: warning: EXPORT_SYMBOL() is
 used, but #include <linux/export.h> is missing
Message-ID: <202506252004.5hMovDGZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git ipu7
head:   0542d88a01679ac03a980f7d53daefe8caebe345
commit: 4fc6f9e2be4048a8e695d2b7545df344554f5fd6 [1/7] media: staging/ipu7: add Intel IPU7 PCI device driver
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20250625/202506252004.5hMovDGZ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506252004.5hMovDGZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506252004.5hMovDGZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/apple/rtkit.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/apple/sart.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/bcm/brcmstb/common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/fsl/dpio/dpio-service.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/fsl/qbman/bman.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/fsl/qbman/bman_ccsr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/fsl/qbman/bman_portal.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/fsl/qbman/qman.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/fsl/qbman/qman_ccsr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/fsl/qbman/qman_portal.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/fsl/qe/qe.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/fsl/qe/qe_io.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/fsl/qe/qe_tdm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/fsl/qe/qmc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/fsl/qe/tsa.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/ixp4xx/ixp4xx-npe.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/ixp4xx/ixp4xx-qmgr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/mediatek/mtk-cmdq-helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/mediatek/mtk-dvfsrc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/mediatek/mtk-mmsys.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/mediatek/mtk-mutex.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/microchip/mpfs-sys-controller.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/pxa/ssp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/qcom/apr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/qcom/cmd-db.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/qcom/ice.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/qcom/kryo-l2-accessors.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/qcom/llcc-qcom.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/qcom/mdt_loader.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/qcom/ocmem.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/qcom/pdr_interface.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/qcom/pmic_glink.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/qcom/qcom-geni-se.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/qcom/qcom-pbs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/qcom/qcom_aoss.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/qcom/qcom_pdr_msg.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/qcom/qmi_encdec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/qcom/qmi_interface.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/qcom/rpmh.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/qcom/smd-rpm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/qcom/smem.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/qcom/smem_state.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/qcom/wcnss_ctrl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/renesas/rcar-rst.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/samsung/exynos-pmu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/samsung/exynos5422-asv.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/sunxi/sunxi_sram.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/tegra/fuse/fuse-tegra.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/ti/k3-ringacc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/ti/knav_dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/ti/knav_qmss_acc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/ti/knav_qmss_queue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/ti/pruss.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/ti/ti_sci_inta_msi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/ti/wkup_m3_ipc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soc/xilinx/xlnx_event_manager.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soundwire/bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soundwire/bus_type.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soundwire/cadence_master.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soundwire/generic_bandwidth_allocation.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soundwire/intel.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soundwire/intel_ace2x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soundwire/mipi_disco.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soundwire/slave.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/soundwire/stream.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/spi/spi-altera-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/spi/spi-amd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/spi/spi-bcm-qspi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/spi/spi-bitbang.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/spi/spi-dw-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/spi/spi-dw-dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/spi/spi-fsl-cpm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/spi/spi-fsl-lib.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/spi/spi-intel.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/spi/spi-loongson-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/spi/spi-loopback-test.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/spi/spi-mem.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/spi/spi-pxa2xx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/spmi/spmi-devres.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/spmi/spmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ssb/main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/staging/fbtft/fbtft-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/staging/gpib/common/gpib_os.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/staging/gpib/nec7210/nec7210.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/staging/gpib/tms9914/tms9914.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/staging/greybus/audio_apbridgea.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/staging/greybus/audio_codec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/staging/greybus/audio_gb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/staging/greybus/audio_manager.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/staging/greybus/gbphy.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/staging/greybus/spilib.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/staging/iio/addac/adt7316.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/staging/media/av7110/sp8870.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/staging/media/deprecated/atmel/atmel-isc-base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/staging/media/deprecated/atmel/atmel-isc-clk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/staging/media/imx/imx-media-capture.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/staging/media/imx/imx-media-dev-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/staging/media/imx/imx-media-of.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/staging/media/imx/imx-media-utils.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> drivers/staging/media/ipu7/ipu7-buttress.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> drivers/staging/media/ipu7/ipu7.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/staging/media/meson/vdec/codec_hevc_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/staging/media/meson/vdec/vdec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/staging/media/meson/vdec/vdec_helpers.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/staging/nvec/nvec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/staging/octeon/ethernet.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/target/iscsi/iscsi_target.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/target/iscsi/iscsi_target_datain_values.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/target/iscsi/iscsi_target_device.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/target/iscsi/iscsi_target_erl0.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/target/iscsi/iscsi_target_erl1.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/target/iscsi/iscsi_target_login.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/target/iscsi/iscsi_target_nego.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/target/iscsi/iscsi_target_parameters.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/target/iscsi/iscsi_target_tmr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/target/iscsi/iscsi_target_transport.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/target/iscsi/iscsi_target_util.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/target/target_core_configfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/target/target_core_hba.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/target/target_core_sbc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/target/target_core_spc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/target/target_core_transport.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/tc/tc-driver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/tee/tee_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/tee/tee_shm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/tee/tee_shm_pool.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/thermal/intel/int340x_thermal/int340x_thermal_zone.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/thermal/intel/int340x_thermal/platform_temperature_control.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/thermal/intel/int340x_thermal/processor_thermal_device.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/thermal/intel/int340x_thermal/processor_thermal_mbox.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/thermal/intel/int340x_thermal/processor_thermal_power_floor.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/thermal/intel/int340x_thermal/processor_thermal_rapl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/thermal/intel/int340x_thermal/processor_thermal_rfim.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/thermal/intel/int340x_thermal/processor_thermal_wt_hint.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/thermal/intel/int340x_thermal/processor_thermal_wt_req.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/thermal/intel/intel_soc_dts_iosf.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/thermal/intel/intel_tcc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/thermal/st/st_thermal.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/thermal/thermal_netlink.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/thermal/thermal_trip.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/thunderbolt/nhi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/thunderbolt/property.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/thunderbolt/usb4_port.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/thunderbolt/xdomain.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/tty/hvc/hvc_console.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/tty/serdev/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/tty/serial/8250/8250_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/tty/serial/8250/8250_dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/tty/serial/8250/8250_dwlib.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/tty/serial/8250/8250_fsl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/tty/serial/8250/8250_pci.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/tty/serial/8250/8250_pcilib.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/tty/serial/8250/8250_platform.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/tty/serial/8250/8250_port.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/tty/serial/8250/8250_rt288x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/tty/serial/serial_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/tty/serial/serial_mctrl_gpio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/tty/serial/serial_port.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/tty/serial/suncore.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/tty/sysrq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/tty/tty_buffer.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/tty/tty_io.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/tty/tty_ioctl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/tty/tty_jobctrl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/tty/tty_ldisc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/tty/tty_mutex.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/tty/tty_port.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/tty/vt/consolemap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/tty/vt/keyboard.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/tty/vt/selection.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/tty/vt/vt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/tty/vt/vt_ioctl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ufs/core/ufs-mcq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ufs/core/ufshcd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ufs/host/tc-dwc-g210.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ufs/host/ufshcd-dwc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ufs/host/ufshcd-pltfrm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/uio/uio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/usb/atm/usbatm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/usb/cdns3/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/usb/cdns3/drd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/usb/chipidea/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/usb/chipidea/usbmisc_imx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/usb/class/cdc-wdm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/usb/common/common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/usb/common/debug.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/usb/common/led.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/usb/common/ulpi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/usb/common/usb-otg-fsm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/usb/core/file.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/usb/core/generic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/usb/core/hcd-pci.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/usb/core/hcd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/usb/core/hub.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/usb/core/message.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/usb/core/of.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/usb/core/phy.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

