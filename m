Return-Path: <linux-media+bounces-27788-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69345A55E02
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 04:07:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64C443ABA4A
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 03:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99D4D18C03A;
	Fri,  7 Mar 2025 03:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zpx2ilBE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911821624F7
	for <linux-media@vger.kernel.org>; Fri,  7 Mar 2025 03:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741316860; cv=none; b=TXpMaHoV6H3Irm9DZR8aucd0nAdKwQOozZW5l68PkqwpaHevk5fKzweq5UeKspxYW1uf4r+E8DuYzYytDHZZU3fFLvb4l0ZJp6+SB7wb5+S4rE5CNQGRz/R9J32asEVynSSgw5glhKwW3/ieQZwJDEgF+rGEQztv0pOfIek7j1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741316860; c=relaxed/simple;
	bh=jqXiDACI97GfDcK54v2uBOaQZbVY6w2uy8BfQ6PYqas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sJDSXMvmm1hXILsA/BZgtWUTUrxr6HY9beVuBppXrc6J6VDcGzi6zOJUuQ0pfsel/1ztBbD8JY9FP8aWWi4KH06aAF71mD1d0kwp2AV/Gjx7qfWrNeQnGs75VoCNsk2fgEB83Dsgn4DoFTH0dlhzAC/0W6rrMGLaqZhapnQNlyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zpx2ilBE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741316858; x=1772852858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jqXiDACI97GfDcK54v2uBOaQZbVY6w2uy8BfQ6PYqas=;
  b=Zpx2ilBEnzC1Im9f9Wh/7uJIfMUUMYohQXve39Z0PnkW0x5m9j4o+eai
   rOLSQy/MIckIigpvr0quCKPTlEB8En8m2bS9DYcCx2+TAwOkKpCBi3ZgS
   el9Uu+V/zi0DHpUfr5cj0k0+LpLTyqTa2hMCCUysKKOX/zd/z7Ni08whs
   Zn3YFmkhQmGx0iM246UGQRljLy2dOYbfGApqjMfxYDCVamEvY9IatS3wf
   77qy53qdgUcPQKAyRrigHOoNhhT1ZnztdpCYTpj95JAeWQ1efbndJbhhh
   utcvpFgIU4ul/GTyfLn60AH98U9hVvUwUuBUhh0cZylE7ZiPQg20NCHt6
   A==;
X-CSE-ConnectionGUID: /oJUjPXYThWmiWAdj9Rq5g==
X-CSE-MsgGUID: o9nA+SvOR16ec+ndi3EiVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53754594"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; 
   d="scan'208";a="53754594"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 19:07:35 -0800
X-CSE-ConnectionGUID: opmL1lExRT2KLMDc5MleNw==
X-CSE-MsgGUID: F4OW/fH2Q7SDJhn8MzERiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; 
   d="scan'208";a="119204896"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 06 Mar 2025 19:07:33 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqO3f-000O7Q-27;
	Fri, 07 Mar 2025 03:07:31 +0000
Date: Fri, 7 Mar 2025 11:07:28 +0800
From: kernel test robot <lkp@intel.com>
To: Shreeya Patel <shreeya.patel@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Dingxian Wen <shawn.wen@rock-chips.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: [linuxtv-media-pending:next 3/30] snps_hdmirx.c:undefined reference
 to `__udivdi3'
Message-ID: <202503071004.stlhNcQK-lkp@intel.com>
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
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20250307/202503071004.stlhNcQK-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503071004.stlhNcQK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503071004.stlhNcQK-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/media/platform/synopsys/hdmirx/snps_hdmirx.o: in function `hdmirx_get_timings':
>> snps_hdmirx.c:(.text+0x239e): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

