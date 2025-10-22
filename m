Return-Path: <linux-media+bounces-45326-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1101CBFE76A
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 01:02:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EA8FA355482
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 23:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8795303A03;
	Wed, 22 Oct 2025 23:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aKsYLSDm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278B726C3B6;
	Wed, 22 Oct 2025 23:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761174119; cv=none; b=kf/7Idr+6y3jh34v5k/SkwUamgsRYstsCA3h7v4aYgux9BGHfQfSkQmkfU5a7XrsaXRZbgtyuelMsuSdWUm3cNJtyj8rJE3CP3QKxiwY7V/CnXqJqDJLtEvgxOFoNk0zSsxyevGp2SpbgQQ2ptu3OfLsQQqRRLIuDGQOoKMxu40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761174119; c=relaxed/simple;
	bh=ZYwSymkxgPomBYdrpYf7dCnYDn0jDU8UBAylZmQcrtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dvVcFz7n5KiWhQ3e5LGaVbzjrFYejSyL4XpPcvLsOe3ThyKu+qggT9DJRayGF/AVQ1EapV93OXHgjTdtVW+mNyPduQftHfM74oxTxr2zmedrHaakwtZxtxuXn0d9od9ZpAgAzQpjACKGXU3AXjvQHAgOYw5OebkR5ochb7voG3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aKsYLSDm; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761174117; x=1792710117;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZYwSymkxgPomBYdrpYf7dCnYDn0jDU8UBAylZmQcrtc=;
  b=aKsYLSDmHXPWA0Y6Jz8dgX309ZhrylbYDoNzqyTyQKnL38X1QORGDkj7
   5yAfzKslH7a5N0RWooph00DGjbiT0tgZ1nf2QEuCIPG8B4JHw0VXMk+YN
   LFtR7pOXu8lOc2mwZ7/O6hOGltYV0uhqWPrNMJM8ygM5KwrjXpbaQlYV0
   kIdRq7iZ89Ap00l262jlk2siNbZe5B5B16K444VOkcuzZVJp/X6fqO3GC
   3EYGb5AgS9VqCF536tqbgWz3kX2SuAfu+1OiOP8jk/61QcI0VxQqvLEHl
   pQGuue5IgSr/TsuoYqNo39NSbAVtvOSyJOD7WpphRisGL6rfRz4rkXUZa
   w==;
X-CSE-ConnectionGUID: vNvhXzNLSQaaxufDGZdX9g==
X-CSE-MsgGUID: e1oMgOTwQi6wypcdUAu+eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="65950906"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="65950906"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 16:01:56 -0700
X-CSE-ConnectionGUID: LjP14FD2T+GasfUkjwUPmQ==
X-CSE-MsgGUID: 3Eb6PqzwQiC4NlyV/Mxo0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="183893778"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 Oct 2025 16:01:34 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBhpd-000CoP-1L;
	Wed, 22 Oct 2025 23:01:30 +0000
Date: Thu, 23 Oct 2025 07:01:10 +0800
From: kernel test robot <lkp@intel.com>
To: Nas Chung <nas.chung@chipsnmedia.com>, mchehab@kernel.org,
	hverkuil@xs4all.nl, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org, jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com, marek.vasut@mailbox.org,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Ming Qian <ming.qian@oss.nxp.com>
Subject: Re: [PATCH v4 8/9] media: chips-media: wave6: Add Wave6 control
 driver
Message-ID: <202510230606.Ycv5XHv1-lkp@intel.com>
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
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20251023/202510230606.Ycv5XHv1-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230606.Ycv5XHv1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510230606.Ycv5XHv1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/chips-media/wave6/wave6-vpu.c:131:6: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     131 |                           REMAP_CTRL_INDEX(i) |
         |                           ^
   drivers/media/platform/chips-media/wave6/wave6-regdefine.h:83:32: note: expanded from macro 'REMAP_CTRL_INDEX'
      83 | #define         REMAP_CTRL_INDEX(x)                     FIELD_PREP(GENMASK(15, 12), (x))
         |                                                         ^
   1 error generated.
--
>> drivers/media/platform/chips-media/wave6/wave6-vpu-core.c:135:3: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     135 |                 FW_VERSION_MAJOR(core->attr.fw_version),
         |                 ^
   drivers/media/platform/chips-media/wave6/wave6-vpu-core.c:143:4: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     143 |                         FW_VERSION_MAJOR(core->res->compatible_fw_version),
         |                         ^
   2 errors generated.
--
>> drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c:34:4: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      34 |                         FW_VERSION_MAJOR(inst->dev->attr.fw_version),
         |                         ^
   drivers/media/platform/chips-media/wave6/wave6-vpuapi.h:125:29: note: expanded from macro 'FW_VERSION_MAJOR'
     125 | #define FW_VERSION_MAJOR(x)     FIELD_GET(FW_VERSION_MAJOR_MASK, (x))
         |                                 ^
   1 error generated.
--
>> drivers/media/platform/chips-media/wave6/wave6-hw.c:237:13: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     237 |                 reg_val = INSTANCE_INFO_CODEC_STD(std);
         |                           ^
   drivers/media/platform/chips-media/wave6/wave6-regdefine.h:99:38: note: expanded from macro 'INSTANCE_INFO_CODEC_STD'
      99 | #define         INSTANCE_INFO_CODEC_STD(x)              FIELD_PREP(GENMASK(31, 16), (x))
         |                                                         ^
>> drivers/media/platform/chips-media/wave6/wave6-hw.c:308:28: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     308 |         attr->support_decoders |= STD_DEF1_HEVC_DEC(std_def1) << W_HEVC_DEC;
         |                                   ^
   drivers/media/platform/chips-media/wave6/wave6-regdefine.h:125:33: note: expanded from macro 'STD_DEF1_HEVC_DEC'
     125 | #define         STD_DEF1_HEVC_DEC(x)                    FIELD_GET(GENMASK(2, 2), (x))
         |                                                         ^
   drivers/media/platform/chips-media/wave6/wave6-hw.c:362:12: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     362 |         reg_val = CREATE_INST_CORE_INFO_CQ_DEPTH(COMMAND_QUEUE_DEPTH) |
         |                   ^
   drivers/media/platform/chips-media/wave6/wave6-regdefine.h:145:44: note: expanded from macro 'CREATE_INST_CORE_INFO_CQ_DEPTH'
     145 | #define         CREATE_INST_CORE_INFO_CQ_DEPTH(x)       FIELD_PREP(GENMASK(10, 8), (x))
         |                                                         ^
   drivers/media/platform/chips-media/wave6/wave6-hw.c:405:12: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     405 |         reg_val = DEC_PIC_BS_OPTION_STREAM_END(p_dec_info->stream_end) |
         |                   ^
   drivers/media/platform/chips-media/wave6/wave6-regdefine.h:259:43: note: expanded from macro 'DEC_PIC_BS_OPTION_STREAM_END'
     259 | #define         DEC_PIC_BS_OPTION_STREAM_END(x)         FIELD_PREP(GENMASK(1, 1), (x))
         |                                                         ^
   drivers/media/platform/chips-media/wave6/wave6-hw.c:438:20: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     438 |         info->pic_width = DEC_PIC_SIZE_WIDTH(reg_val);
         |                           ^
   drivers/media/platform/chips-media/wave6/wave6-regdefine.h:299:34: note: expanded from macro 'DEC_PIC_SIZE_WIDTH'
     299 | #define         DEC_PIC_SIZE_WIDTH(x)                   FIELD_GET(GENMASK(31, 16), (x))
         |                                                         ^
   drivers/media/platform/chips-media/wave6/wave6-hw.c:561:12: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     561 |         reg_val = SET_FB_PIC_SIZE_WIDTH(p_dec_info->seq_info.pic_width) |
         |                   ^
   drivers/media/platform/chips-media/wave6/wave6-regdefine.h:167:36: note: expanded from macro 'SET_FB_PIC_SIZE_WIDTH'
     167 | #define         SET_FB_PIC_SIZE_WIDTH(x)                FIELD_PREP(GENMASK(31, 16), (x))
         |                                                         ^
   drivers/media/platform/chips-media/wave6/wave6-hw.c:650:12: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     650 |         reg_val = SET_DISP_SCL_PIC_SIZE_WIDTH(inst->scaler_info.width) |
         |                   ^
   drivers/media/platform/chips-media/wave6/wave6-regdefine.h:250:42: note: expanded from macro 'SET_DISP_SCL_PIC_SIZE_WIDTH'
     250 | #define         SET_DISP_SCL_PIC_SIZE_WIDTH(x)          FIELD_PREP(GENMASK(31, 16), (x))
         |                                                         ^
   drivers/media/platform/chips-media/wave6/wave6-hw.c:732:12: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     732 |         reg_val = DEC_PIC_BS_OPTION_STREAM_END(p_dec_info->stream_end) |
         |                   ^
   drivers/media/platform/chips-media/wave6/wave6-regdefine.h:259:43: note: expanded from macro 'DEC_PIC_BS_OPTION_STREAM_END'
     259 | #define         DEC_PIC_BS_OPTION_STREAM_END(x)         FIELD_PREP(GENMASK(1, 1), (x))
         |                                                         ^
   drivers/media/platform/chips-media/wave6/wave6-hw.c:789:21: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     789 |         result->ctu_size = DEC_PIC_TYPE_CTU_SIZE(reg_val);
         |                            ^
   drivers/media/platform/chips-media/wave6/wave6-regdefine.h:310:43: note: expanded from macro 'DEC_PIC_TYPE_CTU_SIZE'
     310 | #define         DEC_PIC_TYPE_CTU_SIZE(x)                (16 << FIELD_GET(GENMASK(11, 10), (x)))
         |                                                                ^
   drivers/media/platform/chips-media/wave6/wave6-hw.c:1074:12: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1074 |         reg_val = CREATE_INST_CORE_INFO_CQ_DEPTH(COMMAND_QUEUE_DEPTH) |
         |                   ^
   drivers/media/platform/chips-media/wave6/wave6-regdefine.h:145:44: note: expanded from macro 'CREATE_INST_CORE_INFO_CQ_DEPTH'
     145 | #define         CREATE_INST_CORE_INFO_CQ_DEPTH(x)       FIELD_PREP(GENMASK(10, 8), (x))
         |                                                         ^
   drivers/media/platform/chips-media/wave6/wave6-hw.c:1217:18: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1217 |         reg->src_size = SET_PARAM_SRC_SIZE_HEIGHT(p_enc_info->height) |
         |                         ^
   drivers/media/platform/chips-media/wave6/wave6-regdefine.h:359:40: note: expanded from macro 'SET_PARAM_SRC_SIZE_HEIGHT'
     359 | #define         SET_PARAM_SRC_SIZE_HEIGHT(x)            FIELD_PREP(GENMASK(31, 16), (x))
         |                                                         ^
   drivers/media/platform/chips-media/wave6/wave6-hw.c:1304:13: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1304 |         reg->sps = SET_PARAM_SPS_DEFAULT_SCALING_LIST(p_param->en_scaling_list) |
         |                    ^
   drivers/media/platform/chips-media/wave6/wave6-regdefine.h:363:48: note: expanded from macro 'SET_PARAM_SPS_DEFAULT_SCALING_LIST'
     363 | #define         SET_PARAM_SPS_DEFAULT_SCALING_LIST(x)   FIELD_PREP(GENMASK(31, 31), (x))
         |                                                         ^
   drivers/media/platform/chips-media/wave6/wave6-hw.c:1346:13: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1346 |         reg->sps = SET_PARAM_SPS_DEFAULT_SCALING_LIST(p_param->en_scaling_list) |
         |                    ^
   drivers/media/platform/chips-media/wave6/wave6-regdefine.h:363:48: note: expanded from macro 'SET_PARAM_SPS_DEFAULT_SCALING_LIST'
     363 | #define         SET_PARAM_SPS_DEFAULT_SCALING_LIST(x)   FIELD_PREP(GENMASK(31, 31), (x))
         |                                                         ^
   drivers/media/platform/chips-media/wave6/wave6-hw.c:1594:18: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1594 |         reg->pic_info = SET_FB_PIC_INFO_STRIDE(p_enc_info->stride);
         |                         ^
   drivers/media/platform/chips-media/wave6/wave6-regdefine.h:165:37: note: expanded from macro 'SET_FB_PIC_INFO_STRIDE'
     165 | #define         SET_FB_PIC_INFO_STRIDE(x)               FIELD_PREP(GENMASK(15, 0), (x))
         |                                                         ^
   drivers/media/platform/chips-media/wave6/wave6-hw.c:1953:17: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1953 |         reg->src_fmt = ENC_PIC_SRC_FMT_C_FMT_IDC(c_fmt_idc) |
         |                        ^
   drivers/media/platform/chips-media/wave6/wave6-regdefine.h:542:40: note: expanded from macro 'ENC_PIC_SRC_FMT_C_FMT_IDC'
     542 | #define         ENC_PIC_SRC_FMT_C_FMT_IDC(x)            FIELD_PREP(GENMASK(30, 28), (x))
         |                                                         ^
   15 errors generated.


vim +/FIELD_PREP +131 drivers/media/platform/chips-media/wave6/wave6-vpu.c

   123	
   124	static void wave6_vpu_remap_code_buf(struct wave6_vpu_device *vpu)
   125	{
   126		dma_addr_t code_base = vpu->code_buf.dma_addr;
   127		u32 i, reg_val;
   128	
   129		for (i = 0; i < wave6_vpu_get_code_buf_size(vpu) / W6_MAX_REMAP_PAGE_SIZE; i++) {
   130			reg_val = REMAP_CTRL_ON |
 > 131				  REMAP_CTRL_INDEX(i) |
   132				  REMAP_CTRL_PAGE_SIZE_ON |
   133				  REMAP_CTRL_PAGE_SIZE(W6_MAX_REMAP_PAGE_SIZE);
   134			wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_CTRL_GB, reg_val);
   135			wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_VADDR_GB,
   136					 i * W6_MAX_REMAP_PAGE_SIZE);
   137			wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_PADDR_GB,
   138					 code_base + i * W6_MAX_REMAP_PAGE_SIZE);
   139		}
   140	}
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

