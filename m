Return-Path: <linux-media+bounces-52072-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNaWO8SMgWl/HAMAu9opvQ
	(envelope-from <linux-media+bounces-52072-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 06:51:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E020D4CEF
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 06:51:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36102303206C
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 05:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 574922777FC;
	Tue,  3 Feb 2026 05:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YKk/FeKr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B4D4A21
	for <linux-media@vger.kernel.org>; Tue,  3 Feb 2026 05:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770097852; cv=none; b=GLp6Ycccz/qO6fQpqD4YlzxuAV1Q3SJImI7WB6yHduTtvnijX6KmiybDKMEtykDNKfnselo+/Tto965LbYDXnGuu+fr2ysv1xYAH6W2qwJMKRckfypeJSXnWxyTjbIQsEgb+jjm1wljwGwZjqbWKlvCqhTZ4z29qW4tZ+CBv4xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770097852; c=relaxed/simple;
	bh=k+OwphlbuupRKVPYLdqHf38u/vmQSVGDl+2cvGtkL+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SXT3eFk8ATEcvtXd+h6OV1OsQfsp0bvddwb3OGVkD3v3M8suct89V7pNjaUya5k6gBLGvrzPB9z3St43N/m3PVAmZSkzK9D2oFzHF2Suj9xY74ISahRXwbP38IhgJ9/RRAST8WovxW1oOVS+DETPZHWcO/eNn3kAwOKBAqIV1dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YKk/FeKr; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770097851; x=1801633851;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k+OwphlbuupRKVPYLdqHf38u/vmQSVGDl+2cvGtkL+8=;
  b=YKk/FeKrC+V85Ex0YXg9D67x+OmCsNuBZxpUFhjrLpINlcfGBzLLkvrJ
   IhGNSNlBHDadzgvE+LOiHtcpBBb2zDAmiTAbkcgKrwyYQvnT+9eClpALB
   lplrUg9wC0e1P/vUC513KT7oCfMp+mTsWiYegKLyOdOYcvx6t8lB3/z2x
   7Bx1KERd8fUjyZ95jIWZIvhxie3iXtLq7Sn6muV6MC4RRbBHPMaypfm06
   YWHqhSKokYNQSfwC79t4Ent+5sI8vMJPhtH8Xp+72YcteS4QkFRGlI0dg
   FrKfU+KP1aDASp3wPQHkNgMlftOcsTGDjau6GuryZ+2b4sqgwfSXTPTjF
   w==;
X-CSE-ConnectionGUID: h+UxKQ47QnqhuratM7w1PQ==
X-CSE-MsgGUID: 1eKv9CRyQS2RXbwQH7G1sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71169000"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="71169000"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 21:50:51 -0800
X-CSE-ConnectionGUID: f80bBftaQWC68Y8bbCCudw==
X-CSE-MsgGUID: X/wHmXYqQ9yaXkecq/cAjQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 Feb 2026 21:50:48 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vn9JG-00000000gIo-0T3q;
	Tue, 03 Feb 2026 05:50:46 +0000
Date: Tue, 3 Feb 2026 13:50:04 +0800
From: kernel test robot <lkp@intel.com>
To: Faizel K B <faizel.kb@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	libcamera-devel@lists.libcamera.org,
	Faizel K B <faizel.kb@gmail.com>
Subject: Re: [PATCH v2 2/3] media: vimc: sensor: Add pixel_rate,vblank and
 hblank configuration
Message-ID: <202602031319.6Nd13RwV-lkp@intel.com>
References: <20260202194645.1287757-3-faizel.kb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202194645.1287757-3-faizel.kb@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,lists.libcamera.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org,ideasonboard.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52072-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3E020D4CEF
X-Rspamd-Action: no action

Hi Faizel,

kernel test robot noticed the following build errors:

[auto build test ERROR on c824345288d11e269ce41b36c105715bc2286050]

url:    https://github.com/intel-lab-lkp/linux/commits/Faizel-K-B/media-vimc-sensor-Move-vimc_sensor_device-to-common-header/20260203-035653
base:   c824345288d11e269ce41b36c105715bc2286050
patch link:    https://lore.kernel.org/r/20260202194645.1287757-3-faizel.kb%40gmail.com
patch subject: [PATCH v2 2/3] media: vimc: sensor: Add pixel_rate,vblank and hblank configuration
config: powerpc-randconfig-002-20260203 (https://download.01.org/0day-ci/archive/20260203/202602031319.6Nd13RwV-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602031319.6Nd13RwV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602031319.6Nd13RwV-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__divdi3" [drivers/media/test-drivers/vimc/vimc.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=n] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]
   WARNING: unmet direct dependencies detected for NET_SELFTESTS
   Depends on [n]: NET [=y] && PHYLIB [=y] && INET [=n]
   Selected by [y]:
   - AMD_XGBE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_AMD [=y] && (OF_ADDRESS [=y] || ACPI || PCI [=n]) && HAS_IOMEM [=y] && (X86 || ARM64 || COMPILE_TEST [=y]) && PTP_1588_CLOCK_OPTIONAL [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

