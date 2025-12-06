Return-Path: <linux-media+bounces-48348-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 305F2CAA20A
	for <lists+linux-media@lfdr.de>; Sat, 06 Dec 2025 07:56:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 01CA830131E1
	for <lists+linux-media@lfdr.de>; Sat,  6 Dec 2025 06:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C1F22D8DB9;
	Sat,  6 Dec 2025 06:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jqgsbzj+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB362D837E;
	Sat,  6 Dec 2025 06:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765004152; cv=none; b=SjR5ayupbu2bFyB3Y27wE9ffqmaUTjm/frqKtCK2GaBw62aUANUAmahwBNPXTS8aCwt0hyPzcqXihBFHUvPjflzLUu5/hf5ybEPoROVlrlZi2v4MF1Zam/QeKXcSUZ1L1T5OdEosdfBaVS63k6T1vTKiohXGhMcuuCEAdWscptY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765004152; c=relaxed/simple;
	bh=GXFNWKU7EpQDMWxUoTAxizG31A/gD1pqyuzXmG3Azi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qs45hl31PvwVoKSgOWyHGaNBdAJJSFgVUyPQI9lbZs/t2J5x8Z/GfPO91QYrd+UJDKWY1a3iKrEWA0+PoM31Z/NfdBM2TixgIdpIWMwQpQSxbQrOlPAjD6ibBZpwqC+CgzHZNKUwMYfqGNcsUU2O70pgnTXtxAbWt2HDdS5Iv4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jqgsbzj+; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765004152; x=1796540152;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GXFNWKU7EpQDMWxUoTAxizG31A/gD1pqyuzXmG3Azi8=;
  b=jqgsbzj+WlMcuGz3fdlqhH4OgBRWn3EYtNRKbJ/s6goouphLCJCPJkUB
   /ki5irpvlW3gDHRjjXbMwlusTbrigCwHqEA6O/P9rKiepTAzHNuROygfW
   CR2tt5SYlk2xoYL99hleyJlbwN8eDsOW4FLLamNqX5rZBM1X449aUwiIh
   1dOhNrO3bDx3eWRm47922lTFDoxFwn9/zu9o2tris7sJaxxEvaUtZLZ3Q
   YFmhO4Q1eBb10aoCMEZ1HjBYz2GDE4kX0d4wNHJQpl1Rr8zWRXcUj92Pp
   hvb94+QN5yzoYvlc9zKRH2cQUPqt1zURz9/4jWZGLtUi1bZtaAO8JejsE
   Q==;
X-CSE-ConnectionGUID: L0dcVvUbSkSbyYhOccJnag==
X-CSE-MsgGUID: zojrJ4oXRNOwy4HSdpvEjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="77353532"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="77353532"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 22:55:51 -0800
X-CSE-ConnectionGUID: JfK9f9K0RUuGfn8c8Z/W0Q==
X-CSE-MsgGUID: x8IeWcC9Rf6xIbCOhqfozA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="195548765"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Dec 2025 22:55:47 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRmCm-00000000FxV-1CGg;
	Sat, 06 Dec 2025 06:55:44 +0000
Date: Sat, 6 Dec 2025 14:55:19 +0800
From: kernel test robot <lkp@intel.com>
To: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>,
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Petr Hodina <phodina@protonmail.com>,
	Casey Connolly <casey.connolly@linaro.org>,
	"Dr. Git" <drgitx@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Joel Selvaraj <foss@joelselvaraj.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH WIP v2 8/8] media: qcom: camss: Account for C-PHY when
 calculating link frequency
Message-ID: <202512061404.uEUcsCh1-lkp@intel.com>
References: <20251204-qcom-cphy-v2-8-6b35ef8b071e@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204-qcom-cphy-v2-8-6b35ef8b071e@ixit.cz>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bc04acf4aeca588496124a6cf54bfce3db327039]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Heidelberg-via-B4-Relay/media-qcom-camss-csiphy-Introduce-PHY-configuration/20251205-004233
base:   bc04acf4aeca588496124a6cf54bfce3db327039
patch link:    https://lore.kernel.org/r/20251204-qcom-cphy-v2-8-6b35ef8b071e%40ixit.cz
patch subject: [PATCH WIP v2 8/8] media: qcom: camss: Account for C-PHY when calculating link frequency
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20251206/202512061404.uEUcsCh1-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061404.uEUcsCh1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061404.uEUcsCh1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/media/platform/qcom/camss/camss.c:3928 function parameter 'cphy' not described in 'camss_get_link_freq'
>> Warning: drivers/media/platform/qcom/camss/camss.c:3928 function parameter 'cphy' not described in 'camss_get_link_freq'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

