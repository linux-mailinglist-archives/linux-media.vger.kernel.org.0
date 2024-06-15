Return-Path: <linux-media+bounces-13296-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF469095DE
	for <lists+linux-media@lfdr.de>; Sat, 15 Jun 2024 05:34:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7EF91F236F0
	for <lists+linux-media@lfdr.de>; Sat, 15 Jun 2024 03:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BAD8D53F;
	Sat, 15 Jun 2024 03:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fr+Myt+m"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3235ED517;
	Sat, 15 Jun 2024 03:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718422428; cv=none; b=aA9xFQRnFXpzTAa2Jcj8BaU1c5owc7DRs2tbAnvBprZz2tm/YWCRISsi9AuEGAROCbrCxyFuE+XBsl2c3FgRDbj11KZC0EeLTEQ2/hBW+AF78O1+XSeHxqlcg2IkTVvjsUwZlTij9q8wfZlOg7jsvqUkHHcOOrO/XOSLJYYosAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718422428; c=relaxed/simple;
	bh=tQ9LUK1jN643tytOyITrOgayXfeYTKDN6fD3u6FPTGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VI27SEIZnglQWpi99IXTi1xQsa57PepeynjNIvx6SKCjk6ZTWWcBODJc8hWWqvpt5P6eUh/NwXdvDbcyGlJl9K6szsAIB7v/anCezu2oqcIC1prHv4r3k2H6W4cJMeF2aNt/9t5rUmU1LvK7SAgalfeZaW2KDCidduUD1mkLbBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fr+Myt+m; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718422425; x=1749958425;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tQ9LUK1jN643tytOyITrOgayXfeYTKDN6fD3u6FPTGY=;
  b=Fr+Myt+mxCsAPWoHVrD8Zn5VQlkNMXi60zlXgXsybA0DS92ByGNJfj0G
   pQSlWrzBe3+PTAj4hFTOaovqngkX0WzVWrCpD1iXAKc1/Gy5XRzKguvZW
   CzgJ/BJ137f8vB/GSFworiGgRepe6y7UJFjGAjt8+SFGT+FC/mfUWObVI
   vV99oFAKfwUVPB0b6iqldKPGdlO3CxeFKytP4QpxqdND7g7V6Clqm0UBt
   vMlukAQreZJ4m9UeA0m6xwzhLr224VrfSVBZUk5Sug2I1LRvMEWbEqkW0
   H4Ybo6VamLnrJ70rQpIRpogWMewpPZ3x7Xr7qbV+ExOU2hqrGJA1JLREq
   g==;
X-CSE-ConnectionGUID: lXasxOBxQb2Tu811JsXBdA==
X-CSE-MsgGUID: EeYJWhrKT0uUUpkz8gGVYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="19184213"
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="19184213"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 20:33:44 -0700
X-CSE-ConnectionGUID: pqyj9ua+QNWrBp0wBpeggg==
X-CSE-MsgGUID: X+Gbxih5Q96A+WGywTRX9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="78167877"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Jun 2024 20:33:37 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIKAZ-00025R-0z;
	Sat, 15 Jun 2024 03:33:35 +0000
Date: Sat, 15 Jun 2024 11:32:49 +0800
From: kernel test robot <lkp@intel.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Oded Gabbay <ogabbay@kernel.org>,
	Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 4/9] arm64: dts: rockchip: Add nodes for NPU and its MMU
 to rk3588s
Message-ID: <202406151154.HZ8JttcH-lkp@intel.com>
References: <20240612-6-10-rocket-v1-4-060e48eea250@tomeuvizoso.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612-6-10-rocket-v1-4-060e48eea250@tomeuvizoso.net>

Hi Tomeu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 83a7eefedc9b56fe7bfeff13b6c7356688ffa670]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomeu-Vizoso/iommu-rockchip-Add-compatible-for-rockchip-rk3588-iommu/20240612-215814
base:   83a7eefedc9b56fe7bfeff13b6c7356688ffa670
patch link:    https://lore.kernel.org/r/20240612-6-10-rocket-v1-4-060e48eea250%40tomeuvizoso.net
patch subject: [PATCH 4/9] arm64: dts: rockchip: Add nodes for NPU and its MMU to rk3588s
config: arm64-randconfig-051-20240614 (https://download.01.org/0day-ci/archive/20240615/202406151154.HZ8JttcH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406151154.HZ8JttcH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406151154.HZ8JttcH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: iommu@fdab9000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-iommu'] is too short
   	'rockchip,rk3588-iommu' is not one of ['rockchip,iommu', 'rockchip,rk3568-iommu']
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: iommu@fdab9000: reg: [[0, 4255879168, 0, 256], [0, 4255883264, 0, 256], [0, 4255948800, 0, 256], [0, 4256014336, 0, 256]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: iommu@fdab9000: interrupts: [[0, 110, 4, 0], [0, 111, 4, 0], [0, 112, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: iommu@fdab9000: clocks: [[28, 287], [28, 276], [28, 278], [28, 288], [28, 277], [28, 279]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: iommu@fdab9000: clock-names:0: 'aclk' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: iommu@fdab9000: clock-names:1: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: iommu@fdab9000: clock-names: ['aclk0', 'aclk1', 'aclk2', 'iface0', 'iface1', 'iface2'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: iommu@fdab9000: power-domains: [[30, 9], [30, 10], [30, 11]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: iommu@fdab9000: 'interrupt-names', 'power-domain-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: iommu@fdab9000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-iommu'] is too short
   	'rockchip,rk3588-iommu' is not one of ['rockchip,iommu', 'rockchip,rk3568-iommu']
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: iommu@fdab9000: reg: [[0, 4255879168, 0, 256], [0, 4255883264, 0, 256], [0, 4255948800, 0, 256], [0, 4256014336, 0, 256]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: iommu@fdab9000: interrupts: [[0, 110, 4, 0], [0, 111, 4, 0], [0, 112, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: iommu@fdab9000: clocks: [[28, 287], [28, 276], [28, 278], [28, 288], [28, 277], [28, 279]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: iommu@fdab9000: clock-names:0: 'aclk' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: iommu@fdab9000: clock-names:1: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: iommu@fdab9000: clock-names: ['aclk0', 'aclk1', 'aclk2', 'iface0', 'iface1', 'iface2'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: iommu@fdab9000: power-domains: [[30, 9], [30, 10], [30, 11]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: iommu@fdab9000: 'interrupt-names', 'power-domain-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: iommu@fdab9000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-iommu'] is too short
   	'rockchip,rk3588-iommu' is not one of ['rockchip,iommu', 'rockchip,rk3568-iommu']
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: iommu@fdab9000: reg: [[0, 4255879168, 0, 256], [0, 4255883264, 0, 256], [0, 4255948800, 0, 256], [0, 4256014336, 0, 256]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: iommu@fdab9000: interrupts: [[0, 110, 4, 0], [0, 111, 4, 0], [0, 112, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: iommu@fdab9000: clocks: [[28, 287], [28, 276], [28, 278], [28, 288], [28, 277], [28, 279]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: iommu@fdab9000: clock-names:0: 'aclk' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: iommu@fdab9000: clock-names:1: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: iommu@fdab9000: clock-names: ['aclk0', 'aclk1', 'aclk2', 'iface0', 'iface1', 'iface2'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: iommu@fdab9000: power-domains: [[30, 9], [30, 10], [30, 11]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: iommu@fdab9000: 'interrupt-names', 'power-domain-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: iommu@fdab9000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-iommu'] is too short
   	'rockchip,rk3588-iommu' is not one of ['rockchip,iommu', 'rockchip,rk3568-iommu']
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: iommu@fdab9000: reg: [[0, 4255879168, 0, 256], [0, 4255883264, 0, 256], [0, 4255948800, 0, 256], [0, 4256014336, 0, 256]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: iommu@fdab9000: interrupts: [[0, 110, 4, 0], [0, 111, 4, 0], [0, 112, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: iommu@fdab9000: clocks: [[28, 287], [28, 276], [28, 278], [28, 288], [28, 277], [28, 279]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: iommu@fdab9000: clock-names:0: 'aclk' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: iommu@fdab9000: clock-names:1: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: iommu@fdab9000: clock-names: ['aclk0', 'aclk1', 'aclk2', 'iface0', 'iface1', 'iface2'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: iommu@fdab9000: power-domains: [[30, 9], [30, 10], [30, 11]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: iommu@fdab9000: 'interrupt-names', 'power-domain-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts:1228.7-1236.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: iommu@fdab9000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-iommu'] is too short
   	'rockchip,rk3588-iommu' is not one of ['rockchip,iommu', 'rockchip,rk3568-iommu']
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: iommu@fdab9000: reg: [[0, 4255879168, 0, 256], [0, 4255883264, 0, 256], [0, 4255948800, 0, 256], [0, 4256014336, 0, 256]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: iommu@fdab9000: interrupts: [[0, 110, 4, 0], [0, 111, 4, 0], [0, 112, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: iommu@fdab9000: clocks: [[28, 287], [28, 276], [28, 278], [28, 288], [28, 277], [28, 279]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: iommu@fdab9000: clock-names:0: 'aclk' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: iommu@fdab9000: clock-names:1: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: iommu@fdab9000: clock-names: ['aclk0', 'aclk1', 'aclk2', 'iface0', 'iface1', 'iface2'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: iommu@fdab9000: power-domains: [[30, 9], [30, 10], [30, 11]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: iommu@fdab9000: 'interrupt-names', 'power-domain-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: iommu@fdab9000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-iommu'] is too short
   	'rockchip,rk3588-iommu' is not one of ['rockchip,iommu', 'rockchip,rk3568-iommu']
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: iommu@fdab9000: reg: [[0, 4255879168, 0, 256], [0, 4255883264, 0, 256], [0, 4255948800, 0, 256], [0, 4256014336, 0, 256]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: iommu@fdab9000: interrupts: [[0, 110, 4, 0], [0, 111, 4, 0], [0, 112, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: iommu@fdab9000: clocks: [[28, 287], [28, 276], [28, 278], [28, 288], [28, 277], [28, 279]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: iommu@fdab9000: clock-names:0: 'aclk' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: iommu@fdab9000: clock-names:1: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: iommu@fdab9000: clock-names: ['aclk0', 'aclk1', 'aclk2', 'iface0', 'iface1', 'iface2'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: iommu@fdab9000: power-domains: [[30, 9], [30, 10], [30, 11]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: iommu@fdab9000: 'interrupt-names', 'power-domain-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: regulator@42: Unevaluated properties are not allowed ('rockchip,suspend-voltage-selector' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: pmic@0: regulators:dcdc-reg4: Unevaluated properties are not allowed ('regulator-init-microvolt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk806.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: pmic@0: Unevaluated properties are not allowed ('regulators' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk806.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: codec@1b: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks', 'clock-names', 'clocks', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5616.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: iommu@fdab9000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-iommu'] is too short
   	'rockchip,rk3588-iommu' is not one of ['rockchip,iommu', 'rockchip,rk3568-iommu']
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: iommu@fdab9000: reg: [[0, 4255879168, 0, 256], [0, 4255883264, 0, 256], [0, 4255948800, 0, 256], [0, 4256014336, 0, 256]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: iommu@fdab9000: interrupts: [[0, 110, 4, 0], [0, 111, 4, 0], [0, 112, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: iommu@fdab9000: clocks: [[28, 287], [28, 276], [28, 278], [28, 288], [28, 277], [28, 279]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: iommu@fdab9000: clock-names:0: 'aclk' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: iommu@fdab9000: clock-names:1: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: iommu@fdab9000: clock-names: ['aclk0', 'aclk1', 'aclk2', 'iface0', 'iface1', 'iface2'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: iommu@fdab9000: power-domains: [[30, 9], [30, 10], [30, 11]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: iommu@fdab9000: 'interrupt-names', 'power-domain-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: sound: 'simple-audio-card,hp-pin-name' does not match any of the regexes: '^simple-audio-card,codec(@[0-9a-f]+)?$', '^simple-audio-card,cpu(@[0-9a-f]+)?$', '^simple-audio-card,dai-link(@[0-9a-f]+)?$', '^simple-audio-card,plat(@[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/simple-card.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: vcc3v3-sd-s0-regulator: Unevaluated properties are not allowed ('enable-active-low' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: iommu@fdab9000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-iommu'] is too short
   	'rockchip,rk3588-iommu' is not one of ['rockchip,iommu', 'rockchip,rk3568-iommu']
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: iommu@fdab9000: reg: [[0, 4255879168, 0, 256], [0, 4255883264, 0, 256], [0, 4255948800, 0, 256], [0, 4256014336, 0, 256]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: iommu@fdab9000: interrupts: [[0, 110, 4, 0], [0, 111, 4, 0], [0, 112, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: iommu@fdab9000: clocks: [[28, 287], [28, 276], [28, 278], [28, 288], [28, 277], [28, 279]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: iommu@fdab9000: clock-names:0: 'aclk' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: iommu@fdab9000: clock-names:1: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: iommu@fdab9000: clock-names: ['aclk0', 'aclk1', 'aclk2', 'iface0', 'iface1', 'iface2'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: iommu@fdab9000: power-domains: [[30, 9], [30, 10], [30, 11]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: iommu@fdab9000: 'interrupt-names', 'power-domain-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: audio-codec@11: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: iommu@fdab9000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-iommu'] is too short
   	'rockchip,rk3588-iommu' is not one of ['rockchip,iommu', 'rockchip,rk3568-iommu']
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: iommu@fdab9000: reg: [[0, 4255879168, 0, 256], [0, 4255883264, 0, 256], [0, 4255948800, 0, 256], [0, 4256014336, 0, 256]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: iommu@fdab9000: interrupts: [[0, 110, 4, 0], [0, 111, 4, 0], [0, 112, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: iommu@fdab9000: clocks: [[28, 287], [28, 276], [28, 278], [28, 288], [28, 277], [28, 279]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: iommu@fdab9000: clock-names:0: 'aclk' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: iommu@fdab9000: clock-names:1: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: iommu@fdab9000: clock-names: ['aclk0', 'aclk1', 'aclk2', 'iface0', 'iface1', 'iface2'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: iommu@fdab9000: power-domains: [[30, 9], [30, 10], [30, 11]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: iommu@fdab9000: 'interrupt-names', 'power-domain-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: audio-codec@11: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: iommu@fdab9000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-iommu'] is too short
   	'rockchip,rk3588-iommu' is not one of ['rockchip,iommu', 'rockchip,rk3568-iommu']
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: iommu@fdab9000: reg: [[0, 4255879168, 0, 256], [0, 4255883264, 0, 256], [0, 4255948800, 0, 256], [0, 4256014336, 0, 256]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: iommu@fdab9000: interrupts: [[0, 110, 4, 0], [0, 111, 4, 0], [0, 112, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: iommu@fdab9000: clocks: [[28, 287], [28, 276], [28, 278], [28, 288], [28, 277], [28, 279]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: iommu@fdab9000: clock-names:0: 'aclk' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: iommu@fdab9000: clock-names:1: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: iommu@fdab9000: clock-names: ['aclk0', 'aclk1', 'aclk2', 'iface0', 'iface1', 'iface2'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: iommu@fdab9000: power-domains: [[30, 9], [30, 10], [30, 11]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: iommu@fdab9000: 'interrupt-names', 'power-domain-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: iommu@fdab9000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-iommu'] is too short
   	'rockchip,rk3588-iommu' is not one of ['rockchip,iommu', 'rockchip,rk3568-iommu']
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: iommu@fdab9000: reg: [[0, 4255879168, 0, 256], [0, 4255883264, 0, 256], [0, 4255948800, 0, 256], [0, 4256014336, 0, 256]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: iommu@fdab9000: interrupts: [[0, 110, 4, 0], [0, 111, 4, 0], [0, 112, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: iommu@fdab9000: clocks: [[28, 287], [28, 276], [28, 278], [28, 288], [28, 277], [28, 279]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: iommu@fdab9000: clock-names:0: 'aclk' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: iommu@fdab9000: clock-names:1: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: iommu@fdab9000: clock-names: ['aclk0', 'aclk1', 'aclk2', 'iface0', 'iface1', 'iface2'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: iommu@fdab9000: power-domains: [[30, 9], [30, 10], [30, 11]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: iommu@fdab9000: 'interrupt-names', 'power-domain-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: iommu@fdab9000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-iommu'] is too short
   	'rockchip,rk3588-iommu' is not one of ['rockchip,iommu', 'rockchip,rk3568-iommu']
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: iommu@fdab9000: reg: [[0, 4255879168, 0, 256], [0, 4255883264, 0, 256], [0, 4255948800, 0, 256], [0, 4256014336, 0, 256]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: iommu@fdab9000: interrupts: [[0, 110, 4, 0], [0, 111, 4, 0], [0, 112, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: iommu@fdab9000: clocks: [[28, 287], [28, 276], [28, 278], [28, 288], [28, 277], [28, 279]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: iommu@fdab9000: clock-names:0: 'aclk' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: iommu@fdab9000: clock-names:1: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: iommu@fdab9000: clock-names: ['aclk0', 'aclk1', 'aclk2', 'iface0', 'iface1', 'iface2'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: iommu@fdab9000: power-domains: [[30, 9], [30, 10], [30, 11]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: iommu@fdab9000: 'interrupt-names', 'power-domain-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: /extcon-usb3: failed to match any schema with compatible: ['linux,extcon-usb-gpio']
--
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: pmic@0: regulators:dcdc-reg4: Unevaluated properties are not allowed ('regulator-init-microvolt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk806.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: pmic@0: Unevaluated properties are not allowed ('regulators' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk806.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: iommu@fdab9000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-iommu'] is too short
   	'rockchip,rk3588-iommu' is not one of ['rockchip,iommu', 'rockchip,rk3568-iommu']
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: iommu@fdab9000: reg: [[0, 4255879168, 0, 256], [0, 4255883264, 0, 256], [0, 4255948800, 0, 256], [0, 4256014336, 0, 256]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: iommu@fdab9000: interrupts: [[0, 110, 4, 0], [0, 111, 4, 0], [0, 112, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: iommu@fdab9000: clocks: [[28, 287], [28, 276], [28, 278], [28, 288], [28, 277], [28, 279]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: iommu@fdab9000: clock-names:0: 'aclk' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: iommu@fdab9000: clock-names:1: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: iommu@fdab9000: clock-names: ['aclk0', 'aclk1', 'aclk2', 'iface0', 'iface1', 'iface2'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: iommu@fdab9000: power-domains: [[30, 9], [30, 10], [30, 11]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: iommu@fdab9000: 'interrupt-names', 'power-domain-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: iommu@fdab9000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-iommu'] is too short
   	'rockchip,rk3588-iommu' is not one of ['rockchip,iommu', 'rockchip,rk3568-iommu']
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: iommu@fdab9000: reg: [[0, 4255879168, 0, 256], [0, 4255883264, 0, 256], [0, 4255948800, 0, 256], [0, 4256014336, 0, 256]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: iommu@fdab9000: interrupts: [[0, 110, 4, 0], [0, 111, 4, 0], [0, 112, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: iommu@fdab9000: clocks: [[28, 287], [28, 276], [28, 278], [28, 288], [28, 277], [28, 279]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: iommu@fdab9000: clock-names:0: 'aclk' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: iommu@fdab9000: clock-names:1: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: iommu@fdab9000: clock-names: ['aclk0', 'aclk1', 'aclk2', 'iface0', 'iface1', 'iface2'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: iommu@fdab9000: power-domains: [[30, 9], [30, 10], [30, 11]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: iommu@fdab9000: 'interrupt-names', 'power-domain-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: iommu@fdab9000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-iommu'] is too short
   	'rockchip,rk3588-iommu' is not one of ['rockchip,iommu', 'rockchip,rk3568-iommu']
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: iommu@fdab9000: reg: [[0, 4255879168, 0, 256], [0, 4255883264, 0, 256], [0, 4255948800, 0, 256], [0, 4256014336, 0, 256]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: iommu@fdab9000: interrupts: [[0, 110, 4, 0], [0, 111, 4, 0], [0, 112, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: iommu@fdab9000: clocks: [[28, 287], [28, 276], [28, 278], [28, 288], [28, 277], [28, 279]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: iommu@fdab9000: clock-names:0: 'aclk' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: iommu@fdab9000: clock-names:1: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: iommu@fdab9000: clock-names: ['aclk0', 'aclk1', 'aclk2', 'iface0', 'iface1', 'iface2'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: iommu@fdab9000: power-domains: [[30, 9], [30, 10], [30, 11]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: iommu@fdab9000: 'interrupt-names', 'power-domain-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: audio-codec@11: 'clock-names', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: iommu@fdab9000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-iommu'] is too short
   	'rockchip,rk3588-iommu' is not one of ['rockchip,iommu', 'rockchip,rk3568-iommu']
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: iommu@fdab9000: reg: [[0, 4255879168, 0, 256], [0, 4255883264, 0, 256], [0, 4255948800, 0, 256], [0, 4256014336, 0, 256]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: iommu@fdab9000: interrupts: [[0, 110, 4, 0], [0, 111, 4, 0], [0, 112, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: iommu@fdab9000: clocks: [[28, 287], [28, 276], [28, 278], [28, 288], [28, 277], [28, 279]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: iommu@fdab9000: clock-names:0: 'aclk' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: iommu@fdab9000: clock-names:1: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: iommu@fdab9000: clock-names: ['aclk0', 'aclk1', 'aclk2', 'iface0', 'iface1', 'iface2'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: iommu@fdab9000: power-domains: [[30, 9], [30, 10], [30, 11]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: iommu@fdab9000: 'interrupt-names', 'power-domain-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: iommu@fdab9000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-iommu'] is too short
   	'rockchip,rk3588-iommu' is not one of ['rockchip,iommu', 'rockchip,rk3568-iommu']
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: iommu@fdab9000: reg: [[0, 4255879168, 0, 256], [0, 4255883264, 0, 256], [0, 4255948800, 0, 256], [0, 4256014336, 0, 256]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: iommu@fdab9000: interrupts: [[0, 110, 4, 0], [0, 111, 4, 0], [0, 112, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: iommu@fdab9000: clocks: [[28, 287], [28, 276], [28, 278], [28, 288], [28, 277], [28, 279]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: iommu@fdab9000: clock-names:0: 'aclk' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: iommu@fdab9000: clock-names:1: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: iommu@fdab9000: clock-names: ['aclk0', 'aclk1', 'aclk2', 'iface0', 'iface1', 'iface2'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: iommu@fdab9000: power-domains: [[30, 9], [30, 10], [30, 11]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: iommu@fdab9000: 'interrupt-names', 'power-domain-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: iommu@fdab9000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-iommu'] is too short
   	'rockchip,rk3588-iommu' is not one of ['rockchip,iommu', 'rockchip,rk3568-iommu']
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: iommu@fdab9000: reg: [[0, 4255879168, 0, 256], [0, 4255883264, 0, 256], [0, 4255948800, 0, 256], [0, 4256014336, 0, 256]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: iommu@fdab9000: interrupts: [[0, 110, 4, 0], [0, 111, 4, 0], [0, 112, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: iommu@fdab9000: clocks: [[28, 287], [28, 276], [28, 278], [28, 288], [28, 277], [28, 279]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: iommu@fdab9000: clock-names:0: 'aclk' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: iommu@fdab9000: clock-names:1: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: iommu@fdab9000: clock-names: ['aclk0', 'aclk1', 'aclk2', 'iface0', 'iface1', 'iface2'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: iommu@fdab9000: power-domains: [[30, 9], [30, 10], [30, 11]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: iommu@fdab9000: 'interrupt-names', 'power-domain-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: iommu@fdab9000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-iommu'] is too short
   	'rockchip,rk3588-iommu' is not one of ['rockchip,iommu', 'rockchip,rk3568-iommu']
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: iommu@fdab9000: reg: [[0, 4255879168, 0, 256], [0, 4255883264, 0, 256], [0, 4255948800, 0, 256], [0, 4256014336, 0, 256]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: iommu@fdab9000: interrupts: [[0, 110, 4, 0], [0, 111, 4, 0], [0, 112, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: iommu@fdab9000: clocks: [[28, 287], [28, 276], [28, 278], [28, 288], [28, 277], [28, 279]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: iommu@fdab9000: clock-names:0: 'aclk' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: iommu@fdab9000: clock-names:1: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: iommu@fdab9000: clock-names: ['aclk0', 'aclk1', 'aclk2', 'iface0', 'iface1', 'iface2'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: iommu@fdab9000: power-domains: [[30, 9], [30, 10], [30, 11]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: iommu@fdab9000: 'interrupt-names', 'power-domain-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: iommu@fdab9000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-iommu'] is too short
   	'rockchip,rk3588-iommu' is not one of ['rockchip,iommu', 'rockchip,rk3568-iommu']
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: iommu@fdab9000: reg: [[0, 4255879168, 0, 256], [0, 4255883264, 0, 256], [0, 4255948800, 0, 256], [0, 4256014336, 0, 256]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: iommu@fdab9000: interrupts: [[0, 110, 4, 0], [0, 111, 4, 0], [0, 112, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: iommu@fdab9000: clocks: [[28, 287], [28, 276], [28, 278], [28, 288], [28, 277], [28, 279]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: iommu@fdab9000: clock-names:0: 'aclk' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: iommu@fdab9000: clock-names:1: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: iommu@fdab9000: clock-names: ['aclk0', 'aclk1', 'aclk2', 'iface0', 'iface1', 'iface2'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: iommu@fdab9000: power-domains: [[30, 9], [30, 10], [30, 11]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: iommu@fdab9000: 'interrupt-names', 'power-domain-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: gpio-func: leds-gpio: {'rockchip,pins': [[0, 2, 0, 232]], 'phandle': [[241]]} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: iommu@fdab9000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-iommu'] is too short
   	'rockchip,rk3588-iommu' is not one of ['rockchip,iommu', 'rockchip,rk3568-iommu']
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: iommu@fdab9000: reg: [[0, 4255879168, 0, 256], [0, 4255883264, 0, 256], [0, 4255948800, 0, 256], [0, 4256014336, 0, 256]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: iommu@fdab9000: interrupts: [[0, 110, 4, 0], [0, 111, 4, 0], [0, 112, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: iommu@fdab9000: clocks: [[28, 287], [28, 276], [28, 278], [28, 288], [28, 277], [28, 279]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: iommu@fdab9000: clock-names:0: 'aclk' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: iommu@fdab9000: clock-names:1: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: iommu@fdab9000: clock-names: ['aclk0', 'aclk1', 'aclk2', 'iface0', 'iface1', 'iface2'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: iommu@fdab9000: power-domains: [[30, 9], [30, 10], [30, 11]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: iommu@fdab9000: 'interrupt-names', 'power-domain-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: vcc-3v3-sd-s0-regulator: Unevaluated properties are not allowed ('enable-active-low' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

