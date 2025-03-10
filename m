Return-Path: <linux-media+bounces-27982-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF9EA5A64A
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 22:33:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62E413AB02C
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 21:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1C9B1E0E05;
	Mon, 10 Mar 2025 21:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SSF+7SVg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A077E1DE2D8
	for <linux-media@vger.kernel.org>; Mon, 10 Mar 2025 21:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741642417; cv=none; b=Z3z3sV/lBTiDyzmKbNwTJfD79g3RvJZJj2GNQGw8y3mQSZYAUrj8eExJHGaVVaFgrS6lK3fhRyTaKXhfQ3Zf7yuZurZm+SNxRyhfxQLk3i6R7IrwZKB+NFDtIyNIkArqJ1VRVD6Q1AZpwH7d5TPh6QohWBLMyRGoDyoKZ98w5IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741642417; c=relaxed/simple;
	bh=sfRcIWo6fC9vYfEEbwG5irFtI4H4l3WxRKjPF8MQDos=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ID2LHFKLVxcr0nCuiBMholmlbkHYnYksZFgXslgOgD9rDLH1p6vYzmLo3euLZAuw//X3r7g2OVBTVikEEq2hxagB0PHdDSmbtbuLGPyBQ/wcB+NEYumzJX9DJgkPB2Ue/axmcgLQc2QaWdZI8FM040S8R5A56xFWE/BVsZ5CxII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SSF+7SVg; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741642416; x=1773178416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sfRcIWo6fC9vYfEEbwG5irFtI4H4l3WxRKjPF8MQDos=;
  b=SSF+7SVgwkLxDizG5oism6gTf+b0wSdlWHYphhOsWDcl1ro/rqZ35X/l
   tQ+Eig7riwjMIA8q71IgYfE6mKDEzbUPvUXqD6zYGIqJ9pJogyjCdDG3v
   OvFnVmHTK1NZZzgpKOMMtBR5/qO3AuuBr/M038p39dvDghG901iIN4Ew7
   IjnQKW1mqYMEV++KSshE8Rwh1/MQRNyreBfKysYcDK/Q9h//eJSOlevxk
   Kq39bxDhiUC3lJQFWaQHqOd+A12Dgq8+tw7iHVOWY46JYO/HzTsfnCNlJ
   6OHdYxt+OrrimfKpd0GdpzUYx/V0jOilBdEAi9ZgZkj4xxTx9Y99WIQlk
   w==;
X-CSE-ConnectionGUID: DjPRXkniQF6i7di8LWTkhQ==
X-CSE-MsgGUID: lOrKsVw9TXe9y5lAiXJEsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="65114210"
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="65114210"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 14:33:35 -0700
X-CSE-ConnectionGUID: rSG8M5aCQ0uqbNVKLm/l1Q==
X-CSE-MsgGUID: gV4WmIVcR7aB9aGkv0GkIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="120130684"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 10 Mar 2025 14:33:33 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trkkd-00065W-1Q;
	Mon, 10 Mar 2025 21:33:31 +0000
Date: Tue, 11 Mar 2025 05:32:35 +0800
From: kernel test robot <lkp@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [sailus-media-tree:devel 22/23]
 drivers/media/platform/atmel/atmel-isi.c:1075:22: error: call to undeclared
 function 'devm_kmemdup_array'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202503110545.xrh6sBcJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git devel
head:   07e07f2cd3ebb7e8b62ccb8f22a16032b599c9e2
commit: 93c8dabd1d1ed94f03eb9a63c0bc291b62595bda [22/23] media: atmel-isi: use devm_kmemdup_array()
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250311/202503110545.xrh6sBcJ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250311/202503110545.xrh6sBcJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503110545.xrh6sBcJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/atmel/atmel-isi.c:1075:22: error: call to undeclared function 'devm_kmemdup_array'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1075 |         isi->user_formats = devm_kmemdup_array(isi->dev, isi_fmts, num_fmts,
         |                             ^
>> drivers/media/platform/atmel/atmel-isi.c:1075:20: error: incompatible integer to pointer conversion assigning to 'const struct isi_format **' from 'int' [-Wint-conversion]
    1075 |         isi->user_formats = devm_kmemdup_array(isi->dev, isi_fmts, num_fmts,
         |                           ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1076 |                                                sizeof(isi_fmts[0]), GFP_KERNEL);
         |                                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/devm_kmemdup_array +1075 drivers/media/platform/atmel/atmel-isi.c

  1043	
  1044	static int isi_formats_init(struct atmel_isi *isi)
  1045	{
  1046		const struct isi_format *isi_fmts[ARRAY_SIZE(isi_formats)];
  1047		unsigned int num_fmts = 0, i, j;
  1048		struct v4l2_subdev *subdev = isi->entity.subdev;
  1049		struct v4l2_subdev_mbus_code_enum mbus_code = {
  1050			.which = V4L2_SUBDEV_FORMAT_ACTIVE,
  1051		};
  1052	
  1053		while (!v4l2_subdev_call(subdev, pad, enum_mbus_code,
  1054					 NULL, &mbus_code)) {
  1055			for (i = 0; i < ARRAY_SIZE(isi_formats); i++) {
  1056				if (isi_formats[i].mbus_code != mbus_code.code)
  1057					continue;
  1058	
  1059				/* Code supported, have we got this fourcc yet? */
  1060				for (j = 0; j < num_fmts; j++)
  1061					if (isi_fmts[j]->fourcc == isi_formats[i].fourcc)
  1062						/* Already available */
  1063						break;
  1064				if (j == num_fmts)
  1065					/* new */
  1066					isi_fmts[num_fmts++] = isi_formats + i;
  1067			}
  1068			mbus_code.index++;
  1069		}
  1070	
  1071		if (!num_fmts)
  1072			return -ENXIO;
  1073	
  1074		isi->num_user_formats = num_fmts;
> 1075		isi->user_formats = devm_kmemdup_array(isi->dev, isi_fmts, num_fmts,
  1076						       sizeof(isi_fmts[0]), GFP_KERNEL);
  1077		if (!isi->user_formats)
  1078			return -ENOMEM;
  1079	
  1080		isi->current_fmt = isi->user_formats[0];
  1081		return 0;
  1082	}
  1083	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

