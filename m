Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86C4C2E71C9
	for <lists+linux-media@lfdr.de>; Tue, 29 Dec 2020 16:27:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgL2PUf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Dec 2020 10:20:35 -0500
Received: from mga02.intel.com ([134.134.136.20]:30357 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726626AbgL2PUf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Dec 2020 10:20:35 -0500
IronPort-SDR: 1JikxN0GW0FfPYUlnrXlKUvpn623HZO5XjQAlar/araWchFfVtuzrVyOMROGf5jnwaJnsdtpjK
 3RTq4zXxOKgA==
X-IronPort-AV: E=McAfee;i="6000,8403,9849"; a="163565166"
X-IronPort-AV: E=Sophos;i="5.78,458,1599548400"; 
   d="scan'208";a="163565166"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2020 07:18:49 -0800
IronPort-SDR: LfQFh3FCSLCw7j9NXEv830+I72UGzbgVRdTuZvUJk0PyXWdjgJfGm6rz6ACXnCS2mTIBCMtwqV
 /crL6PO4dDaQ==
X-IronPort-AV: E=Sophos;i="5.78,458,1599548400"; 
   d="scan'208";a="460182920"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2020 07:18:47 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kuGmr-000RPF-JW; Tue, 29 Dec 2020 17:19:49 +0200
Date:   Tue, 29 Dec 2020 17:19:49 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     kernel test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: drivers/media/pci/intel/ipu3/ipu3-cio2.h:22:28: warning:
 conversion from 'long unsigned int' to 'u16' {aka 'short unsigned int'}
 changes value from '131072' to '0'
Message-ID: <20201229151949.GJ4077@smile.fi.intel.com>
References: <202012291200.Q8gXBY94-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202012291200.Q8gXBY94-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 29, 2020 at 12:42:08PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   dea8dcf2a9fa8cc540136a6cd885c3beece16ec3
> commit: 7b285f41f7376dc37e7fad1e803995fd39f42848 media: ipu3-cio2: Introduce CIO2_LOP_ENTRIES constant
> date:   4 months ago
> config: ia64-randconfig-r014-20201221 (attached as .config)
> compiler: ia64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7b285f41f7376dc37e7fad1e803995fd39f42848
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 7b285f41f7376dc37e7fad1e803995fd39f42848
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=ia64 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from drivers/media/pci/intel/ipu3/ipu3-cio2.c:29:
>    drivers/media/pci/intel/ipu3/ipu3-cio2.c: In function 'cio2_fbpt_entry_init_dummy':
> >> drivers/media/pci/intel/ipu3/ipu3-cio2.h:22:28: warning: conversion from 'long unsigned int' to 'u16' {aka 'short unsigned int'} changes value from '131072' to '0' [-Woverflow]
>       22 | #define CIO2_LOP_ENTRIES   (PAGE_SIZE / sizeof(u32))
>          |                            ^
>    drivers/media/pci/intel/ipu3/ipu3-cio2.c:163:39: note: in expansion of macro 'CIO2_LOP_ENTRIES'
>      163 |  entry[1].second_entry.num_of_pages = CIO2_LOP_ENTRIES * CIO2_MAX_LOPS;
>          |                                       ^~~~~~~~~~~~~~~~

Patch is available https://lore.kernel.org/linux-media/20201214152832.39463-1-andriy.shevchenko@linux.intel.com/

-- 
With Best Regards,
Andy Shevchenko


