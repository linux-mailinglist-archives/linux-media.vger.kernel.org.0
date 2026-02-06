Return-Path: <linux-media+bounces-52322-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHp+L1UthmnkKAQAu9opvQ
	(envelope-from <linux-media+bounces-52322-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 19:05:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF79101988
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 19:05:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EE93302A079
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 18:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A5FD3DA7E2;
	Fri,  6 Feb 2026 18:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZBx9pav"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D3935F8D9
	for <linux-media@vger.kernel.org>; Fri,  6 Feb 2026 18:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770401051; cv=none; b=Mi9oVHvQDDbtZpbj30upAfDILOZ4SRwptC2YjfDD9J9cWIqK7lAZu4QWgDq8CmTfRZjanjHwQ8NJgoPAqEDFCaflgy2TLZMqpaOqiwqQ1TZ8Xw88NSoPfQHg7/qllsFoUtc9XeqhNQpETUSfdB5rqsdjaocBYjPhwerLXIuejO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770401051; c=relaxed/simple;
	bh=BIyzR1QV3JuETEjTYOnCoDTvTxeMgb+AWSVpXMod8b4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LvZV5nit3eg+uTu2//PtOwp9ryBycRX32I9ssGsuLzwaxhI2Ps/Qc4SE/Pt/aMQ9apOYH+TTAp+leol85tZUFpOTFU6hupXjlWxdSbCaSIjDfixHxlPnUWCRZIEbjykuwxkdLPwHIz9RftxNNINQO7nOwB4jO7L2XZJBVuDnwO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZBx9pav; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770401051; x=1801937051;
  h=date:from:to:cc:subject:message-id;
  bh=BIyzR1QV3JuETEjTYOnCoDTvTxeMgb+AWSVpXMod8b4=;
  b=nZBx9pavfDq+V8iMNjW3+Rz7WN5gs2V7wuRX2B4RqVzfcUyG669JDnKG
   bVSGOGbeNAbNG+nO39bM1M5M9Zawfqy//ZnjVvZM1o+e0bRLfL8aNvBbU
   MG6BSdndXDUFnb0ZJ+Re8PP2nn2ZsXlyLK7gVOQvfs9aapsu4Fm7etFGz
   s6wwrq2clmW3BaHOlVfnh1iBc6zjMCPCI3m2Zk3KBAZq8WPx+HSXsqogy
   9F4e+oAq76WFklNesiKjH+W5FCyYu2+tTPhKAFTLuSV+WNmmrTIu6Xr5J
   AP+C7i6IoNLns5mS6LOQtHEutbhjP5exosjCfH4cmRlMejMIOrU7Rkoqm
   g==;
X-CSE-ConnectionGUID: pbuAGL3PQFeRlqyZQOc7Yg==
X-CSE-MsgGUID: Cc+Cuc7hQciadmDoNzAcww==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="82725693"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="82725693"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 10:04:11 -0800
X-CSE-ConnectionGUID: MYNe91w1QOaENBSl0nu8mQ==
X-CSE-MsgGUID: 7oe1pB51QniYuHZ5yq7r0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="210220509"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Feb 2026 10:04:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voQBa-00000000kzE-3Z8X;
	Fri, 06 Feb 2026 18:04:06 +0000
Date: Sat, 07 Feb 2026 02:03:20 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata-pre 13/13] Warning:
 drivers/media/i2c/tvp514x.c:891 function parameter 'ci' not described in
 'tvp514x_get_pad_format'
Message-ID: <202602070152.AuqeXeCe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52322-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 1FF79101988
X-Rspamd-Action: no action

tree:   git://linuxtv.org/sailus/media_tree.git metadata-pre
head:   1b58854744d17413b2855b20178e63a1c82d58f5
commit: 1b58854744d17413b2855b20178e63a1c82d58f5 [13/13] media: v4l: Add struct v4l2_subdev_client_info argument to pad ops
config: hexagon-randconfig-002-20260206 (https://download.01.org/0day-ci/archive/20260207/202602070152.AuqeXeCe-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070152.AuqeXeCe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602070152.AuqeXeCe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/media/i2c/tvp514x.c:891 function parameter 'ci' not described in 'tvp514x_get_pad_format'
>> Warning: drivers/media/i2c/tvp514x.c:924 function parameter 'ci' not described in 'tvp514x_set_pad_format'
>> Warning: drivers/media/i2c/tvp514x.c:891 function parameter 'ci' not described in 'tvp514x_get_pad_format'
>> Warning: drivers/media/i2c/tvp514x.c:924 function parameter 'ci' not described in 'tvp514x_set_pad_format'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

