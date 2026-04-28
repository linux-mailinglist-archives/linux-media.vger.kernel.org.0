Return-Path: <linux-media+bounces-59738-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id DgQ1BVII8Gn6NQEAu9opvQ
	(envelope-from <linux-media+bounces-59738-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 03:07:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7AD47C4C4
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 03:07:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 987AF300BBA5
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 01:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC6032367D9;
	Tue, 28 Apr 2026 01:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IHCZp/qp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4421D5174;
	Tue, 28 Apr 2026 01:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777338443; cv=none; b=CAe1VXew/XCumKh6YOTeQIa0pnC8uChvC2Iw0nVq4wMSBt5LyD/DDPy812/mD5Wd8SzpN8dMuUlB0x2JkHQnMZZt2uU/Acr9DNdZEaOgWUJvmij5k7rjggA9VMKdzKOl0sEHsSYEtYS439aGEnY0pnxgd044p+UNzksSj+lFc6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777338443; c=relaxed/simple;
	bh=LyI+lUUMCE1ZKBetq/FNJYQglULgm1bn/I/QPM9lZmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=syHe9L9X2k6ovz2w9QLl8DUIdioYoQKyz44A9MSJlMEOJr0EaFnQ+3y8l4viEbWoBZDyHpycTxjj31/8eMgQ5dU4m2DUE5tLjnbXOOpAygdFg82T3Ym9Ed6dU8m68gAlDY1Zq3HsKN4wz2FxspXdCprE9rSmBBvcpZNqiPza69g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IHCZp/qp; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777338442; x=1808874442;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LyI+lUUMCE1ZKBetq/FNJYQglULgm1bn/I/QPM9lZmc=;
  b=IHCZp/qp160NVtJWShpZ3bBD7MpAr5ThpF0H0o6G/jRhwL1Cxlf9G4V3
   UK/Gnncl2HOQyT86fRTOEubyv278Bd/AgQrz5dQLQMxJUGOYZG5+frF4H
   PKVI+uh5V7k+lCPltWGAGOlKuoJDTSqabs34lDtFsLm9sQUxahgKg1bos
   3IL4fvX8zz/aprouTiUpccZB/GLOQdlLBwXUVR8BbM13XoBVDRkUcq4ph
   cPDkjDq6B0gZMet+dyT+cVRUey+9W3s78XQs0ecomnpd7IalfIpdmRizA
   sAikgduCKRlrkMyLkJKgM68DFpRz2SAJ60j34/hf0wY0tCsAbNPiyjXjU
   w==;
X-CSE-ConnectionGUID: puEzJldyTT+NMgKU6BcAag==
X-CSE-MsgGUID: Xeipp4iSQOyrVyMIfwxHkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="77268543"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="77268543"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 18:07:21 -0700
X-CSE-ConnectionGUID: cUspfWJsS1enucq7XWHW1Q==
X-CSE-MsgGUID: YRH+pKAHSLKlEcSChXruGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="233663659"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Apr 2026 18:07:19 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHWuw-000000009NQ-4Ayy;
	Tue, 28 Apr 2026 01:07:14 +0000
Date: Tue, 28 Apr 2026 09:07:01 +0800
From: kernel test robot <lkp@intel.com>
To: Agalakov Daniil <ade@amicon.ru>,
	Steve Longerbeam <slongerbeam@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Agalakov Daniil <ade@amicon.ru>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
	Roman Razov <rrv@amicon.ru>
Subject: Re: [PATCH] media: i2c: ov5640: Fix potential integer overflow in
 sysclk calculation
Message-ID: <202604280813.SHiWrMhW-lkp@intel.com>
References: <20260420154007.2877949-1-ade@amicon.ru>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420154007.2877949-1-ade@amicon.ru>
X-Rspamd-Queue-Id: 9A7AD47C4C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59738-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[amicon.ru,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid]

Hi Agalakov,

kernel test robot noticed the following build errors:

[auto build test ERROR on sailus-media-tree/master]
[also build test ERROR on linus/master sailus-media-tree/streams v7.1-rc1 next-20260427]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Agalakov-Daniil/media-i2c-ov5640-Fix-potential-integer-overflow-in-sysclk-calculation/20260426-101723
base:   git://linuxtv.org/sailus/media_tree.git master
patch link:    https://lore.kernel.org/r/20260420154007.2877949-1-ade%40amicon.ru
patch subject: [PATCH] media: i2c: ov5640: Fix potential integer overflow in sysclk calculation
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260428/202604280813.SHiWrMhW-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260428/202604280813.SHiWrMhW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604280813.SHiWrMhW-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [drivers/media/i2c/ov5640.ko] undefined!
>> ERROR: modpost: "__divdi3" [drivers/media/i2c/ov5640.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

