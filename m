Return-Path: <linux-media+bounces-27669-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CB0A541A3
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 05:26:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C92323ABD42
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 04:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8320119CC0C;
	Thu,  6 Mar 2025 04:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VJzr2KFC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BC1192D9A
	for <linux-media@vger.kernel.org>; Thu,  6 Mar 2025 04:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741235156; cv=none; b=ITyNQTC5m200oJ+c+d6swGJDFcOb+v6YBOWainDfB4GHy5u5vHidhjVswRx0oQg0HZD3u+BSGYnjgyKeW80dnmnKsqmVtrsvJtYzdkV9Htwt2XGxIdmbU1DvYKhRCAbAL/S7ho5M8hhL2AwMk95kJg6AWbM/fbOUxGwhegJzoOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741235156; c=relaxed/simple;
	bh=eumoPIkoZZFufH4p3hKezI4BupcvM1ZHfV2ZB9r8HvE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uTagpQnnwr046L3P4SkV9K+vHogkXOg8tpTRkE6kuib9Cz3+raEXS6ny40lkP1ydeK2mCUEafWzohhoieEBPzvkDbJ/e+Fi5DpFTdwgFGgZf+a0rMCoo6kqxofmZf81lvSU2GhbQu725I3xmAAZOXqiqL5ZOSSrBNQ7U3r+0AAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VJzr2KFC; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741235155; x=1772771155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eumoPIkoZZFufH4p3hKezI4BupcvM1ZHfV2ZB9r8HvE=;
  b=VJzr2KFCn9619ZNEoEUeQs626RSTkK794gwnGpQlBIhB00CwyeQjse7u
   fxTIF+Jnin9DTE4rGcxRL47h1tlUKMv//6vYp3x2St7/vBgQ28RJbuQGR
   KsxH3ubcaNeiASloCLqrNhYlBIrWwRq8Autoe00TD8NnP/jIVqqGkj/KJ
   iCruYiTN17ywpzVwjOqIU+AboJ5UCuNMqMidtzjtb20iKxqr0TRBJcYfx
   lB5n7skYOx6UkdZURWiUBEy3EW5on3j/0l3VlC9tE8+IyVBlrTFwSCuh7
   6q0fybmRYPWuQ/JNrc7tbnVIM55PlNekXwmpD7CxIAqthzI4BTuBUBxpM
   A==;
X-CSE-ConnectionGUID: DW31R9F6QOSRzWBK0Zzxmw==
X-CSE-MsgGUID: lkMI8EFQT0aCuqWlHjKJEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41404189"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="41404189"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 20:25:54 -0800
X-CSE-ConnectionGUID: cvRPFWjzRQGUBjVNoYONtw==
X-CSE-MsgGUID: sKxuWj+cRP+ZobyNg4BBsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="119404635"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 05 Mar 2025 20:25:52 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq2nt-000MWi-37;
	Thu, 06 Mar 2025 04:25:50 +0000
Date: Thu, 6 Mar 2025 12:24:55 +0800
From: kernel test robot <lkp@intel.com>
To: Shreeya Patel <shreeya.patel@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Dingxian Wen <shawn.wen@rock-chips.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: [linuxtv-media-pending:next 3/7]
 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c: media/v4l2-common.h is
 included more than once.
Message-ID: <202503061231.PHF6hEL2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.linuxtv.org/media-ci/media-pending.git next
head:   36cef585e2a31e4ddf33a004b0584a7a572246de
commit: 7b59b132ad4398f9c13c3222e5126f5045aa5ead [3/7] media: platform: synopsys: Add support for HDMI input driver
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503061231.PHF6hEL2-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c: media/v4l2-common.h is included more than once.

vim +33 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c

    31	
    32	#include <media/cec.h>
  > 33	#include <media/v4l2-common.h>
    34	#include <media/v4l2-ctrls.h>
    35	#include <media/v4l2-device.h>
    36	#include <media/v4l2-dv-timings.h>
    37	#include <media/v4l2-event.h>
    38	#include <media/v4l2-fh.h>
    39	#include <media/v4l2-ioctl.h>
    40	#include <media/videobuf2-dma-contig.h>
    41	#include <media/videobuf2-v4l2.h>
  > 42	#include <media/v4l2-common.h>
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

