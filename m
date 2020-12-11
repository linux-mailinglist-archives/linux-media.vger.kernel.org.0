Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4242D7BC8
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 18:00:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732166AbgLKQ6y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 11:58:54 -0500
Received: from mga04.intel.com ([192.55.52.120]:12577 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731237AbgLKQ6I (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 11:58:08 -0500
IronPort-SDR: yojei51635MzC4VMpnzNoI0WjjU8wHhJOC97cOLLq3NlSa3G9aTkUrC31DhCq/O+/2dTX0l52Z
 kCpI2WDK6uAg==
X-IronPort-AV: E=McAfee;i="6000,8403,9832"; a="171896334"
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; 
   d="scan'208";a="171896334"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2020 08:56:18 -0800
IronPort-SDR: jhUNGyw/A2QaJXoGHWr2U10B/0JdxbtNLtfRq9Pvnc+Zzfir4kYk8ksp+y3ps8vLwhuF0Beuic
 xz9YRDaFYYiA==
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; 
   d="scan'208";a="334177371"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2020 08:56:16 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 3818420473; Fri, 11 Dec 2020 18:56:14 +0200 (EET)
Date:   Fri, 11 Dec 2020 18:56:14 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: drivers/media/pci/intel/ipu3/ipu3-cio2.c:163:56: warning:
 implicit conversion from 'unsigned long' to 'u16' (aka 'unsigned short')
 changes value from 131072 to 0
Message-ID: <20201211165614.GC26370@paasikivi.fi.intel.com>
References: <202011211600.bZyprrVg-lkp@intel.com>
 <20201123104018.GX4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201123104018.GX4077@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On Mon, Nov 23, 2020 at 12:40:18PM +0200, Andy Shevchenko wrote:
> On Sat, Nov 21, 2020 at 04:23:05PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   27bba9c532a8d21050b94224ffd310ad0058c353
> > commit: 7b285f41f7376dc37e7fad1e803995fd39f42848 media: ipu3-cio2: Introduce CIO2_LOP_ENTRIES constant
> > date:   2 months ago
> > config: arm64-randconfig-r031-20201121 (attached as .config)
> > compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project bec968cbb367dd03439c89c1d4ef968ef662d7c0)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install arm64 cross compiling tool for clang build
> >         # apt-get install binutils-aarch64-linux-gnu
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7b285f41f7376dc37e7fad1e803995fd39f42848
> >         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> >         git fetch --no-tags linus master
> >         git checkout 7b285f41f7376dc37e7fad1e803995fd39f42848
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm64 
> > 
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> drivers/media/pci/intel/ipu3/ipu3-cio2.c:163:56: warning: implicit conversion from 'unsigned long' to 'u16' (aka 'unsigned short') changes value from 131072 to 0 [-Wconstant-conversion]
> >            entry[1].second_entry.num_of_pages = CIO2_LOP_ENTRIES * CIO2_MAX_LOPS;
> >                                               ~ ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
> >    1 warning generated.
> 
> Okay, now we have an interesting case. The IP is quite unlikely be used on
> ARM64, but my patches made the clear picture about use of PAGE_SIZE here.
> 
> So, I see at least the following options to mitigate the above, i.e.:
>  1/ reduce driver scope to X86
>  2/ fix the variables to be wider type to be able to hold PAGE_SIZE > 4k
>  3/ switch to custom PAGE_SIZE / _SHIFT / _MASK and accompanying macros
> 
> And I still consider 3/ is silly move because as we see the driver was
> never assumed to work with big page sizes (besides unsigned short type
> here, PAGE_SHIFT and PAGE_MASK in the original code was as is and on ARM64
> they compiled to 0 values w/o warnings, effectively make the driver
> improperly functioning anyway).

Apologies for the late answer.

I think I'd favour the first option. It's not really useful to be able to
compile this elsewhere; as such the driver doesn't do anything special that
would make it prone to breakage through changes elsewhere.

Would you like to send a patch? :-)

-- 
Kind regards,

Sakari Ailus
