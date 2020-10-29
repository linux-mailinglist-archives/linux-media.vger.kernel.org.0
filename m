Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B836D29F608
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 21:18:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgJ2USe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 16:18:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:44338 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726356AbgJ2USe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 16:18:34 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F35F950E;
        Thu, 29 Oct 2020 21:18:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604002711;
        bh=YRh2kGEjFGrWtSwafy+qlT89Y5Wz7S+SFQZBQwkgXcM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iVHT4pweTbPB0RDbrOiFDF5OpxFsmHRa1IxBlObst/CLgLu/W1OTfNGWLPP1QHmeB
         4l+aJQ15conIGD+IU+fX/4Nuw2ZoyqV9MjYrTMBg+yWIF9qXGqVrlobCfuFQoceBxe
         g61QEVA2l/LSGjiZA5O9IkY0vz/0xV7Lyds6aBig=
Date:   Thu, 29 Oct 2020 22:17:42 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Dan Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linus.walleij@linaro.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        heikki.krogerus@linux.intel.com, dmitry.torokhov@gmail.com,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        robh@kernel.org, davem@davemloft.net, linux@rasmusvillemoes.dk,
        sergey.senozhatsky@gmail.com, rostedt@goodmis.org,
        pmladek@suse.com, mchehab@kernel.org, tian.shu.qiu@intel.com,
        bingbu.cao@intel.com, sakari.ailus@linux.intel.com,
        yong.zhi@intel.com, rafael@kernel.org, gregkh@linuxfoundation.org,
        kitakar@gmail.com
Subject: Re: [RFC PATCH v3 9/9] ipu3-cio2: Add functionality allowing
 software_node connections to sensors on platforms designed for Windows
Message-ID: <20201029201742.GC15024@pendragon.ideasonboard.com>
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-10-djrscally@gmail.com>
 <20201024012411.GT5979@pendragon.ideasonboard.com>
 <d188f8b5-ed3b-f91b-171a-26afeb7d213e@gmail.com>
 <20201024093702.GA3939@pendragon.ideasonboard.com>
 <748d34c3-a146-12fe-22c0-8dfef9006ea0@gmail.com>
 <20201024223628.GG3943@pendragon.ideasonboard.com>
 <703d5108-5b10-802d-2bac-c719150430af@gmail.com>
 <20201026160549.GO4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201026160549.GO4077@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On Mon, Oct 26, 2020 at 06:05:49PM +0200, Andy Shevchenko wrote:
> On Mon, Oct 26, 2020 at 08:20:14AM +0000, Dan Scally wrote:
> > On 24/10/2020 23:36, Laurent Pinchart wrote:
> > > On Sat, Oct 24, 2020 at 11:28:06PM +0100, Daniel Scally wrote:
> > >> On 24/10/2020 10:37, Laurent Pinchart wrote:
> > >>>>> I wonder if we could avoid depending on the I2C device being created by
> > >>>>> getting the fwnode from adev, and setting ->secondary manually. adev
> > >>>>> would need to be passed to get_acpi_ssdb_sensor_data() instead of dev.
> > >>>>
> > >>>> Let me try that; I initially wanted to do
> > >>>> set_secondary_fwnode(&adev->dev, fwnode) to avoid depending on the I2C
> > >>>> dev being created but it turns out &adev->dev isn't the same pointer. I
> > >>>> shall try it and see.
> > >>
> > >> Actually, thinking on this further I think maybe we can't avoid that -
> > >> it's not actually in this patch series but during assigning GPIO
> > >> resources parsed from PMIC's ACPI node to the sensor, I'm using
> > >> dev_name() on the i2c dev to pass to .dev_id member of gpiod_lookup_table
> > >
> > > Any chance we can construct the I2C device name from the ACPI device,
> > > the same way that the ACPI/I2C core does ? It may be a dead end, but if
> > > we could avoid depending on the I2C device, I think it will make
> > > initialization easier. I have a feeling that will be difficult though,
> > > as we'll need the I2C bus number, which won't be readily available.
> >
> > OK yeah; the i2c core does indeed just prefix "i2c-" onto the acpi
> > device name, so I will make this change too.
> 
> This is part of the I²C core and if you go this way, do not home grow the
> functionality that doesn't belong here.
> 
> Instead, export a helper function that will do it for you and for I²C core with
> explanation why it's needed.

Agreed, I was actually considering suggesting that. Hardcoding the same
naming scheme in two places is asking for trouble, especially if we
don't let the I2C maintainers know. It should be easy to do, not
necessarily the highest priority task, but something that should be
handled to get this merged.

-- 
Regards,

Laurent Pinchart
