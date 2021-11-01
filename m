Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D4C44420A8
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 20:18:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231671AbhKATU6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 15:20:58 -0400
Received: from mga06.intel.com ([134.134.136.31]:27443 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230084AbhKATU5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Nov 2021 15:20:57 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10155"; a="291936635"
X-IronPort-AV: E=Sophos;i="5.87,200,1631602800"; 
   d="scan'208";a="291936635"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2021 12:18:22 -0700
X-IronPort-AV: E=Sophos;i="5.87,200,1631602800"; 
   d="scan'208";a="449069418"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2021 12:18:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mhcom-002n1z-Gq;
        Mon, 01 Nov 2021 21:18:04 +0200
Date:   Mon, 1 Nov 2021 21:18:04 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera-devel@lists.libcamera.org
Subject: Re: Fwd: Surface Go VCM type (was: Need to pass
 acpi_enforce_resources=lax on the Surface Go (version1))
Message-ID: <YYA9bJ/DZp0+K0MB@smile.fi.intel.com>
References: <e2312277-f967-7d3f-5ce9-fbb197d35fd6@gmail.com>
 <3b61bb2d-1136-cf35-ba7a-724da9642855@gmail.com>
 <418dc16a-2a03-7604-a8e2-31c5ddfcf436@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <418dc16a-2a03-7604-a8e2-31c5ddfcf436@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 01, 2021 at 05:02:58PM +0100, Hans de Goede wrote:
> On 10/29/21 13:50, Daniel Scally wrote:

...

> > To throw a spanner in the works though; I noticed this delightful _CRS
> > for the OV9734 sensor of a  Surface Laptop 1 earlier:
> > 
> > Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
> > {
> >     Name (SBUF, ResourceTemplate ()
> >     {
> >         I2cSerialBusV2 (0x0036, ControllerInitiated, 0x00061A80,
> >             AddressingMode7Bit, "\\_SB.PCI0.I2C2",
> >             0x00, ResourceConsumer, , Exclusive,
> >             )
> >         I2cSerialBusV2 (0x0050, ControllerInitiated, 0x00061A80,
> >             AddressingMode7Bit, "\\_SB.PCI0.I2C2",
> >             0x00, ResourceConsumer, , Exclusive,
> >             )
> >         I2cSerialBusV2 (0x0051, ControllerInitiated, 0x00061A80,
> >             AddressingMode7Bit, "\\_SB.PCI0.I2C2",
> >             0x00, ResourceConsumer, , Exclusive,
> >             )
> >         I2cSerialBusV2 (0x0052, ControllerInitiated, 0x00061A80,
> >             AddressingMode7Bit, "\\_SB.PCI0.I2C2",
> >             0x00, ResourceConsumer, , Exclusive,
> >             )
> >         I2cSerialBusV2 (0x0053, ControllerInitiated, 0x00061A80,
> >             AddressingMode7Bit, "\\_SB.PCI0.I2C2",
> >             0x00, ResourceConsumer, , Exclusive,
> >             )
> >     })
> >     Return (SBUF) /* \_SB_.PCI0.I2C2.CAMF._CRS.SBUF */
> > }
> 
> Hmm, we do have i2c_acpi_client_count(adev), so it is easy to use
> that and just always use the last resource for the VCM. But that assumes
> that is what is going on here and I have no idea.

You probably composed this message before reading my reply(ies).

...

> Change the first parameter of i2c_acpi_new_device() from
> a struct device * to a struct acpi_device *.
> 
> This is necessary because in some cases we may only have access
> to the fwnode / acpi_device and not to the matching physical-node
> struct device *.

Can we rather create an fwnode based API and then

static inline
struct i2c_client *i2c_acpi_new_device(struct device *dev, int index,
				       struct i2c_board_info *info)
	return i2c_acpi_new_device_by_fwnode(dev_fwnode(), index, info);
}

?

-- 
With Best Regards,
Andy Shevchenko


