Return-Path: <linux-media+bounces-42133-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F61B5056C
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 20:35:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11CA73B6BC6
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 18:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E50274B4D;
	Tue,  9 Sep 2025 18:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="krA0gL++"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD54224BCE8
	for <linux-media@vger.kernel.org>; Tue,  9 Sep 2025 18:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757442927; cv=none; b=Xs9lXrxdYGwNse8Y0ppu0jG9I0R0ufRBa+uui067/nyCITDrf1IDrjVuKbHtlEHQuy8LPr8Q/ihViJaUj7k3Go04AQRNuucpE/sMea83jSoWw17d/GbTDFKOsUpVmAg9nahGkhI9QSUsr9eh5DSnKHBA645alIg9t9kOQt7Nhpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757442927; c=relaxed/simple;
	bh=owOjEvSUqhYxWUGwns+Pu2QmlSYEwlSNCSUwleRViPU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dXkhiHzJttLcPhUmu68rRxx2HoCgCcN+1alX3+1fX0JyyxSeAsF/ixbqEEOgusvLS57MSZRpTQoQmJHGfkAl7EeNN6zWtkiV0HUQ2DauP2YxXIcZGLrKOciMD1ofgMp5K5WYB4jbyVDwWW6Ka9JgX7M+V4Vv/659u8N77P5Zf2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=krA0gL++; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757442924; x=1788978924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=owOjEvSUqhYxWUGwns+Pu2QmlSYEwlSNCSUwleRViPU=;
  b=krA0gL++lWR62/2iZ8ejLTX8/D2unc5NuRxu4WzQV9l1rFSUnndo9/PH
   +BFXv3EmawK3VAtFyBK6xHZUKsMAjEvxaZt0vk6SKB1YE0KPEf8MSRRnO
   I7JgyI1Ic8DysJWmLBs/5+4Av6Z/S4miVkuVFgmPJc66wMOZQuYLOVo+V
   7nWh7WOO6iFGLYc55IkcSxtC3eR/l/fyKO2eDVAcmD9SOJF3MxfiR32c3
   I6meRmCWxdNoYNFMr0bp1g6RDAaSm0+KvG0FF4CyKm9TQkePAEugzp4fN
   oa1tTt/cpGwirWGVZRJ7XwEbcz1iiOO1RSxJ49dBR9Nr9zHssTyOTCEb3
   g==;
X-CSE-ConnectionGUID: 1hCDhkipS+SirujPITfLig==
X-CSE-MsgGUID: XcRIpyMIQuSV8mEjP1HQHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="63569867"
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; 
   d="scan'208";a="63569867"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 11:35:24 -0700
X-CSE-ConnectionGUID: /f+lrVe/RHKTLUpSZ1FSuw==
X-CSE-MsgGUID: TAb7yJo4S4+xANFndvz91g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; 
   d="scan'208";a="173957922"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Sep 2025 11:35:22 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uw3BY-0005B3-18;
	Tue, 09 Sep 2025 18:35:20 +0000
Date: Wed, 10 Sep 2025 02:35:13 +0800
From: kernel test robot <lkp@intel.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [linuxtv-media-pending:next 102/122]
 drivers/media/platform/qcom/camss/camss-vfe-340.c:186:21: error: call to
 undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202509100228.xLeeYzpG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.linuxtv.org/media-ci/media-pending.git next
head:   39d919edea1dd9c254a10b36deeafdbe0c2b813c
commit: b5e67bd1da323f125dd490d26948a2810b90e181 [102/122] media: qcom: camss: Add support for TFE (Spectra 340)
config: hexagon-randconfig-002-20250910 (https://download.01.org/0day-ci/archive/20250910/202509100228.xLeeYzpG-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7fb1dc08d2f025aad5777bb779dfac1197e9ef87)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250910/202509100228.xLeeYzpG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509100228.xLeeYzpG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/qcom/camss/camss-vfe-340.c:186:21: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     186 |                         if (bus_status & TFE_BUS_IRQ_MASK_RUP_DONE(i))
         |                                          ^
   drivers/media/platform/qcom/camss/camss-vfe-340.c:36:40: note: expanded from macro 'TFE_BUS_IRQ_MASK_RUP_DONE'
      36 | #define         TFE_BUS_IRQ_MASK_RUP_DONE(sc)   FIELD_PREP(TFE_BUS_IRQ_MASK_RUP_DONE_MASK, BIT(sc))
         |                                                 ^
   drivers/media/platform/qcom/camss/camss-vfe-340.c:191:21: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     191 |                         if (bus_status & TFE_BUS_IRQ_MASK_BUF_DONE(i))
         |                                          ^
   drivers/media/platform/qcom/camss/camss-vfe-340.c:38:40: note: expanded from macro 'TFE_BUS_IRQ_MASK_BUF_DONE'
      38 | #define         TFE_BUS_IRQ_MASK_BUF_DONE(sg)   FIELD_PREP(TFE_BUS_IRQ_MASK_BUF_DONE_MASK, BIT(sg))
         |                                                 ^
   2 errors generated.


vim +/FIELD_PREP +186 drivers/media/platform/qcom/camss/camss-vfe-340.c

   163	
   164	static irqreturn_t vfe_isr(int irq, void *dev)
   165	{
   166		struct vfe_device *vfe = dev;
   167		u32 status;
   168		int i;
   169	
   170		status = readl_relaxed(vfe->base + TFE_IRQ_STATUS_0);
   171		writel_relaxed(status, vfe->base + TFE_IRQ_CLEAR_0);
   172		writel_relaxed(TFE_IRQ_CMD_CLEAR, vfe->base + TFE_IRQ_CMD);
   173	
   174		if (status & TFE_IRQ_MASK_0_RST_DONE) {
   175			dev_dbg(vfe->camss->dev, "VFE%u: Reset done!", vfe->id);
   176			vfe_isr_reset_ack(vfe);
   177		}
   178	
   179		if (status & TFE_IRQ_MASK_0_BUS_WR) {
   180			u32 bus_status = readl_relaxed(vfe->base + TFE_BUS_IRQ_STATUS_0);
   181	
   182			writel_relaxed(bus_status, vfe->base + TFE_BUS_IRQ_CLEAR_0);
   183			writel_relaxed(TFE_BUS_IRQ_CMD_CLEAR, vfe->base + TFE_BUS_IRQ_CMD);
   184	
   185			for (i = 0; i < TFE_IFACE_NUM; i++) {
 > 186				if (bus_status & TFE_BUS_IRQ_MASK_RUP_DONE(i))
   187					vfe->res->hw_ops->reg_update_clear(vfe, __iface_to_line(i));
   188			}
   189	
   190			for (i = 0; i < TFE_SUBGROUP_NUM; i++) {
   191				if (bus_status & TFE_BUS_IRQ_MASK_BUF_DONE(i))
   192					vfe_buf_done(vfe, __subgroup_to_line(i));
   193			}
   194	
   195			if (bus_status & TFE_BUS_IRQ_MASK_0_CONS_VIOL)
   196				dev_err_ratelimited(vfe->camss->dev, "VFE%u: Bad config violation",
   197						    vfe->id);
   198	
   199			if (bus_status & TFE_BUS_IRQ_MASK_0_VIOL)
   200				dev_err_ratelimited(vfe->camss->dev, "VFE%u: Input data violation",
   201						    vfe->id);
   202	
   203			if (bus_status & TFE_BUS_IRQ_MASK_0_IMG_VIOL)
   204				dev_err_ratelimited(vfe->camss->dev, "VFE%u: Image size violation",
   205						    vfe->id);
   206		}
   207	
   208		status = readl_relaxed(vfe->base + TFE_BUS_OVERFLOW_STATUS);
   209		if (status) {
   210			writel_relaxed(status, vfe->base + TFE_BUS_STATUS_CLEAR);
   211			for (i = 0; i < TFE_WM_NUM; i++) {
   212				if (status & BIT(i))
   213					dev_err_ratelimited(vfe->camss->dev,
   214							    "VFE%u: bus overflow for wm %u\n",
   215							    vfe->id, i);
   216			}
   217		}
   218	
   219		return IRQ_HANDLED;
   220	}
   221	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

