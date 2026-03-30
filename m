Return-Path: <linux-media+bounces-57632-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEK5Ms6EymkW9gUAu9opvQ
	(envelope-from <linux-media+bounces-57632-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:12:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5091A35C9DC
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 36E56300F128
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 14:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559113D6CA5;
	Mon, 30 Mar 2026 14:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O1Z4uhV8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58503D7D87;
	Mon, 30 Mar 2026 14:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774879940; cv=none; b=ZWLjhUrMiJg7924h/AkT+lNG/sAITcwNXN0vJViUH4BIegG1rn/WUU+GZwmyUpBygIJAF0BJ4VdPbLgVsbI+Z+GLu4XxFWDjPPJ8YXvsd9EAEW/Re5eoZ+rTs8T6Xir1iVs+z2xjpC+4RJ2za40ycMOUq2d7xhqXF0enyF5EwCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774879940; c=relaxed/simple;
	bh=ehU06OoIuKwC2QS/IYuZyMcHXPB/i0LtXjDTVpnidEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EoRHytgqCoUMHhIGPV49nHevf9+4sKH9vbs3E9DblQeYZZ6N2wZ1sSCW3m3mXvAK/zsq5+yxWDmi86H5/4UZyLohsWaE7yjacxgBcBTta79ooWbUaY9zxg7kI6CF6ihZuGfiK4lMtmNPyzIKOtMNCox/CfdIUI6HUCWZ49kSVTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O1Z4uhV8; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774879938; x=1806415938;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ehU06OoIuKwC2QS/IYuZyMcHXPB/i0LtXjDTVpnidEQ=;
  b=O1Z4uhV8yM19t8aDt8KpiCqc1abVNUeVHuWqhh/0FV4DEG2Ua2kZ3zYe
   lDOLaLmiEU/6OQ8Qxqnjclx7Xmw2+EEOalG97+DaZbpkje685VjQqR1kH
   9hJAA6xYxhjOiOsKGrsxymrKEb1ypsUXLHK5XN0H40gcj6FRWJl5RPZij
   Mpzagu+nzWXvz+diaHtvVM0nD6AWrvwhtgqZC8AOlSxCEZXyD5sRVCAAI
   ns4+7bfrTJpM9rYBJt6M89Fl9GVgUJWqoM325P4QL8DhVPugflQELNqKf
   xw7kvXlTrob3N0xF8/BiBplrCDeQGF6EzjQTexK/9yrIdNvBkUUhmVDex
   g==;
X-CSE-ConnectionGUID: Pp5DPhiGTQ+owpiptJtCaA==
X-CSE-MsgGUID: eTNPpqThSGKGa92rAtzXFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75761508"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="75761508"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 07:12:18 -0700
X-CSE-ConnectionGUID: 7TScrLw/S5WafBz4XS6YVA==
X-CSE-MsgGUID: nKtq4DDRSDOPdBlYJA8/bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="249122850"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 Mar 2026 07:12:15 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7DLg-000000001Bh-3fe4;
	Mon, 30 Mar 2026 14:12:12 +0000
Date: Mon, 30 Mar 2026 22:11:58 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Laux <matthew.laux@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Matthew Laux <matthew.laux@gmail.com>
Subject: Re: [PATCH v3 1/1] staging: media: add driver for StarTech USB3HDCAP
Message-ID: <202603302245.CxjAt9gS-lkp@intel.com>
References: <20260329045612.6899-2-matthew.laux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329045612.6899-2-matthew.laux@gmail.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57632-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Queue-Id: 5091A35C9DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Matthew,

kernel test robot noticed the following build errors:

[auto build test ERROR on 2c8fe1f14240d75f2002e16b2b69c5c2d27ed41c]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Laux/staging-media-add-driver-for-StarTech-USB3HDCAP/20260329-215100
base:   2c8fe1f14240d75f2002e16b2b69c5c2d27ed41c
patch link:    https://lore.kernel.org/r/20260329045612.6899-2-matthew.laux%40gmail.com
patch subject: [PATCH v3 1/1] staging: media: add driver for StarTech USB3HDCAP
config: powerpc-randconfig-r064-20260330 (https://download.01.org/0day-ci/archive/20260330/202603302245.CxjAt9gS-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603302245.CxjAt9gS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603302245.CxjAt9gS-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "usb_alloc_urb" [drivers/staging/media/usb3hdcap/usb3hdcap.ko] undefined!
>> ERROR: modpost: "usb_free_urb" [drivers/staging/media/usb3hdcap/usb3hdcap.ko] undefined!
>> ERROR: modpost: "usb_register_driver" [drivers/staging/media/usb3hdcap/usb3hdcap.ko] undefined!
>> ERROR: modpost: "usb_put_dev" [drivers/staging/media/usb3hdcap/usb3hdcap.ko] undefined!
>> ERROR: modpost: "usb_get_dev" [drivers/staging/media/usb3hdcap/usb3hdcap.ko] undefined!
>> ERROR: modpost: "usb_submit_urb" [drivers/staging/media/usb3hdcap/usb3hdcap.ko] undefined!
>> ERROR: modpost: "usb_control_msg" [drivers/staging/media/usb3hdcap/usb3hdcap.ko] undefined!
>> ERROR: modpost: "usb_set_interface" [drivers/staging/media/usb3hdcap/usb3hdcap.ko] undefined!
>> ERROR: modpost: "usb_deregister" [drivers/staging/media/usb3hdcap/usb3hdcap.ko] undefined!
>> ERROR: modpost: "usb_kill_urb" [drivers/staging/media/usb3hdcap/usb3hdcap.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=y] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

