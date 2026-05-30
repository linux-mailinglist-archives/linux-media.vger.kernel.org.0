Return-Path: <linux-media+bounces-63150-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLpnDlt2G2oADQkAu9opvQ
	(envelope-from <linux-media+bounces-63150-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 01:44:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 186FE613E6C
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 01:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 790C43025290
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 23:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6185F3783A1;
	Sat, 30 May 2026 23:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H6ZPRpQ4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4383546E8
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 23:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780184589; cv=none; b=sTev+l5K6gK6pX86RCMru9uzsZGp1QWT22vdL1fTU23NVs98ohMqvkd5WMMePdO/VL3l2UrBk9oXEQP+o8S5sVJk/dTLdtlghmumOWpNndapRjrTvz0/Xepo7+T8YAi6eD+kZaCglGCzmsuyjOcDHu0EyGI/BJqsk6+SiaJeAUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780184589; c=relaxed/simple;
	bh=6UEtp5cJrG0/ctHrMRtxUfaitpU3/366G0FBrSuy0Lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QkEZms6wsTkIB1YGQyPJOQWWlk+qIlO4CDWsPuewnkwVDLSklyTMG8atOS4TE48383glWKtZ0SjERRuWfny1LREAhfhsSwfLQ66TxpYwmICca86lCcUi/w5OmgWjtwMEaf59KnesMOPscH/m+jdsavcpAFRUzXmkEncDNLq+yKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H6ZPRpQ4; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780184588; x=1811720588;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6UEtp5cJrG0/ctHrMRtxUfaitpU3/366G0FBrSuy0Lo=;
  b=H6ZPRpQ4jOJj/AM3TUMsRL7lln/RT8iu4e+HUoUx67vYGCjcymUsLIFr
   UGiJZjl7nhgs0g3qqr18bvF+KmhTlJl+9BdM8iDKTSK3hES5xaPZtmQvF
   HO+u3WsN7p2PgdiBb91JU/WpDrAP0QnzZmJtIHrg1J9zsjARDRqzxw01v
   Roc+fsi8dmXVp/k+z72Vgw3r4yZDLG/Q2CdxgLN2hsf4xvj2rdprp56/H
   ze0HLI3dQHGygcM/VIGBAY20e23yAodpX2cASfi9JfU2WF8vGkCfrMDvZ
   GbITkg9YNpfaHrpFVzubXv25zEjTqvUDBeJ2NhNsW7YkSVCfBnOsguIHx
   A==;
X-CSE-ConnectionGUID: L4fAVGslQxuykTb2Mu/ixA==
X-CSE-MsgGUID: hYc4Sd8vSVOealy0+wqN7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11802"; a="84849479"
X-IronPort-AV: E=Sophos;i="6.24,178,1774335600"; 
   d="scan'208";a="84849479"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 16:43:07 -0700
X-CSE-ConnectionGUID: GJleeBbPSLu4SZVIMXP6eA==
X-CSE-MsgGUID: wkqRRNVaQsel5UF928mo3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,178,1774335600"; 
   d="scan'208";a="239009345"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 May 2026 16:43:06 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTTKZ-000000008xy-2Yo3;
	Sat, 30 May 2026 23:43:03 +0000
Date: Sun, 31 May 2026 07:42:38 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] [TEST] add a broken patch
Message-ID: <202605310729.zrGRsEVN-lkp@intel.com>
References: <9050789262f583cef777eb3a9c3e07948faf18c3.1780141190.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9050789262f583cef777eb3a9c3e07948faf18c3.1780141190.git.mchehab+huawei@kernel.org>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63150-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[git-scm.com:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,01.org:url]
X-Rspamd-Queue-Id: 186FE613E6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mauro,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]
[also build test ERROR on staging/staging-next staging/staging-linus sailus-media-tree/master sailus-media-tree/streams linus/master v7.1-rc5 next-20260529]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mauro-Carvalho-Chehab/add-a-broken-patch/20260530-194048
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/9050789262f583cef777eb3a9c3e07948faf18c3.1780141190.git.mchehab%2Bhuawei%40kernel.org
patch subject: [PATCH] [TEST] add a broken patch
config: x86_64-buildonly-randconfig-002-20260531 (https://download.01.org/0day-ci/archive/20260531/202605310729.zrGRsEVN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260531/202605310729.zrGRsEVN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605310729.zrGRsEVN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/media/atomisp/pci/sh_css.c:91:1: error: unknown type name 'FOOBAR_SYNTAX_BREAK_BY_PURPOSE'
      91 | FOOBAR_SYNTAX_BREAK_BY_PURPOSE
         | ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=m] && OF [=n]
   Selected by [m]:
   - PINCTRL_STMFX [=m] && PINCTRL [=y] && I2C [=m] && HAS_IOMEM [=y]


vim +/FOOBAR_SYNTAX_BREAK_BY_PURPOSE +91 drivers/staging/media/atomisp/pci/sh_css.c

    90	
  > 91	FOOBAR_SYNTAX_BREAK_BY_PURPOSE
    92	
    93	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

