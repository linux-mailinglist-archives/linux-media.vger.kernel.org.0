Return-Path: <linux-media+bounces-52807-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAIpBwNMkGleYQEAu9opvQ
	(envelope-from <linux-media+bounces-52807-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 11:18:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB8913BA7E
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 11:18:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ED541300681D
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 10:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457BA2D739D;
	Sat, 14 Feb 2026 10:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZILQdgzt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B6A27FD5D;
	Sat, 14 Feb 2026 10:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771064309; cv=none; b=RXwJb2BtooJH1zafXPTFoCSxNJWydG19yN0mMwWyEoAF5+M72UpFMD+liRXEzC5RdIGFp/SIztOZjGzrq85gyZ3+ukC1m869siDeq5I4lsFCwCDioqJWcppKnHHMX8aQnmKdFRjqNbumNEFDL4qvyahBXMSd60Si0HnsF0AaJio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771064309; c=relaxed/simple;
	bh=qTiz7MpERdOdvXBnu7frdrabOReE49b85LIwqLeM+40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UTYdqqAQvAj1Yr1mw0QVQ2vULttCLTj8lG9N8mzlhFAHeObQJiYUZL2Sy6cTq7Mr4nXAVRdcsZ/R8rQKovTOEjSXv7UdS1UpjF4wYC5D0S64n6jPdmBvYTJNvzlvOL+LsriH2wx4ezm6Hgf88/Jt1c4cCIzIF++Tc1ILT37WH2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZILQdgzt; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771064307; x=1802600307;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qTiz7MpERdOdvXBnu7frdrabOReE49b85LIwqLeM+40=;
  b=ZILQdgztYZvwakTQ+AiR1YER7o1phRLmiAnP2exa4T6WwBovdlPehMML
   u/eKXzJCKOcfsfcbIfFkAbX3PVp7sHo0axCsvCO9oqCHPdMUgK9RihQdO
   WXDVEGNs8u25XMZGebdN+hHDTmLAk6VTlGVr2ZKLjTK7T6kczO6CoWl+j
   XbjqKH6Fryj+fZwGVyIZTOm6PVJJ9HyNhmEQkq+JyD2wJMJ6hXLNPq+OE
   8nHfQ0yRL88/RqLwHXYKJGceeEzyZhqBXr9FyK8GGjS+Q/9CguucckDWf
   GdCm6QFdRHTuPUsr4HMpkg4Q0gBWV0UQf+hn6OaDQzE7OFnCwufLBUUF4
   A==;
X-CSE-ConnectionGUID: 2MS5sDJaRFepqkP5dOdgFg==
X-CSE-MsgGUID: 6g2TrD4cTJyPejnNvOzoQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="82561392"
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="82561392"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 02:18:24 -0800
X-CSE-ConnectionGUID: bsqcXMzVRhSXWBY2mK222g==
X-CSE-MsgGUID: CJZVRH5WQl6eohcUF/UGsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="242447806"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Feb 2026 02:18:21 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrCjD-00000000wRY-0gyO;
	Sat, 14 Feb 2026 10:18:19 +0000
Date: Sat, 14 Feb 2026 18:17:41 +0800
From: kernel test robot <lkp@intel.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <uajain@igalia.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	linux-kernel@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v2 09/25] media: i2c: imx283: Define recommended area
Message-ID: <202602141812.smD7Mebb-lkp@intel.com>
References: <20260213-mainline-imx283-v2-v2-9-be40a3770ebf@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213-mainline-imx283-v2-v2-9-be40a3770ebf@ideasonboard.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52807-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AFB8913BA7E
X-Rspamd-Action: no action

Hi Kieran,

kernel test robot noticed the following build errors:

[auto build test ERROR on c824345288d11e269ce41b36c105715bc2286050]

url:    https://github.com/intel-lab-lkp/linux/commits/Kieran-Bingham/media-i2c-imx283-Report-correct-V4L2_SEL_TGT_CROP/20260213-221320
base:   c824345288d11e269ce41b36c105715bc2286050
patch link:    https://lore.kernel.org/r/20260213-mainline-imx283-v2-v2-9-be40a3770ebf%40ideasonboard.com
patch subject: [PATCH v2 09/25] media: i2c: imx283: Define recommended area
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260214/202602141812.smD7Mebb-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602141812.smD7Mebb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602141812.smD7Mebb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/imx283.c:510:11: error: initializer element is not a compile-time constant
                   .crop = imx283_recommended_area,
                           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/imx283.c:571:11: error: initializer element is not a compile-time constant
                   .crop = imx283_recommended_area,
                           ^~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +510 drivers/media/i2c/imx283.c

   489	
   490	/* Mode configs */
   491	static const struct imx283_mode supported_modes_12bit[] = {
   492		{
   493			/* 20MPix 21.40 fps readout mode 0 */
   494			.scan = &imx283_scan_modes[IMX283_MODE_0],
   495	
   496			.width = 5472,
   497			.height = 3648,
   498			.min_hmax = 5914, /* 887 @ 480MHz/72MHz */
   499			.min_vmax = 3793, /* Lines */
   500	
   501			.hbin_ratio = 1,
   502			.vbin_ratio = 1,
   503	
   504			/* 20.00 FPS */
   505			.default_hmax = 6000, /* 900 @ 480MHz/72MHz */
   506			.default_vmax = 4000,
   507	
   508			.min_shr = 11,
   509	
 > 510			.crop = imx283_recommended_area,
   511		},
   512		{
   513			/*
   514			 * Readout mode 2 : 2/2 binned mode (2736x1824)
   515			 */
   516			.scan = &imx283_scan_modes[IMX283_MODE_2],
   517			.width = 2736,
   518			.height = 1824,
   519			.min_hmax = 2414, /* Pixels (362 * 480MHz/72MHz + padding) */
   520			.min_vmax = 3840, /* Lines */
   521	
   522			/* 50.00 FPS */
   523			.default_hmax = 2500, /* 375 @ 480MHz/72Mhz */
   524			.default_vmax = 3840,
   525	
   526			.hbin_ratio = 2,
   527			.vbin_ratio = 2,
   528	
   529			.min_shr = 12,
   530	
   531			.crop = imx283_recommended_area,
   532		},
   533		{
   534			/*
   535			 * Readout mode 3 : 3/3 binned mode (1824x1216)
   536			 */
   537			.scan = &imx283_scan_modes[IMX283_MODE_3],
   538			.width = 1824,
   539			.height = 1216,
   540			.min_hmax = 1894, /* Pixels (284 * 480MHz/72MHz + padding) */
   541			.min_vmax = 4200, /* Lines */
   542	
   543			/* 60.00 fps */
   544			.default_hmax = 1900, /* 285 @ 480MHz/72Mhz */
   545			.default_vmax = 4200,
   546	
   547			.hbin_ratio = 3,
   548			.vbin_ratio = 3,
   549	
   550			.min_shr = 16,
   551	
   552			.crop = imx283_recommended_area,
   553		},
   554	};
   555	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

