Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B484C2D9B03
	for <lists+linux-media@lfdr.de>; Mon, 14 Dec 2020 16:33:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437287AbgLNPat (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Dec 2020 10:30:49 -0500
Received: from mga12.intel.com ([192.55.52.136]:59116 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726321AbgLNPak (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 10:30:40 -0500
IronPort-SDR: 78DfHj6F2AkDum15ulwjEvESvPK9IgExTqfE0KMsltc2bxCf8uAPzyJ46pQemAGaYXvKoz/+yT
 sZdmYuv8fsuw==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="153956437"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="153956437"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2020 07:28:55 -0800
IronPort-SDR: OPwsMQMavvnOkLnZ56LPyn7D6nn+yVWXLjMMuRKhic8gvmnwEXWCNPBGokfcYN/1iDaM2LVPLt
 9bOuV6UByL8g==
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="487149117"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2020 07:28:53 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kopnP-00EIcQ-3k; Mon, 14 Dec 2020 17:29:55 +0200
Date:   Mon, 14 Dec 2020 17:29:55 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: drivers/media/pci/intel/ipu3/ipu3-cio2.c:163:56: warning:
 implicit conversion from 'unsigned long' to 'u16' (aka 'unsigned short')
 changes value from 131072 to 0
Message-ID: <20201214152955.GH4077@smile.fi.intel.com>
References: <202011211600.bZyprrVg-lkp@intel.com>
 <20201123104018.GX4077@smile.fi.intel.com>
 <20201211165614.GC26370@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201211165614.GC26370@paasikivi.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 11, 2020 at 06:56:14PM +0200, Sakari Ailus wrote:
> On Mon, Nov 23, 2020 at 12:40:18PM +0200, Andy Shevchenko wrote:
> > On Sat, Nov 21, 2020 at 04:23:05PM +0800, kernel test robot wrote:

...

> > > All warnings (new ones prefixed by >>):
> > > 
> > > >> drivers/media/pci/intel/ipu3/ipu3-cio2.c:163:56: warning: implicit conversion from 'unsigned long' to 'u16' (aka 'unsigned short') changes value from 131072 to 0 [-Wconstant-conversion]
> > >            entry[1].second_entry.num_of_pages = CIO2_LOP_ENTRIES * CIO2_MAX_LOPS;
> > >                                               ~ ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
> > >    1 warning generated.
> > 
> > Okay, now we have an interesting case. The IP is quite unlikely be used on
> > ARM64, but my patches made the clear picture about use of PAGE_SIZE here.
> > 
> > So, I see at least the following options to mitigate the above, i.e.:
> >  1/ reduce driver scope to X86
> >  2/ fix the variables to be wider type to be able to hold PAGE_SIZE > 4k
> >  3/ switch to custom PAGE_SIZE / _SHIFT / _MASK and accompanying macros
> > 
> > And I still consider 3/ is silly move because as we see the driver was
> > never assumed to work with big page sizes (besides unsigned short type
> > here, PAGE_SHIFT and PAGE_MASK in the original code was as is and on ARM64
> > they compiled to 0 values w/o warnings, effectively make the driver
> > improperly functioning anyway).
> 
> Apologies for the late answer.
> 
> I think I'd favour the first option. It's not really useful to be able to
> compile this elsewhere; as such the driver doesn't do anything special that
> would make it prone to breakage through changes elsewhere.
> 
> Would you like to send a patch? :-)

Done.

-- 
With Best Regards,
Andy Shevchenko


