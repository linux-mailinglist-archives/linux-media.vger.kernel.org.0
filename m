Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46AE626FDD2
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 15:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgIRNH4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 09:07:56 -0400
Received: from mga02.intel.com ([134.134.136.20]:62167 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726121AbgIRNH4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 09:07:56 -0400
IronPort-SDR: C2OA7NpBCenW1y6FZBYMjH2X+jmISFQVgiJ35xfDXsbu1zyvuWBZWEqzHjdibfmwIpvfE6Ua1j
 6q4bDYwTtDQw==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="147609378"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="147609378"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2020 06:07:46 -0700
IronPort-SDR: TTP3YG+cKXV9ElsL7dzw2WsGVKrYrvWw02TGzy1AIner1bX77kh534VhNkH57FNcGHx5Fq0hsk
 Q/wM0fO89XGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="336797326"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 18 Sep 2020 06:07:42 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kJG71-00HaOc-8n; Fri, 18 Sep 2020 16:07:39 +0300
Date:   Fri, 18 Sep 2020 16:07:39 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Dan Scally <djrscally@gmail.com>, yong.zhi@intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, davem@davemloft.net, robh@kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, jorhand@linux.microsoft.com,
        kitakar@gmail.com, kieran.bingham@ideasonboard.com
Subject: Re: [RFC PATCH] Add bridge driver to connect sensors to CIO2 device
 via software nodes on ACPI platforms
Message-ID: <20200918130739.GA3956970@smile.fi.intel.com>
References: <20200916213618.8003-1-djrscally@gmail.com>
 <20200917103343.GW26842@paasikivi.fi.intel.com>
 <8133a57d-ab4c-dccd-4325-9b10e7805648@gmail.com>
 <20200917124514.GK3956970@smile.fi.intel.com>
 <20200918075157.GF26842@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200918075157.GF26842@paasikivi.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 18, 2020 at 10:51:57AM +0300, Sakari Ailus wrote:
> On Thu, Sep 17, 2020 at 03:45:14PM +0300, Andy Shevchenko wrote:
> > On Thu, Sep 17, 2020 at 11:52:28AM +0100, Dan Scally wrote:
> > > On 17/09/2020 11:33, Sakari Ailus wrote:
> > > > a module and not enlarge everyone's kernel, and the initialisation would at
> > > > the same time take place before the rest of what the CIO2 driver does in
> > > > probe.
> > > I thought of that as well, but wasn't sure which was preferable. I can
> > > compress it into the CIO2 driver though sure.
> > 
> > Sakari, I tend to agree with Dan and have the board file separated from the
> > driver and even framework.
> 
> And it'll be linked to the kernel binary then I suppose?

Solely depends to your Kconfig dependencies and declaration.

From code perspective you may do it before enumeration of the certain device or
after with reprobe.

> I don't have a strong opinion either way, just thought that this will
> affect anyone using x86 machines, whether or not they have IPU3. I guess it
> could be compiled in if the ipu3-cio2 driver is enabled?

Of course!

-- 
With Best Regards,
Andy Shevchenko


