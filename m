Return-Path: <linux-media+bounces-2894-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B232981C123
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 23:40:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E217B22EDF
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 22:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C006B7691C;
	Thu, 21 Dec 2023 22:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IGP5veNl"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0748171B3
	for <linux-media@vger.kernel.org>; Thu, 21 Dec 2023 22:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703198440; x=1734734440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YGzLxG5vjCRgG8iVeXfXAihADszuvbQ5QWXEoQsqDP4=;
  b=IGP5veNlj0aiXVfF3ETwMwoEoKKDM9IPzY3jRlpmnoqWkai3v/55BVzs
   TKQNGUtid+5l9NLrKbDKgMEztq5MKjcOj++UF/Xt4yuQ4Tea5ZlxA1+uv
   6DFfIHKBdCH0e7EBEomHCYTCPnUVdFi7L9TjtepuCYp96T/nP2Ks04519
   BiaDKX4zxUjECYzJVR0R4T4lxU08A4YNW4BK/VKq0izGZbIpdm1Uogh8z
   Lh/82f+iwI633/LfzWFoeJSy3WFmrm49bKIZK5oNhh3Nf9lf1MK0JNeOm
   WoclTteAHlE1lHMFlAktBDCy/a2i456G8Tk4Z2cH1OEREwLAskU4zAzMI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="14728634"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="14728634"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 14:40:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="753080207"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="753080207"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 21 Dec 2023 14:40:38 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGRiQ-0008ok-2C;
	Thu, 21 Dec 2023 22:40:33 +0000
Date: Fri, 22 Dec 2023 06:39:43 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:media-ref 65/67] htmldocs: ./scripts/kernel-doc:
 ./include/media/media-devnode.h:54: warning: Function parameter or struct
 member 'release' not described in 'media_file_operations'
Message-ID: <202312220620.kGlay5m9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git media-ref
head:   9587641ab37e563866fb73acc04735eccd59a2d3
commit: 2afdf22741b499ad0c798c891fab451a8da50ce0 [65/67] media: mc: Implement best effort media device removal safety sans refcount
reproduce: (https://download.01.org/0day-ci/archive/20231222/202312220620.kGlay5m9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312220620.kGlay5m9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./scripts/kernel-doc: ./include/media/media-devnode.h:54: warning: Function parameter or struct member 'release' not described in 'media_file_operations'
>> ./scripts/kernel-doc: ./include/media/media-devnode.h:99: warning: Function parameter or struct member 'mcdev' not described in 'media_devnode_compat_ref'
>> ./scripts/kernel-doc: ./include/media/media-devnode.h:99: warning: Excess struct member 'cdev' description in 'media_devnode_compat_ref'
>> ./scripts/kernel-doc: ./include/media/media-devnode.h:155: warning: Function parameter or struct member 'mcdev' not described in 'media_devnode'
>> ./scripts/kernel-doc: ./include/media/media-devnode.h:155: warning: Excess struct member 'cdev' description in 'media_devnode'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

