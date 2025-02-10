Return-Path: <linux-media+bounces-25953-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F37A2F953
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 20:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21E5E16955B
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 19:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B845D25C6E0;
	Mon, 10 Feb 2025 19:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MXAHOkwO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349C425C712
	for <linux-media@vger.kernel.org>; Mon, 10 Feb 2025 19:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739216772; cv=none; b=dV7PxxcmeQCZjL1nGXp9B5vZtVOF+aTR59v45S7Yh7GrdrBtIkoPYp1DT0tsQCcrZ+BgdvRHnCzDCZq+41OCiCct8cJKYi/yCvfZAKvKTbArCVeSXwwSVor235TB0PnvLJBE9e5IFtU8+4h2TvO+rx6wVxNHIhC2Sg1nEKDhit4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739216772; c=relaxed/simple;
	bh=iRAVmBJPNssfV1ZJAnUoXw3F+xH7ii0lbtEiv1kTJmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gusFq+zTGbV3smsMB7AQ+HVfhryH7VrSW8hpDtwsGvxHeyP7aX0imXFeeDwHOdD34JClZ9D7eT4nyfhyBzi8DPFGYVdmYnnC9J//hvEizOkKGi6DawszJliCvK6r7wW4L+KzTOLISdFntXCPoBG+Vxl0un6x9jHcK3PqiB5j5uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MXAHOkwO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739216770; x=1770752770;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iRAVmBJPNssfV1ZJAnUoXw3F+xH7ii0lbtEiv1kTJmc=;
  b=MXAHOkwOiyZIcFm2zrSYsuV7zbHhUdJfe/68htUP+z47fh9giOY9Tl1W
   G5WPPx3Tegv6ufwQOzqloMzBgpuAR0UDb61rrYWU8VglUui0PNAUb1kB+
   DGxZus/0O6jU6GO/533U+DQeR+DaYMwOptl18sDUCZVW/D3WL3ScqK3lG
   6OjV1pnGsO4mC/E+i5ItWL6p57VZSzlFGPaMFrW8aCqhSk9Y89KXbfy1+
   IpRvW8aV83LBeoRHiZhMc4uitCd4f+0maSwoNoX+MiXBhOwtPFbDEamIg
   a2r72FhuXKgYBu3V11o+1BcAQQoHfc1eb/9ThUH1N09fedZAwVAJK+VvU
   Q==;
X-CSE-ConnectionGUID: wu2j+RhlSfGmvNwXndQb6A==
X-CSE-MsgGUID: lGbZpVCVT0ewmjkUM8TTow==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51246382"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="51246382"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 11:46:09 -0800
X-CSE-ConnectionGUID: TF/q20afQqCj10j3+c4Gmg==
X-CSE-MsgGUID: ba4mJojWTy+RPKfJ5yYEVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143178487"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Feb 2025 11:46:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thZjH-0013HT-2m;
	Mon, 10 Feb 2025 19:46:03 +0000
Date: Tue, 11 Feb 2025 03:45:34 +0800
From: kernel test robot <lkp@intel.com>
To: Dongcheng Yan <dongcheng.yan@intel.com>, linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl, ricardo.ribalda@gmail.com,
	bingbu.cao@linux.intel.com
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, tomi.valkeinen@ideasonboard.com,
	jacopo.mondi@ideasonboard.com, daxing.li@intel.com,
	dongcheng.yan@linux.intel.com, ong.hock.yu@intel.com,
	balamurugan.c@intel.com, wei.a.fu@intel.com
Subject: Re: [PATCH v5] media: i2c: add lt6911uxe hdmi bridge driver
Message-ID: <202502110350.ZNdLnsy4-lkp@intel.com>
References: <20250210060923.2434047-1-dongcheng.yan@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210060923.2434047-1-dongcheng.yan@intel.com>

Hi Dongcheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2f87d0916ce0d2925cedbc9e8f5d6291ba2ac7b2]

url:    https://github.com/intel-lab-lkp/linux/commits/Dongcheng-Yan/media-i2c-add-lt6911uxe-hdmi-bridge-driver/20250210-141140
base:   2f87d0916ce0d2925cedbc9e8f5d6291ba2ac7b2
patch link:    https://lore.kernel.org/r/20250210060923.2434047-1-dongcheng.yan%40intel.com
patch subject: [PATCH v5] media: i2c: add lt6911uxe hdmi bridge driver
config: x86_64-kismet-CONFIG_V4L2_CCI_I2C-CONFIG_VIDEO_LT6911UXE-0-0 (https://download.01.org/0day-ci/archive/20250211/202502110350.ZNdLnsy4-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250211/202502110350.ZNdLnsy4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502110350.ZNdLnsy4-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for V4L2_CCI_I2C when selected by VIDEO_LT6911UXE
   WARNING: unmet direct dependencies detected for V4L2_CCI_I2C
     Depends on [n]: MEDIA_SUPPORT [=y] && I2C [=n]
     Selected by [y]:
     - VIDEO_LT6911UXE [=y] && MEDIA_SUPPORT [=y] && ACPI [=y] && VIDEO_DEV [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

