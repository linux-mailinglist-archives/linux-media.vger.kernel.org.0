Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA4E126E5CE
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 21:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgIQT4c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 15:56:32 -0400
Received: from mga01.intel.com ([192.55.52.88]:33915 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727608AbgIQOpi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 10:45:38 -0400
X-Greylist: delayed 8278 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 10:45:38 EDT
IronPort-SDR: Ce5CTOz0wjN8Z78iVc7HkP0BLzzbxDcuTMJ05NWKsg6IspgyxBqLXjtYbPvUtVjJ/COP2UU1QS
 3QUxacFGU4Ig==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="177804239"
X-IronPort-AV: E=Sophos;i="5.77,437,1596524400"; 
   d="scan'208";a="177804239"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2020 07:44:21 -0700
IronPort-SDR: 2PjTpGPUJrmk/qAGxhB331O0Aj/pPwhH4tXe00zQmSC7rMAaOijzfKiwbCewdba0OWZ8HRpvcR
 00Ep3pHxDpBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,437,1596524400"; 
   d="scan'208";a="336439709"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 17 Sep 2020 07:44:17 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kIv8v-00HLiv-II; Thu, 17 Sep 2020 17:44:13 +0300
Date:   Thu, 17 Sep 2020 17:44:13 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dan Scally <djrscally@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>, yong.zhi@intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, davem@davemloft.net, robh@kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, jorhand@linux.microsoft.com,
        kitakar@gmail.com, kieran.bingham@ideasonboard.com
Subject: Re: [RFC PATCH] Add bridge driver to connect sensors to CIO2 device
 via software nodes on ACPI platforms
Message-ID: <20200917144413.GN3956970@smile.fi.intel.com>
References: <20200916213618.8003-1-djrscally@gmail.com>
 <20200917103343.GW26842@paasikivi.fi.intel.com>
 <8133a57d-ab4c-dccd-4325-9b10e7805648@gmail.com>
 <20200917124514.GK3956970@smile.fi.intel.com>
 <fea9d85a-7be9-0270-bd59-8e479a836ae6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fea9d85a-7be9-0270-bd59-8e479a836ae6@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 17, 2020 at 02:36:22PM +0100, Dan Scally wrote:
> On 17/09/2020 13:45, Andy Shevchenko wrote:
> > On Thu, Sep 17, 2020 at 11:52:28AM +0100, Dan Scally wrote:
> >> On 17/09/2020 11:33, Sakari Ailus wrote:
> > I will do better review for next version, assuming you will Cc reviewers and
> > TWIMC people. Below is like small part of comments I may give to the code.
> TWIMC?

Missed this. To Whom It May Concern.

-- 
With Best Regards,
Andy Shevchenko


