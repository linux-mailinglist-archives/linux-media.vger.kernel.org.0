Return-Path: <linux-media+bounces-37581-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E89EB033FD
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 02:53:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B5F7E7AB419
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 00:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63B81C54AF;
	Mon, 14 Jul 2025 00:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FbwcSwyV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6111A15B971;
	Mon, 14 Jul 2025 00:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752454306; cv=none; b=FDFKYP3cXR7t7xq3IqrmT2YbKNLTueQmDiMAomE5uvJzbB8SfkyzRoSVlKAXX0Sm46uvXuGKjr4cPI9fC9xdaSjRxIa5Ow/3YXBUagBLPqppI/KhJnsWYequI++NQMzNNY38bG/4w5UdKQKDKgQK2Rflbm1I4HmTXltgQNCgHQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752454306; c=relaxed/simple;
	bh=1+sguk31ZPM7mDIsRtSsK9FeFCvoq25OnpwLLIVybKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T6pK7j+NFq2x/x2CK7iX+QHZo3X7RqyBF7ZHDJjIS/crxuM8N7LSeHf7xppXrkYFj82syLK+AhBs0rlzGrk0V+7PasYSeqBSP48i56xwAJXbQAVlb1/fcI8SVtW3JwBN4nMRvdLooKLoM8BRU9/NWDY/IAWjZiwtbh4R/rtRuFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FbwcSwyV; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752454304; x=1783990304;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1+sguk31ZPM7mDIsRtSsK9FeFCvoq25OnpwLLIVybKQ=;
  b=FbwcSwyVT1n8xUjSXiF2Q8Ylhug5aIPo+qVqwDcXk4ZsP/frjugQYSsW
   bjOvkEEIcasw6FAe0Ie09eU+GuzRtDtD/uPO8t1e9QLO3fXAniBdenULp
   LmpbJ8PAyJbIVC/7ht3SViRD5fVDza4+RGUIGSKqjzsFaSFXuMElE0cGx
   nMAOhqMvDykZ1VLP5bGK+/XoAc98hq7nQ/1I4pSr5EViXjv64jQ+aMIzA
   XXEIEhHtZjhwYzQbrRSS8ojcPYpYbdgbeJZm78UNLxLW4KCfVYXmcnjj0
   xd2i7AEkQ7AlGAWImJ/eXpRtMgJXMREOyZ8fU2h9OTI49b4k0jvM/WtYF
   Q==;
X-CSE-ConnectionGUID: KdRFj6oKQ3qqR3tdXXLjcQ==
X-CSE-MsgGUID: zYLvB1RXThS7E39IJL+llg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54613457"
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="54613457"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 17:51:43 -0700
X-CSE-ConnectionGUID: kHd5RuKCQqqr/yZIGSbVwQ==
X-CSE-MsgGUID: /QOqQbl1RUGtNzq4G0dlNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="187802370"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jul 2025 17:51:40 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ub7Pu-0008O7-0p;
	Mon, 14 Jul 2025 00:51:38 +0000
Date: Mon, 14 Jul 2025 08:51:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Keke Li <keke.li@amlogic.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v2 5/8] media: v4l2-common: Introduce v4l2-params.c
Message-ID: <202507140820.LDrwmHML-lkp@intel.com>
References: <20250710-extensible-parameters-validation-v2-5-7ec8918ec443@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-extensible-parameters-validation-v2-5-7ec8918ec443@ideasonboard.com>

Hi Jacopo,

kernel test robot noticed the following build errors:

[auto build test ERROR on a8598c7de1bcd94461ca54c972efa9b4ea501fb9]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacopo-Mondi/media-uapi-Introduce-V4L2-extensible-params/20250710-215847
base:   a8598c7de1bcd94461ca54c972efa9b4ea501fb9
patch link:    https://lore.kernel.org/r/20250710-extensible-parameters-validation-v2-5-7ec8918ec443%40ideasonboard.com
patch subject: [PATCH v2 5/8] media: v4l2-common: Introduce v4l2-params.c
config: x86_64-randconfig-008-20250713 (https://download.01.org/0day-ci/archive/20250714/202507140820.LDrwmHML-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250714/202507140820.LDrwmHML-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507140820.LDrwmHML-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/media/v4l2-core/v4l2-params.o: in function `v4l2_params_buffer_validate':
>> drivers/media/v4l2-core/v4l2-params.c:16: undefined reference to `vb2_plane_vaddr'


vim +16 drivers/media/v4l2-core/v4l2-params.c

    10	
    11	int v4l2_params_buffer_validate(struct device *dev, struct vb2_buffer *vb,
    12					size_t max_size,
    13					v4l2_params_validate_buffer buffer_validate)
    14	{
    15		size_t header_size = offsetof(struct v4l2_params_buffer, data);
  > 16		struct v4l2_params_buffer *buffer = vb2_plane_vaddr(vb, 0);
    17		size_t payload_size = vb2_get_plane_payload(vb, 0);
    18		size_t buffer_size;
    19		int ret;
    20	
    21		/* Payload size can't be greater than the destination buffer size */
    22		if (payload_size > max_size) {
    23			dev_dbg(dev, "Payload size is too large: %zu\n", payload_size);
    24			return -EINVAL;
    25		}
    26	
    27		/* Payload size can't be smaller than the header size */
    28		if (payload_size < header_size) {
    29			dev_dbg(dev, "Payload size is too small: %zu\n", payload_size);
    30			return -EINVAL;
    31		}
    32	
    33		/* Validate the size reported in the parameter buffer header */
    34		buffer_size = header_size + buffer->data_size;
    35		if (buffer_size != payload_size) {
    36			dev_dbg(dev, "Data size %zu and payload size %zu are different\n",
    37				buffer_size, payload_size);
    38			return -EINVAL;
    39		}
    40	
    41		/* Driver-specific buffer validation. */
    42		if (buffer_validate) {
    43			ret = buffer_validate(dev, buffer);
    44			if (ret)
    45				return ret;
    46		}
    47	
    48		return 0;
    49	}
    50	EXPORT_SYMBOL_GPL(v4l2_params_buffer_validate);
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

