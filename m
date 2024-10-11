Return-Path: <linux-media+bounces-19363-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 881829998E8
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 03:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EC471F233A3
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 01:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A7D2114;
	Fri, 11 Oct 2024 01:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MdoYMm5r"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C558747F;
	Fri, 11 Oct 2024 01:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728609349; cv=none; b=kEo08tMqxbmL9zpzorZX+ZQCOpLeWrCPeF2iOgazLlwxIBETtWS9Qs7jEOvtxadA3h60KVLvNZ2C5tCaQZx6Zdmovihh8QuMAP4+0EGEqcFzJNhgZB7UAsTv896mreEbTArcp3QMUdS1DVjp+vhEwlftJToZnVVUXzndQ7IlFMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728609349; c=relaxed/simple;
	bh=eN+i66UlOEaqZApWMlxLi+UsLVuS+FFlobbQzL37uOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TzcRoaAoodlJ6NYBrQLWIQU+mK+jwq/T7Sd/hDLOFVeeEgHxH7x+uzLUSJA/zZrqhV0A0Mzw1+sL/n5E6691Jhk+2LG/45g0GnLiYHvb42Dn/1LVxR8p8aL5tPmm92xXuMmuCB7jwcJl3V+muUf41+ZDjFhPmcQGu81z7w1q6PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MdoYMm5r; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728609348; x=1760145348;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eN+i66UlOEaqZApWMlxLi+UsLVuS+FFlobbQzL37uOE=;
  b=MdoYMm5r9dFV4B/gZJZqdkarhQBgxiCsyWx/+Lb4lR+AssXOrH+Wh3ek
   jwPfWU9Az6eRZkuz7iKQQOdXjcpnBdQDIP55b89pt1yEcRAYj5qsKcJ2U
   +OIscDnnGiVFp76OnkfB6LtITkeiW1mtDIzh+noUrWkn5drnkDLopN58I
   qWfd4YOkugjQP8X2GYbjsGkLKy07LlqAdokQz8F8YEcodfZbJ5QyYGi81
   C1dx+O7m2ZjyYpbcTaIZ6XSpjkNuBKCNYnPp8kYvypfakajK42O7hx6tO
   uNOEWwM3kM3CSyQDK+1QxOXwYT8vocqxdhacHlJgZnncHjSHULuLBAA8Z
   Q==;
X-CSE-ConnectionGUID: 6+itA68xSfmyFOdOwGC0aA==
X-CSE-MsgGUID: gyMyZFBsRC65DSaSrs+VoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="28139893"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="28139893"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 18:15:47 -0700
X-CSE-ConnectionGUID: oN0CqsU/QleHU6vpIRPLAw==
X-CSE-MsgGUID: YbkbeEF7SKGb3LLipyypKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="107485309"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Oct 2024 18:15:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sz4Fp-000BXJ-2G;
	Fri, 11 Oct 2024 01:15:41 +0000
Date: Fri, 11 Oct 2024 09:14:46 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Shiyan <eagle.alexander923@gmail.com>,
	linux-media@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	devicetree@vger.kernel.org,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: Re: [PATCH 1/2] media: i2c: Add AR0233 camera sensor driver
Message-ID: <202410110858.GqIZkCMe-lkp@intel.com>
References: <20241009084304.14143-1-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009084304.14143-1-eagle.alexander923@gmail.com>

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linuxtv-media-stage/master sailus-media-tree/master linus/master v6.12-rc2 next-20241010]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Shiyan/media-dt-bindings-media-i2c-Add-AR0233-camera-sensor/20241009-164953
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20241009084304.14143-1-eagle.alexander923%40gmail.com
patch subject: [PATCH 1/2] media: i2c: Add AR0233 camera sensor driver
config: parisc-randconfig-r054-20241011 (https://download.01.org/0day-ci/archive/20241011/202410110858.GqIZkCMe-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410110858.GqIZkCMe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410110858.GqIZkCMe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/i2c/ar0233.c: In function 'ar0233_s_ctrl':
   drivers/media/i2c/ar0233.c:428:42: warning: variable 'format' set but not used [-Wunused-but-set-variable]
     428 |         const struct v4l2_mbus_framefmt *format;
         |                                          ^~~~~~
   drivers/media/i2c/ar0233.c: At top level:
>> drivers/media/i2c/ar0233.c:1159:34: warning: 'ar0233_of_match' defined but not used [-Wunused-const-variable=]
    1159 | static const struct of_device_id ar0233_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~


vim +/ar0233_of_match +1159 drivers/media/i2c/ar0233.c

  1158	
> 1159	static const struct of_device_id ar0233_of_match[] = {
  1160		{ .compatible = "onnn,ar0233" },
  1161		{ }
  1162	};
  1163	MODULE_DEVICE_TABLE(of, ar0233_of_match);
  1164	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

