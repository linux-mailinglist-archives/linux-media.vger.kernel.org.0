Return-Path: <linux-media+bounces-51131-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLIWLL99cGktYAAAu9opvQ
	(envelope-from <linux-media+bounces-51131-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 08:18:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D7C52B52
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 08:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 933336ABDCB
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 13:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E72F43900A;
	Tue, 20 Jan 2026 13:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YrI1J+Zw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9163943635C;
	Tue, 20 Jan 2026 13:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768916896; cv=none; b=uxIkFd0GdFjlsWaWNubd2kHcI1wy0ugsyLYxp3W/aCPdYmoIeRavSLtPearD9Vmp7bgolmFHzX96lBmoVZkzDz+dlJIUr5Dbx7GOXlIhKEbVU8WKhv7Q/e41dmX8lQoaVCDlwTt5z4tygu+373J5xhKHscvKVErIz3ek+0XTlCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768916896; c=relaxed/simple;
	bh=YJLCw9NFvzqk8UYMJcfoYlh3p1NrSLQp5jpZzHmPjbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E/pfShhzswTBlhkEXituAiqRGrqydMGIzPrNKOd5hREB93JdDSCbaLnFBdTOgkEcuPkfrgDOqF7B4a+gBdU7U3tAPnt8arfMlhdZFkaYKA5ycPuQnx5pajMxwB8rzOqmQ1YHoWXgU++g1u9SFr+hoR2ih+wgnzxhaw8FP4CK34U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YrI1J+Zw; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768916894; x=1800452894;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YJLCw9NFvzqk8UYMJcfoYlh3p1NrSLQp5jpZzHmPjbE=;
  b=YrI1J+ZwxCvFb7K0PbqOVXBwzJWiOy1uS9iEMfrbeN079qX6QtVEM/c7
   +Vw/rzEKk7Z067w7aHELc4KYnNmVXjBkMdzq2ObpBwjqM3HC178QIelTj
   DzFHWCvkADp80GIYA1h5yPOu2eZ4yDA89YMMsu9y/Xq350tuxTxZIDHsv
   7Ac3IOqSZTDVfQncrn3CKyXr6JgxtzPudSMjbSTVNTn3CRGW3Wab4mYvX
   RGhwR46pMerD2B4hztiiZuVTZtcD9x1oZA7KO0uhWtoxurmokZAOWJRe+
   /I206Q9MGUNU9oigm1tZsR0QMf1CH4/K3lnv9ilal0IN5cip4nhvdz8MB
   Q==;
X-CSE-ConnectionGUID: Sd6jHaCMTZKkdlugbynKkw==
X-CSE-MsgGUID: Ltas88w5S2+bDiJgBMkb+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70096176"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="70096176"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 05:48:12 -0800
X-CSE-ConnectionGUID: yZsuA2QBQQiQGkb46Mm13w==
X-CSE-MsgGUID: WH0Ve7VUTpGastydKBN/PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="211131179"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Jan 2026 05:48:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viC5Y-00000000P2h-0NWF;
	Tue, 20 Jan 2026 13:48:08 +0000
Date: Tue, 20 Jan 2026 21:47:56 +0800
From: kernel test robot <lkp@intel.com>
To: "luo.liu" <luo.liu.linux@163.com>, sakari.ailus@linux.intel.com,
	mchehab@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, luo.liu.linux@163.com
Subject: Re: [PATCH] v4l2-async: add debugfs under CONFIG_DEBUG_FS
Message-ID: <202601202104.uDfihrMe-lkp@intel.com>
References: <20260120065710.1120819-1-luo.liu.linux@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120065710.1120819-1-luo.liu.linux@163.com>
X-Spamd-Result: default: False [-0.96 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,163.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51131-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[163.com,linux.intel.com,kernel.org];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	DKIM_TRACE(0.00)[intel.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,01.org:url]
X-Rspamd-Queue-Id: 65D7C52B52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi luo.liu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d08c85ac8894995d4b0d8fb48d2f6a3e53cd79ab]

url:    https://github.com/intel-lab-lkp/linux/commits/luo-liu/v4l2-async-add-debugfs-under-CONFIG_DEBUG_FS/20260120-150913
base:   d08c85ac8894995d4b0d8fb48d2f6a3e53cd79ab
patch link:    https://lore.kernel.org/r/20260120065710.1120819-1-luo.liu.linux%40163.com
patch subject: [PATCH] v4l2-async: add debugfs under CONFIG_DEBUG_FS
config: powerpc-randconfig-002-20260120 (https://download.01.org/0day-ci/archive/20260120/202601202104.uDfihrMe-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601202104.uDfihrMe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601202104.uDfihrMe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/debugfs.h:16,
                    from drivers/media/v4l2-core/v4l2-async.c:8:
>> drivers/media/v4l2-core/v4l2-async.c:967:23: warning: 'pending_subdevs_fops' defined but not used [-Wunused-const-variable=]
     967 | DEFINE_SHOW_ATTRIBUTE(pending_subdevs);
         |                       ^~~~~~~~~~~~~~~
   include/linux/seq_file.h:213:37: note: in definition of macro 'DEFINE_SHOW_ATTRIBUTE'
     213 | static const struct file_operations __name ## _fops = {   \
         |                                     ^~~~~~


vim +/pending_subdevs_fops +967 drivers/media/v4l2-core/v4l2-async.c

517fd2b6a058bc4 Ezequiel Garcia 2021-01-08  949  
517fd2b6a058bc4 Ezequiel Garcia 2021-01-08  950  static int pending_subdevs_show(struct seq_file *s, void *data)
517fd2b6a058bc4 Ezequiel Garcia 2021-01-08  951  {
517fd2b6a058bc4 Ezequiel Garcia 2021-01-08  952  	struct v4l2_async_notifier *notif;
adb2dcd5f2d49d3 Sakari Ailus    2023-02-16  953  	struct v4l2_async_connection *asc;
517fd2b6a058bc4 Ezequiel Garcia 2021-01-08  954  
517fd2b6a058bc4 Ezequiel Garcia 2021-01-08  955  	mutex_lock(&list_lock);
517fd2b6a058bc4 Ezequiel Garcia 2021-01-08  956  
b6d42c35c03dc1a Sakari Ailus    2023-02-22  957  	list_for_each_entry(notif, &notifier_list, notifier_entry) {
3c8c153914812a9 Sakari Ailus    2021-03-05  958  		seq_printf(s, "%s:\n", v4l2_async_nf_name(notif));
9bf19fbf0c8bc43 Sakari Ailus    2023-04-18  959  		list_for_each_entry(asc, &notif->waiting_list, asc_entry)
adb2dcd5f2d49d3 Sakari Ailus    2023-02-16  960  			print_waiting_match(s, &asc->match);
517fd2b6a058bc4 Ezequiel Garcia 2021-01-08  961  	}
517fd2b6a058bc4 Ezequiel Garcia 2021-01-08  962  
517fd2b6a058bc4 Ezequiel Garcia 2021-01-08  963  	mutex_unlock(&list_lock);
517fd2b6a058bc4 Ezequiel Garcia 2021-01-08  964  
517fd2b6a058bc4 Ezequiel Garcia 2021-01-08  965  	return 0;
517fd2b6a058bc4 Ezequiel Garcia 2021-01-08  966  }
517fd2b6a058bc4 Ezequiel Garcia 2021-01-08 @967  DEFINE_SHOW_ATTRIBUTE(pending_subdevs);
517fd2b6a058bc4 Ezequiel Garcia 2021-01-08  968  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

