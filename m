Return-Path: <linux-media+bounces-49606-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D32B3CE49F5
	for <lists+linux-media@lfdr.de>; Sun, 28 Dec 2025 08:53:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A350A300206B
	for <lists+linux-media@lfdr.de>; Sun, 28 Dec 2025 07:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60B8E28AAEE;
	Sun, 28 Dec 2025 07:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vxz3ayRP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD56289824;
	Sun, 28 Dec 2025 07:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766908404; cv=none; b=BgpLaV4Ub2s7wIuvsO+sXyj91LNwIXHb0flXehjwRuRqfdzOE8Fkr8cR28muQk1KUemsFRaVA17fiB6RxgEmdhHjjGCEToEOFj2KNBUxOZGD3xz9S5EgpHBAsiheC0IPPI9Fyiol70m6ZkXj7vEC0U4jENy2UyCh6cKr9+OC2Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766908404; c=relaxed/simple;
	bh=/NwBfCj//7UaV/4OmePD5UbzYZj1ijABh9/72JuycQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PuQoVVjGA+EzM1rKQWMMXUxblbBVHYcMH1R8R4noJjXkOLS4EJ973Nr3C3+oTYI1exMs3+gLFSm4LmiWN1j/Gf/4fimqq85Cn8oja2J45r1Ts8AuKAfXQ0ZbM9n4oAXBmu84VD4ZSfPGED2/wZxIr1+FlpTgzBcMSH9V3nUx3N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vxz3ayRP; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766908403; x=1798444403;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/NwBfCj//7UaV/4OmePD5UbzYZj1ijABh9/72JuycQ0=;
  b=Vxz3ayRPUOT8OiqUtcrQI5FFMR8MZWbpudlIsOKPycyd0ddy+n/H+gWH
   TPq6Mf/0BxZZx8dpIGGSzISO2VzteVGFYZlvU5m31gzbk9Y3r3xYi7C6l
   hiDJsbrNcGvJuLPHg6k103E0h9tJmIMpv42S6tFxF0rmqeM7aAayP4nUx
   nTy25TM6NZ6HbJvl7GumHfb3C/eoPnMPPj7o9JEdyhtPpS4YeM0innU7H
   bF3OvKGe5dw9m7387uKbxdiSe8P+gCGmsegwK+rwL4vkxhQnc7idKP9HL
   HcgwCdndKyp9VY8OCDY0fOPRBeZUB4KMDPwhzzR+DIZJ14GUMX0uR00nS
   g==;
X-CSE-ConnectionGUID: jKkvc3MISSGunNlKQNw/dQ==
X-CSE-MsgGUID: 6RQwh02VTNGsqt5OFLtrow==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="67766513"
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="67766513"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 23:53:22 -0800
X-CSE-ConnectionGUID: UEa8u94KT2q2ofB0p56tVw==
X-CSE-MsgGUID: kE97tfBeR5Knrr2ku/cjWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="205715352"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 27 Dec 2025 23:53:16 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZlaT-000000006Kr-3CZq;
	Sun, 28 Dec 2025 07:53:13 +0000
Date: Sun, 28 Dec 2025 15:52:27 +0800
From: kernel test robot <lkp@intel.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, Yunke Cao <yunkec@google.com>,
	Hans de Goede <hansg@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Pavan Bobba <opensource206@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	Jonas Karlman <jonas@kwiboo.se>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: Re: [PATCH v7 14/17] media: rkvdec: Add H264 support for the VDPU381
 variant
Message-ID: <202512281536.56iWFq03-lkp@intel.com>
References: <20251218232829.337811-15-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218232829.337811-15-detlev.casanova@collabora.com>

Hi Detlev,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linus/master v6.19-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Detlev-Casanova/media-uapi-HEVC-Add-v4l2_ctrl_hevc_ext_sps_-ls-t_rps-controls/20251219-074342
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20251218232829.337811-15-detlev.casanova%40collabora.com
patch subject: [PATCH v7 14/17] media: rkvdec: Add H264 support for the VDPU381 variant
config: arm-randconfig-r071-20251224 (https://download.01.org/0day-ci/archive/20251228/202512281536.56iWFq03-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251228/202512281536.56iWFq03-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512281536.56iWFq03-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__aeabi_uldivmod" [drivers/media/platform/rockchip/rkvdec/rockchip-vdec.ko] undefined!
>> ERROR: modpost: "__aeabi_ldivmod" [drivers/media/platform/rockchip/rkvdec/rockchip-vdec.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

