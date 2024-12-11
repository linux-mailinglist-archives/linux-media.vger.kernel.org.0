Return-Path: <linux-media+bounces-23231-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1E39ED979
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 23:18:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17BA4282775
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 22:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DBCD1F2391;
	Wed, 11 Dec 2024 22:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LbthixgF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2692F1F2360;
	Wed, 11 Dec 2024 22:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733955505; cv=none; b=i/aN1AOUf2S0fH2X9a9waD17IPlPKGJpR+S6cQ8Hd27guwJYN1hyAUWANYDaNOQQNJMZ1pXpuwoo3nzywtGJtRnITwPglJUHCExFc7MuqS7MV/3W+h0HPJ/aoZWJ9+eXfiWaZRagP6Au7W9epmynYTJrHcpx7v0Fp6uNMXYEpNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733955505; c=relaxed/simple;
	bh=RU7JEwDXb/NNK1SC/cKVBh0dMOSbGzWgfg2o+0Wox24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OtmfKdMARMKUpY8uuBKj0ua/NiBmqoZJwRZMaCfZFIPnpr0tIn/50z3aYdDerD7fVNiitSCLfs2Zql3lUtNE0hrTHdXeihwyBM65O9XN2ba5ILxcrsfa38aN8TTUTWX26rE5mEjudt+gG3OuCf5iJp3RjTSflCYuA9KpT7nRoss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LbthixgF; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733955504; x=1765491504;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RU7JEwDXb/NNK1SC/cKVBh0dMOSbGzWgfg2o+0Wox24=;
  b=LbthixgFxOh2h7GwF2RBDqdyovTLv/oMB4CpxNrd7fNCfFD3EA9Qs7wn
   49uwQu8cFdGxg9/lyQ/x1CIRZJo+07kIa7KD3q+DH+DerEqcXoOzkalLS
   MA8qCEA9TO9kzkivMKDGbVBe0/f0ILAn+sMbPbWKG+I4cE4nKTKTcXBXz
   OusWkYD3UlElRWEcRMePm3DywUH9w0qJ1A8aWwi+EDXBdogcZaYk/cvro
   uXMel6/ntHAQ0IRv2UOe5f5/yapo7j9tqR0rQt+qi6RP74xCTQVsnnTqx
   0H0Nv1zbczP+742RUrjTkUGSKgMNT/TjlXnRdnwSXq8ma5/PYbWbpvR2U
   g==;
X-CSE-ConnectionGUID: IFYKAd1XTQqq1OIr5VoUnA==
X-CSE-MsgGUID: 1LWXYwiMSy2jsb0C2pOSEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34483467"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; 
   d="scan'208";a="34483467"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 14:18:23 -0800
X-CSE-ConnectionGUID: mVW+lHN2RmWm9oEd/Ls7ag==
X-CSE-MsgGUID: kdgG+cDmR8qMoXCWeM0NPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96792761"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Dec 2024 14:18:17 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLV26-00079T-1j;
	Wed, 11 Dec 2024 22:18:14 +0000
Date: Thu, 12 Dec 2024 06:17:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>,
	Moudy Ho <moudy.ho@mediatek.com>,
	Xavier Chang <xavier.chang@mediatek.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 6/8] soc: mediatek: Add programming flow for
 unsupported subsys ID hardware
Message-ID: <202412120633.avM5EfRz-lkp@intel.com>
References: <20241211032256.28494-7-jason-jh.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211032256.28494-7-jason-jh.lin@mediatek.com>

Hi Jason-JH.Lin,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.13-rc2 next-20241211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-JH-Lin/dt-bindings-mailbox-mediatek-Add-GCE-header-file-for-MT8196/20241211-112605
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241211032256.28494-7-jason-jh.lin%40mediatek.com
patch subject: [PATCH v2 6/8] soc: mediatek: Add programming flow for unsupported subsys ID hardware
config: arm64-randconfig-002-20241212 (https://download.01.org/0day-ci/archive/20241212/202412120633.avM5EfRz-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412120633.avM5EfRz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412120633.avM5EfRz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: cmdq_subsys_is_valid
   >>> referenced by mtk-mmsys.c:173 (drivers/soc/mediatek/mtk-mmsys.c:173)
   >>>               drivers/soc/mediatek/mtk-mmsys.o:(mtk_mmsys_update_bits) in archive vmlinux.a
   >>> referenced by mtk-mutex.c:976 (drivers/soc/mediatek/mtk-mutex.c:976)
   >>>               drivers/soc/mediatek/mtk-mutex.o:(mtk_mutex_enable_by_cmdq) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

