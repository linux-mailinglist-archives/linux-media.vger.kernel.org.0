Return-Path: <linux-media+bounces-52933-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sP/sHOiDk2k46AEAu9opvQ
	(envelope-from <linux-media+bounces-52933-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 21:54:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA3E147949
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 21:53:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A8D8305F7DB
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 20:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6360D305045;
	Mon, 16 Feb 2026 20:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mcc2se07"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A390C329C5E;
	Mon, 16 Feb 2026 20:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771274979; cv=none; b=s5/GlP2gU4WDfnfY6KdE3eGhDv6zTd0sGXBro1k9JDYofH6FwO3LBUxdjODRm8sQe+NuHw0uSpBlvx0kHy/DEDi8pkwYGdSjh2zOgRKLIY2p4k/Uj2wSgp9a440xdznZI/hZF2Od/WIcDZtScXmL1vyUbY3qWGXzX02Jirrd0nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771274979; c=relaxed/simple;
	bh=kLdYIq6SYQsYCiukpbRLt9V5tJH5I16KOa7znlZAcK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R3MYqhLwrmreo9N1qeoKHNHu8KE3utqBesan83Oi3HxXjnhOt2/VIDQQYwm6mucTCXBrNJoYab+Y05zSSME5d3fAMaQs9umORQ+Fa1VZ0xMBCVJUsAo6tEOeRgz2+H9LJNoNEHBxXxR51+SXLQ4lq6FjVBbEGDp3dimTlQFva3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mcc2se07; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771274979; x=1802810979;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kLdYIq6SYQsYCiukpbRLt9V5tJH5I16KOa7znlZAcK4=;
  b=mcc2se077cPMsZ3HMSKLmIQrXrm/GoKZ2WJYAQxMct9QhNsBzokTBiUl
   cctKPu37Aq2oWW8Zl4A6jPLAdVOKGb0lEhaVfVgC9iRmDFU9ObR9OTVlq
   v6twpLtrAmoyb0126L+VEOI0oCIlmYKMhy8DK7fjh9g3B3ux4scITSkGZ
   STHbCn3KL0XseDy6Yd//eD65opgmZZaNh0afPuhsWMSzwyqlSuby3LAMU
   lz72tx2gOZPTWHa/XUQkXIs+iMDonrUeB+4yWSKQfh2UnO5J2SCnQVRAf
   hP8TBfBQhG/3GCGIxyuK7hA7s6FFMXi2mwtFGp2UBlfOdzSyPFuwO1qQP
   A==;
X-CSE-ConnectionGUID: DyGhh7ZOQmmNZwboS+Halg==
X-CSE-MsgGUID: kR/sS1BCSrizR8QR/G2T5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72399696"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="72399696"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 12:49:38 -0800
X-CSE-ConnectionGUID: nahu5ToeTQ2eopx+iuUz6g==
X-CSE-MsgGUID: ogXU4/T0T/uV3GV2X23/Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="218232127"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Feb 2026 12:49:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vs5X8-000000010H2-0ZIN;
	Mon, 16 Feb 2026 20:49:30 +0000
Date: Tue, 17 Feb 2026 04:48:56 +0800
From: kernel test robot <lkp@intel.com>
To: Larisa Grigore <larisa.grigore@oss.nxp.com>, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, sumit.semwal@linaro.org,
	christian.koenig@amd.com, chester62515@gmail.com,
	cosmin.stoica@nxp.com, adrian.nitu@freescale.com,
	stefan-gabriel.mirea@nxp.com, Mihaela.Martinas@freescale.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, s32@nxp.com, imx@lists.linux.dev,
	clizzi@redhat.com, aruizrui@redhat.com, eballetb@redhat.com,
	echanude@redhat.com, jkangas@redhat.com,
	Larisa Grigore <larisa.grigore@oss.nxp.com>,
	Radu Pirea <radu-nicolae.pirea@nxp.com>,
	Phu Luu An <phu.luuan@nxp.com>, Js Ha <js.ha@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: Re: [PATCH 12/13] serial: linflexuart: Add DMA support
Message-ID: <202602170428.SOCWu0Wb-lkp@intel.com>
References: <20260216150205.212318-13-larisa.grigore@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216150205.212318-13-larisa.grigore@oss.nxp.com>
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
	TAGGED_FROM(0.00)[bounces-52933-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.nxp.com,linuxfoundation.org,kernel.org,linaro.org,amd.com,gmail.com,nxp.com,freescale.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: DBA3E147949
X-Rspamd-Action: no action

Hi Larisa,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus usb/usb-testing usb/usb-next usb/usb-linus robh/for-next linus/master v6.19 next-20260216]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Larisa-Grigore/serial-linflexuart-Fix-locking-in-set_termios/20260216-231403
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20260216150205.212318-13-larisa.grigore%40oss.nxp.com
patch subject: [PATCH 12/13] serial: linflexuart: Add DMA support
config: parisc-randconfig-001-20260217 (https://download.01.org/0day-ci/archive/20260217/202602170428.SOCWu0Wb-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602170428.SOCWu0Wb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602170428.SOCWu0Wb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/fsl_linflexuart.c:205:13: warning: 'linflex_console_putchar' declared 'static' but never defined [-Wunused-function]
     205 | static void linflex_console_putchar(struct uart_port *port, unsigned char ch);
         |             ^~~~~~~~~~~~~~~~~~~~~~~


vim +205 drivers/tty/serial/fsl_linflexuart.c

   202	
   203	static void linflex_dma_tx_complete(void *arg);
   204	static void linflex_dma_rx_complete(void *arg);
 > 205	static void linflex_console_putchar(struct uart_port *port, unsigned char ch);
   206	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

