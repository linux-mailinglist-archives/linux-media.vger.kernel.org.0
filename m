Return-Path: <linux-media+bounces-50802-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A75A3D257C0
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 16:49:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0CA453013C4A
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 15:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB0E13B8BC2;
	Thu, 15 Jan 2026 15:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mt20a8ba"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A5D374197;
	Thu, 15 Jan 2026 15:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768492157; cv=none; b=sFPvUocDduOYjIUBmgfB0sv6MHrQfjUtRtN+FNnvOfRhS/yieBTqYy7yNjU2hkFkvvD5RgURudSc4CM5mSJiEYwpFQphtFZNCWmfq9rfmwuArvu5MR6tLGkB+A8NHOZuLWUtObYA/C+1OQNcJn8VeeyzIHJoxLT87aeneJ5BLa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768492157; c=relaxed/simple;
	bh=c6otoexpBFc0bdrxPkcgwQlewejnD1J1LdNjPxMDb2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WY/Q18blJSfeJFPifiOe2TRnlIyKr1vhVfSnxukDqafDMV0YPJFJZzJrt64Y4uxvHNfE/TDaukIGgFJLLLD2c1XbK1XSHvo/upbLzViurp6LS3hRRVnJjHIjJEU2VF/aZ0SoAJIltcVjUYasMB7KOvesSt3joohecFuEjwhsY6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mt20a8ba; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768492156; x=1800028156;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c6otoexpBFc0bdrxPkcgwQlewejnD1J1LdNjPxMDb2U=;
  b=mt20a8baNtBzxLccpowomsfkZKkkaN6ld3N8JvCsh7znEZLKPXfwhqw1
   JxLGb2qtdBrb5W/qVIGP2Vj+454EPg6Mocy5iE3jhW/l0g+nDWMwhYUoV
   4k/RMrTEPTSuSO8/nPtmvsjBXAprqU5lpSq+vAFp+dhpdfS9QOOdghZL0
   xadkDMgvEPvjMoWJlCsb+f1xNs2PMtYAq0xPrFB54oTOZkux9BdcEP0qB
   gGTgmKJCQs/LgRL2dwgeyQlxyR6JG9uoiq7/thXQBAwYt3Qqt6Wo8P1P5
   PqVIvwA4CQXOWjhP5uHd6VDUTAM2uBkGJ+TGSRlccq1m5Oxca7IhZaHYP
   A==;
X-CSE-ConnectionGUID: ohgIBwcNSgqUhN2tjC9skw==
X-CSE-MsgGUID: HjE8w+SyQsa04b9x5Ou5cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80912492"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="80912492"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 07:49:15 -0800
X-CSE-ConnectionGUID: VHu8/1ikSNKM5qY1JBuPHg==
X-CSE-MsgGUID: GaUmVaxQRdK7Zxb+Lk8gpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="204190513"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Jan 2026 07:49:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgPav-00000000I9Y-2rox;
	Thu, 15 Jan 2026 15:49:09 +0000
Date: Thu, 15 Jan 2026 23:48:54 +0800
From: kernel test robot <lkp@intel.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: Re: [PATCH v8 3/3] media: qcom: camss: tpg: Add TPG support for
 multiple targets
Message-ID: <202601152315.fC7ckH9z-lkp@intel.com>
References: <20260113-camss_tpg-v8-3-fa2cb186a018@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113-camss_tpg-v8-3-fa2cb186a018@oss.qualcomm.com>

Hi Wenmeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on f417b7ffcbef7d76b0d8860518f50dae0e7e5eda]

url:    https://github.com/intel-lab-lkp/linux/commits/Wenmeng-Liu/media-qcom-camss-Add-common-TPG-support/20260113-171032
base:   f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
patch link:    https://lore.kernel.org/r/20260113-camss_tpg-v8-3-fa2cb186a018%40oss.qualcomm.com
patch subject: [PATCH v8 3/3] media: qcom: camss: tpg: Add TPG support for multiple targets
config: parisc-randconfig-002-20260115 (https://download.01.org/0day-ci/archive/20260115/202601152315.fC7ckH9z-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601152315.fC7ckH9z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601152315.fC7ckH9z-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/qcom/camss/camss-csid-680.c: In function '__csid_configure_rx':
>> drivers/media/platform/qcom/camss/camss-csid-680.c:202:32: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     202 |                         val |= FIELD_PREP(CSI2_RX_CFG0_TPG_NUM_SEL, phy->csiphy_id + 1);
         |                                ^~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/media/platform/qcom/camss/camss-csid-gen3.c: In function '__csid_configure_rx':
>> drivers/media/platform/qcom/camss/camss-csid-gen3.c:126:32: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     126 |                         val |= FIELD_PREP(CSI2_RX_CFG0_TPG_NUM_SEL, phy->csiphy_id + 1);
         |                                ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +202 drivers/media/platform/qcom/camss/camss-csid-680.c

   185	
   186	static void __csid_configure_rx(struct csid_device *csid,
   187					struct csid_phy_config *phy, int vc)
   188	{
   189		u32 val;
   190		struct camss *camss;
   191		struct tpg_device *tpg;
   192	
   193		camss = csid->camss;
   194		val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
   195		val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
   196		val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX) << CSI2_RX_CFG0_PHY_NUM_SEL;
   197	
   198		if (camss->tpg) {
   199			tpg = &camss->tpg[phy->csiphy_id];
   200	
   201			if (csid->tpg_linked && tpg->testgen.mode > 0) {
 > 202				val |= FIELD_PREP(CSI2_RX_CFG0_TPG_NUM_SEL, phy->csiphy_id + 1);
   203				val |= CSI2_RX_CFG0_TPG_NUM_EN;
   204			}
   205		}
   206	
   207		writel(val, csid->base + CSID_CSI2_RX_CFG0);
   208	
   209		val = CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
   210		if (vc > 3)
   211			val |= CSI2_RX_CFG1_VC_MODE;
   212		writel(val, csid->base + CSID_CSI2_RX_CFG1);
   213	}
   214	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

