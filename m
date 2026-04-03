Return-Path: <linux-media+bounces-58033-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SODEOul/z2mvwgYAu9opvQ
	(envelope-from <linux-media+bounces-58033-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 10:52:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 549BA3925C2
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 10:52:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EBE4301982C
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2026 08:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F183237EFF4;
	Fri,  3 Apr 2026 08:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DxEVYf6Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4850E283CB1
	for <linux-media@vger.kernel.org>; Fri,  3 Apr 2026 08:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206022; cv=none; b=kseoa5f1yg/6VT5or70sbesMMGDAYEogx7trDIkAAA/iJgR8wxaOpbPCp0Mio+z+Eqq3jwcsen6QMnpULcJ6SUdS/JKpKF251XtJZBu4/Z02wZtUuTF2x6Gg6UPYd2/e9aQGelBq7ETWbXIb1uqdSryugvsckh+vnb98KEcoR8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206022; c=relaxed/simple;
	bh=CHzWtnJhUr2W4KctuglNa+kJqGqt9CPYSRAi7990V70=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S2p9qLOnHXbzz74jWoDsy5AGhNSQIoGtxDU+LRoAM42eCYNl7xEeRHy+zjI5P0XW+1SFPnNl5x6W5NxoTEfhCnFt6qDLhN8GnSU3RlmpCMqv5q2XatYxIB9oTeI7tDWTxCt58fgSKhPpejufHFpiS10t/eqVwZIQ+4lDVzoVyRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DxEVYf6Y; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775206021; x=1806742021;
  h=date:from:to:cc:subject:message-id;
  bh=CHzWtnJhUr2W4KctuglNa+kJqGqt9CPYSRAi7990V70=;
  b=DxEVYf6YrfO//zuNreeJLg+ZEkLBRE5VtkNYhE2KQIkGw1sq06JsqZH9
   pSP+vtJ0YXl+ZRD0dmkpAuPSTgiUPa+UoTWvECu0yLdN3jbQxGyUzqekY
   62TIt97X5HgVaLMuXWOjvT98+N3+GQCpjGD8bJsHqZN76LkpVpRBdXyxS
   nkexM5sSRFaAzXAhbldE5sLnI8oNiIUuyAt9tuaw/U60g5uV7r/S2tmmL
   B5hnkJbkJxiE7vEVuiSmv9JVMVrF/I7o8EoHHVylJIoBxpXPulbCmtjv2
   P7uCEeDwW9ap3jXzvANxmgW/0dYDzaVrzj38HkN0SLHiD2qq+p53LN8Pk
   Q==;
X-CSE-ConnectionGUID: qrFAp11VSAC6DuV/qHcu6Q==
X-CSE-MsgGUID: /7jCzD0/RFOyINYLIspWPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75312100"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="75312100"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:47:01 -0700
X-CSE-ConnectionGUID: t1+RovnPQx2+9SHgz6pp7g==
X-CSE-MsgGUID: jNt4V+xZRrOnR/LCfp6eTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="250287308"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Apr 2026 01:46:59 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8aB7-0000000016y-044N;
	Fri, 03 Apr 2026 08:46:57 +0000
Date: Fri, 03 Apr 2026 16:46:23 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 87/109] ld.lld: error: undefined
 symbol: __divdi3
Message-ID: <202604031211.ZXvlxRg9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58033-lists,linux-media=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,01.org:url,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Queue-Id: 549BA3925C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   feb4f7361e07b561023576f7d47ff4f8b8e5db69
commit: fe00925f7b474798a3a16e41ca0e7d9a1c12b3e7 [87/109] media: imx219: Support LINE_LENGTH_PIXELS and FRAME_LENGTH_LINES controls
config: i386-buildonly-randconfig-002-20260403 (https://download.01.org/0day-ci/archive/20260403/202604031211.ZXvlxRg9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604031211.ZXvlxRg9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604031211.ZXvlxRg9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __divdi3
   >>> referenced by imx219.c:540 (drivers/media/i2c/imx219.c:540)
   >>>               drivers/media/i2c/imx219.o:(imx219_apply_binning) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

