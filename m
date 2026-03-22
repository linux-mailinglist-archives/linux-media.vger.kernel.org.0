Return-Path: <linux-media+bounces-56647-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WA+5IGV8wGmlIAQAu9opvQ
	(envelope-from <linux-media+bounces-56647-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 00:33:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E582EB265
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 00:33:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 37979300AECD
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 23:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DB82346E7D;
	Sun, 22 Mar 2026 23:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jhvKPZt3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3644136672;
	Sun, 22 Mar 2026 23:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774222424; cv=none; b=M6TlntEjXdUcHpqUrf2Rayu1lrZ22PhzPbyw0Jcgkuzgw5EwCd39sksJRoi22iqDoGoZ3XwfKaPdPFJ5mBYlze+nrVi8k/UOlodQVNO4v7p/6Gf1fkh4+hEQPcS3SdHchGCuVIa+oNHhBrAl9YiVIOwHY6Ka5kaIxo3S7DSZr9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774222424; c=relaxed/simple;
	bh=Iyq/kR8m/ROKeqOrN3lBBgrhZ0QikXX9ty57LXSzHu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Viy27kS7bz3wjkEDa0ncnGFi8+E0E6S1+2NbOZfD6dphSp/CkPiFhGPgLO7oC/IO5zj8obY0j222R6ezDHqn+WBRgcq6XH7ujBVs4RfRuQZzIGKfs0kCyhoFj2N4NJ47OWSSFvHPq3JKPHVY7qMbrQFxu39vtL+MQBrEc/f0GtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jhvKPZt3; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774222422; x=1805758422;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Iyq/kR8m/ROKeqOrN3lBBgrhZ0QikXX9ty57LXSzHu0=;
  b=jhvKPZt3TN5WA4MRJ2XBr/+SErkOiNcnBZS8e/cMUxKjmgGFxzMdk4D1
   aG2JlIgS/8uxLoCZVzxFZCOifUYLOqIqnTMCElDl7BrE2pWkIy7K3GwqI
   kYl5aTqqS/1f+rzt1Zp1OeECtZA6w+QXtC48F1sQ1k4x87DVbwxJizinp
   vbXDE4xkeTwfKuhoyDxryOKHEQ7ZppE08Y9E8NOTG/Pll8zTsR5njXXqi
   QsfyoKKFPhDRptP3G+n5Z+Jy/OBXQa14gDxe3cUaFKxW1Kc9//p25D8Kg
   C+QTY9xgn3bB4+Jx/emPj7dLTyg0ULmNFBVfDkQfxuPQWoqDtLuOh7+Pz
   Q==;
X-CSE-ConnectionGUID: H+3kxTO9SQy8l9eRMQzoYw==
X-CSE-MsgGUID: JK/qAADcQHKBo+B5JvmcbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75343991"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="75343991"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 16:33:41 -0700
X-CSE-ConnectionGUID: L5lU3e1hSneBMqQipXjSAA==
X-CSE-MsgGUID: LXf5SMqNRLiXfBtk9LP7DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="261766636"
Received: from lkp-server02.sh.intel.com (HELO 391eea459618) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 22 Mar 2026 16:32:45 -0700
Received: from kbuild by 391eea459618 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4SHh-0000000007Z-2kCJ;
	Sun, 22 Mar 2026 23:32:41 +0000
Date: Mon, 23 Mar 2026 07:31:52 +0800
From: kernel test robot <lkp@intel.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
Message-ID: <202603230713.5uOUC5EI-lkp@intel.com>
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
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56647-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,01.org:url,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Queue-Id: F2E582EB265
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bryan,

kernel test robot noticed the following build errors:

[auto build test ERROR on c824345288d11e269ce41b36c105715bc2286050]

url:    https://github.com/intel-lab-lkp/linux/commits/Bryan-O-Donoghue/dt-bindings-phy-qcom-Add-CSI2-C-PHY-DPHY-schema/20260316-081353
base:   c824345288d11e269ce41b36c105715bc2286050
patch link:    https://lore.kernel.org/r/20260315-x1e-csi2-phy-v4-2-90c09203888d%40linaro.org
patch subject: [PATCH v4 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260323/202603230713.5uOUC5EI-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603230713.5uOUC5EI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603230713.5uOUC5EI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c:360:13: error: initializer element is not a compile-time constant
           .opp_clk = x1e_clks[2],
                      ^~~~~~~~~~~
   1 error generated.


vim +360 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c

   347	
   348	const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
   349		.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
   350		.reg_info = {
   351			.init_seq = lane_regs_x1e80100,
   352			.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
   353			.common_regs_offset = 0x1000,
   354			.generation = GEN2,
   355		},
   356		.supply_names = (const char **)x1e_supplies,
   357		.num_supplies = ARRAY_SIZE(x1e_supplies),
   358		.clk_names = (const char **)x1e_clks,
   359		.num_clk = ARRAY_SIZE(x1e_clks),
 > 360		.opp_clk = x1e_clks[2],

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

