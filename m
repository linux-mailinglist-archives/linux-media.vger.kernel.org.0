Return-Path: <linux-media+bounces-38106-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B71B0AD00
	for <lists+linux-media@lfdr.de>; Sat, 19 Jul 2025 02:46:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C041B1C43AAE
	for <lists+linux-media@lfdr.de>; Sat, 19 Jul 2025 00:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E86BE49641;
	Sat, 19 Jul 2025 00:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MXTwJQ7s"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10AC125B2;
	Sat, 19 Jul 2025 00:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752885980; cv=none; b=LcXfAe553jkeEFx0YCcfksyHjvBaaCOjEWRCqEF6BwDqSVgRZKPa2qYklwScgUKSYpUhMuFruUG+vpUATpqx8UKctIB7xSt6qcM/HjrW122cFmW4+hoX+8q+zT+AnvWKnjDhwrX2J8b3MpsdyphzrjS5p286tpTlIt8I0HKpbCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752885980; c=relaxed/simple;
	bh=sHVK+o/maKVsX9aoh7fRAQ2DWovhgiCMkKfZ91jvNd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=apEX6v2booMfnLDNiMUf17frKsjw/pQ9fkBFmgW8plpFcOm1r4b3PnwwQNNv0qMZ/RmnJ0ey6QtdjoQ6e36Y4IBic0u2Z3bEo28Vb0iDSdIIksv3xGMwOIexPlV6HSRK8nu6Q+x2W+79QjsyHIEnEnkGCzN9zNMZfCxkJRCefN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MXTwJQ7s; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752885979; x=1784421979;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sHVK+o/maKVsX9aoh7fRAQ2DWovhgiCMkKfZ91jvNd4=;
  b=MXTwJQ7ssScYkbChXdxRjomLrdYqnUtz20COB5qxQXZd5lwMpobQo/LH
   bzh8/xh6MuUJIIyhpOXsFXTPtt3ckLnTUa6fowXwjIb6t8RI3NJVitFVY
   xjRTQfbr+kuosCV5qivX66haRasunCNET5SsAo0VtblOLGU3hzLsZmsol
   evPf6dFy6I7W5HaVHING7K19VLRDHQQz9j9B1qQZ02OPSnC7Sb2Nhn9Xd
   n5xaGyecchXjpxD9aZZD8RhmY0KJnK2vdbfnPMWbIntz6YwVXGEq+2vRS
   //vHNxkSDipC9INQqo7ROcqDA9AV3Jgln29YV0syi04BNGnFR2DFDe1rc
   w==;
X-CSE-ConnectionGUID: UIqpGcbsSkiblJfE27dpwg==
X-CSE-MsgGUID: 0LKEjKiiSSG3Hr7EYETHcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="54397050"
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="54397050"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 17:46:17 -0700
X-CSE-ConnectionGUID: B27O95sKTymoZbvkf+PSoA==
X-CSE-MsgGUID: syfJzeuMSfWXk5Ofi1cw+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="189346245"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Jul 2025 17:46:15 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucviP-000FAV-02;
	Sat, 19 Jul 2025 00:46:13 +0000
Date: Sat, 19 Jul 2025 08:45:17 +0800
From: kernel test robot <lkp@intel.com>
To: Darshan Rathod <darshanrathod475@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: b2c2: flexcop-eeprom: Fix assignment in if
 condition
Message-ID: <202507190855.RA0Awmj9-lkp@intel.com>
References: <20250718125245.82910-1-darshanrathod475@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718125245.82910-1-darshanrathod475@gmail.com>

Hi Darshan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linuxtv-media-pending/master]
[also build test WARNING on sailus-media-tree/master linus/master media-tree/master sailus-media-tree/streams v6.16-rc6 next-20250718]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Darshan-Rathod/media-b2c2-flexcop-eeprom-Fix-assignment-in-if-condition/20250718-205456
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250718125245.82910-1-darshanrathod475%40gmail.com
patch subject: [PATCH] media: b2c2: flexcop-eeprom: Fix assignment in if condition
config: i386-randconfig-002-20250719 (https://download.01.org/0day-ci/archive/20250719/202507190855.RA0Awmj9-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507190855.RA0Awmj9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507190855.RA0Awmj9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/common/b2c2/flexcop-eeprom.c: In function 'flexcop_eeprom_check_mac_addr':
>> drivers/media/common/b2c2/flexcop-eeprom.c:143:29: warning: operation on 'ret' may be undefined [-Wsequence-point]
     143 |                         ret = ret = -EINVAL;
   drivers/media/common/b2c2/flexcop-eeprom.c:149:1: error: expected declaration or statement at end of input
     149 | EXPORT_SYMBOL(flexcop_eeprom_check_mac_addr);
         | ^~~~~~~~~~~~~
>> drivers/media/common/b2c2/flexcop-eeprom.c:150: warning: control reaches end of non-void function [-Wreturn-type]


vim +/ret +143 drivers/media/common/b2c2/flexcop-eeprom.c

   130	
   131	/* JJ's comment about extended == 1: it is not presently used anywhere but was
   132	 * added to the low-level functions for possible support of EUI64 */
   133	int flexcop_eeprom_check_mac_addr(struct flexcop_device *fc, int extended)
   134	{
   135		u8 buf[8];
   136		int ret = 0;
   137	
   138		ret = flexcop_eeprom_lrc_read(fc, 0x3f8, buf, 8, 4);
   139	
   140		if (ret == 0) {
   141			if (extended != 0) {
   142				err("TODO: extended (EUI64) MAC addresses aren't completely supported yet");
 > 143				ret = ret = -EINVAL;
   144			} else {
   145				memcpy(fc->dvb_adapter.proposed_mac, buf, 6);
   146			}
   147			return ret;
   148	}
   149	EXPORT_SYMBOL(flexcop_eeprom_check_mac_addr);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

