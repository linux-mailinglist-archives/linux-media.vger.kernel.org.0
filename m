Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45182638CAC
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 15:47:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230101AbiKYOrN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 09:47:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230056AbiKYOrM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 09:47:12 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42573B29;
        Fri, 25 Nov 2022 06:47:11 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 477CB496;
        Fri, 25 Nov 2022 15:47:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669387629;
        bh=GBPRMlL5dnm5+IJfAKIVoeWuuneyHMEKPUkvT5uR5XU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KMt09JpMkb0NAV8p1yfCtQojmAAkEgjiyWSFtfgl2V84SJyFOaeh/2xGG1EZXXxkj
         f4vIitDwMXjMpPbb2kzBWfRCB0LYMK2IfLTzDTkCvuW0gYhlnpBsXruyE5KYJT23xX
         4+gjvGe6h0SqF49u6uZIQ+jn7UBSPTr1x+E8FQXk=
Date:   Fri, 25 Nov 2022 16:46:53 +0200
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
Message-ID: <Y4DVXT2TlTYkUHEr@pendragon.ideasonboard.com>
References: <20221124200007.390901-1-hdegoede@redhat.com>
 <e5d8913c-13ba-3b11-94bc-5d1ee1d736b0@ideasonboard.com>
 <Y4Cf5tLWsBDTndei@pendragon.ideasonboard.com>
 <636c471d-d7ee-d184-7a9d-fbfd0545059c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <636c471d-d7ee-d184-7a9d-fbfd0545059c@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Nov 25, 2022 at 12:15:57PM +0100, Hans de Goede wrote:
> On 11/25/22 11:58, Laurent Pinchart wrote:
> > On Fri, Nov 25, 2022 at 10:17:17AM +0000, Dan Scally wrote:
> >> Morning Hans - thanks for the set
> >>
> >> On 24/11/2022 20:00, Hans de Goede wrote:
> >>> Hi All,
> >>>
> >>> Here is a small set of patches to make the int3472/discrete code
> >>> work with the sensor drivers bundled with the (unfortunately out of tree)
> >>> IPU6 driver.
> >>>
> >>> There are parts of the out of tree IPU6 code, like the sensor drivers,
> >>> which can be moved to the mainline and I do plan to work on this at some
> >>> point and then some of this might need to change. But for now the goal is
> >>> to make the out of tree driver work with standard mainline distro kernels
> >>> through e.g. dkms. Otherwise users need to run a patched kernel just for
> >>> a couple of small differences.
> >>>
> >>> This is basically a rewrite of this patch:
> >>> https://github.com/intel/ipu6-drivers/blob/master/patch/int3472-support-independent-clock-and-LED-gpios-5.17%2B.patch
> >>>
> >>> Wich users who want to use the IPU6 driver so far have had to manually
> >>> apply to their kernels which is quite inconvenient.
> >>>
> >>> This rewrite makes 2 significant changes:
> >>>
> >>> 1. Don't break things on IPU3 platforms
> >>>
> >>> 2. Instead of extending the int3472_sensor_configs[] quirks table for each
> >>> model which needs "clken" and "pled" GPIOs, do this based on matching
> >>> the ACPI HID of the ACPI device describing the sensor.
> >>>
> >>> The need for these GPIOs is a property of the specific sensor driver which
> >>> binds using this same HID, so by using this we avoid having to extend the
> >>> int3472_sensor_configs[] quirks table all the time.
> >>>
> >>> This allows roling back the behavior to at least use a clk-framework
> >>> clk instead of clken GPIO on a per sensor(-driver) basis as we mainline
> >>> the sensor drivers, assuming that the drivers are switched over to the
> >>> clk framework as part of their mainlining.
> >>>
> >>> A bigger question is what to do with the privacy-led GPIO on IPU3
> >>> we so far have turned the LED on/off at the same as te clock,
> >>> but at least on some IPU6 models this won't work, because they only
> >>> have a privacy-led GPIO and no clk_en GPIO (there is no sensor
> >>> clk-control at all on some models).
> >>
> >> Ah how annoying, we hadn't come across any situations for IPU3 with a 
> >> privacy LED but no clock GPIO
> >>
> >>> I think we should maybe move all models, including IPU3 based
> >>> models over to using a normal GPIO for controlling the privacy-led
> >>> to make things consistent.
> >>
> >> I think they probably should be represented as LED devices then, and 
> >> have the media subsytem call some framework to find associated LEDs and 
> >> cycle them at power on time in the sensor drivers. I know there's the 
> >> v4l2_flash structure at the moment, but not sure if a privacy one exists.
> > 
> > The whole point of a privacy LED is to be controlled automatically (and
> > ideally without software intervention, but that's a different story).
> > Can the LED framework be used without having the LED exposed to
> > userspace ?
> 
> AFAIK using the LED framework will automatically expose the LED
> to userspace; and using triggers as I mentioned in my other email
> will also allow the user to unset the trigger or even use a different
> trigger.
> 
> I understand where you are coming from, but I was actually seeing
> this (exposed to userspace) as a feature. Users may want to repurpose
> the LED, maybe make it blink when the camera is on for extra obviousness
> the camera is on. Maybe always have it off because it is too annoying,
> etc...  ?

One use case for turning it off is avoiding reflection in glasses. I
however think this is outweighted by the privacy concerns. If the
privacy LED can be controlled from userspace, at least by default, then
it could as well be dropped completely.

> My vision here is that ideally the LED should be hardwired to go on
> together with some enable pin or power-supply of the sensor.

To make it secure it should be controlled by the hardware, yes.

> But if it is actually just a GPIO, then there is something to be said
> for giving the user full-control. OTOH this would make writing spy-ware
> where the LED never goes on a lot easier...
> 
> Typing this out I'm afraid that I have to agree with you and that
> the spyware argument likely wins over how giving the user more control
> would be nice :(

I also wish we could get both privacy and flexibility :-( I'm not
necessarily opposed to making it controllable by userspace, but that
shouldn't be the default. It could be controlled by a kernel command
line argument for instance. I doubt that would be worth it though.

> Which would bring us back to just making it a GPIO, which would then
> need to be turned on+off by the sensor driver I guess.
> 
> There seems to be a bunch of GPIO/clk/regulator boilerplate duplicated
> in all the sensor drivers. I think a little helper-library  for this might
> be in order. E.g. Something like this (in the .h file)

I fully agree that camera sensor helpers would be good to have.

> struct camera_sensor_pwr_helper {
> 	// bunch of stuff here, this should be fixed size so that the
> 	// sensor drivers can embed it into their driver-data struct
> };
> 
> int camera_sensor_pwr_helper_init(struct camera_sensor_pwr_helper *helper,
> 				  const char *supply_names, int supply_count,
> 				  const char* clk_name.
> 				  /* other stuff which I'm probably forgetting right now */);

There are all kind of constraints on the power on/off sequences, I don't
think we would be able to model this in a generic way without making it
so complicated that it would outweight the benefits.

What I think could help is moving all camera sensor drivers to runtime
PM, and having helpers to properly enable runtime PM in probe() in a way
that works on both ACPI and DT systems, with or without CONFIG_PM
enabled. It's way more complicated than it sounds.

> // turn_on_privacy_led should be false when called from probe(), must be true when
> // called on stream_on().
> int camera_sensor_pwr_helper_on(struct camera_sensor_pwr_helper *helper, bool turn_on_privacy_led);
> int camera_sensor_pwr_helper_off(struct camera_sensor_pwr_helper *helper);
> 
> // maybe, or make everything devm managed? :
> int camera_sensor_pwr_helper_exit(struct camera_sensor_pwr_helper *helper);
> 
> Just is just a really really quick n dirty design. For one I could use
> suggestions for a better name for the thing :)
> 
> I think something like this will be helpfull to reduce a whole bunch
> of boilerplate code related to powering on/off the sensor in all
> the drivers; and it would give us a central place to drive an
> (optional) privacy-led GPIO.
> 
> >>> And likewise (eventually) completely drop the "clken" GPIO this
> >>> patch series introduces (with some sensors) and instead always model
> >>> this through the clk-framework.
> >>>
> >>> Hans de Goede (3):
> >>>    platform/x86: int3472/discrete: Refactor GPIO to sensor mapping
> >>>    platform/x86: int3472/discrete: Get the polarity from the _DSM entry
> >>>    platform/x86: int3472/discrete: Add support for sensor-drivers which
> >>>      expect clken + pled GPIOs
> >>>
> >>>   drivers/platform/x86/intel/int3472/common.h   |  2 +-
> >>>   drivers/platform/x86/intel/int3472/discrete.c | 92 ++++++++++++++++---
> >>>   2 files changed, 78 insertions(+), 16 deletions(-)

-- 
Regards,

Laurent Pinchart
