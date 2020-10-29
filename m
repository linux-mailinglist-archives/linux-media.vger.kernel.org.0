Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2833E29F766
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 23:08:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725772AbgJ2WIp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 18:08:45 -0400
Received: from mga01.intel.com ([192.55.52.88]:54549 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725372AbgJ2WIp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 18:08:45 -0400
IronPort-SDR: 8aTsdNmEKg1XE87RIwV4w4U+NRDenm1XbuHj1cg7nuj5sI04X2NCq4JPd2GYRsGBuyZq9Tq/CM
 2nFAPFWEhfdQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="186318760"
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; 
   d="scan'208";a="186318760"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 15:08:31 -0700
IronPort-SDR: hyI/iO192fFdQX3QSDMNYRllPbq1xjbeW9BtSjN35huF3Pm5ysF01z21ElWLT53bMtrJZ5i6nb
 Wb88dSviyepw==
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; 
   d="scan'208";a="362248155"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 15:08:29 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 661FA206D0; Fri, 30 Oct 2020 00:08:27 +0200 (EET)
Date:   Fri, 30 Oct 2020 00:08:27 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bingbu Cao <bingbu.cao@linux.intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1] media: ipu3-cio2: Use macros from mm.h
Message-ID: <20201029220827.GN26150@paasikivi.fi.intel.com>
References: <20201029201657.GE4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201029201657.GE4077@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On Thu, Oct 29, 2020 at 10:16:57PM +0200, Andy Shevchenko wrote:
> On Wed, Oct 28, 2020 at 04:11:05PM +0800, Bingbu Cao wrote:
> > Andy, thanks for your patch.
> 
> > Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
> 
> Thanks!
> 
> > On 10/28/20 2:14 AM, Andy Shevchenko wrote:
> 
> > > -	entry[1].second_entry.last_page_available_bytes =
> > > -			(remaining & ~PAGE_MASK) ?
> > > -				(remaining & ~PAGE_MASK) - 1 : PAGE_SIZE - 1;
> > > +	remaining = offset_in_page(remaining);
> > > +	entry[1].second_entry.last_page_available_bytes = (remaining ?: PAGE_SIZE) - 1;
> > 
> > Not really about this change, is there some coding style update? This line obviously over 80
> > chars, but the latest script did not report warning.
> 
> There is a relaxation in the script, but now it's ambiguous with the documentation.

This line is over 80 characters. :-o

It's not ambibuous btw.; the documentation says:

	The preferred limit on the length of a single line is 80 columns.

I understand that as a preference to stay below that limit. It's not a
strict rule. Or... did you mean it didn't say whether this was upper or
lower limit? :-)

> I just realized I can rewrite this as:
> 
> 	remaining = offset_in_page(remaining) ?: PAGE_SIZE;
> 	entry[1].second_entry.last_page_available_bytes = remaining - 1;
> 
> Would it work for you?

Looks good to me.

-- 
Regards,

Sakari Ailus
