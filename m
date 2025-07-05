Return-Path: <linux-media+bounces-36875-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6717EAF9E1F
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 05:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED4984A8151
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 03:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51BC227510F;
	Sat,  5 Jul 2025 03:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TcDd7YFb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE742153E7;
	Sat,  5 Jul 2025 03:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751685917; cv=none; b=AB6Jq4Il1O7S0zpLW1RU2ZKlu9tY0lJtPvj34NbNTXvf7lvguK6Sj04nSIL4L1N/hpxdc9a/YaSrri/SJ111+a0rUo5nhEYEGz4oWOn++otMjLKxEatXskio34DoWTKeAAtgJ6S9nyOs7UnKqa2tUlvDTu04am9YYkTmDzLVvwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751685917; c=relaxed/simple;
	bh=ePHjkiaujlQ/aFTwTNMONgXRQjK/ZWSHeb+8CG7jjiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FruCgWSpu1n13mUBLofp3e0pnhKSm8akyDyg8ZUBYi7jD1k3SkVRFJFzBDeb+XvWu9UW6ve2Zse6O4nwlNbR8wNHVgTH22GUwqhNXxMNZZaaqOEhituzg33+ne59sKOHx1thHWBLEJv5BtijVJNwWPdk4aGAlojtLrUl5vdgJyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TcDd7YFb; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751685916; x=1783221916;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ePHjkiaujlQ/aFTwTNMONgXRQjK/ZWSHeb+8CG7jjiQ=;
  b=TcDd7YFbBa4/ePGwGZlhu+e0yTovACrKQNgOHo/kSAeauDZVMj2dtp9W
   diHmAb11aL3p2KQbd/vQBrhnTIbakGf/5M8pCVq9UQK/G4lxduz2SgOZX
   z1byFOkHZZ1XLYJZ2QxKITEvlt+d/jRckE+/CgwR+Y04UNXhbdkGvhdL+
   JDyDhVZt0PFoi23ki7f+kX+wPb+1lVQLUS9GeQRow3fPw3z+Hs8PjfcZf
   lT9Pp8C/9BY4fkCCj7FS4LN2MZndQiCfrg9xnHDCPqK45yn+yTkHBmGcy
   4S/oBhcP0DEmxCawjj/joJJ3FrdF9PeQf5cKsd0Loh8cN7dhghMjShCo5
   g==;
X-CSE-ConnectionGUID: DCj9ZkIBRW2yytaqfr7WTw==
X-CSE-MsgGUID: irPHGWg5QkOAfzKfeBzNdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="64601686"
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="64601686"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 20:25:15 -0700
X-CSE-ConnectionGUID: vQzO8Hf9Qha7uxcK95XNNw==
X-CSE-MsgGUID: rlvM3kbfSNC0Ztl/MCWfzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="159306901"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Jul 2025 20:25:12 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXtWX-0004FV-2k;
	Sat, 05 Jul 2025 03:25:09 +0000
Date: Sat, 5 Jul 2025 11:24:13 +0800
From: kernel test robot <lkp@intel.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	bryan.odonoghue@linaro.org, rfoss@kernel.org,
	konradybcio@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/6] media: qcom: camss: Add support for TFE (Spectra
 340)
Message-ID: <202507051109.lDPTfVhw-lkp@intel.com>
References: <20250704081537.1716613-2-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704081537.1716613-2-loic.poulain@oss.qualcomm.com>

Hi Loic,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.16-rc4 next-20250704]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Loic-Poulain/media-qcom-camss-Add-support-for-TFE-Spectra-340/20250704-163126
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250704081537.1716613-2-loic.poulain%40oss.qualcomm.com
patch subject: [PATCH v5 1/6] media: qcom: camss: Add support for TFE (Spectra 340)
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250705/202507051109.lDPTfVhw-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507051109.lDPTfVhw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507051109.lDPTfVhw-lkp@intel.com/

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

