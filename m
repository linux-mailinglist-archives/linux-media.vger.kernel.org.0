Return-Path: <linux-media+bounces-46115-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA73C27CB3
	for <lists+linux-media@lfdr.de>; Sat, 01 Nov 2025 12:29:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83B9C189A2EA
	for <lists+linux-media@lfdr.de>; Sat,  1 Nov 2025 11:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D4C2F5466;
	Sat,  1 Nov 2025 11:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LEBy17/b"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD9C2DC348;
	Sat,  1 Nov 2025 11:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761996545; cv=none; b=FnwJtNm5RbYdE4s7PllZU7gsrtmprwcOvWX+f09e4waoQefEeTImwxRIG29XkdkUvKEzLROnlR8QFyXPp70oXcr9WBUzolBPA/H0JqO+EpsWnaYHIGm0fPeqgKXUD37HQamWUNSilcABgaqncexnkJT5FRAWXofLp8UR/1PW3cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761996545; c=relaxed/simple;
	bh=sF26sQtYAQFqKSwZpyXYz3QW+Hf+GiF9jFBa1Emk2c8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AsQGPTagtxE23/D7Y61FuK7vGW3E7nTHR0Gy0bn4xcZ2qdbrSTEvWK9H7TwImLTaY5W9gGlItot0d1NiA7HkMLgb9nugWmu+mAfAkrWPwC4XcbQdFdTk9t7gJj7z6Iv6JLhfR66j2aXWR/8fewT/K1qpV3QANwldYYONXhhL7qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LEBy17/b; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761996544; x=1793532544;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sF26sQtYAQFqKSwZpyXYz3QW+Hf+GiF9jFBa1Emk2c8=;
  b=LEBy17/bz5Kld+I1fZIuLvXIq9/a7omM3HYxlxAyijZ+MuGxRd6z6c4T
   Lyl5BY0NPsabZl6T7ELw0p8kl+I7Dw7tiW2jUjUOyn0WHZRHaR3m7EaSS
   R06tYv6m9z1PG8ihDwS/M3WiGm9xLvl1dCzzJfAE6ltZqBKnxq0/GYrez
   dmPJE+EqZXLP22IcS2hHHexzP+TeCq8+Cf+zdGeHxQ8cYcrMvo97ef/lB
   nNOB9+gxLMflT9Ez9KJMWwnAb2JtenOMUK90a7Rj2o8PJWnB1p+ef9/bd
   +5gqJgO7nRmAiyyP6iRT5Ib1tG8NGxA/1SJrlec/l1U4c6v8m2NQb+YLi
   Q==;
X-CSE-ConnectionGUID: S05RZRYKRGqTbeNiAOBjLw==
X-CSE-MsgGUID: GFToRhMfTTGdlJ1bPZh00w==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="67797844"
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="67797844"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 04:29:03 -0700
X-CSE-ConnectionGUID: fCbaBgp4R9Cg2C2C3uNafw==
X-CSE-MsgGUID: fbz26zFYROKDX/eUs4VjWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="186400275"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 01 Nov 2025 04:28:58 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vF9mw-000OBo-38;
	Sat, 01 Nov 2025 11:28:54 +0000
Date: Sat, 1 Nov 2025 19:28:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jason-JH Lin <jason-jh.lin@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>,
	Paul-PL Chen <paul-pl.chen@mediatek.com>,
	Moudy Ho <moudy.ho@mediatek.com>,
	Xiandong Wang <xiandong.wang@mediatek.com>,
	Sirius Wang <sirius.wang@mediatek.com>,
	Fei Shao <fshao@chromium.org>, Chen-yu Tsai <wenst@chromium.org>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/5] soc: mediatek: Use pkt_write function pointer for
 subsys ID compatibility
Message-ID: <202511011936.zWnbnVXF-lkp@intel.com>
References: <20251031160309.1654761-2-jason-jh.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031160309.1654761-2-jason-jh.lin@mediatek.com>

Hi Jason-JH,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on media-tree/master linus/master v6.18-rc3 next-20251031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-JH-Lin/soc-mediatek-Use-pkt_write-function-pointer-for-subsys-ID-compatibility/20251101-000555
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20251031160309.1654761-2-jason-jh.lin%40mediatek.com
patch subject: [PATCH 1/5] soc: mediatek: Use pkt_write function pointer for subsys ID compatibility
config: xtensa-randconfig-r064-20251101 (https://download.01.org/0day-ci/archive/20251101/202511011936.zWnbnVXF-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511011936.zWnbnVXF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511011936.zWnbnVXF-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/mediatek/mtk-mmsys.c: In function 'mtk_mmsys_update_bits':
>> drivers/soc/mediatek/mtk-mmsys.c:170:25: error: 'struct cmdq_client_reg' has no member named 'pkt_write_mask'
      ret = mmsys->cmdq_base.pkt_write_mask(cmdq_pkt,
                            ^
>> drivers/soc/mediatek/mtk-mmsys.c:172:29: error: 'struct cmdq_client_reg' has no member named 'pa_base'
                mmsys->cmdq_base.pa_base,
                                ^
--
   drivers/soc/mediatek/mtk-mutex.c: In function 'mtk_mutex_enable_by_cmdq':
>> drivers/soc/mediatek/mtk-mutex.c:1002:15: error: 'struct cmdq_client_reg' has no member named 'pkt_write'
     mtx->cmdq_reg.pkt_write(cmdq_pkt, mtx->cmdq_reg.subsys, en_addr, en_addr, 1);
                  ^


vim +170 drivers/soc/mediatek/mtk-mmsys.c

   162	
   163	static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val,
   164					  struct cmdq_pkt *cmdq_pkt)
   165	{
   166		int ret;
   167		u32 tmp;
   168	
   169		if (mmsys->cmdq_base.size && cmdq_pkt) {
 > 170			ret = mmsys->cmdq_base.pkt_write_mask(cmdq_pkt,
   171							      mmsys->cmdq_base.subsys,
 > 172							      mmsys->cmdq_base.pa_base,
   173							      mmsys->cmdq_base.offset + offset,
   174							      val, mask);
   175			if (ret)
   176				pr_debug("CMDQ unavailable: using CPU write\n");
   177			else
   178				return;
   179		}
   180		tmp = readl_relaxed(mmsys->regs + offset);
   181		tmp = (tmp & ~mask) | (val & mask);
   182		writel_relaxed(tmp, mmsys->regs + offset);
   183	}
   184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

