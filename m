Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C16BAA19B
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 13:37:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388593AbfIELgr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 07:36:47 -0400
Received: from mga18.intel.com ([134.134.136.126]:54537 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732712AbfIELgr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Sep 2019 07:36:47 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Sep 2019 04:36:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,470,1559545200"; 
   d="scan'208";a="207841709"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004.fm.intel.com with ESMTP; 05 Sep 2019 04:36:40 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1i5q46-0007Dt-Tq; Thu, 05 Sep 2019 14:36:38 +0300
Date:   Thu, 5 Sep 2019 14:36:38 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Javier Martinez Canillas <javierm@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        dongchun.zhu@mediatek.com, mchehab@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, drinkcat@chromium.org, tfiga@chromium.org,
        matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        sam.hung@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V2, 2/2] media: i2c: Add DW9768 VCM driver
Message-ID: <20190905113638.GE2680@smile.fi.intel.com>
References: <20190905072142.14606-1-dongchun.zhu@mediatek.com>
 <20190905072142.14606-3-dongchun.zhu@mediatek.com>
 <20190905082134.GY5475@paasikivi.fi.intel.com>
 <20190905101908.GB2680@smile.fi.intel.com>
 <20190905104001.GZ5475@paasikivi.fi.intel.com>
 <ad357e27-3e51-6922-1924-5d2c2daf1934@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad357e27-3e51-6922-1924-5d2c2daf1934@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 05, 2019 at 12:57:34PM +0200, Javier Martinez Canillas wrote:
> On 9/5/19 12:40 PM, Sakari Ailus wrote:
> > On Thu, Sep 05, 2019 at 01:19:08PM +0300, Andy Shevchenko wrote:
> >> On Thu, Sep 05, 2019 at 11:21:34AM +0300, Sakari Ailus wrote:
> >>> On Thu, Sep 05, 2019 at 03:21:42PM +0800, dongchun.zhu@mediatek.com wrote:
> >>>> From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> >>
> >>>> +static const struct i2c_device_id dw9768_id_table[] = {
> >>>> +	{ DW9768_NAME, 0 },
> >>>> +	{ },
> >>>
> >>> Could you drop the I²C ID table?
> >>
> >> But why?
> >> It will allow you to instanciate the device from user space.
> 
> Yes, the I2C device table is still needed if the device can be instantiated
> from user-space using the sysfs interface, or otherwise the module won't be
> automatically loaded.
> 
> Kieran posted a "[PATCH RFC] modpost: Support I2C Aliases from OF tables"
> patch that adds a MODULE_DEVICE_TABLE(i2c_of, ..) macro so modpost could
> add legacy I2C modalias using the information in the OF device ID tables:
> 
> https://patchwork.kernel.org/patch/11038861/
> 
> If that lands, then we could get rid of the I2C device tables altogether
> for non-legacy I2C drivers.
> 
> > 
> > The device is supposed to be present in DT (or ACPI tables) already.
> >
> 
> Agreed. Also by looking at the driver's probe function I see that the
> device lookups a 'vin' and 'vdd' regulators supplies and it fails if
> aren't defined, so it can't be instantiated from user-space anyways.

Thank you for clarifications!

So, it can use ->probe_new() in that case.

> 
> BTW, these two regulators supplies should be listed as 'vin-supply'
> and 'vdd-supply' as required properties in the DT binding document.

-- 
With Best Regards,
Andy Shevchenko


