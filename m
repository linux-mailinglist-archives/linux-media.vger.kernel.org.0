Return-Path: <linux-media+bounces-33279-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C214AAC26E0
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 17:55:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 901DE3B1A49
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 15:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75ED2957B6;
	Fri, 23 May 2025 15:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J+sLCNU8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA5E19CC29;
	Fri, 23 May 2025 15:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748015716; cv=none; b=mXvqNNzlUziDE2BGC/x1dXYlzzQJF9VuXeL28ulkDoA1qsG6mwtQtMzK8d0gXWCpeqjth2fuRDQFIhQEdpcbM1ud5DD7DEtXfVRa/LE9LuET1A5G86a6djTJ/rhjENmaLeCQiyYioXCu7aZUj0Yn9zJmxzVilJ2dvvZhHffYFeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748015716; c=relaxed/simple;
	bh=dSPDygJYnFeb8HQfhHNr6stBiS3NmukCn/fuMALXfRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d0R+S25GZL61pyTZhLw4v4q/2E3oLOAlcUNBGnI+FKrAc79S2xZyeX6+/b10x5RB2GgF4Cxv2ipqCKDi50GHX1EnwwHDVCFBXcdX0JPbNQU6teEeg/Uwytj7aE5pgHigp/yFkVeLp+PQPBgUY4YfMX8obsm1AEqOfTQlL38qqxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J+sLCNU8; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748015714; x=1779551714;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dSPDygJYnFeb8HQfhHNr6stBiS3NmukCn/fuMALXfRA=;
  b=J+sLCNU8kidFEoBCgRVDaaKWjeCCLGmJ03B3aT/+v76jqWW1j6OROxHv
   9xgsb0HioRFzxgAKIzVD1ZaAQH7+5NWopRziuNxV0LoAG2wFLRZmxxVky
   ecXZgJiCdhSP/IxQ17jlgp0RLFoU1lswOC5xaSbhqyOByIo9lEFpzRUyX
   WN2nkK1xfrSKmuy7sb7AhsiInpigT7K1h7v/Sir/KnYAIsGWLirRHvlQ1
   BzOu4vnMRRkN+IQW1In5JfbW79vBqSk0r2jEApb6BLSc5zb6y1JTjHTa4
   FakMMMF/dMWF6b+lRbwJui0sOww/5MWkOv6sfRHp0dVDCbd+zIiXX8v4d
   A==;
X-CSE-ConnectionGUID: y4H3gEO+Q3Srivln5PoqHA==
X-CSE-MsgGUID: QhoQv0WaRAOKFUKJBkZI5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="75473540"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="75473540"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 08:55:13 -0700
X-CSE-ConnectionGUID: jO/6bONhRzGM65BqpeZgHg==
X-CSE-MsgGUID: rHpnhg5iTee+1ZEuHgZMAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="146173586"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 May 2025 08:55:08 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIUjh-000QWy-0r;
	Fri, 23 May 2025 15:55:05 +0000
Date: Fri, 23 May 2025 23:54:36 +0800
From: kernel test robot <lkp@intel.com>
To: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Michal Simek <monstr@monstr.eu>, Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Junhao Xie <bigfoot@classfun.cn>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Kever Yang <kever.yang@rock-chips.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Ricardo Ribalda <ribalda@chromium.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: media: allegro-dvt: add decoder
 dt-bindings for Gen3 IP
Message-ID: <202505232350.HEuJSo1z-lkp@intel.com>
References: <20250523134207.68481-3-yassine.ouaissa@allegrodvt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523134207.68481-3-yassine.ouaissa@allegrodvt.com>

Hi Yassine,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linuxtv-media-pending/master linus/master v6.15-rc7 next-20250523]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yassine-Ouaissa/media-allegro-dvt-Move-the-current-driver-to-a-subdirectory/20250523-214946
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250523134207.68481-3-yassine.ouaissa%40allegrodvt.com
patch subject: [PATCH 2/5] dt-bindings: media: allegro-dvt: add decoder dt-bindings for Gen3 IP
reproduce: (https://download.01.org/0day-ci/archive/20250523/202505232350.HEuJSo1z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505232350.HEuJSo1z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml
   Can't build as 1 mandatory dependency is missing at ./scripts/sphinx-pre-install line 984.
   make[2]: *** [Documentation/Makefile:121: htmldocs] Error 255
   make[1]: *** [Makefile:1801: htmldocs] Error 2
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'htmldocs' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

