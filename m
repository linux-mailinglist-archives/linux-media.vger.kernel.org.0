Return-Path: <linux-media+bounces-28638-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6314A6DD03
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 15:31:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E394316EF9E
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 14:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3CC326136E;
	Mon, 24 Mar 2025 14:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DzZ7Od81"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA7925F970;
	Mon, 24 Mar 2025 14:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742826564; cv=none; b=kaJj+k3C+atVS9yL66Ff9Yec21U2MvkeAuE5Mtm3gpE1pZfIsXAeBa8FRO5oR9C6kJZ6zPGX5/yCQhTu/3JKaSGKWrXTymtmKL8dHBQ2CapmB2WiaRUsh3nE+cOm1K8e6mSEB2rirU4iehe71TCB52o2ezyyOppM47VRLlRy1wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742826564; c=relaxed/simple;
	bh=IrJCE533bpLX0w710o4ZD6QiLFPV4AKCegDXn9WCy2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dLpJE5xARA1ISXpanwQAwlA5DswTuF++S0YF/Av3AAtmZTqfwuC/RlwRVCQYTiJqc+VYXwEX/kmAYFBTu3gqk9ItVb4hz+y72zEp75ZIzj2lnKi40I/bJfUXr8yIFOG3rn0JKjVi+UYHVFyrNQ2zb5JrvuxKpO5seA88Rwzpx7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DzZ7Od81; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742826562; x=1774362562;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IrJCE533bpLX0w710o4ZD6QiLFPV4AKCegDXn9WCy2w=;
  b=DzZ7Od81Wa7tqulYy/fVE4iURe9fMTPKOvgV9wCToEuTDn0IRmU4tN7/
   wwJYz70P/4kizqoTKONUAIhQh9+YRG3MVszNacOP905cGwZp/BEelSdZU
   A0EFXXQ06ABNIFOkJtXldQ4z/Rn0uAOuucO0ObO+JhxxyE+lhooiGdCcd
   2yiGBUptHCJIhqc16tgWOlSPEtIpDgrp6GfzttZE/tZk05qnaVQHy1e5N
   JhUaiPdJ2pf7AU7VtNtiClIu3XwviTP7OkZLsrBxZwZbJ4S4yxD3hJIho
   euT0mi95Vwsss7T0J+r+RDvO1WSVhBXDd5j4V63lzgefgS2A93DT8y8AP
   w==;
X-CSE-ConnectionGUID: 68UDhLPVQK2owMr2NwNUZg==
X-CSE-MsgGUID: MRb+8PjTSDeiRJKyhhtHEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="54698028"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; 
   d="scan'208";a="54698028"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 07:29:22 -0700
X-CSE-ConnectionGUID: xBm2a4uAQY2zH91q2+uYzA==
X-CSE-MsgGUID: gmRyu11+Ts+9epruHOkTUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; 
   d="scan'208";a="129256485"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 24 Mar 2025 07:29:19 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twinj-0003fR-1z;
	Mon, 24 Mar 2025 14:29:15 +0000
Date: Mon, 24 Mar 2025 22:28:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>,
	Jai Luthra <jai.luthra@linux.dev>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>,
	Vaishnav Achath <vaishnav.a@ti.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] media: cadence: cdns-csi2rx: Support multiple pixels
 per clock cycle
Message-ID: <202503242153.Yn1DfnS5-lkp@intel.com>
References: <20250324-probe_fixes-v1-5-5cd5b9e1cfac@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324-probe_fixes-v1-5-5cd5b9e1cfac@ideasonboard.com>

Hi Jai,

kernel test robot noticed the following build errors:

[auto build test ERROR on 586de92313fcab8ed84ac5f78f4d2aae2db92c59]

url:    https://github.com/intel-lab-lkp/linux/commits/Jai-Luthra/media-ti-j721e-csi2rx-Use-devm_of_platform_populate/20250324-200457
base:   586de92313fcab8ed84ac5f78f4d2aae2db92c59
patch link:    https://lore.kernel.org/r/20250324-probe_fixes-v1-5-5cd5b9e1cfac%40ideasonboard.com
patch subject: [PATCH 5/6] media: cadence: cdns-csi2rx: Support multiple pixels per clock cycle
config: hexagon-randconfig-001-20250324 (https://download.01.org/0day-ci/archive/20250324/202503242153.Yn1DfnS5-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250324/202503242153.Yn1DfnS5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503242153.Yn1DfnS5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/cadence/cdns-csi2rx.c:286:10: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     286 |                 reg |= FIELD_PREP(CSI2RX_STREAM_CFG_NUM_PIXELS_MASK,
         |                        ^
   1 error generated.


vim +/FIELD_PREP +286 drivers/media/platform/cadence/cdns-csi2rx.c

   214	
   215	static int csi2rx_start(struct csi2rx_priv *csi2rx)
   216	{
   217		unsigned int i;
   218		unsigned long lanes_used = 0;
   219		u32 reg;
   220		int ret;
   221	
   222		ret = clk_prepare_enable(csi2rx->p_clk);
   223		if (ret)
   224			return ret;
   225	
   226		reset_control_deassert(csi2rx->p_rst);
   227		csi2rx_reset(csi2rx);
   228	
   229		reg = csi2rx->num_lanes << 8;
   230		for (i = 0; i < csi2rx->num_lanes; i++) {
   231			reg |= CSI2RX_STATIC_CFG_DLANE_MAP(i, csi2rx->lanes[i]);
   232			set_bit(csi2rx->lanes[i], &lanes_used);
   233		}
   234	
   235		/*
   236		 * Even the unused lanes need to be mapped. In order to avoid
   237		 * to map twice to the same physical lane, keep the lanes used
   238		 * in the previous loop, and only map unused physical lanes to
   239		 * the rest of our logical lanes.
   240		 */
   241		for (i = csi2rx->num_lanes; i < csi2rx->max_lanes; i++) {
   242			unsigned int idx = find_first_zero_bit(&lanes_used,
   243							       csi2rx->max_lanes);
   244			set_bit(idx, &lanes_used);
   245			reg |= CSI2RX_STATIC_CFG_DLANE_MAP(i, i + 1);
   246		}
   247	
   248		writel(reg, csi2rx->base + CSI2RX_STATIC_CFG_REG);
   249	
   250		/* Enable DPHY clk and data lanes. */
   251		if (csi2rx->dphy) {
   252			reg = CSI2RX_DPHY_CL_EN | CSI2RX_DPHY_CL_RST;
   253			for (i = 0; i < csi2rx->num_lanes; i++) {
   254				reg |= CSI2RX_DPHY_DL_EN(csi2rx->lanes[i] - 1);
   255				reg |= CSI2RX_DPHY_DL_RST(csi2rx->lanes[i] - 1);
   256			}
   257	
   258			writel(reg, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
   259	
   260			ret = csi2rx_configure_ext_dphy(csi2rx);
   261			if (ret) {
   262				dev_err(csi2rx->dev,
   263					"Failed to configure external DPHY: %d\n", ret);
   264				goto err_disable_pclk;
   265			}
   266		}
   267	
   268		/*
   269		 * Create a static mapping between the CSI virtual channels
   270		 * and the output stream.
   271		 *
   272		 * This should be enhanced, but v4l2 lacks the support for
   273		 * changing that mapping dynamically.
   274		 *
   275		 * We also cannot enable and disable independent streams here,
   276		 * hence the reference counting.
   277		 */
   278		for (i = 0; i < csi2rx->max_streams; i++) {
   279			ret = clk_prepare_enable(csi2rx->pixel_clk[i]);
   280			if (ret)
   281				goto err_disable_pixclk;
   282	
   283			reset_control_deassert(csi2rx->pixel_rst[i]);
   284	
   285			reg = CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF;
 > 286			reg |= FIELD_PREP(CSI2RX_STREAM_CFG_NUM_PIXELS_MASK,
   287					  csi2rx->num_pixels[i]);
   288			writel(reg, csi2rx->base + CSI2RX_STREAM_CFG_REG(i));
   289	
   290			/*
   291			 * Enable one virtual channel. When multiple virtual channels
   292			 * are supported this will have to be changed.
   293			 */
   294			writel(CSI2RX_STREAM_DATA_CFG_VC_SELECT(0),
   295			       csi2rx->base + CSI2RX_STREAM_DATA_CFG_REG(i));
   296	
   297			writel(CSI2RX_STREAM_CTRL_START,
   298			       csi2rx->base + CSI2RX_STREAM_CTRL_REG(i));
   299		}
   300	
   301		ret = clk_prepare_enable(csi2rx->sys_clk);
   302		if (ret)
   303			goto err_disable_pixclk;
   304	
   305		reset_control_deassert(csi2rx->sys_rst);
   306	
   307		ret = v4l2_subdev_call(csi2rx->source_subdev, video, s_stream, true);
   308		if (ret)
   309			goto err_disable_sysclk;
   310	
   311		clk_disable_unprepare(csi2rx->p_clk);
   312	
   313		return 0;
   314	
   315	err_disable_sysclk:
   316		clk_disable_unprepare(csi2rx->sys_clk);
   317	err_disable_pixclk:
   318		for (; i > 0; i--) {
   319			reset_control_assert(csi2rx->pixel_rst[i - 1]);
   320			clk_disable_unprepare(csi2rx->pixel_clk[i - 1]);
   321		}
   322	
   323		if (csi2rx->dphy) {
   324			writel(0, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
   325			phy_power_off(csi2rx->dphy);
   326		}
   327	err_disable_pclk:
   328		clk_disable_unprepare(csi2rx->p_clk);
   329	
   330		return ret;
   331	}
   332	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

