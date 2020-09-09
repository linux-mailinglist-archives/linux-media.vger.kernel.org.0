Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF6BF262BDD
	for <lists+linux-media@lfdr.de>; Wed,  9 Sep 2020 11:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbgIIJaD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Sep 2020 05:30:03 -0400
Received: from mga01.intel.com ([192.55.52.88]:26146 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725826AbgIIJaC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Sep 2020 05:30:02 -0400
IronPort-SDR: Ouj71//X2jLf8IRGaG+Klv8F454dISF7Oo+Kq9fBt7v5PolLnZWjDqPWnlqyGg89fL46yOlMUD
 pqmoHv9/3wcw==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="176358179"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="176358179"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 02:30:02 -0700
IronPort-SDR: P7giM/BtAeK1Hm8shB5dUvraZbk2u5l+WJNz/CKsOOEj/55S/a4lD21muRPSex8+Bzo1a+AEbB
 E1eNJspLxkiA==
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="328842224"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 02:30:00 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 00DD120765; Wed,  9 Sep 2020 12:29:57 +0300 (EEST)
Date:   Wed, 9 Sep 2020 12:29:57 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dan Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, heikki.krogerus@linux.intel.com,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        kitakar@gmail.com, jorhand@linux.microsoft.com,
        andriy.shevchenko@linux.intel.com
Subject: Re: cio2 ipu3 module to automatically connect sensors via swnodes
Message-ID: <20200909092957.GB6566@paasikivi.fi.intel.com>
References: <CAFLoDVFmeKcgXBe7kORqx0Q=H_wCWze=6G8qZRRXZT3Uqgkx8w@mail.gmail.com>
 <20200908080326.GB27352@paasikivi.fi.intel.com>
 <5614b37e-c263-c9e7-fe5b-a523401c58e2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5614b37e-c263-c9e7-fe5b-a523401c58e2@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

On Tue, Sep 08, 2020 at 10:40:09AM +0100, Dan Scally wrote:
> Hi Sakari - thanks for the reply
> 
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

In the end there should be no driver changes required to the sensor or
other peripheral drivers. But I guess at this point it'd be important to
get things in working order, before they can be cleaned up.

Would you be able to pass me the ACPI tables from this machine btw.?

-- 
Kind regards,

Sakari Ailus
