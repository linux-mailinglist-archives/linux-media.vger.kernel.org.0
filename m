Return-Path: <linux-media+bounces-28984-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E94C9A75566
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 10:17:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 942C716DBD3
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 09:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803061AD3E5;
	Sat, 29 Mar 2025 09:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EMPxvv5D"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC5A158538;
	Sat, 29 Mar 2025 09:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743239834; cv=none; b=X3vZ9P1npOwXXiWtfaDgdnKrHUFsw6u+/fwtebWOuK4bAaz+LMl0lpZMrzFvgNx07Mc/zG3sCCyjg+h7395d/7tsj5q5ETIwFR8k/wVK7fyZv5R1iaeBvDdRxX5iv7zQ3s/RnqY6FR41E9b53w8Zr/LS4BVRqYUxBw4UwmzGNvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743239834; c=relaxed/simple;
	bh=eW6OCfNj36ra5M1ny2lKubEtu+e+UHN6ZzivUob2ulc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PyX2lDgoqbjOrCq6A7Cx6vplQMoeMsePH/u45WoHT6pj3TwRkLbd8/Jw2Ga9r8fhyEQCn1WTSVJm6+6G8Puf2/N7uepN1LwJSkSlgUjP+Y+NmJzOJ9EoGF2lSXR9Lk+8PUTilgNflWpwHibck7aCpD0slUoDiIN1XutZKiYccMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EMPxvv5D; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743239833; x=1774775833;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eW6OCfNj36ra5M1ny2lKubEtu+e+UHN6ZzivUob2ulc=;
  b=EMPxvv5DCqY5o0Jj46S9YrkZUGuh0DuOnlg2D/FfZH540mMk55Rrsvie
   DebNiImaTCg95oRGALrWkzYZ9z17q9JruGL+fqlE2LigqduYOdgb9xSjI
   J8y0FPVMZcnbzGnowPYb6XEVcMHJh6xfK85VGAVhg+/POpvjwLmul8Vjy
   27t+QDFN3RV5aanqez1UMuJLSuD2kaob1GdrYS2a0hFwy0A1+nD6nFb18
   qKhPNPt7/muXwfNDJ0NzuF0webojxzc01vjhD/eV0Kb7qbSBHPGh/+ZtI
   1faB+C9hvi2ylKHroah+gDAqHdoJpNHoZWx1av7WVQjprgcib8BKD32Fy
   g==;
X-CSE-ConnectionGUID: ZUHjtbktTA6QEuwErU+c3Q==
X-CSE-MsgGUID: AXFxSg22RCywzSWsLzxlEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="67075053"
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="67075053"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 02:17:13 -0700
X-CSE-ConnectionGUID: IjnCrNK2TxqngatVN6weoA==
X-CSE-MsgGUID: 6yt3rtmYSjG1z8hvofugZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="125649884"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 29 Mar 2025 02:17:10 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tySJP-000818-2J;
	Sat, 29 Mar 2025 09:17:07 +0000
Date: Sat, 29 Mar 2025 17:16:38 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: Add driver for ST VD55G1 camera sensor
Message-ID: <202503291609.9gCJpjjk-lkp@intel.com>
References: <20250328-b4-vd55g1-v1-2-8d16b4a79f29@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328-b4-vd55g1-v1-2-8d16b4a79f29@foss.st.com>

Hi Benjamin,

kernel test robot noticed the following build errors:

[auto build test ERROR on b2c4bf0c102084e77ed1b12090d77a76469a6814]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Mugnier/media-dt-bindings-Add-ST-VD55G1-camera-sensor-binding/20250328-215939
base:   b2c4bf0c102084e77ed1b12090d77a76469a6814
patch link:    https://lore.kernel.org/r/20250328-b4-vd55g1-v1-2-8d16b4a79f29%40foss.st.com
patch subject: [PATCH 2/2] media: i2c: Add driver for ST VD55G1 camera sensor
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20250329/202503291609.9gCJpjjk-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503291609.9gCJpjjk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503291609.9gCJpjjk-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: drivers/media/i2c/tc358746.o: in function `tc358746_probe':
   tc358746.c:(.text+0x1bc0): undefined reference to `devm_clk_hw_register'
   sh4-linux-ld: tc358746.c:(.text+0x1bcc): undefined reference to `devm_of_clk_add_hw_provider'
   sh4-linux-ld: tc358746.c:(.text+0x1bd0): undefined reference to `of_clk_hw_simple_get'
   sh4-linux-ld: drivers/media/i2c/vd55g1.o: in function `vd55g1_probe':
>> vd55g1.c:(.text+0x1e38): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

