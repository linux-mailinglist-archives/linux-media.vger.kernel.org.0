Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB73429F5C4
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 21:02:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726433AbgJ2UCk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 16:02:40 -0400
Received: from mga14.intel.com ([192.55.52.115]:14217 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725797AbgJ2UC1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 16:02:27 -0400
IronPort-SDR: Zty4leyIswXrOtoC5AktnaQkslWEVFbZSDhICG8zkb3/vTqbevXLNdqWHwHgYd7oCoztqR19+z
 rQngUwXOXSCA==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="167720066"
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; 
   d="scan'208";a="167720066"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 13:02:11 -0700
IronPort-SDR: DepLkMYYq23M3mgSOpDGfiD69nzPIu15qBYB09FLw8PIFxajH1dGkKJLEF5fHw3/YmEB0BcMsN
 CDFXUEIng5kw==
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; 
   d="scan'208";a="323831074"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 13:02:10 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1kYE8e-001UBn-R6; Thu, 29 Oct 2020 22:03:12 +0200
Date:   Mon, 26 Oct 2020 18:10:50 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Message-ID: <20201026161050.GQ4077@smile.fi.intel.com>
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-10-djrscally@gmail.com>
 <20201024012411.GT5979@pendragon.ideasonboard.com>
 <d188f8b5-ed3b-f91b-171a-26afeb7d213e@gmail.com>
 <20201024093702.GA3939@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201024093702.GA3939@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Oct 24, 2020 at 12:37:02PM +0300, Laurent Pinchart wrote:
> On Sat, Oct 24, 2020 at 09:50:07AM +0100, Dan Scally wrote:
> > On 24/10/2020 02:24, Laurent Pinchart wrote:
> > > On Mon, Oct 19, 2020 at 11:59:03PM +0100, Daniel Scally wrote:

> > >> +		adev = acpi_dev_get_first_match_dev(supported_devices[i], NULL, -1);
> > >
> > > What if there are multiple sensor of the same model ?
> > 
> > Hmm, yeah, that would be a bit of a pickle. I guess the newer
> > smartphones have multiple sensors on the back, which I presume are the
> > same model. So that will probably crop up at some point. How about
> > instead I use bus_for_each_dev() and in the applied function check if
> > the _HID is in the supported list?
> 
> Sounds good to me.
> 
> > >> +		if (!adev)
> > >> +			continue;

Please, don't.

If we have so weird ACPI tables it must be w/a differently. The all, even badly
formed, ACPI tables I have seen so far are using _UID to distinguish instance
of the device (see second parameter to the above function).

If we meet the very broken table I would like rather to know about, then
silently think ahead what could be best.

I.o.w. don't change this until we will have a real example of the problematic
firmware.

-- 
With Best Regards,
Andy Shevchenko


