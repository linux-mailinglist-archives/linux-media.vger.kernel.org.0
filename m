Return-Path: <linux-media+bounces-46114-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5488DC27C73
	for <lists+linux-media@lfdr.de>; Sat, 01 Nov 2025 12:07:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 783DF4E721C
	for <lists+linux-media@lfdr.de>; Sat,  1 Nov 2025 11:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB98D2F2916;
	Sat,  1 Nov 2025 11:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jm5PnlJw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793202E54DB;
	Sat,  1 Nov 2025 11:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761995267; cv=none; b=Gx6dYql/JM4J3Uian8vx/OoKoeXg3PggrR2yaCTx8CM981PvrXgznuPi6ztc0FGYKi7XooK2cVgLDbyjnIj5zUpyOSTe2JC/zmCX/Acwr/csq4pLp/cHMceVOlicybDvPYiAnhZaybACSJ7qRKhhmpZvUXLwcaA48pgpzb8oPJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761995267; c=relaxed/simple;
	bh=pwo2AH/F6d+H4i2vyh89lNZ+XD4n4HBplTVDLdDFnB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K0nf1u9ftAuSnAXKE6PPp/apaLMUpvXdIJXy1VuFBfjx7eUutdDkwnHyrbmU7j7bBD2ApE5DpOejPG0mkFzioVgPd7rWNLvvSsqzv6F2Por2xp6f3BKv3Es3hUY7xOU7ouiBulGJnvfQK7lzNg458iPQTetTmf9w7TcX3RO3EGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jm5PnlJw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761995265; x=1793531265;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pwo2AH/F6d+H4i2vyh89lNZ+XD4n4HBplTVDLdDFnB4=;
  b=Jm5PnlJwxr82UmtT9GMQBDM33G6qWaUDkSYg/M7EetOmQpeODpe+rf8m
   QFjoKVBfGzninZQ+r7Aq90ovuvp8YpswOHnU/XXx3vNHLy0GOZfwVQ/vI
   qmzxRswOxCZf3/P6a6qNmQsBtdGxmmp2CnQ/UVLrXENQ9ev6MKYZ3ovv/
   lSE+8jtC17n8jYpMHo7RYibjZoe+TfLK4rN07hh4n9VpKodZjGotRa9q7
   Z7fm5b9B0HNgC/kZZYCMDhiyKib9ZxieGxF06C1MRVFaVhmO9ZoCqDVjz
   qCy60AORX9ZYJRBVqVXkdcvtQvZ3KEnnk72tkToGW0y9cXYNpVCdmzS6a
   Q==;
X-CSE-ConnectionGUID: /3/n6Ag6TsqQ9HUFI4jf4w==
X-CSE-MsgGUID: WIBPjXUJQtKNOlviYiPLeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67979214"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67979214"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 04:07:45 -0700
X-CSE-ConnectionGUID: D9pmvt2aRzub+M8lQn84cw==
X-CSE-MsgGUID: FpfaqeAFSECmJUUrEqcDeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="190789457"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 01 Nov 2025 04:07:39 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vF9SE-000OAS-0o;
	Sat, 01 Nov 2025 11:07:33 +0000
Date: Sat, 1 Nov 2025 19:06:56 +0800
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
Message-ID: <202511011822.Vn6fsvGr-lkp@intel.com>
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
config: powerpc64-randconfig-r063-20251101 (https://download.01.org/0day-ci/archive/20251101/202511011822.Vn6fsvGr-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511011822.Vn6fsvGr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511011822.Vn6fsvGr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/mediatek/mtk-mmsys.c:170:26: error: no member named 'pkt_write_mask' in 'struct cmdq_client_reg'
     170 |                 ret = mmsys->cmdq_base.pkt_write_mask(cmdq_pkt,
         |                       ~~~~~~~~~~~~~~~~ ^
>> drivers/soc/mediatek/mtk-mmsys.c:172:30: error: no member named 'pa_base' in 'struct cmdq_client_reg'
     172 |                                                       mmsys->cmdq_base.pa_base,
         |                                                       ~~~~~~~~~~~~~~~~ ^
   2 errors generated.
--
>> drivers/soc/mediatek/mtk-mutex.c:1002:16: error: no member named 'pkt_write' in 'struct cmdq_client_reg'
    1002 |         mtx->cmdq_reg.pkt_write(cmdq_pkt, mtx->cmdq_reg.subsys, en_addr, en_addr, 1);
         |         ~~~~~~~~~~~~~ ^
   1 error generated.


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

