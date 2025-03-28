Return-Path: <linux-media+bounces-28953-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AC1A75022
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 19:08:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AD2716C355
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 18:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F865186294;
	Fri, 28 Mar 2025 18:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gyTdR5lk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC657C2FA;
	Fri, 28 Mar 2025 18:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743185300; cv=none; b=geFbFHELPtm/9PaiamhKUc1bmPvz4wLSQXs+MyZR+kY0hvpQqP3yevixsCs7rFOKfdOmiEFuZkDRy0fP1NSA1DopWBOE3rADzoxU8UM9rjE8xUiYOhaSvE6FfDNemDo/Xy6BkUXAInXCYw8L7jmtNrj/sw4KcGA2wJNY2OdRgmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743185300; c=relaxed/simple;
	bh=F56ZuT/aFD/W5ny+YhT0YUCeoNkuOsSqzkEo4/2+J1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BEw7TzyogOuJ2k2bVzTcRe1EWCdT/NTHzWG86UPMZaEgyychOaduXPbZqmYCIGiBgFsSEChlGaF28MLcMSM8hv0/RISXwHK+/xcKHqeO1XxES1808X+Ck2hEvf3z0UsY8hoBYlfUybpTloB0maEzz68b9RfBU40/eTnDnzrVD9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gyTdR5lk; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743185297; x=1774721297;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F56ZuT/aFD/W5ny+YhT0YUCeoNkuOsSqzkEo4/2+J1c=;
  b=gyTdR5lk7Ut5hEaTa35zRvn4xBWyVdBLBIJmbJy13am3PJBvetue5O0F
   NWL4fFvHWF7aFKjshW2avlf2KaDQavqxEwBmczflzVMqnLJLN/Oo28SJ7
   DAuKMNo2PQdZi2cX+HWVNLJrJ1bDsiEXpV8oRr1a5j4IWHZn4Be5PZt9R
   iPN8GJOlmSJegiV0WB2rtmsjZ/hFzHTT0MUdSHcfPh7hSCnlJiFDnqq2/
   3vrtAAxiTxbiF65qhSbbP9TN0zAuSTFS0YbQNwJuDm4Wa3HGCIWEEpso1
   onEOZ3IQu2/9b9kRt4X0QPgb6ge5fDJccxBVPc55IcaE/gHhSEexFrxQl
   w==;
X-CSE-ConnectionGUID: soLj2Bg7RRylMrDnermWkg==
X-CSE-MsgGUID: anAE24gfRMilMkcbpizAWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="48429396"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="48429396"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 11:08:17 -0700
X-CSE-ConnectionGUID: ZUzXqq+HScaj2lWSyxngbQ==
X-CSE-MsgGUID: XUjL2sE7Q/+r3Dahith76A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="126431158"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 28 Mar 2025 11:08:14 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyE7n-0007cg-0w;
	Fri, 28 Mar 2025 18:08:11 +0000
Date: Sat, 29 Mar 2025 02:07:15 +0800
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
Message-ID: <202503290148.tTZNa6UU-lkp@intel.com>
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
config: csky-randconfig-002-20250329 (https://download.01.org/0day-ci/archive/20250329/202503290148.tTZNa6UU-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503290148.tTZNa6UU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503290148.tTZNa6UU-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
>> ERROR: modpost: "__udivdi3" [drivers/media/i2c/vd55g1.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

