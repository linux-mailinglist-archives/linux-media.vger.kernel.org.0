Return-Path: <linux-media+bounces-16956-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C979F961B14
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 02:26:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE9341C230CB
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 00:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E7B717991;
	Wed, 28 Aug 2024 00:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TmDAqwH1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D13BD512;
	Wed, 28 Aug 2024 00:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724804791; cv=none; b=eBPXLqaVgysyoqS07oWKzQQ4YyPzIvNjA9SNxdoNiO7shBggHmDRXk+SSk7bs8Rj1o73GUv93/CTxRb5+Nfqo7EQ91Hk85EapmorQmSlcIb5UI3Ufa4f0eYmL7rGblT9oSKV49hs7qnZpaMg1WoMCo4bE1qr6DX2+N73xsJazUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724804791; c=relaxed/simple;
	bh=3BxYW8fatp/yBFsFz/oCa/Qh8//iHs1gU1fRTYqapfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HzmPaLfcukhrOBJbYvNE58DFfqxU6I14RJ5/8weKe3IXvYM5T6mwZ7OJ2l6WdjSBLLK/PBg8U2XbuOjPEw6gB+UYM7pw9I5/KgRM1/BDKde+S6l7fFI2iYGDXsTmHgd7ncKYgp4EtDVaP2q59g38UcoYimlRgQV8WIq/j671wmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TmDAqwH1; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724804789; x=1756340789;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3BxYW8fatp/yBFsFz/oCa/Qh8//iHs1gU1fRTYqapfo=;
  b=TmDAqwH19j1EW5uO7nZVGlnssJXFRm2re3v2E5Ws9jsVvOqQsTL0v1TF
   Nb2S9dYOObnlIkzw3WCI/g7Bwb/tkoyEHdlPmriYu4qes/0e0C0Y230Vl
   ntINFmotanQnxF0dNeXDxwWO/1CtJT8adYEic3Th0Ve9UyOvmlwYyuqzM
   HHIiTdlyPbKQy6WUwRqceKvS/YM+eaoQZmKMpkI5jYSrINcMMKTjT1C5l
   RtSsM9WTj8Vu6HsNR6xh66Q79D2fMp0m26on73ek1eLTCTKV+/S1SZ6Sf
   XiF56kSZ6XKaxyHEgNUtFKjlySLd7EW3ZsUwem8AGCjY+If9tApa/teLK
   Q==;
X-CSE-ConnectionGUID: AxZFmEyIQx6/S/fmCltE/Q==
X-CSE-MsgGUID: GJgqbI58Qvq3AGS/jVFQGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23273736"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="23273736"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 17:26:28 -0700
X-CSE-ConnectionGUID: bb80TmV3QoOI0wkcWCQaDw==
X-CSE-MsgGUID: kp8sTFTaRbezJjWGBtZ3Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="63383351"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Aug 2024 17:26:25 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sj6Vy-000KGI-1x;
	Wed, 28 Aug 2024 00:26:22 +0000
Date: Wed, 28 Aug 2024 08:26:00 +0800
From: kernel test robot <lkp@intel.com>
To: Dikshita Agarwal via B4 Relay <devnull+quic_dikshita.quicinc.com@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: Re: [PATCH v3 18/29] media: iris: implement vb2 streaming ops
Message-ID: <202408280735.el4Z7sYK-lkp@intel.com>
References: <20240827-iris_v3-v3-18-c5fdbbe65e70@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827-iris_v3-v3-18-c5fdbbe65e70@quicinc.com>

Hi Dikshita,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 31aaa7d95e09892c81df0d7c49ae85640fa4e202]

url:    https://github.com/intel-lab-lkp/linux/commits/Dikshita-Agarwal-via-B4-Relay/dt-bindings-media-Add-sm8550-dt-schema/20240827-181059
base:   31aaa7d95e09892c81df0d7c49ae85640fa4e202
patch link:    https://lore.kernel.org/r/20240827-iris_v3-v3-18-c5fdbbe65e70%40quicinc.com
patch subject: [PATCH v3 18/29] media: iris: implement vb2 streaming ops
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240828/202408280735.el4Z7sYK-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408280735.el4Z7sYK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408280735.el4Z7sYK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c:167:12: warning: variable 'flush_type' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     167 |                 else if (V4L2_TYPE_IS_CAPTURE(plane))
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/videodev2.h:174:36: note: expanded from macro 'V4L2_TYPE_IS_CAPTURE'
     174 | #define V4L2_TYPE_IS_CAPTURE(type) (!V4L2_TYPE_IS_OUTPUT(type))
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c:175:26: note: uninitialized use occurs here
     175 |                 flush_pkt.flush_type = flush_type;
         |                                        ^~~~~~~~~~
   drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c:167:8: note: remove the 'if' if its condition is always true
     167 |                 else if (V4L2_TYPE_IS_CAPTURE(plane))
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     168 |                         flush_type = HFI_FLUSH_OUTPUT;
   drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c:145:16: note: initialize the variable 'flush_type' to silence this warning
     145 |         u32 flush_type;
         |                       ^
         |                        = 0
   1 warning generated.


vim +167 drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c

   139	
   140	static int iris_hfi_gen1_session_stop(struct iris_inst *inst, u32 plane)
   141	{
   142		struct iris_core *core = inst->core;
   143		struct hfi_session_flush_pkt flush_pkt;
   144		struct hfi_session_pkt pkt;
   145		u32 flush_type;
   146		int ret = 0;
   147	
   148		if ((V4L2_TYPE_IS_OUTPUT(plane) &&
   149		     inst->state == IRIS_INST_INPUT_STREAMING) ||
   150		    (V4L2_TYPE_IS_CAPTURE(plane) &&
   151		     inst->state == IRIS_INST_OUTPUT_STREAMING) ||
   152		    inst->state == IRIS_INST_ERROR) {
   153			reinit_completion(&inst->completion);
   154			iris_hfi_gen1_packet_session_cmd(inst, &pkt, HFI_CMD_SESSION_STOP);
   155			ret = iris_hfi_queue_cmd_write(core, &pkt, pkt.shdr.hdr.size);
   156			if (!ret)
   157				ret = iris_wait_for_session_response(inst, false);
   158	
   159			reinit_completion(&inst->completion);
   160			iris_hfi_gen1_packet_session_cmd(inst, &pkt, HFI_CMD_SESSION_RELEASE_RESOURCES);
   161			ret = iris_hfi_queue_cmd_write(core, &pkt, pkt.shdr.hdr.size);
   162			if (!ret)
   163				ret = iris_wait_for_session_response(inst, false);
   164		} else if (inst->state == IRIS_INST_STREAMING) {
   165			if (V4L2_TYPE_IS_OUTPUT(plane))
   166				flush_type = HFI_FLUSH_ALL;
 > 167			else if (V4L2_TYPE_IS_CAPTURE(plane))
   168				flush_type = HFI_FLUSH_OUTPUT;
   169	
   170			reinit_completion(&inst->flush_completion);
   171	
   172			flush_pkt.shdr.hdr.size = sizeof(struct hfi_session_flush_pkt);
   173			flush_pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_FLUSH;
   174			flush_pkt.shdr.session_id = inst->session_id;
   175			flush_pkt.flush_type = flush_type;
   176	
   177			ret = iris_hfi_queue_cmd_write(core, &flush_pkt, flush_pkt.shdr.hdr.size);
   178			if (!ret)
   179				ret = iris_wait_for_session_response(inst, true);
   180		}
   181	
   182		return ret;
   183	}
   184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

