Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BCCB35E3A1
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 18:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231379AbhDMQRO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 12:17:14 -0400
Received: from mga17.intel.com ([192.55.52.151]:50326 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229776AbhDMQRN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 12:17:13 -0400
IronPort-SDR: r8m9em0NkVXxo5RcGBdGd0vmeSau9gh7sEjDnI38b383ogy3m6imq0MsExrACLyuRMvhNWi2fm
 AE9IsXnJAM/A==
X-IronPort-AV: E=McAfee;i="6200,9189,9953"; a="174547165"
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="174547165"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 09:10:33 -0700
IronPort-SDR: ru4crNMreHoXQpsxGuzZMkdEosvf9+r3cFUPGuvreADT9tP6nftbq1raPDbxxsb2etlBCuEIfz
 E+6gqYoUayfg==
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="452019778"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 09:10:25 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1lWLcM-003nnM-Az; Tue, 13 Apr 2021 19:10:22 +0300
Date:   Tue, 13 Apr 2021 19:10:22 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 1/1] media: ipu3-cio2: Fix referece counting when
 looping over ACPI devices
Message-ID: <YHXCboJUF1VuZiKz@smile.fi.intel.com>
References: <20210404181409.1451026-1-andy.shevchenko@gmail.com>
 <1ab48622-be85-f1d7-caa4-8b04a4727d5d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ab48622-be85-f1d7-caa4-8b04a4727d5d@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 05, 2021 at 09:37:28PM +0100, Daniel Scally wrote:
> On 04/04/2021 19:14, Andy Shevchenko wrote:
> > When we continue, due to device is disabled, loop we have to drop reference count.
> > When we have an array full of devices we have to also drop the reference count.
> > Note, in this case the cio2_bridge_unregister_sensors() is called by the caller.
> >
> > Fixes: 803abec64ef9 ("media: ipu3-cio2: Add cio2-bridge to ipu3-cio2 driver")
> > Cc: Daniel Scally <djrscally@gmail.com>
> > Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
> Ah; thanks for catching those, I'm annoyed to have missed the
> acpi_dev_put() calls in particular
> 
> Reviewed-by: Daniel Scally <djrscally@gmail.com>

Sakari, Mauro, can this be applied as v5.12 material, please?

-- 
With Best Regards,
Andy Shevchenko


