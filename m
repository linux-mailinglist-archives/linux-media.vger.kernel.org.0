Return-Path: <linux-media+bounces-42057-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 869BCB4A1AB
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 07:57:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DBD61BC1D45
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 05:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8AB92FE075;
	Tue,  9 Sep 2025 05:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cwt05hmq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFCB2FCBFC;
	Tue,  9 Sep 2025 05:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757397450; cv=none; b=Bur3gSoTSZ/K1VZNd88I6qt6byX5m82c+7X8vS77tO4/AguPdW4wZr2z5bms/L8uykT78UmaEFTri0CxBinEbrl/0Jlv/+QeXL04pCaXkEReXyhlS46lugE3gvpPbe3dIDTzr/OOG6/qjN5//pLtZN/jd9sshMZqXOnYeNrVkjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757397450; c=relaxed/simple;
	bh=wRIGqgU+LHDAj9RxqxY+/AD/mGH+3WQP2O8WuVivEqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lNgdp9Lc+BA3vkuQibLOxrbyny99OzqREOBisLjEtDdFfIZ0KMSamyrMvF+2GBvvfdCoCvSoJPMNKd148ljonnvXIQ2neYjnjvBIysrVB5d3okIqubEiN3ZcLYYRo+Ki8autRYJ0pnhw4LFSQTz6eyQ52SkuR0Xp5Stdq/iEnjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cwt05hmq; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757397449; x=1788933449;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wRIGqgU+LHDAj9RxqxY+/AD/mGH+3WQP2O8WuVivEqA=;
  b=cwt05hmq00myWs5F+aU4mfJ9uXWuV8e7b8jsU+ak4MclminFx0iGqKve
   /nydvvmqzmhWmQwf4KZWcrlbXNNCftNMTIpAXKvvvBgnQxz8us2Lv4ZP5
   4AREymRVGxb2n1ABimzgaq66gUI6gtmEGmV7JwhiVxET9cN+fTpTtoEiM
   Hp8rS+N24vf5kL0uQxr2Um+GLMAqVZeczrKwBG4MMa45ReOxs10Yb9CVe
   F8PmyZrsNDZyOCiT0oqBwhoFWmZmSKORkF4v5XnNink6BkvZGGFhqxWeT
   70RLiKo1tUT/gGzT6KtV0MITdb026WGsfkKeCRjiCarqufVJGGbTq7taX
   g==;
X-CSE-ConnectionGUID: EiEZCZjYQYKMSoEwjXQAmQ==
X-CSE-MsgGUID: +bYc7mf+RFayrkbghWtuSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59777554"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="59777554"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 22:55:32 -0700
X-CSE-ConnectionGUID: OdGhGBqZTaujHPmSZAcvDA==
X-CSE-MsgGUID: uK2ngv5BT5KhhrS2vkPPxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="196643725"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Sep 2025 22:55:28 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvrK9-0004UV-2w;
	Tue, 09 Sep 2025 05:55:25 +0000
Date: Tue, 9 Sep 2025 13:55:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jeongjun Park <aha310510@gmail.com>, mchehab@kernel.org,
	hverkuil@xs4all.nl, hverkuil+cisco@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, aha310510@gmail.com,
	syzbot+0192952caa411a3be209@syzkaller.appspotmail.com
Subject: Re: [PATCH v2 1/2] media: az6007: fix out-of-bounds in
 az6007_i2c_xfer()
Message-ID: <202509091306.eGl2abHr-lkp@intel.com>
References: <20250908150730.24560-2-aha310510@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908150730.24560-2-aha310510@gmail.com>

Hi Jeongjun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linuxtv-media-pending/master]
[also build test WARNING on linus/master v6.17-rc5 next-20250908]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeongjun-Park/media-az6007-fix-out-of-bounds-in-az6007_i2c_xfer/20250908-231026
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250908150730.24560-2-aha310510%40gmail.com
patch subject: [PATCH v2 1/2] media: az6007: fix out-of-bounds in az6007_i2c_xfer()
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250909/202509091306.eGl2abHr-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7fb1dc08d2f025aad5777bb779dfac1197e9ef87)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509091306.eGl2abHr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509091306.eGl2abHr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/usb/dvb-usb-v2/az6007.c:107:16: warning: format specifies type 'unsigned long' but the argument has type '__size_t' (aka 'unsigned int') [-Wformat]
     106 |                 pr_err("az6007: tried to read %d bytes, but I2C max size is %lu bytes\n",
         |                                                                             ~~~
         |                                                                             %zu
     107 |                        blen, sizeof(st->data));
         |                              ^~~~~~~~~~~~~~~~
   include/linux/printk.h:557:33: note: expanded from macro 'pr_err'
     557 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:514:60: note: expanded from macro 'printk'
     514 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:486:19: note: expanded from macro 'printk_index_wrap'
     486 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   drivers/media/usb/dvb-usb-v2/az6007.c:154:16: warning: format specifies type 'unsigned long' but the argument has type '__size_t' (aka 'unsigned int') [-Wformat]
     153 |                 pr_err("az6007: tried to write %d bytes, but I2C max size is %lu bytes\n",
         |                                                                              ~~~
         |                                                                              %zu
     154 |                        blen, sizeof(st->data));
         |                              ^~~~~~~~~~~~~~~~
   include/linux/printk.h:557:33: note: expanded from macro 'pr_err'
     557 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:514:60: note: expanded from macro 'printk'
     514 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:486:19: note: expanded from macro 'printk_index_wrap'
     486 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   2 warnings generated.


vim +107 drivers/media/usb/dvb-usb-v2/az6007.c

    99	
   100	static int __az6007_read(struct usb_device *udev, struct az6007_device_state *st,
   101				    u8 req, u16 value, u16 index, u8 *b, int blen)
   102	{
   103		int ret;
   104	
   105		if (blen > sizeof(st->data)) {
   106			pr_err("az6007: tried to read %d bytes, but I2C max size is %lu bytes\n",
 > 107			       blen, sizeof(st->data));
   108			return -EOPNOTSUPP;
   109		}
   110	
   111		ret = usb_control_msg(udev,
   112				      usb_rcvctrlpipe(udev, 0),
   113				      req,
   114				      USB_TYPE_VENDOR | USB_DIR_IN,
   115				      value, index, b, blen, 5000);
   116		if (ret < 0) {
   117			pr_warn("usb read operation failed. (%d)\n", ret);
   118			return -EIO;
   119		}
   120	
   121		if (az6007_xfer_debug) {
   122			printk(KERN_DEBUG "az6007: IN  req: %02x, value: %04x, index: %04x\n",
   123			       req, value, index);
   124			print_hex_dump_bytes("az6007: payload: ",
   125					     DUMP_PREFIX_NONE, b, blen);
   126		}
   127	
   128		return ret;
   129	}
   130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

