Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6358F63B14F
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 19:29:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233442AbiK1S3y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 13:29:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233407AbiK1S3h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 13:29:37 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 570C8D9F;
        Mon, 28 Nov 2022 10:22:37 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E15E856D;
        Mon, 28 Nov 2022 19:22:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669659756;
        bh=GKwo/jr4IO4MGyrIhs+IuvV2L3spl2h6vEe+4IIYIAQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G/DONe1tNYdw5f5bi/QVSd5eFqePWTXcre2Ol5DYtpndDFaK6LO3qUjvaI+18wc/k
         kCKlyf9SOhk3pftLzm0VKgYLezGpnV43XbYtWoQeV5bx2zu1CvSv22kiz2x94jMrki
         9mEjb8hvRUn//iSOnbU5oXW/tzZ2xXfTXvxEFCnA=
Date:   Mon, 28 Nov 2022 20:22:21 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Dan Scally <dan.scally@ideasonboard.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 0/3] platform/x86: int3472/discrete: Make it work with
 IPU6
Message-ID: <Y4T8XQ6UFYooVLf9@pendragon.ideasonboard.com>
References: <20221124200007.390901-1-hdegoede@redhat.com>
 <e5d8913c-13ba-3b11-94bc-5d1ee1d736b0@ideasonboard.com>
 <Y4Cf5tLWsBDTndei@pendragon.ideasonboard.com>
 <636c471d-d7ee-d184-7a9d-fbfd0545059c@redhat.com>
 <Y4DVXT2TlTYkUHEr@pendragon.ideasonboard.com>
 <27b71261-ac9b-c103-88af-2ca53477317a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <27b71261-ac9b-c103-88af-2ca53477317a@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, Nov 28, 2022 at 05:11:52PM +0100, Hans de Goede wrote:
> On 11/25/22 15:46, Laurent Pinchart wrote:
> 
> <snip>
> 
> >> There seems to be a bunch of GPIO/clk/regulator boilerplate duplicated
> >> in all the sensor drivers. I think a little helper-library  for this might
> >> be in order. E.g. Something like this (in the .h file)
> > 
> > I fully agree that camera sensor helpers would be good to have.
> > 
> >> struct camera_sensor_pwr_helper {
> >> 	// bunch of stuff here, this should be fixed size so that the
> >> 	// sensor drivers can embed it into their driver-data struct
> >> };
> >>
> >> int camera_sensor_pwr_helper_init(struct camera_sensor_pwr_helper *helper,
> >> 				  const char *supply_names, int supply_count,
> >> 				  const char* clk_name.
> >> 				  /* other stuff which I'm probably forgetting right now */);
> > 
> > There are all kind of constraints on the power on/off sequences, I don't
> > think we would be able to model this in a generic way without making it
> > so complicated that it would outweight the benefits.
> 
> I know that for some ICs the power sequence can be quite complicated,
> but I think that for most this order should work fine:
> 
> 0. Force enable/reset GPIOs to disabled / reset-asserted (do this at GPIO request time ?)
> 1. Enable clk(s)
> 2. Enable regulators (using the bulk API, with supply-names passed
> in by the sensor drivers, 
> 3. Set enable/reset GPIOs to enabled / reset de-asserted
> 
> I guess on some models we may need to swap 1 and 2, there could be
> a flag for that.

There are also various delays that may be needed between the different
steps, including between bringing up (and down) the different power
rails.

> Anything more complicated should just be coded out in the driver, but
> I think just supporting this common pattern will already save us
> quite a bit of code duplication.

There was an old attempt to code generic power sequences in DT which
didn't lead anywhere. I'm not quite sure doing so in a camera sensor
helper will have a much better fate. We can of course give it a try, but
as mentioned before, I think effort would be better focussed on first
moving sensor drivers to runtime PM (and runtime PM autosuspend).

> > What I think could help is moving all camera sensor drivers to runtime
> > PM, and having helpers to properly enable runtime PM in probe() in a way
> > that works on both ACPI and DT systems, with or without CONFIG_PM
> > enabled. It's way more complicated than it sounds.
> 
> I agree that we should move to runtime-pm and put the power-sequence
> in the suspend/resume callback. This will be necessary for any sensors
> used on atomisp2 devices, where there are actually ACPI _PS0 and _PS3
> methods and/or ACPI power-resources doing the PM for us.
> 
> Note for some reason the current staging atomisp driver does not use this,
> likely because it was developed for Android boards with broken ACPI
> tables. But after having sampled the ACPI tables of a bunch of atomisp
> windows devices I believe this should work fine for those.
> 
> >> // turn_on_privacy_led should be false when called from probe(), must be true when
> >> // called on stream_on().
> >> int camera_sensor_pwr_helper_on(struct camera_sensor_pwr_helper *helper, bool turn_on_privacy_led);
> >> int camera_sensor_pwr_helper_off(struct camera_sensor_pwr_helper *helper);
> >>
> >> // maybe, or make everything devm managed? :
> >> int camera_sensor_pwr_helper_exit(struct camera_sensor_pwr_helper *helper);
> >>
> >> Just is just a really really quick n dirty design. For one I could use
> >> suggestions for a better name for the thing :)
> >>
> >> I think something like this will be helpfull to reduce a whole bunch
> >> of boilerplate code related to powering on/off the sensor in all
> >> the drivers; and it would give us a central place to drive an
> >> (optional) privacy-led GPIO.
> >>
> >>>>> And likewise (eventually) completely drop the "clken" GPIO this
> >>>>> patch series introduces (with some sensors) and instead always model
> >>>>> this through the clk-framework.
> >>>>>
> >>>>> Hans de Goede (3):
> >>>>>    platform/x86: int3472/discrete: Refactor GPIO to sensor mapping
> >>>>>    platform/x86: int3472/discrete: Get the polarity from the _DSM entry
> >>>>>    platform/x86: int3472/discrete: Add support for sensor-drivers which
> >>>>>      expect clken + pled GPIOs
> >>>>>
> >>>>>   drivers/platform/x86/intel/int3472/common.h   |  2 +-
> >>>>>   drivers/platform/x86/intel/int3472/discrete.c | 92 ++++++++++++++++---
> >>>>>   2 files changed, 78 insertions(+), 16 deletions(-)

-- 
Regards,

Laurent Pinchart
