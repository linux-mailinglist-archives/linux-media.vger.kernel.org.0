Return-Path: <linux-media+bounces-11819-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A61B08CD312
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 15:01:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D258284B23
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 13:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 079B114B95B;
	Thu, 23 May 2024 13:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ex7ZT8su"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248A913BAE3;
	Thu, 23 May 2024 13:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716469218; cv=none; b=YcFrfGc/FZFlYRC/FpFvw9yMp4ATj7bLrnhtDR3Bf5cam325/JxMKhsAJClr2hyNaGf74Lbt7wox6zkdMTo4i/bF8LaXYyXUN4Hb+GTzSoAoDa2kO+UUn//uoPfwdX8v/NMWP7iAvMkuHPYZfboGYRjqV09BUbLtXaseEzMWz/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716469218; c=relaxed/simple;
	bh=eECP6Yl5qljboD/2npHrTM8NDdSUI8g6M2Vy1RhPVZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CdwwoMox2rTDs1AuIwwMAKA36NKmaFJbS3Try0bPHJZib+WfPz8PMcm0EDWM7GHtNEWuOzYM8fbGxetpc6ujtfwQTpZmW6Xz+C5MRHZYPnXKNl0LM1HEhOfF3xmyqn+/vgjcagPr1/b2tClnCIXcwnv45igDmwC60d18EaeSJAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ex7ZT8su; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716469216; x=1748005216;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eECP6Yl5qljboD/2npHrTM8NDdSUI8g6M2Vy1RhPVZE=;
  b=ex7ZT8suH1KUXxVWaU2ygBrpTTtdB8c1hIGnFYRDwN7oWWaxy2QaBpxj
   JcWKndYoW14cqZNchl+kAUOhkvFcZKixR7wIVijwd5zhAWaccaysgmrRi
   RAZdjnrFKubuY7SwLcH33onAzRjM3X26jVnNn+ibn/O8p9zQBKQA6mW/7
   IMjpDKabJtmr4FvMUt3FX/ran1/5zr6m1vv9+oercY+lKwZ5pT8O/9xzD
   FwZ+HtayGf3kfyWnOg1jkUVjQXt+ERenj+dWEIWBlyhB1+U3wW+w0lvWs
   SIgZbI2kUgP/Cab5ctvUHPrNNucO+uHp6i+iR3tRwpTnKVSe58UWAvjPk
   w==;
X-CSE-ConnectionGUID: YZGYado8RfusCRpELeYgNQ==
X-CSE-MsgGUID: C8aBLgmHRiSQO1pZoQgtBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="24190301"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="24190301"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 06:00:14 -0700
X-CSE-ConnectionGUID: ac2UTFdsSCia8fxsvOVeTA==
X-CSE-MsgGUID: HShjLEaxRAO6Nkal5VRSwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="38056657"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 23 May 2024 06:00:11 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sA83F-0002sv-0B;
	Thu, 23 May 2024 13:00:09 +0000
Date: Thu, 23 May 2024 20:59:37 +0800
From: kernel test robot <lkp@intel.com>
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
	todor.too@gmail.com, bryan.odonoghue@linaro.org,
	andersson@kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
	quic_hariramp@quicinc.com
Subject: Re: [PATCH v4 6/8] media: qcom: camss: Split testgen, RDI and RX for
 CSID 170
Message-ID: <202405232059.8lLokYw2-lkp@intel.com>
References: <20240522154659.510-7-quic_grosikop@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240522154659.510-7-quic_grosikop@quicinc.com>

Hi Gjorgji,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linus/master next-20240523]
[cannot apply to v6.9]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gjorgji-Rosikopulos/media-qcom-camss-Add-per-sub-device-type-resources/20240522-235220
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20240522154659.510-7-quic_grosikop%40quicinc.com
patch subject: [PATCH v4 6/8] media: qcom: camss: Split testgen, RDI and RX for CSID 170
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240523/202405232059.8lLokYw2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240523/202405232059.8lLokYw2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405232059.8lLokYw2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/qcom/camss/camss-csid-gen2.c: In function '__csid_configure_rdi_stream':
>> drivers/media/platform/qcom/camss/camss-csid-gen2.c:265:13: warning: variable 'phy_sel' set but not used [-Wunused-but-set-variable]
     265 |         u32 phy_sel = 0;
         |             ^~~~~~~


vim +/phy_sel +265 drivers/media/platform/qcom/camss/camss-csid-gen2.c

   260	
   261	static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 vc)
   262	{
   263		struct csid_testgen_config *tg = &csid->testgen;
   264		u32 val;
 > 265		u32 phy_sel = 0;
   266		/* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, Pad 2 -> RDI1, etc. */
   267		struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc];
   268		const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
   269									   csid->res->formats->nformats,
   270									   input_format->code);
   271	
   272		if (!tg->enabled)
   273			phy_sel = csid->phy.csiphy_id;
   274	
   275		/*
   276		 * DT_ID is a two bit bitfield that is concatenated with
   277		 * the four least significant bits of the five bit VC
   278		 * bitfield to generate an internal CID value.
   279		 *
   280		 * CSID_RDI_CFG0(vc)
   281		 * DT_ID : 28:27
   282		 * VC    : 26:22
   283		 * DT    : 21:16
   284		 *
   285		 * CID   : VC 3:0 << 2 | DT_ID 1:0
   286		 */
   287		u8 dt_id = vc & 0x03;
   288	
   289		val = 1 << RDI_CFG0_BYTE_CNTR_EN;
   290		val |= 1 << RDI_CFG0_FORMAT_MEASURE_EN;
   291		val |= 1 << RDI_CFG0_TIMESTAMP_EN;
   292		/* note: for non-RDI path, this should be format->decode_format */
   293		val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
   294		val |= format->data_type << RDI_CFG0_DATA_TYPE;
   295		val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
   296		val |= dt_id << RDI_CFG0_DT_ID;
   297		writel_relaxed(val, csid->base + CSID_RDI_CFG0(vc));
   298	
   299		/* CSID_TIMESTAMP_STB_POST_IRQ */
   300		val = 2 << RDI_CFG1_TIMESTAMP_STB_SEL;
   301		writel_relaxed(val, csid->base + CSID_RDI_CFG1(vc));
   302	
   303		val = 1;
   304		writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP_PERIOD(vc));
   305	
   306		val = 0;
   307		writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP_PATTERN(vc));
   308	
   309		val = 1;
   310		writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(vc));
   311	
   312		val = 0;
   313		writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(vc));
   314	
   315		val = 1;
   316		writel_relaxed(val, csid->base + CSID_RDI_RPP_PIX_DROP_PERIOD(vc));
   317	
   318		val = 0;
   319		writel_relaxed(val, csid->base + CSID_RDI_RPP_PIX_DROP_PATTERN(vc));
   320	
   321		val = 1;
   322		writel_relaxed(val, csid->base + CSID_RDI_RPP_LINE_DROP_PERIOD(vc));
   323	
   324		val = 0;
   325		writel_relaxed(val, csid->base + CSID_RDI_RPP_LINE_DROP_PATTERN(vc));
   326	
   327		val = 0;
   328		writel_relaxed(val, csid->base + CSID_RDI_CTRL(vc));
   329	
   330		val = readl_relaxed(csid->base + CSID_RDI_CFG0(vc));
   331		val |=  enable << RDI_CFG0_ENABLE;
   332		writel_relaxed(val, csid->base + CSID_RDI_CFG0(vc));
   333	}
   334	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

