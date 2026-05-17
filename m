Return-Path: <linux-media+bounces-61871-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEpyEnpQCmqKzgQAu9opvQ
	(envelope-from <linux-media+bounces-61871-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 01:34:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A35C5645F7
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 01:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5416301A730
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 23:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C53A33D6475;
	Sun, 17 May 2026 23:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZNYVsYvj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8823329C7C;
	Sun, 17 May 2026 23:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779060846; cv=none; b=Rs8apzgtRRQyBSLV7QVhOQYxLPAb8xxcy4SRSBh08As7/clZFVnYSXzia0I6AGb4bCvu7FSPYsvvqAkEFZN4sUs9e0QA7FS6ZFC3vsQl3NtHqyH8ftt89kGR30k3Tbbc0nlALW9Oh6ekmlqdanRGk54X1wpF7rykYPmD8zcrSaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779060846; c=relaxed/simple;
	bh=dkWtgtEO4IChZ9l7NTA8vAk6rqY6Hx2CzjD6hvMDqjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i167gs+I9He3ly2zKiMNtUC9rhSk4vsYa7Au0wLrIdrvxMzAaDhmRSgLWYbjH2mqbKcEjs6SDjiPQI4Uybhf42bv/bWGtMbVpUZyQ5oJRqnMuDX30Hd1fMt73SNMsrZJBLB3lKsaR7FRRzinow25kyuQ6nwecCibVI1b49IOvBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZNYVsYvj; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779060845; x=1810596845;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dkWtgtEO4IChZ9l7NTA8vAk6rqY6Hx2CzjD6hvMDqjE=;
  b=ZNYVsYvjgc1trvhLPjbDLi53lIhEt9RWJHO5DNbW9GPDNfIS+zQlIIt8
   +7mxwr+QY69kwFM8oK0O8UZHcejMuqbyBJVlF1dIKWQ2to8+hYocSQvcB
   NkG4rDeohhtRpGEyBqbS8R5sCrF+99uaQc0Rq+ht9KrVaP3i8bcMSm+5Q
   0NTrcK4yPfA3FZNXNnnJt2Vb+BzyrX7aGjm1OcPyJopBayf0Yy1JLza5d
   DQh1BSpB5Hx1r2lUgMjvuPzn/DF53LElnPZ2hn4S18cT2W4s2R5YltmNx
   0/ZxMOibt7MEaUdNhXiVacaG7BibqVqjBWZwbkJ4dZLO3qukTcrl1u5HV
   w==;
X-CSE-ConnectionGUID: 2nxMkZiBQtGREjQbuHBbRA==
X-CSE-MsgGUID: cbwwBxaMQ3y21N3mh0r+Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="90223761"
X-IronPort-AV: E=Sophos;i="6.23,240,1770624000"; 
   d="scan'208";a="90223761"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 16:34:05 -0700
X-CSE-ConnectionGUID: YhjH7RzbQECAmXNHrbK3Dw==
X-CSE-MsgGUID: x/1BmsJGSlmYRLvbJ2xfrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,240,1770624000"; 
   d="scan'208";a="243255496"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 May 2026 16:34:03 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOkzf-0000000023m-1eGt;
	Sun, 17 May 2026 23:33:59 +0000
Date: Mon, 18 May 2026 07:33:20 +0800
From: kernel test robot <lkp@intel.com>
To: shayderrr <darknessshayder@gmail.com>, sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Pranav Bajjuri <darknessshayder@gmail.com>
Subject: Re: [PATCH] media: ipu7: fix boot config memory leak and replace
 polling loops
Message-ID: <202605180756.c4CIIUw4-lkp@intel.com>
References: <20260517143456.81109-1-darknessshayder@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517143456.81109-1-darknessshayder@gmail.com>
X-Rspamd-Queue-Id: 7A35C5645F7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-61871-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,intel.com,kernel.org,linuxfoundation.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:mid,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi shayderrr,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]
[also build test WARNING on staging/staging-next staging/staging-linus sailus-media-tree/master linuxtv-media-pending/master linus/master v7.1-rc4 next-20260508]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/shayderrr/media-ipu7-fix-boot-config-memory-leak-and-replace-polling-loops/20260517-223602
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260517143456.81109-1-darknessshayder%40gmail.com
patch subject: [PATCH] media: ipu7: fix boot config memory leak and replace polling loops
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20260518/202605180756.c4CIIUw4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605180756.c4CIIUw4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605180756.c4CIIUw4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/media/ipu7/ipu7-boot.c: In function 'ipu7_boot_stop_fw':
>> drivers/staging/media/ipu7/ipu7-boot.c:374:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     374 |         int ret;
         |             ^~~


vim +/ret +374 drivers/staging/media/ipu7/ipu7-boot.c

   369	
   370	int ipu7_boot_stop_fw(const struct ipu7_bus_device *adev)
   371	{
   372		const struct device *dev = &adev->auxdev.dev;
   373		u32 boot_state;
 > 374		int ret;
   375	
   376		boot_state = read_fw_boot_param(adev, IA_GOFO_FW_BOOT_STATE_ID);
   377		if (BOOT_STATE_IS_CRITICAL(boot_state) ||
   378		    !BOOT_STATE_IS_READY(boot_state)) {
   379			dev_err(dev, "fw not ready for shutdown, state 0x%x\n",
   380				boot_state);
   381			return -EBUSY;
   382		}
   383	
   384		dev_dbg(dev, "stopping fw...\n");
   385		write_fw_boot_param(adev, IA_GOFO_FW_BOOT_STATE_ID,
   386				    IA_GOFO_FW_BOOT_STATE_SHUTDOWN_CMD);
   387	
   388		ret = read_poll_timeout(read_fw_boot_param, boot_state,
   389					BOOT_STATE_IS_CRITICAL(boot_state) ||
   390					BOOT_STATE_IS_INACTIVE(boot_state),
   391					1000, IPU_FW_START_STOP_TIMEOUT * 1000ULL,
   392					false, adev, IA_GOFO_FW_BOOT_STATE_ID);
   393	
   394		if (BOOT_STATE_IS_CRITICAL(boot_state)) {
   395			ipu7_dump_fw_error_log(adev);
   396			dev_err(dev, "critical boot state error 0x%x\n", boot_state);
   397			return -EINVAL;
   398		} else if (!BOOT_STATE_IS_INACTIVE(boot_state)) {
   399			dev_err(dev, "stop fw timeout. state: 0x%x\n", boot_state);
   400			return -ETIMEDOUT;
   401		}
   402	
   403		ipu7_boot_cell_stop(adev);
   404		dev_dbg(dev, "stop fw done.\n");
   405	
   406		return 0;
   407	}
   408	EXPORT_SYMBOL_NS_GPL(ipu7_boot_stop_fw, "INTEL_IPU7");
   409	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

