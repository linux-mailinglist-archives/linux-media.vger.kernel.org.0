Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDAB520DE9D
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2020 23:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388911AbgF2U1a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jun 2020 16:27:30 -0400
Received: from mga04.intel.com ([192.55.52.120]:36333 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732517AbgF2TZY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jun 2020 15:25:24 -0400
IronPort-SDR: GVMgacdmGUkbW+ffhO2gdvKlvkWPQ2O3fzLe5ZUGIVWDmmTXdMANqnNA13P2RYS23XFd8aCO4Z
 4GzpZCMrxMmA==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="143475983"
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; 
   d="scan'208";a="143475983"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2020 09:24:53 -0700
IronPort-SDR: 62afR1hi7+NIlYXmM50Jcl16b+Vm/woAty1FR5P9n+HqfEBNErhKyZ64sGMTbgA/bZkvchdUeW
 WVP1tG8ShNyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; 
   d="scan'208";a="264877717"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007.fm.intel.com with ESMTP; 29 Jun 2020 09:24:51 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jprOg-00Gdw6-TX; Mon, 29 Jun 2020 13:52:22 +0300
Date:   Mon, 29 Jun 2020 13:52:22 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 0/7] Some atomisp fixes and improvements
Message-ID: <20200629105222.GF3703480@smile.fi.intel.com>
References: <cover.1593180146.git.mchehab+huawei@kernel.org>
 <20200626150021.GY3703480@smile.fi.intel.com>
 <20200626175216.7955c374@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200626175216.7955c374@coco.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 26, 2020 at 05:52:16PM +0200, Mauro Carvalho Chehab wrote:
> Em Fri, 26 Jun 2020 18:00:21 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> escreveu:
> 
> > On Fri, Jun 26, 2020 at 04:04:52PM +0200, Mauro Carvalho Chehab wrote:
> > > Those patches are meant to improve device detection by the atomisp driver,
> > > relying on ACPI bios when possible.
> > > 
> > > It also adds a basis for using ACPI PM, but only if the DSDT tables have
> > > a description about how to turn on the resources needed by the cameras.
> > > 
> > > At least on the device I'm using for tests, this is not the case.  
> > 
> > Is this in your experimental tree? 
> 
> Yes. 
> 
> > I'll rebase mine on top and test.
> > After I will send the rest from my series and give a tag to this.
> 
> It would be helpful if you could test removing the DMI match table from
> your board. If your device has a DSDT table close to the one I have, the
> new code may be able to get everything from DSDT.

I have checked the atomisp_v5 branch and it doesn't bring any regression to my
case. So, feel free to add
Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I'll send rebased patches soon.

-- 
With Best Regards,
Andy Shevchenko


