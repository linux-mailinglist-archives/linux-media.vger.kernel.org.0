Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31C5C261872
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 19:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732077AbgIHRxy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 13:53:54 -0400
Received: from mga03.intel.com ([134.134.136.65]:2303 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731576AbgIHQMs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Sep 2020 12:12:48 -0400
IronPort-SDR: nWu89b0LER2ABoifsUQjA0sgfPIOdKflvnsvlGqMs7hgHVVZRa+1c0meo49VBY9IXf+6ZLe1OV
 0KPjWb82uZVA==
X-IronPort-AV: E=McAfee;i="6000,8403,9737"; a="158155211"
X-IronPort-AV: E=Sophos;i="5.76,405,1592895600"; 
   d="scan'208";a="158155211"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2020 06:56:12 -0700
IronPort-SDR: wFyJre8V0XJXORP2iyf11CCrKYU1fCIKfq1w4mElivku5RfC9HxbySalF6u3SuJwM0fJRyLisz
 U2fpYmwEjQ1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,405,1592895600"; 
   d="scan'208";a="333480191"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 08 Sep 2020 06:56:10 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kFe6R-00FDeC-Em; Tue, 08 Sep 2020 16:56:07 +0300
Date:   Tue, 8 Sep 2020 16:56:07 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dan Scally <djrscally@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, heikki.krogerus@linux.intel.com,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        kitakar@gmail.com, jorhand@linux.microsoft.com
Subject: Re: cio2 ipu3 module to automatically connect sensors via swnodes
Message-ID: <20200908135607.GD1891694@smile.fi.intel.com>
References: <CAFLoDVFmeKcgXBe7kORqx0Q=H_wCWze=6G8qZRRXZT3Uqgkx8w@mail.gmail.com>
 <20200908080326.GB27352@paasikivi.fi.intel.com>
 <5614b37e-c263-c9e7-fe5b-a523401c58e2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5614b37e-c263-c9e7-fe5b-a523401c58e2@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 08, 2020 at 10:40:09AM +0100, Dan Scally wrote:
> On 08/09/2020 09:03, Sakari Ailus wrote:
> > On ACPI systems regulators and clocks as well as GPIOs to some extent are
> > controlled by AML code in the DSDT and SSDT. There are different ways this
> > can be implemented though. It may be that the PMIC in this case is
> > controlled entirely from the AML code without the need for a driver.
> > 
> > This might be the case here. It should be possible to figure this out from
> > the DSDT and SSDT tables.
> 
> Ah - that's interesting, thanks. I'll delve into the SSDT and DSDT tables
> and see if I can spot that happening. Presumably it is the case though, as
> like I say it seems to be working fine without any intervention by our
> sensor drivers.
> 
> > If you do not change how the regulators in the PMIC are controlled I'd
> > think it's very, very unlikely you'd be able to fry the sensors.
> Very reassuring!
> > The GPIOs there I'd expect to be reset GPIOs, one for each sensor.
> > Interesting that they are not handled by ACPI in this case. FWIW, the
> > tps68470 driver is present also in the upstream kernel.

There are 3 GPIOs (per PMIC, AFAIR) that are controlled via AML. But I dunno
what is going on in those methods and what the purpose is.

> Yeah we found the tps68470 gpio driver (actually andriy pointed it out I
> think) - it seems that the pins _provided_ by that driver don't actually
> have any affect when toggled though, only the ones allocated to the PMIC in
> its _CRM seem to turn the sensors on/off when toggled (at least, switching
> those off is the only thing that stops the sensor from appearing in
> i2cdetect). The pins from the PMIC's _CRM seem to just be system GPIO pins,
> controllable with `gpioset gpiochip0` for example. For the most part we've
> been controlling them in the sensor drivers by evaluating the sensor's _DEP
> entry in ACPI to get to the PMIC's acpi_device. That does seem a little
> hackish though, and it's definitely pretty ugly.

-- 
With Best Regards,
Andy Shevchenko


