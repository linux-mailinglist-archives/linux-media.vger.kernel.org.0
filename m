Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3ABF29F5C2
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 21:02:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726438AbgJ2UCk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 16:02:40 -0400
Received: from mga11.intel.com ([192.55.52.93]:49136 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726203AbgJ2UCP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 16:02:15 -0400
IronPort-SDR: tNaW9qpI+GbXyF7BBZ61BI2pZihaMcmFKjwCZMfsluLpHLWkZC/ZgstV6jMIaJz43XueLoHBzs
 ti1Tno3KEs9g==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="165002641"
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; 
   d="scan'208";a="165002641"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 13:01:51 -0700
IronPort-SDR: 7R7LRHeYu8JNTwz+ztTMwE5PpZXpI6V+7f0kA1McnGIYOsug8wz9/hRKxTRwGDjvQNu5YGnGCz
 cISu/tEIfFVQ==
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; 
   d="scan'208";a="469261481"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 13:01:49 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1kYE8K-001UAv-Dh; Thu, 29 Oct 2020 22:02:52 +0200
Date:   Mon, 26 Oct 2020 18:05:49 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dan Scally <djrscally@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linus.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
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
Message-ID: <20201026160549.GO4077@smile.fi.intel.com>
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-10-djrscally@gmail.com>
 <20201024012411.GT5979@pendragon.ideasonboard.com>
 <d188f8b5-ed3b-f91b-171a-26afeb7d213e@gmail.com>
 <20201024093702.GA3939@pendragon.ideasonboard.com>
 <748d34c3-a146-12fe-22c0-8dfef9006ea0@gmail.com>
 <20201024223628.GG3943@pendragon.ideasonboard.com>
 <703d5108-5b10-802d-2bac-c719150430af@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <703d5108-5b10-802d-2bac-c719150430af@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 26, 2020 at 08:20:14AM +0000, Dan Scally wrote:
> On 24/10/2020 23:36, Laurent Pinchart wrote:
> > On Sat, Oct 24, 2020 at 11:28:06PM +0100, Daniel Scally wrote:
> >> On 24/10/2020 10:37, Laurent Pinchart wrote:
> >>>>> I wonder if we could avoid depending on the I2C device being created by
> >>>>> getting the fwnode from adev, and setting ->secondary manually. adev
> >>>>> would need to be passed to get_acpi_ssdb_sensor_data() instead of dev.
> >>>> Let me try that; I initially wanted to do
> >>>> set_secondary_fwnode(&adev->dev, fwnode) to avoid depending on the I2C
> >>>> dev being created but it turns out &adev->dev isn't the same pointer. I
> >>>> shall try it and see.
> >> Actually, thinking on this further I think maybe we can't avoid that -
> >> it's not actually in this patch series but during assigning GPIO
> >> resources parsed from PMIC's ACPI node to the sensor, I'm using
> >> dev_name() on the i2c dev to pass to .dev_id member of gpiod_lookup_table
> > Any chance we can construct the I2C device name from the ACPI device,
> > the same way that the ACPI/I2C core does ? It may be a dead end, but if
> > we could avoid depending on the I2C device, I think it will make
> > initialization easier. I have a feeling that will be difficult though,
> > as we'll need the I2C bus number, which won't be readily available.
> OK yeah; the i2c core does indeed just prefix "i2c-" onto the acpi
> device name, so I will make this change too.

This is part of the I²C core and if you go this way, do not home grow the
functionality that doesn't belong here.

Instead, export a helper function that will do it for you and for I²C core with
explanation why it's needed.

-- 
With Best Regards,
Andy Shevchenko


