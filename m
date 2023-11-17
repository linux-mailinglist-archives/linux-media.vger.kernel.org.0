Return-Path: <linux-media+bounces-466-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C31947EEA76
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 01:52:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53ED82810CE
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 00:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 043B9803;
	Fri, 17 Nov 2023 00:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JUKbvZV9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF533129;
	Thu, 16 Nov 2023 16:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700182331; x=1731718331;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5vX05p934y8HNmwvCnfQ7XZBXzMEf4HSPcrfofXKDpY=;
  b=JUKbvZV9cl9e0DVD6HHVcUQP4Gwe7C0mlAcocZ9RssyCpoIKMZuoQP+C
   GPBkaz2zVALiZTwed4HptC6ogeqYG3HMowv35p/MB9WdXSVVz9MWcV14e
   ofhFxiJjZ/PM0Pqzmziz0NwtDorvzKbbpbxP+0FWHmmod7dK3wGXpt1dH
   qUGfaVIND3MmGbJ1hEfPmVKZdHOvl6COw9x41mHUVqlNrnQTdBS6QjVPM
   bjNwspeProkXJzNFKihnsM2ocDuoZc45HGf1rMn4e9HhsAl6lEYnOdM5M
   xEeW4QdpM2kwZ3m3RcTl1wNqekVSEEDjwTrgAwaHnkSe6JPIuOfEAf29O
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="394064188"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; 
   d="scan'208";a="394064188"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 16:52:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="909287587"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; 
   d="scan'208";a="909287587"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 16 Nov 2023 16:52:07 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3n5Z-0002Ax-1C;
	Fri, 17 Nov 2023 00:52:05 +0000
Date: Fri, 17 Nov 2023 08:52:01 +0800
From: kernel test robot <lkp@intel.com>
To: Mehdi Djait <mehdi.djait@bootlin.com>, mchehab@kernel.org,
	heiko@sntech.de, hverkuil-cisco@xs4all.nl,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, alexandre.belloni@bootlin.com,
	maxime.chevallier@bootlin.com, paul.kocialkowski@bootlin.com,
	michael.riesch@wolfvision.net,
	Mehdi Djait <mehdi.djait@bootlin.com>
Subject: Re: [PATCH v11 2/3] media: rockchip: Add a driver for Rockchip's
 camera interface
Message-ID: <202311170836.O5sq4eVx-lkp@intel.com>
References: <db605935ad21c4780b73db87605b52d30bc936a4.1700132457.git.mehdi.djait@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db605935ad21c4780b73db87605b52d30bc936a4.1700132457.git.mehdi.djait@bootlin.com>

Hi Mehdi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on linuxtv-media-stage/master media-tree/master robh/for-next linus/master v6.7-rc1 next-20231116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mehdi-Djait/media-dt-bindings-media-add-bindings-for-Rockchip-CIF/20231116-190910
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/db605935ad21c4780b73db87605b52d30bc936a4.1700132457.git.mehdi.djait%40bootlin.com
patch subject: [PATCH v11 2/3] media: rockchip: Add a driver for Rockchip's camera interface
reproduce: (https://download.01.org/0day-ci/archive/20231117/202311170836.O5sq4eVx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311170836.O5sq4eVx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/rockchip,rk3066-cif.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

