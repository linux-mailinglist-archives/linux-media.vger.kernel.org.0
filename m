Return-Path: <linux-media+bounces-56634-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLVbH78cwGmADwQAu9opvQ
	(envelope-from <linux-media+bounces-56634-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 17:45:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E226D2EA0C9
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 17:45:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D086C3014127
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 16:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC0AD1D86DC;
	Sun, 22 Mar 2026 16:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JTt2yoTE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C6E1B7F4;
	Sun, 22 Mar 2026 16:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774197930; cv=none; b=WIxWxxNGt5RMFLpJPNhXu+aXGfWwed9qYZKVdE0eZCuqM/vxRX+fW8zRZBVtTOiaWxvCVRTt+hKtGnRBUNS3LlbHMCBaNJer/odoU5Y8FiXkJguZD40bYIgrJ1u2pDWeN63vwtAO6fCdR6fgXzng7MdlQRKrbQe4TESY/gVfFuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774197930; c=relaxed/simple;
	bh=rGui68uRyg3X6940x/LNfy9+wopMGRcwkbytlfYAgxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TPKLnKQunWu+Ny6Gqhlt21SBEr5CQFMzrnefV7o4apZ5bTB+5JQbev/gsnZsC7MehIO4++Xd5NzkJ3ec4dh6fZ625awClF0qtHIGt1hSBUUqXo5S2jqpYJoyFbKi3jwftnv8MoKW6RAcjNynI2DeqyUSjOqg1IP5pC/OgCXEJ0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JTt2yoTE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774197928; x=1805733928;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rGui68uRyg3X6940x/LNfy9+wopMGRcwkbytlfYAgxw=;
  b=JTt2yoTEF1tfhimmHIYOi4XifOVlwDi9bD1UmO8Sogr59nrqSaUShJwo
   /krxCRhJbV2cKqdPo8X4UW+O1wyxLBdqXTzvTzA6iF5tEAtECx+kmkNvK
   SQ723DZ7SvVIlT9eFALDqcBh4af6knmsyZY/WhAJV6KL+QXRl32qwXz/3
   KAznhBXWxTETZjWipuzfaMGCT+UdNsGhsw+5p7utvP89xA/zcAEyJK4ko
   cv4ZCGfxR+z23fnPlAfXVRhvTd+/AJN/fFFZVqMYnqlab19E/v1qb2bFv
   h7+4QJMiJumkiYltJFMj2jLlnvQpp7nsYNh12Wvawyabehq9MZioy4yXt
   A==;
X-CSE-ConnectionGUID: jVlBpbanRv2P+rAUA2BJ5g==
X-CSE-MsgGUID: /r2PNZW+Ql6ySqMypL+spg==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75118685"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="75118685"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 09:45:27 -0700
X-CSE-ConnectionGUID: SXflohIkSweq+msEphRqWA==
X-CSE-MsgGUID: AuNdDOZfQ2a4F3et6wkiZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="246829831"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Mar 2026 09:45:24 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4LvK-000000002Of-3ofZ;
	Sun, 22 Mar 2026 16:45:12 +0000
Date: Mon, 23 Mar 2026 00:44:13 +0800
From: kernel test robot <lkp@intel.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
Message-ID: <202603230048.ZxbvVL5L-lkp@intel.com>
References: <20260315-x1e-csi2-phy-v4-2-90c09203888d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260315-x1e-csi2-phy-v4-2-90c09203888d@linaro.org>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[sea.lore.kernel.org:server fail,01.org:server fail,intel.com:server fail];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56634-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E226D2EA0C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bryan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c824345288d11e269ce41b36c105715bc2286050]

url:    https://github.com/intel-lab-lkp/linux/commits/Bryan-O-Donoghue/dt-bindings-phy-qcom-Add-CSI2-C-PHY-DPHY-schema/20260316-081353
base:   c824345288d11e269ce41b36c105715bc2286050
patch link:    https://lore.kernel.org/r/20260315-x1e-csi2-phy-v4-2-90c09203888d%40linaro.org
patch subject: [PATCH v4 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260323/202603230048.ZxbvVL5L-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603230048.ZxbvVL5L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603230048.ZxbvVL5L-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c: In function 'phy_qcom_mipi_csi2_power_off':
>> drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c:153:13: warning: unused variable 'i' [-Wunused-variable]
     153 |         int i;
         |             ^


vim +/i +153 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c

   149	
   150	static int phy_qcom_mipi_csi2_power_off(struct phy *phy)
   151	{
   152		struct mipi_csi2phy_device *csi2phy = phy_get_drvdata(phy);
 > 153		int i;
   154	
   155		for (int i = 0; i < csi2phy->num_pds; i++)
   156			dev_pm_genpd_set_performance_state(csi2phy->pds[i], 0);
   157	
   158		clk_bulk_disable_unprepare(csi2phy->soc_cfg->num_clk,
   159					   csi2phy->clks);
   160		regulator_bulk_disable(csi2phy->soc_cfg->num_supplies,
   161				       csi2phy->supplies);
   162	
   163		return 0;
   164	}
   165	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

