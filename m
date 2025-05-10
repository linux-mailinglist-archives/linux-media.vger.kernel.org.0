Return-Path: <linux-media+bounces-32197-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFCCAB2141
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 07:13:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53DB27BBAA1
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 05:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1EB11CCEE7;
	Sat, 10 May 2025 05:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kZGM4fts"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F53A1B6CE3
	for <linux-media@vger.kernel.org>; Sat, 10 May 2025 05:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746854023; cv=none; b=uCSg0fYJrSdlMGNHbH2jQSzFrNcOJI4MMjdHDSgGD+0yt2w2h5uhHjMO+SVRksaWcROyeZbv6fI/DAANT8U2CVC+Tk4SEWHhKCXuMJj1iqL0JGnj0bQ8iBJk/bsVNrxgIP7fG1IUX9RDhMSbJuRtVdNFs8Le/kIp1VyNOSL+g/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746854023; c=relaxed/simple;
	bh=OCswfwBZh+uvWi/FUg6t/F75BJZCOHkenAxOfGj+3Ys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d2GPqc3Yo5JA7GfWqM6fe1cLIK4a9U9mf+cY+VlRGPZbxiWutxBmIPKPGtZhrq9f/GgaY3MDzSmOrqT6gmOmIasd8zhqC1AbJI6JAJGFC3sIpcNuKU08VeE+jKca5VNV9G6itZcvH5RDpM29DEJjl1MJoFObAALdHozWlCdGtjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kZGM4fts; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746854021; x=1778390021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OCswfwBZh+uvWi/FUg6t/F75BJZCOHkenAxOfGj+3Ys=;
  b=kZGM4ftstoY3wFncsL/mxUW408maxcc85N8Hn6kGIBwF+8vzhqB4ExNV
   oQaYpI90gaN686X/CorCwbU2A5dnWYg2caDj/heKf3mWoOdJp/O5IdvXo
   Wli+AzbXIxHdk19W0BOnnUnKCD/BVt7jEwZB0yD4Mmy9UwqetAjJ2IOGa
   2nRpHNEPvZlif6jsKiBndd5Rh6JjpP3nuYbRqMSVbCEmVi/RfUg2lQE6q
   c30y97yfjTsVZNugYRFz4x6lK4bUgGlcY9PeEJlpfbskZ9Q+QZz/czB+q
   KgbrbDD7W3aMWQWsrYOnJKe/oEfveNKgDtdeeVZDAks5WlHXVoaA9zGLQ
   g==;
X-CSE-ConnectionGUID: uHEXNBJNTSamF4fVNNl0tA==
X-CSE-MsgGUID: 68wWb6q4Suy+iPgbMqUWSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59349379"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="59349379"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 22:13:40 -0700
X-CSE-ConnectionGUID: ppxu98mtT9K8ttxguGV6mw==
X-CSE-MsgGUID: 6bcvKkoZRlq7+wO7tsseFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="167752934"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 May 2025 22:13:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDcWm-000Cnv-07;
	Sat, 10 May 2025 05:13:36 +0000
Date: Sat, 10 May 2025 13:13:00 +0800
From: kernel test robot <lkp@intel.com>
To: Keke Li <keke.li@amlogic.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [linuxtv-media-pending:next 49/67] ERROR: modpost:
 "__hexagon_divdi3"
 [drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.ko] undefined!
Message-ID: <202505101334.UHxNcUUO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.linuxtv.org/media-ci/media-pending.git next
head:   3328eb4dfec23cb3055cda24087cd1cdee925676
commit: b63ef604a28da4165dcf2573cd508b4fb18e1c53 [49/67] media: platform: Add C3 MIPI CSI-2 driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250510/202505101334.UHxNcUUO-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505101334.UHxNcUUO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505101334.UHxNcUUO-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/tests/slub_kunit.o
>> ERROR: modpost: "__hexagon_divdi3" [drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

