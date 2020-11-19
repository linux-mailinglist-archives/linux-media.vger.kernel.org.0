Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E607A2B93F4
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 14:58:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbgKSN4D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 08:56:03 -0500
Received: from mga01.intel.com ([192.55.52.88]:42781 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726860AbgKSN4D (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 08:56:03 -0500
IronPort-SDR: w3lggLjSb7C3mKdLL91O31/PFpzwuHZT6ffn+UYGxdqmvuma+jihawEn7uKC3QZ8qXVh4CvJ2E
 pG8cPz5YIrmw==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="189376531"
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; 
   d="scan'208";a="189376531"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2020 05:56:03 -0800
IronPort-SDR: nQ5Pp2HkbFiq3GYBNci212BokRNBZNjV8o0SpI2jXmN6rlfNSU26gxrwPladBWPG2lW2WcCxw/
 TStzdtqXjHZw==
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; 
   d="scan'208";a="330939080"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2020 05:55:59 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kfkQm-007xXE-JR; Thu, 19 Nov 2020 15:57:00 +0200
Date:   Thu, 19 Nov 2020 15:57:00 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        sakari.ailus@linux.intel.com, drinkcat@chromium.org,
        tfiga@chromium.org, matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [PATCH v15 2/2] media: i2c: Add OV02A10 image sensor driver
Message-ID: <20201119135700.GG4077@smile.fi.intel.com>
References: <20201013130503.2412-1-dongchun.zhu@mediatek.com>
 <20201013130503.2412-3-dongchun.zhu@mediatek.com>
 <20201023143156.GX4077@smile.fi.intel.com>
 <1605791201.4733.114.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1605791201.4733.114.camel@mhfsdcap03>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 19, 2020 at 09:06:41PM +0800, Dongchun Zhu wrote:
> On Fri, 2020-10-23 at 17:31 +0300, Andy Shevchenko wrote:
> > On Tue, Oct 13, 2020 at 09:05:03PM +0800, Dongchun Zhu wrote:
> > > Add a V4L2 sub-device driver for OmniVision OV02A10 image sensor.

...

> > > +#define OV02A10_ID_MASK					0xffff
> > 
> > GENMASK()
> > 
> > (And include bits.h for that)
> > 
> 
> It seems could build pass without including bits.h, as DW9768 once used.

The rule of thumb is to include all headers you have direct users for.
Exceptions when you have indirect inclusion that guarantees to provide
others (like bitmap.h implies bits.h, etc).

-- 
With Best Regards,
Andy Shevchenko


