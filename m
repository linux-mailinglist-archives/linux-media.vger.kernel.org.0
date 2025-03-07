Return-Path: <linux-media+bounces-27786-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F608A55B73
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 01:08:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FFAD189A518
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 00:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D9E120E6;
	Fri,  7 Mar 2025 00:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ffPLjrVj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39E62745E
	for <linux-media@vger.kernel.org>; Fri,  7 Mar 2025 00:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741306076; cv=none; b=Ok38wUgRVIml6RyBIbrrHbhgnTCKuOwYDtJOZ0mDYfUV76+VKCinLiHhHfy4FGG5vR6BfFzrOPtEopaZLYHAk9yCQIJNMlPROL/Y01+9SuUItb9Lv0pvOKuo+CttZV/PmMYytTJur5BVY49EcY23KYRQbyb83y5rXPIZCFhWqeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741306076; c=relaxed/simple;
	bh=r6FX4VotY0SnTzUfOO3GNdlcFo/FkZMxY6v5dclCTYE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J1RhjAagRfeJz1J1lwGVfd9SWYdmr/C0AekotHcsprxXhO9BhXjZeui3Wrb4bkTBHojxQjcnkw+aZqP13E630ogz5+Ub2ZXCXXZrrfdWILel67CXOu+7lfCJL3zyR2SOP9NG+8uoAOXpE6EAAfPGDQF5jsTwPugEfDO5WVNa6JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ffPLjrVj; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741306075; x=1772842075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r6FX4VotY0SnTzUfOO3GNdlcFo/FkZMxY6v5dclCTYE=;
  b=ffPLjrVjKolkjQEsyKUXiajwGT4d5rv8R//H0HzVAi/kRDrfpIMp3Tdn
   FqsoE80hsrCNrGceFYSDGsqrwZgM5dllqwRx+AkIiWY67sh6zvx/e2Xtw
   LBV1pdVv+gWXlgRKnqF7xffEuNOAu3m4ZJKUkO1v0dIWLlr/+WXK0uYTf
   Xgdeug5Z8p5mlJp2DejljPAqMKdXbS1qG2BP5uvYotFDmzLuTNbIWAh64
   V+Y9/FPMl8MtlTq3PC+gppJtJXrOim+dZOf5l/LeQh9QhU2HSiDEL00Nd
   IVZna88OUNWAhjtjG7CU3VHMr9+iL6FlXg1oLLZ6IWdhyxLh0ySo7MROv
   w==;
X-CSE-ConnectionGUID: SCQpTU76RmiHROVwU0Oa9Q==
X-CSE-MsgGUID: A5HuxuYsQRmv6tOW8LgzVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="59901294"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; 
   d="scan'208";a="59901294"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 16:07:54 -0800
X-CSE-ConnectionGUID: FqDEO38XSIq74MH+W6rYwA==
X-CSE-MsgGUID: BK6pBIfoQAm03FfSz9PoKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; 
   d="scan'208";a="119005203"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 06 Mar 2025 16:07:52 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqLFj-000Nn7-0X;
	Fri, 07 Mar 2025 00:07:48 +0000
Date: Fri, 7 Mar 2025 08:07:12 +0800
From: kernel test robot <lkp@intel.com>
To: Shreeya Patel <shreeya.patel@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Dingxian Wen <shawn.wen@rock-chips.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: [linuxtv-media-pending:next 3/30]
 snps_hdmirx.c:(.text.hdmirx_get_timings+0x46c): undefined reference to
 `__aeabi_uldivmod'
Message-ID: <202503070743.WnRxStlk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.linuxtv.org/media-ci/media-pending.git next
head:   143d75583f2427f3a97dba62413c4f0604867ebf
commit: 7b59b132ad4398f9c13c3222e5126f5045aa5ead [3/30] media: platform: synopsys: Add support for HDMI input driver
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20250307/202503070743.WnRxStlk-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503070743.WnRxStlk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503070743.WnRxStlk-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/media/platform/synopsys/hdmirx/snps_hdmirx.o: in function `hdmirx_get_timings':
>> snps_hdmirx.c:(.text.hdmirx_get_timings+0x46c): undefined reference to `__aeabi_uldivmod'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

