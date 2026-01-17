Return-Path: <linux-media+bounces-50958-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C9383D390EE
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 21:28:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE4D63029294
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 20:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4492E92B3;
	Sat, 17 Jan 2026 20:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GAE1OPSz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6C32C15A0;
	Sat, 17 Jan 2026 20:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768681703; cv=none; b=D4uRNxwVBUxoHSy6B8gkccPfN5hgY3RGF3Q0XiPBX/vOuw/wbLZyXjx7HpN0PKOcAFOf5wBI1xXKI8wSnkrAMLjrGTJKxQf1rL6aplnfIO8TNyoe1Zu3Y9ufYxCRjlUYVlI84d3gJNLOyOO4zb8wlu0Uvy1cg/7sUNlb9/m0NRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768681703; c=relaxed/simple;
	bh=uYCTFcKcWCYxNjVzOuzLVBRKXbVczjlOCPm0q/0V5K0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tekNVVfBShkbgu06EUqj3nHCTmk2q8+4YSaXp3mFvpZ+vmtKrW9nieOL+5t2NgvbyT7KNITMoQehRE+BIuUPf5/+crCWPnVRRCjwIIoTqV/YUNZhg54m8ElGGGZ5rpnQrzBItG0yIg5/XMBK3P6cY8j9aQ9aKrhndd0UkzEGjRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GAE1OPSz; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768681701; x=1800217701;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uYCTFcKcWCYxNjVzOuzLVBRKXbVczjlOCPm0q/0V5K0=;
  b=GAE1OPSzrG68UhbObtqjBotz0nusBPraAxQnMsrnn7a9NpEHZkXChf+o
   DS/A+kCDiFHgtmMOPM+f6fYvYbO7IGum6139Pa+vvGbQxhBQa3oZbpdw/
   q7MOepvTrxGmJdjeNXFBBeFA30ccral1g5kn0zc+5WFPI+Rd1usJ/12n3
   YC8HPgCeeyx1S8rlA0VbyIjoqIK4iHFPXDafVxv1YbZEMpy/+Ru0qHGi8
   wz1Ek8davPB2G2+3q2Tt+rXGhkNl7I6KoxVsq41EreT26LGNQKI/H4iuS
   M6gPmV1uo8YLbkVJPgeMDJ6FsskSuEBDjjIz+TftvP331p2QvdLIghgPC
   Q==;
X-CSE-ConnectionGUID: 7PqOwwEYTVKWjOdcmjMPAg==
X-CSE-MsgGUID: oqEIYqHQTKuKD4rsAT70yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="69870069"
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="69870069"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 12:28:21 -0800
X-CSE-ConnectionGUID: fAbcORYZRp2CY7Smwz4aIQ==
X-CSE-MsgGUID: vyYOqqd+RESlpo5PAmgW3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="205128770"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Jan 2026 12:28:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhCu6-00000000MCO-13L3;
	Sat, 17 Jan 2026 20:28:14 +0000
Date: Sun, 18 Jan 2026 04:27:23 +0800
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Joel Selvaraj <foss@joelselvaraj.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v3 8/8] media: qcom: camss: Account for C-PHY when
 calculating link frequency
Message-ID: <202601180402.n3SE2vPM-lkp@intel.com>
References: <20260117-qcom-cphy-v3-8-8ce76a06f7db@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117-qcom-cphy-v3-8-8ce76a06f7db@ixit.cz>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Heidelberg-via-B4-Relay/media-qcom-camss-csiphy-Introduce-PHY-configuration/20260117-234024
base:   46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
patch link:    https://lore.kernel.org/r/20260117-qcom-cphy-v3-8-8ce76a06f7db%40ixit.cz
patch subject: [PATCH v3 8/8] media: qcom: camss: Account for C-PHY when calculating link frequency
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260118/202601180402.n3SE2vPM-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601180402.n3SE2vPM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601180402.n3SE2vPM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/media/platform/qcom/camss/camss.c:4296 function parameter 'cphy' not described in 'camss_get_link_freq'
>> Warning: drivers/media/platform/qcom/camss/camss.c:4296 function parameter 'cphy' not described in 'camss_get_link_freq'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

