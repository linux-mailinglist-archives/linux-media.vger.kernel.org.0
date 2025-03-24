Return-Path: <linux-media+bounces-28644-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12149A6E233
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 19:22:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E4EA188CB3A
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 18:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D665F264A75;
	Mon, 24 Mar 2025 18:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EO7pkUX5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC1E2641D7;
	Mon, 24 Mar 2025 18:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742840531; cv=none; b=EOzbm1MlquVv1Z2bM1XYmov3yt9cmqDIQmzs2NNr311M5yS/nE/QQ5xkoKuypOuhNpOoariaQEdtTn0crxNfuSBKoKoANl/XCksCWDQwKDvNL8HtSmmIdoLWntRGOYZR9dFDIhHzeCn9P6YwOd5Aw4hF7I0jQoMD+voVIklK9Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742840531; c=relaxed/simple;
	bh=Vp9Vb+EnT3y9QyflxOjJ4zdpm+Iip8GTmt0L7VxcHDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hgnXFz1DHalmdRtVoLQBHpcTmnCZHJhUY2BfGkXJ31eqDXkrW9JY1S0/8rW4ZOyXgjbVKhauyPphauYCPeSTT+JIN/S3aEgRbif+ACzKkpsyHogXU4reVn/imeEGyw9JSqqxvy597rxfG6z+dp1yxXqt2shvVehtM0/4iN4fR8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EO7pkUX5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742840529; x=1774376529;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vp9Vb+EnT3y9QyflxOjJ4zdpm+Iip8GTmt0L7VxcHDQ=;
  b=EO7pkUX5jt4XQOrMiQhV0TV7V1xNfPwHYU6JU6ib9VPybCX+prTDWcU3
   W6As0bKjEbzi0EnObdaSwcU/RC5vgDbuz5P1XDbHFTw1N00WnUyfTMr5L
   jcLK9X8oAUHgowdep+0g6byCf4KXXtLGB5QPFMyjhXVf9of9iGELPGtgE
   TSX9lR3LLL38hoeLNcEJsN4F5jXGaWgZSYYCfIeUpBruJg4NnjMzDOBAb
   dc18lzVOFTGvX8PJWj4zD/kheMEWmh20mIKbwJA4nOFvlxolziwAiXfb/
   ggjGf5WJs62uSXMv8FaQUrlGbLWFhRuALXVVAnqmAm0ffKaziOp2uom7n
   A==;
X-CSE-ConnectionGUID: JiBgetHIQmCoTK8xO5hyMA==
X-CSE-MsgGUID: YmuNQt34Q/2EU4CO85NYkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="47937432"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; 
   d="scan'208";a="47937432"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 11:21:52 -0700
X-CSE-ConnectionGUID: XiLhMqERQseZujl4hhWaZg==
X-CSE-MsgGUID: R/BwO3NIQ+CrgRHxCeMTjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; 
   d="scan'208";a="129322151"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 24 Mar 2025 11:21:49 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twmQk-0003rR-1n;
	Mon, 24 Mar 2025 18:21:46 +0000
Date: Tue, 25 Mar 2025 02:21:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>,
	Jai Luthra <jai.luthra@linux.dev>,
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
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] media: cadence: cdns-csi2rx: Support multiple pixels
 per clock cycle
Message-ID: <202503250056.MfBrAipQ-lkp@intel.com>
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
config: sparc-randconfig-002-20250324 (https://download.01.org/0day-ci/archive/20250325/202503250056.MfBrAipQ-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250325/202503250056.MfBrAipQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503250056.MfBrAipQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/cadence/cdns-csi2rx.c: In function 'csi2rx_start':
>> drivers/media/platform/cadence/cdns-csi2rx.c:286:24: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     286 |                 reg |= FIELD_PREP(CSI2RX_STREAM_CFG_NUM_PIXELS_MASK,
         |                        ^~~~~~~~~~
   cc1: some warnings being treated as errors


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

