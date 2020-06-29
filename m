Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1848C20D746
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2020 22:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732356AbgF2T20 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jun 2020 15:28:26 -0400
Received: from mga14.intel.com ([192.55.52.115]:4746 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730546AbgF2T2Z (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jun 2020 15:28:25 -0400
IronPort-SDR: tNZFQ/Kw0Qk9MB/aPXFv90TbNOvfp3o6HYTLPron9/reT+NkQIeTDUoqjYipEC5Dt0qBcJorM4
 aoa66tq40T0w==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="145064142"
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; 
   d="scan'208";a="145064142"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2020 09:25:00 -0700
IronPort-SDR: i5zqokhpUgxuo+bUMZ96Gnbmc51BTC8pH+WCvzJ3tixSsqU7kvUaPWyn3xUiSDgXiKBpNgayFN
 XvGLYflgDO6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; 
   d="scan'208";a="266235448"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008.fm.intel.com with ESMTP; 29 Jun 2020 09:24:59 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jprPs-00Gdwm-DS; Mon, 29 Jun 2020 13:53:36 +0300
Date:   Mon, 29 Jun 2020 13:53:36 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v2 00/15] media: atomisp: Clean ups and fixes to make it
 load on Baytrail
Message-ID: <20200629105336.GG3703480@smile.fi.intel.com>
References: <20200626121925.14365-1-andriy.shevchenko@linux.intel.com>
 <20200626152953.261dd214@coco.lan>
 <20200626160141.03a8d4dd@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200626160141.03a8d4dd@coco.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 26, 2020 at 04:01:41PM +0200, Mauro Carvalho Chehab wrote:
> Em Fri, 26 Jun 2020 15:29:53 +0200
> Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
> > Em Fri, 26 Jun 2020 15:19:10 +0300
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> escreveu:

> > >   media: atomisp: Refactor PMIC detection to a separate function.
> > >   media: atomisp: Provide Gmin subdev as parameter to gmin_subdev_add()
> 
> Could you please rebase those on the top of my atomisp branch? 
> 
> > >   media: atomisp: Get rid of ugly and leaky ACPI handling in
> > >     gmin_subdev_add()
> 
> The part of the code that used to call acpi_bus_get_device() was
> already removed by a previous patch on my tree. So, I guess this one
> may not be needed anymore.

Mentioned above have been rebased and I'm about to send a v2.

-- 
With Best Regards,
Andy Shevchenko


