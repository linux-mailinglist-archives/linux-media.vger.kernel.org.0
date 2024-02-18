Return-Path: <linux-media+bounces-5367-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5558593E5
	for <lists+linux-media@lfdr.de>; Sun, 18 Feb 2024 02:44:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E53E91F21C51
	for <lists+linux-media@lfdr.de>; Sun, 18 Feb 2024 01:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8203015C8;
	Sun, 18 Feb 2024 01:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ur3tO60S"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7C1EDD;
	Sun, 18 Feb 2024 01:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708220679; cv=none; b=QzK589U6uqabsUyhXaMiZHesdHs3QBVe3gGCH9bTmJoKcrGGvxn0+empkTx0V+72kdz8kr0Qr4KhsK3ts70967wCE9GdBUFd8QucrZppIsy7b7v8FxJEsScxuTRPnv7nDBBV09YWaG5VtcqAPhnWlB//W9DUyBjLLwOtvHfCgb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708220679; c=relaxed/simple;
	bh=v/8OymEwLnxirZW2mYUhgZPk0cPIVogFt13otB98oJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a6pSarvyHa0o0TvDsJvhhOs8d97f7mpYGIWJJja9CcJ2ISzBKeyae92QvIGYeshaDT+OpiTfStMoGx9sGdumcPjV9zndPCzcR7DlTkE8u7qj+QRIiXGNth/i+X0sgOWc6m6edCD2c0oj89cTn9QYFehebcD0mWU9eQevGwjV5wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ur3tO60S; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708220677; x=1739756677;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v/8OymEwLnxirZW2mYUhgZPk0cPIVogFt13otB98oJA=;
  b=Ur3tO60S1Atvt/QjJ0dScqwp3N3mBzEPBrmHivdewFbn+cF3BuNva4T5
   kUrqqragJEGR3S9xSAVigEj4Ow4le6C3epek6GcxWLKq96FvOhH9p3rrT
   Bm7omgULhJL2a3W0T+3VpT+ta8kZyXHsGvwa7QmNJjJi7arFl9OAEA/HY
   lyq0ElB0Zvwa5gBknfI6IjC0MxgRgtr8TfzBLCDgvzISjU9fWFT0lLPod
   eciCUC4pjJakl4y4F/64rTwr8zkvcLmmJszYOo2xpvk5OciZESZY7jWnS
   Vnq3jXGCP1gRy4O5HPTC2sZxru/mi82FaDQYvcxXW51u3yxu07fX+vcj4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="2196724"
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="2196724"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 17:44:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="4318797"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 17 Feb 2024 17:44:33 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbWEI-0002gS-2d;
	Sun, 18 Feb 2024 01:44:30 +0000
Date: Sun, 18 Feb 2024 09:43:48 +0800
From: kernel test robot <lkp@intel.com>
To: Umang Jain <umang.jain@ideasonboard.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	willl will <will@willwhang.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: Re: [PATCH 2/2] media: i2c: Add imx283 camera sensor driver
Message-ID: <202402180911.BqIsQdzm-lkp@intel.com>
References: <20240215204436.9194-3-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240215204436.9194-3-umang.jain@ideasonboard.com>

Hi Umang,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linuxtv-media-stage/master next-20240216]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Umang-Jain/media-dt-bindings-media-Add-bindings-for-IMX283/20240216-044628
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20240215204436.9194-3-umang.jain%40ideasonboard.com
patch subject: [PATCH 2/2] media: i2c: Add imx283 camera sensor driver
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20240218/202402180911.BqIsQdzm-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240218/202402180911.BqIsQdzm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402180911.BqIsQdzm-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/media/i2c/imx283.o: in function `imx283_set_framing_limits':
>> imx283.c:(.text+0xfe4): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: drivers/media/i2c/imx283.o: in function `imx283_init_controls':
   imx283.c:(.text+0x1470): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: drivers/media/i2c/imx283.o: in function `imx283_set_ctrl':
   imx283.c:(.text+0x2378): undefined reference to `__aeabi_uldivmod'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

