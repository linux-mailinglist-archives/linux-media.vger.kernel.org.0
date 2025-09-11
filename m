Return-Path: <linux-media+bounces-42253-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9B8B529CA
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 09:24:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B766A580147
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 07:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85CAD26A0B9;
	Thu, 11 Sep 2025 07:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QJAbnQ2J"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C143B329F2D
	for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 07:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757575437; cv=none; b=tfL4oPphbIc8+JZQ5qnPlrEFYRT2E731ABR3S9Y2zykgCCGc+mFY139G/DRd29vcUbzRXMJ02shaoiIYCBsIar4MhKMGClMoactOm7XcfKErkqm+2k8tzh2YqrlRjHRNQgtmPq3wTntSFBN2X+NEmfgvIM0kNKvW63zuAI5WAWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757575437; c=relaxed/simple;
	bh=bdfkpjcqx9afNMXCj3Wh88etRMkUNGLqTpw2ydm4oa4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fB/UfC4CJLHddn1sSKbSgzXpPIGxEVUJ1w7dZRltnjsHChcQOg/mfKuYWIThsa6neIcE023OYltZIvLCxUCL61GaDcsm5KwG7/SfHwcshjd6dzRCI+Z96GJDM78yI9kdmOF7zyr+EMZ9mlQQCy6oh46xwfsUw0Z29W1uQaI/tOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QJAbnQ2J; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757575434; x=1789111434;
  h=date:from:to:cc:subject:message-id;
  bh=bdfkpjcqx9afNMXCj3Wh88etRMkUNGLqTpw2ydm4oa4=;
  b=QJAbnQ2JzExpwUohH7qlcaFUgRTsy/JsSq4JL5sn3VAbvO4eOmhe5ldp
   oHAqPVx54MpvBnK9u4Cv4ujVeqMknry9+TCSGDesqGhGDKN/RHQoTWH0Q
   yi92Ld7DDk238C/EoZBdMdK2za5jBf2ptBis2cnAg2xRvGcX5UbVKsX2W
   G+TVYyju7VoCgPh3hoTs5peEGKyA+/yDpwScO5WqKZYkyl9iwbx0n6Y20
   4Xckr9Kso5URfzXMc4wT6+LEj1HNg31QWcKnrKoGxkwZblK8J7aKBQ06U
   bN6jKW/JOf93I+Tbef6bE2uZ7BU2NY519DR3EbSyR7lLoPy/E+nCJoz/J
   Q==;
X-CSE-ConnectionGUID: rEj0bGqyTHGIDz7VpRXDig==
X-CSE-MsgGUID: HWo5oHZbSsq7SkDUO70NdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59972012"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; 
   d="scan'208";a="59972012"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 00:23:53 -0700
X-CSE-ConnectionGUID: DGxXXUNdSGq0gg8gCCY40A==
X-CSE-MsgGUID: hm/dKJohSz2z9aTxsF3GOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; 
   d="scan'208";a="204606876"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 11 Sep 2025 00:23:51 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwben-00007Q-0V;
	Thu, 11 Sep 2025 07:23:49 +0000
Date: Thu, 11 Sep 2025 15:23:18 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:master] BUILD SUCCESS
 4bd8a6147645480d550242ff816b4c7ba160e5b7
Message-ID: <202509111556.C5CAe0Fe-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git master
branch HEAD: 4bd8a6147645480d550242ff816b4c7ba160e5b7  media: vivid: fix disappearing <Vendor Command With ID> messages

Unverified Warning (likely false positive, kindly check if interested):

    arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[100, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[103, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[100, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[75, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[77, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[120, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[120, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[109, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[118, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[97, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[97, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[97, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[97, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[97, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[97, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[97, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[64, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[68, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[105, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[105, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[105, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[109, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[100, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[100, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[71, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[71, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dtb: isp@32e10000 (fsl,imx8mp-isp): 'power-domain-names' is a required property
    arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[67, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[87, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[90, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[93, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[91, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[91, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[91, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[91, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[91, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[123, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[111, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[111, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219.dtb: isp@32e10000 (fsl,imx8mp-isp): 'power-domain-names' is a required property
    arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[111, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[111, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[106, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[106, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[106, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[92, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[92, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[92, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[71, 6]] is too short
    arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[78, 6]] is too short

Warning ids grouped by kconfigs:

recent_errors
|-- arm64-randconfig-051-20250910
|   |-- arch-arm64-boot-dts-freescale-imx8mp-aristainetos3-helios-lvds.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-beacon-kit.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-data-modul-edm-sbc.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-debix-model-a.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-debix-som-a-bmb-.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-dhcom-drc02.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-dhcom-drc02.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-dhcom-pdk2.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-dhcom-picoitx.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-evk-lvds0-imx-lvds-hdmi.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-evk-lvds1-imx-lvds-hdmi.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-evk-mx8-dlvds-lcd1.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-evk-pcie-ep.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-evk.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-icore-mx8mp-edimm2..dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-iota2-lumpy.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-kontron-bl-osm-s.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-kontron-dl.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-kontron-dl.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-kontron-smarc-eval-carrier.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-libra-rdk-fpsc-lvds.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-libra-rdk-fpsc.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-navqp.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-navqp.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-nitrogen-enc-carrier-board.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domain-names-is-a-required-property
|   |-- arch-arm64-boot-dts-freescale-imx8mp-nitrogen-smarc-universal-board.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-phyboard-pollux-rdk.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-skov-basic.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-skov-revb-hdmi.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-skov-revb-mi1010ait-1cp1.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-skov-revc-bd500.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-skov-revc-bd500.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-skov-revc-tian-g07017.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-skov-revc-tian-g07017.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-toradex-smarc-dev.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domain-names-is-a-required-property
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mp-ras314.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mpxl.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tx8p-ml81-moduline-display-.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tx8p-ml81-moduline-display-av101hdt-a10.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tx8p-ml81-moduline-display-av123z7m-n17.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-var-som-symphony.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-venice-gw71xx-2x.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-venice-gw72xx-2x.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-venice-gw73xx-2x.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-venice-gw74xx-imx219.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-venice-gw74xx-rpidsi.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-venice-gw74xx.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-venice-gw75xx-2x.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-nonwifi-dahlia.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-nonwifi-dev.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-nonwifi-ivy.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-nonwifi-mallow.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-nonwifi-yavia.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-wifi-dahlia.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-wifi-dev.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-wifi-ivy.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-wifi-mallow.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   `-- arch-arm64-boot-dts-freescale-imx8mp-verdin-wifi-yavia.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|-- arm64-randconfig-052-20250910
|   |-- arch-arm64-boot-dts-freescale-imx8mp-aristainetos3-helios-lvds.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-beacon-kit.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-data-modul-edm-sbc.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-debix-model-a.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-debix-som-a-bmb-.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-dhcom-drc02.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-dhcom-drc02.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-dhcom-pdk2.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-dhcom-picoitx.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-evk-lvds0-imx-lvds-hdmi.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-evk-lvds1-imx-lvds-hdmi.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-evk-mx8-dlvds-lcd1.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-evk-pcie-ep.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-evk.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-icore-mx8mp-edimm2..dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-iota2-lumpy.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-kontron-bl-osm-s.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-kontron-dl.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-kontron-dl.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-kontron-smarc-eval-carrier.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-libra-rdk-fpsc-lvds.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-libra-rdk-fpsc.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-navqp.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-navqp.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-nitrogen-enc-carrier-board.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domain-names-is-a-required-property
|   |-- arch-arm64-boot-dts-freescale-imx8mp-nitrogen-smarc-universal-board.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-phyboard-pollux-rdk.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-skov-basic.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-skov-revb-hdmi.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-skov-revb-mi1010ait-1cp1.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-skov-revc-bd500.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-skov-revc-bd500.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-skov-revc-tian-g07017.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-skov-revc-tian-g07017.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-toradex-smarc-dev.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domain-names-is-a-required-property
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mp-ras314.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mpxl.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tx8p-ml81-moduline-display-.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tx8p-ml81-moduline-display-av101hdt-a10.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tx8p-ml81-moduline-display-av123z7m-n17.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-var-som-symphony.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-venice-gw71xx-2x.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-venice-gw72xx-2x.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-venice-gw73xx-2x.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-venice-gw74xx-imx219.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-venice-gw74xx-rpidsi.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-venice-gw74xx.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-venice-gw75xx-2x.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-nonwifi-dahlia.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-nonwifi-dev.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-nonwifi-ivy.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-nonwifi-mallow.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-nonwifi-yavia.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-wifi-dahlia.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-wifi-dev.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-wifi-ivy.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-wifi-mallow.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   `-- arch-arm64-boot-dts-freescale-imx8mp-verdin-wifi-yavia.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|-- arm64-randconfig-053-20250910
|   |-- arch-arm64-boot-dts-freescale-imx8mp-aristainetos3-helios-lvds.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-beacon-kit.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-data-modul-edm-sbc.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-debix-model-a.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-debix-som-a-bmb-.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-dhcom-drc02.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-dhcom-drc02.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-dhcom-pdk2.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-dhcom-picoitx.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-evk-lvds0-imx-lvds-hdmi.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-evk-lvds1-imx-lvds-hdmi.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-evk-mx8-dlvds-lcd1.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-evk-pcie-ep.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-evk.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-icore-mx8mp-edimm2..dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-iota2-lumpy.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-kontron-bl-osm-s.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-kontron-dl.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-kontron-dl.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-kontron-smarc-eval-carrier.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-libra-rdk-fpsc-lvds.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-libra-rdk-fpsc.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-navqp.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-navqp.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-nitrogen-enc-carrier-board.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domain-names-is-a-required-property
|   |-- arch-arm64-boot-dts-freescale-imx8mp-nitrogen-smarc-universal-board.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-phyboard-pollux-rdk.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-skov-basic.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-skov-revb-hdmi.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-skov-revb-mi1010ait-1cp1.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-skov-revc-bd500.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-skov-revc-bd500.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-skov-revc-tian-g07017.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-skov-revc-tian-g07017.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-toradex-smarc-dev.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domain-names-is-a-required-property
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mp-ras314.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mpxl.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tx8p-ml81-moduline-display-.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tx8p-ml81-moduline-display-av101hdt-a10.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tx8p-ml81-moduline-display-av123z7m-n17.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-var-som-symphony.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-venice-gw71xx-2x.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-venice-gw72xx-2x.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-venice-gw73xx-2x.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-venice-gw74xx-imx219.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-venice-gw74xx-rpidsi.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-venice-gw74xx.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-venice-gw75xx-2x.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-nonwifi-dahlia.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-nonwifi-dev.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-nonwifi-ivy.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-nonwifi-mallow.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-nonwifi-yavia.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-wifi-dahlia.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-wifi-dev.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-wifi-ivy.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-wifi-mallow.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   `-- arch-arm64-boot-dts-freescale-imx8mp-verdin-wifi-yavia.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|-- arm64-randconfig-054-20250910
|   |-- arch-arm64-boot-dts-freescale-imx8mp-aristainetos3-helios-lvds.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-beacon-kit.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-data-modul-edm-sbc.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-debix-model-a.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-debix-som-a-bmb-.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-dhcom-drc02.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-dhcom-drc02.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-dhcom-pdk2.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-dhcom-picoitx.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-evk-lvds0-imx-lvds-hdmi.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-evk-lvds1-imx-lvds-hdmi.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-evk-mx8-dlvds-lcd1.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-evk-pcie-ep.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-evk.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-icore-mx8mp-edimm2..dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-iota2-lumpy.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-kontron-bl-osm-s.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-kontron-dl.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-kontron-dl.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-kontron-smarc-eval-carrier.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-libra-rdk-fpsc-lvds.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-libra-rdk-fpsc.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-navqp.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-navqp.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-nitrogen-enc-carrier-board.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domain-names-is-a-required-property
|   |-- arch-arm64-boot-dts-freescale-imx8mp-nitrogen-smarc-universal-board.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-phyboard-pollux-rdk.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-skov-basic.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-skov-revb-hdmi.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-skov-revb-mi1010ait-1cp1.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-skov-revc-bd500.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-skov-revc-bd500.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-skov-revc-tian-g07017.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-skov-revc-tian-g07017.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-toradex-smarc-dev.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domain-names-is-a-required-property
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mp-ras314.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mpxl.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tx8p-ml81-moduline-display-.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tx8p-ml81-moduline-display-av101hdt-a10.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-tx8p-ml81-moduline-display-av123z7m-n17.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-var-som-symphony.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-venice-gw71xx-2x.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-venice-gw72xx-2x.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-venice-gw73xx-2x.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-venice-gw74xx-imx219.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-venice-gw74xx-rpidsi.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-venice-gw74xx.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-venice-gw75xx-2x.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-nonwifi-dahlia.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-nonwifi-dev.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-nonwifi-ivy.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-nonwifi-mallow.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-nonwifi-yavia.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-wifi-dahlia.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-wifi-dev.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-wifi-ivy.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-wifi-mallow.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
|   `-- arch-arm64-boot-dts-freescale-imx8mp-verdin-wifi-yavia.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
`-- arm64-randconfig-055-20250910
    |-- arch-arm64-boot-dts-freescale-imx8mp-aristainetos3-helios-lvds.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-beacon-kit.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-data-modul-edm-sbc.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-debix-model-a.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-debix-som-a-bmb-.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-dhcom-drc02.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-dhcom-drc02.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-dhcom-pdk2.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-dhcom-picoitx.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-evk-lvds0-imx-lvds-hdmi.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-evk-lvds1-imx-lvds-hdmi.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-evk-mx8-dlvds-lcd1.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-evk-pcie-ep.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-evk.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-icore-mx8mp-edimm2..dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-iota2-lumpy.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-kontron-bl-osm-s.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-kontron-dl.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-kontron-dl.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-kontron-smarc-eval-carrier.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-libra-rdk-fpsc-lvds.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-libra-rdk-fpsc.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-navqp.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-navqp.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-nitrogen-enc-carrier-board.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domain-names-is-a-required-property
    |-- arch-arm64-boot-dts-freescale-imx8mp-nitrogen-smarc-universal-board.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-phyboard-pollux-rdk.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-skov-basic.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-skov-revb-hdmi.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-skov-revb-mi1010ait-1cp1.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-skov-revc-bd500.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-skov-revc-bd500.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-skov-revc-tian-g07017.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-skov-revc-tian-g07017.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-toradex-smarc-dev.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domain-names-is-a-required-property
    |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mp-ras314.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-tqma8mpql-mba8mpxl.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-tx8p-ml81-moduline-display-.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-tx8p-ml81-moduline-display-av101hdt-a10.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-tx8p-ml81-moduline-display-av123z7m-n17.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-var-som-symphony.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-venice-gw71xx-2x.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-venice-gw72xx-2x.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-venice-gw73xx-2x.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-venice-gw74xx-imx219.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-venice-gw74xx-rpidsi.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-venice-gw74xx.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-venice-gw75xx-2x.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-nonwifi-dahlia.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-nonwifi-dev.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-nonwifi-ivy.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-nonwifi-mallow.dtb:isp-32e10000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-nonwifi-yavia.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-wifi-dahlia.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-wifi-dev.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-wifi-ivy.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
    |-- arch-arm64-boot-dts-freescale-imx8mp-verdin-wifi-mallow.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short
    `-- arch-arm64-boot-dts-freescale-imx8mp-verdin-wifi-yavia.dtb:isp-32e20000-(fsl-imx8mp-isp):power-domains:is-too-short

elapsed time: 1401m

configs tested: 120
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250910    gcc-13.4.0
arc                   randconfig-002-20250910    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                          moxart_defconfig    gcc-15.1.0
arm                            qcom_defconfig    clang-22
arm                   randconfig-001-20250910    gcc-8.5.0
arm                   randconfig-002-20250910    gcc-8.5.0
arm                   randconfig-003-20250910    clang-16
arm                   randconfig-004-20250910    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250910    clang-22
arm64                 randconfig-002-20250910    clang-22
arm64                 randconfig-003-20250910    gcc-9.5.0
arm64                 randconfig-004-20250910    gcc-13.4.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250910    gcc-12.5.0
csky                  randconfig-002-20250910    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250910    clang-22
hexagon               randconfig-002-20250910    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20250910    gcc-14
i386        buildonly-randconfig-002-20250910    gcc-13
i386        buildonly-randconfig-003-20250910    clang-20
i386        buildonly-randconfig-004-20250910    clang-20
i386        buildonly-randconfig-005-20250910    gcc-14
i386        buildonly-randconfig-006-20250910    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250910    clang-18
loongarch             randconfig-002-20250910    clang-18
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                        m5407c3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250910    gcc-11.5.0
nios2                 randconfig-002-20250910    gcc-9.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250910    gcc-10.5.0
parisc                randconfig-002-20250910    gcc-9.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                    amigaone_defconfig    gcc-15.1.0
powerpc                   bluestone_defconfig    clang-22
powerpc                          g5_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250910    gcc-8.5.0
powerpc               randconfig-002-20250910    gcc-8.5.0
powerpc               randconfig-003-20250910    clang-22
powerpc64             randconfig-002-20250910    gcc-11.5.0
powerpc64             randconfig-003-20250910    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250910    clang-22
riscv                 randconfig-002-20250910    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250910    clang-22
s390                  randconfig-002-20250910    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250910    gcc-15.1.0
sh                    randconfig-002-20250910    gcc-12.5.0
sh                           se7780_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250910    gcc-8.5.0
sparc                 randconfig-002-20250910    gcc-8.5.0
sparc64                          alldefconfig    gcc-15.1.0
sparc64               randconfig-001-20250910    gcc-8.5.0
sparc64               randconfig-002-20250910    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                    randconfig-001-20250910    clang-22
um                    randconfig-002-20250910    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250910    gcc-14
x86_64      buildonly-randconfig-002-20250910    clang-20
x86_64      buildonly-randconfig-003-20250910    gcc-14
x86_64      buildonly-randconfig-004-20250910    clang-20
x86_64      buildonly-randconfig-005-20250910    gcc-14
x86_64      buildonly-randconfig-006-20250910    clang-20
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250910    gcc-8.5.0
xtensa                randconfig-002-20250910    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

