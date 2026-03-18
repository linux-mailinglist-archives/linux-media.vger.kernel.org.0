Return-Path: <linux-media+bounces-56229-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4A+cFGz5umlwdwIAu9opvQ
	(envelope-from <linux-media+bounces-56229-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 20:13:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0852C1DD4
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 20:13:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 92F18300D69F
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 19:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A823F076E;
	Wed, 18 Mar 2026 19:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a+qriCKr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CC6311946
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 19:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773861218; cv=none; b=mNvWlG88H9mgwaHOLc3jYW7GE2BYHaQx6WWOgw4/ZilOtOOgK46sJRul1GOajJg3IfsGr5ue1AkC+jnsx7/pm0mEBRIGdX74+36wm/lcbGohccDa2uhCo2+hMApXNrFMa74Fdp2kRSIYVmbP2+JQK9I8VFYh/ZD5j9PW0DN4QJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773861218; c=relaxed/simple;
	bh=WKDkbC0+f3R9FhNQFNwMYqoMt5xssX52wPAudStcLVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AbufCjdO5siD6aitw/ygaKU3t5igpvT1JH7OreZ1WNRTCZKhT3ePonao5jDyTKotWPkSq9F1H0iyjyxSA7aVGbaXBo9v91DE4PnVQVcdZsaCJBkKjT1MpB5BfQj3sElRrSWtRT6SzHr/GH3zmjnZvwcqCHSj2MMs7d9NGmxvOCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a+qriCKr; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773861215; x=1805397215;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WKDkbC0+f3R9FhNQFNwMYqoMt5xssX52wPAudStcLVs=;
  b=a+qriCKrXCN0H0v2ep87FfOFwehi5yqcDq9N4KvS6l4jiS5F3ZcP00EV
   CjuYNIs3ez5T0o0rtqAXDjgGjGa3hKfq8hVZbLqwmhO+WAH2puSShUddD
   RhH2bIsWnT6TfHTQJYZN2xMteDiN9dSS6eZp45pM8cTkLuoqVRBnmb1BK
   Kxfd38jC4jM51EoQsZT+sdAnAjA1ypG4bZW+NYeapKLAXvaN03Xp6TIeh
   ZFwd+DhsGrDqhYqABvJQWY0Q/Q8GS1+xOoL+5hicp0QhI9zMArd4RIn8O
   ChQ/PLsZznsi4Hd23hTDWkwLyHP7DtomU4whoQ9PbBn0BjhBwMWo6AJwZ
   A==;
X-CSE-ConnectionGUID: aASKyGRKQk2kUuFzOYOIYQ==
X-CSE-MsgGUID: L952O4efTs2I48/9gQsWpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="92500651"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="92500651"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 12:13:35 -0700
X-CSE-ConnectionGUID: 4k3z3NjyQeavgegFjaeetg==
X-CSE-MsgGUID: qvkrXy26QtuUJu+ny41LSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="227209944"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Mar 2026 12:13:34 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2wKh-000000003ID-004f;
	Wed, 18 Mar 2026 19:13:31 +0000
Date: Thu, 19 Mar 2026 03:12:45 +0800
From: kernel test robot <lkp@intel.com>
To: Bradford Love <brad@nextdimension.cc>, linux-media@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Bradford Love <brad@nextdimension.cc>
Subject: Re: [PATCH 1/2] em28xx: Add support for Empia em2828X bridge
Message-ID: <202603190334.ERNDESst-lkp@intel.com>
References: <20260312224915.2907539-2-brad@nextdimension.cc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312224915.2907539-2-brad@nextdimension.cc>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56229-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.994];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: BD0852C1DD4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bradford,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linuxtv-media-pending/master]
[also build test WARNING on media-tree/master sailus-media-tree/master linus/master sailus-media-tree/streams v7.0-rc4 next-20260318]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bradford-Love/em28xx-Add-support-for-Empia-em2828X-bridge/20260318-090020
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20260312224915.2907539-2-brad%40nextdimension.cc
patch subject: [PATCH 1/2] em28xx: Add support for Empia em2828X bridge
config: xtensa-randconfig-r073-20260319 (https://download.01.org/0day-ci/archive/20260319/202603190334.ERNDESst-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603190334.ERNDESst-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603190334.ERNDESst-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/usb/em28xx/em28xx-dvb.c:299:5: warning: no previous prototype for 'em28xx_set_analog_freq' [-Wmissing-prototypes]
    int em28xx_set_analog_freq(struct em28xx *dev, u32 freq)
        ^~~~~~~~~~~~~~~~~~~~~~


vim +/em28xx_set_analog_freq +299 drivers/media/usb/em28xx/em28xx-dvb.c

   298	
 > 299	int em28xx_set_analog_freq(struct em28xx *dev, u32 freq)
   300	{
   301		const struct dvb_tuner_ops *dops = &dev->dvb->fe[0]->ops.tuner_ops;
   302	
   303		if (dops->set_analog_params != NULL) {
   304			struct analog_parameters params;
   305	
   306			params.frequency = freq;
   307			params.std = dev->v4l2->norm;
   308			params.mode = 0;
   309	
   310			dops->set_analog_params(dev->dvb->fe[0], &params);
   311		}
   312		return 0;
   313	}
   314	/* ------------------------------------------------------------------ */
   315	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

