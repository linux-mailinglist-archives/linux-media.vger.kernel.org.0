Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DAB5318BDE
	for <lists+linux-media@lfdr.de>; Thu, 11 Feb 2021 14:22:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230328AbhBKNUM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Feb 2021 08:20:12 -0500
Received: from mga06.intel.com ([134.134.136.31]:30925 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231913AbhBKNRu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Feb 2021 08:17:50 -0500
IronPort-SDR: SsRoQ2Zoa/M5sy9JD2VW1BPZ24FMRDVc22HvjsV5iy6SaSfcSSRP6Bs4KD6kr5EJedZzp509pa
 ifc19tHj7nvA==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="243728679"
X-IronPort-AV: E=Sophos;i="5.81,170,1610438400"; 
   d="scan'208";a="243728679"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2021 05:15:57 -0800
IronPort-SDR: fxOnjGsAeXH81hSNzfUjkZtQPfE9I7edbbjhaYEp0d4dKvqoPlRT+146QKX5tcwFSlQxYb63Ff
 WTWD/G9Gxu3w==
X-IronPort-AV: E=Sophos;i="5.81,170,1610438400"; 
   d="scan'208";a="359993931"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2021 05:15:55 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lABp2-004EDh-Mf; Thu, 11 Feb 2021 15:15:52 +0200
Date:   Thu, 11 Feb 2021 15:15:52 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] media: atomisp: Remove unused header
Message-ID: <YCUuCFPuQbCAdOc7@smile.fi.intel.com>
References: <20210122123303.41190-1-andriy.shevchenko@linux.intel.com>
 <YCFIbwXv8+SDnZwO@smile.fi.intel.com>
 <20210208144659.GW32460@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210208144659.GW32460@paasikivi.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 08, 2021 at 04:46:59PM +0200, Sakari Ailus wrote:
> Hi Andy,
> 
> On Mon, Feb 08, 2021 at 04:19:27PM +0200, Andy Shevchenko wrote:
> > On Fri, Jan 22, 2021 at 02:33:03PM +0200, Andy Shevchenko wrote:
> > > sfi.h is not anyhow used by the driver. Remove it.
> > 
> > Mario, Sakari, any comments on this?
> > Can you give your Ack to get this thru another tree?
> 
> Feel free to go ahead on my behalf; I see no issue with that.
> 
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Thank you, Sakari!

-- 
With Best Regards,
Andy Shevchenko


