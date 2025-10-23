Return-Path: <linux-media+bounces-45327-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CB5BFEAAE
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 02:05:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B35061A009B7
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 00:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30CA114386D;
	Thu, 23 Oct 2025 00:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n11PsEs5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7491979F2;
	Thu, 23 Oct 2025 00:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761177874; cv=none; b=Q13uD5Qp9gUAIs+RHtHGdEjsAjSg7FfKnwivV7TEV6o9KpEf3PSkoY1k/tBA0ViIbCZtn4C+2k9gGuR8n4r0EFtaVpOtInyCjxACMqszTiw+6Wcga7bZql0/eiCv/Xv3Pe+EGVOJfU21as5pHBNoJj7D09l0zEyEHDpxGGIpJh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761177874; c=relaxed/simple;
	bh=YaRWa+4fXlNlEgTLkC8isNnjxO4623M91te5nEqafqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X2/3PqM+3VNSTkyaaOZ8ojJHZh07XpinFWul6ZbVJJi6QqIfKDT/Vcp/0qDoBHZ92GGVGxF9px3IeTe0m4jhwbjojh336CCAYUn2R/VNDFyfHrV0zGGMZTSCAL+YTYo78FkXe2NJvOdR2hf9tw1l6mCt76OQkAjsreAhgHSpChw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n11PsEs5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761177873; x=1792713873;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YaRWa+4fXlNlEgTLkC8isNnjxO4623M91te5nEqafqo=;
  b=n11PsEs5oAuZkqjuK+PcBaMQcOs8kgMHgy1k1WqIfjXsW8K3RAiReL5B
   HmrT7WZ4+UWHfpMESqbr/7ahGFxyV1vVTbVWGNNgJz5ft2wNqUGCgjtuC
   QWLm15u53TZxELBygQAsjk6TdsAS4e7GaqnfNOd/PbodYC+8FGo7ccDC5
   rrxM+ZlSUKoHBlHU27BCXRUqBj4N7UMmfQl3n5iQLI3eFXA9VCHLiIMeY
   vJd0zGz820ezGCffYdFoXAJQquyVMyYJt23ICroXW7BEoSl0yNYkVhbOa
   MsACWtv22LIxMD8UTyIY74sAQtqLfYQXDoTCN6F37/owVdrk6sMUUxhVq
   A==;
X-CSE-ConnectionGUID: plzlXApBRwGI5dtdnQ1bFg==
X-CSE-MsgGUID: 92Xed883T4Ogxkkrf4PcCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62368584"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="62368584"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 17:04:32 -0700
X-CSE-ConnectionGUID: +5yiHp4sRtiauTeU9tiIGA==
X-CSE-MsgGUID: zY4nswJCRleBt+pnFqLVpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="184491032"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 22 Oct 2025 17:04:28 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBiob-000Cqb-2F;
	Thu, 23 Oct 2025 00:04:25 +0000
Date: Thu, 23 Oct 2025 08:03:54 +0800
From: kernel test robot <lkp@intel.com>
To: Nas Chung <nas.chung@chipsnmedia.com>, mchehab@kernel.org,
	hverkuil@xs4all.nl, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com, lafley.kim@chipsnmedia.com,
	marek.vasut@mailbox.org, Nas Chung <nas.chung@chipsnmedia.com>,
	Ming Qian <ming.qian@oss.nxp.com>
Subject: Re: [PATCH v4 8/9] media: chips-media: wave6: Add Wave6 control
 driver
Message-ID: <202510230756.m2qLZNJc-lkp@intel.com>
References: <20251022074710.575-9-nas.chung@chipsnmedia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022074710.575-9-nas.chung@chipsnmedia.com>

Hi Nas,

kernel test robot noticed the following build errors:

[auto build test ERROR on shawnguo/for-next]
[also build test ERROR on linuxtv-media-pending/master robh/for-next linus/master v6.18-rc2 next-20251022]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nas-Chung/media-v4l2-common-Add-YUV24-format-info/20251022-155246
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20251022074710.575-9-nas.chung%40chipsnmedia.com
patch subject: [PATCH v4 8/9] media: chips-media: wave6: Add Wave6 control driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20251023/202510230756.m2qLZNJc-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230756.m2qLZNJc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510230756.m2qLZNJc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/platform/chips-media/wave6/wave6-vpu.c:25:
   drivers/media/platform/chips-media/wave6/wave6-vpu.c: In function 'wave6_vpu_remap_code_buf':
>> drivers/media/platform/chips-media/wave6/wave6-regdefine.h:83:57: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      83 | #define         REMAP_CTRL_INDEX(x)                     FIELD_PREP(GENMASK(15, 12), (x))
         |                                                         ^~~~~~~~~~
   drivers/media/platform/chips-media/wave6/wave6-vpu.c:131:27: note: in expansion of macro 'REMAP_CTRL_INDEX'
     131 |                           REMAP_CTRL_INDEX(i) |
         |                           ^~~~~~~~~~~~~~~~
--
   In file included from drivers/media/platform/chips-media/wave6/wave6-vpu-core.h:18,
                    from drivers/media/platform/chips-media/wave6/wave6-vpu-core.c:17:
   drivers/media/platform/chips-media/wave6/wave6-vpu-core.c: In function 'wave6_vpu_core_check_state':
>> drivers/media/platform/chips-media/wave6/wave6-vpuapi.h:125:33: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     125 | #define FW_VERSION_MAJOR(x)     FIELD_GET(FW_VERSION_MAJOR_MASK, (x))
         |                                 ^~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in expansion of macro 'FW_VERSION_MAJOR'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '__dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/media/platform/chips-media/wave6/wave6-vpu-core.c:133:9: note: in expansion of macro 'dev_dbg'
     133 |         dev_dbg(core->dev, "product 0x%x, fw_ver %d.%d.%d(r%d), hw_ver 0x%x\n",
         |         ^~~~~~~
--
   In file included from drivers/media/platform/chips-media/wave6/wave6-vpu-core.h:18,
                    from drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c:10:
   drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c: In function 'wave6_vpu_dbg_instance':
>> drivers/media/platform/chips-media/wave6/wave6-vpuapi.h:125:33: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     125 | #define FW_VERSION_MAJOR(x)     FIELD_GET(FW_VERSION_MAJOR_MASK, (x))
         |                                 ^~~~~~~~~
   drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c:34:25: note: in expansion of macro 'FW_VERSION_MAJOR'
      34 |                         FW_VERSION_MAJOR(inst->dev->attr.fw_version),
         |                         ^~~~~~~~~~~~~~~~
--
   In file included from drivers/media/platform/chips-media/wave6/wave6-hw.c:11:
   drivers/media/platform/chips-media/wave6/wave6-hw.c: In function 'wave6_send_command':
   drivers/media/platform/chips-media/wave6/wave6-regdefine.h:99:57: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      99 | #define         INSTANCE_INFO_CODEC_STD(x)              FIELD_PREP(GENMASK(31, 16), (x))
         |                                                         ^~~~~~~~~~
   drivers/media/platform/chips-media/wave6/wave6-hw.c:237:27: note: in expansion of macro 'INSTANCE_INFO_CODEC_STD'
     237 |                 reg_val = INSTANCE_INFO_CODEC_STD(std);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/chips-media/wave6/wave6-hw.c: In function 'wave6_vpu_get_version':
>> drivers/media/platform/chips-media/wave6/wave6-regdefine.h:125:57: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     125 | #define         STD_DEF1_HEVC_DEC(x)                    FIELD_GET(GENMASK(2, 2), (x))
         |                                                         ^~~~~~~~~
   drivers/media/platform/chips-media/wave6/wave6-hw.c:308:35: note: in expansion of macro 'STD_DEF1_HEVC_DEC'
     308 |         attr->support_decoders |= STD_DEF1_HEVC_DEC(std_def1) << W_HEVC_DEC;
         |                                   ^~~~~~~~~~~~~~~~~


vim +/FIELD_PREP +83 drivers/media/platform/chips-media/wave6/wave6-regdefine.h

2fef07d3bbe662 Nas Chung 2025-10-22   71  
2fef07d3bbe662 Nas Chung 2025-10-22   72  #define W6_VPU_VCPU_CUR_PC				(W6_REG_BASE + 0x0004)
2fef07d3bbe662 Nas Chung 2025-10-22   73  #define W6_VPU_VINT_REASON_CLEAR			(W6_REG_BASE + 0x0034)
2fef07d3bbe662 Nas Chung 2025-10-22   74  #define W6_VPU_HOST_INT_REQ				(W6_REG_BASE + 0x0038)
2fef07d3bbe662 Nas Chung 2025-10-22   75  #define		HOST_INT_REQ_ON				BIT(0)
2fef07d3bbe662 Nas Chung 2025-10-22   76  #define W6_VPU_VINT_CLEAR				(W6_REG_BASE + 0x003C)
2fef07d3bbe662 Nas Chung 2025-10-22   77  #define		VINT_CLEAR				BIT(0)
2fef07d3bbe662 Nas Chung 2025-10-22   78  #define W6_VPU_VPU_INT_STS				(W6_REG_BASE + 0x0044)
2fef07d3bbe662 Nas Chung 2025-10-22   79  #define W6_VPU_VINT_ENABLE				(W6_REG_BASE + 0x0048)
2fef07d3bbe662 Nas Chung 2025-10-22   80  #define W6_VPU_VINT_REASON				(W6_REG_BASE + 0x004C)
2fef07d3bbe662 Nas Chung 2025-10-22   81  #define W6_VPU_REMAP_CTRL_GB				(W6_REG_BASE + 0x0060)
2fef07d3bbe662 Nas Chung 2025-10-22   82  #define		REMAP_CTRL_ON				BIT(31)
2fef07d3bbe662 Nas Chung 2025-10-22  @83  #define		REMAP_CTRL_INDEX(x)			FIELD_PREP(GENMASK(15, 12), (x))
2fef07d3bbe662 Nas Chung 2025-10-22   84  #define		REMAP_CTRL_PAGE_SIZE_ON			BIT(11)
2fef07d3bbe662 Nas Chung 2025-10-22   85  #define		REMAP_CTRL_PAGE_SIZE(x)			FIELD_PREP(GENMASK(8, 0), ((x) >> 12))
2fef07d3bbe662 Nas Chung 2025-10-22   86  #define W6_VPU_REMAP_VADDR_GB				(W6_REG_BASE + 0x0064)
2fef07d3bbe662 Nas Chung 2025-10-22   87  #define W6_VPU_REMAP_PADDR_GB				(W6_REG_BASE + 0x0068)
2fef07d3bbe662 Nas Chung 2025-10-22   88  #define W6_VPU_REMAP_CORE_START_GB			(W6_REG_BASE + 0x006C)
2fef07d3bbe662 Nas Chung 2025-10-22   89  #define		REMAP_CORE_START_ON			BIT(0)
2fef07d3bbe662 Nas Chung 2025-10-22   90  #define W6_VPU_BUSY_STATUS				(W6_REG_BASE + 0x0070)
2fef07d3bbe662 Nas Chung 2025-10-22   91  #define		BUSY_STATUS_SET				BIT(0)
2fef07d3bbe662 Nas Chung 2025-10-22   92  #define W6_VPU_RET_PRODUCT_CODE				(W6_REG_BASE + 0x0094)
2fef07d3bbe662 Nas Chung 2025-10-22   93  
2fef07d3bbe662 Nas Chung 2025-10-22   94  /* COMMON */
2fef07d3bbe662 Nas Chung 2025-10-22   95  #define W6_COMMAND_GB					(W6_REG_BASE + 0x104)
2fef07d3bbe662 Nas Chung 2025-10-22   96  #define W6_COMMAND					(W6_REG_BASE + 0x200)
2fef07d3bbe662 Nas Chung 2025-10-22   97  #define W6_QUERY_OPTION					(W6_REG_BASE + 0x204)
2fef07d3bbe662 Nas Chung 2025-10-22   98  #define W6_CMD_INSTANCE_INFO				(W6_REG_BASE + 0x210)
2fef07d3bbe662 Nas Chung 2025-10-22   99  #define		INSTANCE_INFO_CODEC_STD(x)		FIELD_PREP(GENMASK(31, 16), (x))
2fef07d3bbe662 Nas Chung 2025-10-22  100  #define		INSTANCE_INFO_ID(x)			FIELD_PREP(GENMASK(15, 0), (x))
2fef07d3bbe662 Nas Chung 2025-10-22  101  #define W6_CMD_INIT_VPU_SEC_AXI_BASE_CORE0		(W6_REG_BASE + 0x364)
2fef07d3bbe662 Nas Chung 2025-10-22  102  #define W6_CMD_INIT_VPU_SEC_AXI_SIZE_CORE0		(W6_REG_BASE + 0x368)
2fef07d3bbe662 Nas Chung 2025-10-22  103  #define W6_CMD_SET_WORK_BUF_ADDR			(W6_REG_BASE + 0x5F0)
2fef07d3bbe662 Nas Chung 2025-10-22  104  #define W6_CMD_SET_WORK_BUF_SIZE			(W6_REG_BASE + 0x5F4)
2fef07d3bbe662 Nas Chung 2025-10-22  105  #define		SET_WORK_BUF_SIZE_ACK			0
2fef07d3bbe662 Nas Chung 2025-10-22  106  #define W6_RET_SUCCESS					(W6_REG_BASE + 0x208)
2fef07d3bbe662 Nas Chung 2025-10-22  107  #define W6_RET_FAIL_REASON				(W6_REG_BASE + 0x20C)
2fef07d3bbe662 Nas Chung 2025-10-22  108  #define W6_RET_INT_INSTANCE_INFO			(W6_REG_BASE + 0x21C)
2fef07d3bbe662 Nas Chung 2025-10-22  109  #define		INT_INSTANCE_INFO_CLEAR			0
2fef07d3bbe662 Nas Chung 2025-10-22  110  #define W6_RET_INSTANCE_ID				(W6_REG_BASE + 0x220)
2fef07d3bbe662 Nas Chung 2025-10-22  111  #define W6_RET_CQ_IN_TICK				(W6_REG_BASE + 0x23C)
2fef07d3bbe662 Nas Chung 2025-10-22  112  #define W6_RET_FW_RUN_TICK				(W6_REG_BASE + 0x240)
2fef07d3bbe662 Nas Chung 2025-10-22  113  #define W6_RET_HW_RUN_TICK				(W6_REG_BASE + 0x244)
2fef07d3bbe662 Nas Chung 2025-10-22  114  #define W6_RET_HW_DONE_TICK				(W6_REG_BASE + 0x248)
2fef07d3bbe662 Nas Chung 2025-10-22  115  #define W6_RET_FW_DONE_TICK				(W6_REG_BASE + 0x24C)
2fef07d3bbe662 Nas Chung 2025-10-22  116  #define W6_RET_RQ_OUT_TICK				(W6_REG_BASE + 0x250)
2fef07d3bbe662 Nas Chung 2025-10-22  117  
2fef07d3bbe662 Nas Chung 2025-10-22  118  /* COMMON - QUERY : GET_VPU_INFO */
2fef07d3bbe662 Nas Chung 2025-10-22  119  #define W6_RET_FW_VERSION				(W6_REG_BASE + 0x300)
2fef07d3bbe662 Nas Chung 2025-10-22  120  #define W6_RET_PRODUCT_NAME				(W6_REG_BASE + 0x304)
2fef07d3bbe662 Nas Chung 2025-10-22  121  #define W6_RET_PRODUCT_VERSION				(W6_REG_BASE + 0x308)
2fef07d3bbe662 Nas Chung 2025-10-22  122  #define W6_RET_STD_DEF0					(W6_REG_BASE + 0x30C)
2fef07d3bbe662 Nas Chung 2025-10-22  123  #define W6_RET_STD_DEF1					(W6_REG_BASE + 0x310)
2fef07d3bbe662 Nas Chung 2025-10-22  124  #define		STD_DEF1_AVC_DEC(x)			FIELD_GET(GENMASK(3, 3), (x))
2fef07d3bbe662 Nas Chung 2025-10-22 @125  #define		STD_DEF1_HEVC_DEC(x)			FIELD_GET(GENMASK(2, 2), (x))
2fef07d3bbe662 Nas Chung 2025-10-22  126  #define		STD_DEF1_AVC_ENC(x)			FIELD_GET(GENMASK(1, 1), (x))
2fef07d3bbe662 Nas Chung 2025-10-22  127  #define		STD_DEF1_HEVC_ENC(x)			FIELD_GET(GENMASK(0, 0), (x))
2fef07d3bbe662 Nas Chung 2025-10-22  128  #define W6_RET_CONF_FEATURE				(W6_REG_BASE + 0x314)
2fef07d3bbe662 Nas Chung 2025-10-22  129  #define		CONF_FEATURE_AVC10BIT_ENC(x)		FIELD_GET(GENMASK(11, 11), (x))
2fef07d3bbe662 Nas Chung 2025-10-22  130  #define		CONF_FEATURE_AVC10BIT_DEC(x)		FIELD_GET(GENMASK(9, 9), (x))
2fef07d3bbe662 Nas Chung 2025-10-22  131  #define		CONF_FEATURE_HEVC10BIT_ENC(x)		FIELD_GET(GENMASK(3, 3), (x))
2fef07d3bbe662 Nas Chung 2025-10-22  132  #define		CONF_FEATURE_HEVC10BIT_DEC(x)		FIELD_GET(GENMASK(1, 1), (x))
2fef07d3bbe662 Nas Chung 2025-10-22  133  #define W6_RET_CONF_DATE				(W6_REG_BASE + 0x318)
2fef07d3bbe662 Nas Chung 2025-10-22  134  #define W6_RET_CONF_HW_VERSION				(W6_REG_BASE + 0x31C)
2fef07d3bbe662 Nas Chung 2025-10-22  135  #define W6_RET_CONF_TYPE				(W6_REG_BASE + 0x320)
2fef07d3bbe662 Nas Chung 2025-10-22  136  #define W6_RET_FW_API_VERSION				(W6_REG_BASE + 0x32C)
2fef07d3bbe662 Nas Chung 2025-10-22  137  #define W6_RET_SHA_ID					(W6_REG_BASE + 0x330)
2fef07d3bbe662 Nas Chung 2025-10-22  138  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

