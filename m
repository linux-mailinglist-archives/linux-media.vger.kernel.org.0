Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 573C72CAADA
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 19:38:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392267AbgLAShI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 13:37:08 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45160 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392246AbgLAShH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Dec 2020 13:37:07 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4AE09DBD;
        Tue,  1 Dec 2020 19:36:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606847784;
        bh=k5QyTVWA4Jc+ywHyi2x/6LgWGDBVIjOrvUWrw4fdzDE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Oq6aB190ZbolqktbLd2lQtY1IEs2kNdnSPqvEx6/o+BFEPDJGW3O1QZBl0nWS+FOm
         3nkHIY29uUf9Nyew9WsjI9dNwpMWKIIkyYDb0FKoH1saZb62605kjEryMSE8nnO5SM
         5/NpWYRHvvnurHE4YP70bNNFGmcQ7oTO0FNzPXD0=
Date:   Tue, 1 Dec 2020 20:36:16 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Dan Scally <djrscally@gmail.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org, rjw@rjwysocki.net,
        lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org, robert.moore@intel.com,
        erik.kaneda@intel.com, pmladek@suse.com, rostedt@goodmis.org,
        sergey.senozhatsky@gmail.com, linux@rasmusvillemoes.dk,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
Subject: Re: [PATCH 18/18] ipu3: Add driver for dummy INT3472 ACPI device
Message-ID: <20201201183616.GD3085@pendragon.ideasonboard.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-19-djrscally@gmail.com>
 <f5aca6eb-cc41-64d6-cb72-19ee3a8afd1e@ideasonboard.com>
 <fba097b3-6c61-c1ad-2928-3cb55bff6d19@gmail.com>
 <20201201183139.GH4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201201183139.GH4077@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On Tue, Dec 01, 2020 at 08:31:39PM +0200, Andy Shevchenko wrote:
> On Mon, Nov 30, 2020 at 11:20:55PM +0000, Dan Scally wrote:
> > On 30/11/2020 16:17, Jean-Michel Hautbois wrote:
> 
> ...
> 
> > but the ACPI table doesn't define an I2CSerialBusV2 for it. Instead it's
> > rolled under the sensor's entry, there's a second entry in _CRS for the
> > sensor that matches the address of the new device:
> > 
> > 
> >             Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
> >             {
> >                 Name (SBUF, ResourceTemplate ()
> >                 {
> >                     I2cSerialBusV2 (0x0036, ControllerInitiated, 0x00061A80,
> >                         AddressingMode7Bit, "\\_SB.PCI0.I2C2",
> >                         0x00, ResourceConsumer, , Exclusive,
> >                         )
> >                     I2cSerialBusV2 (0x000C, ControllerInitiated, 0x00061A80,
> >                         AddressingMode7Bit, "\\_SB.PCI0.I2C2",
> >                         0x00, ResourceConsumer, , Exclusive,
> >                         )
> >                 })
> >                 Return (SBUF) /* \_SB_.PCI0.CAM0._CRS.SBUF */
> >             }
> > 
> > So that's another thing we need to work on. At the moment it doesn't
> > exist as far as the kernel is concerned.
> 
> Maybe something along i2c-multi-instantiate can help here (maybe not).

It's two different devices really. That's also one of the "annoyances"
related to this platform. The INT* HID for the camera sensor actually
refers to a camera module, with VCM, EEPROM, ... On Chrome OS devices,
the same HID refers to the camera sensor only. *sigh* :-(

> P.S. Dan, can you drop unrelated text when replying?

I find a full quote actually useful, as it saves me from having to dig
up original e-mails to read missing parts :-) It's a matter of
preference I suppose.

-- 
Regards,

Laurent Pinchart
