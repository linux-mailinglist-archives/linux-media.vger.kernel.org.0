Return-Path: <linux-media+bounces-56587-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGvFAN1ovmmTOwMAu9opvQ
	(envelope-from <linux-media+bounces-56587-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 10:46:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 791942E4749
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 10:46:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49DBB3028ED6
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 09:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9E2018A6D4;
	Sat, 21 Mar 2026 09:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EWdKR5a8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B61D13B7A3;
	Sat, 21 Mar 2026 09:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774086350; cv=none; b=mVZS1VHYhFyKkpk5tRLALpiALfft07LdYYg7NHDPOdW+QOKpygyZrAe9Tt5wf7bm3wNlHKdDXgjePsWBPM2Rza7wL1GqQWt7JUiwaJPOEID9/WgPSjxQgzhKQb/Wy/OcsUJ71UrVpxr5Z0cXxXNqnyuQIdhildIeBQs2q1s3Luo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774086350; c=relaxed/simple;
	bh=S+jm/ii2kxUYuMJm6gT4C4tkoQkVOG9T5rJyLE34dvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JpzmFf6WscZdL32JI1nFMR52PuzwbliSiSpHabAKiwu6LTNVcBnNm3UtdAU/qyO+8Y01s5j45Y8ZyXzpJcYvCP13OuQyv4Q87Fu2rd83+yTdRgJ0x5l+yFf3v9XleXrxW1rr2YJwBICiEscUJ6oGBVKUkHwx31XKDjVAvmi/WNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EWdKR5a8; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774086349; x=1805622349;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S+jm/ii2kxUYuMJm6gT4C4tkoQkVOG9T5rJyLE34dvw=;
  b=EWdKR5a8gYCvYFvOzQtVNiQztF39G8MNuaIP76GNdzviRqIw6w+rwlIZ
   9eEAu6RCMYQw55ucSATJUisLrl+Pinm9Fu4lsVnngc5dejHrYS2uGtlwa
   xwmCS7RnyJy/MDrh1LZjWkU332P6dLUlzaqbsAkWsVvi8ZI8RwJ/SgKAw
   x7SjZIic+dHeL7G1X0zGVT2njCwMnWELsW9Tx4yvCXkzlXXKohr6shpsc
   JhdHqXcstRU4ZcHmrj6EKsDAuGee0O+WrlDiHJ/9Ao4ClephEYVbM3gMg
   BcOzqDq90ATdHnFirm9t2cRGNbFW9VVgvBCH6MmhsHy3QPtMjuoGqYOPa
   g==;
X-CSE-ConnectionGUID: /fJYk684RxGuuqQAS0xXow==
X-CSE-MsgGUID: Uwb8oYDWTUmcKA6fATRjMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75188822"
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="75188822"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 02:45:45 -0700
X-CSE-ConnectionGUID: oBxae4lwTzOUpl6x0t9N+A==
X-CSE-MsgGUID: P3RjKDU8RQqwyekf6MjXyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="222764785"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 21 Mar 2026 02:45:41 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3stn-000000000Yb-14ZI;
	Sat, 21 Mar 2026 09:45:39 +0000
Date: Sat, 21 Mar 2026 17:44:51 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Chatard <tchatard@gmail.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, lee@kernel.org,
	djrscally@gmail.com, hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net, Thierry Chatard <tchatard@gmail.com>
Subject: Re: [PATCH 2/5] platform/x86: int3472: tps68470: fix GNVS clock
 fields for Dell Latitude 5285
Message-ID: <202603211747.Z6xudmNd-lkp@intel.com>
References: <20260320000937.9177-3-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320000937.9177-3-tchatard@gmail.com>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56587-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,kernel.org,gmail.com,linux.intel.com,ideasonboard.com,rothemail.net];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxtv.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,01.org:url,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Queue-Id: 791942E4749
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Thierry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linuxtv-media-pending/master]
[also build test WARNING on media-tree/master sailus-media-tree/master linus/master v7.0-rc4 next-20260320]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thierry-Chatard/platform-x86-intel_lpss-add-resource-conflict-quirk-for-Dell-Latitude-5285/20260321-081146
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20260320000937.9177-3-tchatard%40gmail.com
patch subject: [PATCH 2/5] platform/x86: int3472: tps68470: fix GNVS clock fields for Dell Latitude 5285
config: i386-randconfig-141-20260321 (https://download.01.org/0day-ci/archive/20260321/202603211747.Z6xudmNd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603211747.Z6xudmNd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603211747.Z6xudmNd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/platform/x86/intel/int3472/tps68470.c:178 function parameter 'p' not described in 'aml_parse_int'
>> Warning: drivers/platform/x86/intel/int3472/tps68470.c:178 function parameter 'end' not described in 'aml_parse_int'
>> Warning: drivers/platform/x86/intel/int3472/tps68470.c:178 function parameter 'val' not described in 'aml_parse_int'
>> Warning: drivers/platform/x86/intel/int3472/tps68470.c:211 function parameter 'tbl' not described in 'dell5285_gnvs_from_table'
>> Warning: drivers/platform/x86/intel/int3472/tps68470.c:211 function parameter 'addr' not described in 'dell5285_gnvs_from_table'
>> Warning: drivers/platform/x86/intel/int3472/tps68470.c:211 function parameter 'size' not described in 'dell5285_gnvs_from_table'
>> Warning: drivers/platform/x86/intel/int3472/tps68470.c:247 function parameter 'addr' not described in 'dell5285_gnvs_find'
>> Warning: drivers/platform/x86/intel/int3472/tps68470.c:247 function parameter 'size' not described in 'dell5285_gnvs_find'
>> Warning: drivers/platform/x86/intel/int3472/tps68470.c:178 function parameter 'p' not described in 'aml_parse_int'
>> Warning: drivers/platform/x86/intel/int3472/tps68470.c:178 function parameter 'end' not described in 'aml_parse_int'
>> Warning: drivers/platform/x86/intel/int3472/tps68470.c:178 function parameter 'val' not described in 'aml_parse_int'
>> Warning: drivers/platform/x86/intel/int3472/tps68470.c:211 function parameter 'tbl' not described in 'dell5285_gnvs_from_table'
>> Warning: drivers/platform/x86/intel/int3472/tps68470.c:211 function parameter 'addr' not described in 'dell5285_gnvs_from_table'
>> Warning: drivers/platform/x86/intel/int3472/tps68470.c:211 function parameter 'size' not described in 'dell5285_gnvs_from_table'
>> Warning: drivers/platform/x86/intel/int3472/tps68470.c:247 function parameter 'addr' not described in 'dell5285_gnvs_find'
>> Warning: drivers/platform/x86/intel/int3472/tps68470.c:247 function parameter 'size' not described in 'dell5285_gnvs_find'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

