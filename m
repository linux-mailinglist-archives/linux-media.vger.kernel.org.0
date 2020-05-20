Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8921DAC7D
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 09:44:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726812AbgETHoI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 03:44:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:33754 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726403AbgETHoG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 03:44:06 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D3113207D3;
        Wed, 20 May 2020 07:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589960645;
        bh=wrut9d23/DJNfHZ6qpdlhEmByAIG6cod939iXHIJpyA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=eJWcRITQ5ll94kLXPZW+k6b4xE0IGv6gnYz+3sVNAODAE+MJO/jvKOimUsd3xymay
         ZT3X109fEOMbLHxeMH3m00XJD+b/zTVKAOyQw7/SMmf0PuAH0PegpNPJvw5HZYIzMk
         lfiLW+Aq+EinWhcThCdmVh1YIDEg0jVyZhSKvUzk=
Date:   Wed, 20 May 2020 09:44:00 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org
Subject: Re: [PATCH] media: ipu3: add a module to probe sensors via ACPI
Message-ID: <20200520094400.5137e7f2@coco.lan>
In-Reply-To: <20200517103659.GS17578@paasikivi.fi.intel.com>
References: <12fbe3f5c6a16c5f3447adbc09fe27ceb2b16823.1589625807.git.mchehab+huawei@kernel.org>
        <20200517103659.GS17578@paasikivi.fi.intel.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Em Sun, 17 May 2020 13:36:59 +0300
Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:

> Hi Mauro,
> 
> Thanks for the patch.

Thanks for reviewing it.

> 
> On Sat, May 16, 2020 at 12:43:39PM +0200, Mauro Carvalho Chehab wrote:
> > On devices without ACPI, or which ACPI is not prepared to
> > export sensor data via DT, we need a different probing
> > method.
> > 
> > This little driver adds initial support to probe the
> > sensors found on a Dell Latitude 7285.
> > 
> > For now, it just detects the hardware and use request_module()
> > to load a sensor driver.
> > 
> > In the specific case of this device, the ACPI DTST dable
> > describes 2 camera sensors for this module, but the
> > current upstream doesn't have yet drivers for such
> > sensors. So, this patch just detects the PMIC used on
> > this device and tries to load a sensor.
> > 
> > Once the sensor gets added, some additional code will
> > be needed to pass via platform_data other details, like
> > callbacks for PMIC's command to turn the sensor on/off
> > and other sensor-specific settings.
> > 
> > The idea of this patch was inspired on how the sensors
> > are probed by the staging atomisp driver.
> > 
> > The current result of this driver with the Dell
> > Latitude 7285 is:
> > 
> > 	ipu3_acpi i2c-INT3477:00: ipu3_acpi_probe: ACPI detected it on bus ID=LNK1, HID=INT3477
> > 	ipu3_acpi i2c-INT3477:00: Found DMI entry for 'Latitude 7285' with sensor INT3477
> > 	ipu3_acpi i2c-INT3477:00: Loading sensor module ov8858
> > 	ipu3_acpi i2c-OVTI9234:00: ipu3_acpi_probe: ACPI detected it on bus ID=LNK2, HID=OVTI9234
> > 	ipu3_acpi i2c-OVTI9234:00: Found DMI entry for 'Latitude 7285' with sensor OVTI9234
> > 	ipu3_acpi i2c-OVTI9234:00: Loading sensor module ov9234
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  

With regards to the approach this patch took: it is currently
incomplete: the I2C core doesn't currently allow to have two 
drivers for the same I2C address at the same bus. So, if we end by having
some ancillary drivers to help the I2C core to work with media devs,
we may need some changes at I2C core (or to use an I2C virtual mux).

> ...
> 
> > +/*
> > + * Should list known sensor devices found at DSDT table as "CAM0", "CAM1", ...
> > + *
> > + * The table below is probably incomplete. It came from the DSDT table found
> > + * at a Dell Latitude 7285 (Method HCID).
> > + */
> > +static const struct acpi_device_id ipu3_acpi_acpi_match[] = {
> > +	{"INT3471"},
> > +	{"INT33BE"},
> > +	{"INT3476"},
> > +	{"INT3477"},
> > +	{"INT3474"},
> > +	{"INT3473"},
> > +	{"INT3475"},
> > +	{"INT3478"},
> > +	{"INT3479"},
> > +	{"INT347A"},
> > +	{"INT347B"},
> > +	{"OVTI9234"},
> > +	{"OVTI9734"},
> > +	{"OVTI8856"},
> > +	{"OVTIF860"},
> > +	{},
> > +};
> > +MODULE_DEVICE_TABLE(acpi, ipu3_acpi_acpi_match);  
> 
> Instead of creating a new way to probe drivers on ACPI systems, please add
> the appropriate ACPI device IDs to the respective drivers. E.g.
> drivers/media/i2c/imx319.c implements this.

The ACPI code at imx319 is incomplete. I mean, it will only tell the I2C
core that the driver should be probed via ACPI, but it tells nothing
how to power up the device. It just assumes that the driver will work
using pm_runtime support.

It also doesn't tell how to get device-specific platform data from
the BIOS (with is machine-specific).

Also, at least in the case of the atomisp approach, a single code
to parse BIOS for devices with ISP2300/ISP2400/ISP2401/ISP2500 should
work with all sensors supported by those models.

Copying those inside all sensor drivers is probably a bad idea.
I mean, we should likely need a core support for parsing it, as
the code is the same for a given set of PCI IDs.

-

As the atomisp driver is now minimally working, my plan is to merge
it upstream, under staging.

Before going ahead and fixing other troubles there at atomisp,
I may try to port the needed ACPI bits from the atomisp-ov2880 
staging driver into the mainline one. This should be an interesting 
exercise to check what's missing there.

Even if the atomisp never gets out of staging, doing that will help
to identify what it would take for a sensor to be able to work with
more than one different ISP. As as result, we may design something
that will properly support ACPI at the media subsystem.

Thanks,
Mauro
