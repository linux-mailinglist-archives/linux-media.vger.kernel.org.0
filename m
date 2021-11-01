Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 177EA441D9A
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 16:55:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232619AbhKAP6R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 11:58:17 -0400
Received: from mga07.intel.com ([134.134.136.100]:4546 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231362AbhKAP6Q (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Nov 2021 11:58:16 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10154"; a="294499846"
X-IronPort-AV: E=Sophos;i="5.87,200,1631602800"; 
   d="scan'208";a="294499846"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2021 08:55:37 -0700
X-IronPort-AV: E=Sophos;i="5.87,200,1631602800"; 
   d="scan'208";a="583024047"
Received: from smile.fi.intel.com ([10.237.72.184])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2021 08:55:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mhZeY-002iTw-2o;
        Mon, 01 Nov 2021 17:55:18 +0200
Date:   Mon, 1 Nov 2021 17:55:17 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera-devel@lists.libcamera.org
Subject: Re: Fwd: Surface Go VCM type (was: Need to pass
 acpi_enforce_resources=lax on the Surface Go (version1))
Message-ID: <YYAN5aygAZ9W5Ev2@smile.fi.intel.com>
References: <e2312277-f967-7d3f-5ce9-fbb197d35fd6@gmail.com>
 <3b61bb2d-1136-cf35-ba7a-724da9642855@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3b61bb2d-1136-cf35-ba7a-724da9642855@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 29, 2021 at 12:50:31PM +0100, Daniel Scally wrote:
> Hi all
> 
> +CC linux-media and libcamera-devel, as it's probably a good time to
> broaden this out. Also Andy because I'm hoping you can help :) The
> background of the discussion is about how we identify and enumerate
> (correctly, I.E. with a type matching the vcm driver's i2c_device_id,
> and there are a few different vcm's in scope which seem encoded in the
> SSDB buffer) which VCM module is linked to a sensor in Intel's IPU3
> centric ACPI tables. The I2C address for the device is just a second
> I2cSerialBusV2 against the sensor's acpi device rather than a separate
> one, which is no awkward. We also need to get firmware created for the
> VCM such that the sensor will link to it via the lens-focus property.

> On 28/10/2021 09:57, Hans de Goede wrote:

...

> To throw a spanner in the works though; I noticed this delightful _CRS
> for the OV9734 sensor of a  Surface Laptop 1 earlier:
> 
> Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
> {
>     Name (SBUF, ResourceTemplate ()
>     {
>         I2cSerialBusV2 (0x0036, ControllerInitiated, 0x00061A80,
>             AddressingMode7Bit, "\\_SB.PCI0.I2C2",
>             0x00, ResourceConsumer, , Exclusive,
>             )
>         I2cSerialBusV2 (0x0050, ControllerInitiated, 0x00061A80,
>             AddressingMode7Bit, "\\_SB.PCI0.I2C2",
>             0x00, ResourceConsumer, , Exclusive,
>             )
>         I2cSerialBusV2 (0x0051, ControllerInitiated, 0x00061A80,
>             AddressingMode7Bit, "\\_SB.PCI0.I2C2",
>             0x00, ResourceConsumer, , Exclusive,
>             )
>         I2cSerialBusV2 (0x0052, ControllerInitiated, 0x00061A80,
>             AddressingMode7Bit, "\\_SB.PCI0.I2C2",
>             0x00, ResourceConsumer, , Exclusive,
>             )
>         I2cSerialBusV2 (0x0053, ControllerInitiated, 0x00061A80,
>             AddressingMode7Bit, "\\_SB.PCI0.I2C2",
>             0x00, ResourceConsumer, , Exclusive,
>             )
>     })
>     Return (SBUF) /* \_SB_.PCI0.I2C2.CAMF._CRS.SBUF */
> }
> 
> How do we know which one's the VCM when there's more than just two like
> that? Andy: don't suppose you can shed any light there?

Seems to me that the order is defined by address and if software engineers are
not (so) crazy, it shouldn't deviate from device to device.

At least this is stated in the internal documentation.

The order is

1. Sensor (single addr)
2. VCM (single addr)
3. EEPROM (addr per page)

Interestingly that your list have no VCM in the _CRS defined...

Not sure how to distinguish that if it's not a typo and indeed the case.
Sounds like DMI quirk :-( again (something like 3-bit flag to define
which devices are present in the _CRS taking into account the ordering
requirements).

-- 
With Best Regards,
Andy Shevchenko


