Return-Path: <linux-media+bounces-64635-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O6s+FMRrK2rv9AMAu9opvQ
	(envelope-from <linux-media+bounces-64635-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 04:15:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D80E67640C
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 04:15:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=NrFVmAwc;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64635-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64635-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB2C3314090B
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 02:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F04382F18;
	Fri, 12 Jun 2026 02:15:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D4F35F5E3;
	Fri, 12 Jun 2026 02:15:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781230519; cv=none; b=VFufP9W5Jn2pmXbHsU59liKSJ9XROJfTvJYYuB17Xdk7/cp22kUYD5Rpt2cmF9BYbwV37G2zEdZ4DhCdCsBYG3Q76t8woQtn6GDgLGdJiPkNVMseoQLCTzpJFAUJ7ks/M6N1jbxYtaXmTtPL9M+Zeuay8iYHwM6sVo8AOIWswFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781230519; c=relaxed/simple;
	bh=Oy85sK2Gn+Zq/RhyB1hdWZcoNF2HzoKYEyRUhJRFs98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y303xFYBjAkbWE2z4Fswl12+O2pqQeC/Pgg/3OmxFKuhwI7NTYavS91OQ5IBpqXdoABltjtiDf0tDJcwi/OCFUgJGcIYrxLYiB7HbVFILvqxJ3n6JdMW3CNf/xioB2ZsSpGvrLN/U59S3XUYvpTquJH2O84b49Jets7IyozrKzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NrFVmAwc; arc=none smtp.client-ip=192.198.163.14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781230517; x=1812766517;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Oy85sK2Gn+Zq/RhyB1hdWZcoNF2HzoKYEyRUhJRFs98=;
  b=NrFVmAwczvzue6NQlNC7DyREXJSxCVHsywzfYH5XMwxCaYPUdYX+KgMe
   7tC/PjQlQHp5eIZxKnrsqy+iwM6TW5bZCdqJCdZw7clwACkoQNqyEYgyG
   dMm4nEAC1b9CBoAlbqreIR2+t8GSVuOTBFQEoHK4UwNPKpO6QRJvu7eDa
   VPs+H39q6NLCVj/whhcSDVfMBJ4U2Kpj+z0yCH2zXkpmw5yq1zqvZwTrU
   M09ZPEt67N+j1C73ikRLtMzV8wuVKGycfGGqZjSzhxKJ/hxAuLaO+x40y
   BrOvKcJUcUHk2BlQPsGOWakK7k2mfHlm3r7IZ5gbX+SaEAlPaTQcJhLPK
   A==;
X-CSE-ConnectionGUID: Kx0rp0cYQ3GalYen5UcBwg==
X-CSE-MsgGUID: oViIR8ucRIK3eIHIw5dd3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82105572"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="82105572"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 19:15:16 -0700
X-CSE-ConnectionGUID: mm4dzS0QSW6s/fPGsfAEfA==
X-CSE-MsgGUID: 6WGDJgrGTeaYkwKunTwo6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="251641450"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Jun 2026 19:15:11 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXrQK-00000000OA8-0VEK;
	Fri, 12 Jun 2026 02:15:08 +0000
Date: Fri, 12 Jun 2026 10:14:59 +0800
From: kernel test robot <lkp@intel.com>
To: Eugen Hristev <ehristev@kernel.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Naushir Patuck <naush@raspberrypi.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Eugen Hristev <ehristev@kernel.org>
Subject: Re: [PATCH] media: bcm2835-unicam: Fix querycap multiple caps
Message-ID: <202606121013.RsnqIwho-lkp@intel.com>
References: <20260611-bcmpiqcap-v1-1-10cf7fb438df@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-bcmpiqcap-v1-1-10cf7fb438df@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64635-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ehristev@kernel.org,m:kernel-list@raspberrypi.com,m:mchehab@kernel.org,m:florian.fainelli@broadcom.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:sakari.ailus@linux.intel.com,m:dave.stevenson@raspberrypi.com,m:laurent.pinchart@ideasonboard.com,m:jeanmichel.hautbois@yoseli.org,m:naush@raspberrypi.com,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:linux-media@vger.kernel.org,m:hverkuil@kernel.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,intel.com:email,intel.com:mid,intel.com:from_mime,01.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9D80E67640C

Hi Eugen,

kernel test robot noticed the following build errors:

[auto build test ERROR on a87737435cfa134f9cdcc696ba3080759d04cf72]

url:    https://github.com/intel-lab-lkp/linux/commits/Eugen-Hristev/media-bcm2835-unicam-Fix-querycap-multiple-caps/20260611-141320
base:   a87737435cfa134f9cdcc696ba3080759d04cf72
patch link:    https://lore.kernel.org/r/20260611-bcmpiqcap-v1-1-10cf7fb438df%40kernel.org
patch subject: [PATCH] media: bcm2835-unicam: Fix querycap multiple caps
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260612/202606121013.RsnqIwho-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606121013.RsnqIwho-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606121013.RsnqIwho-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/platform/broadcom/bcm2835-unicam.c:33:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/media/platform/broadcom/bcm2835-unicam.c:1836:20: error: use of undeclared identifier 'node'
    1836 |         if (is_image_node(node))
         |                           ^
   1 warning and 1 error generated.


vim +/node +1836 drivers/media/platform/broadcom/bcm2835-unicam.c

  1825	
  1826	/* -----------------------------------------------------------------------------
  1827	 *  V4L2 video device operations
  1828	 */
  1829	
  1830	static int unicam_querycap(struct file *file, void *priv,
  1831				   struct v4l2_capability *cap)
  1832	{
  1833		strscpy(cap->driver, UNICAM_MODULE_NAME, sizeof(cap->driver));
  1834		strscpy(cap->card, UNICAM_MODULE_NAME, sizeof(cap->card));
  1835	
> 1836		if (is_image_node(node))
  1837			cap->capabilities |= V4L2_CAP_VIDEO_CAPTURE;
  1838		else
  1839			cap->capabilities |= V4L2_CAP_META_CAPTURE;
  1840	
  1841		return 0;
  1842	}
  1843	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

