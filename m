Return-Path: <linux-media+bounces-32346-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 108F3AB4763
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 00:40:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C02119E5BC4
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 22:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EBCF29A9D3;
	Mon, 12 May 2025 22:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P8Ayp3F9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECC929A31A;
	Mon, 12 May 2025 22:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747089636; cv=none; b=U/I9R27uRB8VAInVAd/muMoCiJcO3Ba8ElFOmJ1mNPTIoxaHfBPd3hUdxjH22YJYFhP5P5HUNsnCjrRYDYd2OMIPBA/n+VR+HdyPXXVhWqdF2ZkqHfKyifddpDAVGJFx482/yELvU5jzyUWhDn40vFlEDeMaKeeLJj1i/zZuzG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747089636; c=relaxed/simple;
	bh=IsFdOGeVB9Z4dwg7zB3kN/cGUL5kif9E+VoJLXZIFoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ak7fnE3gwjGHwf0AeZ0reh02h1FSEccA3VP/QVJ07I05MEXpEr4c28u1J60ZRULjwQ9pDhsfOVdS4hvxJ3mk9PJjFRMshtaqDhg/bQfmZvKBjRRJDdDKmcPPyDVn86JZevTolrB2l2qYmG6L+dLtbkHuPosm4H9X2hYI1mID8Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P8Ayp3F9; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747089634; x=1778625634;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IsFdOGeVB9Z4dwg7zB3kN/cGUL5kif9E+VoJLXZIFoU=;
  b=P8Ayp3F9pZf7ATSuIk3Z4Q+WkUqcdvZ3x/8qDpT822TE6/TTkkUVaipD
   MOrToJrMZWbboAbhWF9ZrXPon0FkOYNvM6sb5yR2J0XKCrwlzXggqJMf3
   xD4a4zV6vh+krfdmUpsxE+STAqQKi8ROCAI6Nj9PiDj/O8bePizRwOcK/
   LfqbKaNTlxD+xOcUMmU5dsYkfv7fxHhWRlCR3RZgr/tbE/+mn2cjVR2QL
   R6ZmQlMni9eiSp3gmL/tmIdDSnf1vUa+RJDr/l7Ja/20TrikmuUe2mFdM
   xdI2EwnKjRUhilQ3zvCqLkBq7mBYCTXNTEmJkwboNl06/CQtiVUbCstfN
   Q==;
X-CSE-ConnectionGUID: fA7lbqFOQxKwWhE6YpluOQ==
X-CSE-MsgGUID: 11QxJwmoQoqfyLYdY8Uq4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="59571288"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="59571288"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 15:40:34 -0700
X-CSE-ConnectionGUID: ZDqxwHf/RZuEU1s9gaIttA==
X-CSE-MsgGUID: vRw+cxwTQgWXLQrlP7QOxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="137981734"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 May 2025 15:40:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEbow-000FUb-10;
	Mon, 12 May 2025 22:40:26 +0000
Date: Tue, 13 May 2025 06:39:27 +0800
From: kernel test robot <lkp@intel.com>
To: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Michal Simek <monstr@monstr.eu>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, Junhao Xie <bigfoot@classfun.cn>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Kever Yang <kever.yang@rock-chips.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	Ricardo Ribalda <ribalda@chromium.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: Re: [PATCH 2/3] media: allegro-dvt: Add Gen 3 IP stateful decoder
 driver
Message-ID: <202505130610.joo2DpuX-lkp@intel.com>
References: <20250511144752.504162-3-yassine.ouaissa@allegrodvt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511144752.504162-3-yassine.ouaissa@allegrodvt.com>

Hi Yassine,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.15-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yassine-Ouaissa/media-allegro-dvt-Move-the-current-driver-to-a-subdirectory/20250511-225629
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250511144752.504162-3-yassine.ouaissa%40allegrodvt.com
patch subject: [PATCH 2/3] media: allegro-dvt: Add Gen 3 IP stateful decoder driver
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250513/202505130610.joo2DpuX-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505130610.joo2DpuX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505130610.joo2DpuX-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm/probes/kprobes/test-kprobes.o
WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/tests/slub_kunit.o
>> ERROR: modpost: "__bad_udelay" [drivers/media/platform/allegro-dvt/al300/al300-vdec.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

