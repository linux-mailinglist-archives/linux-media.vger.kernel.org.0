Return-Path: <linux-media+bounces-52319-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPUpNGAohmmLKAQAu9opvQ
	(envelope-from <linux-media+bounces-52319-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 18:44:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 24538101496
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 18:43:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3CBEB305C8B4
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 17:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA128423A92;
	Fri,  6 Feb 2026 17:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aTmYaaj2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD8F42188A
	for <linux-media@vger.kernel.org>; Fri,  6 Feb 2026 17:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770399731; cv=none; b=GOY5uR3xIqvhnBxnhEIbNebxEzTkiAemsO1/eZIwTBgZc/QsbZ8iigoP5e3ToX94TvhWKumOTE9zXHgREvPEZKk9WFC5Rz2eAjZ4RM7GVw7a5GF0d9g3da1G8CPjnESn3KnboEmu4NA3W+MgwyD84nt1N1d3h39RRqQsH+U6usk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770399731; c=relaxed/simple;
	bh=4OpYGUcqd51Ikckroc837TwpMOD0qU46yuTfGkpIFuo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=D5JIOkFrmvWGTH8aX3fjF0OAxoV8a0dBqxCGOsI5V7ST/4/IlM4qrgkRgYjWdAv0bue4Z8+xyNut44RtkYm/xjxnHzGmTx0/hK0Vf32ckl73RqkCk/bEpzvV/kuh9ayadIWOMUeZB+u832ckniD/8d9ZMcgyQOriCTzkWIpgtKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aTmYaaj2; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770399730; x=1801935730;
  h=date:from:to:cc:subject:message-id;
  bh=4OpYGUcqd51Ikckroc837TwpMOD0qU46yuTfGkpIFuo=;
  b=aTmYaaj2snlZGqDC/DrqvUsBXiAE9lPtdVab5b/EQ2VetfHH9en/WEWC
   00C+CSILF0yQ5rKiJnd1ZSDfGUSDmhDiQPeB+EoqP5kNsOztaa/9pLEVd
   RWJO2nCWmQXMv0KC5Hi8BRQCTeVESlyNbKUuyTs29xJ5z37a6BOuahquw
   Nw+CFFec9W01LC3fgELUluuWgnzdHFDoPVMHGYV0jrCpNzMUgs8/9wT+e
   vlP0X0Aem4flCU5qDO3Y40YChUCW3LlonIU5ithndyXDvWCyBYU3fshQd
   /YxYtPFIIDLvCat8MSRuvk/kdIvogHzAZgxgrXLlNeRBgGnQhUeuA14Bv
   w==;
X-CSE-ConnectionGUID: hPa1cGK0SUmsqm4myZ3uVA==
X-CSE-MsgGUID: xG5GEwHRRfqdASMNPoJhuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="75462342"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="75462342"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 09:42:10 -0800
X-CSE-ConnectionGUID: owE/mCttR5G1QVC51pk1gQ==
X-CSE-MsgGUID: nJ6LKL6lSoGKo3Ql8i/lHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="241354211"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Feb 2026 09:42:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voPqH-00000000ky6-3vJW;
	Fri, 06 Feb 2026 17:42:05 +0000
Date: Sat, 07 Feb 2026 01:41:50 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata-pre 13/13] Warning:
 drivers/media/i2c/imx274.c:1075 function parameter 'ci' not described in
 'imx274_get_fmt'
Message-ID: <202602070144.zjnSVXAx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52319-lists,linux-media=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,01.org:url]
X-Rspamd-Queue-Id: 24538101496
X-Rspamd-Action: no action

tree:   git://linuxtv.org/sailus/media_tree.git metadata-pre
head:   1b58854744d17413b2855b20178e63a1c82d58f5
commit: 1b58854744d17413b2855b20178e63a1c82d58f5 [13/13] media: v4l: Add struct v4l2_subdev_client_info argument to pad ops
config: loongarch-randconfig-002-20260206 (https://download.01.org/0day-ci/archive/20260207/202602070144.zjnSVXAx-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070144.zjnSVXAx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602070144.zjnSVXAx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/media/i2c/imx274.c:1075 function parameter 'ci' not described in 'imx274_get_fmt'
>> Warning: drivers/media/i2c/imx274.c:1098 function parameter 'ci' not described in 'imx274_set_fmt'
>> Warning: drivers/media/i2c/imx274.c:1075 function parameter 'ci' not described in 'imx274_get_fmt'
>> Warning: drivers/media/i2c/imx274.c:1098 function parameter 'ci' not described in 'imx274_set_fmt'
--
>> Warning: drivers/media/i2c/imx334.c:763 function parameter 'ci' not described in 'imx334_get_pad_format'
>> Warning: drivers/media/i2c/imx334.c:791 function parameter 'ci' not described in 'imx334_set_pad_format'
>> Warning: drivers/media/i2c/imx334.c:763 function parameter 'ci' not described in 'imx334_get_pad_format'
>> Warning: drivers/media/i2c/imx334.c:791 function parameter 'ci' not described in 'imx334_set_pad_format'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

