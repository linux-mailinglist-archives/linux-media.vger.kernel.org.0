Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 373BC26DBAF
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 14:37:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbgIQMgu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 08:36:50 -0400
Received: from mga12.intel.com ([192.55.52.136]:17406 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726589AbgIQMgH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 08:36:07 -0400
X-Greylist: delayed 501 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 08:35:56 EDT
IronPort-SDR: fd79BEHzpQKWVRy46I/7xhpDdyTgT5OGwJGtXBSiHszomggQzvHZLQybBGDqZKdWAOpB8zwKzw
 w8dTuZWx4O4A==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="139188102"
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; 
   d="scan'208";a="139188102"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2020 05:25:37 -0700
IronPort-SDR: jMwGTc1ljHPuFBxuAjHrcoVSsWcREA7H6qljjXAyITclEhlpWZmxmCgo2Qt68QLHzh5nWtxjLw
 hwXWkcDrbg+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; 
   d="scan'208";a="336395898"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 17 Sep 2020 05:25:33 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kIsyf-00HK03-ST; Thu, 17 Sep 2020 15:25:29 +0300
Date:   Thu, 17 Sep 2020 15:25:29 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        devel@driverdev.osuosl.org, robh@kernel.org,
        jorhand@linux.microsoft.com, linux-media@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        kieran.bingham@ideasonboard.com, kitakar@gmail.com,
        bingbu.cao@intel.com, mchehab@kernel.org, davem@davemloft.net,
        tian.shu.qiu@intel.com, yong.zhi@intel.com
Subject: Re: [RFC PATCH] Add bridge driver to connect sensors to CIO2 device
 via software nodes on ACPI platforms
Message-ID: <20200917122529.GJ3956970@smile.fi.intel.com>
References: <20200916213618.8003-1-djrscally@gmail.com>
 <20200917103343.GW26842@paasikivi.fi.intel.com>
 <20200917104941.GP4282@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917104941.GP4282@kadam>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 17, 2020 at 01:49:41PM +0300, Dan Carpenter wrote:
> On Thu, Sep 17, 2020 at 01:33:43PM +0300, Sakari Ailus wrote:

> > > +	int i, ret;
> > 
> > unsigned int i
> > 
> 
> Why?
> 
> For list iterators then "int i;" is best...  For sizes then unsigned is
> sometimes best.  Or if it's part of the hardware spec or network spec
> unsigned is best.  Otherwise unsigned variables cause a ton of bugs.
> They're not as intuitive as signed variables.  Imagine if there is an
> error in this loop and you want to unwind.  With a signed variable you
> can do:
> 
> 	while (--i >= 0)
> 		cleanup(&bridge.sensors[i]);

Ha-ha. It's actually a counter argument to your stuff because above is the same as

	while (i--)
		cleanup(&bridge.sensors[i]);

with pretty much unsigned int i.

> There are very few times where raising the type maximum from 2 billion
> to 4 billion fixes anything.

-- 
With Best Regards,
Andy Shevchenko


