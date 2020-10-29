Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72B9029F5F2
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 21:15:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726431AbgJ2UP6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 16:15:58 -0400
Received: from mga05.intel.com ([192.55.52.43]:30164 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725764AbgJ2UP5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 16:15:57 -0400
IronPort-SDR: 7CzOlBksGdLgrkpY+p/IbsbL7JyV9GgkmMNq6vRTrBsees/oW2iVHaKFlGpKIxkfF0GVnuIYUM
 uGvLEmm+Pprw==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="253211674"
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; 
   d="scan'208";a="253211674"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 13:15:57 -0700
IronPort-SDR: 5rwPAQmFu/tcMt34v9+hKKc8LaC9nTkj9uTIQdHTdIIVH7inkJx7j5fDM1jWpntjlPWwULerth
 eNcQ7ox/TqvA==
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; 
   d="scan'208";a="319084089"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 13:15:55 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kYELx-001UeA-Cf; Thu, 29 Oct 2020 22:16:57 +0200
Date:   Thu, 29 Oct 2020 22:16:57 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1] media: ipu3-cio2: Use macros from mm.h
Message-ID: <20201029201657.GE4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 28, 2020 at 04:11:05PM +0800, Bingbu Cao wrote:
> Andy, thanks for your patch.

> Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

Thanks!

> On 10/28/20 2:14 AM, Andy Shevchenko wrote:

> > -	entry[1].second_entry.last_page_available_bytes =
> > -			(remaining & ~PAGE_MASK) ?
> > -				(remaining & ~PAGE_MASK) - 1 : PAGE_SIZE - 1;
> > +	remaining = offset_in_page(remaining);
> > +	entry[1].second_entry.last_page_available_bytes = (remaining ?: PAGE_SIZE) - 1;
> 
> Not really about this change, is there some coding style update? This line obviously over 80
> chars, but the latest script did not report warning.

There is a relaxation in the script, but now it's ambiguous with the documentation.
I just realized I can rewrite this as:

	remaining = offset_in_page(remaining) ?: PAGE_SIZE;
	entry[1].second_entry.last_page_available_bytes = remaining - 1;

Would it work for you?

> >  	/* Fill FBPT */
> >  	remaining = length;
> >  	i = 0;

-- 
With Best Regards,
Andy Shevchenko


