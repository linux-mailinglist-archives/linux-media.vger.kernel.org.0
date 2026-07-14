Return-Path: <linux-media+bounces-67568-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MBgkCMxBVmpD2QAAu9opvQ
	(envelope-from <linux-media+bounces-67568-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 16:03:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CADEF755772
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 16:03:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=fQYhA4+L;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67568-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67568-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 37B1630A6240
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 14:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87DE4477986;
	Tue, 14 Jul 2026 14:00:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F4B36C9C0;
	Tue, 14 Jul 2026 14:00:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784037636; cv=none; b=aMVZOYpXHoyCdqZvpdHysastTC53zoZfL9q1UEWL3ErfU7uQG4B0eSrA0PfZ8PH1tr4JMCc3M7LMIPqe+F5XRkQzGThQ1FiFzL6TTyvQiydIMJbe3T0LZBR7bHem/TzuZkVDbr4F0ubQuLj8RBcuXXp7a68lWhSjxqQA5H52sX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784037636; c=relaxed/simple;
	bh=JlTtuTgyttUoJX1tzSz3FCb8u2Xjs4nbU6LV982KfNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bmCer+JZfsQVluQKIUX9Kcn7VxmPlY/5KQk+oKVaiQUBSIO5KKlp6XQ1iXph37FznwxeRMKHHXNvp7crJS9q9xbbxSLnVkUceHQauwfOdm1gAH9KwreaLrrCkA2I2SY1GUjfUt96RKC9t6+vW17vxMPk3kSILMZEggw1NLWyR+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fQYhA4+L; arc=none smtp.client-ip=192.198.163.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784037634; x=1815573634;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JlTtuTgyttUoJX1tzSz3FCb8u2Xjs4nbU6LV982KfNo=;
  b=fQYhA4+LarETgrVfmE1QOP1+S17OQlzm5Wxa/4vgky9bCtdmzi5sIUIW
   2zHdDejDa8cnxaieTNJickMQwB1OyVIHuLwo7WXvJmbcU1gAzcbzHQE/G
   gu356fcD6Jt7ECeZ3kpCn2w9xpViZE418lsPi5wHcRRriwAmY29Gp2sww
   PUG2Hm9WHagwV4w/cVkpkVzdhXj5oiMMIjqE79Qbm6noH3ioyk7JOzZij
   pHxArxP9FnwMdyjV1jUJyAAhQmf9h3BZXyWuSLuIheM5Rb2le/ndVSzuZ
   PKdOAF+wu0LgvedTCjXGXZkBiOB7idCsFQORMgBDsAmKffknhA7nrLXNq
   Q==;
X-CSE-ConnectionGUID: TiUgVMlLTpCTVsctFbDeog==
X-CSE-MsgGUID: d0F/3Y40Qb6aK9FkPRmdeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="83781030"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="83781030"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 07:00:34 -0700
X-CSE-ConnectionGUID: z8g/5vJ7ROme4zo2zAVSAQ==
X-CSE-MsgGUID: 4ZauGFZWRNeP3PVTEl3ffw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="260764911"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 14 Jul 2026 07:00:32 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjdgT-00000000Mh2-258m;
	Tue, 14 Jul 2026 14:00:29 +0000
Date: Tue, 14 Jul 2026 21:59:40 +0800
From: kernel test robot <lkp@intel.com>
To: Alfie Varghese <alfievarghese22@gmail.com>, neil.armstrong@linaro.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Alfie Varghese <alfievarghese22@gmail.com>
Subject: Re: [PATCH v2] staging: media: meson: vdec: fix advanced concurrency
 and UAF bugs
Message-ID: <202607142142.HnOYDndp-lkp@intel.com>
References: <20260713181602.773-1-alfievarghese22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713181602.773-1-alfievarghese22@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67568-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org,linuxfoundation.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:alfievarghese22@gmail.com,m:neil.armstrong@linaro.org,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:oe-kbuild-all@lists.linux.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:from_mime,intel.com:mid,intel.com:email,intel.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,01.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CADEF755772

Hi Alfie,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Alfie-Varghese/staging-media-meson-vdec-fix-advanced-concurrency-and-UAF-bugs/20260714-023427
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260713181602.773-1-alfievarghese22%40gmail.com
patch subject: [PATCH v2] staging: media: meson: vdec: fix advanced concurrency and UAF bugs
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20260714/202607142142.HnOYDndp-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260714/202607142142.HnOYDndp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607142142.HnOYDndp-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/media/meson/vdec/vdec.c: In function 'vdec_m2m_job_abort':
>> drivers/staging/media/meson/vdec/vdec.c:156:33: error: 'struct amvdec_session' has no member named 'm2m_dev'
     156 |         v4l2_m2m_job_finish(sess->m2m_dev, sess->m2m_ctx);
         |                                 ^~


vim +156 drivers/staging/media/meson/vdec/vdec.c

3e7f51bd96077ac Maxime Jourdan 2019-06-06  151  
3e7f51bd96077ac Maxime Jourdan 2019-06-06  152  static void vdec_m2m_job_abort(void *priv)
3e7f51bd96077ac Maxime Jourdan 2019-06-06  153  {
3e7f51bd96077ac Maxime Jourdan 2019-06-06  154  	struct amvdec_session *sess = priv;
3e7f51bd96077ac Maxime Jourdan 2019-06-06  155  
3e7f51bd96077ac Maxime Jourdan 2019-06-06 @156  	v4l2_m2m_job_finish(sess->m2m_dev, sess->m2m_ctx);
3e7f51bd96077ac Maxime Jourdan 2019-06-06  157  }
3e7f51bd96077ac Maxime Jourdan 2019-06-06  158  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

