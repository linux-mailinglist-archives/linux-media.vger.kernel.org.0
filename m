Return-Path: <linux-media+bounces-46197-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 54791C2B2B1
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 11:55:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A9DF234964D
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 10:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FEEC3009D6;
	Mon,  3 Nov 2025 10:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iQHDfhXb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2262C3002D0;
	Mon,  3 Nov 2025 10:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762167291; cv=none; b=bFvIQba40LD5PEvqTJIHSsHhnPommd/g88mHSo2ja+Kp1hWV+Ypsmxs2jH0ouBAFaCO2/Mm1iakMBg4vq51SPTPccgEb20yzUnq9zcqqOzGed692Xc19nvnQ3t67XlLkxUVgTbcPU1RDTJ59/EF5OrzBMaXd0/y8LzIU1l4ZVH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762167291; c=relaxed/simple;
	bh=mHztXZKea3eYbuXZUozH4OPWQfr33olPYctifT4kIq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gaL5h2zDUb28beHJo1yy7GEMBLHNB/jVOjH/KVX0cgTH1799g5rzxN0SqSv8V/V1IybpvFF0o7p21dFWJGpRBlM5kprb4SvCo7AORCtA2bYVu3fgPdYhxyljN312qsxi7j6k2NmJj+To0RwK8AlQx98Xn9b3hKYalzRn2m5pB1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iQHDfhXb; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762167291; x=1793703291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mHztXZKea3eYbuXZUozH4OPWQfr33olPYctifT4kIq0=;
  b=iQHDfhXb7p0QvKPgi1O1jqBrjHpGm3BSUJrq/VG0w+jxyizDPjXgiQbA
   1+G5LpjabEWGbFjmeiyDJXLwtJ0+g9BXK5SdHXfm3uSHNR/KvkSDo0gwf
   k0nHcnSFOcEvbf1ItcY4zoRG/q5Rp10HP16LhVPpJ9mc8mRo+HkoWnLQg
   Qm+7zXfsnqgAZQers0SVR/zOX93w4K8xu87qQu8WoN78DL2ILcmwXasOA
   RURjuBocaqEjeSs0v6Acga2T+Rl7/uOyXzXP6QD2HEiaRYf1VRFeP7B9o
   gu6RT5x0Y4SJV8YDvDfGXJFThiXi77GzNhFgVJw5iUQJ4UYxoQExpt6UO
   A==;
X-CSE-ConnectionGUID: bgIkZgWKQVeAmKCw7QbMlA==
X-CSE-MsgGUID: pb8KUsTjSy+95btK5EgO1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64142970"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64142970"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 02:54:50 -0800
X-CSE-ConnectionGUID: NJHO0wfOSJWZQnayZLOwAw==
X-CSE-MsgGUID: 9XEsEJ3bSRGD6N5jaiLKCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="224077379"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 03 Nov 2025 02:54:40 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFsCn-000Q2y-2D;
	Mon, 03 Nov 2025 10:54:33 +0000
Date: Mon, 3 Nov 2025 18:54:29 +0800
From: kernel test robot <lkp@intel.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wangao Wang <wangao.wang@oss.qualcomm.com>, quic_qiweil@quicinc.com,
	quic_renjiang@quicinc.com
Subject: Re: [PATCH v2 1/5] media: qcom: iris: Improve format alignment for
 encoder
Message-ID: <202511031813.c8c7mkXF-lkp@intel.com>
References: <20251031-iris_encoder_enhancements-v2-1-319cd75cbb45@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031-iris_encoder_enhancements-v2-1-319cd75cbb45@oss.qualcomm.com>

Hi Wangao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 13863a59e410cab46d26751941980dc8f088b9b3]

url:    https://github.com/intel-lab-lkp/linux/commits/Wangao-Wang/media-qcom-iris-Improve-format-alignment-for-encoder/20251031-175803
base:   13863a59e410cab46d26751941980dc8f088b9b3
patch link:    https://lore.kernel.org/r/20251031-iris_encoder_enhancements-v2-1-319cd75cbb45%40oss.qualcomm.com
patch subject: [PATCH v2 1/5] media: qcom: iris: Improve format alignment for encoder
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20251103/202511031813.c8c7mkXF-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511031813.c8c7mkXF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511031813.c8c7mkXF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c:236:7: warning: variable 'left_offset' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     236 |                 if (V4L2_TYPE_IS_CAPTURE(plane)) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:182:2: note: expanded from macro 'V4L2_TYPE_IS_CAPTURE'
     182 |         (V4L2_TYPE_IS_VALID(type) && !V4L2_TYPE_IS_OUTPUT(type))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c:246:43: note: uninitialized use occurs here
     246 |         payload[0] = FIELD_PREP(GENMASK(31, 16), left_offset) | top_offset;
         |                                                  ^~~~~~~~~~~
   drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c:236:3: note: remove the 'if' if its condition is always true
     236 |                 if (V4L2_TYPE_IS_CAPTURE(plane)) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c:236:7: warning: variable 'left_offset' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
     236 |                 if (V4L2_TYPE_IS_CAPTURE(plane)) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:182:3: note: expanded from macro 'V4L2_TYPE_IS_CAPTURE'
     182 |         (V4L2_TYPE_IS_VALID(type) && !V4L2_TYPE_IS_OUTPUT(type))
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:165:2: note: expanded from macro 'V4L2_TYPE_IS_VALID'
     165 |         ((type) >= V4L2_BUF_TYPE_VIDEO_CAPTURE &&\
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     166 |          (type) <= V4L2_BUF_TYPE_META_OUTPUT)
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c:246:43: note: uninitialized use occurs here
     246 |         payload[0] = FIELD_PREP(GENMASK(31, 16), left_offset) | top_offset;
         |                                                  ^~~~~~~~~~~
   drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c:236:7: note: remove the '&&' if its condition is always true
     236 |                 if (V4L2_TYPE_IS_CAPTURE(plane)) {
         |                     ^
   include/uapi/linux/videodev2.h:182:3: note: expanded from macro 'V4L2_TYPE_IS_CAPTURE'
     182 |         (V4L2_TYPE_IS_VALID(type) && !V4L2_TYPE_IS_OUTPUT(type))
         |          ^
   include/uapi/linux/videodev2.h:165:2: note: expanded from macro 'V4L2_TYPE_IS_VALID'
     165 |         ((type) >= V4L2_BUF_TYPE_VIDEO_CAPTURE &&\
         |         ^
>> drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c:236:7: warning: variable 'left_offset' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
     236 |                 if (V4L2_TYPE_IS_CAPTURE(plane)) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:182:3: note: expanded from macro 'V4L2_TYPE_IS_CAPTURE'
     182 |         (V4L2_TYPE_IS_VALID(type) && !V4L2_TYPE_IS_OUTPUT(type))
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:165:3: note: expanded from macro 'V4L2_TYPE_IS_VALID'
     165 |         ((type) >= V4L2_BUF_TYPE_VIDEO_CAPTURE &&\
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c:246:43: note: uninitialized use occurs here
     246 |         payload[0] = FIELD_PREP(GENMASK(31, 16), left_offset) | top_offset;
         |                                                  ^~~~~~~~~~~
   drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c:236:7: note: remove the '&&' if its condition is always true
     236 |                 if (V4L2_TYPE_IS_CAPTURE(plane)) {
         |                     ^
   include/uapi/linux/videodev2.h:182:3: note: expanded from macro 'V4L2_TYPE_IS_CAPTURE'
     182 |         (V4L2_TYPE_IS_VALID(type) && !V4L2_TYPE_IS_OUTPUT(type))
         |          ^
   include/uapi/linux/videodev2.h:165:3: note: expanded from macro 'V4L2_TYPE_IS_VALID'
     165 |         ((type) >= V4L2_BUF_TYPE_VIDEO_CAPTURE &&\
         |          ^
   drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c:217:17: note: initialize the variable 'left_offset' to silence this warning
     217 |         u32 left_offset, top_offset;
         |                        ^
         |                         = 0
   3 warnings generated.


vim +236 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c

   211	
   212	static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst, u32 plane)
   213	{
   214		struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
   215		u32 port = iris_hfi_gen2_get_port(inst, plane);
   216		u32 bottom_offset, right_offset;
   217		u32 left_offset, top_offset;
   218		u32 codec_align;
   219		u32 payload[2];
   220	
   221		codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
   222	
   223		if (inst->domain == DECODER) {
   224			if (V4L2_TYPE_IS_OUTPUT(plane)) {
   225				bottom_offset = (inst->fmt_src->fmt.pix_mp.height - inst->crop.height);
   226				right_offset = (inst->fmt_src->fmt.pix_mp.width - inst->crop.width);
   227				left_offset = inst->crop.left;
   228				top_offset = inst->crop.top;
   229			} else {
   230				bottom_offset = (inst->fmt_dst->fmt.pix_mp.height - inst->compose.height);
   231				right_offset = (inst->fmt_dst->fmt.pix_mp.width - inst->compose.width);
   232				left_offset = inst->compose.left;
   233				top_offset = inst->compose.top;
   234			}
   235		} else {
 > 236			if (V4L2_TYPE_IS_CAPTURE(plane)) {
   237				bottom_offset = (ALIGN(inst->enc_raw_height, codec_align) -
   238						inst->enc_raw_height);
   239				right_offset = (ALIGN(inst->enc_raw_width, codec_align) -
   240						inst->enc_raw_width);
   241				left_offset = inst->crop.left;
   242				top_offset = inst->crop.top;
   243			}
   244		}
   245	
   246		payload[0] = FIELD_PREP(GENMASK(31, 16), left_offset) | top_offset;
   247		payload[1] = FIELD_PREP(GENMASK(31, 16), right_offset) | bottom_offset;
   248		inst_hfi_gen2->src_subcr_params.crop_offsets[0] = payload[0];
   249		inst_hfi_gen2->src_subcr_params.crop_offsets[1] = payload[1];
   250	
   251		return iris_hfi_gen2_session_set_property(inst,
   252							  HFI_PROP_CROP_OFFSETS,
   253							  HFI_HOST_FLAGS_NONE,
   254							  port,
   255							  HFI_PAYLOAD_64_PACKED,
   256							  &payload,
   257							  sizeof(u64));
   258	}
   259	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

