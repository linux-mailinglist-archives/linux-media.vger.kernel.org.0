Return-Path: <linux-media+bounces-32117-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E4BAB0F1B
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 11:38:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6C1F9C18AF
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 09:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BEB927A93F;
	Fri,  9 May 2025 09:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P6A+9MQf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A19735976;
	Fri,  9 May 2025 09:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746783478; cv=none; b=Vm4co7gYykkm8ZOhbn+koeNpdz4v5gc1rC8ENHcqe/e75X7OWzARc0v8cwc5JUI3cUQblwCNHt2O5uKGHOTNZwDcuJWGpjP4eH0qvN1iHQKDFxH4i8Txcs5rBupT9KqOfxo+08bLjLCL4gv0kCZaXdCwJwB5IWWvIU55mU7RU4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746783478; c=relaxed/simple;
	bh=xyOJtjUQ7Rqu2zBQdpb/wjJlsQkJeZeAW3fBuv8lBKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=op21gQAN8AHAncT38mFlFQ6Jl8nLptr8DMldvrrUOgJot0yi9BiWKYYw9cpgt1N9gMcmYc+oW48rtDHjUju1T1sxoqxBmWKM0ZFPxhM1yLC1lx2otr1snNrXSQAWW3xRf7n5DLX5rLIkc7h+o8ZAip3srpTGaz4A3GMCMOlZnNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P6A+9MQf; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746783477; x=1778319477;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xyOJtjUQ7Rqu2zBQdpb/wjJlsQkJeZeAW3fBuv8lBKE=;
  b=P6A+9MQfQkkrLEMtWuu6GPsHyvyDhFAbRoOZwyLk+fCJHG9b5xW0IwJp
   5noXhwa/b8cUyD374k/fl9VcxQ4OdWOsM4qjOquwxsd7oMv43nagJ7bT9
   oLsyrfP1erGLYZjZuBDkY+JG/XaaJEgVhkL8ehJYKu39GF5pQZhD6F5kC
   g8jZj9XDA8l2tBYsMFa0HCB96Gmenvq/SPYuVxuFL47E7Q1ISR4OftQkZ
   aAGKfeF3H4dXw5uPqymvQANiOOe8JecT+rHAhJJrE2oKC6rBMFiZIrA2k
   aibcpV9D51BPWUSBzm4NUDfksAYtAdmgG9V2BF8vhKuZXc0qx9G8sihFB
   g==;
X-CSE-ConnectionGUID: eSkUpEawTjmKP8FLeyqtKQ==
X-CSE-MsgGUID: j/eXJ7rrQcqsfHvC9uGfiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59268812"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="59268812"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 02:37:56 -0700
X-CSE-ConnectionGUID: FcjoOz+LTqGzJSCXcsQPZw==
X-CSE-MsgGUID: LKHV/WWIQpqqcqFe3yg6Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="136959749"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 May 2025 02:37:51 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDKAv-000BsL-18;
	Fri, 09 May 2025 09:37:49 +0000
Date: Fri, 9 May 2025 17:37:41 +0800
From: kernel test robot <lkp@intel.com>
To: ming.qian@oss.nxp.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc: oe-kbuild-all@lists.linux.dev, nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-imx@nxp.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] media: amphion: Add H264 and HEVC profile and level
 control
Message-ID: <202505091722.oiKjnVNJ-lkp@intel.com>
References: <20250508053304.2057-1-ming.qian@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508053304.2057-1-ming.qian@oss.nxp.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b64b134942c8cf4801ea288b3fd38b509aedec21]

url:    https://github.com/intel-lab-lkp/linux/commits/ming-qian-oss-nxp-com/media-amphion-Add-H264-and-HEVC-profile-and-level-control/20250508-133520
base:   b64b134942c8cf4801ea288b3fd38b509aedec21
patch link:    https://lore.kernel.org/r/20250508053304.2057-1-ming.qian%40oss.nxp.com
patch subject: [PATCH v3] media: amphion: Add H264 and HEVC profile and level control
config: x86_64-buildonly-randconfig-001-20250509 (https://download.01.org/0day-ci/archive/20250509/202505091722.oiKjnVNJ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505091722.oiKjnVNJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505091722.oiKjnVNJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/amphion/vpu_color.c:17:
>> drivers/media/platform/amphion/vpu_helpers.h:74:38: warning: 'struct vpu_dec_codec_info' declared inside parameter list will not be visible outside of this definition or declaration
      74 | u32 vpu_get_h264_v4l2_profile(struct vpu_dec_codec_info *hdr);
         |                                      ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/amphion/vpu_helpers.h:75:36: warning: 'struct vpu_dec_codec_info' declared inside parameter list will not be visible outside of this definition or declaration
      75 | u32 vpu_get_h264_v4l2_level(struct vpu_dec_codec_info *hdr);
         |                                    ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/amphion/vpu_helpers.h:76:38: warning: 'struct vpu_dec_codec_info' declared inside parameter list will not be visible outside of this definition or declaration
      76 | u32 vpu_get_hevc_v4l2_profile(struct vpu_dec_codec_info *hdr);
         |                                      ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/amphion/vpu_helpers.h:77:36: warning: 'struct vpu_dec_codec_info' declared inside parameter list will not be visible outside of this definition or declaration
      77 | u32 vpu_get_hevc_v4l2_level(struct vpu_dec_codec_info *hdr);
         |                                    ^~~~~~~~~~~~~~~~~~


vim +74 drivers/media/platform/amphion/vpu_helpers.h

    73	
  > 74	u32 vpu_get_h264_v4l2_profile(struct vpu_dec_codec_info *hdr);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

