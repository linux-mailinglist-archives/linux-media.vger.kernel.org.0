Return-Path: <linux-media+bounces-19367-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0384999A00
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 04:06:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0B391C225BA
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 02:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0216F28684;
	Fri, 11 Oct 2024 02:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MBf5yLDL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C526D1A269
	for <linux-media@vger.kernel.org>; Fri, 11 Oct 2024 02:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728612411; cv=none; b=LXSTbGbpkJPQcYY4M2RO2Mtb+lSY+NWo5fNE9KBnPma1NaZK4dZ76AFmHGW5k8ynnwZXUh3b46LVnn/++kcj/OG5vYp2ujaeGBUc6TCVSSvoGzevvnsuWIByjgo5lJGUwJrlQtOyDHkJBoItAH4vxtB794pJ+pLavKbNOMKGsAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728612411; c=relaxed/simple;
	bh=iwLUzim2AMn8pkxvJuWWQJX5kvD+FIf0X2B6hz9l0Ew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ukVzLdxe8zxjZM4YCkjZHToB0AKcNAq8fvhMDH/BWyYbvJhIm1gHiIdgzHT0OF6XdgHrQuIxSgWxfK+tmc9xYYvrzYRGCHNML3TirjYdvcv7ROsWXxDFHjK03V2v3qv3L6/6oSVrrn6VFcJYnde/ML95Ltf4QNkatOk2XuEU4eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MBf5yLDL; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728612410; x=1760148410;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iwLUzim2AMn8pkxvJuWWQJX5kvD+FIf0X2B6hz9l0Ew=;
  b=MBf5yLDLw0VLm12o6TP8OueshDG7ciFSFlAfPpPBS5EtbvYdFBwxiul3
   pXPAHSCDP1FbECCwucvpppFe7Q//cRoyBtx9+Uqh4VjaxRoQEZwZXpfNu
   1x8KWgPr7qXFBtiX1iyHfA4/Z0vNVgLHbfPNfJmFdsY3pJhG//t5pxJ2Q
   PYjwwFI2rmDaZwr6h2w+fSrMGlgIJMrlSm7yvCG41y/grBhndYaIDA1ZC
   nx4GDezOdE0efcEUHAgos3yHcky3TmfzAk9Q+u9W4ViP7jtivMnNVN1E8
   2+4AhnW+zN0KqxhK+AGGTl7pl2wybyuZO1STOekJZC7PNwz5LLRKGM3Pg
   w==;
X-CSE-ConnectionGUID: gcnW6KGGTxeVL/1M8mEcAg==
X-CSE-MsgGUID: MPxRc7lDSL2MPNaC+NGrMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="27452185"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="27452185"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 19:06:49 -0700
X-CSE-ConnectionGUID: ILZt4q3xSQ63ohnTkZNAiw==
X-CSE-MsgGUID: p9F6s4StSQWXz4Ox8P20vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="76689130"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Oct 2024 19:06:46 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sz53D-000Baf-22;
	Fri, 11 Oct 2024 02:06:43 +0000
Date: Fri, 11 Oct 2024 10:06:04 +0800
From: kernel test robot <lkp@intel.com>
To: Dongcheng Yan <dongcheng.yan@intel.com>, linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, tomi.valkeinen@ideasonboard.com,
	jacopo.mondi@ideasonboard.com, daxing.li@intel.com,
	hao.yao@intel.com, dongcheng.yan@linux.intel.com
Subject: Re: [PATCH v1] media: i2c: add lt6911uxe hdmi bridge driver
Message-ID: <202410110954.tAUzHfp4-lkp@intel.com>
References: <20241010071010.3275452-1-dongcheng.yan@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010071010.3275452-1-dongcheng.yan@intel.com>

Hi Dongcheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6ba59ff4227927d3a8530fc2973b80e94b54d58f]

url:    https://github.com/intel-lab-lkp/linux/commits/Dongcheng-Yan/media-i2c-add-lt6911uxe-hdmi-bridge-driver/20241010-161811
base:   6ba59ff4227927d3a8530fc2973b80e94b54d58f
patch link:    https://lore.kernel.org/r/20241010071010.3275452-1-dongcheng.yan%40intel.com
patch subject: [PATCH v1] media: i2c: add lt6911uxe hdmi bridge driver
config: x86_64-kismet-CONFIG_V4L2_CCI_I2C-CONFIG_VIDEO_LT6911UXE-0-0 (https://download.01.org/0day-ci/archive/20241011/202410110954.tAUzHfp4-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241011/202410110954.tAUzHfp4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410110954.tAUzHfp4-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for V4L2_CCI_I2C when selected by VIDEO_LT6911UXE
   WARNING: unmet direct dependencies detected for V4L2_CCI_I2C
     Depends on [n]: MEDIA_SUPPORT [=y] && I2C [=n]
     Selected by [y]:
     - VIDEO_LT6911UXE [=y] && MEDIA_SUPPORT [=y] && ACPI [=y] && VIDEO_DEV [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

