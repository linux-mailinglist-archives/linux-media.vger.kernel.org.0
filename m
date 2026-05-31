Return-Path: <linux-media+bounces-63168-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGK0BmPkG2pzHAkAu9opvQ
	(envelope-from <linux-media+bounces-63168-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 09:33:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 719B5614D41
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 09:33:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2A533033F82
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 07:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC319376A00;
	Sun, 31 May 2026 07:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VKU3f0zQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4986935838A
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 07:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780212795; cv=none; b=bJHmeKH7dwfDLVNRDAvj99Cv9te+NOEuSThA5ltUS8IN82bu49TBplpqDdZsJZifj9qHHgg0OSc6Y4HvRFqF9kdcn3M3V1K8xim/AKTY4VQ49M0FLnJRkl1SljmhLRO24k/0hBoLJK4cM7GEn6l/UwFhqGhbegPBxIKU7xqhyvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780212795; c=relaxed/simple;
	bh=ON4op0xyIxO0r+QlnW8n6GqwvGv5itj2Hm/YY7J1G8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PAgWeErd7rSaQp4GdHTQoW9z7fJmRlOPGxTuz8feg4iJQa+j2BRJfRTmWYwQfZ7qFST1oS1mGiniR9AEJmLJx7haBWKofUGB2AYrwlRKApaSaCbbJMAraUXaKcNKck8Cv1sgzsqIT0SHEEc58r+Oqpa2qAsvr2NHG+Hdvhno8ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VKU3f0zQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780212793; x=1811748793;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ON4op0xyIxO0r+QlnW8n6GqwvGv5itj2Hm/YY7J1G8k=;
  b=VKU3f0zQuz5/kiZoFGze9JZ/pgas2rb4Ui6MwN29eevlBzzJHT9e7dej
   w/Uid01KWjHPaAY1Kv/4A9qtl9r3DmvBlimxtrAp/1hZMOD3F74NJ1iMm
   TH50/SfPyrQNGY+bt2Vp9hXMCd1FKnQ7ETAhuYLrlaAW5fekuY/pxAdki
   PraPgSkzYw5/Fac8dv3F9NO6IEX2GhFKCCg0NNLvgANbt/+FCm6Zsnal5
   Nf+8boLO08vs+gc/ZhDXnO8zfWfkhKLnxhe6qZoURKS8LxLGIrjOOjO8d
   w9gcUu9XQooNhEsjeiw0c9QXbGklIGVPs9fxq8eFWQFJx2rHtElBFOZgc
   Q==;
X-CSE-ConnectionGUID: qkcXi9yYRkCiN2z0+Plx/w==
X-CSE-MsgGUID: f3E3EcWzTMyLnDTZ7KHmzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11802"; a="91312224"
X-IronPort-AV: E=Sophos;i="6.24,178,1774335600"; 
   d="scan'208";a="91312224"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 00:33:13 -0700
X-CSE-ConnectionGUID: d7hqS9uJSri6DlxUO/zX+A==
X-CSE-MsgGUID: u4CJiThARsSt0DchGPiYwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,178,1774335600"; 
   d="scan'208";a="240729373"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 May 2026 00:33:11 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTafV-000000009Eg-2hYK;
	Sun, 31 May 2026 07:33:09 +0000
Date: Sun, 31 May 2026 15:32:57 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] [TEST] add a broken patch
Message-ID: <202605311536.iMbfNXsu-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63168-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email,intel.com:mid,intel.com:dkim,01.org:url,git-scm.com:url]
X-Rspamd-Queue-Id: 719B5614D41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mauro,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]
[also build test ERROR on staging/staging-next staging/staging-linus sailus-media-tree/master linus/master v7.1-rc5 next-20260529]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mauro-Carvalho-Chehab/add-a-broken-patch/20260530-194048
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/9050789262f583cef777eb3a9c3e07948faf18c3.1780141190.git.mchehab%2Bhuawei%40kernel.org
patch subject: [PATCH] [TEST] add a broken patch
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20260531/202605311536.iMbfNXsu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260531/202605311536.iMbfNXsu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605311536.iMbfNXsu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/media/atomisp/pci/sh_css.c:91:31: error: expected ';' before 'int'
      91 | FOOBAR_SYNTAX_BREAK_BY_PURPOSE
         |                               ^
         |                               ;
   ......
      94 | int  __printf(1, 0) (*sh_css_printf)(const char *fmt, va_list args) = NULL;
         | ~~~                            


vim +91 drivers/staging/media/atomisp/pci/sh_css.c

    90	
  > 91	FOOBAR_SYNTAX_BREAK_BY_PURPOSE
    92	
    93	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

